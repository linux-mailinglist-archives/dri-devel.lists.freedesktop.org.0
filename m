Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18AF89A42AF
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2024 17:41:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91F7210E17F;
	Fri, 18 Oct 2024 15:41:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="OYTttFDn";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="Dd1qWmpy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DE3F10E17F
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2024 15:41:43 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49IBOtc3029211;
 Fri, 18 Oct 2024 16:41:26 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-type:date:from:message-id:mime-version:subject:to; s=
 dk201812; bh=IihoLvGBawCXUU0DmayHeYLz7wx8GY2G9eF14yEDctg=; b=OYT
 ttFDnN0RPx0Vi75Ap7OlIa/86/+dK+G6MjAkZnTb/qSmUuJYSXhhoQ1JA77Uo7LE
 /jpolyBJOQ/9i44J3Vc/9u+YTwk8NJALE+nhDo275iMVWK1TbRw06Fu9Jh5s1mf+
 DcEerUfGvn2vq0y6lHDGw1XvC7TZpO2pYwVpH9O3fKUUwOWXgkKHXUNdJ+s+tOzG
 aHvtoL6+C29YWadxzbDAgjjHus1fvvH++6dx4PpiJ1lSR6n2JNyWw5Ofq7U3+4wh
 GNQkamvX9B6S8zLzejrgAS52UYjNv4UT5iGZ42/zjcAcJ4i2tEUPUeiDN4R51D9B
 7oUNqT17q+36QJeZidQ==
Received: from cwxp265cu008.outbound.protection.outlook.com
 (mail-ukwestazlp17010003.outbound.protection.outlook.com [40.93.68.3])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 42a37vb3fy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Oct 2024 16:41:25 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GsIu7G2eU0CyjJYv3FR1QNg/sXOrCyIktO9HnkZq0qKqBHqVg2GNs1CifJapDNoJgNX96XUzcEiVfvjwHVn9ZHM27xQJegSBBizQStMsdGIIGJYmSVIfpBBBot1fZHyT8iY5UUPoZS9LBjo+J+pJPte4TeEc9C4sIqNBShmv7xyvmcBPz0MB9GMR2UFec38r46VpwaHDxdILSBccWfO4Sz+nyijL3fwfY5N6/kVyul91lkz8mQR4DdkZKX5BncsTkOsiVggnE5coWahPU3i2oRN2XRWiulR/ASEqBDeLDyToMuieMFC8iI0ADc2ezYaiqM+5stTejjsam4udwnkKig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IihoLvGBawCXUU0DmayHeYLz7wx8GY2G9eF14yEDctg=;
 b=rMb2LPWqHSw/k/WnoqJBlauv9VZLsrgfsQ7kyQHziWm3iEwhbxM4jyiKxxasWCoDlI8r9r8FKVPUzIC7MwTstp9IbJ+dd6kno4EwXYTQj3tacRvzi2V2QM4nww08MLkxfS57psIJ/k19M/xGkDsEXGVMtkQzfpXeZ3gcdIQecXWl8Q+fwIgfMPeMhDmyd5LeWEc9g3JD4Sr/IWBdNXbCBhvYddd8aLQQXt43zDOUT06Fn9lHX3oJ2X9YIEFRWA3izG71sRu82tXCYrKVuNcP+uJGRzmyT0J360rMMkjQyTYQwu2oswHDEGCT4syGyRVUL1LZ/jv3UElXy/Mu4YuwOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IihoLvGBawCXUU0DmayHeYLz7wx8GY2G9eF14yEDctg=;
 b=Dd1qWmpyfn0Bm5Gy9+vKNT4DazwxfsTAUid2BDO4fVJlXcm/0rJvsPqHAt1S9UAMXJRO0X6smrXkrvYar5YJM8mBWuVp6Pv4J24r1tfBPzKNcnu0RdS0OrrkKTcHBCrcj5HpgOBJpeTrT/WwfbF9oGCmCuc/9mXK9F6FUzGSrpg=
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e7::8) by
 CWLP265MB2259.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:6b::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8069.18; Fri, 18 Oct 2024 15:41:22 +0000
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15]) by CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15%6]) with mapi id 15.20.8069.020; Fri, 18 Oct 2024
 15:41:22 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: Brendan King <Brendan.King@imgtec.com>, Frank Binns
 <Frank.Binns@imgtec.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 0/2] drm/imagination: Break an obejct reference loop
Thread-Topic: [PATCH v3 0/2] drm/imagination: Break an obejct reference loop
Thread-Index: AQHbIXQuboC/3/MB806N35xCePd1hw==
Date: Fri, 18 Oct 2024 15:41:22 +0000
Message-ID: <d35a7455-1ed7-44c2-94fe-3d211a8a5e94@imgtec.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWXP265MB3397:EE_|CWLP265MB2259:EE_
x-ms-office365-filtering-correlation-id: 47348a7b-3458-4065-5891-08dcef8b515e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?L2pBUU9YaC9XUTN0Z1FPRTNFd3FWL0lSTkhNZE8xRGNoY1M3L3FTZnY3T1NI?=
 =?utf-8?B?U25idWVpaE9BNG1mREVCanliTGJxa2tJcExGUTA4a2JuZDJPV1RaR3dyS0RG?=
 =?utf-8?B?VytFS284VCs2WjNPT0tCb0xialVlaFc0aE5FOXY0NUh2ak56bVhPSnR3bjEw?=
 =?utf-8?B?QXJBZGVtWTZjWmIxY1JtVnYzaGlRSVhha3ptZUZDb2JROW5zQ0QwRUdJdUpU?=
 =?utf-8?B?c3Q3L1pHVG9aa0MwUEdzZU9JcWE1aWJSTTUvNUJPRlQ2WEpPWFNwUGxueVho?=
 =?utf-8?B?MWJBby9zTUhMaldoNklqelpiQUNJRnJ4MTFjdytmV2F3VFVtOUlhVytFZDR4?=
 =?utf-8?B?VGlwRFJ3ejZuSEt1YmFyOVZTL2VOSlNFUW5TTnBGSVNXQmJLZUUyNzBKRkU4?=
 =?utf-8?B?TXJZbUM0bjNUNU4vbHdxc3YvUHNDMXJ3OGRNS1pKQytsM0g2VFRadnRndmNn?=
 =?utf-8?B?Z2tFQjl6QXVkLzZwQjZJZ1NIaUV6RUdjYzAvaEFReFV3UXNXcitLNUNjNmw0?=
 =?utf-8?B?SWF5c282MmZ6clNQa1VKUHViZldwcDBwL0duQjNlNWRBMCs1MnA4S2Q1UHFV?=
 =?utf-8?B?YzNSVGVUa1RBd3NTK01wWUFXZmlQd3I2MFBPYlQwVXVsdzVsZkRTNUxQWXlF?=
 =?utf-8?B?WjJvVzJYQnZsUjBlMmVNeCtBRDFJNVdMY0VpVjBYcmNUNDFSeDdwNUs1MXJJ?=
 =?utf-8?B?Skt2TUFMSDJ4NE9wSHlGS1FZNFZCN245dFg0eDNtZWlCZ25JVk9RTnQxZW1r?=
 =?utf-8?B?cERQQkcwdkp2R21yU09vRWhHVXlyMGd2eGFZK2pEeUxzcFBDVWtrSXZwUU1L?=
 =?utf-8?B?VnE4TTM5bWpHTWNPWFM0U0NPWW1seHFVbmw2Z1hwMGJ5SEJ1WVVjL0pMZjVD?=
 =?utf-8?B?aTVsVVlDY2FVT2RyUERCb1BqeC80bmc5S2xMM2lkUDVqTzZGQURqeFc5M3pY?=
 =?utf-8?B?VlVZaWZXY0dGQ0YxQWhFNkh1ZE5YRVJpeE5CQkZBNWd2QlRDallnMTRQWGZ6?=
 =?utf-8?B?RlBOT0xoVTlGZFhvck5DQmlhaW5SOE8xb09lSjdtKzBRcHdPTFR0dHpSZjNE?=
 =?utf-8?B?YWVZRzQvemNEL05uaUpNUDBkWnd1UTFjTUlDam56NWRidCt5OUFsQ2IrZmJS?=
 =?utf-8?B?T2V6ZGZKOXovOHBxWERxY2NhVk5IdUtTN0VyUVNhTTluaEJpM1Ztck4ySUZk?=
 =?utf-8?B?YmFpbjIzUjgrREZHZDVjRXFIMmJKZjJkdUdRZDQrKzg5bXRVcEluZkFJM0Zz?=
 =?utf-8?B?WWJwUjZMNFFEZXdUdVRnZmIxbXRyOUVMdm5tY2s0UUp5SGNlN2pwSzAvSGVK?=
 =?utf-8?B?SFZzZGtqaEpPYzQ4bmRqNjMzcWFOb2JPSnRjN1VNL1RyYkdlZm51NjdQV1V1?=
 =?utf-8?B?UDJiK2QyQ1VGamE5Sm9DTmlKSEhaL1ZiWGZLSHkxVEpVbkZFZzRRazQzdFBr?=
 =?utf-8?B?STlwaVRvdWRESzlOa2RGb3F3RE9TSFZOOFAwQzhLa3hKWXdUS0w2ZDV2MHdO?=
 =?utf-8?B?NC9jK01VelovVm1YVmpxVGlmaFhBWUZXSVQrZXNlTkJxTDFNZFRNQzcvOTVt?=
 =?utf-8?B?bFNtc0NhN2p5RTZrUDBiQURCT0Nvc0szRERZYkgydmQ1NTluZkZnNmxWODJB?=
 =?utf-8?B?UFhtNEhxWUlPRVVIWmdvN2F0OHk3NjM4VzBvaFRyKy9SMU5QQXBVazQ5MVZy?=
 =?utf-8?B?S0Z4RkVoOXFweVlxdkFaVUV3T3B4UzBhMUNEWUhOZmFaS3ZnbHh1MUhoeFEy?=
 =?utf-8?B?K0s4RURQdk94WG5HK2NaTVZPa1FQWXFYMFA0NkwyK2R0M3pMU09lQklIWXpw?=
 =?utf-8?B?U3BaYUNERXVTYjVxSVkrOERLbTU1QXdKNTFMejZWY0JrTUJYL2RnaGpmZVFP?=
 =?utf-8?Q?0PB0RKCF5HVaF?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WEUxUFZScmM3WWdQbEZkcllENnZJeUswOTNkZzZTc2JCLy94NjdFcWdTNjN6?=
 =?utf-8?B?ZHc3WTRBL1pxR0wvQ0RSNlcxblBENG5FVkRNL0xMWU9weC83czdkS2RwV3J2?=
 =?utf-8?B?cnp4SE5xbjJBRVRzQWVReEp5Y0ZId0tmS3FvTFJET1l0WG1yVmR1YmxmQUta?=
 =?utf-8?B?Rm9nVmZWeTd2Z2hlS0pFenZnK3dPc1IzWE9uZVpSelBadUZycWVKazEwZUZy?=
 =?utf-8?B?S0pjcUFwNnRnNlVjdlI2WldxaU1nZm52VTZodTIyK1ltNWR3Q05hcTI5R1Mv?=
 =?utf-8?B?dll4aVdUVHVLcVYvYU1ITmdONzdmWUltZkhTbUd5bFFrZ2h0UDN1SnpmZFdP?=
 =?utf-8?B?Yzl0bmtYWVBmMFUrZGxBbHVqQTlncStOMHQrcUlrNDFhc1BhMEVlVVlLci84?=
 =?utf-8?B?UUZUL3lPNytQV3BxWlVtQ2U3QmttQ0VzcmR1Y1ZSRWc0c1hjYW96ajZnVDIr?=
 =?utf-8?B?U2toNW1WODgrSU9JYTN4a2V3dWx3VTdxeWswZW41RU9odXI5QkZQTWtDeHlN?=
 =?utf-8?B?QXRUSTRmMmd4T1VHRzVDaFVjMWMzN0pTc0MxOXpDU1gzaFEzeWdhOStFSEFm?=
 =?utf-8?B?c2daenVRVUNaeEpuWGlDVFdOTXUwRVdLaXFpcnpqS0J0M2ZSMGZFdlhnM0Nh?=
 =?utf-8?B?aERvK0svQzVVVkhMQXFZMTNoUld5cnRDMGxwVU9jN3ZQMTBBVzZtTCtvOWNu?=
 =?utf-8?B?b2dmQTRjNURETUN1SDdza1R5R1VOK1BKZHQ5akVEV1MySUdYbUhKVlEvMWd4?=
 =?utf-8?B?REwvWVNVeVY3ajlTTDJxalJndHhYL0tmajlDUnYya2R6VEwzYXpHRE1GMnhD?=
 =?utf-8?B?MFBiQThvR00xTFhGZ0Nld3I0MmhJWUVmNjErMkdKbFU5aEt1THhnZGliR3Jk?=
 =?utf-8?B?V3M5U3ZBMzFqODZvbUFmZEZ1SjRUbDZSZ2pKK2Q0UXNsUzhTUFlMN3ZFdnBF?=
 =?utf-8?B?NS9TampyZHNNdFUybGZmOUc4cEJIdmZXK2tZcEFXdFA4UlZGaXQwMzFQUmxJ?=
 =?utf-8?B?QjFZNVUzb1hSVDdjTzFFTWpWLzRWby9FMm9yOTZ4MjlyME42SDJFWXc4a0Vu?=
 =?utf-8?B?UmVWSWl5WTVnQXRIMTNWendlYU8vTUhGRGkwUkFUV3E1UzFuc3ZSaFFVem9R?=
 =?utf-8?B?U2NHeENKdlFNKytzcVc3UHovWTVaKzZZZnZvYTVMU09aK3EvdUZjNXFvcUZ3?=
 =?utf-8?B?a0VNajZ1d0xYTkNLdDBFSmNqb0hGNnJ5WStRWFNCNjBnVHpPQkhxclk0UTUy?=
 =?utf-8?B?WktuakRzZGNzZGlQMS9xTUtvWmRiNnpuV2QzNVhpbUdVdjQvRE9QQ0FCUlAw?=
 =?utf-8?B?dm84c3pYTmJDWHdrenUzZzAxVXhTcHhXZGhFbTdhSU1iTmlzQkJiSEVrTkhB?=
 =?utf-8?B?SnR1MmV5Q0JLelBLNDdjL1FkMG1PR2pFbGYrQ1E3Y2FBM2dMczlpaEtrS0Zl?=
 =?utf-8?B?Rmk5dVF5OXZDczRwWDA2cjB0K3RsRklRdmtFN2ZYSDZKTkZ2ZmU0a3Rkd1Zm?=
 =?utf-8?B?NHd5ci9xd2RlZjVBQ3pYRlEvUXBhc3RTWlhyQXFyQS8yVERUMjNFejRLeU0r?=
 =?utf-8?B?Q0NCY280Qit3cDJ5bUhpM2pQaG1YRFlEczBYRjRYYUJFRThFVE9Oa29hc1hE?=
 =?utf-8?B?Q1IvT1ZiSDRrREhyTy90WEpwK3pkUnpXUXJLMGp6Y1U4Y0NsMDdTUmFpeC80?=
 =?utf-8?B?ak9XMjY5cTl3SDZ4WmxXZ1l6SDVOWGE4OWVCQjRJUFlxR2NXa0NaR0tSc1RJ?=
 =?utf-8?B?T2hzR2kwNkJuMHBFZ2ozK1VIbjhCVXFxR1A1cjRYd1JMTW40cmMwVHNpMEl6?=
 =?utf-8?B?ZFc0TUtobW94QkZLUEg3dkEwdHI1KzdObHUxQUkrcDZkMXU2dFFhcHE4bS80?=
 =?utf-8?B?T3NvRFA1WWJzNVViZzhzUTBvMlNwOUhzY214S3ZCMUJaczN1K3I2UTBjdTF5?=
 =?utf-8?B?SlpLbnhoeXlwQnYyWlc5djNxb1AyZG1na2ZyZHY1L0hxRjhtQ2toUmNiSHRT?=
 =?utf-8?B?Vk1DMXo2TDRuc1gzOFZxWnpQWnI5anZVV1A4WUpVR3ZYUzIxZHE5cXRIczNm?=
 =?utf-8?B?WEVNRGRINlNpdUNWRmxXN3ZtempsUGpDcGFWV2Jrd0VXYzlsRU5DcmduUFdv?=
 =?utf-8?B?d0EyRU1ZYVBhNlpVUnhWVEVXK1pBL1ZTcitkRTlvb2JrakdaY3U1dkdWVHpJ?=
 =?utf-8?B?WlE9PQ==?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------wjVVne3GJr7aA9eCVX1JAaa1"
MIME-Version: 1.0
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 47348a7b-3458-4065-5891-08dcef8b515e
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2024 15:41:22.3948 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /pw0RkEZnZrhlmUlbjXnXvE+yrnn4jPWjvGaoJo48GA2w99PzrZiqTxjVj8x9JmemM3Y/PiavgnpUZ5aJys0bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB2259
X-Proofpoint-GUID: 5k-55ST8QpNpCRmMVHOMG_2mXQUmhg5r
X-Authority-Analysis: v=2.4 cv=N5V7FH9B c=1 sm=1 tr=0 ts=671281a6 cx=c_pps
 a=Du42DVBbjaS4S3NNO6dabQ==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=DAUX931o1VcA:10 a=WnR_qW7rlZcA:10 a=NgoYpvdbvlAA:10
 a=VwQbUJbxAAAA:8 a=r_1tXGB3AAAA:8
 a=Eu8HcYkoJM88dJRg7BoA:9 a=QEXdDO2ut3YA:10 a=4dGhhBZ303MdWhY03bQA:9
 a=FfaGCDsud1wA:10 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-ORIG-GUID: 5k-55ST8QpNpCRmMVHOMG_2mXQUmhg5r
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

--------------wjVVne3GJr7aA9eCVX1JAaa1
Content-Type: multipart/mixed; boundary="------------te20XjzhHpdR3O8MtFwEuHmG";
 protected-headers="v1"
From: Matt Coster <matt.coster@imgtec.com>
To: dri-devel@lists.freedesktop.org
Cc: Brendan King <brendan.king@imgtec.com>,
 Frank Binns <frank.binns@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-kernel@vger.kernel.org
Message-ID: <d35a7455-1ed7-44c2-94fe-3d211a8a5e94@imgtec.com>
Subject: [PATCH v3 0/2] drm/imagination: Break an obejct reference loop

--------------te20XjzhHpdR3O8MtFwEuHmG
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

When remaining resources are being cleaned up on driver close,
outstanding VM mappings may result in resources being leaked, due
to an object reference loop, as shown below, with each object (or
set of objects) referencing the object below it:

    PVR GEM Object
    GPU scheduler "finished" fence
    GPU scheduler "scheduled" fence
    PVR driver "done" fence
    PVR Context
    PVR VM Context
    PVR VM Mappings
    PVR GEM Object

The reference that the PVR VM Context has on the VM mappings is a
soft one, in the sense that the freeing of outstanding VM mappings
is done as part of VM context destruction; no reference counts are
involved, as is the case for all the other references in the loop.

To break the reference loop during cleanup, free the outstanding
VM mappings before destroying the PVR Context associated with the
VM context.

This is facilitated by tracking the live contexts associated with each
list, implemented in a separate patch to make the main patch cleaner
and easier to grok.

---

Changes in v1 -> v2:
 - [PATCH 1/2] Add justification to the commit message so it stands on
   its own (e.g. during bisect)

Changes in v2 -> v3:
 - [ALL] Add Frank's Rb [1][2]
 - [ALL] Add Cc: stable tag

[1]: https://lore.kernel.org/dri-devel/1a206b08485a1ebea0aeff5306c0f5b6eb=
7c315d.camel@imgtec.com/
[2]: https://lore.kernel.org/dri-devel/b75e658cc5ce9ac24df2c31c1a6fd798a5=
f3a87f.camel@imgtec.com/

---

Brendan King (2):
  drm/imagination: Add a per-file PVR context list
  drm/imagination: Break an object reference loop

 drivers/gpu/drm/imagination/pvr_context.c | 33 +++++++++++++++++++++++
 drivers/gpu/drm/imagination/pvr_context.h | 21 +++++++++++++++
 drivers/gpu/drm/imagination/pvr_device.h  | 10 +++++++
 drivers/gpu/drm/imagination/pvr_drv.c     |  3 +++
 drivers/gpu/drm/imagination/pvr_vm.c      | 22 ++++++++++++---
 drivers/gpu/drm/imagination/pvr_vm.h      |  1 +
 6 files changed, 86 insertions(+), 4 deletions(-)


base-commit: 83f000784844cb9d4669ef1a3366479db3197b33
--=20
2.47.0



--------------te20XjzhHpdR3O8MtFwEuHmG--

--------------wjVVne3GJr7aA9eCVX1JAaa1
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCZxKBogUDAAAAAAAKCRB5vBnz2d5qsFsI
AQC/9D6nM7wxfLVqubu1YRTUu4Z1PWSSS0DQHH18AkDydgEA4aEV/SoPSgwnyXYSlU68QB8Ccb/O
+1mM1Y/rFsqVtg8=
=otZX
-----END PGP SIGNATURE-----

--------------wjVVne3GJr7aA9eCVX1JAaa1--
