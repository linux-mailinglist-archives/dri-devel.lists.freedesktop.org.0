Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3367AA6DD62
	for <lists+dri-devel@lfdr.de>; Mon, 24 Mar 2025 15:49:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76F3310E309;
	Mon, 24 Mar 2025 14:49:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="BiLS7rNi";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="LMueOwoG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A463E10E309
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Mar 2025 14:49:37 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52OETf1j000978;
 Mon, 24 Mar 2025 14:49:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=dk201812; bh=3R+DdQwKwGF/MkcqBaAocrp65
 b6XD4vLNSqI+4tybfU=; b=BiLS7rNijtopupt8KgFsOZQv2oP/1UmPkZ3udgfIM
 TtANUXVdA1AZLPWb0E7IkPpBDi5BpkLPuqWi/i6FuDRhk30/W/wAzcR72RT6Vean
 XJiL7kzWgqqHbMqgS9vQxl/jx5DJL94mhVmVsPfGCHJV3vPVS4qpzcs+ZT4wRHDW
 01fk9Bmtv3v9d8OUl1mc4E1CQFm+6LpeELD+k5W2PWBmg3al+N7KGIw3UayvEYIB
 Vz2InM/ULc9DAkUSd2BcfSiExoMudflx0daySwWj7TtBph1N+9m65eyVi61OzsUt
 DUCEJ/Dkajsxxek6Rka3QeOsRrh16COJqsefTZ4L0kgJw==
Received: from lo2p265cu024.outbound.protection.outlook.com
 (mail-uksouthazlp17011029.outbound.protection.outlook.com [40.93.67.29])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 45hmbvsakd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Mar 2025 14:49:15 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z7DxooFKLD7er+5TFiZPG7Y9sducO3MrSmiDY9BkSIX63ywUzzlFlK3A+6qPs9TAXrc/76sgM+L0qH11PbeksmXVp6QZKdvpWnGLxsGbbqyY6xc379ItgwizEBqo4wFI5iWGEqqG+EhSOMT1lg7LthH3RNknPg7L5X4x2hbJ2xTP3K8MW2gYN4RA3VqAybPKSGGBr+4R6s90+zloh6KvqC4qR5oHjc5da6APjzfsLLGlZyL8kPFeWlhtr5uBb48M63bu8SxyJLVfD5eWfc9V6MD9EOTFctAQeZiMDBxUznC9AfpufXdfGDuEB7lGrNTSd02NePzg1y0PSAYA+ZFT3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3R+DdQwKwGF/MkcqBaAocrp65b6XD4vLNSqI+4tybfU=;
 b=i8fvkq7fsAGctISWPAyvUzk1tr1E87VOUyp/QUUwio03Vr+kYXPb34w6HLIOcF7ZrJABRNtdRQSrSu5guFnDLVZ9yWDJFBSpZ16lDkI5VmVMtD6vms9WjwRh0T7JUKemh4YFv4TT0rbYZ4wp176BJTOcelUoZNuRWGDQbxoTDpopMFveroCLZ/izXeFK9Usw8GLN4tvMwkYdAk7xi+Mw4wE6Zr+yYAGZLp6uiGTEWbcXQ2Ezcy/pYtQM3GvUJNOwMdPVlrCj6RZx5/CwWEoqESa2aD313DAXLFQJPZeKHitq2l6bW6owVUUUhljcbRCslj+nZIov4HhmEZZi5rE3cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3R+DdQwKwGF/MkcqBaAocrp65b6XD4vLNSqI+4tybfU=;
 b=LMueOwoGUPcEZl4WYgfNMyUCEEoyPpfH4XQ9kDPBQpSfcQ9GTlCeXYz5bGfdqHO+IP/WbPocrupHebOKw2nPAZ5OQXoQbqOctBLk9Oq5lFZpE+XJfl49LnELUFcglmOzMWWiWrcDtsfT7OsXoRwmJ5SBLELj2vVN6PurPbsWRS4=
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e7::8) by
 CWXP265MB5815.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1a6::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8583.25; Mon, 24 Mar 2025 14:49:13 +0000
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15]) by CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15%4]) with mapi id 15.20.8583.023; Mon, 24 Mar 2025
 14:49:11 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: Brendan King <Brendan.King@imgtec.com>
CC: Frank Binns <Frank.Binns@imgtec.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: [PATCH] drm/imagination: take paired job reference
Thread-Topic: [PATCH] drm/imagination: take paired job reference
Thread-Index: AQHbmBWFsmCqpXPXYk6jjXOfMxHwj7OCZ6IA
Date: Mon, 24 Mar 2025 14:49:11 +0000
Message-ID: <93a5cdb4-ee30-47b7-8be7-cbeb853f94fd@imgtec.com>
References: <20250318-ddkopsrc-1337-use-after-free-in-pvr_queue_prepare_job-v1-1-80fb30d044a6@imgtec.com>
In-Reply-To: <20250318-ddkopsrc-1337-use-after-free-in-pvr_queue_prepare_job-v1-1-80fb30d044a6@imgtec.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWXP265MB3397:EE_|CWXP265MB5815:EE_
x-ms-office365-filtering-correlation-id: 86813e48-ccd5-4b63-cdce-08dd6ae30a06
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|4053099003|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?cnpFWWtOUy8zRllTYXE3Qm03M0twL3pEWlZlVzNQazRoRmRJOWdpRkVNamVQ?=
 =?utf-8?B?TVFlU2RaRm91cEV0MCs0dVJvSGk4YTdLQVJBMG85cEU0V2VCZ2hjZGcrKzNY?=
 =?utf-8?B?K2UxMDBmQ2Ryalpzb1JYMVNpWUtxRVJ6aTlRTnhZZllwT1V2OFhodHZXZVIz?=
 =?utf-8?B?alFSekJJQkJ5TTRpZU5vb3orRmZ1a0dnTXAxaSt0VnlCTlFwdHk3NkZJZTls?=
 =?utf-8?B?NG9MWHpYR3lmeERXTnVrVFc2cnNuZWNteXZwR2pXMjUrVUlTNm5DZE1TWUNn?=
 =?utf-8?B?bmFvd1JkQWg2S1lYYXpMbG02UDltQ01ZTUdPN1RjRWlreWp4Ulk4c0xoaEhv?=
 =?utf-8?B?RHhNRVJmWTltVUtGZDBHREFHRzJCUW9JNUU0VkNGdmhqUmVRSUp3WE1zUVpj?=
 =?utf-8?B?WWZhWkZVZ2tZWEVyOU1ha1FKVnRqVE5vdG1rZXMzZ3g1MVpXRGYxS3Z4aU0v?=
 =?utf-8?B?YXJWWTVDYTlvKzk3Q1BXQTJqZ0Y4TS8xQzB1aHcwR1RJWlRObU5YTm1JYWZK?=
 =?utf-8?B?emtWNi8xOHp5T09xaDgwWkFFM0ZDWXlXQkEwalp6dUdnbDRzbTlSbzNodEZR?=
 =?utf-8?B?S0c2MUU1ZXR6WTI2UTM2eEpaL0lkeW9qaWlYdGh2aE14U2l4akxLWDdiTTF3?=
 =?utf-8?B?MUkwM1daRnQ3TlNEL0N2enlHaTYzM05oc0o4RUdXTVVML2ZvVFBpRm82ZGxm?=
 =?utf-8?B?bHlyOXdMOGZpVEd1dE52ODZkZTZseDRhUkRuRUVESGVSN1FqQlc2Yldwc2Zr?=
 =?utf-8?B?b3lqR25OVXFRTUxEUWpxWGU3elZmOEF1N0FjU0RYY1o4MTlqRy96ZlRwZVlJ?=
 =?utf-8?B?c05YOE1WcVRpQlFySjhnT2xWZGNaL3I5R0J0QnoxTW5XdnU4WXZjNndTKzRZ?=
 =?utf-8?B?V3Z5OTd5VVVEWmJmS0gyK2ZqV1BsR1A2Z0RmNjUxZlU1RkphanlEZHZIbHA2?=
 =?utf-8?B?ZHRWYnJQVUVPK05mY2l3SG9qWUtjMjNBNXVvM1Rhck9pOHA0YUpKb3FwS2U3?=
 =?utf-8?B?SmNlc3ViRzNFZTZZc0k1ZEpUZ2JuY2FCZStvcDQ4RkJxMHUrYjdGZ1JadWk1?=
 =?utf-8?B?RjhpOVZIWFZlVmxzUWhrblVjdEU4WW0zZkdrOU0yYjlUbnlVejJsSXArdStU?=
 =?utf-8?B?OGNKQm5OUlBxYVdSWW83dDluVGZKdUNVMFFyaEI3OUloZ2xMTDZmS2FCamNL?=
 =?utf-8?B?UmRWNlJ1c3BrR3Z2bE1ZRzVWL3ZMSEdRbWZEQllEa2I1ZklxSU9yczlLYWJj?=
 =?utf-8?B?czREWXhJUFZuOGNEV3l3cFllL1lYOHJ0MDV4MVVhdXpCYnpxeDNBRVN2akQw?=
 =?utf-8?B?VXlQcFhEbTlsU0w0TDJLNHJzZy80c0M1VXF4SmFwU2c4blZvV0NhdXpXN1J3?=
 =?utf-8?B?Q0E0dmY1WVNBZEdMK0dsdEZXeFhCRXZPbjJZdEhwcjIxSUh4RGw2c2ZwcklM?=
 =?utf-8?B?OU82cHZoSElZOFpVOXZVRmxLMUJZZXMvSmU3aEdoLzdXcmhaZm10MUx4bk9R?=
 =?utf-8?B?bDBtL2k2aGNXZi9OdU1GamRrSTVFamo1RVArK0ZLNExLVzg2RGorNlJaem5E?=
 =?utf-8?B?NTEwT3lKVUVZMndYVWVqUFUzTTU0NjdwQWdnZ2Y1by9EOXp5WEs1d213RTk1?=
 =?utf-8?B?dExqd2NEYTN5Ky8rTFlDaG93b25KVFd5djd2R0Q0YkxOZXJWemRZTTlGVnVH?=
 =?utf-8?B?WE9MT0kzOEI4M0dZY3FPT3d1MldKampkbzNYbzA5QVNTbnQvWmRCNEFZZVlS?=
 =?utf-8?B?U2tvMlBBNi9JeW5aSk1FdC9HQ2lvMkhUdjdFRmtQdnhqZ2F1cm1iWkdTd1o5?=
 =?utf-8?B?ZUt2all6ZVJDc1l3UjdGRmRWMXVsZTRxV3plajdYKzhYQ3F1b3ZzRW9aSGdX?=
 =?utf-8?B?bWJ6YjJkbVVQTTBVMEoyWmt3czZuc1BSTXNPbUV4ZzUrQUVYRnIzRnEyN0w4?=
 =?utf-8?Q?uoTBuUGVWljeM8fOI2dRm6sdpOwykvJc?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(4053099003)(38070700018); DIR:OUT;
 SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Wlpnd21FWXlxNCthOThOaU1aeHFpWGRlcnpQZjdxNkJFN2h3UEVhanFzbnpK?=
 =?utf-8?B?MFJLenlpeDNGVGFCV0QwcFQ2a0tISUhKaGZmenVRSWdCdk5KbjZpUjFJUVNx?=
 =?utf-8?B?Slp2Ung0a2ZLdC8vOGNKdzVHTXpYQTBnWDlPdmNTeE9IRWlORmFXcWZMdGxw?=
 =?utf-8?B?WVdRakJHQ1k0ak5sZ1NNVG5pS213ay9uTCttR1FrZFhRaU9jNkpBZ2Eyd2tG?=
 =?utf-8?B?YVVoTGFxWXlFbG95MFl4VmZWd3Y5T0tDZ05MaFFLdHIxMTZlbHZkc3ZBNGtB?=
 =?utf-8?B?MjhIMDBERlZnK2FadWQ3YW8wYmJPRVd0Vi9LZExEWi9QUVJxNjJoUXp1L1ZO?=
 =?utf-8?B?bDFNR1dGQkZ6TzhvQUlzYVcvcEhqVmhZaFY3Q0lwVVRmMGI5aFBhVVdNdVVF?=
 =?utf-8?B?akVTc09MMTZVSitkZ3I2aGErdFp1ZWd1QkNrZjBUS0dJb1RuTWRHL2FIdCtN?=
 =?utf-8?B?NlV1UkI3WmV5eGxKellGUElHQ1FWQ2lvREVTM3BLSDVqeWtxZ01NMWtiLzlq?=
 =?utf-8?B?V2wrdUVnSS9ZeGZrc2FxcFUrUS9VS3lxZFBiUjFtUnlpb2RjNEhsK21TTU5U?=
 =?utf-8?B?alkzbFc5ODVLRlE0N1RtaE9rd2RScjMzRjBsYUZ1c3hBclZRaC9UdFpmWWo2?=
 =?utf-8?B?ZjJreHhPTHYzWmFDeTRYNWs1VEsyQkpxR255Rk9vZmphTHN0VzZvclhxd3Qz?=
 =?utf-8?B?V3cwRFFEdFlOVEt5emc4dlYrdzc1LzBVUjV3VXJKZGxhaithcjhIVkszUVJw?=
 =?utf-8?B?SXhPZzRKZUMzVUFKcTlWYXRXMnBmZGEweWRJS21STHdyZ21RK3E3V3U4REg2?=
 =?utf-8?B?cUlzUThmSmZ3czNlcWZHaXdwbGFyTlMydzBaQUw5ckZDYUR5OWR5ODBQbkRY?=
 =?utf-8?B?WVBrSTdPTS8rdUhVZkxqTkZVZHY1V1dPd2RGbWRUcDZHRHFobk14MXZIZ1or?=
 =?utf-8?B?VXVLcDNiZ1lyaUJmV0czUkR0Ui9pYU5mbW82eFVWYi9uWGdyNmdZOVZKZngv?=
 =?utf-8?B?YUgxK2pwRi9HRVZ4TllzeVZtQ2E2ZGNPSXo2YkpWK0F2dkl1OWZob1Ivb291?=
 =?utf-8?B?SkhBbHRvMGliRkhrV3piandDWGwyaTBzZFV1T095TXE0UEpNTmdONGtTYXRn?=
 =?utf-8?B?VUp3eFVjbktCRWVBWU1VTlBtWUFiZ1FxQWkyRHJ0R3hEY3FzSTN1S1ZGb1Iz?=
 =?utf-8?B?Y3hKUThlVEhnckpoa1l1MUNFbVlyZHhZQUZKd2V3MDFhSjVDMnVISVVmS0cx?=
 =?utf-8?B?Q2phTjFOTUNCbUVGVm8rQjZleGk4Slp1THNHbWtoaFhwWDhibnJCZXVEZm5z?=
 =?utf-8?B?aHgzcklrVkJUQ05QWGQrSWZqcVhZVGhhbkNna3ZIejd1M2NzNWRGYTJ4QU04?=
 =?utf-8?B?QW1LeExQVlcydjk3YUxoeFJiQUQ1TmRNS0ZqUkFYcHJiMTNkU2RXWlpGZGZs?=
 =?utf-8?B?MGVoejJaaEJWTStCVHpGVjJNQkFINkYxK2w4dWVRQWVBU0p1ZVlyREtBVXpT?=
 =?utf-8?B?MzVHMkV0RlBBSi9ZWDZtb1FKWVVpWUJkNi9mTFZSbnlRUlhKWmxDWFlUa0hX?=
 =?utf-8?B?UCtXVU9xSDF4SEFsS1Q0Z05pT1IwTit0RmtIUU11ZVc3YWNiZlpDYURoQ0t5?=
 =?utf-8?B?Qldrdm9TdXl2cDM0SzViR2xFUEt0ZmhGQ2xIY0ROdU1acE1nUWM4aWhZZHhn?=
 =?utf-8?B?TU9YSGI4RWVyOWZkR21IS1NZTlJqbEpTTDZQSHh4SGRiVEN3Q0NQWFp0V3c3?=
 =?utf-8?B?dXowbDdyQ25tcHZ6K1M1U1h0bnJuUEJ4Vll4cXNGS2I4b205WTRseHdUVURi?=
 =?utf-8?B?RGxCVFVWWFF2U3dLTmdZVFBkdFlubitabmVmbXR5NVdlemVQbE9UTXJvLzBJ?=
 =?utf-8?B?Q0trd1hRZWIwNEhaMVR4VzlBa1Bub2p0WWVtUytDdzQ5VWRqSkhBL29CZEJk?=
 =?utf-8?B?NU1MQUw2TE5CRXJ5enFxTkpxOW5oSXh0d1NUSUZIYSs1dnhMQy8za0Vqc3k5?=
 =?utf-8?B?Szl3YkdVdEhmU053b0dBNSthYk9JNFNoazhOdjYrVHdla1llZ1ljeE1vWFNO?=
 =?utf-8?B?RmNSc0JNajRTQnpQVk42Y25KdE5sTXB4RVVmdkdRMG5iUEVDRGgvdDJUNEpl?=
 =?utf-8?B?enlmM0oraWpuUHBKRCtnN3RtQ2dNMm9NVzdGaGdUdERJWFRVMmdYeWUvM2Z4?=
 =?utf-8?B?YUE9PQ==?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------uYuVJywaVr3g4O92WSgFkpal"
MIME-Version: 1.0
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 86813e48-ccd5-4b63-cdce-08dd6ae30a06
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2025 14:49:11.4776 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Bq97algSFH0SL2FjZFqADDwlmRV1OCYorKftZmfzQizTtmngf0Mee3KIQjUAGtQCm5KKk8aTXss7B6GM6h+Bhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB5815
X-Authority-Analysis: v=2.4 cv=TMJFS0la c=1 sm=1 tr=0 ts=67e170ec cx=c_pps
 a=mRJfeTHGti1YOx0CH8CfHg==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=Vs1iUdzkB0EA:10
 a=H5OGdu5hBBwA:10 a=NgoYpvdbvlAA:10 a=r_1tXGB3AAAA:8 a=VwQbUJbxAAAA:8
 a=P-ufOwpVHqdHSnFPhHAA:9 a=QEXdDO2ut3YA:10 a=sZy8htXv1tCrgDYWqPMA:9
 a=FfaGCDsud1wA:10 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: zfiyf12kPZFiIxWIX09mNkRtmmN30yJg
X-Proofpoint-ORIG-GUID: zfiyf12kPZFiIxWIX09mNkRtmmN30yJg
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

--------------uYuVJywaVr3g4O92WSgFkpal
Content-Type: multipart/mixed; boundary="------------0KbqHGF8lnflGoy641gsy3hY";
 protected-headers="v1"
From: Matt Coster <matt.coster@imgtec.com>
To: Brendan King <brendan.king@imgtec.com>
Cc: Frank Binns <frank.binns@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Message-ID: <93a5cdb4-ee30-47b7-8be7-cbeb853f94fd@imgtec.com>
Subject: Re: [PATCH] drm/imagination: take paired job reference
References: <20250318-ddkopsrc-1337-use-after-free-in-pvr_queue_prepare_job-v1-1-80fb30d044a6@imgtec.com>
In-Reply-To: <20250318-ddkopsrc-1337-use-after-free-in-pvr_queue_prepare_job-v1-1-80fb30d044a6@imgtec.com>

--------------0KbqHGF8lnflGoy641gsy3hY
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 18/03/2025 14:53, Brendan King via B4 Relay wrote:
> From: Brendan King <Brendan.King@imgtec.com>
>=20
> For paired jobs, have the fragment job take a reference on the
> geometry job, so that the geometry job cannot be freed until
> the fragment job has finished with it.
>=20
> The geometry job structure is accessed when the fragment job is being
> prepared by the GPU scheduler. Taking the reference prevents the
> geometry job being freed until the fragment job no longer requires it.
>=20
> Fixes a use after free bug detected by KASAN:
>=20
> [  124.256386] BUG: KASAN: slab-use-after-free in pvr_queue_prepare_job=
+0x108/0x868 [powervr]
> [  124.264893] Read of size 1 at addr ffff0000084cb960 by task kworker/=
u16:4/63
>=20
> Cc: stable@vger.kernel.org
> Fixes: eaf01ee5ba28 ("drm/imagination: Implement job submission and sch=
eduling")
> Signed-off-by: Brendan King <brendan.king@imgtec.com>

Reviewed-by: Matt Coster <matt.coster@imgtec.com>

I'll apply this to drm-misc-fixed tomorrow if there are no objections.

> ---
>  drivers/gpu/drm/imagination/pvr_job.c   | 7 +++++++
>  drivers/gpu/drm/imagination/pvr_queue.c | 4 ++++
>  2 files changed, 11 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/imagination/pvr_job.c b/drivers/gpu/drm/im=
agination/pvr_job.c
> index 1cdb3cfd058d7db573337a2b4f6895ee4922f9a9..59b334d094fa826f26668d9=
8561e956ec9c51428 100644
> --- a/drivers/gpu/drm/imagination/pvr_job.c
> +++ b/drivers/gpu/drm/imagination/pvr_job.c
> @@ -671,6 +671,13 @@ pvr_jobs_link_geom_frag(struct pvr_job_data *job_d=
ata, u32 *job_count)
>  		geom_job->paired_job =3D frag_job;
>  		frag_job->paired_job =3D geom_job;
> =20
> +		/* The geometry job pvr_job structure is used when the fragment
> +		 * job is being prepared by the GPU scheduler. Have the fragment
> +		 * job hold a reference on the geometry job to prevent it being
> +		 * freed until the fragment job has finished with it.
> +		 */
> +		pvr_job_get(geom_job);
> +
>  		/* Skip the fragment job we just paired to the geometry job. */
>  		i++;
>  	}
> diff --git a/drivers/gpu/drm/imagination/pvr_queue.c b/drivers/gpu/drm/=
imagination/pvr_queue.c
> index 21c185d18bb2e0569bd6e12832a74e38137bd48a..6431f6b654a2e60b86a46bd=
8571eb9f8133c4b53 100644
> --- a/drivers/gpu/drm/imagination/pvr_queue.c
> +++ b/drivers/gpu/drm/imagination/pvr_queue.c
> @@ -856,6 +856,10 @@ static void pvr_queue_free_job(struct drm_sched_jo=
b *sched_job)
>  	struct pvr_job *job =3D container_of(sched_job, struct pvr_job, base)=
;
> =20
>  	drm_sched_job_cleanup(sched_job);
> +
> +	if (job->type =3D=3D DRM_PVR_JOB_TYPE_FRAGMENT && job->paired_job)
> +		pvr_job_put(job->paired_job);
> +
>  	job->paired_job =3D NULL;
>  	pvr_job_put(job);
>  }
>=20
> ---
> base-commit: 96c85e428ebaeacd2c640eba075479ab92072ccd
> change-id: 20250318-ddkopsrc-1337-use-after-free-in-pvr_queue_prepare_j=
ob-16fbc74b0c20
>=20
> Best regards,


--=20
Matt Coster
E: matt.coster@imgtec.com

--------------0KbqHGF8lnflGoy641gsy3hY--

--------------uYuVJywaVr3g4O92WSgFkpal
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCZ+Fw5wUDAAAAAAAKCRB5vBnz2d5qsNBO
AQCB8SrmhpWHwLWquoxD+uZgdxtl+mKzPRstafv8Uoxu+gEA0/1d6HZ8O1brfLnzreWz6HZRegdd
mJxEF0vb8LYOtwo=
=3Z98
-----END PGP SIGNATURE-----

--------------uYuVJywaVr3g4O92WSgFkpal--
