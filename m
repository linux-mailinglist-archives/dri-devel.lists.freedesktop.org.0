Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 434BCBF20B9
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 17:15:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6206B10E478;
	Mon, 20 Oct 2025 15:15:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="ePRxH4uf";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="mAuisRQk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C44C010E46A
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 15:15:28 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59KAWYEt3097381; Mon, 20 Oct 2025 16:15:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=dk201812; bh=uFnBpQwEtBoVEAdURxCX98t6Z
 fXCkSNConaa3j1piLQ=; b=ePRxH4ufmAGRUru3cYB48uPu2bew3qvZZfdKBWMkI
 4Ax+PNZHUI7YfY1zWRaZbX/tC6MIded9i3+IOxCT/Lnqk4+DtD8auiuCKqmqi8bN
 M7NxwWgqGIaXEVDJAMDVbim3fG8XqtM9jgFUTBlpl2sxUL0MiwpjVmEwkWPDx5GB
 oQk4oixLck5M8onRMeGY81C5gdcY/LP/vaOcAalgwkkBccHrRtyfgBlTzto4iwpM
 YGDqUaV7NC8U1uOOAUhOk4VL3qKAXHjJqYPNE06rsKL/6ahzjdFSRG6SD3QqkXE5
 fHGQS/TmHbTa9+Eb/+bwVXZ6rFDRvzibIztotBiGc6uHg==
Received: from cwxp265cu008.outbound.protection.outlook.com
 (mail-ukwestazon11020086.outbound.protection.outlook.com [52.101.195.86])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 49v2ythwna-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Mon, 20 Oct 2025 16:15:16 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cHjex0Fa6Lrfm7ZRwnZESj/3Tuc+q5hclS+YsYFJqmbjhKVyWuG9liGkY3X4xqSqVGJmicpi5bya5RW/bCSeFS+pXLN47D3SQWoCvWxaKOmDGxqOvLRJlk2TesMIRlzjL9OSzYwEDFI+1nGqHfWu51ec/LAK8u+2JLvq4Vibd71kV0dOq1lU6lYMN5P9I+yz+u8TbkVgUfUS7CxXtMAHX2ImZN+cClWdjzaXgI7oAOXBZZ0iE6GWkLS4yttZy225u5HZGKUn0ViUfCekfO/Q+PnQMr7FY7h0/CXjAla/VEA+J4GDHNKJRIVJ0PKei1bHd08y/D5MnY+2Ms80PAqPLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uFnBpQwEtBoVEAdURxCX98t6ZfXCkSNConaa3j1piLQ=;
 b=LeU2h2lO2Ah8YxpI/mJ5NoEF/a45wq0MHnKY2QaGL8KpbfMiAvnHgVplHSEtny/RMKVLb2KU7Eb38AYqpNjBpFcSFDuhmv79KtrNoLlcPKSjV/9WhnPi1pYJYSMeVZ9tus1s0PTzHCDTxhqFn7I0dtmKmu8ey1JBCq0OLWCfVi5b0hia2xk/CM5EsHhlULtP6HYtegzTgEOvYPupF1XzykE0Tq2cSe/6NpVhf+QHVbGJ8WJruTewWCDccIfxO3o36hllaQFBo/KYKssklUp4n3yFcGmvRi9OOIRB6Ug9bMjr5xfzdSu0+lQgB/uvDF5pMHoM1sxGwTqTKQlSyym4sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uFnBpQwEtBoVEAdURxCX98t6ZfXCkSNConaa3j1piLQ=;
 b=mAuisRQk4TKNLVmFtMF+P8iQ/qbi6NdC0dRLxsXlaGhuOm5W9NVtHzfXMnMmjzr0vtUWdpYRuKV9/Y9nvZ0wthmXSm30UnqVnHOWYWRaupckmGbAcXJ1hf4ynkuc5XfhEV2uKKLtt+iK5nVSqaNnREucfU6Gf7d25yzw4YvUp+c=
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e7::8) by
 LO2P265MB5824.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:268::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.17; Mon, 20 Oct 2025 15:15:14 +0000
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15]) by CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15%5]) with mapi id 15.20.9228.016; Mon, 20 Oct 2025
 15:15:14 +0000
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
Subject: Re: [PATCH 1/2] dt-bindings: gpu: img,powervr-rogue: Drop useless
 power domains items
Thread-Topic: [PATCH 1/2] dt-bindings: gpu: img,powervr-rogue: Drop useless
 power domains items
Thread-Index: AQHcQdRW0xfVZFOxOEKSzHUZzcuGkg==
Date: Mon, 20 Oct 2025 15:15:14 +0000
Message-ID: <855fdfad-1df7-43de-8a86-a938cc56a202@imgtec.com>
References: <20251018130147.12831-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251018130147.12831-1-marek.vasut+renesas@mailbox.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWXP265MB3397:EE_|LO2P265MB5824:EE_
x-ms-office365-filtering-correlation-id: 8396b776-978a-4312-e17b-08de0feb7899
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|38070700021|4053099003; 
x-microsoft-antispam-message-info: =?utf-8?B?MXpUQWZ2MExtQkNUcXVtbVhyYmdBOVRRSGJOZC9JckUrNmlpbGw5M2VQM3Zk?=
 =?utf-8?B?ajZwSnhTRlpic01DYnQ5TzhxOEFGZlZCcGNvQmpScG1IWXoydlJzbGk3OUFS?=
 =?utf-8?B?WHNIZnl5K3F0YlVWa3RkeUtjd2hUNlpNQ3FPbVBLUFR2UlV1S0JnU3d3MzE1?=
 =?utf-8?B?Mno4NEZSd0ZxbDVwajgzdmI2TzJqczh6NlZSVXozSy93SFFqOVZldlJKaEVM?=
 =?utf-8?B?bUN4SjhpcjEwL1FiZkI4VlRhNEhpamVDMzUzT0FCcCtGK0E2NlF6eFlEOEwy?=
 =?utf-8?B?MkdISTRFRFI1bUpnMnU1REdPOVQ4OXQ2V3k3UFFsVWFGcGx0NklBSXhXMDhI?=
 =?utf-8?B?VFozMzNJT0J5ZnNkZTJ1TE1vZ3Nmelc2Skh0NVhlaUljSEtRdGVTdzFNMVRH?=
 =?utf-8?B?cHFTT3FGZzJaTnFMZ012ZVo5SWhKYVpmZGRLeHZRQzNDRThKWC80TFpnRmJU?=
 =?utf-8?B?ZE1venB6N3FPa1NmL2N4SjkvQVlTUHZsRTludm5DTlg2Tzg4bDVDT3ljaGdM?=
 =?utf-8?B?MXdWRTVyR3JjczJ4VWNnOG9xM1dEdVU4Q0Y2aGJoNVQ3V2pLejZqR2YwTVov?=
 =?utf-8?B?ZW9La1NZZDVpQWl6cC8zbDA1OEJYeDBJSTVzbzgxVi9YaHlpQUlCRkUrMDVo?=
 =?utf-8?B?WlB3L2dmSkFJcVg5Q1VLRWNqSVdrcDgrWVR1bU1TRGNQMWJteEZJSExIV2RQ?=
 =?utf-8?B?Ym9QRGpuVDR1WEk3cHE4aHd2TmM0Uk5FUFRMYTRiRmJyN1RRS2tCSjdzeG5y?=
 =?utf-8?B?a3lPZ1pKd1pyd3BlSmVIMzdFNHFUVVJYRlhEK2hQVFE4WjBTb3hGS1oxdDRL?=
 =?utf-8?B?QVlaRkU2eUFwKzFOQlI1VFpaTVpmeDNKT3ZkS3orZFFzQlpwL3pWbTJjNllw?=
 =?utf-8?B?OGpNVnVRYWlOUTVjTlZ3bEQ3WG9xeDZjTTZ3WWI4ZmdxbHhBK0MvT0NzcWhj?=
 =?utf-8?B?NzNWc20xSjhFdG5BcHM4dlVQMHNlbCtpSzNXc0dVZDJqd3FiblVlaXlHSEZ6?=
 =?utf-8?B?S2REQzFHclk0WTJwYnhSZVNDUXdDK2NyS1AwazVTSmJ5cWpmKzE1Skl6RDdY?=
 =?utf-8?B?L2xhSllIRWQxeXAxZDBUdXRIeTJybzBmZ1l2VVpESlBWTVFzSTZzOFdzSWsy?=
 =?utf-8?B?Z1RsK0puR0s4NkpPL2hzajcyZEpkODEzVU42Mk1Eb1VvT1hFNU8zUksyK0Rh?=
 =?utf-8?B?UEJjZFFVNDk5eGMzM2tVQVFSVzJtZ0g4aUI1aUoyMlkzL21qWXplYkZCMlM5?=
 =?utf-8?B?dDBtYlI0MkhYd282YWF4c0V3dExobkR1dStjUmNFWUd0TnNxQitNZDVaOWRD?=
 =?utf-8?B?UThLZTFLTTNVcnR0VDk2TS9DMWRuZm4wVUlQK29xVWxucWx3blpRV1RLUjlp?=
 =?utf-8?B?U2ZMc0V3Mm9aY2JNOXJ4d0tyMjA0aXJ2cWIzcWtyMUV0WjlxSVlPWWZQMzJD?=
 =?utf-8?B?eG5xU3RpNHJDTkhLQ3B5dEllTTJtSHljRndIMTZKbzJMT2JYNXZwNnBTbk9E?=
 =?utf-8?B?OEhDT3EvM2pxZFJaRjJNRkxqTjhxeGZRbk5qUDZRQU1wbStPK01WTnNnUyth?=
 =?utf-8?B?bU5rbU5YamtaUnp5QWJheUxsWXMrcVN5b0M4czZoN2tWZXorREMvclBvTFZm?=
 =?utf-8?B?dldtTXR0MmR0NTg1Q0ptTWtuOVVHSklqaVh1TTNiL0FFaGxtTXQ2OWVCNXVU?=
 =?utf-8?B?VG5SU0x6U3ExYm0zYllkM3VRUHJEVjZQZ2trSERsZzVlSCtGNU1kZ0JYTDAv?=
 =?utf-8?B?TndVcm5IZzVOTG1sb2VnOS9UYUhIbE5NVlZod3BNdnNqN3RFcjV3NkM3Y2t6?=
 =?utf-8?B?aXhadTNlMHBxeDJ2VEIrTDlpUUo5eDkzUVcyMmFNTG9kWElDbTlwaGRCcit6?=
 =?utf-8?B?ZTBsOUk5ZEQ3WVAvYlRmTExONy9ZS1htVDJIQk9TZUxSN3o1MVpDRUIyQk1M?=
 =?utf-8?B?b0JURWVDME1sS0tQa3pBZEVpdGxJMHZzbm5qL242eHRzbTM1UU1zbGtVd1pu?=
 =?utf-8?B?WHEyRnphTzE5WkFSUWNlcXdJVSs4VG1qOHlqM1VTYWJuSEI5c0w1aWpjNjM2?=
 =?utf-8?Q?2yxRSc?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700021)(4053099003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V2IyWW1jK3BUT1pReWJuS25lMUN1UC82VmtmemRoQ1hGeURSRnBHamFCU0Q4?=
 =?utf-8?B?N0R5ZFJOcTJiNFlNYkxjVEVSTlg4TEQ4YkdUT1dhek5UMGZzWlVhYWJPMDlD?=
 =?utf-8?B?TXhQTDIrSHlURU5ZSC9UOW13WUp2U3JEemdMK1RkMFY2Q2laVVJGYmRhdndG?=
 =?utf-8?B?SWdEREs5c1F3QnBSVTZ1WGFhUEdGdDRibzJoeTVQMjZLajE1MnBYTDlCaXUr?=
 =?utf-8?B?bGlsTkIvZStuRHVXajhPNkNlaU94anUrNTVFYk5BdXFMWGtuRGdoUkVwcDZU?=
 =?utf-8?B?aFo5bDNDWEZOdTU5K0wrQk5pTUVoS3BpSTlZZ0lKcjVlaE5FYXZYQWRwK1o5?=
 =?utf-8?B?OE1TYjZPNW84RjdqZTY5cmNJaFlIMU9yZmtQVVVjYU1vTjlFK1pYRUNJbzQ5?=
 =?utf-8?B?WVFmRVlKWTFJUzRUTjVYOWtURmNBMkl6VVpKV0JnVHRzL2ljU05RQlhEZFR6?=
 =?utf-8?B?UHFaS01ua2dXU093RTIrcjZJZStVbjRQNkpkWDE5VGVaais4WE4yaUplWTAw?=
 =?utf-8?B?dHJxWDkxR1R2Ni9VMUR5SjB6SFIrckNLRm03ak1CTVBnTFlzYWF1NzVsRXVB?=
 =?utf-8?B?QnFXL3Z5Qm1NWVF5djlRYVpHUjNtNzBTZ3lzdWVlS0VDMlJEUC81bVM1alMw?=
 =?utf-8?B?Ykk3blZaU2tWRXl0MG1La1JXalRQcHVZZTJTZUI2eFBFRG1ndzR5M0FKMDRL?=
 =?utf-8?B?YXBFVFh5K29nUFdlMnllL2NZcnY4L3owMTFqdkwybTkvaGt1c2NYcElYRjFn?=
 =?utf-8?B?ZVlXc29DTGFOeXFrRTJlT2tFWEwzeGNDb3c0SlpaYlR0Vm1aV0dNTDl5N21x?=
 =?utf-8?B?MGRYdExnSXhJM1RNaHVsRCtpUjNBaS9ZWjhwYldxaGcxZnNFZzdUWTFZdUhM?=
 =?utf-8?B?VFo0TWkvdkR5K2lleXB0b3psTnc2YlkzTlZEN1lBRUFHMnJaSmFKWTZJQ2RC?=
 =?utf-8?B?UVcrSzF6N01vZGVCTWd6aWlFcHB5WEs3UjkvTVMyU1U4REpwTVdid1pSTHk0?=
 =?utf-8?B?WFpjTEYzVndVV2U4RXhwQWp5VklJc2dEbHpOYVVNdFlsWFFLOTVBNFMrTmM4?=
 =?utf-8?B?cTg3VmZGajhNbW5NUDRQc2FoTjN3SVQ4cFhCZUVJV2xvejd3d0JyeU9wMWFC?=
 =?utf-8?B?aWpsalVNRyswUnZyT1FUMlFyc01hNkJURXpCeTVhU0Y0N05IL1JIamhDcmpm?=
 =?utf-8?B?Tmd4a3lhNkN5STBQaXI0bWF4azFnT1VHUUFEOWl6bXJGa2NmWjBpM0p2VGc5?=
 =?utf-8?B?R0E1OVkrdy9SZU1iTmtrSDVGZGY4a1krWFVqRTVOS3JBdEhHMm5BaGtVeTBt?=
 =?utf-8?B?VTFyUkdJTndISzRBNXF1UDNWak13MmdFUHpWczdWSVpmdWFvM2gwOWEyNjJm?=
 =?utf-8?B?dGpGaUJJTWpIaW9YOVNwd3RGNitKalJSTDFRcktIcit6L0FjUmJLSjJYdzFV?=
 =?utf-8?B?b2pKYVdXUFFETjMwVk9jZlhFNkpWTkEveVc2QVVNVVBYY3RobzkwUEFtaXZX?=
 =?utf-8?B?U3BlS3pDQzlHdmgzVVl3dDZUckJrTFFPMTF3ME9hZlA4aWZTc204ZVNqVmMx?=
 =?utf-8?B?cGV5ZE55MXF2VFQvb2FRMFlYNnFQZzlSTlZ2ZS9GQjJyVHJxeWQyNzRQdzVs?=
 =?utf-8?B?UGRITEQ4T3ROSXJCZXpQalh1UisvcnEzNjJWbTFPSEZJRXg1Q2psbzhXeGIr?=
 =?utf-8?B?a0JIQkZqSzhkRHlZQUF2VXljaW5IUzNaUE5YUjZtU25idG9TaXRPek1HYVVV?=
 =?utf-8?B?WnVVQTVxc2I0SDlnM3BZTnI1VkZTazFpRWlUTmdyckdmaEZyVSt0VVM3OWVG?=
 =?utf-8?B?M3IzQ2c5Q1lJbUtLS2NpNDJyNjF0bUNoaEc2UmNtcTBJVXA5SDc3YVJobDAy?=
 =?utf-8?B?eGpUN3lMTko4NHphbEVSdmphNGVjWWRHNERsVkxHSjhqaXpVUUZvbmtOQ1Qw?=
 =?utf-8?B?UGZpM0N1RDRJVTl2RUozb1hvT0dKbkRkMGJLaUxubWlTTU5Hays5SWN5VFNx?=
 =?utf-8?B?cHBOUWc5YUZiVktmNjJkUlZLWUllbzZZbnlLMjlTZDErN2NWWklZdys5OFVF?=
 =?utf-8?B?N1d6SzR4QVZQTFFJNjh6NFZJTDRBQjJiQ21Ealdlb2V3OWVsOWxENko5SXMv?=
 =?utf-8?B?QzVPSlpDajZoQUdVNC9yUmY3ZTFnUm9PSDJKaHVGMFp4MmFMUTNqSDQvVzNu?=
 =?utf-8?B?U2c9PQ==?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------SsuouO52iyjlK0rA9nVhrBHd"
MIME-Version: 1.0
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8396b776-978a-4312-e17b-08de0feb7899
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2025 15:15:14.7931 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3vQihs5nLNe2r8Neh6k5gsE3Un31Yw2Dez3gFH09Jsx4wK1+mWJouVjSBzQg420a3+SAnvsQPHflcycMajOMgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB5824
X-Authority-Analysis: v=2.4 cv=VqMuwu2n c=1 sm=1 tr=0 ts=68f65205 cx=c_pps
 a=AV/7kzhiGDB5IWImBwApAA==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10
 a=NgoYpvdbvlAA:10 a=VkNPw1HP01LnGYTKEx00:22 a=b3CbU_ItAAAA:8 a=r_1tXGB3AAAA:8
 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8 a=yC-0_ovQAAAA:8 a=QyXUC8HyAAAA:8
 a=e5mUnYsNAAAA:8 a=hb1mK6Rl0Klg3JZ4qO8A:9 a=QEXdDO2ut3YA:10
 a=B0qZ7ZtHDE-bpsegv-cA:9 a=FfaGCDsud1wA:10 a=Rv2g8BkzVjQTVhhssdqe:22
 a=t8nPyN_e6usw4ciXM-Pk:22 a=Vxmtnl_E_bksehYqCbjh:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIwMDEyNyBTYWx0ZWRfX7QR8IAcc44PF
 QXuhRdgztZ5RR13f24MXntZWMG1QtjI/EHmldfbu4Q0unNPze+zagqSCXhTB6y05LTJb9vel6D0
 al8Z1HmPrsqOaHQIT7zrtRvCvKpbfro/OD4YDYEVjWmAZ+YiJgiznXEKSKTBa3nHYBmXhdgQDrH
 fNB+Wg0maJCU24zKgiqSlJWvOidkaNsIAiXHEYsOXPDJsA3gdQOBl4MpTUU17heAaLkSJOMGrhD
 fJY5Itr6SadNCwCbKGGwuUeuAcP/qeW5dabmjwGYdPTydKfeHOChzS0ftpZcHLvXOu7JFrV11Xx
 IpZJYxwVbJyupw4K2C6Nw6L+RpCz6iZ6wn1mlDtuyzMsZU3ZnemmfT+gxKLlpW4bMcccn2FrAxW
 TzYKBLsFl682j4mzD//PpF2+YGh1lA==
X-Proofpoint-GUID: q_xUcZUSwu7ykTz4uejzCMpBRqm7-KYN
X-Proofpoint-ORIG-GUID: q_xUcZUSwu7ykTz4uejzCMpBRqm7-KYN
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

--------------SsuouO52iyjlK0rA9nVhrBHd
Content-Type: multipart/mixed; boundary="------------Sp9IsDsWxAOpCCCiLErfS20P";
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
Message-ID: <855fdfad-1df7-43de-8a86-a938cc56a202@imgtec.com>
Subject: Re: [PATCH 1/2] dt-bindings: gpu: img,powervr-rogue: Drop useless
 power domains items
References: <20251018130147.12831-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251018130147.12831-1-marek.vasut+renesas@mailbox.org>

--------------Sp9IsDsWxAOpCCCiLErfS20P
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Marek,

On 18/10/2025 14:00, Marek Vasut wrote:
> The power-domains items: list is not very informative, replace it
> with plain minItems/maxItems instead.
>=20
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

I would R-b this, but I want to wait for feedback from a dt maintainer
to make sure this is an approach they're happy with. In the meantime:

Acked-by: Matt Coster <matt.coster@imgtec.com>

Cheers,
Matt

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
>  .../devicetree/bindings/gpu/img,powervr-rogue.yaml         | 7 ++-----=

>  1 file changed, 2 insertions(+), 5 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.ya=
ml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> index c87d7bece0ecd..bee4ab1a1f805 100644
> --- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> +++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> @@ -90,8 +90,7 @@ allOf:
>      then:
>        properties:
>          power-domains:
> -          items:
> -            - description: Power domain A
> +          maxItems: 1
>          power-domain-names:
>            maxItems: 1
>        required:
> @@ -125,9 +124,7 @@ allOf:
>      then:
>        properties:
>          power-domains:
> -          items:
> -            - description: Power domain A
> -            - description: Power domain B
> +          minItems: 2
>          power-domain-names:
>            minItems: 2
>        required:

--=20
Matt Coster
E: matt.coster@imgtec.com

--------------Sp9IsDsWxAOpCCCiLErfS20P--

--------------SsuouO52iyjlK0rA9nVhrBHd
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCaPZSAQUDAAAAAAAKCRB5vBnz2d5qsKzM
AP0ehvb8ZmsbcnadwVibzOFrtjtc0v+0l+BPB+FhGQDsDQEAhAzCSWAkIcr5vvXdT+LQFF7gTEX6
yJh5mTRv1+htXwE=
=WI9V
-----END PGP SIGNATURE-----

--------------SsuouO52iyjlK0rA9nVhrBHd--
