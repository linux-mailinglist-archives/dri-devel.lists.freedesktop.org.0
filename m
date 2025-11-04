Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C573CC3165E
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 15:06:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9047710E601;
	Tue,  4 Nov 2025 14:06:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="amsAhqA9";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="j1U5E0wV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36C5010E5FE
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 14:06:42 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5A46iF783770398; Tue, 4 Nov 2025 14:06:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=dk201812; bh=j5DB7Bhmkt1uyryQH8R9ZEffg
 zvxovFh75J2oAxg58E=; b=amsAhqA9isBvE4ya4WDFt2Nhy3SBL/Ai8MJ9yXp4T
 bJH++pXS3f1CFk6n94eQSPqvPc3ILNPjox4SEIZgmcCpKuD+XeML+X0lnRoKhCTH
 M1jsY05PWWizsPTsRMZcqNvDcZOIQSYnEsXWR0hk2Hrp9DnSXXF7zbgVoYX68u0v
 QNmNvYUEe4LQWj8PBV5Qvqh9V2ANeG8qvIpXBLFNB245/G6qrCf4qPsChMr8sCHb
 fVIpOgpBqkcrcVPKUzerHqbJdAI+I5C8ouv/o2vN9Htz9UhcIzJHWoEjTHoxAYeH
 HDtvjEDV8ZHK9iUqeZj8XcU5ybcNFqlkyI8FCY7Oc2dTw==
Received: from cwxp265cu008.outbound.protection.outlook.com
 (mail-ukwestazon11020120.outbound.protection.outlook.com [52.101.195.120])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 4a59bst1e7-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Tue, 04 Nov 2025 14:06:32 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jivcnp0cFDNQKxD1jaaQwEhIoHdZVzfl3CAcxZn6guCtC8/uRkXPsuINWbiK7RGIJSzLMd+tFmhVpZzaJrUuVJNaTGxTAtORVLw8XDn41+kcYQGIDa8id7lcwZ9akOmJQjsrqaQzWr6Hh9LvGPLm8t61ZobS9PaCN+k8RM3GDiqIdyi76eldtK5jJQoIEQeardRBWEVSES2Qiy9jnAWR7OMbr9eVHyGOIqJjvQL5xaCZwwFJeLQ9AEPX/5ZOBGKlb4l0tpkJ6coJ6Tq23sjETc0IKtm3VcSvmktadC9RVlBYOx6KISpYma2d8cO3mGOAjC41n0nAg7gMZt3XvmpABg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j5DB7Bhmkt1uyryQH8R9ZEffgzvxovFh75J2oAxg58E=;
 b=UzYwKlr3lz9PSaHgf4C9Dt9d17mShJWS+WFuuhJ/4brVM/JWRf/5EtKZPE4AFjynRmal/UUsniCSHyHnrJj+cUVxz+ZIAes4wEh+qQwm+OZLHR4MLNDsjLpmvxkZB+9Weyxoy00rVK3fNCL5nrCm6qPLN52jC+ho+HD31IVK66uDsjRHQgBQXrymPkMwVUYEmj5/Gsm2UVa/Y10Zda+wGkY1+J43H79B86y8KVaAxXB2jlK7flMt+aPrZI8Hq0dA2vNB2pKwJjcRhGULSjUbOXaHzFtPBVLOMxVYmApjIyq+/UtLuc3Ab+OvSP3jQBU83PzEkkFvMPHLIW6sdqn3hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j5DB7Bhmkt1uyryQH8R9ZEffgzvxovFh75J2oAxg58E=;
 b=j1U5E0wVnTcKlrf+veRIANnAdBcZ2ZA6Rm4mc2KzGnUwfL3GP83JLRmMSvFKSLupE5zuRKmvrC/GX+VJVROQme3QxjxInSIhhaMsmXIGE3GlwKjjCeuDVIuRbl7KNztdZ/+vhn6iCfxSzbgrNl7FTtqEtstvkxtF1+FDm+ne2iM=
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e7::8) by
 LO0P265MB7331.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2ec::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.16; Tue, 4 Nov 2025 14:06:30 +0000
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15]) by CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15%5]) with mapi id 15.20.9298.006; Tue, 4 Nov 2025
 14:06:29 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
CC: Geert Uytterhoeven <geert+renesas@glider.be>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, Conor Dooley <conor+dt@kernel.org>, David
 Airlie <airlied@gmail.com>, Frank Binns <Frank.Binns@imgtec.com>, Alessio
 Belle <Alessio.Belle@imgtec.com>,
 Alexandru Dadu <Alexandru.Dadu@imgtec.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Magnus Damm <magnus.damm@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, =?utf-8?B?TmlrbGFzIFPDtmRlcmx1bmQ=?=
 <niklas.soderlund@ragnatech.se>,
 Rob Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-renesas-soc@vger.kernel.org"
 <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v2 2/3] dt-bindings: gpu: img,powervr-rogue: Document
 GE7800 GPU in Renesas R-Car M3-N
Thread-Topic: [PATCH v2 2/3] dt-bindings: gpu: img,powervr-rogue: Document
 GE7800 GPU in Renesas R-Car M3-N
Thread-Index: AQHcTZQ3ZNF+Xh5YRUWkYMT9ARVKIQ==
Date: Tue, 4 Nov 2025 14:06:29 +0000
Message-ID: <5e2ea623-1e41-4cf3-a81e-2ab7d288c013@imgtec.com>
References: <20251104135716.12497-1-marek.vasut+renesas@mailbox.org>
 <20251104135716.12497-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251104135716.12497-2-marek.vasut+renesas@mailbox.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWXP265MB3397:EE_|LO0P265MB7331:EE_
x-ms-office365-filtering-correlation-id: 2cb4f9a4-43d3-46a6-d473-08de1bab5a25
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|4053099003|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?OVd0bThlVFB6cEJCeEkyeld2d2NyU0RVelBBS2V3Ky9uZDI4TUMwczhyQ3lp?=
 =?utf-8?B?aWFUVDVyZGFva0FWaXZzdlIrSEo2ZkFSVldQZGo5SDNWQ3RtVCs0azZzZDVQ?=
 =?utf-8?B?VFdxSHppWjdVY3BVaTZTS1hVNHVJQk5Md0NTNC94Q2dQRTNWZ0puaXVRSnhF?=
 =?utf-8?B?YnowQU84MVdzdWlxeGgxT01JU2padnE0UWhCMExnaFNJNm0vQURFa1RER2tS?=
 =?utf-8?B?WG5CRmVHcmlqdEN4aS9NNllUNHdGdjJ2UkMybU5yeTRHUHAvdVNBRnFaWTIz?=
 =?utf-8?B?Tzd6UEhxRjZtUXNsZ2w2ZEF3UXFGSHY3Rm91bjIyNXBaQ1FJbkNLbVhtZ2do?=
 =?utf-8?B?Ni9zVHFZR0R5cHJzdjhJK20rL05ZL0pKOXRtNE50R2gyS3RoMlpzZjI3QUls?=
 =?utf-8?B?ZGRaOGNETmpybkNwL21yRUFrUnhseDJERUFOdVNHWkY2SHV5dmNBRytQalpR?=
 =?utf-8?B?bDZOOWh4bGxJQ0NXYTN6YlRFa3p0K09Fblk4Y1VPWER3M0x5b3NIY21wT1lS?=
 =?utf-8?B?citwMlBXVjFaQUlSNk1iWGJtY1VVZm9pSktjR0ZnVzl2N0JFcWFqMjZtd1c2?=
 =?utf-8?B?Z0FlaHBPaFEraVB5VHJOZ1FqOU1YVm4rOE53Mmp3OEpNcDd6VEg1N05jVUc3?=
 =?utf-8?B?RHBOUDdjODhUOUpGSUJPSllSakovUW5XMGswNVE1TnB3eVFodTNMYkRkR01E?=
 =?utf-8?B?bytGN3Z2Z3dqL3NTRUNOODFjR1ZJVnRmK0EvdWhOQlFNd0dYeWNFUEd4RSsv?=
 =?utf-8?B?WHNkWVkzNDdzN2NvRGhvWitxVHl4YnV3QTFRbG1KQWlWNFo3OEVVd3pGZWFQ?=
 =?utf-8?B?TktGckovLzE3cWpDSWdOMHpvZSt2OFkrc3p3NlM0S01Ed1ZMNXNJSjJRcG9x?=
 =?utf-8?B?dVA4SlVJY21DTktNV0x4Si9BTCsvb1JiMGdoYTB0MGRyRVN0aU16V21KK01S?=
 =?utf-8?B?bFJTWW5zcXNpOHB1bVpkY0lnR04wREZHZmVFc3dPUDVvTmRFYlFXSk5IeENQ?=
 =?utf-8?B?SXBjVnZId3RWT0RNaFB2cUxaWUE0c2FGU3k5ekxnd21WVzNvVE1oWUlNRXJh?=
 =?utf-8?B?NExXc0lMWW5vcCtBMDlxUHZRUnl6OTVOcGt2ZktVRmdnV3VxUnA5Z3FyVlFr?=
 =?utf-8?B?bGtieWlhVXZBL0FqQVRWdVhZcDBYMkZPYmZBSVVNYy9ESGZDRkVRd2VSLy9n?=
 =?utf-8?B?eFN0eFJrUEhGaFRJN2Z4Ujd6WlROUU5RN0VQRHU4VFJEWm9HUElRYy85a0Vz?=
 =?utf-8?B?Y3BTYWxlMEowSDB2eC9lcXZmRUpreGVITjhVbjZSeFZIQTBFeEhERHJ0a3JM?=
 =?utf-8?B?bnNqcmh2TzhCSC81TVh6Zm9ySGVQT25RSWhYQnVkeHo1Z090UVQ1SC9ETDRC?=
 =?utf-8?B?N2lKTFdiN1ZhUnkzdjNBSk5GUkRHZ0JTVnhQeEM0QmVvYWJCQWlEUUxjQ3ly?=
 =?utf-8?B?QXpRTW9nN09wdXRLUFVNZGd1Y0tRUDAybHRFOXVRaVc3K3V3cHlSRElUT0hO?=
 =?utf-8?B?eXdIWnpyN0xiTXRSZjQvUHhrSWJGdnJFUytjYUN0VVFHWTBWRThqYVBsZjMv?=
 =?utf-8?B?UGJ2ckkxYVNmbVJGQmxPYjVvb1JYWStxb3Z4NDhsOEFzY1h4TEZVTER6a0J6?=
 =?utf-8?B?L2lubUlXTFlhSWt2c0JPdjd5a1VxczdNQ3JEVzROeXVxeHlpUXRiUjNmYllP?=
 =?utf-8?B?dDFZd2NBTDMxSDUwL2lnV2VPaTMwVVkrUzRzZ0lSNnZoQnM4OElONlV2RXhw?=
 =?utf-8?B?cWMrd0VHY0p2TmpNdmZmZkNlYlExelZMSThXb2FqVTEzdFd3VEF0cTdIZEJR?=
 =?utf-8?B?ck1mcVFUMHdZN3piMS96amdXZVd5RmE1UkZGa2xnOTZEd2hkdUI2b3BnVmsr?=
 =?utf-8?B?U0IxeVpFSGZRY2lvVDB5QnBkZTduNFdkUFBCL3FhZVBlL1UyeUNYelkzK3Ev?=
 =?utf-8?B?T3lyVldYeG9iakVIYnJNOXdBK290eFhiQzlpaVZnS2FBbTJFRUY2S0ZXL281?=
 =?utf-8?B?ajJkbUQ0WlpCdnlwQ2w5ZTI1ODUrWENZQllEeXl6TG1ISlNwNDRaY2JaRE42?=
 =?utf-8?Q?Mu8zdy?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(4053099003)(38070700021);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UmJDT3IyOFloMEpuWGdzSFRDQ2VvRit1dEc5TjRsU3dHZk85NDg4L1htSkdl?=
 =?utf-8?B?NTI0bllrcytDbVpvSUhhTk96OXRnZTB4U055aSt5VkZwSmhqVi8vdzhVc2cx?=
 =?utf-8?B?S0YwR091TlQ4eElJdlcrc2Z2TW9TYjZWOW5uRXhIZ3ZOVFBGc1QrUjFLQTA3?=
 =?utf-8?B?VjV2dWpWSkliL0xOTjZ6bnJFbnBnZUVjTVpheU16UFhic05pakFjS0JHeVVx?=
 =?utf-8?B?SVN5ZGpYWHFHcU02dUlIc1JUY0FINk1EckxiWUI4VmxqeEhETm5TeVgzYVdo?=
 =?utf-8?B?NnpVR2hDWGcwdXh2VWJNcXQ4aDRKNWlFTjZVZE1ZLzJ2U2l2Z1JaZ1RUcHZS?=
 =?utf-8?B?R1hLK0FuV0w4d3doM3g0S1dUejZZY1hYOGZYWVh3NG03L3poZmgrM3JxRW9W?=
 =?utf-8?B?YnZ1VVZxQTBEcTE1UlF2YmpoVzN4R0ZhZlRNQUM2aUhHVFlmMUFLbmdWLzgx?=
 =?utf-8?B?YVRKdWwveWdtbnpKU3MyM3IrTU1NUXM2RDluejhuSVM0dVFmbE9aWDg5eEJ1?=
 =?utf-8?B?c2E2WE5EbTJJWWZPWlhOQ3NNWk5sM0tsN0llN2VmNWFoTnpoMUk2a29UbjBy?=
 =?utf-8?B?VCtYOWQ5aUg0bUNKL2QxL1RTSFExMFU1YnRXcDB6YWtSYmUyelFkOGN0ZjBU?=
 =?utf-8?B?b2JJSjRBNlJUdVdJRDJ3a25RRGZBcjNML1Z3ZThsVDhoZVBELzhsaThQWlN5?=
 =?utf-8?B?YTNWQ3FoczlrVXdZcDlmaEZIMmdROXBocXNjRW0xZzZDV25oUTU1SFdlM0Zp?=
 =?utf-8?B?YXNFTUR6QUJIUEY5aFdzSDlmSzFmclpFSDBVcWFWdXk4YnJpd3RzNHVqaHhq?=
 =?utf-8?B?eGdmMGlnSFJXalh1NjBxWlFoOVVlWWNUWUFBSXp5aHdsRW1YVThiRHpNN05a?=
 =?utf-8?B?Z3dKYmRBNzFtOXI1cmR4WXdIbHpQVkxmZ1RXZ3JtS0VTQVRTVmxhY3EweEtT?=
 =?utf-8?B?dmhhY296L085QksxempPbWZ5OTlMLzJyNXRYcURVYy9tNFpNUXZ0SUxkUHBV?=
 =?utf-8?B?dTYzZ09VNENyQXVmTHVwUHJyUXR0NVZZU1Vpc0hrK2lucmFCUlpzZFB2RW9F?=
 =?utf-8?B?RUtzVkQ0dFlNTFZLQjVhVHNUdE42UmhXQkhMbC9GK1NPM0dNQzlkeUZpRHJ4?=
 =?utf-8?B?VHgreTNjQm5GTXJYWXc0Um8yeEVuY3FwN1lMT2dJN3I4N2N4UklmVStCQkdj?=
 =?utf-8?B?TEpBY3dtNEdmT1h5NVJCdjN1RWwxK0JLN2JNUDhZY1lwZWQvUFZMRXhRMk1y?=
 =?utf-8?B?a05abTBxZFFhbnhxN1lYeHlVOHVFUjlDMzlaRDdOWGxPRGE5NXkvckdqMG5u?=
 =?utf-8?B?RzUxeUMxaDdzOHY4bFlmT3Rsd1FnZnNnQVpWaDZTV01sYUZxaXR3WFpTQTVS?=
 =?utf-8?B?MGRCaEVCWkVCb3V0Y3dJUitHSDQ0MDVKeENuUE1Qa0JtdFljZGNRa3YrTHRS?=
 =?utf-8?B?NVp4WWpsWlplV3pTcXJBRTcyVDBjYjV3M1pjMEk1czVMcXR5RHlXQzJrbHNL?=
 =?utf-8?B?R2JlRWRBdE54REdWOVA3dno1NytFU2dldTJ0MExmV1JEc1lHbCtWbTEwcjVV?=
 =?utf-8?B?YjUybXFiNzF2UWNwN2ZaZDZOZ3prS0ZKdmpNY2tKWHZWTU9MVEZYVUJlckJK?=
 =?utf-8?B?c1Z5SllmTHFpTXQ3VkRiQnlxTlk5L1YrS2hDYWVRVllLeXVNMC9xaWtmVHRK?=
 =?utf-8?B?bE9kUEpTZDJnR1VBV0xTUjBYbjhFQTFBbzNabkFhelRjdXNaV2M2c0dFaDBr?=
 =?utf-8?B?c1VBdjA3ZFJjMjV2Yjc4bDM4bUJiYjlrZmJhTG1LTDhQaDRpYW5kUnlMQzhh?=
 =?utf-8?B?dzhqUExVYVI4WlNXQUpNZ2lnMDJTcXdpQ2tvbEZqTm9LcE43SmFpZng3MXM4?=
 =?utf-8?B?MWZibkFidzBpZW96R1FNV1l6RkphNzFjanV1STFQOTh5OHFBb0E2VGZVZkha?=
 =?utf-8?B?STU3djR4YklkdUpVdFordUFEeldxUS9FOEt1UVpudWl2aEt0K1NTWkFiN2gw?=
 =?utf-8?B?M2JaQ2o2bmNZM0xzSVlOb0FzazFoRTlzTlRaYjRxdGRDSjhRT1hQUzlsTXNW?=
 =?utf-8?B?UXdRc0lRZTFjUVFacnJsYlg5Z2t4Rm9aYWxaWjZOeTlVRGpTUEZqdTZhWWIy?=
 =?utf-8?B?SlA3bXlJcjE4UmR4UTJpQ2RoSnlaNHd0NGFBVFBwTnpVMzBXTU41ZW4vOFhE?=
 =?utf-8?B?aUE9PQ==?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------siqH1oX5StarndnG7fgI0GZd"
MIME-Version: 1.0
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cb4f9a4-43d3-46a6-d473-08de1bab5a25
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2025 14:06:29.8847 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eic1Af7BFiYQGIIF4ivhGZ3ke+kG9mFnpyyFaoGqcZe8M8ik5mS6mKHrDHG2IwwFQGUPhANK3swmAtl08iNBjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB7331
X-Proofpoint-GUID: dETcO6-KU0-tQQ0r9PGDDLa0zJwYShjo
X-Proofpoint-ORIG-GUID: dETcO6-KU0-tQQ0r9PGDDLa0zJwYShjo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA0MDExNyBTYWx0ZWRfX6vgyR58bilAt
 9GGvPO76GSbDwkdCSZRMy4ikpQWYZE6tUkHlWh3lpm8oAV/xE2teBg1CCf1Xo3uxtwWWSus7TML
 sKXvh8/gSQ/cwEQKbxyrVgQ+fLgs8ADqsdBg+n9Elihq+XWKFAs1rsmxgdDSr1nz5vvv6CWsX/t
 /QWWt5nhQcReBVTvZZr+89OLn1v4ZDQNDr7OVhrEv7zrDXnARfbksVkQmpyhnOvrVKJgMvGrn+s
 z4EpRgS8TSoljt8tPofeLMcfrAo1DaNfyHim5YjmM3fmmmmAg0n1fX8Opc64VAEU3+43ZD50Z9d
 t8rT9xhLv8VrIshqwwTbUPb+kT7STSZLw8iGf7TqUsy/mqwBj4kn+8CkPXr27eiyXxjkzsrshBQ
 ok3y5tBcbjyUGKK1TFe0c+i91zC2zg==
X-Authority-Analysis: v=2.4 cv=Yb2wJgRf c=1 sm=1 tr=0 ts=690a0869 cx=c_pps
 a=r6flpba3aIlT3cEwwQ+y1Q==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10
 a=NgoYpvdbvlAA:10 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=b3CbU_ItAAAA:8
 a=r_1tXGB3AAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=QyXUC8HyAAAA:8
 a=e5mUnYsNAAAA:8 a=AXnwN0U5XS7-B01MjRMA:9 a=QEXdDO2ut3YA:10
 a=kJ6yMDceUGthwlzkMZMA:9 a=FfaGCDsud1wA:10 a=cvBusfyB2V15izCimMoJ:22
 a=Rv2g8BkzVjQTVhhssdqe:22 a=t8nPyN_e6usw4ciXM-Pk:22 a=Vxmtnl_E_bksehYqCbjh:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
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

--------------siqH1oX5StarndnG7fgI0GZd
Content-Type: multipart/mixed; boundary="------------G7d7ObAH4pMgBJlg2oGHEiKX";
 protected-headers="v1"
From: Matt Coster <matt.coster@imgtec.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Frank Binns <frank.binns@imgtec.com>,
 Alessio Belle <alessio.belle@imgtec.com>,
 Alexandru Dadu <alexandru.dadu@imgtec.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Rob Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Message-ID: <5e2ea623-1e41-4cf3-a81e-2ab7d288c013@imgtec.com>
Subject: Re: [PATCH v2 2/3] dt-bindings: gpu: img,powervr-rogue: Document
 GE7800 GPU in Renesas R-Car M3-N
References: <20251104135716.12497-1-marek.vasut+renesas@mailbox.org>
 <20251104135716.12497-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251104135716.12497-2-marek.vasut+renesas@mailbox.org>

--------------G7d7ObAH4pMgBJlg2oGHEiKX
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 04/11/2025 13:56, Marek Vasut wrote:
> Document Imagination Technologies PowerVR Rogue GE7800 BNVC 15.5.1.64
> present in Renesas R-Car R8A77965 M3-N SoC.
>=20
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Matt Coster <matt.coster@imgtec.com>

I'll take this and P1 via drm-misc-next later today.

Cheers,
Matt

> ---
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Frank Binns <frank.binns@imgtec.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Magnus Damm <magnus.damm@gmail.com>
> Cc: Matt Coster <matt.coster@imgtec.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: "Niklas S=C3=B6derlund" <niklas.soderlund@ragnatech.se>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: devicetree@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
> V2: Add RB from Geert and Krzysztof
> ---
>  .../devicetree/bindings/gpu/img,powervr-rogue.yaml          | 6 ++++++=

>  1 file changed, 6 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.ya=
ml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> index 550da008629c..225a6e1b7fcd 100644
> --- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> +++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> @@ -19,6 +19,10 @@ properties:
>                - renesas,r8a77961-gpu
>            - const: img,img-gx6250
>            - const: img,img-rogue
> +      - items:
> +          - const: renesas,r8a77965-gpu
> +          - const: img,img-ge7800
> +          - const: img,img-rogue
>        - items:
>            - enum:
>                - ti,am62-gpu
> @@ -105,6 +109,7 @@ allOf:
>          compatible:
>            contains:
>              enum:
> +              - img,img-ge7800
>                - img,img-gx6250
>                - thead,th1520-gpu
>      then:
> @@ -135,6 +140,7 @@ allOf:
>            contains:
>              enum:
>                - img,img-bxs-4-64
> +              - img,img-ge7800
>                - img,img-gx6250
>      then:
>        properties:

--=20
Matt Coster
E: matt.coster@imgtec.com

--------------G7d7ObAH4pMgBJlg2oGHEiKX--

--------------siqH1oX5StarndnG7fgI0GZd
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCaQoIZQUDAAAAAAAKCRB5vBnz2d5qsKgC
AQC9zYDRNAS4Bkx+K04FqKvVtZSStDIIVz6fJCAQhKsseQD/YajDw2ljqykoGw8nJ2Xqo/QHpCYI
sIb26q303wpnaA4=
=mS9o
-----END PGP SIGNATURE-----

--------------siqH1oX5StarndnG7fgI0GZd--
