Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D74CABD920A
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 13:53:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0495A10E21D;
	Tue, 14 Oct 2025 11:53:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="Kcetsquq";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="jJJwj4Pu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD79F10E21D
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 11:53:06 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59EBXI9n772096; Tue, 14 Oct 2025 12:52:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=dk201812; bh=1FYD9TJX8Z1Q+MtMH5FONfFMH
 LAVyMb2b+I2XjQL//M=; b=KcetsquqUGz9S1UMPSkvZ9alKw1PXDf+nBuhunwKq
 Tn8XZDRSw3C8vCd/0vwR4ruyUMsC3Uhduq10T7H4eORHiqr66JKsqf4f1uRPUnfJ
 qvfH2TyUwuj9nQ5BX6BlMSTKAePi2NBwp8YUg4WYc2VjevA8Wd9M3XCyoZUn7Pft
 c/xXJLsrXCycMWBs5q6ImQ9RwYbA24b+I621OpEzVnFIJ7bYsFlnSs/jBHIk/7dC
 hipSrPmbeNioqyMVBJaUDbmwnApaS9/AoMoK7zg524JlABHIh2cFOl3e8o+dX+9N
 zFNGcvsDX+4VvgQd3OafPrjUG62OtoAALyJplti5BzGgw==
Received: from lo0p265cu003.outbound.protection.outlook.com
 (mail-uksouthazon11022135.outbound.protection.outlook.com [52.101.96.135])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 49qdgn2xxt-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Tue, 14 Oct 2025 12:52:47 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VN922gYQZYs081N6oerrNzElFp5QitXKtKbXd9rdn95ZFE1ilEtPkB0E9MQ+23mTDTos/antUnklguSeDr1jj2Bl6jO/12BKVpkpDEB9E7RGt47hHipo8TknWgcGqlGAaGsa9FQcQZpvOfyP88xqyXb4uiUXPJLl+6ZkOOGzchU6glMt7cgas8zD4ThnA3fs4PwP2uJDZmA8dEu4PyHyETYCgd/3drhKjvP3NjBc+wfDgD42zsMJeax8nX7ZE0c025frwUL6/xN0qtV2CVMnGNGHcG1MiF7ZAnQbLpAsfzd6m7BIUuQ7vZJ1Dyoa2QRbtZcYBJ8/hUderOO6ecd4bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1FYD9TJX8Z1Q+MtMH5FONfFMHLAVyMb2b+I2XjQL//M=;
 b=b+tbtpZkiqfY4iHdpRcyzbiE4iEfH7NIXR6aDDTOisfSoemB+ET7AwYA+SMbI+Kh2cuwb0NrJj6jKcAa0OhcnWpFFtZpMQgZAXgeO7cOhmNrPU3UJKnpY+Ouef+Bgop7BAf+AMYSQ2/jU1HO3gPFYo3C+oPv7z66x2TGLwGRNRmEnGxiLL9LCtg8/Z/AB+uXqH/SCdepHjGuwLBMkP/UB0xE4CYm4g+iSEg925l9AK7J4/kvzSu6le53EkMS6k0eu2T/7RGjQmeggHyDdVv+py3TdyR637LofMhRejC3ijgEr7JIDXqhevfpGKCThW45yLkb3j9hn50N/UOFC0h6Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1FYD9TJX8Z1Q+MtMH5FONfFMHLAVyMb2b+I2XjQL//M=;
 b=jJJwj4Pub++wG10e+hQPcF0oIUxOK2kKpnXWXM1eC/ZDIxUNpR6M/zi1A0+Mk7p0EUGL3PZ+QWObQdO6hA14caJgHVoVT7sR0BIbw/AtGu0gWZdumZyOKD+8WB+4E5LImMf49RkQdBLYUZTLaghtQzp7NMs+eJXxsgK+PgtEojA=
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e7::8) by
 LO2P265MB3181.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:161::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.13; Tue, 14 Oct 2025 11:52:44 +0000
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15]) by CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15%5]) with mapi id 15.20.9228.009; Tue, 14 Oct 2025
 11:52:44 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
CC: Adam Ford <aford173@gmail.com>, Conor Dooley <conor+dt@kernel.org>, David
 Airlie <airlied@gmail.com>, Frank Binns <Frank.Binns@imgtec.com>, Alessio
 Belle <Alessio.Belle@imgtec.com>,
 Alexandru Dadu <Alexandru.Dadu@imgtec.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Magnus Damm
 <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>, Rob Herring
 <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann
 <tzimmermann@suse.de>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-renesas-soc@vger.kernel.org"
 <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: gpu: img, powervr-rogue: Document GX6250
 GPU in Renesas R-Car M3-W/M3-W+
Thread-Topic: [PATCH 1/3] dt-bindings: gpu: img, powervr-rogue: Document GX6250
 GPU in Renesas R-Car M3-W/M3-W+
Thread-Index: AQHcPQENT1bnv+s+fUK+70NXdhSVzA==
Date: Tue, 14 Oct 2025 11:52:44 +0000
Message-ID: <c65950f5-010a-4d5d-88d9-60697eeddb46@imgtec.com>
References: <20251013190210.142436-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251013190210.142436-1-marek.vasut+renesas@mailbox.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWXP265MB3397:EE_|LO2P265MB3181:EE_
x-ms-office365-filtering-correlation-id: 5a8abae1-e419-4df4-aaa7-08de0b183005
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|38070700021|4053099003; 
x-microsoft-antispam-message-info: =?utf-8?B?cm8rWnp1bzZMajZ4dCs0TERaaVZHV3ZBbEhDenRTZ09hUUpFa1FtZFlKQ0Vx?=
 =?utf-8?B?bEdqWDRKNGs4MHVkdnBKdGpYcDE2TlYvaVdFa0duSHp3bWRsV1laUkQ2Tk1D?=
 =?utf-8?B?Q1hJeG9uNHEraUM0QVZtakRuOHBRVnlRYWwxMW8yOWQrZDFWTWxrRFRTeGt3?=
 =?utf-8?B?VUIwSGhJWHI5bXZSSzk5NUdKT0NZNjErSjQ4bnhLa1lBMWVUY3RuTkUrODh1?=
 =?utf-8?B?bU1sUTR2LzhjNXNXUVpSSmdpUmd6VDRYM1g0Ti9pRzhGbWdWd3h5bzBaRDBn?=
 =?utf-8?B?djloWWkxT2FYUEZGUkJ0SXFKU0NKYUJPc0JRUm14a1ZJTXRGMHpzNDZLWDVu?=
 =?utf-8?B?ZU1LdHVlcHpTeVJqSmpsR2dsVE9QRGhtd0dJTGl4cDFVYlFiaUkyV1lUcUt6?=
 =?utf-8?B?WFlidEE4YlFUYW1ZVndYYVd4NjBMbk1DK1RkOGNwekpHa3BiQ3ZYaDdtNUQr?=
 =?utf-8?B?d0ZEVWFZVE9yR2VRVlN1RlNNZysvVFhnZ3JncUhzeE5aaENnRFlQUHlXQWZw?=
 =?utf-8?B?dktSMlM3SWRtVXpSZ2V6Qm4rNmwySkw2RlRXS2xzOG1wTU0xaXN6OWZMUWJY?=
 =?utf-8?B?V0NxNWQyMjJVNVFYNFZHd283WWhQY2lsMGc2YWIzUUpLMEVZaGRsTUtTNTBN?=
 =?utf-8?B?cElQbzM3d1dUSmtGR0ZBczBSd2NubWRVa2JUZmNHNlBRbE4vaVZaM0s3a3du?=
 =?utf-8?B?Y1RMNFNucEx6UzlYZVBPZmxpUGVVMkttNmJZdVFYa0N0ellKandCNk15UUVp?=
 =?utf-8?B?dW15UFE0NlBYK2xGVldETFdlVjE1aWhBcVYxcVdCTkdVYURoSWh3S3cvMVF5?=
 =?utf-8?B?Y0h2dG9pTTZMRU9ZWFJ2RnV6cldpOC8vMFY5MXJtVHBiZTJEbU9ITFBNN2J0?=
 =?utf-8?B?UHBmSTRKVEwveDU2Q25oSlZyTnB4a0FlTjFuWXY2R20xVGpPU2pvMHdzeTBt?=
 =?utf-8?B?c2F4VE1pSmgxU0FnR3Zuek41NEoybjIybEVlbkx3SGZPUEF2NXBudXdFcllj?=
 =?utf-8?B?K1hCYlFYdVlTeG5XVld2TktMMSs2elVMdW1SNXlSRStjOEN4QmlvNGdvMGU4?=
 =?utf-8?B?QWFEaWxHSDBnZWRmU2lJUUpBTEpmVmVML29nWUdXamk1Q0psaDJpalNzaVVn?=
 =?utf-8?B?OWd5Vmt2VUdVM05NekFJbGl5b2F6RHZTNGdnRGM1SldWVTRrdGRvSXFkeU0x?=
 =?utf-8?B?dmhmNURqekxHVFgzYzRrWStVN0JBZ0wxb2lEZFhZMEk5WVlFUW9OblNsRGtL?=
 =?utf-8?B?OUM5TUVwMjdYa2FMZGlrbGExNHhmZHRpcEhkcmY3ZU5pTktlMUJJKzl2bUgx?=
 =?utf-8?B?LzI0cFgyY2hHa25jdWlLVGVhWjRzNXFVekdPdUNlTEtST09NSHFNMUhhc0Z2?=
 =?utf-8?B?UVlTT2t1amxTMkkzdmdVLzV2VzhRZXhnUHVSSDNxdG8xNk4rMlE4Vmsxby9h?=
 =?utf-8?B?em5oZHEzcTBGQmdHRDNJTjg0aGJOUzhBalRaWEJLY09GV3VwcUhiQlBudjdm?=
 =?utf-8?B?cmpuYkV0WWF0K1R3VUpaWUxITVVlV2VIbkV6NUpiVTRQcjZTNW9wdWFha3gv?=
 =?utf-8?B?MTVSdCtabVVkL3A4RnRGQm1kdWE1U2ZhVUhNTG9IWDFGN3hQaXZHTHM1dHRO?=
 =?utf-8?B?cjBUd1lGMVVLMGoyNUhJakxlQ3ZVU2JxNW9TczhZTGxaV2p6c2FkTW13bTc4?=
 =?utf-8?B?VDVpVUxqN3BQanRsdXkzVHJEZVJVN3JjUzlBZ3ludUErWVBtcDhFc2EvWXd2?=
 =?utf-8?B?WHp6WlVBbStrWmZPSk1pMDlMd0tsTjhxVVVpdGYrN3dIR3JuVFc3NFNUMVNn?=
 =?utf-8?B?ZWlLN0Fhdk9nQ2pnTGkrZHFBMUJBNUtOQ0FqckdibCtzVDliV205MFhJWnVC?=
 =?utf-8?B?ZzZjU0tSUzVEdndNalZ1RDc2RkIrMitxbmRsZnVWYzZrbXpUTkdGaWs3Lyto?=
 =?utf-8?B?WFY2eld5ZUYvLy9WaXl3RnpJQyt1NTVXdlpUR3grc3IrWGR0MUxUTm9BbEE4?=
 =?utf-8?B?M1dQN3l1WmZRPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700021)(4053099003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UDdzYm84ajNNaGlxaHFzU29pbnBrV0dOakRjc2VkL0NydTNsNW5CZHRsVHF4?=
 =?utf-8?B?NWVPZnpsdlQxYTNsMFZPSklHY25YZ3RwRktjOWdEWjd2eE9jU2pnRG9DTjV2?=
 =?utf-8?B?bU1QSExocnNxOTlvbElCcnN2b0ZpOWZxTVFhblE4ZUNPUVVraHhLdC9BNjRE?=
 =?utf-8?B?Q3IyNWpIVG1ObEdYMXh6UDVPZmNpWXY4VzdLYzh6UjlyMG5UOUlTRFRQdW1I?=
 =?utf-8?B?RDl2elUyTHRjMjJwY3NkbDNMZHJlam9xUDBYYldnZEdWTTFLckhlZ01FeWRi?=
 =?utf-8?B?SERqYnlRUU90YWplbllOMXlVU2U1QmdOaldHUEVSZlBOS2d3MlMzUU9UOG52?=
 =?utf-8?B?TG9FMzFLNjBUM0I4WjZjWWJYRXZnQUJUdUlCNk5ISUczWmt3S2JQbFhvcHBT?=
 =?utf-8?B?c3kvYTNjcWRCZ2l5VzZGSkJTNDlrN2NKV2xPd0dnUHdpSkRGdncxTm1Za05i?=
 =?utf-8?B?alk5aS9ZZGhFSHkvVjVVM0VmMUYvd0FXRlNpMTF4ZWxYamN1bmdadU1odmFy?=
 =?utf-8?B?ZENZODJHWmVCOVhxcmVIZ2Q4RFlyYWhhanB1MGNSN2VGWlNiWFlKUWVVRHdH?=
 =?utf-8?B?ZGJoYXFLMWpmMFRMb0p6aEJwckhoTFhvVXdYT2plRkpwNWhGc2RsOHY2Mk05?=
 =?utf-8?B?RmFINDhpSVo4akhGT3o5ZGx4YnpFNW5FU3dwRHJNVHllc0lGNVBPQ0NoS2dP?=
 =?utf-8?B?Wnl3VkZwNFZTOXRFbG9UZThnUFRtbEoxcU1NRmN2VlVYZnFJNmlDakxGbE9H?=
 =?utf-8?B?cFNWcjBxMkhObEFiZ3FGQUxnMU5XWXV0SmdWU3VKRVVtSU9LODhBM2xkN3JI?=
 =?utf-8?B?RUl6NDc5QzlnNExSYzVqQ1VFZnVwYjhHazN4WHlOVm1RbU5lcXdtbldRbFdp?=
 =?utf-8?B?T0dkcHZKZlNmck5sUVhSNkxZclJhbjBVbEdseW8rN2ZZRlBqUDN3N2pReTRl?=
 =?utf-8?B?MUlQR2VoakdwS1hXZTBKcy9lSFJJTlBhS0JaZUN6WnhjLzNGcDdMWnlLVmph?=
 =?utf-8?B?RmloMnBhb3JGMFIyYnR2YmN5VGx6V2lGZnFrZW1RSEs3aVpUNTM0R01JRW9J?=
 =?utf-8?B?WHVPSTYvNzJRL3FMMmhxYjk1eE9RWEdObUNnWlRyMnlDTjdHbE5Qa0QwKzJw?=
 =?utf-8?B?U1I2S3l2MURsaGdiVVIvWjF6WWtTRURDL2J6Vm5neXhLdTJSbDF2ZjUwNW83?=
 =?utf-8?B?R0RLalRrWS8xd3B0K1pqdGp2MG80b3ZMT1BHSkl5MktXMW00RVVIT0NmbTQz?=
 =?utf-8?B?RHUxZkVDUTdiZTdHQm9MTEtEZHViNndMREJ5MGNDbW1WZXZBWkRGNHNFMUo5?=
 =?utf-8?B?Vmd3MGtQNGJNNStnYWJXd2svYWFpY3JYVVFZaHZsRUxjZWVIYXNoNFVISGVj?=
 =?utf-8?B?T3hVakhXQTZRVG45U0xnUUdJTWQvYmxwU3lyNGFvWTZLenVyWnQ0K3E0RGgy?=
 =?utf-8?B?NjZWeE1zWWMveERzb3NRL3M5VHhEZHJLVVc0T1RKNUllamwvVzh6R3I0UUlH?=
 =?utf-8?B?eURONnNkL20wdFRkRG1VZ0tLMVdycGF1N1VyWXlHRGhMSGpzNEpqUjM4WUcx?=
 =?utf-8?B?N3IwNkRNM0EyQ015ZUNZY1BTbENJaXg0OExYTFVEMllkdllmazVsNVMvUnEw?=
 =?utf-8?B?ZjJibThQM3ZRQm5iejYvL3pnVk9EWGJJYmh0STBueWxidHpuUkRGenNkVUxG?=
 =?utf-8?B?SnpRSFkrRnpQTythSWoyejRrVUJhb0pUaG9qUXJ1SlRkK1pOMXFQN2FaZ0xu?=
 =?utf-8?B?YXd5ZURhdkNsUzJGMU1xekQ3bGtMZGhhbzdwY3lUYWJuRERERk5YUTlJVkhO?=
 =?utf-8?B?S0xReVhHZHU4T2MxN01YWmFHZFhsVDZOcE9UWE0zR1gxbHN2Q1VibE5RRGZV?=
 =?utf-8?B?NGhEakRJNWJJT0dURnNWTWpKT3l3OUlwdk9NY05xQVpSclpBOU5SSW1uMm0w?=
 =?utf-8?B?ZDdvK0poNnJnZWJJNkhpQ2FlL1NZNlZVT3JSU2RTTEFKeXdmdWs0MnA3NG5M?=
 =?utf-8?B?NmFSMFN3L3VrVjB2dk4rNE41UkVQMXRmMExJYW5UZEpBZ1lmVC9YYk93dTBD?=
 =?utf-8?B?cnF4R3lETlFyL1drVThSVmFwZ0V3Mk5KUW1RaUhIb1FESU9laEdJdlI5eUJq?=
 =?utf-8?B?N2FZNjBqNm9EQkNZTUZpcVl2bmhudUZ4b2huWExKL0dMRHZSSjRSOHBFaEFu?=
 =?utf-8?B?Rmc9PQ==?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------5rFe2qUFCF0pM3etUtp570qC"
MIME-Version: 1.0
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a8abae1-e419-4df4-aaa7-08de0b183005
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2025 11:52:44.5489 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TP6quh20DbD/pBu/EgYSeY+2miM42F6xawun7nUQoyoYX92loEKqZLgms1TutuWqPl3hz1sQex+axPIzh8JEuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB3181
X-Proofpoint-ORIG-GUID: UdkfqR4DoFKTVUtR3RntyvXrFvddLKXK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE0MDA5MyBTYWx0ZWRfX70Pz9Yy7yBhD
 bb0D4dfkYWiyF2Wf7nhbqLwKUrhOy6qZAvYzQHyGS7APy/6vRvkhlcvSsMB4/Nh1Got71hsabFY
 J3GV6wFNMiexYbqpodJkk8e6Ch/W++5m8jY0D2q+zI2JJ5tCsED8ak7YTW02BTfXUPKwueLPfsP
 ke3a1VJmX6F29IHkvOe/MzbJb3bhoFTq8YHJiO9eEkGKGDa1BBhrxP0oX1Ipv5WPR34lFrMd7KR
 Lza/Z/dOW7bJA0F7dld3qXpJXcUVhh6mh5rn//4ZVVIGOhlCvWYC36ddz0oGZ+ongy7x33fA4BD
 WHh+UWjxA9bnnis1ytvytj245yhMU/cMi4RtNaqhImEQrod8trZk4Kp+C6Cpitt/UGmk18THqsN
 +7A9QBAciJlcyG41EjeqsADJqhFC8g==
X-Authority-Analysis: v=2.4 cv=H5PWAuYi c=1 sm=1 tr=0 ts=68ee3990 cx=c_pps
 a=k4ePgCnnPLE9mwwHtv8Ouw==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10
 a=NgoYpvdbvlAA:10 a=VkNPw1HP01LnGYTKEx00:22 a=e5mUnYsNAAAA:8 a=b3CbU_ItAAAA:8
 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8 a=r_1tXGB3AAAA:8 a=yC-0_ovQAAAA:8
 a=QyXUC8HyAAAA:8 a=jbl3gYaBqxiQRWybW14A:9 a=QEXdDO2ut3YA:10
 a=m1v-tBNLdolHCSty5DcA:9 a=FfaGCDsud1wA:10 a=Vxmtnl_E_bksehYqCbjh:22
 a=Rv2g8BkzVjQTVhhssdqe:22 a=t8nPyN_e6usw4ciXM-Pk:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: UdkfqR4DoFKTVUtR3RntyvXrFvddLKXK
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

--------------5rFe2qUFCF0pM3etUtp570qC
Content-Type: multipart/mixed; boundary="------------6rtDB2wNy0caBsrxCddQMIAB";
 protected-headers="v1"
From: Matt Coster <matt.coster@imgtec.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: Adam Ford <aford173@gmail.com>, Conor Dooley <conor+dt@kernel.org>,
 David Airlie <airlied@gmail.com>, Frank Binns <frank.binns@imgtec.com>,
 Alessio Belle <alessio.belle@imgtec.com>,
 Alexandru Dadu <alexandru.dadu@imgtec.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Rob Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org
Message-ID: <c65950f5-010a-4d5d-88d9-60697eeddb46@imgtec.com>
Subject: Re: [PATCH 1/3] dt-bindings: gpu: img,powervr-rogue: Document GX6250
 GPU in Renesas R-Car M3-W/M3-W+
References: <20251013190210.142436-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251013190210.142436-1-marek.vasut+renesas@mailbox.org>

--------------6rtDB2wNy0caBsrxCddQMIAB
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 13/10/2025 20:01, Marek Vasut wrote:
> Document Imagination Technologies PowerVR Rogue GX6250 BNVC 4.45.2.58
> present in Renesas R-Car R8A77960 M3-W and R8A77961 M3-W+ SoC.
>=20
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> Cc: Adam Ford <aford173@gmail.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Frank Binns <frank.binns@imgtec.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Magnus Damm <magnus.damm@gmail.com>
> Cc: Matt Coster <matt.coster@imgtec.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: devicetree@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
> See https://gitlab.freedesktop.org/imagination/linux-firmware/-/issues/=
13
> for related userspace bits.
> ---
>  .../devicetree/bindings/gpu/img,powervr-rogue.yaml          | 6 ++++++=

>  1 file changed, 6 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.ya=
ml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> index c87d7bece0ecd..c9680a2560114 100644
> --- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> +++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> @@ -13,6 +13,12 @@ maintainers:
>  properties:
>    compatible:
>      oneOf:
> +      - items:
> +          - enum:
> +              - renesas,r8a77960-gpu
> +              - renesas,r8a77961-gpu

I think this can just be renesas,r8a7796-gpu; most of the devices in the
dts for these SoCs appear to use the same pattern and the GPU is the
same in both.

> +          - const: img,img-gx6250
> +          - const: img,img-rogue
>        - items:
>            - enum:
>                - ti,am62-gpu

You also need to add img,img-gx6250 to the appropriate conditional
blocks below here for the number of power domains (in this case, 2) and
clocks (that's more complicated).

These older GPUs always require three clocks (core, mem and sys), but
it's not immediately clear from the Renesas TRM how these are hooked up.
I can see three "clocks" connected (fig 23.2 in my copy, clock details
from fig 8.1b):

 - Clock ZG=CF=86: Appears to be a core clock for the GPU (3DGE). That wo=
uld
   make it our "core" clock.
 - Clock S2D1=CF=86: Appears to be a core clock used on the AXI bus, maki=
ng
   it our "sys" clock.
 - MSTP ST112: Appears to be a whole module on/off control of some
   description, and definitely doesn't align with the missing "mem"
   clock.

Do you have any further insights as to how Renesas have wired things up?

Cheers,
Matt

--=20
Matt Coster
E: matt.coster@imgtec.com

--------------6rtDB2wNy0caBsrxCddQMIAB--

--------------5rFe2qUFCF0pM3etUtp570qC
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCaO45jAUDAAAAAAAKCRB5vBnz2d5qsC4q
APwJTf4+jtwxhaTTxCQB+Qk/dG8hDRuW57kEv60kyD1YwgEA0Ro6f5cxQTm6d9MyafBV1Ej3qsLv
rQocsc8+v4rJ7wA=
=hlfE
-----END PGP SIGNATURE-----

--------------5rFe2qUFCF0pM3etUtp570qC--
