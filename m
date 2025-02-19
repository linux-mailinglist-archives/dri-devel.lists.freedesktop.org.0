Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD81CA3BE72
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 13:47:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B24E10E7CE;
	Wed, 19 Feb 2025 12:47:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="oTbD/aBB";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="Ne8l1JXN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9117210E7DC
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 12:47:30 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51JCi8LS019438;
 Wed, 19 Feb 2025 12:47:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=dk201812; bh=fCF6OCcPKIgi1cnAPTjN9b/05
 P2jJYuX977Z8swaDng=; b=oTbD/aBBIbGu/V3neXeIUM1nT58KgB0e6ZP7neGrO
 CjTpjVQ0oR4qsgpJ/r7plLtkFkGzD0CLxvDeRgFbZQTtWmj7OK6CXOuCgrvDOqDe
 kNVeCz848Kd6hgMy+Sv22ZMDDNgHVqAGBI14gKZQPuv5Rdt1G94PM6nKCP9rA1pG
 4z8OiiMoxNONhJgkqO4cwdo5SiXIXAuJnSV/+V18zfkcCux2hUG716/TDhHsuPMc
 GobZBhihHDKbijH9D/M+JRMzO7cBrBn97tvMtGoDBM2v4eLtSvTaMlnvaCRmuQwI
 kR1t/Q1/T87UaeXr6Ml5RBeVRLeujLjCpQ0JAwqRFSzPA==
Received: from lo2p265cu024.outbound.protection.outlook.com
 (mail-uksouthazlp17011026.outbound.protection.outlook.com [40.93.67.26])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 44w4c9rcax-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Feb 2025 12:47:17 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G/SwDM0KJTHyBcVyyFVR5LGUHhWdMJ7waOj2TmAay/G+SNd6I02XInIZrM/fvb+J7qrv5iGJKXbrwz/EDsgXnaQ/25zOslVKLJ/NLjBwiAdtAkIVnLGgKtEdlp0OA/BQAnUFGuAO6jm3Ej01z2miza8c/XGd/LQ42/hZ15gcclPUPuKZjS3YTAngmZEiiMrlvi+Nq8eoXziU6G4X7kxqGjWwjKWQRVPWV9B9PYV3DAvqpQ7HTAc8aycqOe1x+R+EQIQnG9tX1db89l937oU0vd5jjCKt/qEvZfIangU4SINK06fdfc/8g5oj/+l9Vsfxym8nTIk7oB792xzx3jHuQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fCF6OCcPKIgi1cnAPTjN9b/05P2jJYuX977Z8swaDng=;
 b=qHBVHhnahXIrdnOv30iAXZyBwnEKL8RHgaPxR5OYcNQAcyOD7MtXF7gDhtiZZtYxGAVM8vMq1t3zG3YuVpmDunrqPol1Bkr0QAWnCXeIV06oPQ5+OMX+AhhGnRa1eMFDghQhimEdJydMKqwj6sq8dwuvl5g/5Nf7ElhNusG2yn5allYx/3mwGaToTEViszQ9U6pS+vylB7L4HiBiMTp5qn9bC7mIK0unxHn0MxvwtCGyxC4O9e3xm4kqwpY4yM/SEh9+FFcRaJNcmk9owr02tttZKMi5zLA81OPc6hHq54xt9fpkm1h62EMrN1BWKROzQyjV6AYtS/rrXn3CKu74ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fCF6OCcPKIgi1cnAPTjN9b/05P2jJYuX977Z8swaDng=;
 b=Ne8l1JXNyoPnYJdQmgV5tQuMieBVn2F/EkQ1fLhdo7laF4X7nZpTs9QWbb8j0+nlj8IcI/yXlBSlc67ocQSyq768dAX8aKz3Uf+RDHYjrsfM7+8MS2QYwycR6RfK3m2nO9EIHm0OEzdN2ipqZBQeLp2HJmRJ5ALT4jGJ5qWAuiU=
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e7::8) by
 CWXP265MB2741.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:8a::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8466.15; Wed, 19 Feb 2025 12:47:13 +0000
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15]) by CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15%7]) with mapi id 15.20.8466.013; Wed, 19 Feb 2025
 12:47:13 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: Brendan King <Brendan.King@imgtec.com>
CC: Frank Binns <Frank.Binns@imgtec.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/imagination: Hold drm_gem_gpuva lock for unmap
Thread-Topic: [PATCH] drm/imagination: Hold drm_gem_gpuva lock for unmap
Thread-Index: AQHbdlD3PafDAGcY5EWTVNs7wfBQ5bNOrCgA
Date: Wed, 19 Feb 2025 12:47:13 +0000
Message-ID: <c9fd6b74-9714-4261-8c73-1df2bbfa2e3c@imgtec.com>
References: <20250203-hold-drm_gem_gpuva-lock-for-unmap-v1-1-dd1006f39400@imgtec.com>
In-Reply-To: <20250203-hold-drm_gem_gpuva-lock-for-unmap-v1-1-dd1006f39400@imgtec.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWXP265MB3397:EE_|CWXP265MB2741:EE_
x-ms-office365-filtering-correlation-id: f38c78b5-3d93-4fcd-2a42-08dd50e3885a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|4053099003|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?anJCUUVoOHJ2R2t6ZjVxSkhEYXhoRDd3eXZIbkR3TENMTTdhQ2c5UzlZZmJi?=
 =?utf-8?B?Q2NDSVgzMnpFYVl4WGhrdVBuTWR3YUNqR3p5Y2hIUHlJV1BZZmRRWEFZWjNh?=
 =?utf-8?B?ZTBSazhYRDJuOHFLeVhGby9kdlp6dkZzdFZwemMzN0NIUi9hMElqL01JV2RW?=
 =?utf-8?B?cGkyeGMwWitvTTBqZE1IRWlMaWJ1eXJwYlEzcjVUQWRRbkEvRVM1VFN0NTRz?=
 =?utf-8?B?WEx3V2pNSm9NVDIzdXV3SDFjZWIxMko4V3RkeVJiMlFncWZWMkRzLzF3V3or?=
 =?utf-8?B?QllUNXNIUkdUTS9SaTdXOEdZaTZyL0xhTVF5RzhRZ1BzVjVYZGI4aE5HRGNC?=
 =?utf-8?B?am1IU0hwV0RIZXNnb3kxd29KNUxqVS9kVEZWRjVyb28vcmxOS2NFNGZrUWUv?=
 =?utf-8?B?RWRWdk1kaXptYUUzaTgwNWlEeXZJTVhRWWM0VDh0SERXY0grVU44VTNVeG5M?=
 =?utf-8?B?ejM1TjFGaCtncG5URXpuY1RqMGJISTlndGhGVDhnVUxZWmo1aEhRSTlpZmNZ?=
 =?utf-8?B?T21TZHpST1FIOEhlVmRqYUZ6N0JMQnBvdkYxeDB6b0hJU21DcGEwcWwydXJ2?=
 =?utf-8?B?WTRld2hpMllBOERaTTN4TFVjMXI2MjJVUWxOQ3RQN1NmY1JqRUExMExVampV?=
 =?utf-8?B?ZVpBNFVubDdaL2J4UkRiME12UTA1dUx2UXIrV1NHbnpBUG1uQnByeUFORU56?=
 =?utf-8?B?ZFVlYTBaUmxvcUY5OTl3TFdOVEd0UkdqOFpOZkNOOUk0ZFdvcW9PVUdlUGhD?=
 =?utf-8?B?MC8weXNkbXhobll1amhzUWd3NlExcUs5K2R5cUt3Ky9KRVE2T29BVXZ6anBQ?=
 =?utf-8?B?eUJSWmh5ZDRMb1BFSU5pY0RJRy9Ha1A1WXZML3NMSytsQS9YVkJDUkpVanZl?=
 =?utf-8?B?ME5NNjhGMVMxZDcwZ2R6RUNhV3I5VkRvNGdLY24xb1F0Ym15UVR2Z3RMUy96?=
 =?utf-8?B?TXloK05FaEdTYlhsY3Z2SWhBSUQ5dlJTbHRJTExjQlNkd2U3S0hnVFJiWTly?=
 =?utf-8?B?dWdUbDZrbWNIM1pOMk9Ia1pWaXFubW1QUzU1akJTOG9WdTZBM01NWkFDR3pK?=
 =?utf-8?B?NDVDbVRDdWFTR2lBWlZXVm5HeWRIdno3ejdJRmhhd2FYaVo2VW5lNTRTcTJa?=
 =?utf-8?B?NUlZdU1GeVpIdlRISk5yWjdiK1JwM2kra3JSWUxDTjErSXhOa00xcVJabEZz?=
 =?utf-8?B?aXppMW5maU8rNnZ0eEpkdXl2aGE0YVgxRHc1Nm1ib0x2UVNPLzZ1NFNKUXVS?=
 =?utf-8?B?ZHk5cnVoZnVtS3U2ZDljeVVnVEVRVDJYQitNb3FqSFRKcVJhV2VPV094ei9W?=
 =?utf-8?B?eWJVblB3a1lpNmpXVWpPY1M5L3k5N0w1VFpRWitJWk55TFBpYXJ6c2tUK0xR?=
 =?utf-8?B?ME5iUjhJZFFyOWJWWW5qQnlNOEhiUUdWNjNQVm43NGdERzFLOHozMU5OdmE4?=
 =?utf-8?B?NHJJbTVrVWRSYUFYTWVUNGt0RFhvVXRlV0JjcnNnejB4Nk9WT1B5aDd0L0gy?=
 =?utf-8?B?dGV6NXhuY2dTeFVwdUVjMm5EK0c3QXlUckJGbWtFYk4zTkl2SnJVUURCV1Nn?=
 =?utf-8?B?MlhOTVc5RGR3UTA5THlDLzhmU1FOK3lncTN5NllXN3RsV1JwT21TYkFDU0JE?=
 =?utf-8?B?WGtIR1FKYlE3NHBURGFVcmVyY2RrN0hvSUdzekI5TlVpeWYzM3p3RXhKZ01x?=
 =?utf-8?B?TG1sOWtSMmRoUGpWaThpbjVCWDZDUGpGZkZmS0Z2NURqMnkrME12Z0N5UlA0?=
 =?utf-8?B?RTRnb09admVuR0hxd21ZdE4xbmxrVnZNZFErWGhEd25laXJJZU1kZmVPT256?=
 =?utf-8?B?VU9GalloNWs4WnJaenphY0hRYlRGeCs5TkNkTmM5MmpoWjBrdWEwb1pPTG55?=
 =?utf-8?B?TVFZVENqamlpQ0NlQTd1OWdiNG80VmZxaEtDQjFtOCsrVkdMNGFPZlQ0SzFy?=
 =?utf-8?Q?pRJQBHb5pBrSGCev0Kj+l1GCgN0K+FIF?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(4053099003)(38070700018); DIR:OUT;
 SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OUhTNjFxZGU0YVl4ZDUrRXRwVHo2aXFzKzUycksrNEJJT1lLK1paY1F5a1VI?=
 =?utf-8?B?WmJBdWZDc2NOQUsxQVdVb1YyZll2S1JtRXZwdi8rZ0o1RjJweG9KV2pDcjIy?=
 =?utf-8?B?d2F0NE1aWDBxSWZET1VqbW5DUDJCbFFlMUVPa2NMUDF4MDZnZVBJblZPaEda?=
 =?utf-8?B?KzJWY0o4dlFVR2hCbDBxaTh6cVBNdGFoeUduaUZKWXhoNWs1M0xjeUdKQ085?=
 =?utf-8?B?elJOWjRWazdpeThkMHh2ckFxNWJIYUdYMjd0VWcvU1hmNEkwYkZORTFPV0M2?=
 =?utf-8?B?bGRub0w3dlYyNnFId3ZmcllCTW1OUmk1UjY4dzVwNk54OFNORUVVMzNqVEZY?=
 =?utf-8?B?cVFsdXh2N1plRVNyeXJNMGZvVU1La3ppVTY1WHdLajRKOXlNNlRac0R1cTZp?=
 =?utf-8?B?cGlVN3l2Zk5LcEFvT0wvdHlPRncvWVRKR3pKUVAyK2tNaGthMVJsZTh5OWJx?=
 =?utf-8?B?OGRkUmhIVzg1bWp4QUh5bklvTWEvYTdrSlljbmpXVmlPUEIyK0RZMWhYQzZP?=
 =?utf-8?B?bzVRVFFkc3hjaXR3TFo2aWwrOWppS3lSYkRLOUJhSVBmaFFXNTBKeE02Ynlw?=
 =?utf-8?B?RVhUNW1LWFZJdjhTbnBhaEd2NEJkNVRGU2l3dVU0QXpkT0ExR1pnR3RqYzhl?=
 =?utf-8?B?WW9lUVgwQnJKODlTQmN5V3lad1Z6aHVOYnZsbWxiMko3RUJvNVRIaXF0c0Rh?=
 =?utf-8?B?RjR6aFh4MVJ4Z2JaWDFaM1dyQkZTc3VtcUFBQlBqM013bURwRWlLSlN5b1Ir?=
 =?utf-8?B?c0s1ZU9Dd0pwdDgwdW9LenQzUEYrZXJ2Tkh5OGp2SWVmdmYzTnQ1R0Nydmc1?=
 =?utf-8?B?dUhHY1NlUzcxcW05eTFDMXF0SXpNUTgzKy8xdlJKVTZoazduZ3MvRUcvdGxn?=
 =?utf-8?B?ckJpUkNJc1lUbHZvMytZNzZjYnBXUzI2dGhuSjBoaTNaVXMrK1NiV3JoRXRm?=
 =?utf-8?B?d0hDYzJwUlhtelBFTWZLMlVDVE5tdVNNVlRDaEgwZW0xQ3pyYTd1bVNpbzcy?=
 =?utf-8?B?RHI5bDJITVc4TTJOQ2w0UmtWOGozWkZlYVpXbzZNajVUcUltVTlOZE5LNFIw?=
 =?utf-8?B?Y05LRFZORDVyWnZ6YllhSTNpQzQwY0tPUlJJREd1S2VrTU9uRUtVdEdRelVp?=
 =?utf-8?B?bEF6aVRvNjd5VnM3L1M4RHdMRzYrc3VoZ1VJU09RbVM3ODBHSVByUkRuc0I0?=
 =?utf-8?B?UG9HT1RaaHFsMGxXRGRhUGlmNDlydmNwOHM1MEJjblFFMFFoMCttMStLb0Zn?=
 =?utf-8?B?YUQ3SnZhbDVkMnVvcTZqOFF3ZHJaTFFOL1UycVNMNU5UZEVXcFFvM1ZYcXNF?=
 =?utf-8?B?a1JXdEVlT3Evc0RzOXY0RGduNjZITDZwTDRYNi9reS8rbG9TVzdaOUFlb1NL?=
 =?utf-8?B?NHM0d1BWWnhrUTVRbUxWVmQrczZSeXVZTVBxcUJyem9XeWVlS1VxaXpjWml6?=
 =?utf-8?B?OHZuZVUycnlPMGV5MmZRTTFjT3JYcEVBdXd6WDJPamZLMWZuVmxmeG1zOFR1?=
 =?utf-8?B?U01kQnFyT0Jpb1MrLzZyWFR2amh3SFlxNGtWSzF0OGpLV1dWZ2tsUkxxY21O?=
 =?utf-8?B?bmxWUStNcW4rcjB2cEhUdkEybjNwTnM1ak9ZTnVaNk9hZTNOZHpTeVdvSzUw?=
 =?utf-8?B?VnpscFpUem1raGpsUi8relcrTkdnUmFKNVVhMS9odE1oMTU0ZzdDWmRsYStB?=
 =?utf-8?B?V3owRUR6Sk1GSDg3VkljNkQwVnZKajRvVTNSN3JyRVFreFprZTMwbFY4bWRD?=
 =?utf-8?B?WURHRjZNbmFNSndTcXJFWE5sOEtIMVBNbnRSbTFUZHdxZnRWS0hyMmxxZWF5?=
 =?utf-8?B?UUdvc2ZCSFIxdGRqVXRhTFNMcjFPU2ZYT1VZbkh1eTJ2clhGODg4aVBzbE9O?=
 =?utf-8?B?S1A1bFE5YnpEUllncGtYR2F4ZHdjWVVWVlhmWmhMSGF0YS90cWZQWC9JY3JW?=
 =?utf-8?B?cWM3a3liZ1JFeGp4K1phYm9QZHRyc2wyM2JqTmlGTFUweWEveDkxdGZrOWht?=
 =?utf-8?B?TCt1NmVNRG9KQyt1eWo3b1F5YkdIN0l5WUFSRWJaNzBqOU13ZGQwWERaR3VQ?=
 =?utf-8?B?N2VKVGdEcG5GY1BIdGoxc2kyaFJ4aFR3YmNoenN3cDVXTlQyRHI2c243R3Rq?=
 =?utf-8?B?V2V2QmM2RUM0QW5vVDFRM2VWTEk4Y1FqUGFHZkoxSEJmTGVaZGp5ZTI5K2pD?=
 =?utf-8?B?NEE9PQ==?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ZCnRTsA0x7LP8pzaMVimSyYu"
MIME-Version: 1.0
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f38c78b5-3d93-4fcd-2a42-08dd50e3885a
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Feb 2025 12:47:13.1488 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rA81SkKXjTnXWxDX4fkrEhPvpQktQko1r+E34yUWk4mMISwcMQwJ3eHaFw+OmPd9FpypzTQh6UZG3tNE1DK3jA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB2741
X-Proofpoint-GUID: V1c9ibXGuofH8PBh7fyd2oo91-LfNyCh
X-Proofpoint-ORIG-GUID: V1c9ibXGuofH8PBh7fyd2oo91-LfNyCh
X-Authority-Analysis: v=2.4 cv=U59oDfru c=1 sm=1 tr=0 ts=67b5d2d6 cx=c_pps
 a=/lXe6HOdRU+sJltUoZpKYw==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=T2h4t0Lz3GQA:10
 a=WnR_qW7rlZcA:10 a=I97S-O_Z-kIA:10
 a=NgoYpvdbvlAA:10 a=r_1tXGB3AAAA:8 a=VwQbUJbxAAAA:8 a=pc8yppVexxluHR1B_o8A:9
 a=QEXdDO2ut3YA:10 a=Ho9c5M5rX3EGqaWIva4A:9 a=FfaGCDsud1wA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
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

--------------ZCnRTsA0x7LP8pzaMVimSyYu
Content-Type: multipart/mixed; boundary="------------oO4N653hlIHemsbhAwzN52Cb";
 protected-headers="v1"
From: Matt Coster <matt.coster@imgtec.com>
To: Brendan King <brendan.king@imgtec.com>
Cc: Frank Binns <frank.binns@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Message-ID: <c9fd6b74-9714-4261-8c73-1df2bbfa2e3c@imgtec.com>
Subject: Re: [PATCH] drm/imagination: Hold drm_gem_gpuva lock for unmap
References: <20250203-hold-drm_gem_gpuva-lock-for-unmap-v1-1-dd1006f39400@imgtec.com>
In-Reply-To: <20250203-hold-drm_gem_gpuva-lock-for-unmap-v1-1-dd1006f39400@imgtec.com>

--------------oO4N653hlIHemsbhAwzN52Cb
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 03/02/2025 15:33, Brendan King via B4 Relay wrote:
> From: Brendan King <Brendan.King@imgtec.com>
>=20
> Avoid a warning from drm_gem_gpuva_assert_lock_held in drm_gpuva_unlink=
=2E
>=20
> The Imagination driver uses the GEM object reservation lock to protect
> the gpuva list, but the GEM object was not always known in the code
> paths that ended up calling drm_gpuva_unlink. When the GEM object isn't=

> known, it is found by calling drm_gpuva_find to lookup the object
> associated with a given virtual address range, or by calling
> drm_gpuva_find_first when removing all mappings.
>=20
> Signed-off-by: Brendan King <brendan.king@imgtec.com>

Hi Brendan,

Reviewed-by: Matt Coster <matt.coster@imgtec.com>

Would you mind sending a V2 with "Cc: stable@vger.kernel.org" so this
fix will get picked up for stable backporting?

Cheers,
Matt

> ---
>  drivers/gpu/drm/imagination/pvr_fw_meta.c |   6 +-
>  drivers/gpu/drm/imagination/pvr_vm.c      | 134 ++++++++++++++++++++++=
++------
>  drivers/gpu/drm/imagination/pvr_vm.h      |   3 +
>  3 files changed, 115 insertions(+), 28 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/imagination/pvr_fw_meta.c b/drivers/gpu/dr=
m/imagination/pvr_fw_meta.c
> index c39beb70c3173ebdab13b4e810ce5d9a3419f0ba..6d13864851fc2e83bdaa94f=
16435b97841e5de94 100644
> --- a/drivers/gpu/drm/imagination/pvr_fw_meta.c
> +++ b/drivers/gpu/drm/imagination/pvr_fw_meta.c
> @@ -527,8 +527,10 @@ pvr_meta_vm_map(struct pvr_device *pvr_dev, struct=
 pvr_fw_object *fw_obj)
>  static void
>  pvr_meta_vm_unmap(struct pvr_device *pvr_dev, struct pvr_fw_object *fw=
_obj)
>  {
> -	pvr_vm_unmap(pvr_dev->kernel_vm_ctx, fw_obj->fw_mm_node.start,
> -		     fw_obj->fw_mm_node.size);
> +	struct pvr_gem_object *pvr_obj =3D fw_obj->gem;
> +
> +	pvr_vm_unmap_obj(pvr_dev->kernel_vm_ctx, pvr_obj,
> +			 fw_obj->fw_mm_node.start, fw_obj->fw_mm_node.size);
>  }
> =20
>  static bool
> diff --git a/drivers/gpu/drm/imagination/pvr_vm.c b/drivers/gpu/drm/ima=
gination/pvr_vm.c
> index 363f885a709826efa3d45a906c5f65131f7ed7b9..2896fa7501b1ccddaae48b2=
12b6a724d152df9f2 100644
> --- a/drivers/gpu/drm/imagination/pvr_vm.c
> +++ b/drivers/gpu/drm/imagination/pvr_vm.c
> @@ -293,8 +293,9 @@ pvr_vm_bind_op_map_init(struct pvr_vm_bind_op *bind=
_op,
> =20
>  static int
>  pvr_vm_bind_op_unmap_init(struct pvr_vm_bind_op *bind_op,
> -			  struct pvr_vm_context *vm_ctx, u64 device_addr,
> -			  u64 size)
> +			  struct pvr_vm_context *vm_ctx,
> +			  struct pvr_gem_object *pvr_obj,
> +			  u64 device_addr, u64 size)
>  {
>  	int err;
> =20
> @@ -318,6 +319,7 @@ pvr_vm_bind_op_unmap_init(struct pvr_vm_bind_op *bi=
nd_op,
>  		goto err_bind_op_fini;
>  	}
> =20
> +	bind_op->pvr_obj =3D pvr_obj;
>  	bind_op->vm_ctx =3D vm_ctx;
>  	bind_op->device_addr =3D device_addr;
>  	bind_op->size =3D size;
> @@ -597,20 +599,6 @@ pvr_vm_create_context(struct pvr_device *pvr_dev, =
bool is_userspace_context)
>  	return ERR_PTR(err);
>  }
> =20
> -/**
> - * pvr_vm_unmap_all() - Unmap all mappings associated with a VM contex=
t.
> - * @vm_ctx: Target VM context.
> - *
> - * This function ensures that no mappings are left dangling by unmappi=
ng them
> - * all in order of ascending device-virtual address.
> - */
> -void
> -pvr_vm_unmap_all(struct pvr_vm_context *vm_ctx)
> -{
> -	WARN_ON(pvr_vm_unmap(vm_ctx, vm_ctx->gpuvm_mgr.mm_start,
> -			     vm_ctx->gpuvm_mgr.mm_range));
> -}
> -
>  /**
>   * pvr_vm_context_release() - Teardown a VM context.
>   * @ref_count: Pointer to reference counter of the VM context.
> @@ -703,11 +691,7 @@ pvr_vm_lock_extra(struct drm_gpuvm_exec *vm_exec)
>  	struct pvr_vm_bind_op *bind_op =3D vm_exec->extra.priv;
>  	struct pvr_gem_object *pvr_obj =3D bind_op->pvr_obj;
> =20
> -	/* Unmap operations don't have an object to lock. */
> -	if (!pvr_obj)
> -		return 0;
> -
> -	/* Acquire lock on the GEM being mapped. */
> +	/* Acquire lock on the GEM object being mapped/unmapped. */
>  	return drm_exec_lock_obj(&vm_exec->exec, gem_from_pvr_gem(pvr_obj));
>  }
> =20
> @@ -772,8 +756,10 @@ pvr_vm_map(struct pvr_vm_context *vm_ctx, struct p=
vr_gem_object *pvr_obj,
>  }
> =20
>  /**
> - * pvr_vm_unmap() - Unmap an already mapped section of device-virtual =
memory.
> + * pvr_vm_unmap_obj_locked() - Unmap an already mapped section of devi=
ce-virtual
> + * memory.
>   * @vm_ctx: Target VM context.
> + * @pvr_obj: Target PowerVR memory object.
>   * @device_addr: Virtual device address at the start of the target map=
ping.
>   * @size: Size of the target mapping.
>   *
> @@ -784,9 +770,13 @@ pvr_vm_map(struct pvr_vm_context *vm_ctx, struct p=
vr_gem_object *pvr_obj,
>   *  * Any error encountered while performing internal operations requi=
red to
>   *    destroy the mapping (returned from pvr_vm_gpuva_unmap or
>   *    pvr_vm_gpuva_remap).
> + *
> + * The vm_ctx->lock must be held when calling this function.
>   */
> -int
> -pvr_vm_unmap(struct pvr_vm_context *vm_ctx, u64 device_addr, u64 size)=

> +static int
> +pvr_vm_unmap_obj_locked(struct pvr_vm_context *vm_ctx,
> +			struct pvr_gem_object *pvr_obj,
> +			u64 device_addr, u64 size)
>  {
>  	struct pvr_vm_bind_op bind_op =3D {0};
>  	struct drm_gpuvm_exec vm_exec =3D {
> @@ -799,11 +789,13 @@ pvr_vm_unmap(struct pvr_vm_context *vm_ctx, u64 d=
evice_addr, u64 size)
>  		},
>  	};
> =20
> -	int err =3D pvr_vm_bind_op_unmap_init(&bind_op, vm_ctx, device_addr,
> -					    size);
> +	int err =3D pvr_vm_bind_op_unmap_init(&bind_op, vm_ctx, pvr_obj,
> +					    device_addr, size);
>  	if (err)
>  		return err;
> =20
> +	pvr_gem_object_get(pvr_obj);
> +
>  	err =3D drm_gpuvm_exec_lock(&vm_exec);
>  	if (err)
>  		goto err_cleanup;
> @@ -818,6 +810,96 @@ pvr_vm_unmap(struct pvr_vm_context *vm_ctx, u64 de=
vice_addr, u64 size)
>  	return err;
>  }
> =20
> +/**
> + * pvr_vm_unmap_obj() - Unmap an already mapped section of device-virt=
ual
> + * memory.
> + * @vm_ctx: Target VM context.
> + * @pvr_obj: Target PowerVR memory object.
> + * @device_addr: Virtual device address at the start of the target map=
ping.
> + * @size: Size of the target mapping.
> + *
> + * Return:
> + *  * 0 on success,
> + *  * Any error encountered by pvr_vm_unmap_obj_locked.
> + */
> +int
> +pvr_vm_unmap_obj(struct pvr_vm_context *vm_ctx, struct pvr_gem_object =
*pvr_obj,
> +		 u64 device_addr, u64 size)
> +{
> +	int err;
> +
> +	mutex_lock(&vm_ctx->lock);
> +	err =3D pvr_vm_unmap_obj_locked(vm_ctx, pvr_obj, device_addr, size);
> +	mutex_unlock(&vm_ctx->lock);
> +
> +	return err;
> +}
> +
> +/**
> + * pvr_vm_unmap() - Unmap an already mapped section of device-virtual =
memory.
> + * @vm_ctx: Target VM context.
> + * @device_addr: Virtual device address at the start of the target map=
ping.
> + * @size: Size of the target mapping.
> + *
> + * Return:
> + *  * 0 on success,
> + *  * Any error encountered by drm_gpuva_find,
> + *  * Any error encountered by pvr_vm_unmap_obj_locked.
> + */
> +int
> +pvr_vm_unmap(struct pvr_vm_context *vm_ctx, u64 device_addr, u64 size)=

> +{
> +	struct pvr_gem_object *pvr_obj;
> +	struct drm_gpuva *va;
> +	int err;
> +
> +	mutex_lock(&vm_ctx->lock);
> +
> +	va =3D drm_gpuva_find(&vm_ctx->gpuvm_mgr, device_addr, size);
> +	if (va) {
> +		pvr_obj =3D gem_to_pvr_gem(va->gem.obj);
> +		err =3D pvr_vm_unmap_obj_locked(vm_ctx, pvr_obj,
> +					      va->va.addr, va->va.range);
> +	} else {
> +		err =3D -ENOENT;
> +	}
> +
> +	mutex_unlock(&vm_ctx->lock);
> +
> +	return err;
> +}
> +
> +/**
> + * pvr_vm_unmap_all() - Unmap all mappings associated with a VM contex=
t.
> + * @vm_ctx: Target VM context.
> + *
> + * This function ensures that no mappings are left dangling by unmappi=
ng them
> + * all in order of ascending device-virtual address.
> + */
> +void
> +pvr_vm_unmap_all(struct pvr_vm_context *vm_ctx)
> +{
> +	mutex_lock(&vm_ctx->lock);
> +
> +	for (;;) {
> +		struct pvr_gem_object *pvr_obj;
> +		struct drm_gpuva *va;
> +
> +		va =3D drm_gpuva_find_first(&vm_ctx->gpuvm_mgr,
> +					  vm_ctx->gpuvm_mgr.mm_start,
> +					  vm_ctx->gpuvm_mgr.mm_range);
> +		if (!va)
> +			break;
> +
> +		pvr_obj =3D gem_to_pvr_gem(va->gem.obj);
> +
> +		WARN_ON(pvr_vm_unmap_obj_locked(vm_ctx, pvr_obj,
> +						va->va.addr, va->va.range));
> +	}
> +
> +	mutex_unlock(&vm_ctx->lock);
> +}
> +
>  /* Static data areas are determined by firmware. */
>  static const struct drm_pvr_static_data_area static_data_areas[] =3D {=

>  	{
> diff --git a/drivers/gpu/drm/imagination/pvr_vm.h b/drivers/gpu/drm/ima=
gination/pvr_vm.h
> index 79406243617c1f025c0119eb8deeaa13c0415586..b0528dffa7f1ba4342c98c2=
abd7fac31d254d0e7 100644
> --- a/drivers/gpu/drm/imagination/pvr_vm.h
> +++ b/drivers/gpu/drm/imagination/pvr_vm.h
> @@ -38,6 +38,9 @@ struct pvr_vm_context *pvr_vm_create_context(struct p=
vr_device *pvr_dev,
>  int pvr_vm_map(struct pvr_vm_context *vm_ctx,
>  	       struct pvr_gem_object *pvr_obj, u64 pvr_obj_offset,
>  	       u64 device_addr, u64 size);
> +int pvr_vm_unmap_obj(struct pvr_vm_context *vm_ctx,
> +		     struct pvr_gem_object *pvr_obj,
> +		     u64 device_addr, u64 size);
>  int pvr_vm_unmap(struct pvr_vm_context *vm_ctx, u64 device_addr, u64 s=
ize);
>  void pvr_vm_unmap_all(struct pvr_vm_context *vm_ctx);
> =20
>=20
> ---
> base-commit: 3ab334814dc7dff39075e055e12847d51878916e
> change-id: 20250203-hold-drm_gem_gpuva-lock-for-unmap-da4338395b23
>=20
> Best regards,

--=20
Matt Coster
E: matt.coster@imgtec.com

--------------oO4N653hlIHemsbhAwzN52Cb--

--------------ZCnRTsA0x7LP8pzaMVimSyYu
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCZ7XS0AUDAAAAAAAKCRB5vBnz2d5qsJ3T
AQCAO/TI7dVpyAB1YdlKwh5q9+zBn7r+atNCB5AWcc/ylAD+LMuJ1aDUQapf+tfXJNAJetVQSpLj
hyfCMtSfSDwgKAs=
=KKtq
-----END PGP SIGNATURE-----

--------------ZCnRTsA0x7LP8pzaMVimSyYu--
