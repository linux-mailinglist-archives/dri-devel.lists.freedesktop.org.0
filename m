Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E33FC1FF00
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 13:09:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 828DE10E92B;
	Thu, 30 Oct 2025 12:09:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="pJMFHWKX";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="KK19r300";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30F8110E92B
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 12:09:15 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59U6MDN73677616; Thu, 30 Oct 2025 12:08:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=dk201812; bh=PCMmtNOnpVvAOvVgW/ScFHnD+
 hXvCsM5OIw9kABQlC4=; b=pJMFHWKXD5hppKKuK2/g0sSkxQqpv41101u65Agwr
 h6M6UFZSgEe/OHJT8Ula6LpjginxFDaKo2gSoofQE2Z+iPVAWbNLKuo9CX1jt/0M
 5gOTXtgKkuHSSSi5ROyOzqjPi8NYW6pxzKYh0+Q4ahq3Y5aQZAGEBHkqtBafvpav
 A1hXWNxi4wJ2x3FwEoj5+3i5cNCOTqGcDmGTFl7RtNJWJh6MKXaPVgbkNvJaG7gc
 ZuvcznrfpynvWzFjFGb+TVzzr3KE+KchE1KEAoQTf0L8xw3D0+1iFeOLTlnV4QpB
 2yAhBenLZx+8D6Es9USXkNnKZiXNflRZohD0uiKtBDUrA==
Received: from lo3p265cu004.outbound.protection.outlook.com
 (mail-uksouthazon11020123.outbound.protection.outlook.com [52.101.196.123])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4a3wbcgdut-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Thu, 30 Oct 2025 12:08:53 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jxotn6zTUUSCKORroz0/pDBMo3J89ja83wLKKA0cLwk85rN27dNHKbBi5iCxNswXBx5ZIaimjNcUJguwsupfURePfmZUYjs8zI9MkjcADZnyuIsLZEtALCOKUbZBrqLl2aQqxdAgPzBcuuz9y/vVackyte5G+eaftHr4lRStJ+WHP7+zp1LlcP1clhYk8Upi/EyLBDOT9C2hrqDbJpzFz1xXK1puZe1W4bjqc0kgnmIQb9URzColkoYJ0gkzgmWMbpb8h4yAyJwMYpbeE+WEXC1I6FqO5PyAgi0AQ9dcQvobPdKojfClh2tlkkJPWyLsbv3P+yJTgLgnIsYDOl7uFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PCMmtNOnpVvAOvVgW/ScFHnD+hXvCsM5OIw9kABQlC4=;
 b=PwaJ984W6rupV9UUG+M0XxIF6XPc2fpaUiFVrMD/frxvJUwwB7Z9AV29crLEroRh5UX9toYi+wV0Vv5dN/EGkQ2YGiktt5MmolBQeRgNA6csnDi+4idJl0BRADAb4OEgkAwWydzmShx0w7wg+Y8rw4V0SINIEJuaJ+omaf1V+tsQZvfzndE271+Uel1nfJMaIY+GEX6UAx0sKOPmqn5ioZ6pmaKbBqC0yeuAfAxvnOAeio1AkRE0ERKq5ZbGuoxdGU2I/hRm1KsQLUTT56xmw55QIgUWytYS+Sh8uIxceYSZO8njMB+Lh3VqB5IFuxnKkkv/899PCbaJupRTrHDKyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PCMmtNOnpVvAOvVgW/ScFHnD+hXvCsM5OIw9kABQlC4=;
 b=KK19r300tmk0ExRjKdPKiYHnRRhhHE7yhEbZ7sJxAn8zqF1LfdrhBlWCICAHolwKCOWpIq8AlhRJZPSni7PtUw0EYhpBy57fkt2c70/Lyapv3RpHfckuJTaQtu+UJ2/7iX+GE+ByW8FGszRy0iRa2a5gixQ078aoOxfrRzD5jmk=
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e7::8) by
 LO2P265MB3481.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:1a2::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.14; Thu, 30 Oct 2025 12:08:50 +0000
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15]) by CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15%5]) with mapi id 15.20.9275.013; Thu, 30 Oct 2025
 12:08:50 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
CC: Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Frank Binns <Frank.Binns@imgtec.com>, Alessio Belle
 <Alessio.Belle@imgtec.com>, Alexandru Dadu <Alexandru.Dadu@imgtec.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] dt-bindings: gpu: img,powervr-rogue: Drop duplicate
 newline
Thread-Topic: [PATCH] dt-bindings: gpu: img,powervr-rogue: Drop duplicate
 newline
Thread-Index: AQHcSZXzpyoKZvectU2nGv1n0DoISQ==
Date: Thu, 30 Oct 2025 12:08:50 +0000
Message-ID: <50c29b53-64b5-4ad4-a502-286248cbedfd@imgtec.com>
References: <20251029194210.129326-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251029194210.129326-1-marek.vasut+renesas@mailbox.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWXP265MB3397:EE_|LO2P265MB3481:EE_
x-ms-office365-filtering-correlation-id: e51555e8-00d9-4eb1-c3ea-08de17ad1629
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|38070700021|4053099003; 
x-microsoft-antispam-message-info: =?utf-8?B?UTlXVW5jc0xQM0RMak9iQzJUbnZVc2MyUzRLVi85cTBLTjUrV3pRTEdhR2Nm?=
 =?utf-8?B?MUUyYkI0dDlLYmVTSmpsaFRlK2x3bHE2ZmlGbWRRYW5xZnEyWG9pdHdVdWll?=
 =?utf-8?B?ZVhmY3l0bG1JRGFPQlFrTmJRMEtKN0VGZTlZaVR0ZGV4UTJIeTJ6a1did1p0?=
 =?utf-8?B?S0UwYmpzWkNidmhhZHRmUzVFU3FiZGxXTm1LMTVwVjFEUHRTZG5kanhJdmI3?=
 =?utf-8?B?NEhyMm11bFhRUGZRRDRYVlJmeVBpME1GUXJKRE9SVnJ5VEpIbDRYdFJJcTNj?=
 =?utf-8?B?ejdrdk55RnJuNkhzblJBM2oxV1BlejRtK1BXVWpkOFN3RW1lVTlzVkZtVHhT?=
 =?utf-8?B?Um5GSFJjTnU4OXhFZ3BrRmRFdlpEd0pyckZNelZXTlVKZVVkblh2Z2piOHJ4?=
 =?utf-8?B?T0k0aDVkS09YejM5ZXJsUzF3ekR3RGI1RjBVL2NVV3cyYk5DbUFpUkNuYVE5?=
 =?utf-8?B?c3lzYWpnK2pVYlI0ZWZrd3VTMXFPeGVzNi9OOW9MeDl2Q2ptcDYxcEhpSVgv?=
 =?utf-8?B?LzkrRytrWTFXazNjSUxRbWJBaGhJbG1nZmR3OENQcXZxcEM1QjRDRVdFVVhz?=
 =?utf-8?B?MEtPNmVIQU9aL0szUThRV0FHaEl2bXp5Wi92SG1UL3ROKzMwNG14Y1JaSjZ1?=
 =?utf-8?B?WEViT2JpWEZFSjkweFBSTWpieURZOWlBQXJKVUF5RWdCMW1hMnF5c0dzVmlU?=
 =?utf-8?B?Wkh6TDRPRDFvclU0b1hWcmN4cWU5SldOUXVDNEZXQjJkRmhRc0traHVrWFZR?=
 =?utf-8?B?WWVKa1lUZHRacDd1akEvM2JaNldGa0FYdGFXVk50eHlCMEd6cVRkZTRTdjY5?=
 =?utf-8?B?a0s3bkNhNGpnUGNQK1hPTkY3SkZuampQMmwrZXNzU0dtY2Q1NWFnNjc5dVZU?=
 =?utf-8?B?dkx6VUdvRElKT1hGaEZNR2x4MDluR3FqVlNWanB2TUs0SW5pZzVRYWVQbWd0?=
 =?utf-8?B?WWNrRUhYQ2NYR2RJWk5zeHo1ck01TnVGc0dkQ0ZEaVdzZFZXMHhqNjBSSjht?=
 =?utf-8?B?TWQvaTdNMVFVWkJxdzJkM2JzL0hlVnhGVmJmV2x0a0RYWkYyVWM5UmNVRmxp?=
 =?utf-8?B?VW4xZVJtNk8zRG53YWxnNDRqYXNCNFA1SHFhd0lCcEYzdDE4OE44K0IxNUpG?=
 =?utf-8?B?RE95b3gwZVdKT3BPYitMK1U3dE1sUGJpM2pJanNaV0J2RDhvM0ZGSTE2ajFV?=
 =?utf-8?B?dGhKV1BVYUNHWncyeENRODc4Q1ZkOGZiaStDTUFKelE3L1VOUHZQKzhaSEll?=
 =?utf-8?B?c2N0QnVEd0JZNENKWGU2Zkd3VUxlK2xpUEc0S04wdFlZM056ZnJvV1AxM2VS?=
 =?utf-8?B?WUFGbzdTSzcvMmxOQUZzd0MzYjZCOEY2aDl0OE5IcTBzL0daYjNoZlhVSVdo?=
 =?utf-8?B?WThqOGVudUMweTJNK24rNGZnOGZueGNrSnY2S0lhN0hTcEVBQlplQ3JjbXhz?=
 =?utf-8?B?NklQOStZWTExSnhmb3NkdzdFcDNmVldabjVFZHN5a2VzK1FaRldBRVNZMzVk?=
 =?utf-8?B?ZWF4NjhDU0FiR280bk5oZGh2MkI0ZmoxbDBFUHMxZ3cvTHF2V0FTWEpsTmd4?=
 =?utf-8?B?LzY4ZmF4RmlVQzV0V3lndm9YWG15ZHF0Z1BxdFNzNTZYMUt3Z0tzTFpIaGFm?=
 =?utf-8?B?c1A4WXc5Zzcyb2RYd05iV0lkQUFhYTJNZmd1SWNWWk9oQzVUdk1SdThpS3pK?=
 =?utf-8?B?SnJjeUZsSndzekEweXNpcEZlbjBjejNmZlBMRWFwWFNFajc1RHdJUXlyZzBI?=
 =?utf-8?B?RXpBTVk2dFV5czcxeDZvLzBFSjlMc2ZrNkRiMjhWQVNUS3ZPMTkzeGg4U2tU?=
 =?utf-8?B?WTFrV29yRUliNDh1VnBkQ1Y4WXlJSUhQQjRQZzh6RmRKbXA0U29mYmZTMGVu?=
 =?utf-8?B?N0t5SkVka2wwalNyaVp3TGJUYXlZTE9FdEs3a0RrZEtMOEFvM1dzUVpXNzl6?=
 =?utf-8?B?dzFpYjZSTE5PK1BHakM3VGhNYnJwNERWQXZ3a2Njblh2cDRTQTJUTXZWL0hM?=
 =?utf-8?B?MTVWc0JWK0hDYVB6NVY4VjNJaXltUWRTbnNUVWFCZkJHZGxUY0FYTlk2dHcr?=
 =?utf-8?Q?8r43Zt?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700021)(4053099003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R3RtK3FINDdqUXlMOVQ5TVkzNzMwWXBHL3Q3N05vNi9TeU9DRXk4eFdwb3Yv?=
 =?utf-8?B?c1psZ0dBWWY4OGhuenhNcFVOZ0hibEhqWldpL3Q5OVUwM0pYak90ZjJJamcx?=
 =?utf-8?B?Y3ZkY01pV0xiektSYXdBSzUweGEvQlJlMzF1akw2cjBXOW1kZUtESTJ2MVJJ?=
 =?utf-8?B?VThCRXRLTjg0NFc0Qkl2VnMxeHZ3Z3o3MlIvbW5hTjBQZVFEbVNpUmZwWE9X?=
 =?utf-8?B?MnVPbUJsRHRrK2VqOVgwZ0o1M1lYdExTMUpHTU1HbVpabVRueUVmTml0QWtr?=
 =?utf-8?B?cUNkYXRNdXJ0VlBLdXh6QlRZeE1lR1lBYkJkdEo1dXNrdXV4NDJuMC9ORUo4?=
 =?utf-8?B?YkNxQmtTeEduVm4vNURYOFozUXhnYnNFbzYrak9wTEdISENHcWRBWnA5SEw1?=
 =?utf-8?B?VmJCejE5dkRNbFhIMC8zQzREYll2Y0xROG1mL1FVMmpYa2FDRW5sbnR5UWZh?=
 =?utf-8?B?NHYweFcxcTI1TzZEZmlvd1l4T1JYUi92YlU2UFNYMjB6MnhmNXN5dFF1NklI?=
 =?utf-8?B?dDJ0aXoyd3EyZ1gvbUkxYkltU0Jha1BYZzZmMUhBVUJIb2kzaWlaZHk1cTY1?=
 =?utf-8?B?TjF4RExLL1htbitNOXl5TklPeFB1cEhPL0FwVTlxa1RRQ3RoODBQSU1SbmVT?=
 =?utf-8?B?WjQ1WWhIbnZjc3F2c2wzMlU0SzM5RXFpMXdwNFdRTTh4bms4TzVWNnE2QjRN?=
 =?utf-8?B?c3lWYW5vKzVEWHB5WDh1NWZmN1hwdFVjOGN1cjE0ak9NRlJKNmpZK2thcUQy?=
 =?utf-8?B?V2NuVjR3aXRBUnU2WEVRUHIxMUs2QUxDRzNHUXoxbk1kZG5UZFJ5V2VacWl0?=
 =?utf-8?B?Rm5Ec3VzdTZDdTlNQmRaSmdvaTFjV2oxc2dyRS9KV1BLaC9qenVxb1dSdGQ0?=
 =?utf-8?B?YndvcklrRmIwb3Q4dXNQcE5td3Y1MDRTNVAzOHNtc1VFOEJtZ2QxU1Y5OTRG?=
 =?utf-8?B?SG43VHcwRm85cXVIaXBOb0xBTExuYXRJU1dMc1cwUld0aDNIejljZWVnQURp?=
 =?utf-8?B?MUxjQ3BCUklCTW1qbFBmdW92OHNFZHhkVW5OamJwUjI0UmpicUIxM1BpaXgx?=
 =?utf-8?B?M05RSnhYelBCcklObkYxSXk4KzRNeW1oVTcrWmx5b2cwMjl0dEVFcnJSd1Bx?=
 =?utf-8?B?Z0g3MUx2N1pNN3c0a0EwYXhLZmluR2FCM3luRUVScmhSWHRKWG1IclM0QlJj?=
 =?utf-8?B?dHc5YStuRmxEQmhZQ2hnWEV6NXpwcncwcmo4Y3VheXFjbDFtWWlCQkZ3Wm15?=
 =?utf-8?B?RU5qRm8ySjUwdkQyRHl0dFJCVlZ6QjRQVGpPeWJCUTc1YW1mL2g4bmY1c1Q2?=
 =?utf-8?B?VWtPSGVBM1p2bHBoc3NHaVhSZ3VUajFtekNBd2l1U1hxS0ltamxjL1BNem9D?=
 =?utf-8?B?RkxLRWJLSitiWXdXdE1FQnJtelRGZjJ3K21iNHFSNlkyMEVvME1JMWc2RytZ?=
 =?utf-8?B?TUtFTnZBNlM2MGNZdWJ4OU1kbmdFeXlEQW9yejhrVEI3Y013UWNaMHZLMWsr?=
 =?utf-8?B?N2xOd0RnREk1QmhLNlNGV1lhcnVkUzh2bzJGN2hTMkR5K0hOWlZBaWFTZEJJ?=
 =?utf-8?B?REd1NkFhRVg4UHN4MUlqRDIwTDdOSHVWS1N0MEN6N3ZoUkY1d2I0RW1lZFJD?=
 =?utf-8?B?SjZWZFROTjN1T1Zxb2dLam5HTmlEcFFYbVdUVEhuMXI5QUFZNWZvWC9YYm1B?=
 =?utf-8?B?R04ycFN0WEVGZ0FHem10cVdVNERNNUdSOEtia0hUTlM0S3czNHNCbkk1THpP?=
 =?utf-8?B?K1NQOVlnSzFWNGtFOGpSU04rZVdVYlZWeWVUQ1JiM2wyQTRaSE5JM0syeTBB?=
 =?utf-8?B?Ny8zdFphWlplVGowaEpqYVdDMEZUMWVNMmpEUktPVDFDbkZZclVSVFBDVEVF?=
 =?utf-8?B?bmMzRmNmcncvQlQ3RytwZDR2TDg4U01hUW5oVG1LUVU0akNKWFpoTFRJbjJX?=
 =?utf-8?B?QWQzZXRkYlgxcnlkOElQVjRuaEx1OUZnc0FvT0pjamdlS1dRbWhsTFgvWUdq?=
 =?utf-8?B?Uk92bm9XckU3bndJZkdjREZSSXdHUUtpMHVLZjVqVmVrMlM3ZEI2Nk1ydUd0?=
 =?utf-8?B?ZnFLVGFBNWQzMld2L0t2WWpWVkhFMmwreS96UFJDRy82d09zTFViTjQvTU9U?=
 =?utf-8?B?SGRhZzlJOHYwd3YrVnlRS3V5S1Y1WklGdWVqTnhPQmJEc1U5djNzbVNCYUhG?=
 =?utf-8?B?VVE9PQ==?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Fu6ioZpZM00UrIjUNP4EEgiT"
MIME-Version: 1.0
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e51555e8-00d9-4eb1-c3ea-08de17ad1629
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2025 12:08:50.1431 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RO+gn6V4LIWHEsq9dwFsi1HLlwE8xMjoHXNVIYV4C0FPxywo2hor3lblJ0ACWjhnnS4stHYIi0O5zuwTF+Yb0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB3481
X-Proofpoint-GUID: fHoG9JEfbEbCHOzQptwicBnoqDV1aQx5
X-Proofpoint-ORIG-GUID: fHoG9JEfbEbCHOzQptwicBnoqDV1aQx5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDA5OCBTYWx0ZWRfXx2MlA+7t+HoB
 6xfadsP1WUe8mM7pTvkKC9PnAqT//Bf9mjXAYyuwS5silYdkodnAjxepIQpHhSLbNBPFsEvbzC3
 KPvpUydO785kKR318ALnoFdA2uynqYjpkAI6ml/5aaFYaUTLbJGYGkLp5HkbxsNS9qAcW4op7IA
 AGLg2wACHVNXd7l5Z0Av5OFagrNtsLI0pBOc1/YT6NAfrN/+DF9o43L36ueqMIdpsHZqB55oWW4
 9mule+vZW5LSgYXPgQFlVVsu21D1u3GYb/StiutG7hFTO7KGuxjmc6GvkeZ01fwHy0aPumKinSo
 4bNYdlgi1tI2abuflZDx2E4gQMVkfmFP9UptVVvFG6hrLGVY6mKfGh7RjqkXiVLsOj4+Idi/gGN
 9n1VFpftqCXW8C6xX6N53AdRcItZ9g==
X-Authority-Analysis: v=2.4 cv=FbA6BZ+6 c=1 sm=1 tr=0 ts=69035556 cx=c_pps
 a=Q587e1aqQkEIxz2d3WDsqA==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10
 a=NgoYpvdbvlAA:10 a=VkNPw1HP01LnGYTKEx00:22 a=b3CbU_ItAAAA:8 a=r_1tXGB3AAAA:8
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=QyXUC8HyAAAA:8 a=e5mUnYsNAAAA:8
 a=UTWazV6r2Qcd0PZ6oskA:9 a=QEXdDO2ut3YA:10 a=ZiqNQ9w02IBRUKr5_kQA:9
 a=FfaGCDsud1wA:10 a=Rv2g8BkzVjQTVhhssdqe:22 a=t8nPyN_e6usw4ciXM-Pk:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--------------Fu6ioZpZM00UrIjUNP4EEgiT
Content-Type: multipart/mixed; boundary="------------Jc46nkDbn0peU9wX0wvPS0QY";
 protected-headers="v1"
From: Matt Coster <matt.coster@imgtec.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Frank Binns <frank.binns@imgtec.com>,
 Alessio Belle <alessio.belle@imgtec.com>,
 Alexandru Dadu <alexandru.dadu@imgtec.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Message-ID: <50c29b53-64b5-4ad4-a502-286248cbedfd@imgtec.com>
Subject: Re: [PATCH] dt-bindings: gpu: img,powervr-rogue: Drop duplicate
 newline
References: <20251029194210.129326-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251029194210.129326-1-marek.vasut+renesas@mailbox.org>

--------------Jc46nkDbn0peU9wX0wvPS0QY
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Marek,

On 29/10/2025 19:42, Marek Vasut wrote:
> Fix the following DT schema check warning:
>=20
> ./Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml:103:1: [=
warning] too many blank lines (2 > 1) (empty-lines)
>=20
> One newline is enough. No functional change.
>=20
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Good catch! Thanks for sending a fix. Does this also need:

Fixes: 18ff1dc462ef ("dt-bindings: gpu: img,powervr-rogue: Document GX625=
0 GPU in Renesas R-Car M3-W/M3-W+")

Either way:

Reviewed-by: Matt Coster <matt.coster@imgtec.com>

And I'll apply to drm-misc-next (or -fixes with the tag) later today.

Cheers,
Matt

> ---
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Frank Binns <frank.binns@imgtec.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Matt Coster <matt.coster@imgtec.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: devicetree@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.ya=
ml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> index aa8b2069cc24b..a7ca6d3fdf10a 100644
> --- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> +++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> @@ -100,7 +100,6 @@ allOf:
>          clocks:
>            maxItems: 1
> =20
> -
>    - if:
>        properties:
>          compatible:

--=20
Matt Coster
E: matt.coster@imgtec.com

--------------Jc46nkDbn0peU9wX0wvPS0QY--

--------------Fu6ioZpZM00UrIjUNP4EEgiT
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCaQNVUQUDAAAAAAAKCRB5vBnz2d5qsIbK
AP9uZssF5yTf+B5qO0gDi2HpjfsNDnuWMKzvCSZlKPKwpwD+LSNBbGcIH0GFgwjxkasHFMY4V7U2
HfdpuVqmkOKjIgs=
=arvn
-----END PGP SIGNATURE-----

--------------Fu6ioZpZM00UrIjUNP4EEgiT--
