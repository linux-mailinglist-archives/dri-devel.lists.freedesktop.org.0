Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C35DAF5F10
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jul 2025 18:50:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 390BD10E165;
	Wed,  2 Jul 2025 16:50:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="Xm4bVHuq";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="Blpg6hSn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F268510E165
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jul 2025 16:50:41 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id
 562CZX5k4027150; Wed, 2 Jul 2025 17:50:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=dk201812; bh=mgNLvADr8ofg57qCkGaqEpl8q
 jRofNGjnGHNlbb5V4Q=; b=Xm4bVHuq7Fz+0/AGUM2+DLnyxB8jczb77g+0chsAV
 iRQ6aYcek/px76X7cMZUAAvImE8pXjt6ayevedCJecwqgOWRpL1DFvKvzXxsjVK4
 1y5BOcifuU7Q+iiQDsdeKeglRqrjLMEO/jxb9DmGhUPY8XH4pc130dkZuzPebeqX
 qDVHsyYsHQZTb4Dq7t7r1jF8d9K+B38ZSrF+v1jzsfyAmk6jcncmvWc6484vkS93
 TeWsZGS9aBzjleb2tKkEuIdKjX03GTP2ewHqSjk6YgSiv/7/IAEG4ZX/fRAqJcn6
 sKgnNSBQ3a7+9BUyRhns4c5HM2ENVV6iwWIlOhBEc3ofg==
Received: from lo3p265cu004.outbound.protection.outlook.com
 (mail-uksouthazon11020121.outbound.protection.outlook.com [52.101.196.121])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 47n1d90ah8-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Wed, 02 Jul 2025 17:50:23 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=inQH/EmCwKXuIpGzDyWEiEtgijnZm0Pwpi54thw9xyTXOpT2+EGhpBLzBqPeL2rd0DdJdkbOWRLk+qNO7OdeNkLnfj+Aolh8ltsuRn66R/DM5wDKtQZ5bnGHhUhBAIx6nR4G+ORS4UbScxP3JOO3+3D+Vg2xuGyfUXU9PekLkd1Q9tDu1KiM+fGZhoHuYVfn+uzY22aXqIlYB2iFFUG0fVbYgQ+FFcRjT9nmTEdrJCfsdaIBvK2i25rC9L+RjYw4URp5dbI/ruDGTbZqx0VIB/aw/cWSua+arxKPqd0IG49Cj7TS0t9Onw1lQMnQMi8enAmAva50x+IBIu+SZECvow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mgNLvADr8ofg57qCkGaqEpl8qjRofNGjnGHNlbb5V4Q=;
 b=BjrzIxyKu7DojRVzdjsmzltbxEqFUIOeRlnmk2+h6jG0X0ch9AbudiVkKf1wohty9G6tlSx1Wcgh38lQJPwuVZGDUhXE3yOP3T0q4643IwmJRyoyoj533b6nZ2JWw8Aaiux9Lot4V18H0RllSEnaJqEqEb8UQf/b8Dx+WnVdb6XSb5vWtVsGSNsGUEe1CG6HHu+O03k/nOUP0XxtHdoCy9dVkV1pWDTTNspD4M831y72B8gT+zms6NsVblgeA/IKdZLeWqMyTr2tpgpWyrdK1+M7VEJxaGH9fVSvep1y5xedRbX2aGZKuxwDa0ttJqMGb1TiZftWQpxzayNrZ5bcPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mgNLvADr8ofg57qCkGaqEpl8qjRofNGjnGHNlbb5V4Q=;
 b=Blpg6hSnqcI3ujXiQ6oxynJoS+HBOE5NPQ6Vlr0xFNjCwmm37uhIShUnq+kqFddfMWKtLLM/0w6HSma+HGJPyQ/JpRgXKzSkcLy+t7gE7GSXDKlyCWucKsVclXtQo5pQjIBkJQPTLjZ4LIN7JM4150FEXlxnC96gClOscmnagac=
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e7::8) by
 LO0P265MB3401.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:186::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.20; Wed, 2 Jul 2025 16:50:21 +0000
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15]) by CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15%3]) with mapi id 15.20.8901.018; Wed, 2 Jul 2025
 16:50:21 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: Alessio Belle <Alessio.Belle@imgtec.com>
CC: Frank Binns <Frank.Binns@imgtec.com>, Alexandru Dadu
 <Alexandru.Dadu@imgtec.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/imagination: Fix kernel crash when hard resetting the
 GPU
Thread-Topic: [PATCH] drm/imagination: Fix kernel crash when hard resetting
 the GPU
Thread-Index: AQHb5RNs7gCPd/hxM06SJOLWtlg4+bQfGKMA
Date: Wed, 2 Jul 2025 16:50:21 +0000
Message-ID: <2ec47280-1032-4e7a-b381-e6f738a15dd5@imgtec.com>
References: <20250624-fix-kernel-crash-gpu-hard-reset-v1-1-6d24810d72a6@imgtec.com>
In-Reply-To: <20250624-fix-kernel-crash-gpu-hard-reset-v1-1-6d24810d72a6@imgtec.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWXP265MB3397:EE_|LO0P265MB3401:EE_
x-ms-office365-filtering-correlation-id: feaa3a37-4dc1-4637-3114-08ddb988886b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|4053099003|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?K0hEVlpKbXVnNVBXTEgraUd0UjdOdUlKNEhBend5OEsxWHgxN1lvZDI3VTJx?=
 =?utf-8?B?cGZnZlU2bmFtRURtN2lLSS9qUlhVMll5ejlTV2YzeDVtbUNzRENvVERUUGZq?=
 =?utf-8?B?NkpSZHdsYWVjY3BIRjRKdmhVTllTK084ZVNLNmFkaldvN0l6MlByUkxPMkEx?=
 =?utf-8?B?eDdhQUZZZVdSOXJTRDNKdjU5VTg2bi9Gd2dwT1E0UFVIcmh6VmlYaHRNUjht?=
 =?utf-8?B?aDFqQmw4VVpWb3pBUnJzZE9mSVZFNGs2R1VHdWp4Umdvb3RxK2xydnFsaU9u?=
 =?utf-8?B?UjR4OTVYY2FiSXNnbnFFeWUvQkxMdWdPNWt2RHI0WnNrSkVuR0VydU5KUThS?=
 =?utf-8?B?Y2p1VG13M25IWWEwd1FVbUhWZUFPSEhKbkF2NjNIOC9PbkM4NXFQZ0I1eTU0?=
 =?utf-8?B?ZVlWWXNBMlVHZXZ1SEdvRlBUN29xSllVK1IvZ0ZYYUNxRUU0cklJcnU4ck11?=
 =?utf-8?B?NUxFOXhLWG9SY1h6aEZjUVdZR1ZCTXZKS0VhQjVXajJKUzlvdlM4cG4zVS81?=
 =?utf-8?B?UkpGeTk1K1JkVjh2eG5UV3Z4MGlId1lNSU00dU1mbnY5ZGFGNHBROWJMemNq?=
 =?utf-8?B?V0tRWEdtdzMvaEFaWVlwRWJ5ZUs0RGN5Tno0TGJrZzVOV29OYXl6RUdMd1Rw?=
 =?utf-8?B?ZWtMSTdtdDFHVisydkZEdEZWLy9UbUIydXZ2bk1Mb3R6ZHZFTU1iRE9VaUNr?=
 =?utf-8?B?U2N1c3RxRy9Pc1JuT3JtMHFlOUZHeldpZkdzbXFRd3d3R3hXZ3RvSGZURGZ4?=
 =?utf-8?B?Z3RUZ1R3akZWNWUxa1I4ZUl6dkZlTlNpUWRSdjduN2Zsek53KzRGajlnTXBt?=
 =?utf-8?B?TGpxSTlnMnErd1AwWUdRNkZkTTVET3ZvUzdodHJvWC9MbWIzbS92OXJVTmpH?=
 =?utf-8?B?US9BM0VVYmVMTlNhRGt1MVovOUJjU2NiL3JWY1hOS3E3bnMxeHBWSkoyVVpQ?=
 =?utf-8?B?a3JFby9Bd204bi9tS0wyOEc3ZTdRVWlIZ2dzMGhvS2xhT29OaXlCTy93UjBG?=
 =?utf-8?B?TkxEcDhMRmFENzdqNnBQV01OOTVVWmovTWE1Tk9ISkJYOVJ2ZmVDbEd4ZUFH?=
 =?utf-8?B?YVBoN3RRc2xOY2ZXSEJCcithTGt6YmVhdjVlZ3RTQ0ZZSGRNY1Vab21xNk5S?=
 =?utf-8?B?QUdDQTBqUkJDN1NkSnRZcXdTSHcxNVhwVXQybU8rVmdRbk1ra0czbmZBVko1?=
 =?utf-8?B?NUxLMkszSHVUMWpwK3haclA5MStHdTgvZW9sczllSGFnY0x2dXNXall2eGpt?=
 =?utf-8?B?SFZyUVJ6UUpLYlZzU0d3N2NVMnFVUDhvZWpPaDE3WFJrbE15YU5sM1loSmVX?=
 =?utf-8?B?Wk1UN1dENWxLZE1QZDNsbGo4K2NDZmxHakNCMmhGa3ZSZWFsWHg1cDJzcFA4?=
 =?utf-8?B?U0dpb2phU3Q2L1dZOWdxaUNCbUM4RUVZTHl2RmlIcStLVkNpakpQMzlRL2px?=
 =?utf-8?B?QTBEb2FpMnhuWDk3YVpKVWcvQng0S2ZXSjJzYzdYQkoxVnlRZ2pkYjhwQVFM?=
 =?utf-8?B?NzluRkVLQ09xZERFZlpwNGZhdkVTYlNrVE5aU1NKdlU1UVFBcUdlYmlCTWtM?=
 =?utf-8?B?dDlUZjJOTUlmNXlTeEUyKy8wcFhoODA1R1NiWkI3Q0p2MXIreXZLckg4ODNn?=
 =?utf-8?B?ZllFdFFqZjdxVFlETlhJZHUyVURCTXgyRytmb2FTYWtZaFhvMjhTVzgwYjB0?=
 =?utf-8?B?WWNUSEJ3alhUbnFGTWxuS1dKc0Q2TlFwcHE1ck1mK3ZpWEhIeTNjM0RhdVhL?=
 =?utf-8?B?Slk1ai9VTmxSb3JCampCaEt4dUJReDBpS1FHcVp3T2ljYnpkTXVValVrRWpY?=
 =?utf-8?B?dTUvZGd1MWZjMXU0SE8rUVFWc1IvYU4wd3NORDBEK1lGU21oWmVxMzJ5Z0I2?=
 =?utf-8?B?Yjg5QnZRM3M5VVF2dXdwRm1PZmh5MktEMjl6UjU0Q1FRSGV2aWlHTDBUbmgz?=
 =?utf-8?B?N29vSDBzalF0RFp2Ri9sWndFOExNZWswOExoVmQ5QnRLL2VFTWJITUM5Qnhs?=
 =?utf-8?B?M1VwbjdUK0pRPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(4053099003)(38070700018); DIR:OUT;
 SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cVJNYktFUlJFSndGMzZVK1JHY0JlMUhUdVdrWG5IeGZITDc4QTdjMUpLMFNm?=
 =?utf-8?B?bGR3Rmt6U1dlN0JkWkNheEtCME1wZUJueDhxcmduMEJZZkVSYWZXYnhZdUM5?=
 =?utf-8?B?ZzRucXQ4N0VFSllDa0R6d2JSZ2JISzloclRnMkNOcGNGd3ZlcDdIdzZ5NFJq?=
 =?utf-8?B?OTFNV09tQmpFNEdSM3FROWhjeWdDazdwWnk1OFozUU9KVC9mM20rMVNqT3Ny?=
 =?utf-8?B?TmV5OExoRyt4ZnRUa1J1SWhsVEkxWUVsZFRHTzFZMDBTUWpUVVR4ZkV3Ulor?=
 =?utf-8?B?YnR0VFp2NnZFQnZ0cmphWmNjUkdkNXZTMEJJQ2VicVFoSG5jbENwT212U0sx?=
 =?utf-8?B?b2V3ZThMQTIxcUpEQUY0dVpyQWk0bXZlSzJMT1BIK0hiZlc4QjlESTRxMkFU?=
 =?utf-8?B?TWdaUXdsQTUrbHc4RFVjelBScjRUTmFYaFRQS1B4WXNycTJDZWpidXhDS2Ra?=
 =?utf-8?B?WE9ncUhSMzgrTjArdy9uajAwNVR6aDIzYUx4NVl0dk1iMTZjM1hUQzdTNi9L?=
 =?utf-8?B?L3RtOU41ZlIrbEhLRVA5SXR3enJmTytkZ09mUjJxS21oamRVRnFsck5BQWl6?=
 =?utf-8?B?YmlwR0FiYzNqSkhmZWwrblY0WEdqQ1Ztd2czK1hSbkMyVFliN3o4WUQwK2NM?=
 =?utf-8?B?anJKa005TXlZeUNKeEg2OG1KSWpwMVBIK3JTWlFpeHhqZnB2cU1TVGxwYWdQ?=
 =?utf-8?B?TmVpczBHTGF4TnFwQ2owK2NqWisrTzBDek5jbzk4a1kvakhBWTJSYnZYaC9H?=
 =?utf-8?B?YllWTmRxNGtHaHBTSTlrQ2ViWXpvYzVNMSttQTZsUUI3alprNXhMN1E1aitQ?=
 =?utf-8?B?Vnh2SUllZEREK0U3eDJBc0k5TmpUTC96MmVDZGVJS2VJdVBseGVtUTRaS0I2?=
 =?utf-8?B?UWFUV0hjU3NJZkFDZzNpTlVmbXdzdmErTTNzUmE0Y2lQN3RHemVydjE0NlRo?=
 =?utf-8?B?NWpIb3hlYi94UHNjMFVieVc0REF5SGVoNTRQOXBXdXhlRlVxV1M4V0tCMzR4?=
 =?utf-8?B?Q05DU0JMbmZVdmxncHBkclBoRXkzOVFSRERpMjVQUUdRaUpkNHVPeWZsb3hQ?=
 =?utf-8?B?bDRlNDU0MHhEeXFFQjNDcnlEUWcwUXBVMnRmNUVrV2t2NjJNUkNQVFRGTlEx?=
 =?utf-8?B?L1lyUGlpQmtEYzFhaEwrYzY3TGU2Z1B3NDNGMWlNaDlmbGFsQ0hGU2xJTkpq?=
 =?utf-8?B?T2dybXBkQWJZcmpLMEpEWGRDem9MaHFYQUpHbnNLcXlhaTRTc3duVFh4R1B3?=
 =?utf-8?B?cmRWSUFrbXQvMkxibktzY245eGx3OUFFajZINVFPb2ZTdG4wU0czOTlHUnAr?=
 =?utf-8?B?VXdOakpyWkFNbkxGT3h2Y1dMVjgxZmZ6RzM3b3ZSdmpLU25zMEJGM09NV1Q3?=
 =?utf-8?B?MkQwVEdkYkJmUDY4WWJocVA1eW5rY2VIVUhSSFZBS3c1Y0hTQ3FQNXluTUJB?=
 =?utf-8?B?VnB5T0tIcysyRmpmUWYvdHBSMmJyTXVhMk5Pd3hHN2dvckdWZlduWmFwaEFV?=
 =?utf-8?B?WENJN3pZTEpzT1ZUaFJoc1JtQVA4SjRoOUtJcFpRNktyOE96RkttTURuVnYy?=
 =?utf-8?B?M1pXdVpaQkFxbHdOQW90WUxENW94aTZab2d4VWVBZTh6TEdDd3g0ZUpJV2ZY?=
 =?utf-8?B?U3Rzc0Q1ZkZqVS9FWDVzYnhhTU9qeHBENS94VTFScXA5MFhab3ZZL21BSjdC?=
 =?utf-8?B?UEZyV0J4SkZDMnYrSDdZYVltM09XaE1ma0NUbGJvQVp0WW5sSXhRRTV5UENR?=
 =?utf-8?B?WmFBOGZzZkMyUTh3UU85U0k3NXZKZEsweXZJcUw2bVRTS1NtNDRoVFpXR1Rt?=
 =?utf-8?B?emtaTFZQM2h3bzFVTDlnbkQvY0N6VFhnNnZLenVlU2ZDSHgzRTliN2Z3Ymtr?=
 =?utf-8?B?RXRzQ2ZraDkwYkNIdW14VE04T04zcDFHWkV0bFRoVVl1bVdUK2FvQ3lRZmFY?=
 =?utf-8?B?cS95a01oS0NBbTkzTXFkeXpGWm56S3ZpK2NRQ21naXlhWVhHYlE1YzEvL21M?=
 =?utf-8?B?UW05Nzgwc0c2ckZPakxmTnNFeFFpaWxST2J2N0ZsU0JXSWRvaituWEx6OW1p?=
 =?utf-8?B?Z2MwenFNQkw4bFpiVmc2cFlrMS9FZytLK0o2bjRvRXBNcEl1NDVGMSsrSUdx?=
 =?utf-8?B?TUpOY0NRdVZPN0xKUm5zRnVzQlJ3Yko5RlcxV2F3ZnN2SzRBcEVPZmMzY1o2?=
 =?utf-8?B?Znc9PQ==?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Ol8DWgpkqdCmgdXwcOO0tEvJ"
MIME-Version: 1.0
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: feaa3a37-4dc1-4637-3114-08ddb988886b
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2025 16:50:21.1380 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bIZCuAbfFmNT1YtqsKS3wv2wEnDA25I6ucGsbDGLUVGhfd9Mq0OjjRf/OdG2hAezuIf1vTthe1gj03De5peUlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB3401
X-Proofpoint-ORIG-GUID: kq6ZgsMbZ1bA1IXu-C5O3FIUHhlV2PZ9
X-Proofpoint-GUID: kq6ZgsMbZ1bA1IXu-C5O3FIUHhlV2PZ9
X-Authority-Analysis: v=2.4 cv=JNM7s9Kb c=1 sm=1 tr=0 ts=68656350 cx=c_pps
 a=yaq00K9prcfTLPsZX4D6DQ==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10 a=NgoYpvdbvlAA:10 a=r_1tXGB3AAAA:8
 a=4U6UeLK507fo_c5QFXAA:9 a=QEXdDO2ut3YA:10 a=LUKTbpVRX47aZlhRm8MA:9
 a=FfaGCDsud1wA:10 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDA2OCBTYWx0ZWRfX497BVZxKIGNu
 7Ednoh/bRhmLEFDLvzr09LM7Bto5QPm3kybHAjnzN9CRRTmerUFdlNCsL6+BbFkecoCShziXxCj
 1wd8edM/uM4RhaoU91Cx+YOaqzMA5AEGaIV8pnvroLtx1SDyN7EqPhhU2mm+I/qR5GG77tS2Ocv
 j10HsrYa30XVoSVDimPWf4vBJMhpnrsyyQ80kKS00H5GQs3uFxXuv0zv4zv9pTCBUdN1yGGPtvZ
 dvR7ErLleoP073150JlNyQtVZTgz6/fNEJbTXOHHIdphYmlpN9ho9xyGUMnqNKdYTiPsoHTJPXw
 MJGaQUPXMXzX+zdQlLlHcoHOGtOd+6EpSZPTrJ/DKvvOtR5z5vY9hpPLbygry3rGJotuTWi6390
 KBFOwLeW
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

--------------Ol8DWgpkqdCmgdXwcOO0tEvJ
Content-Type: multipart/mixed; boundary="------------t3Ly4XpJOiT0d2DPXNFnXlTe";
 protected-headers="v1"
From: Matt Coster <matt.coster@imgtec.com>
To: Alessio Belle <alessio.belle@imgtec.com>
Cc: Frank Binns <frank.binns@imgtec.com>,
 Alexandru Dadu <alexandru.dadu@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Message-ID: <2ec47280-1032-4e7a-b381-e6f738a15dd5@imgtec.com>
Subject: Re: [PATCH] drm/imagination: Fix kernel crash when hard resetting the
 GPU
References: <20250624-fix-kernel-crash-gpu-hard-reset-v1-1-6d24810d72a6@imgtec.com>
In-Reply-To: <20250624-fix-kernel-crash-gpu-hard-reset-v1-1-6d24810d72a6@imgtec.com>

--------------t3Ly4XpJOiT0d2DPXNFnXlTe
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 24/06/2025 15:22, Alessio Belle wrote:
> The GPU hard reset sequence calls pm_runtime_force_suspend() and
> pm_runtime_force_resume(), which according to their documentation shoul=
d
> only be used during system-wide PM transitions to sleep states.
>=20
> The main issue though is that depending on some internal runtime PM
> state as seen by pm_runtime_force_suspend() (whether the usage count is=

> <=3D 1), pm_runtime_force_resume() might not resume the device unless
> needed. If that happens, the runtime PM resume callback
> pvr_power_device_resume() is not called, the GPU clocks are not
> re-enabled, and the kernel crashes on the next attempt to access GPU
> registers as part of the power-on sequence.
>=20
> Replace calls to pm_runtime_force_suspend() and
> pm_runtime_force_resume() with direct calls to the driver's runtime PM
> callbacks, pvr_power_device_suspend() and pvr_power_device_resume(),
> to ensure clocks are re-enabled and avoid the kernel crash.
>=20
> Fixes: cc1aeedb98ad ("drm/imagination: Implement firmware infrastructur=
e and META FW support")
>=20

Nit: no blank line here

> Signed-off-by: Alessio Belle <alessio.belle@imgtec.com>

Thanks for this fix! I'll push it to drm-misc-fixes on Friday if there
are no objections (with the blank line above removed; no need to re-send
for that), so:

Reviewed-by: Matt Coster <matt.coster@imgtec.com>

Cheers,
Matt

> ---
>  drivers/gpu/drm/imagination/pvr_power.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/imagination/pvr_power.c b/drivers/gpu/drm/=
imagination/pvr_power.c
> index 41f5d89e78b854cf6993838868a4416a220b490a..3e349d039fc0c4176b5c4ba=
f009ffa005a2b28d1 100644
> --- a/drivers/gpu/drm/imagination/pvr_power.c
> +++ b/drivers/gpu/drm/imagination/pvr_power.c
> @@ -386,13 +386,13 @@ pvr_power_reset(struct pvr_device *pvr_dev, bool =
hard_reset)
>                 if (!err) {
>                         if (hard_reset) {
>                                 pvr_dev->fw_dev.booted =3D false;
> -                               WARN_ON(pm_runtime_force_suspend(from_p=
vr_device(pvr_dev)->dev));
> +                               WARN_ON(pvr_power_device_suspend(from_p=
vr_device(pvr_dev)->dev));
>=20
>                                 err =3D pvr_fw_hard_reset(pvr_dev);
>                                 if (err)
>                                         goto err_device_lost;
>=20
> -                               err =3D pm_runtime_force_resume(from_pv=
r_device(pvr_dev)->dev);
> +                               err =3D pvr_power_device_resume(from_pv=
r_device(pvr_dev)->dev);
>                                 pvr_dev->fw_dev.booted =3D true;
>                                 if (err)
>                                         goto err_device_lost;
>=20
> ---
> base-commit: 1a45ef022f0364186d4fb2f4e5255dcae1ff638a
> change-id: 20250619-fix-kernel-crash-gpu-hard-reset-1ed31981f8cd
>=20
> Best regards,
> --
> Alessio Belle <alessio.belle@imgtec.com>
>=20


--=20
Matt Coster
E: matt.coster@imgtec.com

--------------t3Ly4XpJOiT0d2DPXNFnXlTe--

--------------Ol8DWgpkqdCmgdXwcOO0tEvJ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCaGVjTAUDAAAAAAAKCRB5vBnz2d5qsKld
AP9czmezDyFj0zy3HWy+9DhzmCEJ5EHMn337gDeRX9yGOQD/S5yUXwtFyGLobzE6DLoykoRetIF5
11lljM/1IpdF0AU=
=nPtV
-----END PGP SIGNATURE-----

--------------Ol8DWgpkqdCmgdXwcOO0tEvJ--
