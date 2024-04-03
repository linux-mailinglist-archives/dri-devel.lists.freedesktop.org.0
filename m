Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 264AC896643
	for <lists+dri-devel@lfdr.de>; Wed,  3 Apr 2024 09:23:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C260411261B;
	Wed,  3 Apr 2024 07:23:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="MpFH+hpy";
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="DhD3/7bl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E13811261A
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Apr 2024 07:23:39 +0000 (UTC)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 4334nFMu000351; Wed, 3 Apr 2024 07:23:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-11-20;
 bh=Ol8XnsDbHmcQ/cplPZXLR1xhVMR+NnJJ6UFzn5MgC50=;
 b=MpFH+hpyI4ONRb75blRO2zRxG4tK3bW8Dm+mLqWzMkvJTDnXyfeDKbe7cmBp4G4yGmVa
 IXdk5TyJ9Nm1Tr5gX4e92uHHbeppb4+VxvpWFLcTxfZgPBylrYHTVGrmt42gXW3P+3To
 IOw4ooNs4NT8bg5dn3p+SoRABvnxh7rrjwNTOnqNm3n3a+KDUurMQ3+CxojiSdD8z/p3
 JFY/Oqq38fX+cKEDjkN9nLCZnPjW/qdN25dX8Dhvr1SHH+mOoPhSBNS9BQTLHHPtHrqY
 lxeIWr/7X+Em77igz4/nQ3CQeMcn7E/moqdSYbgCgzxszotDKbR82XezUf4WS84O+Eqh xQ== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3x695epdg4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 03 Apr 2024 07:23:28 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 4336wXQi015457; Wed, 3 Apr 2024 07:23:27 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1nam02lp2041.outbound.protection.outlook.com [104.47.57.41])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3x6967wfsx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 03 Apr 2024 07:23:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kl+W4e7nDmOYlm+GCenW6hjW5j4Eg8djd24C0skYoNHzakNQZ8lXLNiRJ61IEC7dHPo6u9r7LzWLqzFhIRlrnMLHT1yciw+LZ5wl8lggAOi13Ftn1kofIjmCNqfMAOVMrnHOM4g3HoftJ4Bj3TmYnmJni/aoWf38dLxeO8obk8ZY+2xrj+CfQ1KV7dAWrnWSVEzOI8ID+ISoVhghY/wAuq/6zKsKrL+xgLALpXy6peZj+oqQywsKN2UOn1po1LgwjT034YJT4MGlzSJWBFgNg81VuQBb5RGKjQqe3Bi1Y2SEiG+U9U02iAwvJcu5kAr5J13yqXX6hN16HLSL3X0ShQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ol8XnsDbHmcQ/cplPZXLR1xhVMR+NnJJ6UFzn5MgC50=;
 b=gY5jien3Fqw2tFuzQbNsneR0aHVfdVQ2mDuvbi0IBjbNvfOKBhQFug3Tq9GGJ4293ojl1h7MWpUdiKmRD7+s0mfflL5EbrpMMdg6qp4s0HN38iBmWxF5EjVfxU0L5hT6JVcp2rx7xPwwjdkmkjLBEy9ZzS9rFEgSJGVioQTDD1SU7nwWbzKBfaJo3rDaK0+b6AjooU4QssuXX+w5GNAdEI3Q79DewGeb5X/nA6razWmv0oPCbaQyth8yps5tgHYx56O7h1eV81vRHsnVPw/tddqYIV6PzT269gDSS1AO/i8S95RUb5OoSlvfENZOAygq7cTY7DK20lOUI0JX+ZE7yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ol8XnsDbHmcQ/cplPZXLR1xhVMR+NnJJ6UFzn5MgC50=;
 b=DhD3/7bl5N8Z9wOFDt6TTRuNOwsrafYsxZQkOnWTlpxzZabkZRhi1zycMOng75g5LEF0hdZaDkG17KUwS/nbNl0wnny92rs1V3YZXfGpOdmrqyP1USQ6YQZdlvZAx79R4J4f9wzgyXjHvVYK71yp5zS2/SRauOoARcVMiP6EkGQ=
Received: from PH8PR10MB6290.namprd10.prod.outlook.com (2603:10b6:510:1c1::7)
 by CH3PR10MB7502.namprd10.prod.outlook.com (2603:10b6:610:163::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Wed, 3 Apr
 2024 07:23:25 +0000
Received: from PH8PR10MB6290.namprd10.prod.outlook.com
 ([fe80::f5ee:d47b:69b8:2e89]) by PH8PR10MB6290.namprd10.prod.outlook.com
 ([fe80::f5ee:d47b:69b8:2e89%3]) with mapi id 15.20.7409.042; Wed, 3 Apr 2024
 07:23:25 +0000
Message-ID: <a35a0ae3-f976-4a74-aba0-2b16ecf2a61b@oracle.com>
Date: Wed, 3 Apr 2024 12:53:15 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/panthor: Fix couple of NULL vs IS_ERR() bugs
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Heiko Stuebner <heiko@sntech.de>, Grant Likely <grant.likely@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dan.carpenter@linaro.org, kernel-janitors@vger.kernel.org,
 error27@gmail.com
References: <20240402141412.1707949-1-harshit.m.mogalapalli@oracle.com>
 <20240403091729.3100a6a1@collabora.com>
Content-Language: en-US
From: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
In-Reply-To: <20240403091729.3100a6a1@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR01CA0039.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::16) To PH8PR10MB6290.namprd10.prod.outlook.com
 (2603:10b6:510:1c1::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6290:EE_|CH3PR10MB7502:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sjte8IzB3gsxpbc2uCHQEUVorcQfnR1fEwVWNCG71bN+iBUSuIHbv0mM1rVfqR3XNFyTSC6cUh1+thVoBpEfX2gQduAvMthMqPY6yjmGjhP9zPqdZgYMCjdcPrQuq5U7Hch93Wn84I/BUfubGV8KtMuibV55BUq6UmkYSiQdUuqGzL+lO1IQNKtKk4vAyx9aD+YP/OWe6MpHORIy//qk84gntRMJIjjantlJY5sRB6Drz/QvBqPOZWUGg6GjRCyty1TTpi7sbFS31RhLj7J2Vy5Rf2SlnQxTgcq4mR/Ck64ZqfobXCDNkpnJeBC+V9/q+iFGauaKHSkqy+dZhPmE8TARyIhlNqWYBVk5D/SNTMr2OaO9He8AA0o1mlmlQQjyR5KsQN+2j2/fWBl5h/G2ItLAKYzo1Q+CF/w5ZJNbSMJJchpJ2TZDEOItXU2jU4g8L5jiERMCt/EcbjraJoDf5NFL2ItY/B/tjKratEkNjoOBVxpS33zB7oaHacCw9sckFarT/lNnXyxZ7FKs4i1FIQTOX11LhWpbRCfZa6CDFpneZiygO5MdNPniIDhPRpfq8SmOFyC4JGjqZveas1xXV8Mc+H6CX5ACbo4cYWvT5ZC2WvRkdme2qgveXmZ2Rg8uZZizuZ9wUmcg6ONHjAkh9HFJ/AXMzY3/9irrd+J/WQ8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR10MB6290.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7416005)(366007)(376005)(1800799015); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?em9rUU15MHBZSlhhSzhWZ2hNUjdEell2Sy9GMW0xdk5TQ2FlQnkyNEdPUDhl?=
 =?utf-8?B?VjVZbjFRQ0I1U0J2dElIUW9VTzg2RGhacjVkdnovVlNhOUVIUDdGNUJsb3ZD?=
 =?utf-8?B?RTA0VU05WC9nN003QmFZcnBEQ2VxdHdTTmhIMEhOTDM4NDJnSUwwZk1vSUpy?=
 =?utf-8?B?OXg3bjVBOGFkdG0rTk4xdzZ4Z2FWS3k0a3o4bmVHYW9BdjZqbUUzTER5Yy9n?=
 =?utf-8?B?cHVzMDRjdEo4TTAzNWo2c0svNTV5MmxKZHpwNW5MaURQZ3ZVZXNwS1hiZmRm?=
 =?utf-8?B?YldxTVdtQzBybVVRZHRDSFZRdEc3c0ZRZXZrRmlHUlVsSzkwS1ZFNDhHcFd6?=
 =?utf-8?B?cVlnTHhqUGNkcEE0cFovREgzN2FWMEVJZEVmUnl0R1NoL0czSGF2TU56Vk50?=
 =?utf-8?B?VjBaMmJOMS9SYnVuQ2laSEJXUFM3dTV4ZzFoYUpDSFd5QVh0ejFlT3FwQ1Yr?=
 =?utf-8?B?ZXlsWGtwWmlDTEhWSUNxU1dUaWcra0dkWHVzWllPVlc0T3FmUTdoMmhwOHRp?=
 =?utf-8?B?S1gzd3dRUXQ1VXQxRHFBNzhkQmZiWmUvNWpqcEV1MHMzN0FxdUtlVExPRTQ3?=
 =?utf-8?B?MlcyUUl3ZVZlVlRUVUdMUGZuQzNyWHVlc0R6VkZjTy9LeGY4ZEtaTnZsVlhs?=
 =?utf-8?B?SSs1QyttQkMzNlZtemFLVlNIMCtLTzgwQ05jZE5JbHVVZEhIdFBvL3NVdXhi?=
 =?utf-8?B?RFZxdEY1R0FHWElFbWY4N2VYK0FCQTkyaXlXQWZPWHdHSnJvUEh2TGFiU0Zv?=
 =?utf-8?B?SjZvNjhwZ3pkb253RTd6TFY0eUE3R3M0amtsZ2N2L1VRS1U0b2MwaDkxZDhu?=
 =?utf-8?B?b29ONWFhV2ttU091RmxjMzIwUjdGaldReHRIc3FEQ25YbWdZTnIvWEZDdUFW?=
 =?utf-8?B?Y25LMzl0b3ppZzVLU3dES3A2M3E0RUZFTnNCTU9oOFUydURCcCtybjJuSWRE?=
 =?utf-8?B?MFYzYUlLcmZVcXI4NW5kMjNUQUFUaFQyVDcyam5mM0dUWmM2RGNLOWtONlhP?=
 =?utf-8?B?M0cxdzN2d2t4MytWWjVCL1BiQzZPakpaMUxlbFV3WWtMaFdzTW9iWW9IdEdC?=
 =?utf-8?B?Nk9ESTd1TE14dytOOWs0OHRjZG1UUDlTemtFWVZKZjdIaDhLdnpqOUNpOXZE?=
 =?utf-8?B?azR2WTNtTnhIS255ZUNnMWVDeC82V1I2Z0NCVS9XWU5jUGF3YnZzWTBObU1L?=
 =?utf-8?B?L2JzcGhEazlwVm5jTEtXaTVBQzluelQ5N3U0WG9NY2ZMbEdaem9MSkIzRHVO?=
 =?utf-8?B?RTN4bUlNa3JjQWxxS1ZJMkFyTHJjQ1IrQzNudXNvOXE4TlR0K2ZiQTYyeStz?=
 =?utf-8?B?QmdZY3pEVlNGa2JyejVQQnFIWWJhV0RoVlMzWFI2c0JCZ2xsRFF1bVBuNVBy?=
 =?utf-8?B?TUNtRmlyTFgxUzJsYUtBYnJOeFYzK2NQQ2I5WVdBeWxOakJibSs3aG94dm5H?=
 =?utf-8?B?dkRTOVo4NHlVMk9KMUJZTDBVdEpTbXFwQnRJTDB5TjE5aHVxNlBZSm0vWldv?=
 =?utf-8?B?Z2xFYUJoVkZSck8vbGlsUlRPWng5NkRqMWpBK044d205QnlBak0xTUZ1UG90?=
 =?utf-8?B?U2NxUm1vbm1wK2RVekdiRW1iclp1L1M1aVZKWDJSdzZyVHpSRVlPWEFjQzJq?=
 =?utf-8?B?aWdrdTgrMEVaczludFY0UUhBWnpXVjdwU3dHcERsTU83Y1p2dmdpcFZVUmNM?=
 =?utf-8?B?V0RYWUVSUHd3aXdWZjhndHFHU1hyQzIvZ2xjWWdZbEl0MW1LakRrdFdFanVv?=
 =?utf-8?B?SlJqVHByMS81elhNWjZsVUluUVJFQW1iTHZPTHdob2hhQWV6VHNtWGtVOGRJ?=
 =?utf-8?B?NWJQTFlkUUI4TDF2WXdNSTlsMys2RG80b044dUtsVTZRUHlRVGMvVWtDNjM1?=
 =?utf-8?B?RTlhUldvejR4bTl4YWk4YlE2SExER1FYUnl3dXpOOHkwZ0NueTB5VkFjMG14?=
 =?utf-8?B?K2pKdXJQVnN3cVp3MnVaYi9Rc0YrVEpaOGVyTzNKTUNuS3hHVkN4aTBybkFR?=
 =?utf-8?B?bndaMFl6aitxNWpIZEo5MzhpcjEzZ2p6UDR0KzMxQkxNOUpSUHhjRjVKeTh6?=
 =?utf-8?B?N2RRRjBEcGEvOFQvRmlPM3hUQ0wrY2E4OFhQcFRmZVY1RHpMaXVKTVo0Njlk?=
 =?utf-8?B?dW1aV0ZyMEhhVGc3d0ltRVNJOFJhZ0pSdXl0azc0NE8zVU55WXVuaGl5TTZi?=
 =?utf-8?Q?4N9Q0vpUw1itjj54YB596ls=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: VSrVPCcY6n+Eo0SPjDr0NesSkyzqcJEnEC7ELiOL4FbG9I9Yr5hCTOJVLmtjS6TiqpoPQ+o5L7N96yvNlavzqiJ0sDDjsXbYXDw/1rnabHfhR9cdU1G1aZ/NpoCOQO8eHUUNwlfrD9WPXQt2xe+SOFooM6+OWxR1b+xkP62UZod1CSg2Xgwygis1IhsXV31ViCQcMaHfDE1aWRNGrTFmP4n7R3cAng2xOF515uyxsMyAn6RwbyVvu091f8iBh+IcmngkzDOcMcc0Yb5PMejvXWgAsV/Qpp0AvDOPjsets2IJlzB3hI11oO8W3a5ORgVSs+UB+FpoMRj4FABvH7p3jlKA2jeFPEXEamh3or3U/11fXfShb+30YL0JLovX/PX0rpMKazogBdAq0gPTnRNALx3/pKaLv2FsHaAPAo6l2CnbiwGKbsPsJEO6TJlPUUqjK/a/aZ+srZxK4aPIyaRbLQsqGF0c1nf7XaSAkyKjVeKrCfwyVPZEi7+e8y/HWv28KFkoi9pVxBAj4bxy/S78xb+75WlMA1bRFcxk1dIkxtcDb7foXML9SbruTsumVu9xu/Yp2ULLe3o5TWDtRRHBQNSUGz77jsrIDSGJX3TyNo4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f43b369f-c50c-4b9d-32d9-08dc53aef35d
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6290.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2024 07:23:25.4874 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: APz0ONrzmom0UBUFIchJJxXS6ZlfHTcg6hX1GoC1Ha8spaJWSed9BJBer2JxxJYSe+LALyuU22NMMqknRrdSMTPE2sGtvoMiB0noMF/SCIipRHpkiqV47JZB7u6lfFYe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7502
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-03_06,2024-04-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxlogscore=999
 bulkscore=0 spamscore=0 suspectscore=0 phishscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2403210000 definitions=main-2404030049
X-Proofpoint-GUID: o-U73DXwrpXlldMtXgxXNich36fbgrMs
X-Proofpoint-ORIG-GUID: o-U73DXwrpXlldMtXgxXNich36fbgrMs
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

Hi Boris,

On 03/04/24 12:47, Boris Brezillon wrote:
> On Tue,  2 Apr 2024 07:14:11 -0700
> Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com> wrote:
> 
>> Currently panthor_vm_get_heap_pool() returns both ERR_PTR() and
>> NULL(when create is false and if there is no poool attached to the
>> VM)
>> 	- Change the function to return error pointers, when pool is
>> 	  NULL return -ENOENT
>> 	- Also handle the callers to check for IS_ERR() on failure.
>>
>> Fixes: 4bdca1150792 ("drm/panthor: Add the driver frontend block")
>> Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
> 
> Queued to drm-misc-next with the following commit message:
> 
> "
> drm/panthor: Don't return NULL from panthor_vm_get_heap_pool()
>      
> The kernel doc says this function returns either a valid pointer
> or an ERR_PTR(), but in practice this function can return NULL if
> create=false. Fix the function to match the doc (return
> ERR_PTR(-ENOENT) instead of NULL) and adjust all call-sites
> accordingly.
> "
> 

Thanks a lot for making the change!

Regards,
Harshit

> Thanks,
> 
> Boris
> 
>> ---
>> This is spotted by smatch and the patch is only compile tested
>>
>> v1->v2: Fix the function panthor_vm_get_heap_pool() to only return error
>> pointers and handle the caller sites [Suggested by Boris Brezillon]
>>          - Also merge these IS_ERR() vs NULL bugs into same patch
>>
>> v2->v3: pull out error checking for devm_drm_dev_alloc() failure.
>> ---
>>   drivers/gpu/drm/panthor/panthor_drv.c   | 4 ++--
>>   drivers/gpu/drm/panthor/panthor_mmu.c   | 2 ++
>>   drivers/gpu/drm/panthor/panthor_sched.c | 2 +-
>>   3 files changed, 5 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
>> index 11b3ccd58f85..050b905b0453 100644
>> --- a/drivers/gpu/drm/panthor/panthor_drv.c
>> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
>> @@ -1090,8 +1090,8 @@ static int panthor_ioctl_tiler_heap_destroy(struct drm_device *ddev, void *data,
>>   		return -EINVAL;
>>   
>>   	pool = panthor_vm_get_heap_pool(vm, false);
>> -	if (!pool) {
>> -		ret = -EINVAL;
>> +	if (IS_ERR(pool)) {
>> +		ret = PTR_ERR(pool);
>>   		goto out_put_vm;
>>   	}
>>   
>> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
>> index fdd35249169f..e1285cdb09ff 100644
>> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
>> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
>> @@ -1893,6 +1893,8 @@ struct panthor_heap_pool *panthor_vm_get_heap_pool(struct panthor_vm *vm, bool c
>>   			vm->heaps.pool = panthor_heap_pool_get(pool);
>>   	} else {
>>   		pool = panthor_heap_pool_get(vm->heaps.pool);
>> +		if (!pool)
>> +			pool = ERR_PTR(-ENOENT);
>>   	}
>>   	mutex_unlock(&vm->heaps.lock);
>>   
>> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
>> index 5f7803b6fc48..617df2b980d0 100644
>> --- a/drivers/gpu/drm/panthor/panthor_sched.c
>> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
>> @@ -1343,7 +1343,7 @@ static int group_process_tiler_oom(struct panthor_group *group, u32 cs_id)
>>   	if (unlikely(csg_id < 0))
>>   		return 0;
>>   
>> -	if (!heaps || frag_end > vt_end || vt_end >= vt_start) {
>> +	if (IS_ERR(heaps) || frag_end > vt_end || vt_end >= vt_start) {
>>   		ret = -EINVAL;
>>   	} else {
>>   		/* We do the allocation without holding the scheduler lock to avoid
> 

