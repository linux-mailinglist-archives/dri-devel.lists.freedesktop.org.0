Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43223B2856B
	for <lists+dri-devel@lfdr.de>; Fri, 15 Aug 2025 19:54:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8836410E283;
	Fri, 15 Aug 2025 17:54:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.b="l/1Emkos";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazolkn19010003.outbound.protection.outlook.com [52.103.43.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9926910E27D;
 Fri, 15 Aug 2025 17:54:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CQjA1HFhQUZ9cvbZJOQ3xyzaJbKqg7Lrnah2KHbFBemiihgBC5E4HLxOoZIHkgIj96a1UL3ibRuILqO0wBnpGieq0D2mtGIajMH9tUvmymB4hkHcJtus4CTachChRvnLvq5rGtnIrume738tlJZedOT9EP1T0v3yVjOdJCD3nRf07Xc9zXDJjUlP1/W20eCFCrIbP8ox9EPVYWxqOEQwOmvI0NMNefBF9m57wMOJBY4MXKnJjIYo8E7Cx8hvdi86VLdRI81QhWgCP/9N1fw0hOLcZ3U94YmX1NzRNL9GZktnta4pYb9NeYQkyTKiYTYu9+2mEsguhCRv7mdpTFIZGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pnAmOCxKFnnGzvPHCUoIgLkYpgT1auGN2E28YMivlEw=;
 b=ckDvvLbMMm4O/PP+8vVE9u8uDjXNXsvLxqx5csMJV4rHwaBmKOjU3d3zmJsaSZdIt87gl0MhCepyuZIWO5xE6a0v0xPxopsPf9iS97+m+ZCoLxPzKgHrPM5HuylmKkjCieQ/+kbS1iwrwmMTWaBKtmNsR79o9HFzcIusLOkgDwwCxTXFxJ+3GWdJUS3h9Gcv2KRL8Xtx2Z8CZgHwWTF3Gok55pwibS3cdK/8D7wi1BK4wmtA6oyFrOxWS3h8Rzrdv2+rbZYLyHmD5uWouwsaMWXMBw1DhUFKfd0KPtN9vrAtXfl9R5umqWfXrvoce2WWedtZndyFDxmzHB+AdR339A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pnAmOCxKFnnGzvPHCUoIgLkYpgT1auGN2E28YMivlEw=;
 b=l/1EmkosNsgikhJMvFY6FqjBuorhuOtXskfPY/56h/KrqP+u24eFqQIIVH1wcnDx2VNFKE0+JLH12t0XRkbg+ztEIZ1ZDHth2orzHWFxcLr1c7DKmgBXCETxvA7iGtir2tJecBXhm8UrW+18u+8HkMwKXgM0cod+1pxSjy5lf5zlY45VxF1xIoAHPK3qjdwCI69EMDVWY9Xo3jVKk05jkES/huZi65TFPm4kT7IEMv3+65SvPdaQG/O1RVynDqegT/mQ8vbaLP3vFgK2P+wru3kTG5QCLbL6lIzoBjHf1odmlr6FeyCzI9s8fxBQZYUzxNA60zUloMXladcxZzBoEg==
Received: from TY4PR01MB14432.jpnprd01.prod.outlook.com
 (2603:1096:405:235::10) by TYWPR01MB10630.jpnprd01.prod.outlook.com
 (2603:1096:400:2a2::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.18; Fri, 15 Aug
 2025 17:54:43 +0000
Received: from TY4PR01MB14432.jpnprd01.prod.outlook.com
 ([fe80::7679:e9eb:aeb2:f12f]) by TY4PR01MB14432.jpnprd01.prod.outlook.com
 ([fe80::7679:e9eb:aeb2:f12f%7]) with mapi id 15.20.9031.014; Fri, 15 Aug 2025
 17:54:43 +0000
From: Qu Shengyu <wiagn233@outlook.com>
To: Alex Hung <alex.hung@amd.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
CC: "wayland-devel@lists.freedesktop.org"
 <wayland-devel@lists.freedesktop.org>, "harry.wentland@amd.com"
 <harry.wentland@amd.com>, "alex.hung@amd.com" <alex.hung@amd.com>,
 "leo.liu@amd.com" <leo.liu@amd.com>, "ville.syrjala@linux.intel.com"
 <ville.syrjala@linux.intel.com>, "pekka.paalanen@collabora.com"
 <pekka.paalanen@collabora.com>, "contact@emersion.fr" <contact@emersion.fr>,
 "mwen@igalia.com" <mwen@igalia.com>, "jadahl@redhat.com" <jadahl@redhat.com>, 
 "sebastian.wick@redhat.com" <sebastian.wick@redhat.com>,
 "shashank.sharma@amd.com" <shashank.sharma@amd.com>, "agoins@nvidia.com"
 <agoins@nvidia.com>, "joshua@froggi.es" <joshua@froggi.es>,
 "mdaenzer@redhat.com" <mdaenzer@redhat.com>, "aleixpol@kde.org"
 <aleixpol@kde.org>, "xaver.hugl@gmail.com" <xaver.hugl@gmail.com>,
 "victoria@system76.com" <victoria@system76.com>, "daniel@ffwll.ch"
 <daniel@ffwll.ch>, "uma.shankar@intel.com" <uma.shankar@intel.com>,
 "quic_naseer@quicinc.com" <quic_naseer@quicinc.com>,
 "quic_cbraga@quicinc.com" <quic_cbraga@quicinc.com>,
 "quic_abhinavk@quicinc.com" <quic_abhinavk@quicinc.com>, "marcan@marcan.st"
 <marcan@marcan.st>, "Liviu.Dudau@arm.com" <Liviu.Dudau@arm.com>,
 "sashamcintosh@google.com" <sashamcintosh@google.com>,
 "chaitanya.kumar.borah@intel.com" <chaitanya.kumar.borah@intel.com>,
 "louis.chauvet@bootlin.com" <louis.chauvet@bootlin.com>, "mcanal@igalia.com"
 <mcanal@igalia.com>, "nfraprado@collabora.com" <nfraprado@collabora.com>,
 Daniel Stone <daniels@collabora.com>
Subject: Re: [PATCH V11 31/47] drm/colorop: add BT2020/BT709 OETF and Inverse
 OETF
Thread-Topic: [PATCH V11 31/47] drm/colorop: add BT2020/BT709 OETF and Inverse
 OETF
Thread-Index: AQHcDcECURG+hvA2l0O++80PCL2lArRj/pjj
Date: Fri, 15 Aug 2025 17:54:41 +0000
Message-ID: <TY4PR01MB14432C77EDFD80D2075FFCC2A9834A@TY4PR01MB14432.jpnprd01.prod.outlook.com>
References: <20250815035047.3319284-1-alex.hung@amd.com>
 <20250815035047.3319284-32-alex.hung@amd.com>
In-Reply-To: <20250815035047.3319284-32-alex.hung@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-reactions: allow
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY4PR01MB14432:EE_|TYWPR01MB10630:EE_
x-ms-office365-filtering-correlation-id: a40bf3ab-7aa2-4d65-7694-08dddc24cf76
x-ms-exchange-slblob-mailprops: YfhX3sd/0TVWrg+fxRScxfg9v9HXnUFlDHpcWTKvP9hpsfY9wDplAGbA52ZQAA21x2VCR9hYSOXp0zEhN4y3NawjTTjJLp4pd3TQCEz3Pwk9D3oObo0ia6K1iruIH/oR98iIPuxYrN3RUvYlx7ihS4JY7O7LFNmMyGEGrG5qvvHwLElwGzXPrdionYa7/BOZnkS/wAtM4Kxhr7nQBjqPTpwJ6Q3upQuVayp39XPXnXTjVe0h5/4XqHhADAPjxgPXNZKcsN3M+EmXAghkYJL8zNAr+0fCSQz+w8XaRr4lW1o3390Yaq2b/UfMxlN5W9shfmAFywkGL08yQIu6F/I7lIRX2pcf9DeCKLSuGM/0sA1UwAAJyQLx5CurkOWO947DnDGyU+zGw0KjPlLROTYLJ8mtdXYpK+W4HW6/PjjyjiiLRh9JAlmKVmKTiEXStraydPWZ/tJH6t65dCSMiO7IBGNf2Kg3g2LBHDhbEbTBVEJCfZ9orD+Nigah8rZCqg0pbrlmkyInM0xe0XtpPUZkh0pUZ+jOfwlhh8qC/H1QautV/ttN7adY4LWkLcrjgElg9gW9ZL/AjpMVjMuNsd5iMfCtfqnvC0f/25qLhO7bRkbyh+yH+n15VUOpPY+47Injkd+DrhAxbi4v3P1IboKxGffUpyC1zAbTntPq8zW/gYfU65i8gF9yzAgmierEoVNp9F4njU+8LSzph2RyLGEQVWbnG7nKF+6byWlG/Y0pjIkrNown8SgSlx2kpUh7RGDhUqAwOrdKeclS0rB1irIGD0srBF+MPkR1aLZFwfX8tOc=
x-microsoft-antispam: BCL:0;
 ARA:14566002|15080799012|461199028|31061999003|19110799012|14030799003|8062599012|8060799015|3412199025|440099028|40105399003|26104999006|102099032;
x-microsoft-antispam-message-info: =?gb2312?B?b21WQWprNVRMY3dweEc4UDRkNzc0VHpQWWtSaVdQU2Q5ZU9WTlV5OUtrdnZr?=
 =?gb2312?B?VnRzMUFwU1lZZDYwT2paOXhCbHdWQTVKOTRrN3JKNVpjUHBLcmZRcWhCSnNo?=
 =?gb2312?B?MUNhZmdoL2ZDOE0zZzJabW5yOWZYT1N3d083dktoUWdPZlJpMnBIMjZBRHhw?=
 =?gb2312?B?Ny82RnJwV0U4YjRiNURFdVJ4TUc2MmE5ZUpXa2xDdVVNK3Z0ZkNqcmJTMUtJ?=
 =?gb2312?B?cG1kMDRsME1QY1FjWWFJT2EyRXFCQUR5RVhieTgwWkVmaVRpZFI4bG50WkpL?=
 =?gb2312?B?Uk15ZnZLM3VWamZGdU5YUkJvUFBZRGJBT1VYTHBjVmszVzhjNi93ZUZzczF1?=
 =?gb2312?B?L3R2MWp0OFlGd0pTUEhUbzR3N1Jwamx5RWZWdXpGckdZVE9mbzJRb1Jsak04?=
 =?gb2312?B?NXVFeURBMjRKc3JWVGNURHRDaXNNR1ZZZjlJbEp4c3hFUlVxRGVWTmNkc2xu?=
 =?gb2312?B?YWJHWDFsV29rUStjSTZGLzlVZzhhSFpiaDBZeWNNTHUxcThJQXpyVnZtcW5z?=
 =?gb2312?B?V09RRklVVktnck1FZE4xeXNTVm9ycCt3aG1WTXBFS280VU5ad0ZON0Z4TmR0?=
 =?gb2312?B?TmxBOEhFK001YnY4WWlreWFpVkxONzdZTzBFYWI2L20yZGZncFlnZlJMNFlF?=
 =?gb2312?B?aWFlbi9ZYkNFc2lNRzFxQTdEWjhWcGpnV043aENJbyttc0YwV3dVVE1WY1ll?=
 =?gb2312?B?WlN0WU15MHJ2OVRzMUttN1VqeUhIdUNxUVBwNnpTM2NxaitFMzlpenlEb3lJ?=
 =?gb2312?B?M1RCWjV4R1YwcEJVTTRCeTV3S2JJYnV4NXhxZ3JJOU1zTWgwYXFPMGI2cHN6?=
 =?gb2312?B?dUUwbWNaY29HYmpoZmZVU20rVEhWVDZSMGNNSnRid2U2NyttUnhheFozOEFk?=
 =?gb2312?B?akhmWGt2amIzZjlZMjVRMkw1WlNudDhLVmFWQnR5bVVGM0Ftek1oclcvR084?=
 =?gb2312?B?cm9jdCtnanZaVWM3MVdXeHdhUzhrYmFyQUpjYWNYR0tsT0Q4L0VYYnZPQ1NY?=
 =?gb2312?B?cytYdkVDcnBBd0VvUHhLQ09GVGY3MFF3bGxJSzZVNkcyVUl3RWZGZVpzWW01?=
 =?gb2312?B?QUFlTVk4YTZzZHdnN1pwalZnTHdxWUxpTG10THBlOFc1T2E3a2RTWVZhU2Ju?=
 =?gb2312?B?d3kwR1ZVa3RuRnB4TnFFWVRlcFA2b1djT3VndnhPa3ZUVDZab2RiOFRXMnVr?=
 =?gb2312?B?MjlId1Z5V2tCY05HTDd6T0pJS2ppSEJvMWRLNGZxZlU1LzJYc216YitHRHFj?=
 =?gb2312?B?dE1HWE5IRFNCZU9ROWJ2cGxxcmt3cC8xNlJUdUhQSWUrUDJjblQ0RDhGRm9T?=
 =?gb2312?B?VExDZ0pSSEpqeE1IdnFyNUt4NFY2UWVzYkg2N1ZPckFQVXplaDJ6d0p2bGtX?=
 =?gb2312?B?QXZjMkorNGJEeHJ4ODdaZEc0SU95R2Qrd25VNFRMMHhnSVE2OUNiY08reGpY?=
 =?gb2312?B?Q2lZYU1OalNVVjhJT0tJekE3amlUeWJXOG4vZFBhdDY3WU83OTl3cWFrck5R?=
 =?gb2312?B?YVR6UjhKTHR6ekEwNEZ2TE1hRHpySkdVRkxhL1ViaGw3Z1dDOXVGL3d3ZHlh?=
 =?gb2312?B?V0NVMUlEd09VNEVwNzVucndabk02R1ZvanBoRTVlb2NrdG5lS2tKWThDaHUw?=
 =?gb2312?B?UHlSQ0JLY0V4WStqMENNWHBmaHVPMkE9PQ==?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?VDFJcThpNHBRV3FGV080NkFhMW5KbFpXcFRBbllwL09vVzBqZTh1NldKeXlN?=
 =?gb2312?B?bjk1ODhoemRXcUR5N2xzbFVWN2oxc2pTcEluTVRoYzFyOGdJMHB3T3BoYjV1?=
 =?gb2312?B?cmt2dmdteE5GcjRDaHZ4eTJDYklSeFJhVDh2b1lLeXRvamYrbVJMTXZodk8y?=
 =?gb2312?B?bFlkVnhRRDZlWHNyREoyOHY5WlVmL2ZsTEdpVGMyeHpjZmpPT1BoL3RYb2g0?=
 =?gb2312?B?clVqaUVrMDFDampKejdXVFlOQjNjejhLOWpvbjE4b2d4eHR3a2hSMktsSVgv?=
 =?gb2312?B?M1pFKzhCeFdNMVI1NVRrMzFialMzM1kyTU5ndFJzNUhZM1VjdVRhaXZaTzJG?=
 =?gb2312?B?UHVxc3JMNlBsVW5vazNCWW5PZitGTGdtS2s0RFlpV2g2eDl2ZkIvSEZ4Vi9D?=
 =?gb2312?B?ZGFBc0gvR1M2VHFPMDRDcGN6bDM4dlZCOVJ6cGNTMElwRUFTWHpCd2QwYTJJ?=
 =?gb2312?B?SWRYY0krUW5ZaXdIK3BlSFdENFJFbS9HU1B1a2o3ZmNiOFdTWXZ6RXJJK3Fl?=
 =?gb2312?B?TzY3eVpGQ09NRi9BVnpjQ2x1YittYzlyMkxzUXgycHRGV0lsR1E4V2Radk5U?=
 =?gb2312?B?QU9WWTduWnVDTmhteE1hSnNDeFpyYlpWQUpNK1VLdWN4OFZ2aDVYQWxYczBH?=
 =?gb2312?B?NExmM0Y1dkJWaHo0TWtEV0tNSVljV2N0SDZsaG9ZdWg0NkorT1YvY2pwWTdQ?=
 =?gb2312?B?Z0gxWEt0eDdZVUl3Qm1BYWl6dlJFMDQrV0dIa3Rya1BIZzJwTGhNaXRVc09I?=
 =?gb2312?B?eUxwVEF0Uy8wcm8zK2RlVG1xNlZGdVJtN2VkQTB3SVpuY0Z5MjZ6ZlZkdDFZ?=
 =?gb2312?B?S2s5Qm9VS2RwVmlOdTN3eklDSytNTDhYYnkxUmEvTTR3ZVU3M0JPbElnYWoz?=
 =?gb2312?B?S0g4bzZtZmFQajk2a2YyTkgwUjNpU3hKd0FNZzkzWEJPbURYSGM4MTNEbmtl?=
 =?gb2312?B?b0k1b3kwTGg1Z0R0TzRaK0VUN1pIQXRya25QV2M2T1dDYXZMdXBMS3FjYVFK?=
 =?gb2312?B?NHcza3NyME0rdG1JU3BQc1BHYS9hT2p3QUEwYTUyWkhDOWVIZ3IyT3FhN0Ew?=
 =?gb2312?B?ZzdwM014M0RWQXFLZnFJRWtVOEFQUUxCT0lyQmZaUnY4b1NCUXNYZWlEM0w0?=
 =?gb2312?B?RFhxQnE5cEw1NWZEYkVxODhpa2g4MitMbm91cW9OL1M5MmtRckNrbHAzQ3B4?=
 =?gb2312?B?d1ludklvbzlhd3crbThOOXZGY0c2MnVueHptamYvRCtwb08xMlE3TVl1ella?=
 =?gb2312?B?THRzbmR0b05aVTFVZ1h0SGlzZmcrNmZCZW5HL0kzUVQ5RndXV3BwaGRaTk1t?=
 =?gb2312?B?L2ZIdzZzVkV3ZEd2NmRqV1VuWnQzN1gybG03QlJ1QWI1elFlQXo3MTJibkhl?=
 =?gb2312?B?c25IV1ZlZDFDOS9FS0dzOWVZbUs1WUFoaEYzMnhMZWpsKzRwM2NFODkrTnJ4?=
 =?gb2312?B?S25admh3Z0F1Ujh5KzhoTFY5WXpINkxYRlpla1IrSlFDVzlnUXFjM0wwdU1v?=
 =?gb2312?B?WHhCdFIrdThlVWR0eFlEd2tQaDFyRmdNTVBzZllBWHdVVXZDQk5sRXNQOXpz?=
 =?gb2312?B?NjlwWVhHZUdraFRGdVlvUlpBYTN2Rllvelh5QlVGQkhndVVoWWJudThnZExC?=
 =?gb2312?B?VGxYaHZqaFl1UnNuQ2tXZ1c0ZVluenEyOEdzQjQyRjR0QU9rbzROR2IrdlM3?=
 =?gb2312?B?ME1yZGNRc3dtN2pPOUxia2kxZ0dzS3BlVWhmRm8wb2pxQ1U2VE5hRHVDN2xo?=
 =?gb2312?Q?51I579PQmbUI3wl6yG4i/I3z1fr46cX3fkTtz3x?=
Content-Type: multipart/alternative;
 boundary="_000_TY4PR01MB14432C77EDFD80D2075FFCC2A9834ATY4PR01MB14432jp_"
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY4PR01MB14432.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: a40bf3ab-7aa2-4d65-7694-08dddc24cf76
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2025 17:54:41.3554 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10630
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

--_000_TY4PR01MB14432C77EDFD80D2075FFCC2A9834ATY4PR01MB14432jp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

SGVsbG8sDQoNCldoYXQgYWN0dWFsbHkgaXMgdGhpcyBPRVRGPyBJcyBpdCBwb3dlciAxLzIuND8g
T3IgcmV2ZXJzZWQgQlQuMTg4Nj8NCg0KQmVzdCByZWdhcmRzLA0KU2hlbmd5dQ0KDQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXw0Kt6K8/sjLOiBhbWQtZ2Z4IDxhbWQtZ2Z4LWJvdW5j
ZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiC0+rHtIEFsZXggSHVuZyA8YWxleC5odW5nQGFtZC5j
b20+DQq3osvNyrG85DogRnJpZGF5LCBBdWd1c3QgMTUsIDIwMjUgMTE6NTA6MjAgQU0NCsrVvP7I
yzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZyA8ZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZz47IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIDxhbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZz4NCrOty806IHdheWxhbmQtZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnIDx3YXlsYW5kLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz47IGhhcnJ5LndlbnRsYW5k
QGFtZC5jb20gPGhhcnJ5LndlbnRsYW5kQGFtZC5jb20+OyBhbGV4Lmh1bmdAYW1kLmNvbSA8YWxl
eC5odW5nQGFtZC5jb20+OyBsZW8ubGl1QGFtZC5jb20gPGxlby5saXVAYW1kLmNvbT47IHZpbGxl
LnN5cmphbGFAbGludXguaW50ZWwuY29tIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT47
IHBla2thLnBhYWxhbmVuQGNvbGxhYm9yYS5jb20gPHBla2thLnBhYWxhbmVuQGNvbGxhYm9yYS5j
b20+OyBjb250YWN0QGVtZXJzaW9uLmZyIDxjb250YWN0QGVtZXJzaW9uLmZyPjsgbXdlbkBpZ2Fs
aWEuY29tIDxtd2VuQGlnYWxpYS5jb20+OyBqYWRhaGxAcmVkaGF0LmNvbSA8amFkYWhsQHJlZGhh
dC5jb20+OyBzZWJhc3RpYW4ud2lja0ByZWRoYXQuY29tIDxzZWJhc3RpYW4ud2lja0ByZWRoYXQu
Y29tPjsgc2hhc2hhbmsuc2hhcm1hQGFtZC5jb20gPHNoYXNoYW5rLnNoYXJtYUBhbWQuY29tPjsg
YWdvaW5zQG52aWRpYS5jb20gPGFnb2luc0BudmlkaWEuY29tPjsgam9zaHVhQGZyb2dnaS5lcyA8
am9zaHVhQGZyb2dnaS5lcz47IG1kYWVuemVyQHJlZGhhdC5jb20gPG1kYWVuemVyQHJlZGhhdC5j
b20+OyBhbGVpeHBvbEBrZGUub3JnIDxhbGVpeHBvbEBrZGUub3JnPjsgeGF2ZXIuaHVnbEBnbWFp
bC5jb20gPHhhdmVyLmh1Z2xAZ21haWwuY29tPjsgdmljdG9yaWFAc3lzdGVtNzYuY29tIDx2aWN0
b3JpYUBzeXN0ZW03Ni5jb20+OyBkYW5pZWxAZmZ3bGwuY2ggPGRhbmllbEBmZndsbC5jaD47IHVt
YS5zaGFua2FyQGludGVsLmNvbSA8dW1hLnNoYW5rYXJAaW50ZWwuY29tPjsgcXVpY19uYXNlZXJA
cXVpY2luYy5jb20gPHF1aWNfbmFzZWVyQHF1aWNpbmMuY29tPjsgcXVpY19jYnJhZ2FAcXVpY2lu
Yy5jb20gPHF1aWNfY2JyYWdhQHF1aWNpbmMuY29tPjsgcXVpY19hYmhpbmF2a0BxdWljaW5jLmNv
bSA8cXVpY19hYmhpbmF2a0BxdWljaW5jLmNvbT47IG1hcmNhbkBtYXJjYW4uc3QgPG1hcmNhbkBt
YXJjYW4uc3Q+OyBMaXZpdS5EdWRhdUBhcm0uY29tIDxMaXZpdS5EdWRhdUBhcm0uY29tPjsgc2Fz
aGFtY2ludG9zaEBnb29nbGUuY29tIDxzYXNoYW1jaW50b3NoQGdvb2dsZS5jb20+OyBjaGFpdGFu
eWEua3VtYXIuYm9yYWhAaW50ZWwuY29tIDxjaGFpdGFueWEua3VtYXIuYm9yYWhAaW50ZWwuY29t
PjsgbG91aXMuY2hhdXZldEBib290bGluLmNvbSA8bG91aXMuY2hhdXZldEBib290bGluLmNvbT47
IG1jYW5hbEBpZ2FsaWEuY29tIDxtY2FuYWxAaWdhbGlhLmNvbT47IG5mcmFwcmFkb0Bjb2xsYWJv
cmEuY29tIDxuZnJhcHJhZG9AY29sbGFib3JhLmNvbT47IERhbmllbCBTdG9uZSA8ZGFuaWVsc0Bj
b2xsYWJvcmEuY29tPg0K1vfM4jogW1BBVENIIFYxMSAzMS80N10gZHJtL2NvbG9yb3A6IGFkZCBC
VDIwMjAvQlQ3MDkgT0VURiBhbmQgSW52ZXJzZSBPRVRGDQoNCkZyb206IEhhcnJ5IFdlbnRsYW5k
IDxoYXJyeS53ZW50bGFuZEBhbWQuY29tPg0KDQpUaGUgQlQuNzA5IGFuZCBCVC4yMDIwIE9FVEZz
IGFyZSB0aGUgc2FtZSwgdGhlIG9ubHkgZGlmZmVyZW5jZQ0KYmVpbmcgdGhhdCB0aGUgQlQuMjAy
MCB2YXJpYW50IGlzIGRlZmluZWQgd2l0aCBtb3JlIHByZWNpc2lvbg0KZm9yIDEwIGFuZCAxMi1i
aXQgcGVyIGNvbG9yIGVuY29kaW5ncy4NCg0KQm90aCBhcmUgdXNlZCBhcyBlbmNvZGluZyBmdW5j
dGlvbnMgZm9yIHZpZGVvIGNvbnRlbnQsIGFuZCBhcmUNCnRoZXJlZm9yZSBkZWZpbmVkIGFzIE9F
VEYgKG9wdG8tZWxlY3Ryb25pYyB0cmFuc2ZlciBmdW5jdGlvbikNCmluc3RlYWQgb2YgYXMgRU9U
RiAoZWxlY3Ryby1vcHRpY2FsIHRyYW5zZmVyIGZ1bmN0aW9uKS4NCg0KU2lnbmVkLW9mZi1ieTog
QWxleCBIdW5nIDxhbGV4Lmh1bmdAYW1kLmNvbT4NClNpZ25lZC1vZmYtYnk6IEhhcnJ5IFdlbnRs
YW5kIDxoYXJyeS53ZW50bGFuZEBhbWQuY29tPg0KUmV2aWV3ZWQtYnk6IERhbmllbCBTdG9uZSA8
ZGFuaWVsc0Bjb2xsYWJvcmEuY29tPg0KUmV2aWV3ZWQtYnk6IFNpbW9uIFNlciA8Y29udGFjdEBl
bWVyc2lvbi5mcj4NCi0tLQ0Kdjk6DQogLSBNb3ZlIERSTV9DT0xPUk9QXzFEX0NVUlZFX0JUMjAy
MF8qIGZyb20gbWlkZGxlIHRvIGVuZCAoU2ltb24gU2VyKQ0KDQogZHJpdmVycy9ncHUvZHJtL2Ry
bV9jb2xvcm9wLmMgfCAgMiArKw0KIGluY2x1ZGUvZHJtL2RybV9jb2xvcm9wLmggICAgIHwgMjMg
KysrKysrKysrKysrKysrKysrKysrKysNCiAyIGZpbGVzIGNoYW5nZWQsIDI1IGluc2VydGlvbnMo
KykNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fY29sb3JvcC5jIGIvZHJpdmVy
cy9ncHUvZHJtL2RybV9jb2xvcm9wLmMNCmluZGV4IDViYjQ1OTYzZmExZi4uYzI0NWEzZmY0NWQz
IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9jb2xvcm9wLmMNCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9kcm1fY29sb3JvcC5jDQpAQCAtNzIsNiArNzIsOCBAQCBzdGF0aWMgY29uc3Qg
Y2hhciAqIGNvbnN0IGNvbG9yb3BfY3VydmVfMWRfdHlwZV9uYW1lc1tdID0gew0KICAgICAgICAg
W0RSTV9DT0xPUk9QXzFEX0NVUlZFX1NSR0JfSU5WX0VPVEZdID0gInNSR0IgSW52ZXJzZSBFT1RG
IiwNCiAgICAgICAgIFtEUk1fQ09MT1JPUF8xRF9DVVJWRV9QUV8xMjVfRU9URl0gPSAiUFEgMTI1
IEVPVEYiLA0KICAgICAgICAgW0RSTV9DT0xPUk9QXzFEX0NVUlZFX1BRXzEyNV9JTlZfRU9URl0g
PSAiUFEgMTI1IEludmVyc2UgRU9URiIsDQorICAgICAgIFtEUk1fQ09MT1JPUF8xRF9DVVJWRV9C
VDIwMjBfSU5WX09FVEZdID0gIkJULjIwMjAgSW52ZXJzZSBPRVRGIiwNCisgICAgICAgW0RSTV9D
T0xPUk9QXzFEX0NVUlZFX0JUMjAyMF9PRVRGXSA9ICJCVC4yMDIwIE9FVEYiLA0KIH07DQoNCg0K
ZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9jb2xvcm9wLmggYi9pbmNsdWRlL2RybS9kcm1f
Y29sb3JvcC5oDQppbmRleCBhMzhjOTBmNjFkYzYuLmM2ZDJiMjg5ZTNjZiAxMDA2NDQNCi0tLSBh
L2luY2x1ZGUvZHJtL2RybV9jb2xvcm9wLmgNCisrKyBiL2luY2x1ZGUvZHJtL2RybV9jb2xvcm9w
LmgNCkBAIC04Myw2ICs4MywyOSBAQCBlbnVtIGRybV9jb2xvcm9wX2N1cnZlXzFkX3R5cGUgew0K
ICAgICAgICAgICovDQogICAgICAgICBEUk1fQ09MT1JPUF8xRF9DVVJWRV9QUV8xMjVfSU5WX0VP
VEYsDQoNCisgICAgICAgLyoqDQorICAgICAgICAqIEBEUk1fQ09MT1JPUF8xRF9DVVJWRV9CVDIw
MjBfSU5WX09FVEY6DQorICAgICAgICAqDQorICAgICAgICAqIGVudW0gc3RyaW5nICJCVC4yMDIw
IEludmVyc2UgT0VURiINCisgICAgICAgICoNCisgICAgICAgICogVGhlIGludmVyc2Ugb2YgJkRS
TV9DT0xPUk9QXzFEX0NVUlZFX0JUMjAyMF9PRVRGDQorICAgICAgICAqLw0KKyAgICAgICBEUk1f
Q09MT1JPUF8xRF9DVVJWRV9CVDIwMjBfSU5WX09FVEYsDQorDQorICAgICAgIC8qKg0KKyAgICAg
ICAgKiBARFJNX0NPTE9ST1BfMURfQ1VSVkVfQlQyMDIwX09FVEY6DQorICAgICAgICAqDQorICAg
ICAgICAqIGVudW0gc3RyaW5nICJCVC4yMDIwIE9FVEYiDQorICAgICAgICAqDQorICAgICAgICAq
IFRoZSBCVC4yMDIwL0JULjcwOSB0cmFuc2ZlciBmdW5jdGlvbi4gVGhlIEJULjcwOSBhbmQgQlQu
MjAyMA0KKyAgICAgICAgKiB0cmFuc2ZlciBmdW5jdGlvbnMgYXJlIHRoZSBzYW1lLCB0aGUgb25s
eSBkaWZmZXJlbmNlIGlzIHRoYXQNCisgICAgICAgICogQlQuMjAyMCBpcyBkZWZpbmVkIHdpdGgg
bW9yZSBwcmVjaXNpb24gZm9yIDEwIGFuZCAxMi1iaXQNCisgICAgICAgICogZW5jb2RpbmdzLg0K
KyAgICAgICAgKg0KKyAgICAgICAgKg0KKyAgICAgICAgKi8NCisgICAgICAgRFJNX0NPTE9ST1Bf
MURfQ1VSVkVfQlQyMDIwX09FVEYsDQorDQogICAgICAgICAvKioNCiAgICAgICAgICAqIEBEUk1f
Q09MT1JPUF8xRF9DVVJWRV9DT1VOVDoNCiAgICAgICAgICAqDQotLQ0KMi40My4wDQoNCg==

--_000_TY4PR01MB14432C77EDFD80D2075FFCC2A9834ATY4PR01MB14432jp_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
</head>
<body>
<div style=3D"font-family: Aptos, -apple-system, HelveticaNeue, sans-serif;=
font-size: 12pt">
<div dir=3D"ltr" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-s=
ystem, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt;">
Hello,</div>
<div dir=3D"ltr" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-s=
ystem, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt;">
<br>
</div>
<div dir=3D"ltr" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-s=
ystem, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt;">
What actually is this OETF? Is it power 1/2.4? Or reversed BT.1886?</div>
<div dir=3D"ltr" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-s=
ystem, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt;">
<br>
</div>
<div dir=3D"ltr" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-s=
ystem, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt;">
Best regards,</div>
<div dir=3D"ltr" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-s=
ystem, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt;">
Shengyu&nbsp;</div>
</div>
<div id=3D"ms-outlook-mobile-body-separator-line" style=3D"font-family: Apt=
os, -apple-system, HelveticaNeue, sans-serif;font-size: 12pt" dir=3D"auto">
<br>
</div>
<div id=3D"ms-outlook-mobile-signature" style=3D"font-family: Aptos, -apple=
-system, HelveticaNeue, sans-serif;font-size: 12pt">
<div></div>
</div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>=B7=A2=BC=FE=C8=CB:</b> amd-gfx=
 &lt;amd-gfx-bounces@lists.freedesktop.org&gt; =B4=FA=B1=ED Alex Hung &lt;a=
lex.hung@amd.com&gt;<br>
<b>=B7=A2=CB=CD=CA=B1=BC=E4:</b> Friday, August 15, 2025 11:50:20 AM<br>
<b>=CA=D5=BC=FE=C8=CB:</b> dri-devel@lists.freedesktop.org &lt;dri-devel@li=
sts.freedesktop.org&gt;; amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.fr=
eedesktop.org&gt;<br>
<b>=B3=AD=CB=CD:</b> wayland-devel@lists.freedesktop.org &lt;wayland-devel@=
lists.freedesktop.org&gt;; harry.wentland@amd.com &lt;harry.wentland@amd.co=
m&gt;; alex.hung@amd.com &lt;alex.hung@amd.com&gt;; leo.liu@amd.com &lt;leo=
.liu@amd.com&gt;; ville.syrjala@linux.intel.com &lt;ville.syrjala@linux.int=
el.com&gt;;
 pekka.paalanen@collabora.com &lt;pekka.paalanen@collabora.com&gt;; contact=
@emersion.fr &lt;contact@emersion.fr&gt;; mwen@igalia.com &lt;mwen@igalia.c=
om&gt;; jadahl@redhat.com &lt;jadahl@redhat.com&gt;; sebastian.wick@redhat.=
com &lt;sebastian.wick@redhat.com&gt;; shashank.sharma@amd.com
 &lt;shashank.sharma@amd.com&gt;; agoins@nvidia.com &lt;agoins@nvidia.com&g=
t;; joshua@froggi.es &lt;joshua@froggi.es&gt;; mdaenzer@redhat.com &lt;mdae=
nzer@redhat.com&gt;; aleixpol@kde.org &lt;aleixpol@kde.org&gt;; xaver.hugl@=
gmail.com &lt;xaver.hugl@gmail.com&gt;; victoria@system76.com &lt;victoria@=
system76.com&gt;;
 daniel@ffwll.ch &lt;daniel@ffwll.ch&gt;; uma.shankar@intel.com &lt;uma.sha=
nkar@intel.com&gt;; quic_naseer@quicinc.com &lt;quic_naseer@quicinc.com&gt;=
; quic_cbraga@quicinc.com &lt;quic_cbraga@quicinc.com&gt;; quic_abhinavk@qu=
icinc.com &lt;quic_abhinavk@quicinc.com&gt;; marcan@marcan.st
 &lt;marcan@marcan.st&gt;; Liviu.Dudau@arm.com &lt;Liviu.Dudau@arm.com&gt;;=
 sashamcintosh@google.com &lt;sashamcintosh@google.com&gt;; chaitanya.kumar=
.borah@intel.com &lt;chaitanya.kumar.borah@intel.com&gt;; louis.chauvet@boo=
tlin.com &lt;louis.chauvet@bootlin.com&gt;; mcanal@igalia.com
 &lt;mcanal@igalia.com&gt;; nfraprado@collabora.com &lt;nfraprado@collabora=
.com&gt;; Daniel Stone &lt;daniels@collabora.com&gt;<br>
<b>=D6=F7=CC=E2:</b> [PATCH V11 31/47] drm/colorop: add BT2020/BT709 OETF a=
nd Inverse OETF</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">From: Harry Wentland &lt;harry.wentland@amd.com&gt=
;<br>
<br>
The BT.709 and BT.2020 OETFs are the same, the only difference<br>
being that the BT.2020 variant is defined with more precision<br>
for 10 and 12-bit per color encodings.<br>
<br>
Both are used as encoding functions for video content, and are<br>
therefore defined as OETF (opto-electronic transfer function)<br>
instead of as EOTF (electro-optical transfer function).<br>
<br>
Signed-off-by: Alex Hung &lt;alex.hung@amd.com&gt;<br>
Signed-off-by: Harry Wentland &lt;harry.wentland@amd.com&gt;<br>
Reviewed-by: Daniel Stone &lt;daniels@collabora.com&gt;<br>
Reviewed-by: Simon Ser &lt;contact@emersion.fr&gt;<br>
---<br>
v9:<br>
&nbsp;- Move DRM_COLOROP_1D_CURVE_BT2020_* from middle to end (Simon Ser)<b=
r>
<br>
&nbsp;drivers/gpu/drm/drm_colorop.c |&nbsp; 2 ++<br>
&nbsp;include/drm/drm_colorop.h&nbsp;&nbsp;&nbsp;&nbsp; | 23 ++++++++++++++=
+++++++++<br>
&nbsp;2 files changed, 25 insertions(+)<br>
<br>
diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c<=
br>
index 5bb45963fa1f..c245a3ff45d3 100644<br>
--- a/drivers/gpu/drm/drm_colorop.c<br>
+++ b/drivers/gpu/drm/drm_colorop.c<br>
@@ -72,6 +72,8 @@ static const char * const colorop_curve_1d_type_names[] =
=3D {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [DRM_COLOROP_1D_CURVE_SRGB=
_INV_EOTF] =3D &quot;sRGB Inverse EOTF&quot;,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [DRM_COLOROP_1D_CURVE_PQ_1=
25_EOTF] =3D &quot;PQ 125 EOTF&quot;,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [DRM_COLOROP_1D_CURVE_PQ_1=
25_INV_EOTF] =3D &quot;PQ 125 Inverse EOTF&quot;,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [DRM_COLOROP_1D_CURVE_BT2020_INV_OETF=
] =3D &quot;BT.2020 Inverse OETF&quot;,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [DRM_COLOROP_1D_CURVE_BT2020_OETF] =
=3D &quot;BT.2020 OETF&quot;,<br>
&nbsp;};<br>
&nbsp;<br>
&nbsp;<br>
diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h<br>
index a38c90f61dc6..c6d2b289e3cf 100644<br>
--- a/include/drm/drm_colorop.h<br>
+++ b/include/drm/drm_colorop.h<br>
@@ -83,6 +83,29 @@ enum drm_colorop_curve_1d_type {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DRM_COLOROP_1D_CURVE_PQ_12=
5_INV_EOTF,<br>
&nbsp;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /**<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * @DRM_COLOROP_1D_CURVE_BT2020_=
INV_OETF:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * enum string &quot;BT.2020 Inv=
erse OETF&quot;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * The inverse of &amp;DRM_COLOR=
OP_1D_CURVE_BT2020_OETF<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DRM_COLOROP_1D_CURVE_BT2020_INV_OETF,=
<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /**<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * @DRM_COLOROP_1D_CURVE_BT2020_=
OETF:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * enum string &quot;BT.2020 OET=
F&quot;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * The BT.2020/BT.709 transfer f=
unction. The BT.709 and BT.2020<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * transfer functions are the sa=
me, the only difference is that<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * BT.2020 is defined with more =
precision for 10 and 12-bit<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * encodings.<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DRM_COLOROP_1D_CURVE_BT2020_OETF,<br>
+<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /**<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * @DRM_COLOROP_1D_CU=
RVE_COUNT:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *<br>
-- <br>
2.43.0<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_TY4PR01MB14432C77EDFD80D2075FFCC2A9834ATY4PR01MB14432jp_--
