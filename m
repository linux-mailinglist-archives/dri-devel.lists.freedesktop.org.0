Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7AB7BE2385
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 10:48:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B239010E2F6;
	Thu, 16 Oct 2025 08:48:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="iWkQU8rr";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="p1qSs+Kk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B2F110E2EF
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 08:48:54 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59G5fQjJ1004344; Thu, 16 Oct 2025 09:48:43 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=dk201812; bh=X9fJH6S9WCHBgGfjKIJIV7/+l
 ePWckFV8b2xeQ/qXFc=; b=iWkQU8rrjh3E5aNDdIE5JvuvEF/P3m+1dy2PBaaM8
 nA9nUM4XdWrXqIbLlJkJ1OK5kcMwJSrYmJopNvSQe/oOL6v2mFxIAzlrC9TXRU7Q
 qajnoFzm3JF4miJmGYzojqdjioNto2F5qx1FqYmkSffjzyBzGYGqpvr5YJUilSrg
 rHT5gCcaDz+C7NEB8PWzKQzp/DbrXnEw3TjP0HCNQs0S3edeZHnKs5FetYqhbBVb
 /Cm/iwR+gjJlyDtcxFb0yTj5jsKkS5iwNKeHMLsvNRDFvKYHu0Y/RDkFJxP+w1Xm
 HjZjvNAGdouRZavL7JqrZFtU68w1LW+RMyYRqWa/amyfQ==
Received: from lo2p265cu024.outbound.protection.outlook.com
 (mail-uksouthazon11021083.outbound.protection.outlook.com [52.101.95.83])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 49qdgn4q8x-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Thu, 16 Oct 2025 09:48:42 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ylq+rWjEX8ZOYUpOCFfToiw9xDIPAkY0+KRxd+xqCcBRVfSVXuZpG8fIsMMGp3waJgMIk+EOHDy6NBUsU1/JXVaiXslTAKsapu46kmM4mqPg/gCfh7LcW/eeFK42Qs+VAS0dyrLICL975lAnP2dv8iMbnF1bqY2W40L2KdkQfkHuPa7Inook/9mmf9hvJrNwBaMk0TAw600MOfDT85yGPNCXzBjCS8SSyxVCdVRrHKnwqXv/VTo0GO3hXeCbEeH918C9ltF6v4mWQfY8nPML1VGSxBXzYKoMZdKmujaEVlfx4SQ+eMSny/F66j1R5phXkZv7UE3ftliR74oo04xLxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X9fJH6S9WCHBgGfjKIJIV7/+lePWckFV8b2xeQ/qXFc=;
 b=mEzisEsDRHVAUOhF1nLJwl5KLGnsmQ9hssT75a7oc8IRXyDLofBVIFptY80ItLQ8IgH/euYd2n6JVnrhcH092vq6xj86K42Zl/bxfryY8c9L5I/yegSoqf9rRbS9mTvW8WUkX02xG1k4evqWrWRhel5HG/gNGEQ/8t/8asH06MHUzAJ/LZcUAHVZAYIqRopiG5h1yZ/iFeDprP7vWFbEELdi+fnW3wNoICVKToP6tNZ5qsYiLwhr/0mWiLKk8ZolqQVmI5nrtmjLzDBuTsvMUbR+sjRIQ23+qBNUXIGjkeLglVE65BtcGCsQG0S8jLoZycxcs8CQVRh1rntvX4W7Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X9fJH6S9WCHBgGfjKIJIV7/+lePWckFV8b2xeQ/qXFc=;
 b=p1qSs+Kkm3GIXzbozqSwZc4x1hi5kTHhK11QBxIRqMdt/ByTA880HVvkKrUU785ikO+Jx2VzVgJJZNLgS+vuqpTn7t20E9fABUEoVMvexWoqxm06U13tyqMZ5NIQ+3I/w4Qsw3r5S7TU5mjHIEK2ACNUfu4l205unl7SgDklCqc=
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e7::8) by
 LO7P265MB7752.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:40e::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.12; Thu, 16 Oct 2025 08:48:39 +0000
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15]) by CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15%5]) with mapi id 15.20.9228.012; Thu, 16 Oct 2025
 08:48:39 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: Marek Vasut <marek.vasut@mailbox.org>
CC: Conor Dooley <conor.dooley@microchip.com>, Adam Ford <aford173@gmail.com>, 
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, Frank
 Binns <Frank.Binns@imgtec.com>, Alessio Belle <Alessio.Belle@imgtec.com>,
 Alexandru Dadu <Alexandru.Dadu@imgtec.com>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Magnus Damm <magnus.damm@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>, Simona
 Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-renesas-soc@vger.kernel.org"
 <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: gpu: img,powervr-rogue: Document
 GX6250 GPU in Renesas R-Car M3-W/M3-W+
Thread-Topic: [PATCH v2 1/3] dt-bindings: gpu: img,powervr-rogue: Document
 GX6250 GPU in Renesas R-Car M3-W/M3-W+
Thread-Index: AQHcPnmqdKn41davJ0GdMV4WlBIP8Q==
Date: Thu, 16 Oct 2025 08:48:39 +0000
Message-ID: <2392f257-2551-43a0-be7b-2e1f4a0d8c50@imgtec.com>
References: <20251015153952.185249-1-marek.vasut+renesas@mailbox.org>
 <807d4d4d-f1dd-4776-9543-2e8d997071e1@imgtec.com>
 <cf7ebf8a-01e5-44fb-920b-5e21c05e568a@mailbox.org>
In-Reply-To: <cf7ebf8a-01e5-44fb-920b-5e21c05e568a@mailbox.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWXP265MB3397:EE_|LO7P265MB7752:EE_
x-ms-office365-filtering-correlation-id: 8547d520-f4f2-4207-7245-08de0c90cd73
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|38070700021|4053099003; 
x-microsoft-antispam-message-info: =?utf-8?B?SXViVVQ3SjRTMkdPcngweWQxWUFZdEhCekFmd0tYZkdISG84UE5lOURCcnFB?=
 =?utf-8?B?ckZWR09BcjBnaisxRE9BbTQ3WmFGdUozWnhOUFVEcEVocTgxYkNubWhnZU90?=
 =?utf-8?B?SVY2WjhJQmQrOC9kZDIxdFBXQU5KRElFRTlhSGZHRXphOGF6NTVYRXZrZ2RG?=
 =?utf-8?B?ZG1maUJTVWg3ZXdTbzc4c2RIVEhGa1RiMm4yY2FvNWoxZmlsYjNjU0pHTzND?=
 =?utf-8?B?UWpaMnFwbWp0dGRSaDZEazVOWEMwVGhpYkJ1d0U0T2pIdkRiMUVGUDJJRWQ2?=
 =?utf-8?B?NFY4NEhKN29nZEN6NmlxOWViUUdpNHViWm1jaXh3MkVSZmpISlNwRXlCL0hM?=
 =?utf-8?B?am1EQ3QrNUF3emZWUFNjYTZ4SEV6RmZxbGJWakNUcXdlZytPaHpZNDR5Slhp?=
 =?utf-8?B?bmJjZ1JRWGs1bkdYL0thc3VrMUV6ekpicnBMaE94SExqbGl0ZXB4RXdSbmJ4?=
 =?utf-8?B?NHdDMVI1c1lHbXFIRGVoeDQwcjlzVlJwK0Fwd0pDQUxzdjRscW5BaEVxREdx?=
 =?utf-8?B?dSs0NXV6T3JqY0tBS1gxRDBpczlJK0R2VUpFZ0tGZU01M2M2L0ZFQ1U4L1JV?=
 =?utf-8?B?QnEzaUxhWkd0a2hBYXp4Y3d2OG02RStnMzMwa2hyRVdqSzZtN1dGZURUYkFW?=
 =?utf-8?B?SW1VUDZjbzFTRXlVOXQ2UnhNNHJ0dlhZUDhrTHluZTBienRPVEQ4TWI1NHkz?=
 =?utf-8?B?Q1ZPVi9CaHRPVHVJUitKMUt3NVRtM1BBQnA2STVsNlNISlRwRnNPRjRvMmZN?=
 =?utf-8?B?d0xBYkxJV1h4dUtsZThRVjZkMUM2MndHUlkydmZPZ0hXdWNNcXd4SUgyYjhr?=
 =?utf-8?B?d1pFU3p3eFl3aVBNdlNDSlpsdXEzUDZGbklhQTVBNXNRMnVUczl6ajVuZUg5?=
 =?utf-8?B?SE9zb1BoL0I5bStta2dyK3ZWa1BWdVNLV2d4RzgrWUEzdXQxdE1xUzYyZnpI?=
 =?utf-8?B?ZTl1RTVlbVJYQ2dSOGhCUlpuSWFNS0crMk5SWU5jK0xGMkp6clRZbTYvK3Ru?=
 =?utf-8?B?UEJ3Z01Va2FIY2l2Skp2WTNoSk5JNVNXcGxvVFllOVlyaWNTdmJaRzVQNzhj?=
 =?utf-8?B?RFc3Y2ZuMGI4bitVSXF3aWt5ZGV6TUlEUUZONmkxTmxVWXVnMFZTR1dQZEQx?=
 =?utf-8?B?dlZZTlJ3RWM1TkJjMzY5a0o0c1RKcVlUeGJxMmdKR0NTUlNsV1JVdXNKY01y?=
 =?utf-8?B?TlVwM2loNHEzVWVVTGh3dWFCT21tZW44dnJYZjEwNE41RFM3YnZ0ZjZxN3F5?=
 =?utf-8?B?OXZqbHoyYTYrVXZ3Z0ZpbGtGcTFjdXVsU0NUNXlrQ2FMQmpiUmRxM0Y2OFpH?=
 =?utf-8?B?Z1A5VDlhTGRlWWpzaFN2aDZpY0l4RmpQb2ZlTFNXNUk4dXNuK3FWWW5FRnB4?=
 =?utf-8?B?ZmZSdGJ5enRkb2dqODY2ald5WG1oS29NL05DZ1FTS3RwQTBMcVlYQkY1ZE93?=
 =?utf-8?B?a2NtMUFSaDhCdnVCSU0vbk1TNmRFQ1lPS1UzeGZveWt0WFZOL0ZVVU9waHZY?=
 =?utf-8?B?OUtia3dMc3NkZXlibW8rK2tjZk1uT2trWEQ2V3c4SnJ5MGV3YnlvZFlJNUpw?=
 =?utf-8?B?K2FaaDZiYi94VHJ2dit0R1RxNDBkQ1VTSElaejQ2aGlXOFVaeExJNFM0TjNQ?=
 =?utf-8?B?dGZKWVNpZnBVRXRXTWkzdEI3WEdReVd5RlBJY2FyakpWL3YvOFBQYll2Mmw0?=
 =?utf-8?B?ZkhPNUI0N1U1Tm5sNThiUVVqK2FmWTNIWWp6aGhFR213V3ZsUkZyU1dmUHZP?=
 =?utf-8?B?QzVrbGlwWVFrSUppQ0hROHk3azMyeTFMV3V2aXdzWjBGdDhEbXM3bDBuN1lu?=
 =?utf-8?B?aHNwY2QvQXkzSjVYTDVsd0MxSEJvUGl2cW1TY1FnVnkreTg4Ryt6dWwwYkFT?=
 =?utf-8?B?TVNwRUl2MzBYUmtvZFMrU0lKRm9acC91SWZqOFd3Z1lPeCtIVkRGdjZocUcr?=
 =?utf-8?B?N1dXOTNlRlFSZFBXb25zTkRkU2dLNDNjZjdPZ2pudWJzYkd2VVdQbHJNT1pR?=
 =?utf-8?B?RCtET3krUFk5OEYrWTc2V2xya1BMcTc3QytZQ3hJYXdYTHA1YVkxSFBJeEpX?=
 =?utf-8?Q?PQWyVB?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700021)(4053099003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dkZZTzhNRGtoVTBsOXRjczVxQ2FUc2lheXJudzEyK0F2M2FrdlVOL21XU09G?=
 =?utf-8?B?cmtOZzZDUzRPNlpsMStLWForLytGbFQzMTJlNncvZER5OVcrMTYwTWkyQ0hE?=
 =?utf-8?B?bzBCR1dudnF5NFVFY3o0TUVmQ2xjUUNWeHBWdTNwUXlQQk9OcjRub1MweEZv?=
 =?utf-8?B?WTdWY3hCcjdRSHh1WFFFZWpsSmJRU3IzMXJvd1poU1pNOUg3c3lxVG1wSTEz?=
 =?utf-8?B?V1VJWkx0M3JBYzltS1Zray9HZGQzeFN0Z1JZYStkMnh0U253bW1ZdzRlb0wx?=
 =?utf-8?B?TmtFNGovdVBlUjRRdVdZbnI2TER0bzBQQmsrWnZ3ZlRFYjJuQmlIUDE4c2xQ?=
 =?utf-8?B?REZRM1QwT3piOHpmRGcxU2RyTms1UUF1K255UVBMdWlXZjY0WERndis4RkRK?=
 =?utf-8?B?YnBIQ1RCeHBEcVJ6Y0ppWEVIZHhtVzdjUmJSck1yQTZzd1Ywdy82OHRIdUw1?=
 =?utf-8?B?U2xtTHJrWk0wbFBVQUNYdUcxNlF5dlBPU2hEVWN4b3IrcVlkK0gyOWUvTWZh?=
 =?utf-8?B?R1NzdFZESklGYWpmeEg4TUtENW9ZaUp6Zjh4cDl3MEU4Q0FPdEl2Nk5yQXdl?=
 =?utf-8?B?VmphTGoyQ3JDZGZLdFJuaHY4Rm5adGVWSnBJQjZCa2xVMnhlMFVscUZQRzlL?=
 =?utf-8?B?OTlVVk5kWnQ1cDluc2dTYjgycTRJaERpTkhmdTd0MTRPVHQyVmlLQUxWbjVP?=
 =?utf-8?B?dmdIbmdEeW5qVnM5TnkrZjNYblNSc2t5d2pjTUVBRkJoNUxBQ1ozeUdvZmlH?=
 =?utf-8?B?YVRVNnM1Q3hlOUxuYnNZeHlYYmdNZitSZnoyVEZxbXpqM1BjS3FiV2ZPZHFH?=
 =?utf-8?B?c0ovMVlCclJmSFFoVlZBWVA0cnlKTFNNaWlJdHBhQXorWmI3cElwVHgwbDRu?=
 =?utf-8?B?T25rNzVNSDQyTnFOM3JZaS9wTG4wTk9OMEYzQXlUMU15UjFoam1seHZwMG52?=
 =?utf-8?B?ZGRTSHVqVkE3TEl3UHZKalJ4VC9RWXo2dFFPNVl6aTV2M0VxcC90cjUwQldV?=
 =?utf-8?B?QTlDQ0xUdm5uOGQ4aFQ5UnhRb1Bzd1dEVHhLazdqcDVWd21oK2NvOTZvRVpR?=
 =?utf-8?B?bXQ2YWNnZWtoSTJxOEt0N2ZsTTZJYnU3Y1VIdzVwb3k4UFVCeTBlc25hdDlY?=
 =?utf-8?B?WVRTWDBvUWlUa09CcEg4dnYwWEpZWWVnMm92YVFFSmY5NzhFL1NIOCtxTXhw?=
 =?utf-8?B?R3pHQWpTT3RacHhLbzVGdGFvbE80MkNzRktqSE0yRlRRWVFaTXR4RVFUeHNw?=
 =?utf-8?B?bTRaSDFaQkEzZ3ZUNDhWYzFybDdsUlJham5xNVoydE9RQ0NCOHo0aFJLd1Fh?=
 =?utf-8?B?RkpRUXZScTc2VThtK01HUTlNNTN3R21UNzZIb0RxYmNFbU9SRko2WWk4eGFr?=
 =?utf-8?B?bTNGdVNKWGlycG9BOVZBdSs4czBEaVR2V1FPUWg3WURkRnVOK0lhTkMwTWV5?=
 =?utf-8?B?S0dRclZGeEVGT3hzRGNMUC9ZV24rbGc3VE1JYURYSjV1K2NCcUFNYmxkSTlk?=
 =?utf-8?B?UDREaW1ZQjM5elhTT3VLYkRuMmdDWXZjSkJyeGNzOEk3bHZOVkQybzljdmp3?=
 =?utf-8?B?eHlqM2RYeExVUnlENUZtcnFTZDhZNGhVUkkyNVJ3TG01aHFXODl4MGI4SUFE?=
 =?utf-8?B?VTZXK1ZSSU1WUXhmSnphRVBmTThrVnZxQ2l6eVhDdGtuSXpJNk9EbTA0WW85?=
 =?utf-8?B?ck8wMTROZEd2eUlpV01JMWhhU1lGcDVVNGlxbzErQURJNGVPLzJNbXFVMUI4?=
 =?utf-8?B?aHdaOU5sOFhNUDNQc0tNVm9CRXRIUmxKRWFvd2NWbnhkK05SR2NaWWZFQnE3?=
 =?utf-8?B?dFVyVm1ScTRhMUFwMWJmMTZVNGU2QUZ3VVR3K1A1UWRsSytDU2NqSWdBZ1E0?=
 =?utf-8?B?ZHhsVnRaeG9GMU8zNk9ZS3pURlE2MHJIMzVUR3RSNkhYRXE2OStRYXhZKzI4?=
 =?utf-8?B?V292anRRbXlob2NYaTVpaVFOeDJtYlF4N1JqNnZpMVJkUkRKNE5PejJXYUZM?=
 =?utf-8?B?d3VIKzBXdnhxb0UyVTkvUmF4Q2pzTXdQYlFlbVFtSkVOemJ4MUVnODcyeDNm?=
 =?utf-8?B?a0k2SjlpcjE2NGNkaFo0S0sxcFpYRmRaWk9IUFRNZmsvTDczd0s5Tk1FK21w?=
 =?utf-8?B?ZVZab2lOdXRyR1BJWnpsZUE1Q3luYU9TbWNQVEhrajRyRVlpZUVQOW5nNlBp?=
 =?utf-8?B?YkE9PQ==?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------fQYA0ISWVkEJlsr2d4oi63R9"
MIME-Version: 1.0
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8547d520-f4f2-4207-7245-08de0c90cd73
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2025 08:48:39.4162 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oCMCQfzA6wh0sncUOoH6K53Rfio/Dac2nVHzVobYkDCWy9WEdcHpcwklOtGVzCZTTTneuTjFJ4hcUwMtvpumNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO7P265MB7752
X-Proofpoint-ORIG-GUID: 7knDciCIziMy707p4WwdaoEUBJdqxp7G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE2MDA2NyBTYWx0ZWRfX2JDBkVS4a/Ie
 fVgnHfPsD1h0nNoW589AsNij9RbPmNyZCj/GQ4EIFDKQmx2qDfjfT5uHrisQ9JhbITYL6XUfpvU
 arrRTOqR9p0adWHDVe/ORDK4gpto/kU6urnS0Mzaj3TbY31NfIMWIWCoDu7SQ6fpflFrwqQZo2R
 a/AjvZLY8MvHKFvAErAPTnmePEk/Ext7x2rsAskBmNP3dfpuryQHH0+Uqv4d6DV3xDFGIa3zeoJ
 LcxNbs3uDvvcPRxzU6XJ7Iln473qNYIFbN47T42mtFDw9Oy3WkwTwaiOBb6mbb42CWPpO8ozRww
 lI0qVNTXS+478G0ZJpac/WCkDUacJ6BTk2CBNbSrIYEQKovBRlvWf43iMyDkJNvLmOq7CVMYcof
 MiwRCdHFgcPFHOX8csR+Z/06OZQQfQ==
X-Authority-Analysis: v=2.4 cv=H5PWAuYi c=1 sm=1 tr=0 ts=68f0b16b cx=c_pps
 a=KhLWtWQbQ/x1DB0ev6mPaw==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10
 a=NgoYpvdbvlAA:10 a=VkNPw1HP01LnGYTKEx00:22 a=r_1tXGB3AAAA:8
 a=lN1f-_usmRWJRs0BweUA:9 a=QEXdDO2ut3YA:10 a=-oHaDJZ2kUOOos9LyhAA:9
 a=FfaGCDsud1wA:10 a=t8nPyN_e6usw4ciXM-Pk:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: 7knDciCIziMy707p4WwdaoEUBJdqxp7G
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

--------------fQYA0ISWVkEJlsr2d4oi63R9
Content-Type: multipart/mixed; boundary="------------6bqQmrdO0EspBgUBH8ZOZ4bk";
 protected-headers="v1"
From: Matt Coster <matt.coster@imgtec.com>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, Adam Ford
 <aford173@gmail.com>, Conor Dooley <conor+dt@kernel.org>,
 David Airlie <airlied@gmail.com>, Frank Binns <Frank.Binns@imgtec.com>,
 Alessio Belle <Alessio.Belle@imgtec.com>,
 Alexandru Dadu <Alexandru.Dadu@imgtec.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Rob Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org
Message-ID: <2392f257-2551-43a0-be7b-2e1f4a0d8c50@imgtec.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: gpu: img,powervr-rogue: Document
 GX6250 GPU in Renesas R-Car M3-W/M3-W+
References: <20251015153952.185249-1-marek.vasut+renesas@mailbox.org>
 <807d4d4d-f1dd-4776-9543-2e8d997071e1@imgtec.com>
 <cf7ebf8a-01e5-44fb-920b-5e21c05e568a@mailbox.org>
In-Reply-To: <cf7ebf8a-01e5-44fb-920b-5e21c05e568a@mailbox.org>

--------------6bqQmrdO0EspBgUBH8ZOZ4bk
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Marek,

On 15/10/2025 19:38, Marek Vasut wrote:
> On 10/15/25 6:50 PM, Matt Coster wrote:
>=20
> Hello Matt,
>=20
>> Would you mind splitting this conditional block up? We already have a
>> constraint for 2 power-domains (see img,img-bxs-4-64), which should be=

>> applied to the entire img,img-gx6250 compatible.
>=20
> I will add a patch into V3 which splits the allOf section up such,
> that clocks and power-domains limits are limited separately. That will
> make this addition of GX6250 easy.
>=20
>> As for the clocks, for the currently supported GPUs, we have "mem" and=

>> "sys" clocks that are optional at integration time, so those
>> conditionals are based on the vendor compatible strings (ti,... etc).
>> However, these older GPUs always require all three clocks, so it
>> probably makes sense to create the properties:clock{,-name}s:minItems:=
3
>> constraint on the img,img-gx6250 compatible as well, rather than the
>> renesas,r8... ones.
>=20
> OK
>=20
>> You shouldn't need to explicit list the power-domain descriptions at t=
he
>> constraint level at all; if there's a build warning that they're missi=
ng
>> I guess the correct place to add them would be on the top-level
>> power-domains entry, but I don't really think they contribute anything=

>> meaningful.
> The descriptions basically emulate minItems/maxItems: 2 here. I can
> also just set minItems:2 ?

I think that's probably much cleaner! We can add maxItems:2 back in
later if/when we add additional power domains at the top level.

>=20
> I have one more question -- does GX6250 _always_ have two power
> domains, i.e. the constrains always set minItems:2 for
> "img,img-gx6250" "power-domains" property ?

Yes, that's correct. All PowerVR GPUs have the number of power domains
defined in the IP. Even where the SoC does not expose control of these
to the OS, the GPU still communicates with the SoC power controller
directly to gate them on and off during normal operation.

Cheers,
Matt

--=20
Matt Coster
E: matt.coster@imgtec.com

--------------6bqQmrdO0EspBgUBH8ZOZ4bk--

--------------fQYA0ISWVkEJlsr2d4oi63R9
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCaPCxZwUDAAAAAAAKCRB5vBnz2d5qsIna
AQDBSpSYmr56oW4ILagjCNDtj5Kwagnt4Dx4Yut6uTpFgwEA9qbEZkRsI2sXi5TPWuF5k/AFcPED
XgHlWAL5DW4UHQo=
=gLTq
-----END PGP SIGNATURE-----

--------------fQYA0ISWVkEJlsr2d4oi63R9--
