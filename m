Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA3EC3B101
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 14:04:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95F9410E8AE;
	Thu,  6 Nov 2025 13:04:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="Hd/cXQ5R";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="jmNePiIr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 604FF10E8AE
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 13:04:38 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5A65t2ZI766693; Thu, 6 Nov 2025 13:04:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=dk201812; bh=ipEKPyKtWaCdXKTqTj+NEoJl+
 XSerBeLdjaKh4JpAds=; b=Hd/cXQ5RPaqlu+/gYSmoBqgmgf3i3fTQKQ33sWAeD
 qMjdKzbclVnN6sAJNuHE2aUed6Xn6VKyrusM/doSWIbzkpuy/Pc6FNv1xtIFT2yk
 JQaK7sUDmZMzNZIkWxDfqyty/8lcLDOi2JS1yBQVYq9vU4+n1E7Eo6YW7fKs5OlR
 95llRwGQ6H90Ez2d3aU1XPOURzj8K7JEJ13tsgHl2DT4ln82RN+qlJiJcmKJlIfg
 XhKe9mQhSv/kU1sinVR1KznlcGKj+anFFfyYULUOowpvINrTrviELFUfUdhe+Rrz
 RH0hp+smjiq+SzZ2khoVnS9fALji1ztPsxe3IEWtRdtTg==
Received: from cwxp265cu008.outbound.protection.outlook.com
 (mail-ukwestazon11020083.outbound.protection.outlook.com [52.101.195.83])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4a7w9csa0n-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Thu, 06 Nov 2025 13:04:24 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wE4PtrXlL1Buayjr53Mxs4g4pGbNcClpdcyNy9nFQJyky+UxWcA6uBR+ZDgJQguts6KdgCrspbzW16mlynGIn1xlyJe8e5iPPEflk0Xznv0iofOCBQs6oT7TamWtn6t84OJrrdHywyipUXgi0ltzfDCivdYv/MTREmOAQXCNvMeiSMeL9YMOPTVbNB1R9X3a24qVlxBIsG3l0c4cXRNUs0ZKz2XilUVHRLcfmQPBDlVeuaoOBPBeHEqr7vMOFMTNLfDqupw44+afXIZRhJkP/X6hyqppoh9vKRhclKtcYEe/Qlx1sQ0G6IxGFxa7Z3t3rAAoz9e9PSeWMGNb8cZ4yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ipEKPyKtWaCdXKTqTj+NEoJl+XSerBeLdjaKh4JpAds=;
 b=o0uif3l9tOrRUNWTpO/PxgmPrvg13B2SpIK2jsFpSkj4XiYV5WB2gOxxHzdoOxJS3B8yDI5PKURNcaFuQtPXVHP+AnxtICqTJbzkxyT4esuSh9VZ7fw+ZmWvfArk78tLZrRUu3Empz8MCMnVgzu6puDlkyBhkLqrWWxCRjNGbHp1P+6WCcf9WQwj0snBxH9k6TQzIz6gHkTYJlgi9ejEFt16JDZ1PhR89PHxvTMoKQPHsiw154Jw7WboL9lVJpUJsSQQzGGho7P22abmFgI5tRMgUukpnYP+p1NrmDhJ3e05mzhPWsqcXqaqCRBKyeJhpwjgBuNanN36cMed9pJplw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ipEKPyKtWaCdXKTqTj+NEoJl+XSerBeLdjaKh4JpAds=;
 b=jmNePiIrpxMR1Pt+ymkj9KtqTig42goAZX5M/cLNGstFoqOzWC/p4Z6bUgr9L0NVgHx8tj4NM3wZh2THTXXujOixXl8C/J8cbubZBbJaH+h2lASOBIby16M5CPw4Cgh4ICgPTf5j6m9iQnU9KkqHJQLaDppzWwBERiRJWRuOwKA=
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e7::8) by
 CWLP265MB3348.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e3::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.12; Thu, 6 Nov 2025 13:04:20 +0000
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15]) by CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15%5]) with mapi id 15.20.9298.010; Thu, 6 Nov 2025
 13:04:19 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: =?utf-8?B?TmlrbGFzIFPDtmRlcmx1bmQ=?=
 <niklas.soderlund+renesas@ragnatech.se>
CC: Marek Vasut <marek.vasut+renesas@mailbox.org>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Conor Dooley <conor+dt@kernel.org>, David Airlie
 <airlied@gmail.com>, Frank Binns <Frank.Binns@imgtec.com>, Alessio Belle
 <Alessio.Belle@imgtec.com>, Alexandru Dadu <Alexandru.Dadu@imgtec.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Magnus Damm <magnus.damm@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>, Simona
 Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: r8a779a0: Add GE7800 GPU node
Thread-Topic: [PATCH 2/2] arm64: dts: renesas: r8a779a0: Add GE7800 GPU node
Thread-Index: AQHcTx3dNmmAJmJVdUqVOhfoJYuAvw==
Date: Thu, 6 Nov 2025 13:04:19 +0000
Message-ID: <e0373514-04ea-418c-a721-d694b816fa56@imgtec.com>
References: <20251105232737.1933437-1-niklas.soderlund+renesas@ragnatech.se>
 <20251105232737.1933437-3-niklas.soderlund+renesas@ragnatech.se>
 <c1c5a3ee-f5c9-46e4-8095-104d25d4621c@imgtec.com>
 <20251106103904.GD3684509@ragnatech.se>
In-Reply-To: <20251106103904.GD3684509@ragnatech.se>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWXP265MB3397:EE_|CWLP265MB3348:EE_
x-ms-office365-filtering-correlation-id: 73dc19d3-4c6c-4246-2d50-08de1d34ffa9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|366016|376014|1800799024|38070700021|4053099003; 
x-microsoft-antispam-message-info: =?utf-8?B?TENIRlVtbUJmaHVzcFl4UGRyYU5FQXhsUWxSSW0rVUxWVEhoZjhpajN3aElS?=
 =?utf-8?B?Tnl4RlhMU3RTZ1YvM1dYRWhCUUZ6dXZEK2R4V21qVVlEUmU2R05naFkzOGkr?=
 =?utf-8?B?TjBtdUlFdUhHdWZWaGZ1K1lCM0tXUWlXSlE0ajJ2TEpYdDEyZlJpckUvN3VN?=
 =?utf-8?B?dERMWVRsZ0NhcUlOSlRvR2VVSEwxblBIcVRNcDEyamdhNWVSMHZZSkJXWE1C?=
 =?utf-8?B?aVhZMW5OV00vOUh1YnNMczhvdHk0TFVUc0hsVnFDR1hLbWZua3drYzZaU280?=
 =?utf-8?B?eFRzczNyS2RISm9JVDB4OEFvN1NMYnduVmNsR2VlL3Rrb3NnVUdUUUZFd0hX?=
 =?utf-8?B?a0ZjOGlIUy9mTkhNclQ3aEJUVld5MEJadTZrbE0yK0FYWUk5R2pyYmtoN3l0?=
 =?utf-8?B?OHU5bXZ0YTF4RHBpeTlVR0diVHhCMzgwa1BWc2gvLzJJQzdDclR2T1ZKS1hM?=
 =?utf-8?B?cllRVlZObjl6QXVTZGVEMWo2dGdGTWVjUWUwcElldS9lRGZvcW94QlRXQ09S?=
 =?utf-8?B?cUVEeU9Md0tPL3A3QXlGNVFhalFtcjhSSyt0M3BkQytLcm5ROTRjN0VIeGlY?=
 =?utf-8?B?OGkzTllwejArVEMvRHc4S2ZMemNLSFNMRTVhbUxoOEQ3R08zNXoweHNwRFdM?=
 =?utf-8?B?SkZYTThDOUZrMTZzemVINTd5ZEtGSjA4TWNJWFhpMlpiemtTeWtydjh0Ungz?=
 =?utf-8?B?UkFyVXg5QzBZbWhzcjFuUzJHZ3h1Q2plVnc2TlE1Y1d3b0dQejFkZ3pTSUd1?=
 =?utf-8?B?TDhhVytHajJpRmdncjQ3cnBmUXNJZGV5cEZnTVp0MklyMWlFeVpaY2JKUnc2?=
 =?utf-8?B?bHpSK0QwbkxpRTBCV2JONzVUUWJCeEFYcFd2VHEzWDg3Z0wxOHgwQlJJUHow?=
 =?utf-8?B?aEdSWmloTXZlY3dwaFpob00ySVBTcUNyNGpweHVyZUg0ZkFpOVVkYmFxc0ky?=
 =?utf-8?B?anlPUXVHWG1wRjRaNis3OEFvQU43MUJ3VjhGbTVoTVBrZzJtRGVjbzNJelhV?=
 =?utf-8?B?U2lLa2ZNMmlvSTdLSTFab00wNkQ5UDVkYUY0Qk5xWjQ5Ti92SzJWRmF5S1Fx?=
 =?utf-8?B?ekxpMUdqaEVNa3Ryak5kNGxVU3lNaHRPa1gyaEZOb0NraExQdEJHMS9kZHVw?=
 =?utf-8?B?SFRNNWE4TkZGdDNvVFdYZ1ozN3AvL0NjMGRCV2czc292aHZwRldiV1JSWkJU?=
 =?utf-8?B?TFFHT1RHQXFtTTAxYTY4aHRtSnZGK1E5d1VJNVUwVms2allTdGQwa2wxNzMz?=
 =?utf-8?B?czY5WUtJYlpnOWpMekhmK0QySWl6UXlwR2Y2YTBQT2NxNHptczIrNW1IUys5?=
 =?utf-8?B?RHRJN3pFaFQ5VEt4cVZwancxRzU4YWt3MUlRYlgwUGRaTld5aGtha0RLWjZ4?=
 =?utf-8?B?WG51eFY3ZEo0dkpPN2FSWW1CbTJ6Nks2REpzeXg2RHZhdnVmUUt3RVI5S2Nx?=
 =?utf-8?B?elJYWUFReWs3MWVUb201SklLWW5wSlA0TmZGa3FkSzMwaGNJdE5FMjJjcDRh?=
 =?utf-8?B?S3hZZHZnWHlINmRzWGFsQXltTGtYWWhrOXMrcEg4R2YybGFKcGNEWTRrRTVS?=
 =?utf-8?B?RzVUMmdQbEFKVjVsT0NCR0dodDREb0NEeUtBYnN0WFdYRFBBUDJOZ2pjZWhu?=
 =?utf-8?B?Ung4Ykl4ZWJSZnF6MnIyM1hVRTg5MkRIRVkyWWVQbmwwcmd0ZSt2SnF4MG5R?=
 =?utf-8?B?dllWVVR0ckgrMklmMVR2dlFkR3pScC9WZEUyekM3amJmb2x1aWp5YlIwNG82?=
 =?utf-8?B?dTZXNUZPbXowQXZOTVpiZG9uR1RPN04vYTAzS21LeStJdGhLcXVuT2xBZGo1?=
 =?utf-8?B?c2dpL0RJY0RXNDVjcDJUMTdYWkZLWmNFaGZtZnJCQnViVVl1RVZqeGlUVmlS?=
 =?utf-8?B?V1p0TXAyUTVjeU9mSjk0c25Mb01YUHdQMlhDQ0M2cGZQUmx2eTJva2hrRnU2?=
 =?utf-8?B?a3lVYy91L2E0VVJXdElRSTZTM1NBbWpzRjZXUDRJazNVMkNRdG1Dc2did1Jt?=
 =?utf-8?B?ZGtXSTJoZHpnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(366016)(376014)(1800799024)(38070700021)(4053099003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eHFBaUlHS1h1UUFzMTU2NTcvNkNXeGZ0VExDYUo1b2dEZ1FhMXkvdFhkY3V3?=
 =?utf-8?B?OUw3enI1LzdiKzVZQmxnV1FqMU5vTHQxT1NwRXhHMklkcytXd3JOUGdGdWRQ?=
 =?utf-8?B?M3g1SGJ1bG5HWVE1c3ZjYjFHcHBwV3JJUHJldzVST01IVzJnUEVQM3lnQkRq?=
 =?utf-8?B?ZXJUN3JDa1dsdXFyN3BRbTVzaUhDakZkY3ZXQVNRaStDS2lZVDgyQ2ZpRzVi?=
 =?utf-8?B?NGNuMDdoUnVkOGI2OFM4R3dITUI2WUJyc2tPOGluaVJncWU3SUptMmd2bDJx?=
 =?utf-8?B?ZloxSXU0MTJHQllyUHV4LzhtZGorcUpKaUl1NGUwcmZRNE55NGVwUE56ZFVB?=
 =?utf-8?B?QmVOQUhrV3dmV0FLelY0b2xUTVJlV1NMY1lEY2Vib1lRdW5YTnRpOHNjWmhu?=
 =?utf-8?B?TVBwRUp3RWY4cWZ3c3VHSVRrWjlQL2wrN3ZjaTRNMTQwNVlzQWVaV09ybzZl?=
 =?utf-8?B?TWV3WlIrZkdONUhnQ1o1anlpN2wxdThIOFhWSzdNWWhETU9qR2pRWlJIenBo?=
 =?utf-8?B?MitqMEp3RmExNFU0Y0tiQlZtUFVNYnlUS1AvQ1FUVUZYQ1hKRVhkTUl3UWxL?=
 =?utf-8?B?djZmT1IzQmQ4bDVYaTdoMkxLNnBVdC9WWmpkSWJOTGViWXp4SVFUQkFwckFq?=
 =?utf-8?B?eFdQdUFzZ2d1KzVDS1RxTWVqMlRlNEhmT1NmT3dFd2djVldkV2dPY1Y1VDN3?=
 =?utf-8?B?NUFwYVRhOEdaREhRbEVlTC82Zk4rb1NoTEtnUDBBVUkwd1JrSHdEdHQzWWht?=
 =?utf-8?B?VWNFblovNVRVamF6a0NvSThSblRZQ05zK01RbmQ3b3pEcGYvdXMwb01yQisv?=
 =?utf-8?B?OWJzeHN4cm5QYlV2NW5udWJ6TnFJN0J3RExLVGdnN3U4Q1pYVThxbm9zSnd1?=
 =?utf-8?B?Q0hONllkNTNIWWZKZUhyYXpaK1lpSlB2MWp5YVhNVXlveTREK0FPcnNmckgy?=
 =?utf-8?B?MUpJZTlSRFJ0UUdQQmVGS1doTjdsYnhUVng0NkZJY2xKZ2o1OEhyL1NkTWFn?=
 =?utf-8?B?S1VhV0x2R1VMK291MVdQSzdJWnh2L3dVaVVnWENWdHJ3TTNKSHZTK21XRTZZ?=
 =?utf-8?B?aUJtZ1p2bzI0YkFHcDc1b1V2OGI3Mzg0dC9nOVhnUDY0L203YzJJYmkzK012?=
 =?utf-8?B?QzBNQlFRM0kyV21KNjUvUVhuOGJhdWpMU2pZYmpKbGd0WjdrbThYZ3FQQzBX?=
 =?utf-8?B?T1J3ZDc3QXd1RjhmMnlrSXpCNnZyUUJPQVZxTTM3TXhFekNYU2I4akVGZ21u?=
 =?utf-8?B?SzAwUzNpWTZJMEhCVStoNVdTRHZyRGxQZGUxczg1NmRkclJPamJHNld5WC83?=
 =?utf-8?B?VnNlSGt1dGNYWTdteEsvalUwYis3WW5LUU1SOE1IN1VXUlRVaU9xYi9qVVl6?=
 =?utf-8?B?UWY1WVBYT05jM2sxT3lCa3lyazRwMFRrbTkva2pQaWFCVktrejZTZlo3R3Zh?=
 =?utf-8?B?RHRDNTZ4dkhFNitxZ2ROT2o2SjZWbi9MU0J6MXcxc3JCemw4TlFWQUZJajNG?=
 =?utf-8?B?VEpubEhsKzZrcnJFUGVkQlZGMnMxM0FmdEhqM2ZLazVkKzR6QndIUkFtanBx?=
 =?utf-8?B?SjVYSWN6ZythZkJ3c0VFQnZkZklWZ2VMY0Iwck5ZWnZqSGlLamdpRzVCY2RD?=
 =?utf-8?B?a2RHbXgvWHZGS1hLWitpNlg5NFRjZ0dQTW5sRzVBRkQ2YW8xUUk2YzJlRW5y?=
 =?utf-8?B?cUhrekFRNVp0YVMzY3ZWajgxbXAya0Y4L0tGdkgvRkhYTWZic0lZMjh5RDhZ?=
 =?utf-8?B?TjQzbWhQTWo2NGk1NkVmTEtrcmV3OVdsdkVLdm5MQnFxdUpoSG9UWUhERlRu?=
 =?utf-8?B?RzJXbDhCMTNKWHJhQWxNRXFDcEhWZmZHN1ZNb0N1WXJKMlI0QS9NL3RyRWFi?=
 =?utf-8?B?cnBwc1lld3VIdVRqdW9pYW4wQVczaFhkRHZzaUZwQ2xSMFFzY05WcHJGRlZx?=
 =?utf-8?B?RTNiY1FpZ0htckw4cE1XUldVc2M1M0VjWXFPRk9kRlhMTUhqalh1SXRvSVpm?=
 =?utf-8?B?L20vU2UrVDI3VDNJTXlSeWJsYTlhZmNoSzBSR2NNczZGT2VsZVhBYXBsMFBh?=
 =?utf-8?B?TzR2QjJLNFFhdnRQQnpEbTFlNjFlaUk5OENtOGxXc3pINnJaZWxBQzQxb0VZ?=
 =?utf-8?B?UmVlTGh6NFpRRWZlKzg5UUNsWktoRk9NUGh5NmZZS3owelNkQ3BEblh5c1Aw?=
 =?utf-8?B?dHc9PQ==?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------JLIexLG2iivWgxdD9farTWB2"
MIME-Version: 1.0
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 73dc19d3-4c6c-4246-2d50-08de1d34ffa9
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2025 13:04:19.7524 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0Hph4dplgg7S1uCb8Z0rWsAuWOLY9WXxpBM8q4WGPS+Rb7ji/SOmPGhMAmZ8efzU3CEGc04Fe3QPuhfsI0R3tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB3348
X-Authority-Analysis: v=2.4 cv=bbZmkePB c=1 sm=1 tr=0 ts=690c9cd9 cx=c_pps
 a=c3Qqdm5pKCC5tk9KGyz4gw==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10
 a=NgoYpvdbvlAA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=b3CbU_ItAAAA:8
 a=r_1tXGB3AAAA:8 a=9278undnXn4Kw9667YoA:9 a=QEXdDO2ut3YA:10
 a=o_C5psX81tkIFl3f4JYA:9 a=FfaGCDsud1wA:10 a=Rv2g8BkzVjQTVhhssdqe:22
 a=t8nPyN_e6usw4ciXM-Pk:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA2MDEwMyBTYWx0ZWRfX6SI5MD6/w08T
 La8GaWIhR4rZqfGP6xyRtx2DO5yqHGMyXPB3D2ZCIRI9yRkzmd9spc0sbi6GgwxeKFC7zGJ0Ze8
 CgdeuHbME3Jhpb713X5+zR/QeWYxuqbMHWXUo2PZ25hc3JOL1z6OK2btqe/82jBkAPbVokwJ0TJ
 ksaWbzgkLNvgKh8aCOA0c+rzwdCefaqFV3Da7mu8Veulzml/TDYEFohcol+SyUVEH06D/pX+/TN
 ak+xA9gWsQMmlg+fBzKZuZGB/mbc4N2S1BQ8hYC7A930imbMj8hxf9/ZFFmQMMaTICSVnXmeC3S
 OUeR6zeRKw6xnCVcRBtutGOApw4zZUvFJTy6JyD/FSZQBq7dsV7xCVZ2HZraRFkrNaHu22emrcb
 7IZ9s/n9NPosCRPhN/urPaLXF5d6ww==
X-Proofpoint-ORIG-GUID: Vdn5v33cyeh9ziSdvH1UuThXirdBlH0T
X-Proofpoint-GUID: Vdn5v33cyeh9ziSdvH1UuThXirdBlH0T
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

--------------JLIexLG2iivWgxdD9farTWB2
Content-Type: multipart/mixed; boundary="------------dy8v7H7PjoXYzuxess9049r0";
 protected-headers="v1"
From: Matt Coster <matt.coster@imgtec.com>
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Frank Binns <Frank.Binns@imgtec.com>,
 Alessio Belle <Alessio.Belle@imgtec.com>,
 Alexandru Dadu <Alexandru.Dadu@imgtec.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Rob Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Message-ID: <e0373514-04ea-418c-a721-d694b816fa56@imgtec.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: r8a779a0: Add GE7800 GPU node
References: <20251105232737.1933437-1-niklas.soderlund+renesas@ragnatech.se>
 <20251105232737.1933437-3-niklas.soderlund+renesas@ragnatech.se>
 <c1c5a3ee-f5c9-46e4-8095-104d25d4621c@imgtec.com>
 <20251106103904.GD3684509@ragnatech.se>
In-Reply-To: <20251106103904.GD3684509@ragnatech.se>

--------------dy8v7H7PjoXYzuxess9049r0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Niklas,

On 06/11/2025 10:39, Niklas S=C3=B6derlund wrote:
> Hi Matt,
>=20
> Thanks for your feedback.
>=20
> On 2025-11-06 10:19:13 +0000, Matt Coster wrote:
>> Hi Niklas,
>>
>> On 05/11/2025 23:27, Niklas S=C3=B6derlund wrote:
>>> Describe Imagination Technologies PowerVR Rogue GE7800 BNVC 15.5.1.64=

>>> present in Renesas R-Car R8A779A0 V3U SoC.
>>>
>>> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnat=
ech.se>
>>> ---
>>>  arch/arm64/boot/dts/renesas/r8a779a0.dtsi | 17 +++++++++++++++++
>>>  1 file changed, 17 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi b/arch/arm64/b=
oot/dts/renesas/r8a779a0.dtsi
>>> index b08865841476..aa347b699340 100644
>>> --- a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
>>> +++ b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
>>> @@ -338,6 +338,23 @@ cmt3: timer@e6148000 {
>>>  			status =3D "disabled";
>>>  		};
>>> =20
>>> +		gsx: gsx@fd000000 {
>>
>> Why gsx? Marek's equivalent patch for r8a77965-gpu[1] used gpu (as we =
do
>> for every dt so far).
>=20
> Wops, will fix.
>=20
>>
>>> +			compatible =3D "renesas,r8a779a0-gpu",
>>> +				     "img,img-ge7800",
>>> +				     "img,img-rogue";
>>> +			reg =3D <0 0xfd000000 0 0x40000>;
>>> +			interrupts =3D <GIC_SPI 223 IRQ_TYPE_LEVEL_HIGH>;
>>> +			clocks =3D <&cpg CPG_CORE R8A779A0_CLK_ZG>,
>>> +				 <&cpg CPG_CORE R8A779A0_CLK_S3D1>,
>>> +				 <&cpg CPG_MOD 0>;
>>
>> I don't have access to a TRM for V3U (it's too new apparently, despite=

>> already being obsolete), but I believe the GPU integration should be
>> similar to the M3N in [1]. In that case, the TRM (v2.40, fig 23.3) sho=
ws
>> S2D1 and 112 in place of S3D1 and 0 =E2=80=93 are these definitely cor=
rect? The
>> 0 especially feels wrong (see also 8A.2.1.2 MSTPSR1).
>=20
> Yea the V3U doc I have is not the latest. The diagram in the GPU chapte=
r=20
> list the same as you say here (S2D1 and 112), however the diagram seems=
=20
> to just be a copy-past of the Gen3 document. Looking elsewhere in the=20
> document I see:
>=20
> - In the clock chapter the GPU is list as MSTP0 and not MSTP112. =20
>   Comparing with the Gen3 doc this looks correct so MSTP0 is good IMHO.=


Sounds reasonable. Just to cross-reference that, does 3DGE appear in the
0-bit row of the table under the register definition of MSTPSR0? I see
from renesas-cpg-mssr.c that these registers have moved for gen4 though,
so this could be a blind alley.

A similar thought =E2=80=93 is a new entry in r8a779a0_mod_clks (defined =
in
r8a779a0-cpg-mssr.c) required? The equivalent table for r8a77965 has a
"3dge" entry at 112.

>=20
> - The V3U don't have a S2D1 clock... but the GPU chapter lists it in th=
e=20
>   (assumed) copy-pasted diagram...  What I did was track which clocks=20
>   where S2D1 on Gen3 and compared that to what those IP where using on =

>   V3U. The overlap was the DU and that uses S3D1 on V3U so I just=20
>   followed that.

There's a top-level clock diagram near the top of the CPG chapter in the
TRM I have (fig 8.1d for M3N) that annotates S2D1 as being an AXI-bus
clock. Is there a similar annotation on S3D1 for V3U in your TRM? If
not, I'm happy to just follow your logic and ack this patch :)

Cheers,
Matt

>=20
>>
>>> +			clock-names =3D "core", "mem", "sys";
>>> +			power-domains =3D <&sysc R8A779A0_PD_3DG_A>,
>>> +					<&sysc R8A779A0_PD_3DG_B>;
>>> +			power-domain-names =3D "a", "b";
>>> +			resets =3D <&cpg 0>;
>>
>> Same 0 concern as above.
>>
>> Cheers,
>> Matt
>>
>> [1]: https://lore.kernel.org/r/20251104135716.12497-3-marek.vasut+rene=
sas@mailbox.org/=20
>>
>>> +			status =3D "disabled";
>>> +		};
>>> +
>>>  		cpg: clock-controller@e6150000 {
>>>  			compatible =3D "renesas,r8a779a0-cpg-mssr";
>>>  			reg =3D <0 0xe6150000 0 0x4000>;
>>
>> --=20
>> Matt Coster
>> E: matt.coster@imgtec.com

--=20
Matt Coster
E: matt.coster@imgtec.com

--------------dy8v7H7PjoXYzuxess9049r0--

--------------JLIexLG2iivWgxdD9farTWB2
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCaQyc0wUDAAAAAAAKCRB5vBnz2d5qsC7O
APwLt4KapLM6g+14n4Kz4JL3utbcZm6d4DyB6P0WYFbPYAEA1fNBEirp8ot0ZREj7EUo+EG90x6s
MiexdiI5XqtPNw8=
=5A0b
-----END PGP SIGNATURE-----

--------------JLIexLG2iivWgxdD9farTWB2--
