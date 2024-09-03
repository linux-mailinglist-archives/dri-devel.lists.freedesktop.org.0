Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC22969875
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 11:15:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D93610E365;
	Tue,  3 Sep 2024 09:15:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="ZDo9z+EH";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="qiPJNLVz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35DFB10E365
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 09:15:11 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4836QXDN010272;
 Tue, 3 Sep 2024 10:12:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=dk201812; bh=nIBp3G9ygtqAPDyfG0hlsi9R6
 2uqI4pPgSIQk/qrwiI=; b=ZDo9z+EHnDZb82u1kLwYIc/HfHvW+V0yotRfhgCQX
 EOPE0FXzm0256CRKMKx/YF0sQF3/ufrzY+P0oZD/DsB/MSE0sX12AjQVYym2vZhp
 CSZsnZvbIo7NkyHtOQRblKsCG+10UixrTRuKi8WQaqUkEhQUyAjDBmdHt4To1kGP
 ksK/8uFJaztOu/6KH7mBAiIX5ZUVuZlhz5Kd46m57Qjj5DYOhen5eXze/dOgb+Io
 vlyCxjm6S+pTVVUlwvZ/BmP1CPmij2hAz5DKQl/y1RR8q/46qa2tXLnEyhQk9F3X
 P7D3+5BSzwm3IcHd3X3O6mw9j3Bi/jh7YcA7ZIKz+/jCg==
Received: from hhmail04.hh.imgtec.org ([217.156.249.195])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 41bu8wad4c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 03 Sep 2024 10:12:45 +0100 (BST)
Received: from HHMAIL05.hh.imgtec.org (10.100.10.120) by
 HHMAIL04.hh.imgtec.org (10.100.10.119) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Tue, 3 Sep 2024 10:12:44 +0100
Received: from CWXP265CU008.outbound.protection.outlook.com (40.93.68.3) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37 via Frontend
 Transport; Tue, 3 Sep 2024 10:12:44 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uaXvNYtiCGWezgi948wZRrsNegrz0YeLwXew1GMCzH63KvN0dDZVAr82AJtq84Lap9n8U3Yo7ON/2c1QccCqjgFTmaeooXjsUzN8nQUv8Uvhp4vXJ1XKPjtaJX+BcIDEjsXyeJEZT5rsbyxH423ULl1b6yHyKkjo8T2RXttdnIUsg9wf+HTt2g8ltO2v42oneDUNX36qpXq6PZlf6JHf2V4u6/FWiGL+NhYEmhD/1Iy8zoPDMx21wqr4giRBt3v5U8f4/as8PvXXf9mgCykdcVVI6StoSuIWtAS5zTPCAs0iDVnulXb7wAtLTJya/6UrP0i3h7yL0v0EGnme2cTWVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nIBp3G9ygtqAPDyfG0hlsi9R62uqI4pPgSIQk/qrwiI=;
 b=HteK1NNZxIGClxtJPhQUiHXpyKiHIMVmhyMeeEA0ghhCTERjWPx6KaEUSO/GX8tmDmwB6wP4k3rcsh6/0RnEYf5/x51Q2SwkgQksymOu3TFRuwB1FYUVAs/C3GcpqYMzofF3WVSWU1tjQ3prhMMyCDdl3titzqxniMDdN7C3EZ9De8JgdCLNtceze40RUFfSZYman0cF937JsajvgJnyzdeG+kO02wmzJ/j9Bk7M0//cc9q67zhYuVg8R+bhPWK+veOtq7uHDF4U1lG89sjumReER93LIKNlRoVVvwjvc4K1LrJZ2BW4jFQq7zHmq/D164j0L5eaoMbgeqkIqIlMFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nIBp3G9ygtqAPDyfG0hlsi9R62uqI4pPgSIQk/qrwiI=;
 b=qiPJNLVzFha83jmwzSFq+6orQXE1TGzjLQf0WcId7Ryrp6ne/YJRg30hiuuHM4x/0NeNuwd3NJ6ie1YM1GVzWgp4CedywuupnuRgrhqUSO8a3LtEYFNk5Shf/hKrRVlO54cuXescSn19+KKrZz0HlGtFi896NdYOi9Vj7cgsLRM=
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e7::8) by
 LOYP265MB2368.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:112::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7918.27; Tue, 3 Sep 2024 09:12:37 +0000
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15]) by CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15%3]) with mapi id 15.20.7918.024; Tue, 3 Sep 2024
 09:12:37 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: Markus Elfring <Markus.Elfring@web.de>
CC: Frank Binns <Frank.Binns@imgtec.com>, Jinjie Ruan <ruanjinjie@huawei.com>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH -next v2] drm/imagination: Use memdup_user() helper
Thread-Topic: [PATCH -next v2] drm/imagination: Use memdup_user() helper
Thread-Index: AQHa/eFrOSE3kI0IRkOan1tyFKaTkw==
Date: Tue, 3 Sep 2024 09:12:37 +0000
Message-ID: <cc1a5b72-2349-4b7b-b233-1a1b90556d71@imgtec.com>
References: <ea4ec650-d858-42c2-ab59-e17824069ba9@imgtec.com>
 <8d30da7f-7a12-4052-b846-66fad0ccb392@web.de>
In-Reply-To: <8d30da7f-7a12-4052-b846-66fad0ccb392@web.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWXP265MB3397:EE_|LOYP265MB2368:EE_
x-ms-office365-filtering-correlation-id: cf3f3330-d9f7-4635-b9ac-08dccbf88def
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?bjBFanYzWERQL0Vneno0eTVyM3h2SHFwZFE4OHF0eDFDMnhCaXZsQlc5NE1M?=
 =?utf-8?B?NGFJbmN3YSszcGwzcS9BVWNidjl1YnZRMlk4TWZBZS9rRHdQV0taWSt1dXVG?=
 =?utf-8?B?bGpuMVdHUHhVclc2YVVINGJrSU9uempybmQvYzVjUzRvZU84NVNZcWh2cUQ0?=
 =?utf-8?B?Yy92U0hnbGtJTTBtWEpDcWcrOENxMHk3dndRRnorR3hHbElvcHh6WWpKQmJN?=
 =?utf-8?B?cUJkTmw2TUxMYVpaZjNQMGY1R2VHYzdpcVhIN29PWHFhMldTV0lVVEU2L21l?=
 =?utf-8?B?T1poRkFBMUZCVzAyVFJ3YWFBRmVHSDZxUzRvbjhMTTFMR2Z6VEV3dmVWRTBF?=
 =?utf-8?B?WEhZcE9GU1FaRDF2RkNZaWN3anZIa2lkeXNYdVZYOEE2L0wzbkZENkI0OGdQ?=
 =?utf-8?B?dlBpdkw1WGEyWUUrcHRFWmZ4VnJQZFRkVUxXMTVaeEFWM2NrUXhQWDB3ZDR3?=
 =?utf-8?B?SEJnMGFNdm9TMHhEMGtXbnE5VCtmaHpBblp1aktOaW5RSXpMMisyTEVLZTNm?=
 =?utf-8?B?WUxoWTlidVVQSytnT0YrWERUd0ZOM3NQYjE1Sm9ldkxvZWhtZHJUNTNCZ0ly?=
 =?utf-8?B?QjVsZGZlQTZEZXlWaUN6aFpLbno4SldDOElCN001MXJnemczWUVPRU9Nc2h3?=
 =?utf-8?B?bGdFMHRONDBCdVZCa0NINm8wTWNjbHJQbU5RcmVId2lxZHNHTHp1MXZNN2wz?=
 =?utf-8?B?Y0s5allEM2wvdUlYOXlWQzA1OVVzUzJnZkcwVjBzMXRMQlc2ZHlJcWZiQVUz?=
 =?utf-8?B?dEo5amVIZWUvUGxldWJrUmtGZXhPbElsZ01IUHRUUndFNTlaSGp4bGh2VFZ3?=
 =?utf-8?B?ekFNb2JZSk1QNCtWUXVxUmZNK1U5Z3NuNEJTV1JtaEVOdnJBQ2w0b3VoQ0RX?=
 =?utf-8?B?Zmd4cWpnekhPdUxId0Z1WkluN0xZa0xhaldHNDFISlFDWms0eEdVRlhFTnNy?=
 =?utf-8?B?TmZ6VWx4NjBvV1BTaVFyNE93SXNaVW45b25GWkt3b0NYUzB3SEdpZ01wUUwv?=
 =?utf-8?B?OXVmTWdJWmtyeXJ2ek1Ob2pKaC9aRndpdUdlUDdoLzY1OVdmcHlMUXhJbzky?=
 =?utf-8?B?YXFwUE9RNWdBUStWUTVKcHB5M0IxMUZOVExkenNuOGJoSHNqWWxZcWdYRVM4?=
 =?utf-8?B?TjJEcFlWSm1VTFl3aFlwQ1c4K0ErSUFqMng0T3B4aXJMc3JMTG1ETVFWeHhN?=
 =?utf-8?B?U1FxemVtUlo1VmJ2MUJTeERJcllKd2g3RVZ4L21OeTRtdGh4N1lUdDh0OUtv?=
 =?utf-8?B?bEU5K0dtZ1Uwb0VKQndKZ2JrbDJCajZydE5aTU41NUNxMnZYWjNWU1VSd0NR?=
 =?utf-8?B?eFFsaWNoVGVlamxuVXV5bzVFeXpYUjdPemNoSnNXdExyb3dGZ0hNOVhVS2tM?=
 =?utf-8?B?OFEvMHRIbHBmeVNqRHlHUGtBL09nMjBFWnF5dzFVRTlmVzd0V0VLYjN0T3JI?=
 =?utf-8?B?NTNxZjRON2F6cUZaN0puRzF5bnZISC9aTkZjNkdWNU1QNFNGd3dCVzd0OFhW?=
 =?utf-8?B?VGFVc0dncXdVMzdNV201cDgvNnlCZkJXRjczK0dtcVlkUVFwWVNwWm81c3ZN?=
 =?utf-8?B?UzVmTkV2UFFYeENaNHovSGVaUlBNcVJLOHlHNVBDdlNaRzVRcTNBbDUxRVNt?=
 =?utf-8?B?ZzlPd0NUTWVzZkkwTHMyeXM1Rlg0dGdWRUJOS0dFVUNlam1FQXBPZWpzV1lt?=
 =?utf-8?B?UmNKRkdZRTF5dndVL2x3VnYyTlg0bWN2ZkxuTU01TzdzYnNsRC93ZFh1OE1z?=
 =?utf-8?B?ZkpvTExBYWJkdFpiS1EzekFITkYwMjJnMUhNbTU1Tmt6Sk5kSS9hNFZ5ZUZp?=
 =?utf-8?Q?N8Mzw7PsRlm8hobgvoHLkjBHH91LHX3jQNLMA=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018); DIR:OUT;
 SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VmF1RVJKdHF5cGd5eENSS3NOa1lDd3NSUWE0emxXVkpDVG5MQmlTRFJkalNi?=
 =?utf-8?B?M2ZhTmpmZ2Roa2g5ZUtxM3Zhd0NXejl3YlBpd0IrN1dodytQRlV1ZHhpc2V5?=
 =?utf-8?B?L0xlY2FiMnJJU0RJdlNyVUpUZlhTMFI4aGNQNHoxUDRWaE1nTElDc0FGMmtr?=
 =?utf-8?B?b3FBenpFdUR5MlJMYVBHTWh2UUFsVTExSmlPZWhVNCtiejhYRXRmOTlwUjQ0?=
 =?utf-8?B?VU44MUFFaFdlVFBTZjVzYmZhM1NCUXRRMHpsTXhERk5za2Zuc2p5cU1FbDVF?=
 =?utf-8?B?NWQyc2p0bG94OHZSOWJDOGt2RnJ4NFc2M3BUU20xR1QwMDNmZVhpZldOZnk5?=
 =?utf-8?B?RldHeEg0V3RnNGVSZVVjK0hCTVJadGlPMTB6Y05VWFNyTUVOTlBzTjZIOXVL?=
 =?utf-8?B?VkNJNkFDNkxzbGZBREwyV1JjUlcyRFFuOEgzYkwwckpydzRDNlpoWGdJeS85?=
 =?utf-8?B?UXluWVBNTlNUOFpPdWl3bW5sYWZyQlRFY05WU3U3Slh3Vy84WkN3S2FHZEJQ?=
 =?utf-8?B?RlVBUlNYMStFM3o3Yk1qV2FuTGsvOXhzL2p5N0I2NVNwc2Z0QlZVdldvelF0?=
 =?utf-8?B?NXJUMGhreVBENFNmdk5udzZPZmZVUDllMEM3V3RwTTJLMlk4NURWcTlOK0lS?=
 =?utf-8?B?WU90SGxRcFNnSENpbmkvZHFiNjNIQkVwRlNKcmxuS2xEZGg2US91Z0F0dEFJ?=
 =?utf-8?B?cTlVSU5XT0poZU9PS0d1ZFlCaDJ3THFiTUl3RjVBTEpJcWZOTU81SDZmcGRZ?=
 =?utf-8?B?U1lJUVppR0tYME55NGw3MGxmOEdrVDl6M2xxZkFQQktQZndtMzAxQm5iT1hu?=
 =?utf-8?B?N0dhY1lkZEY5RWtYYjQ5N1JiUUdEc3JmeWFDN0dYQ2xMNDNNckVaTGI5K2g5?=
 =?utf-8?B?aHhqQ0pKazkyNlpLakp4Y05vKzNNbXdyS0JkdEpSbnJMcFdqdmhoNEdHbWtG?=
 =?utf-8?B?UDdkWE5TNmlKcmZaRElxd3RxTi9hSDVnZk8za3VUcm0yL1NFSXRxcE4zQWE3?=
 =?utf-8?B?REVESkJUeHNzckIrZWJzbnJ6Zk1KZXFwM0dGeFovR3hsaE85NWhhajdVSnc5?=
 =?utf-8?B?RHdLTHliYzJmcm5KT1FNOTlLZGd1amY4ZDFNc09OMmVrZTZ3Mm1XLzl6dUJs?=
 =?utf-8?B?KytUeEhCeHlTd0ZFMTNZSFFlYmF6TDkyd3ZMV3I4U1pYWkJLYnp1bExFbUVr?=
 =?utf-8?B?cW9XYnVMS0hZcFFwZUd2NUtqQmVyWi8zemhNVzU1cWlUajgxcStHWmFnZTJ1?=
 =?utf-8?B?ODE4dXBlYk1iMll1Z3Awa2xxTjN3VlpMaVhyZ1M5dlN6ZGNuR2VxMy9KUUJx?=
 =?utf-8?B?VGNmUFB1K0xqMXY1dnZ1U2VUYTRZUStWQTJkcEJwUzBDYS8xcm1aMUR4UTNP?=
 =?utf-8?B?SFJtTDY1Q3JzMnlpQjI2Rjc1TjRpazlxZWhXaEVBQ0ZzeDlsN1Z1YmpEUHZr?=
 =?utf-8?B?TzlEUkVzZzJhUkRIaTVpN1FuYjROY1lUNlZLZlhwQlhCbEFnUVFrOWU5dmZp?=
 =?utf-8?B?N2MxQWoyUmRJbFVIYklHMDF3ay81WVhaOXlSQ0FJTjNYVkNzTjgwNkt4N0t0?=
 =?utf-8?B?aFFWdWQ4Y1ljb0RTWWdhUXJaeWs2MHN5Rkg2Mmk2aGw2cXZYY0FIYWZzemhu?=
 =?utf-8?B?OUlaU0xaam1scW81S3JUMHRQNDFKdXU2M1ViK1hnZkhkNVJyS2JFSjM4UHJV?=
 =?utf-8?B?OG9MWEpLZzBwYWU0MThlQmtuOUpjcFRUNlFIN2ViQURkZTJGZ245Mm9QaXh2?=
 =?utf-8?B?cU41dlJpNitRNnRkald5bWs0WWY2L05lcDZtbkh0Vzg0VzVvelNHUVZoT0hD?=
 =?utf-8?B?c1RiWUhwT2ZXbTE3N3ZxODBaTHlUZElkSXkvbzl1dTJnSW9sM3VCYUYwazla?=
 =?utf-8?B?UEo5UE1sRHdVSjdRQWZ4aFN1Y3NKSWkreXZJb0NNSWx0U2pnTFNxYVBsdjFZ?=
 =?utf-8?B?Mnl3aGZYMGZIc3lkS1Q5NWROT1VPU3JKejNsM0ZYSnk4UHFKaGVBNzYrOWhH?=
 =?utf-8?B?elVHQUpVL0w2Mkx1RFVtL2lVOFhTZTF3TSt3TzNHNGUxTlhqOEdVTXZyNmVP?=
 =?utf-8?B?OWRVYjdRWVQzU2t3WG53V0lsUkxMQ1QxVzJ1d3ZiZ281eitRbEdGUklvRjhF?=
 =?utf-8?B?VWpqSTU5aGg4N0RmOVd5VnVPMGIybmc3akpvQ2tiYVJJQnJzWWJ5dkVqSEp6?=
 =?utf-8?B?OFE9PQ==?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Ifw7vs01ilPJ6o0Jui7dmmeo"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: cf3f3330-d9f7-4635-b9ac-08dccbf88def
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2024 09:12:37.3099 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JDywjDfEXF2noMV6bm5NrG43SuBqjUWGS978CI1MEiLokmzqUGDo5INfmgO1ZC2oxr7G8WExGc0qsHgDkzQiVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOYP265MB2368
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-GUID: PU4jthf0-ZmXSfF1kV0KuVlOVGrcgZL6
X-Proofpoint-ORIG-GUID: PU4jthf0-ZmXSfF1kV0KuVlOVGrcgZL6
X-Authority-Analysis: v=2.4 cv=F4AFdbhN c=1 sm=1 tr=0 ts=66d6d30e cx=c_pps
 a=6IdplsTJodF3+aqeaEJcqA==:117 a=6IdplsTJodF3+aqeaEJcqA==:17
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=EaEq8P2WXUwA:10
 a=WnR_qW7rlZcA:10 a=NgoYpvdbvlAA:10
 a=VwQbUJbxAAAA:8 a=D19gQVrFAAAA:8 a=r_1tXGB3AAAA:8 a=SVSD6kIfL3V-oTRnruoA:9
 a=QEXdDO2ut3YA:10 a=ehtUQwtvKtpC87lW4VIA:9 a=FfaGCDsud1wA:10
 a=W4TVW4IDbPiebHqcZpNg:22 a=t8nPyN_e6usw4ciXM-Pk:22
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

--------------Ifw7vs01ilPJ6o0Jui7dmmeo
Content-Type: multipart/mixed; boundary="------------PAOpO7PCpznWasqZ8uYH08va";
 protected-headers="v1"
From: Matt Coster <matt.coster@imgtec.com>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Frank Binns <Frank.Binns@imgtec.com>, Jinjie Ruan
 <ruanjinjie@huawei.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Message-ID: <cc1a5b72-2349-4b7b-b233-1a1b90556d71@imgtec.com>
Subject: Re: [PATCH -next v2] drm/imagination: Use memdup_user() helper
References: <ea4ec650-d858-42c2-ab59-e17824069ba9@imgtec.com>
 <8d30da7f-7a12-4052-b846-66fad0ccb392@web.de>
In-Reply-To: <8d30da7f-7a12-4052-b846-66fad0ccb392@web.de>

--------------PAOpO7PCpznWasqZ8uYH08va
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 02/09/2024 17:09, Markus Elfring wrote:
>>> Switching to memdup_user(), which combines kmalloc() and copy_from_us=
er(),
>>> and it can simplfy code.
>>
>> Applied, thanks!
>>
>> [1/1] drm/imagination: Use memdup_user() helper
>>       commit: 2872a57c7ad427d428c6d12e95e55b32bdc8e3b8
>=20
> Do you find any previous contributions still similarly interesting?
>=20
> Example:
> [PATCH] drm/imagination: Use memdup_user() rather than duplicating its =
implementation
> https://lore.kernel.org/r/c07221ed-8eaf-490e-9672-033b1cfe7b6e@web.de
> https://lkml.org/lkml/2024/1/28/438

Hi Markus,

I apologise for missing your earlier email. In general, we'll happily
accept cleanup patches.

If you feel like your patch has gone ignored in future, please feel free
to ping me directly either by email or on IRC at MTCoster.

Cheers,
Matt

---
Matt Coster
E: matt.coster@imgtec.com
=20
> Regards,
> Markus


--------------PAOpO7PCpznWasqZ8uYH08va--

--------------Ifw7vs01ilPJ6o0Jui7dmmeo
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCZtbTBAUDAAAAAAAKCRB5vBnz2d5qsHW4
AP97wG2PHqYUvFXc4hox23y6GM0qbC6C8SL4vpKuUgVplQD/ep05H0IafR33wWeKOgTuVZzZIoEZ
oHQ4vpxbQi+0+AM=
=abNv
-----END PGP SIGNATURE-----

--------------Ifw7vs01ilPJ6o0Jui7dmmeo--
