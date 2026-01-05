Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 032C9CF3F32
	for <lists+dri-devel@lfdr.de>; Mon, 05 Jan 2026 14:53:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3273B10E037;
	Mon,  5 Jan 2026 13:52:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="fzm4Esw9";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="UDkABeUW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AE3410E037
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jan 2026 13:52:55 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 605CLrnA4051142; Mon, 5 Jan 2026 13:52:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=dk201812; bh=dg36FCjptbVVubdBaJjDGwvmK
 YipEg2QF7l6Hy/fJQc=; b=fzm4Esw9GvHiEsepguxSsQM24+7BhR46L0NxHmUWr
 IcA1DZt2kyDP13XqjIm22fcVEtyk4pv3xxEwSlOIbro2XTIHsz1KCtUL4yOMOUed
 BE5aBW4c/dhBzEiRj9+f7wXRnHJ9tPCL+F/D3prVCQYTL/29iA+x3LFKPiE1uItb
 kAJuIXfvmdCqmLcPrCqL+lPyF4qyrcCwMdG6D9r/wu2oFeIERtnM310LZmsJ7M11
 4HsCJ8s9Y10ZFTi+jp7xmjqLuZtEGwBYnmwdeWXwSq/EFM4EvMDxqANIGNegzBkz
 4HvNcDEqwNAcB9EENSdASetXwoVb504QAgqM7nlfQ47CA==
Received: from lo2p265cu024.outbound.protection.outlook.com
 (mail-uksouthazon11021115.outbound.protection.outlook.com [52.101.95.115])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4bev2x9asf-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Mon, 05 Jan 2026 13:52:30 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WvlSuWx6XH1o6ZgByUDhKFaGdQbLlj/38Q8NEA8URAKdyKq9pYuMni8l8bdMuynP85m70brPiesMJUz0tfYMZwfuztWci6LDUczGIzDEufx5eUhIkq/4BJ/2zZQqAgaS1NKlo143IfNW4H2GF2TAsey1CjrpqKmrmxvZRRCxRPcq5LNge4QixE75Q+sh59OptKmaJ0ZBRWsNP+id47PIl2bADl3Hs8pubmBk+nHpocUUy3t1yIVH1lUvb+xbwweF2Mu9qdMpt9nN76hldSKqSmoYv/c9VoYKPpL8L1abDeuJvNSyoS3MTxvQ/LqfuttVH1UOuMawCWw5EIxvoJpR2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dg36FCjptbVVubdBaJjDGwvmKYipEg2QF7l6Hy/fJQc=;
 b=BFR8lRiM+j7RP+MjTutWh52cKoWVq6OOQIp592wmy8h/htzGSr6bbBV05gOIaAyAYgsvnxjsAXBxghD5PL9oksydQisEcq6sFutmygk0vtoe8d8vUmCCEg0BVOCJyiF0H/URePX2YxTAmRS5zCFabBIq3rQAaz4xqPkWVgmTkXBqtk3CVnei1OKGdSwKJRg2YXWBVKulS2JN+SrSVuqyUCxKBCmsrHlEjw7vKJTn2XwEIpUlfnfo75wTiBU3elTyHMmMGm42lTPqta1zlTz9WOwpZmR6ZYnno/KyvNbVmt3kJ7O6eE650+CfKa4UNYg2wL30gDHgP5Q9P7iC8hrrGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dg36FCjptbVVubdBaJjDGwvmKYipEg2QF7l6Hy/fJQc=;
 b=UDkABeUWhOVKsz1n+1ZTouJbk6nEKMSuWiGPZXBVHkOo7nWfWXdk54ntq09m7BL41XGH8yoI/qA95hIHwGf2UEK+lGzT54CVfZKj3uG9EjK8+01zXGQfDfR2+jLYiDU2LnOuiIsS4w5MesC2KivPSPYJJZt+0SAjvOQRWJ9UZJI=
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e7::8) by
 LOBP265MB8915.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:48c::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9478.4; Mon, 5 Jan 2026 13:52:27 +0000
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::a737:7c4e:569c:d427]) by CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::a737:7c4e:569c:d427%5]) with mapi id 15.20.9478.004; Mon, 5 Jan 2026
 13:52:27 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>
CC: Frank Binns <Frank.Binns@imgtec.com>, Alessio Belle
 <Alessio.Belle@imgtec.com>, Alexandru Dadu <Alexandru.Dadu@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, kernel test robot
 <lkp@intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/imagination: Align rogue_fwif_hwrtdata to 64 bytes
Thread-Topic: [PATCH] drm/imagination: Align rogue_fwif_hwrtdata to 64 bytes
Thread-Index: AQHcfkqGdYiZ68CB+kmfiJH28HwJVQ==
Date: Mon, 5 Jan 2026 13:52:27 +0000
Message-ID: <a03d7321-4394-494f-86fb-b0394d5c4148@imgtec.com>
References: <CGME20251222225350eucas1p1fc7c096318a7780ac7bdca8f63dc7ca1@eucas1p1.samsung.com>
 <20251222-fix_imagination-v1-1-0ac80a2ff317@samsung.com>
In-Reply-To: <20251222-fix_imagination-v1-1-0ac80a2ff317@samsung.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWXP265MB3397:EE_|LOBP265MB8915:EE_
x-ms-office365-filtering-correlation-id: 6d5caf77-4569-460e-dcf7-08de4c61a972
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700021|4053099003; 
x-microsoft-antispam-message-info: =?utf-8?B?a2dlYUNiL0FoaVFMd3VRTk9RMlRvV2c3YWw4bVdIemFWdGIwWEVpMlowS01q?=
 =?utf-8?B?eW9mT25BWVNGaUNLZGxWOGtMblpvK1dzR0pVdVAxcEI1dUUyc0NRdzNXeE00?=
 =?utf-8?B?UmVPTy9aVWgrM1NYaC8rb0JGZVdsMXNDSkRFVDVyK2ZjekFkOFVqOThvRndC?=
 =?utf-8?B?QUM0bmRWdENEdTg3aE5VQjJOUU9zZ1ZVem5xYkZKR0l0QUZWMjhheUdMU3Fu?=
 =?utf-8?B?S1JSK1JXeWdRak14TThhLy9tSTJmblJ4alhzSjZIaDBteVJ0RUQzbEtTd0Rh?=
 =?utf-8?B?ZW40T1ltdnlDU3paUytQRFdRMjhBeTdkcFFsU2F4UXR1dFRnNjdydmUxeVVZ?=
 =?utf-8?B?S1hZaUp1KzFPdVJvN0o1WDJBbTR3ZHZ5M3ZlK2pSSzNlYkJxWXVVZEw1cDVi?=
 =?utf-8?B?V094Y2pVL2FUNzM0VFhqczZWSGpZbUJxRldEczk2Y0dVcUIvYUdicnJMWkxZ?=
 =?utf-8?B?dm9oMmJRdmt3M3RlalVXYlJBS2VNKzBFNmNWVmk1VHgrZ0x0ajhzQU96ank2?=
 =?utf-8?B?WWs4K1VJUmVPdlh4eEtCQm11cENjTUs1OUpmdExUSUM2R0xWemw4Yy9WcHVh?=
 =?utf-8?B?OFMwYUp5dlJTSkwwenlxRHNOR1RZdU5WS1plRlczQzczVWw2MDdXb1VQTlhj?=
 =?utf-8?B?Zk5pOUlrSkk0L05qOE5OQkJieDA0VWZvRXhONjhTbzJuVFlIRUk2VXpEdks5?=
 =?utf-8?B?Mm9RTjRnNHlIOXFnck90SHYxZ2IzV1J1T1l2VFJpaWJ2NXRha00zbUlXeHhw?=
 =?utf-8?B?MzhRZnZIY09lMXRGMmlYUVk5dDM1eTVxM2szSWNpU0lsdXlIMUV2WitHdTNr?=
 =?utf-8?B?dU9sYmVnSFdKWUVrR0xaclN1R0tmcXZvTzFDU21nT0JLbS9MbHRjT25VZHpL?=
 =?utf-8?B?QkFpblZTOGtkNHB1alVrQVEwMllWVzBYOXp4bHFUK0p4ajBONnZFbjk5a3pY?=
 =?utf-8?B?TkFlbHRHdUFsSFdWZkhVSmFkdDRoL1JwcHpXUU5MbzhJbGJ1MGIrYWgrKzNk?=
 =?utf-8?B?NnZocElqc0ZVcDBibW9XeENUclY5Y1U5ZmFaTjdQaDlRdy92Q0JENW9UOXlH?=
 =?utf-8?B?M3FKRE95cEFoTUh1blU4VDkrRFZZdHYzMklORWtuYUovQ3dneWgzVUd4eGVT?=
 =?utf-8?B?cXRPYmVLbmYvemZLaEppSTE3dld3ODJDT0UzN0l3eGZNQk15TzBjdUpSUDc1?=
 =?utf-8?B?dkI4czdFYVJWdGhFa2hqeitqdVFOSWYzemhHbFVycmtCVnp6M2pBVTNHbVVn?=
 =?utf-8?B?Q0FDUVBmTGRmaEw2Q0srQlI0V0ZTc0daaDlvTVUybytHVHZ1eGQ0SFVXRStO?=
 =?utf-8?B?TWx3MnlNZmVNaERzcElkUm03bzRja3IrQXRDMUI0U0NTdjFoWU5JM3hWVzhw?=
 =?utf-8?B?T0lNZkh6TmZhVkxxNEFwWUdGMXVUTERLdU80RHRhOWp3RWNtSzNUT2NrWGU2?=
 =?utf-8?B?UVRHV0ZQQUxOUUNFUTFSeVExWWVvT1VjdnZoWlArdUpMaGxnS05BV2xjNWFP?=
 =?utf-8?B?SGNnY2dPT2Z4U2ZCNTlKNzJ6OTRocHlGcnpNSVEwWUdJZUZGZUF5RlpmNGpE?=
 =?utf-8?B?bGJ1a3RKNlFKaUJER1BVSmJNeTFNbktHWUcvdGZleVRRaHZHRjhHNWoyTWx1?=
 =?utf-8?B?bWRreFBTbjNoaVBlZW1CNHdibFU1RkJYb3hqMXVuWGM0d3JOWEgzYTZrZ0tO?=
 =?utf-8?B?MjRXd281T1ZjSy8vcUtPNmgxSmZjRjh1UXZZbTdKRFJSaktPQmN5QWNzcmVS?=
 =?utf-8?B?UXNZZEUzb2FqU0tBakZSbUd5UFNwUWhpRzllc1hISEhGcmF5Rk1mU0kzYURr?=
 =?utf-8?B?cCtseXZkdWt4NnBCTW1XYVowUW5MeWhMbEd5SnBGc3JvL25iaDhycXljZ1Yr?=
 =?utf-8?B?M2Z4NGQ1NjJiUnR5UEZGdUtxdlhiRW9MUnB0MWZmcTRZUWFqc1NSamFuNnpV?=
 =?utf-8?B?Z2k0emJ6c0dTNU81Umx2Zm8va09NcXJ6VHFoVWd3YlRCVytOUmdFRitCSFJF?=
 =?utf-8?B?RXFqT1poMUl4MkJ2SWhuZVRZellERUxyTnJGYTB5Tmhod050VFpkbDkzU0t2?=
 =?utf-8?Q?7QyuKj?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(4053099003); DIR:OUT;
 SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K3UzYWpFWUpCK1FhMG5lSVR1MXB3d1ZoUU9BZlZwOEVxSnVvdHNZcXNLOFJD?=
 =?utf-8?B?anVNOUtBUHJ5ODc2REo1bTFHMGVaSEo2dkNZTUl2UzM4WXpxT1p3VXdUOG9G?=
 =?utf-8?B?NVZZcU1NUmM5QW5rNFd0eEJzc2d3bjRVczFVSDhaRHhOTnRzSUltbkRpaGhH?=
 =?utf-8?B?cGdxbkpjeVVSNTErL1N0eUE0L3NNNVpMY3FaYkNjdDFJUm9nUXk5dnFUejB0?=
 =?utf-8?B?U1pZNXF6TDB1WHN1SUV4V0xod2NRNXNqVjdrRTd4TUV2dGMrWEcxb2NiSTNh?=
 =?utf-8?B?MmpDY1NiRmphaExDcDN5aW45K08zWStDVmNrOXdYVG9lMFBrVDRjdStXLzZp?=
 =?utf-8?B?MnFpbUtGWlN2YThiRWc5bVc2RzFsdCtxTzUwdTY3UkNaa2MxNm5wS2pIVmtW?=
 =?utf-8?B?OEFIV0VFSEtRdHZINU9YMDdmd3dOWkJvcjY3aUs1NXRDTTY3b2xqako5Rjgz?=
 =?utf-8?B?b2tMNmJ4ME9HR1l1VVRjR2hQRVpzeDZ2a2dTUE1kNm44cmJIYWYySWZBTytk?=
 =?utf-8?B?ZGV3Z3dRUnN2T1h6NXlrVTljZkxGZkhaL2NsZVR0R0xDN09HTWJ3K3ozbSs5?=
 =?utf-8?B?TUZxREgvUFI2WnRHcFRlamJmZ016TjRHQ3p0ck9nc2ppQ3RqTjd2M0M1UnUw?=
 =?utf-8?B?eTdaYW9yOUhta1FUSFEzeFRQb1dFd0pmWTdsSlVIMUYrcnlEeEZOTzVpdktt?=
 =?utf-8?B?NlhnZGVHU0RERDNEM081V09jSklGd2dXYXBKeUQ3cjMrN0NkL0VJZFNSNnVM?=
 =?utf-8?B?S3BXcUVEV1dFSUNjK1BoY21Ucm9QRGd4MGg1TFV4c1EzNEt1OU1ONlZPZXFX?=
 =?utf-8?B?V3B0UTFrUmVoMjZ0VWw4OFByVitQcllQcGUvckN5c1JWQjIrM0ZvNjVDNzVF?=
 =?utf-8?B?L0huL294OUNyWUhjSjkvY0hXaVdJMEpVaGlMdXpmQ3MyUDlYeHFsZzRxMjcr?=
 =?utf-8?B?QUVWUXk1bXc5VUJ2Q0NTV2dNWlBwN280RW4vRlVvTWtzTTZwS2ZKRGp6RTVU?=
 =?utf-8?B?Y2FrQytJYkM1VGRaS21CK3o4Q3lQYlpmMHpydE10SGNjMTh2eWMwNjd5Q0kr?=
 =?utf-8?B?cEkzSTlFa09rQTFCRWJ0dGpFeWFVeDZkK2hpNHRZem51QWVpWGlDSzR1MmVD?=
 =?utf-8?B?MkpQZ2dxMHAvcGROU3MvMkRFZ3NMVjlnOE4xaUhKemdlL0JuazlzakU5V0JU?=
 =?utf-8?B?L1dIMktlMjBuazAzOHdLaVRiRlhqblF2THdkWVB3bVJOV2gxbnBoRk1vWkR0?=
 =?utf-8?B?Qk5meTI1MWwyMUJYMzcvQTBkUURlZFpUT3pZVC9JS2s2aHA4aEhETVJMUFpQ?=
 =?utf-8?B?dFJIUHVnS0xlbzRGa0prNlFRbzJtSytLd2FXQmlHcm5LYlF3YjN2NHhwT2pC?=
 =?utf-8?B?QWVBelhFMXZlK2VEOWdneXovZVQzNTBsSy8yL3lTMXVnSzlIN3YybGwrTUdP?=
 =?utf-8?B?K1UyeHBsdVFSb1p4YTBjV1RYNStrSFdoem5LblNiNEVDVVFFK3lhRmZSaHVS?=
 =?utf-8?B?cnRmOG14aDEvMVVSenFKekl4ZGIweUtPb25QS3VZUnFzS2xlQUo1bGhBWG81?=
 =?utf-8?B?Z3ZkYzB5M2dnOEhsL3dpNlhhd0tBRGtFdnE4YUorWW1ZaitjeVhPOEExQ080?=
 =?utf-8?B?MHdNQTZNd1UrSzNqd1g2NUlrdHRXRS9qQWUrNW1QZS93UGtXcURYZXhCL1hN?=
 =?utf-8?B?Yll6WG5YQ3NzQmltS0o3VjJCU3VPZDBjTW44L016SzJMSWZ3Ty9xbEQvc254?=
 =?utf-8?B?YzZnR1d5NEE4QklUWTVlbitNcWVZdkpaTVQ2MXNwU2loUUhmQTB5eE91QlpO?=
 =?utf-8?B?N1BQd21td2psY2lUanZ2QzNNdUhtQnNnNlM2THovS1BrcWFQc0hqVzJ0cXpM?=
 =?utf-8?B?MmtRRE9VZWcwcGtzK2FHMHUwYzgwTW9oVjNEak1qb0JpOVV1bzRQS0VzVXZy?=
 =?utf-8?B?OE9ESjEyTGVkUTB3TmFXeGVNS1YwWGk1QUY4ZjNiUHdyMnlkaWZQZlJGc3Fr?=
 =?utf-8?B?TFNGbDM3OHdzc0h5aURYTVpCcEoxWVdHcUpBN3JMQmZLRWNvTnd5d0hQQmF6?=
 =?utf-8?B?cDJ5bnhPbGpreERpcGErWkUrMTZFb0tPNDdKcUpRV2g2dkFmY09ta3JaY2N6?=
 =?utf-8?B?cmVDcmMyVnAvc2lKODgzNUxkSkUxS0ZQcHExN0huV3Uyc05jb1FoRUtRblpY?=
 =?utf-8?B?R21UTXlWV0NnT2FjMTNNMWtTUUtXQzhNYmN1c2U2eVZhaG5SMmdqamF1d3ZX?=
 =?utf-8?B?K2hucXpWYlFSY0FLRmU1L2FPNU1oalE0UmVjZG5WanZiYlhKTnZ2d1I2R2hS?=
 =?utf-8?B?ZXNQTmJ2aDlEOEJ1TnF2V1EvSXhvNGRsTjZrWmRZblllUFM5dUQyYXNLbDhm?=
 =?utf-8?Q?4jvCaF5V0NWdhEDo=3D?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0Hl2gXOkEd0rrIPAn2K8c0Ot"
MIME-Version: 1.0
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d5caf77-4569-460e-dcf7-08de4c61a972
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jan 2026 13:52:27.1087 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IxxNU8HeC7HZ+Z4KLgpLq0r0D48MIFmZufPg68bxjM4FkajWjp5XifB1bOs4dkYjrcAPODxtC/yBI8JuOwVbVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOBP265MB8915
X-Proofpoint-ORIG-GUID: lKasgEKpJpUHoBDxi7Ni07Oe8SyimAGX
X-Authority-Analysis: v=2.4 cv=JOw2csKb c=1 sm=1 tr=0 ts=695bc21f cx=c_pps
 a=VV8/NmQTY6T8LX25TfDSnA==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10
 a=NgoYpvdbvlAA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8
 a=hD80L64hAAAA:8 a=r_1tXGB3AAAA:8 a=Us2G9mFh6sP1UL_tPTwA:9 a=QEXdDO2ut3YA:10
 a=qW94vINmYiFLYzprPKYA:9 a=FfaGCDsud1wA:10 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: lKasgEKpJpUHoBDxi7Ni07Oe8SyimAGX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDEyMSBTYWx0ZWRfX/zQj8FVaYhyr
 5e6tI+chKPryYI+BHqA9T0C3WoDx9+wYawABYbZYeWzKqyu6Il+onTLPfzCEvCrf2y3FlnngGQ6
 A9h2zu8snRRYLTqICNp1siaGg9Fl02kD+Z6r37Uj7M0zvX/bNSI/cyYchty/5pYKlbxLG57EirJ
 vwlIxqFjhk46SQPRJ0rb0M/RWK27gLmeYRbUJR9ImkG98ybxRP9OvyxtZ42qDJM/XKF6pXqyrPz
 r2dj7hkxM6s/8pYh05wQ0ofvN7e87snr8OHyA2NIPSUkWFhx7suk/g9TIPx78e7hAoMWW97VA5C
 DF8T/Pr8X8VBThKyL5AjWmRf1OHSrQEvzeKNHloC36BCwdfoOnkrGnSYn+bfyQXm7FPqu5KDqFO
 J1Vuhc6hl98gzkxTnKf145IZTyYN3OCzpf5vUUell+795B5DM2e1LJigQcxgjhr9Auah2FGfHKc
 L7sjywfp2qYbInXjQdA==
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

--------------0Hl2gXOkEd0rrIPAn2K8c0Ot
Content-Type: multipart/mixed; boundary="------------vpoqzEZcOllqqNTixDjdWFP0";
 protected-headers="v1"
Message-ID: <a03d7321-4394-494f-86fb-b0394d5c4148@imgtec.com>
Date: Mon, 5 Jan 2026 13:52:26 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/imagination: Align rogue_fwif_hwrtdata to 64 bytes
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Frank Binns <frank.binns@imgtec.com>,
 Alessio Belle <alessio.belle@imgtec.com>,
 Alexandru Dadu <alexandru.dadu@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 kernel test robot <lkp@intel.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <CGME20251222225350eucas1p1fc7c096318a7780ac7bdca8f63dc7ca1@eucas1p1.samsung.com>
 <20251222-fix_imagination-v1-1-0ac80a2ff317@samsung.com>
Content-Language: en-GB
From: Matt Coster <matt.coster@imgtec.com>
Autocrypt: addr=matt.coster@imgtec.com; keydata=
 xjMEYl2lchYJKwYBBAHaRw8BAQdAOYlooFfHTXzAQ9aGoSnT9JS9wq8xprG+KVLbkxJDF5DN
 JE1hdHQgQ29zdGVyIDxtYXR0LmNvc3RlckBpbWd0ZWMuY29tPsKWBBMWCAA+AhsDBQsJCAcC
 BhUKCQgLAgQWAgMBAh4BAheAFiEEBaQM/OcmnWHZcQChdH8KkDb5DfoFAmgHpowFCQlsaBoA
 CgkQdH8KkDb5DfqxDgEA81pbVLJDmpFyFZLRhAGig9rgoDY6l774yhTzRVm/SvkBAJLzpSlm
 wyQaQuB668TKOX9XvRLKFGjSq5kkdQcxqjkCzjgEYl2lchIKKwYBBAGXVQEFAQEHQCaVC8X5
 7NOv2jNbeXqjP9ekY7rzy7auiEZ5PxaDWUQVAwEIB8J+BBgWCAAmAhsMFiEEBaQM/OcmnWHZ
 cQChdH8KkDb5DfoFAmgHpowFCQlsaBoACgkQdH8KkDb5DfoK+AD/Q4aN/zUvP72RRE4cNWpM
 MXeRXg+LTN+OJ24U10LltxIA/2w3kDqMC/0t1oqO8TM+c2LMWO/x2IBkG7oRZ/hVw1QI
In-Reply-To: <20251222-fix_imagination-v1-1-0ac80a2ff317@samsung.com>

--------------vpoqzEZcOllqqNTixDjdWFP0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 22/12/2025 22:53, Michal Wilczynski wrote:
> The build fails on RISC-V using GCC because `SIZE_CHECK(struct
> rogue_fwif_hwrtdata, 384)` expects 384 bytes, but the compiler generate=
s
> a 336-byte structure.
>=20
> This is due to an alignment conflict: the inner member `cleanup_state`
> requires 64-byte alignment, but the outer struct is explicitly marked
> `__aligned(8)`.
>=20
> While GCC on ARM64 implicitly pads the size to a multiple of 64, GCC on=

> RISC-V strictly respects the 8-byte outer alignment, resulting in a siz=
e
> mismatch.
>=20
> Fix this by aligning the entire structure to 64 bytes, which resolves
> the contradiction and forces the correct 384 byte size on all
> architectures.
>=20
> Fixes: a26f067feac1 ("drm/imagination: Add FWIF headers")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202512131851.1WNXk3BC-lkp=
@intel.com/=20
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>

Hi Michal,

This looks fine to me. I'm surprised the behaviour of GCC differs by
architecture though, is there a bug somewhere or is it UB to explicitly
narrow the alignment like this? Either way:

Reviewed-by: Matt Coster <matt.coster@imgtec.com>

And I'll take via drm-misc-fixes tomorrow.

Cheers,
Matt

> ---
>  drivers/gpu/drm/imagination/pvr_rogue_fwif.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/imagination/pvr_rogue_fwif.h b/drivers/gpu=
/drm/imagination/pvr_rogue_fwif.h
> index 172886be4c820a32ae1b08d62bf0814250f2a9bd..1ba2a167a38b31911e08469=
23e4dc70626f5ca65 100644
> --- a/drivers/gpu/drm/imagination/pvr_rogue_fwif.h
> +++ b/drivers/gpu/drm/imagination/pvr_rogue_fwif.h
> @@ -2170,7 +2170,7 @@ struct rogue_fwif_hwrtdata {
>  	bool geom_caches_need_zeroing __aligned(4);
> =20
>  	struct rogue_fwif_cleanup_ctl cleanup_state __aligned(64);
> -} __aligned(8);
> +} __aligned(64);
> =20
>  /*
>   *********************************************************************=
*********
>=20
> ---
> base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
> change-id: 20251222-fix_imagination-8ef0c94122c4
>=20
> Best regards,

--=20
Matt Coster
E: matt.coster@imgtec.com

--------------vpoqzEZcOllqqNTixDjdWFP0--

--------------0Hl2gXOkEd0rrIPAn2K8c0Ot
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCaVvCGgUDAAAAAAAKCRB5vBnz2d5qsB0c
AQCCJd87xotONcFa8rvjCyDoEOBrRN83S0SMhQVx3X6zBQEA3jCEozsiwc1sEskUro4n/BC1hCa4
xF5OR40E2MmLygI=
=ORCY
-----END PGP SIGNATURE-----

--------------0Hl2gXOkEd0rrIPAn2K8c0Ot--
