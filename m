Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE98A3BE71
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 13:47:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4719310E7EC;
	Wed, 19 Feb 2025 12:47:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="BAf3ov2k";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="PlUG+xtL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF8EB10E7CE
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 12:47:29 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51JChqNW010071;
 Wed, 19 Feb 2025 12:47:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=dk201812; bh=+9/26AOeSRETBrOAdhan92fpB
 BF0Q//yVudS9ZUEVQM=; b=BAf3ov2kvV4pPjEMkUzM8KnAzINXYRKrg+3W9sing
 iNUWTSF9jEd6TyYQVZcSU6XIZqDINv1YCC9y1UNVQxX6VsJPaipL0gqFAOq8DSQw
 l2cMCnq+WF4U9/Cx6sUo/MQC3iRXjYagjf3e0eypLLgh/DSMTU1cCmC8BVabfJB0
 5PMvh8YF9xE7Qw3sXa9G7f9n38/fjbIw6QYU1hHOIzEKlsji/0dAfPDSLBRPjNfu
 nKMwmyV919Nhc/F/n9Aa7XZAb/d5o4SRs0fzEY1WZmxixdLcaytZO1zRJoC1tpzy
 iL95zgT0wMNndtThWek7b+ppAkrqr5fFz2QV56sEEiEaQ==
Received: from lo3p265cu004.outbound.protection.outlook.com
 (mail-uksouthazlp17010003.outbound.protection.outlook.com [40.93.67.3])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 44w4c88dv9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Feb 2025 12:47:10 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DnfxPkIUrIoJjFZ1zID2NCkISYLX4HS3YQ5tjArdwiFSemrooqc7P44GZ58sPdyMp9ww1TRl75qQW3idfF54PcO6ieG70Ejuqhv1MTc+/Sc2w87rL8tYPvPmuaVvETOXpKe7PLLqjlxfqbuImNB54eVjWNxh+6jgB9YyL8YvUcV8GRzPyL78h+IZjj3QG/X7YheE/7ZhoHy6TBcE5XiOCr0HgM7Fmga/OhvObEbK9IuS1pDOpU6pPRDvW4I5TAldbPIhXm+r/TFI6HrQJtqxe5mSWe+rrdHj0K6b4W7aQm3XwJaYM7bIzc4aMwckEXt+Zs6Ppl/+DOlMiq7DSZm38Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+9/26AOeSRETBrOAdhan92fpBBF0Q//yVudS9ZUEVQM=;
 b=LUkxCnvP1av0yLTq+Mumd9apPOBaC2KnSZ3vXeJ4qlSP4hSijLKKcxTdaRsmzpLKHQ3p9osoanF8vqmXTmOJ0+S7HFRE4h97tXLVcaKjZEsvXeUgRDMEAh4xUzuIAIWAT7M4D8ZtYwh8wMjPZzuoaIbvGN+bpx4LGP4Y+WanYYnbPpfPS6SFVTUE+CnOBqp2EdF3oTyrSeuyaxxsAwWklnBKv/yUcF2IwxkWQETHAzjGUg/XVBmIab/3lp/XI+R9NuFm1vLl/jd5HI/0xK4d3G3BFgfI6fk+HP0Kttpd4AdEqh7p1L8rbufIQb1WWr56omlk3wht/5bf7kBjLyZogw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+9/26AOeSRETBrOAdhan92fpBBF0Q//yVudS9ZUEVQM=;
 b=PlUG+xtLIyp/ltdNTmvGD5pIMqaf0L85y5Nuj9ZUwI7B2TXFpt4G9azeRhAehWZPjPZoSUD6OSFkayzY0+gBhDl7/yUjcVbDuvTRQaEyUxvcS/UVvodaogUigTXs/pDSqCdU8WHotl3RFvQ2Qx1plOm5pB06WRcQMs6LyUffUGM=
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e7::8) by
 CWXP265MB2741.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:8a::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8466.15; Wed, 19 Feb 2025 12:47:07 +0000
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15]) by CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15%7]) with mapi id 15.20.8466.013; Wed, 19 Feb 2025
 12:47:07 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: Brendan King <Brendan.King@imgtec.com>
CC: Frank Binns <Frank.Binns@imgtec.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/imagination: only init job done fences once
Thread-Topic: [PATCH] drm/imagination: only init job done fences once
Thread-Index: AQHbdlCu9lkAkM8UIUmlpuObjtHbm7NOrCEA
Date: Wed, 19 Feb 2025 12:47:06 +0000
Message-ID: <752175a8-1815-4bc7-9d40-b2ea3cbd72b1@imgtec.com>
References: <20250203-init-done-fences-once-v1-1-a2d62406564b@imgtec.com>
In-Reply-To: <20250203-init-done-fences-once-v1-1-a2d62406564b@imgtec.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWXP265MB3397:EE_|CWXP265MB2741:EE_
x-ms-office365-filtering-correlation-id: 25d0a199-a0b8-4887-0458-08dd50e384aa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|4053099003|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?Z0FYa1ppbjVrL1lyUkZMdHAwQmo2VFNSQ0NlZGtkdHhMbjluM0FkaW1Dejh5?=
 =?utf-8?B?anJESmNlUWRRaEV4SjBZM1A5MFBDQjk2MWZsVDVpai9VL2VzVmFKUGhOa3FM?=
 =?utf-8?B?RjAwb0NIcVJDeGtQd1RueGd5bGVsQXRVdGxNWDZ0YUNDaWlDa042cUxwNEZT?=
 =?utf-8?B?STI2R1dIVW5YZURMeUtnVHhBQ0h6MVVjU0pPaGdubnpzUnZlcTlhMDk3TmdX?=
 =?utf-8?B?Sy9odHlVOFByc2dhNWVmY2t3bDBOWFhVck8yTDFCbW45R1NxVHJrQzFFczNm?=
 =?utf-8?B?dkNxaUFQVTZZVk5CSVluK1AvdDhiWmp5Z2hlQTJBNGRCUDBMVkRtYnVldGE5?=
 =?utf-8?B?YzRBU3J6NmtuUWpuakVDMERWVVlaM0RwNTFpSENPaUtoM3VpVEhNckl5enlH?=
 =?utf-8?B?MzR1RE00ZXFCQzBZQlgrWlRjQnFyR1VSL2hWazNZZnZkdmJJV2NaamVEdHk1?=
 =?utf-8?B?a09vbWc1QnIrbUJLZjhLV0ErZ0lEN3FQNGJMZTZ0YStMR1VqYzE2WUhoSGFL?=
 =?utf-8?B?emQxN2VlYTg1UUNjUjNhOEdQdStjQ2JRT2pORm1yTDVQclBKSC9RQzdFdHVQ?=
 =?utf-8?B?Z3IvYm14TXh1NUdtYk1pRUNlem1CTFRWUW55N2F5cW53S1lBK2R0OXZWcHJt?=
 =?utf-8?B?Z1lxb29FQW93b3ZhS3p2bmNQYnpIanhnQWplUHJIdWdyWk45Yjd4NHdyeDlh?=
 =?utf-8?B?Wm0xYXdDY0xpUmF5MTFkTmY2Nk5aSmg1dmo3OXBkSEZlSExrcjl3MkVtRjFM?=
 =?utf-8?B?UmFMdVI3TUR2Qmhwdm5yazN6eFpIcVNQeWRtUSt6UW1hWnhZam5ORGRMR0p6?=
 =?utf-8?B?Y2JmbG0wRXpReXFsUlhrWFZHRktBeCtVYUsvRmttSkVqc29BU2VHSmJVTXNQ?=
 =?utf-8?B?UTdNeVNkOW9Ocm9ZQ3JyYUFaaXFZQkxFU1FRSXQyRndkVWw1SXU2ZE5qLzl2?=
 =?utf-8?B?eE5Ca3hHMElCWHVoZ2J5aEhtOFhFYTYwRHlJMXNVMXcvNE1sZWtGOXhEdU94?=
 =?utf-8?B?TllvNGNFemgrZjJMbWdaUlVZWWIyblluSXBuZDdPd2h1cnpYQnhJdWVvSTlF?=
 =?utf-8?B?by83Yytzb2MyMGt1cUc4bzNHSm1IWksrazhkckVRVmt6Z1FOVUhWVmhNNU5X?=
 =?utf-8?B?L1IzZnBMOXM2KzhSNzQvNmNHVGhSekRkQ0xUdUU0RUl4VlB6RW5WQVp2QXRI?=
 =?utf-8?B?VGhpNXN1N2xTbmIwLzdhM3hTektGNkp1cVNGOHFtZXFjQkhJK3Q4TUxqbEFz?=
 =?utf-8?B?ZHhoN2k3TGwxYUVlSkdIQ3ZKa3BZWnFtV2lKWXNHaW9jTDVoUXJiZXRWOEZq?=
 =?utf-8?B?SlB6bjljNlk1OVpwUHI0RDdERGpCUVRiS2M1M01iS2JITkJVN2Q1Z29ROFNG?=
 =?utf-8?B?d0FKWG5TUzJaNzdZRUM1VjVsQ3Q3WTl1NGlSNlZQTWJxQzhBSFBQcVNjY05x?=
 =?utf-8?B?YW9mTHJGYmpGVGgwR05HZExsVXEvdXZ3TW1CK1BPV2ErcEpxK2NFQmI1ckc0?=
 =?utf-8?B?aEUxU1hYMko5K3FLSTE1Q0tweFZiNlVlK2wyMWZMK3ZCUEFrQXJIK1c0dmF3?=
 =?utf-8?B?eUJTUHZBak0wdHlHVERXd0JjY2pXKzZFZGhLZHozQXJ1d2tLUmgrdElJYWJl?=
 =?utf-8?B?d3VEa1p6R1FHVFJselpXMmpGd3RucVZLN2p2OEJ1RTF6UmJ3ek1oNlZVdmFp?=
 =?utf-8?B?RUtwNEVBdE5hQ1NpbzV5S0d5SjV0MWZQUlYzTzNvTGVaV2RGZmQ1RCtydlNk?=
 =?utf-8?B?Q01Db3EzTitOZGlCRjFVNFdRWSszMTJydWJRNTNxL0tVTW5ldlZ6eWZSeXJD?=
 =?utf-8?B?OE1aNDJ4VjAwTDlxTmUzbllWc0tJamJWMklDSHF2YkZUOThicHF1dU5xaFQx?=
 =?utf-8?B?K0VJT1BEZ2dJV0t3eDhpNUYwVmhYeEFwSjU1TURHdTU1U2NBSDlRU09kYThq?=
 =?utf-8?Q?ZYS1tbKiLvit7PbTPXE503ou8PS0F0yg?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(4053099003)(38070700018); DIR:OUT;
 SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z2VlckhoY3p3SHlIK0tncCs5SytzdHhFVi9jWG5BRnM3ZFBodUNSanNYVGE4?=
 =?utf-8?B?c0ZEd2ZFazl5VGVycytwQmF1WHp2SzBDMTBrZmJEb0dVV0FMRmVSZ3B0YTcx?=
 =?utf-8?B?VGMvWXVlem9lS01WUzk2U2xZOU5oNnhoSDR4UzIxeGJ4ZHpzc3h6VzNEdEZO?=
 =?utf-8?B?UEx4bC9hSTNvbnRCVXNXejZISnZOK0FWZlRHMVh3eW44VGxxTCtnb28xd1NE?=
 =?utf-8?B?UHAvSkdaUERlWFhqQ2lOSllxSWN5U0NQS2NCdTMwM2lqaVRaZnAyMWJRZ2Fm?=
 =?utf-8?B?dnRsYk9oMmtrTkN5S2MwSjRaaTZoY2d1UXIyQVNZZFdFQnJGT0Z6UkJ6TStV?=
 =?utf-8?B?YXdDSE1mY0JZaitPMmk5TUcrTkZTYVVjalM4ZGFUbVE4aElWM3lHMm9kSXIx?=
 =?utf-8?B?bVZIczkvVEcwL3RPd00zYVJWU1Yydk1HYlFPZUFOSFB6WExjZ056NlZrMFBW?=
 =?utf-8?B?TnlxTG96YzhWL1B5Umg2ekh5UW1lWEYydXRUeGQ2cDdwR0EybHNLN2c0YUYz?=
 =?utf-8?B?eGVuZDRhbWdlMHByWnlzUlczREF3M0ZReTNwTnFTQnh3cHlFc2RBUWJhREdW?=
 =?utf-8?B?MFBhZk1VS2tpUVdSelFCRS92NS9TeEExWGs1SExhSE9ycldBSjNCdU9iQ1pp?=
 =?utf-8?B?VjNIS29lZWlpMSsza2FxRlM3VW8rN2tyUmNXQzBHRGx2dFk5Y3E4YXFhQk4x?=
 =?utf-8?B?M2o0SWNDT0xJNisyKzVIQzdJK0JUUW5KK0RnK1MvZ014UE51Z1VGdlpscEFp?=
 =?utf-8?B?UmM4LzM4aVdTRmltZXBpektLdVpDcTIvdmFlSTNic3NvalZyK1BBSjdyNmh3?=
 =?utf-8?B?UkI1TW5GQ3pUdm5OKzlpbE9yTjlVRTArOEp5VWsvRExtc3BUMnY4WWJvRDNW?=
 =?utf-8?B?N1NFeVZRWG5KY0w2YjVLUmVZeVV4UjV4SCs0WE9Zd2wrSis4clpOMGpnQWVI?=
 =?utf-8?B?bmJTVTRoNlhBQldQcHEwelRuWFRtY1JyRkFWV29qenZOM2dOdk1FU01jNUZM?=
 =?utf-8?B?N2NDdGdoSUFUeUlJRkVhSlhaajF4Z1AzMWlPakE3Yk9PN1BvN2tJSENueGJl?=
 =?utf-8?B?RDVFVXV5UDZmWVVPUk9TeUwxRG42ODZnL0lvbkxRQmplMHVqamRRR1U4K2Jj?=
 =?utf-8?B?dTZaVGo4RUFlVkN1WWtaMytwUWVWRGpLQmYzS05nN0d5WXZlVFMwa3ppWmd0?=
 =?utf-8?B?NUlieitkWm8ybjRDaTBWeVhKU0FBRDFQUkoxcmtHYzFiMFV3ZXZEQWhWbHZX?=
 =?utf-8?B?YkZWSWhRaDNwb3ZtRk9pSk1xSXp1ZVEweTI1YlQvaTRVbnpGT3Erc1hWbWJF?=
 =?utf-8?B?Lzk3cVp4NUNNSG5sQW5TaHBwQUViSlpFemRneU8xODhNY1pzTkhveEhVUGFE?=
 =?utf-8?B?cENKb0d6ak1aZDlXNXdZRG1CeVZ3bThvMWJFNFFxZTBMV3ZXVGZlMFozMHJh?=
 =?utf-8?B?dXZhRnNrNGptWVkzZ2EvTkozdGIxaGJaSURCZTFMaDlzU3VxSWJ2SDBRMnN1?=
 =?utf-8?B?QUEzZWQzQXVuQm5OUmdjdFlhRU5FK0pQUmUrY3NmNTQwT1VxSU9lK094Y3hD?=
 =?utf-8?B?eTZVd25nSSttSzBIaVVSU2grSDdBYUVMdFp2aFYxUW9DM2xRQTBmdUpYSU4v?=
 =?utf-8?B?ZDlmOUpORUZsYzM1Lys1cjhtUFNrQ3R4cVZXQUZla1VYNGhDOGtvbFR3L3Nq?=
 =?utf-8?B?bmk2R21TbGVQNTFnVFo4b0ZnbGZ0d0xsUkdMTFVmSFRhYVNEMitaKy9TU0t1?=
 =?utf-8?B?Wmp4YXVrVktDb053SmtGYXJBM0RzR2lrM2pQUUpxWm0rOERqUUpSU0IzY3NT?=
 =?utf-8?B?eWcrOFlZQUFIczh6S3dpRVNaR1lRenp6RHJkS0w5SVlTOFoxQ3FLWlE2NEFz?=
 =?utf-8?B?QThwSVdxS3IzR0tub29UTEIxd0h6YzIySy9TWTlTc0lYQWFWUjNmR3BPMU4z?=
 =?utf-8?B?VllIc3MyU2RTYVNrK016emtvQkpTTXdJTWRBajJLaWU3T2Zkc1F5NVRkMDFq?=
 =?utf-8?B?elkzRk9SdDcxenJQM084aXJRaTJIYWpnQU4xOFZWTndTYSt1azNwSEs0KzNp?=
 =?utf-8?B?T3B1UWlkalJhUW1aNlJVRTdleGJKZjhVemsxbjBUY0VZSkNCNXVVVUlmaXdW?=
 =?utf-8?B?TGlYbUJBVkh3a1BLaTNhU0hhMzZwWlNxRUZuYmUxazEwaDRwOTJjSFRzSHRj?=
 =?utf-8?B?QkE9PQ==?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------VORknfkUPtMgJtmPvQTTgFMj"
MIME-Version: 1.0
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 25d0a199-a0b8-4887-0458-08dd50e384aa
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Feb 2025 12:47:06.9964 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FxM3VjyvwgSToc4xQjLpHNP62a3/2cm8uwIYqYF1YAKkVXYaFc75Q1pPDQ6NjX+H9EQi1gMIKw2q4Rx42Tw0GQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB2741
X-Authority-Analysis: v=2.4 cv=LJecQIW9 c=1 sm=1 tr=0 ts=67b5d2cf cx=c_pps
 a=rtBBnwaRVqtIJs9+wu4Q4Q==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=T2h4t0Lz3GQA:10
 a=WnR_qW7rlZcA:10 a=NgoYpvdbvlAA:10
 a=r_1tXGB3AAAA:8 a=VwQbUJbxAAAA:8 a=t44JxukAnbZgSqPzTyAA:9 a=QEXdDO2ut3YA:10
 a=by85oNdjA4ovzYYrXMgA:9 a=FfaGCDsud1wA:10 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: nDEQ6SGUeEKW-KqTRMI-EDyvFbsnfMTP
X-Proofpoint-ORIG-GUID: nDEQ6SGUeEKW-KqTRMI-EDyvFbsnfMTP
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

--------------VORknfkUPtMgJtmPvQTTgFMj
Content-Type: multipart/mixed; boundary="------------WE14eKSuocg3LUyNnQXLMevt";
 protected-headers="v1"
From: Matt Coster <matt.coster@imgtec.com>
To: Brendan King <brendan.king@imgtec.com>
Cc: Frank Binns <frank.binns@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Message-ID: <752175a8-1815-4bc7-9d40-b2ea3cbd72b1@imgtec.com>
Subject: Re: [PATCH] drm/imagination: only init job done fences once
References: <20250203-init-done-fences-once-v1-1-a2d62406564b@imgtec.com>
In-Reply-To: <20250203-init-done-fences-once-v1-1-a2d62406564b@imgtec.com>

--------------WE14eKSuocg3LUyNnQXLMevt
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 03/02/2025 15:31, Brendan King via B4 Relay wrote:
> From: Brendan King <Brendan.King@imgtec.com>
>=20
> Ensure job done fences are only initialised once.
>=20
> This fixes a memory manager not clean warning from drm_mm_takedown
> on module unload.
>=20
> Signed-off-by: Brendan King <brendan.king@imgtec.com>

Hi Brendan,

Reviewed-by: Matt Coster <matt.coster@imgtec.com>

Would you mind sending a V2 with "Cc: stable@vger.kernel.org" so this
fix will get picked up for stable backporting?

Cheers,
Matt

> ---
>  drivers/gpu/drm/imagination/pvr_queue.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/imagination/pvr_queue.c b/drivers/gpu/drm/=
imagination/pvr_queue.c
> index c4f08432882b12f5cdfeb7fc991fd941f0946676..9a67e646f1eae709859f664=
c796e1940f0b45300 100644
> --- a/drivers/gpu/drm/imagination/pvr_queue.c
> +++ b/drivers/gpu/drm/imagination/pvr_queue.c
> @@ -304,8 +304,9 @@ pvr_queue_cccb_fence_init(struct dma_fence *fence, =
struct pvr_queue *queue)
>  static void
>  pvr_queue_job_fence_init(struct dma_fence *fence, struct pvr_queue *qu=
eue)
>  {
> -	pvr_queue_fence_init(fence, queue, &pvr_queue_job_fence_ops,
> -			     &queue->job_fence_ctx);
> +	if (!fence->ops)
> +		pvr_queue_fence_init(fence, queue, &pvr_queue_job_fence_ops,
> +				     &queue->job_fence_ctx);
>  }
> =20
>  /**
>=20
> ---
> base-commit: 3ab334814dc7dff39075e055e12847d51878916e
> change-id: 20250131-init-done-fences-once-c55c5d0f4d8c
>=20
> Best regards,

--=20
Matt Coster
E: matt.coster@imgtec.com

--------------WE14eKSuocg3LUyNnQXLMevt--

--------------VORknfkUPtMgJtmPvQTTgFMj
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCZ7XSygUDAAAAAAAKCRB5vBnz2d5qsBRe
AQCFb8Wuy1FoMtlm3fi2KYdVUouYMUr/RfjKsNnknRsEFgD+MhmT+bpqPzjwkl5VyLTJuMXDluQw
6x40mlJgOfGw4A0=
=I+hw
-----END PGP SIGNATURE-----

--------------VORknfkUPtMgJtmPvQTTgFMj--
