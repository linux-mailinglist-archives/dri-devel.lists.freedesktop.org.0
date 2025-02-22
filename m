Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB143A4098C
	for <lists+dri-devel@lfdr.de>; Sat, 22 Feb 2025 16:46:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCDEB10E046;
	Sat, 22 Feb 2025 15:46:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="I5Augh6U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PNYPR01CU001.outbound.protection.outlook.com
 (mail-centralindiaazolkn19010006.outbound.protection.outlook.com
 [52.103.68.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AF9F10E046
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Feb 2025 15:46:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iElwZ7f+GBynpmeG12v1lQiXfIpjnSnpu3kjQuOUjTceu5KKr8UlbMcVWz3/C8y6GaTiNsfuEnZNZjSiLOau97VxtohvKumoWWlsZHNdcoJUfmFa5FuTgDgE1lOpn8fgcHbY4u7ci4FBBqyVxdPi3y6vwcdfdOeo+k9TUnIO+dUk8fmyxLeBoMa6H5ZjteqonvT/KckvoebTR8VNzIl97ulBc38xAMAyxjc501E91BuracukEtsp96+Jymuhov4iE67Lt+94wvySE+he1UoEnATXKR8KKp/qLGHC0Mz5aK8NAWQqCL/hC5Gu4s38FszQlQOPwfD7kDce/UG+RKURiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P9y9WpG8vHJNdFdDfCUzGEBRIH2+o1FMh4Lo70G1L0I=;
 b=zMsR8b3nq8/P5qIP8bxMmuLw3TtfdMvgg4pzYfVhzsQFwmTIivugF+iRoS+kDMfYOQnbOKNGeo/cyEyK7mlaNfDABpS+w305dEH8KPUNTtPkKnoCrjzGw+NAdqsyad9cpXUQ5bxYoQHvxr4bTyAW+QKZheuiKCE/HaCV7wfMROs6X3zPB4R+BUuVjMDEhyChxEvXHjrSBnSNRyDGiZPmYMUMovTG8l5N1qdWVHzr8PXNn8XdG5MnKShImv/XHXAuUJYZjTnsu/EjQ/mMPcqWsXe3A6XmukcMlpPACTCMS69Q3KMyqeogqLhU04EMtEWnOMauZIG1JgrpYCc/PUrMmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P9y9WpG8vHJNdFdDfCUzGEBRIH2+o1FMh4Lo70G1L0I=;
 b=I5Augh6UZy+SmLG2K79zVSXT7ISZM8dLBjXICGporHTOQnVyadERTkWzaftBZovCFBjWgzzPXg3SJn1PggFPXLjNMSdTkwK9W9pxUc2zIRIpjY0EoaHc6pAqp0ixkJPkLJZRTwwXWWqYq4aYE2B9grwQWGl6lGdQfvFhanBnQHBJuwg2/rFjh2N68eturZ7CmasMEVv1LelVGMmoejNw9e4688ydPdi3DovXzSH2VPKiLsgISHGckkfy91IeJ7T9GMGV0/j8PCnjSUhzuHbIt1z8I9XgMIAuVIwoxUQg/6yaMzFPoafBLknaNT9aPvmwWOtSuwYvNQ0TAmwNytHbQQ==
Received: from PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:1d::9)
 by PN3PPFE3DC47779.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c04:1::52c) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.17; Sat, 22 Feb
 2025 15:46:03 +0000
Received: from PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::27a3:3d7e:30be:e1d1]) by PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::27a3:3d7e:30be:e1d1%3]) with mapi id 15.20.8466.016; Sat, 22 Feb 2025
 15:46:03 +0000
From: Aditya Garg <gargaditya08@live.com>
To: "pmladek@suse.com" <pmladek@suse.com>, "rostedt@goodmis.org"
 <rostedt@goodmis.org>, "andriy.shevchenko@linux.intel.com"
 <andriy.shevchenko@linux.intel.com>, "linux@rasmusvillemoes.dk"
 <linux@rasmusvillemoes.dk>, "senozhatsky@chromium.org"
 <senozhatsky@chromium.org>, "corbet@lwn.net" <corbet@lwn.net>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "airlied@gmail.com" <airlied@gmail.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "akpm@linux-foundation.org"
 <akpm@linux-foundation.org>, "apw@canonical.com" <apw@canonical.com>,
 "joe@perches.com" <joe@perches.com>, "dwaipayanray1@gmail.com"
 <dwaipayanray1@gmail.com>, "lukas.bulwahn@gmail.com"
 <lukas.bulwahn@gmail.com>, "sumit.semwal@linaro.org"
 <sumit.semwal@linaro.org>, "christian.koenig@amd.com"
 <christian.koenig@amd.com>
CC: "kekrby@gmail.com" <kekrby@gmail.com>, "admin@kodeit.net"
 <admin@kodeit.net>, Orlando Chamberlain <orlandoch.dev@gmail.com>,
 "evepolonium@gmail.com" <evepolonium@gmail.com>, "linux-doc@vger.kernel.org"
 <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "linaro-mm-sig@lists.linaro.org"
 <linaro-mm-sig@lists.linaro.org>, Hector Martin <marcan@marcan.st>,
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "asahi@lists.linux.dev"
 <asahi@lists.linux.dev>, Sven Peter <sven@svenpeter.dev>, Janne Grunau
 <j@jannau.net>
Subject: Re: [PATCH v2 2/3] lib/vsprintf: Add support for generic FOURCCs by
 extending %p4cc
Thread-Topic: [PATCH v2 2/3] lib/vsprintf: Add support for generic FOURCCs by
 extending %p4cc
Thread-Index: AQHbg7X/VQv9Od0O+UavMLVdMg72b7NTekUA
Date: Sat, 22 Feb 2025 15:46:03 +0000
Message-ID: <6CB20172-906F-4D13-B5E4-100A9CF74F02@live.com>
References: <716BCB0A-785B-463A-86C2-94BD66D5D22E@live.com>
 <C66F35BB-2ECC-4DB8-8154-DEC5177967ED@live.com>
In-Reply-To: <C66F35BB-2ECC-4DB8-8154-DEC5177967ED@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PNZPR01MB4478:EE_|PN3PPFE3DC47779:EE_
x-ms-office365-filtering-correlation-id: 9fc31702-88bf-4948-8cb4-08dd53580317
x-microsoft-antispam: BCL:0;
 ARA:14566002|8060799006|7092599003|461199028|15080799006|19110799003|8062599003|102099032|1602099012|440099028|3412199025|4302099013|10035399004;
x-microsoft-antispam-message-info: =?utf-8?B?NU5oY3ZhUUkwRzY1ZDN3ZG5RcDkrMVBpSFA1Q2hDK0k1SUE0OEJoUlNhQ3Bs?=
 =?utf-8?B?Yy9IcnZqbjdDaVFsNE00Y2g0TE1KSzZTVXB0NXdxWldLZTArSlV2LzhHVWxL?=
 =?utf-8?B?UEQ0Z21EbDEwN3pzN2RwajdoeE05bjludmk4MnJnV0taNWlCcnhMbEkwWElR?=
 =?utf-8?B?NzBSZDJLU2RHeEJXcVA5alovQko5eTJVNmc0dURkWXlJaWtkR25YQ29JMDZ0?=
 =?utf-8?B?czhLYmx1UEc0cTZkSWRUc3NUZGxkNHNlbU9vV01BMk84L2dxMERyeXBUZVg0?=
 =?utf-8?B?SEtHVHpaY083bXgwdmdUS2lHTjhFN1B4Uzg3QytHOUVkREI0cEZFK1c3STlv?=
 =?utf-8?B?aVBNRHVCRDVYMk9HR0dTYTRoSG9ha1l3MlUxc0EwOE15dVpZaUZGcXpJQjht?=
 =?utf-8?B?cUM3QVJnYWNQeEZ5ekdTSEZHaVZiSlFRMjcvaDR3bU9KYSt3R3FadTI2REVM?=
 =?utf-8?B?TzdnZ2Rjcll5U003Q0JlZC9QOUNmaEV4dkcyOTlReGNEY1ByNW1ick9hanBK?=
 =?utf-8?B?RGFxcnZFSUdaVFJYdXM2eHN1ajFxSXBQWkoxdmp3QWMvVHB4Qkx6ekhaVFJK?=
 =?utf-8?B?blp5QmtpQWVCQzNYdU1oTVZES29WV0phVFpMd1pvQ2N1eWVBWEIxSkF2VWJs?=
 =?utf-8?B?R1RVcWI3YTZweGw1NUo4OVNCWlE2NExVRy9wbUNzaXkrR0NvZ1ZjUmdPQTFJ?=
 =?utf-8?B?Q1p2K1BpemY2TDUvM2JOV2pMR3lwcngxeE4vZnF0anBPWGZ2ZmxqdlZzODZF?=
 =?utf-8?B?UlEwSnVybHJoN0tTVE1LVldVRktFcytJVnlxSHlWYmtRYXZhMTJjT1BhTTVa?=
 =?utf-8?B?VEtrN05SU2FuWXRCNDVrejdOeVlVM2lOcWNnZ2hVekxwYjcwMEd0UzJ4cGxk?=
 =?utf-8?B?cVpkU3pmcnNuSUozaUhkd2xIS1IxY1BaNzZ3UTVpZjl3S3FpYlZjM1hVUnM1?=
 =?utf-8?B?SitreC9nalRWSm5Vb25ucEM5amhSRW5EVUE3VzU4SUQ5UFpBbER3ZGtCazFE?=
 =?utf-8?B?V2RhMmR0cHozYXp6cWkyQnZOYzBtS2hib0MxQmRaK3gxZWszZ2RzTVF2RDlq?=
 =?utf-8?B?ZjVzRzgyY1doSmpEWEtrMWhBbmE0VFpZcGVadE5QZ3B0bWZ0UHFwSjVKck5z?=
 =?utf-8?B?d1hXVTdRZFZEV1lyQzY5MG1uWVJ2S1hVRFFIck1PNDdHaC94RUlKZjFJejRP?=
 =?utf-8?B?SFY5VjNqK2lGMVd2djB5azdrcStxNHJJZ2xGR3dDVTFSZDZLSlNmTFpBNnEz?=
 =?utf-8?B?b2t4UE0zVkhnUFV4UW9CMGNvVVI1MHg5RHB2T2ZHYWluMFJwc2NPQ0ZoMUcy?=
 =?utf-8?B?Uld5TFNyVUlaKzh0NEkyN0NWaFV6V2MzbmlIRTBaZU1hcVRnS2YxTzc0SkxY?=
 =?utf-8?B?V2sxaU9tQlhuYlBqNDErRDFoMFd1dTFLdTcxb01adjlsMURUanRnYThBZ3dL?=
 =?utf-8?B?UVcvcW9HOFY3MEdiV1RPYWZoTkppVXVnMFBHanplNDlGTnFQSGFpeFRodmJB?=
 =?utf-8?B?cktXZk51VWUyeVZUaGxyYXlEQ05MRDNodHJNNFZFS0FPbVQrc2JwSFBhbVVM?=
 =?utf-8?B?QXdqbWpOTlNQREh1VW1ITTZGQWlCaHRGMm1wNEN6WXRMT1Z2TTY0ZE14NzlH?=
 =?utf-8?Q?PoG2sRSzb6A8N+Inai9gmbmfnWfFjaT82GEcZrUXrncY=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V2ZUcWorRVhVNnJHR2dSc1ZmcTlya2ZnN0lNL2NFVy9GcURwcVZ1cVZnS1FD?=
 =?utf-8?B?ZDdDdkM5S0RWT0Rnd3FPcEozMEl3bktrZzdTS283Z1paVzJpM0ZyQkhHei81?=
 =?utf-8?B?RzcwVFhNd09OK3c5amdsWWdlT3E5dUQ4NjhBVXlVWTQzVWZJaWhzdHJITFB6?=
 =?utf-8?B?RkYzNlIxWU5OSittMG1aVnUvbXYrRDdkQ1JZWkFUc3dWRk9UZ2czN2xhd0RS?=
 =?utf-8?B?UjBVSjc4MW11TzNqY2hTUDExQ05iQzA5M2FWanlKSmY4TVA5RVR2Zk8vL2o4?=
 =?utf-8?B?TW5ubDZBdE5sd0t5V1lxWHRpOTRLcEtlZFBHaGdKNVlxektjbnV0ZzZzZm94?=
 =?utf-8?B?RUFJaE9MNFJiWUhqelZoT3hTdmZPN1AwVmRJNHdLSy83UUFZNWY3VThXY3dh?=
 =?utf-8?B?YW8wZXpjaUc2NE5CcjJQSE5XMjhGSCt0L0ZueVdMa1BUTElKWjBVaUtlVEJI?=
 =?utf-8?B?T1JEb0MrbkllcVZmT0dtalJYSXRRTDQ4QjNCTmlvTjFXakxzanFBUnR6am1C?=
 =?utf-8?B?eExldVc1cHVIQ3JsSEFwMWVzTVBpamtnVUNpYkNzNHRiTU00SlBiSEFuZmJB?=
 =?utf-8?B?bUJOamFMT1c1VTMzV2xicmFtSEVic3VseGJ2VUNpT2tvYzJsNTRKMlM0YXJl?=
 =?utf-8?B?OGdxUXZrV3ZVRzlvd0s2TGJuWTkyR0VBbkNHSFVrSWFveUIwUHc0VHVMaGpw?=
 =?utf-8?B?dXZaZlpDY3ZtSUQ3bXJQSG5xQ3BCR3dYQTBPUHZtWE9RcFRtTzhGRVNTZGFi?=
 =?utf-8?B?OG5QOUg4cmdlQkNEbmxhKzNsbnY3ZENnc09KTTJCRWx1MHlJclRMN0dVVHk2?=
 =?utf-8?B?b0pndXFPQVFxdzIzUHUrWUNoRzFrVmQ3TzZLWHRad2RVaEMrTGJlSlVyTzF3?=
 =?utf-8?B?YysxNlk0RllvbU5BSy9wR2NHZHU2a1lCV0RHZGFhZ28vd25rb3ZFbWg2b1F6?=
 =?utf-8?B?dGQyQkhjak4zenRwOTdBL202VE9KSkhqUXhQc2lrdHJlZHZMajNuZm9nQWdm?=
 =?utf-8?B?aFhIVnpaa1VPUXFVMjlTeDhQQUNNeXo3MGxNYVV0bnBKTGNSZWsvVDFDK2JC?=
 =?utf-8?B?M1NZZG5nL3BXdGEzYmtzdGQrd2Z2N2c2M0tHY2ZXNndTM2hOVlV3TUtaYU8w?=
 =?utf-8?B?NWEvRjZPcjkxL2pLVHpzRHJOWlhMZGFUalVxVzArSlFVZlJiRFBPWmFpUnJh?=
 =?utf-8?B?SEMwUk15QmdxMkoxeERzT0RERitrT0RwOXErMmlPVnRscW9QQmJiU1crdjcz?=
 =?utf-8?B?ZHB5Nnl6aGR6WmhrWGFEcEthUE5YZHVVUWhGb2w1c0hZbWxEcVNOZ090M2Na?=
 =?utf-8?B?c3Z1MmNtVWZCdVdPaDgyN1Q1UHZtUktJVzA0NzdkK3dFbzlZVE9QWVFjRGxR?=
 =?utf-8?B?UTRSdWNpZDdPdzhWS2czM1dIY05SMS9lWHgzQUVvWi9JUXpoeUR3MXRvaCsw?=
 =?utf-8?B?ZHNDQk1vWmRiNVNjQjM1VFR5MG95SFJ2ZEpCR2JOT2hOUjhPbFcvU2Zody9u?=
 =?utf-8?B?ekNHY0RwS1FzUEsyRFJFT2dHeTIyUGtRMXN4Y3poMFNOOURTZUFVS3BNRWIr?=
 =?utf-8?B?VHBJT3FVUkdqTFdXL1FtLy9EemNXZCtjZHNVN0ljYTFLcTBtSUZoRlZaQ0Vp?=
 =?utf-8?B?Wm1lZGltUE5VbUVjRkFESjE3bS91VldUUUZQZ3FzcTNrcktCQUFwdlBXWUxE?=
 =?utf-8?B?N3dtVDIwclNMQStXYThUZ2NzeDdNQ2dBdG92UTR1OXZ0TE45RkVuMDdyUkk3?=
 =?utf-8?Q?wBYHZTM312Zi95hd51zxdKyLx3wwOuGswqflvLg?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9AAA847C0A447244AB67AC927E25D542@INDPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fc31702-88bf-4948-8cb4-08dd53580317
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Feb 2025 15:46:03.0480 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3PPFE3DC47779
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

DQoNCj4gT24gMjAgRmViIDIwMjUsIGF0IDEwOjA54oCvUE0sIEFkaXR5YSBHYXJnIDxnYXJnYWRp
dHlhMDhAbGl2ZS5jb20+IHdyb3RlOg0KPiANCj4gRnJvbTogSGVjdG9yIE1hcnRpbiA8bWFyY2Fu
QG1hcmNhbi5zdD4NCj4gDQo+ICVwNGNjIGlzIGRlc2lnbmVkIGZvciBEUk0vVjRMMiBGT1VSQ0Nz
IHdpdGggdGhlaXIgc3BlY2lmaWMgcXVpcmtzLCBidXQNCj4gaXQncyB1c2VmdWwgdG8gYmUgYWJs
ZSB0byBwcmludCBnZW5lcmljIDQtY2hhcmFjdGVyIGNvZGVzIGZvcm1hdHRlZCBhcw0KPiBhbiBp
bnRlZ2VyLiBFeHRlbmQgaXQgdG8gYWRkIGZvcm1hdCBzcGVjaWZpZXJzIGZvciBwcmludGluZyBn
ZW5lcmljDQo+IDMyLWJpdCBGT1VSQ0NzIHdpdGggdmFyaW91cyBlbmRpYW4gc2VtYW50aWNzOg0K
PiANCj4gJXA0Y2ggICBIb3N0LWVuZGlhbg0KPiAlcDRjbCBMaXR0bGUtZW5kaWFuDQo+ICVwNGNi
IEJpZy1lbmRpYW4NCj4gJXA0Y3IgUmV2ZXJzZS1lbmRpYW4NCj4gDQo+IFRoZSBlbmRpYW5uZXNz
IGRldGVybWluZXMgaG93IGJ5dGVzIGFyZSBpbnRlcnByZXRlZCBhcyBhIHUzMiwgYW5kIHRoZQ0K
PiBGT1VSQ0MgaXMgdGhlbiBhbHdheXMgcHJpbnRlZCBNU0J5dGUtZmlyc3QgKHRoaXMgaXMgdGhl
IG9wcG9zaXRlIG9mDQo+IFY0TC9EUk0gRk9VUkNDcykuIFRoaXMgY292ZXJzIG1vc3QgcHJhY3Rp
Y2FsIGNhc2VzLCBlLmcuICVwNGNyIHdvdWxkDQo+IGFsbG93IHByaW50aW5nIExTQnl0ZS1maXJz
dCBGT1VSQ0NzIHN0b3JlZCBpbiBob3N0IGVuZGlhbiBvcmRlcg0KPiAob3RoZXIgdGhhbiB0aGUg
aGV4IGZvcm0gYmVpbmcgaW4gY2hhcmFjdGVyIG9yZGVyLCBub3QgdGhlIGludGVnZXINCj4gdmFs
dWUpLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogSGVjdG9yIE1hcnRpbiA8bWFyY2FuQG1hcmNhbi5z
dD4NCj4gU2lnbmVkLW9mZi1ieTogQWRpdHlhIEdhcmcgPGdhcmdhZGl0eWEwOEBsaXZlLmNvbT4N
Cg0KQlRXLCBhZnRlciBsb29raW5nIGF0IHRoZSBjb21tZW50cyBieSBNYXJ0aW4gWzFdLCBpdHMg
YWN0dWFsbHkgYmV0dGVyIHRvIHVzZSBleGlzdGluZyBzcGVjaWZpZXJzIGZvciB0aGUgYXBwbGV0
YmRybSBkcml2ZXIuDQpUaGUgZHJpdmVyIG5lZWRzIHRoZSBob3N0IGVuZGlhbiBhcyBwcm9wb3Nl
ZCBieSB0aGlzIHBhdGNoLCBzbyBpbnN0ZWFkIG9mIHRoYXQsIHdlIGNhbiB1c2UgJS40cw0KDQpb
MV06IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FzYWhpL0U3NTNCMzkxLUQyQ0ItNDIxMy1BRjgy
LTY3OEFERDVBNzY0NEBjdXRlYml0Lm9yZy8NCg0KQWx0ZXJuYXRpdmVseSB3ZSBjb3VsZCBhZGQg
YSBob3N0IGVuZGlhbiBvbmx5LiBPdGhlciBlbmRpYW5zIGFyZSBub3QgcmVhbGx5IHVzZWQgYnkg
YW55IGRyaXZlciBBRkFJSy4gVGhlIGhvc3QgZW5kaWFuIGlzIGJlaW5nIHVzZWQgYnkgYXBwbGV0
YmRybSBhbmQgQXNhaGkgTGludXjigJkgU01DIGRyaXZlciBvbmx5Lg0KPiANCj4gDQo+IC0tLQ0K
PiAtICpwKysgPSAnICc7DQo+IC0gc3RyY3B5KHAsIG9yaWcgJiBCSVQoMzEpID8gImJpZy1lbmRp
YW4iIDogImxpdHRsZS1lbmRpYW4iKTsNCj4gLSBwICs9IHN0cmxlbihwKTsNCj4gKyBpZiAocGl4
ZWxfZm10KSB7DQo+ICsgKnArKyA9ICcgJzsNCj4gKyBzdHJjcHkocCwgb3JpZyAmIEJJVCgzMSkg
PyAiYmlnLWVuZGlhbiIgOiAibGl0dGxlLWVuZGlhbiIpOw0KPiArIHAgKz0gc3RybGVuKHApOw0K
PiArIH0NCg0K
