Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC3FA89553C
	for <lists+dri-devel@lfdr.de>; Tue,  2 Apr 2024 15:22:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD27210F66A;
	Tue,  2 Apr 2024 13:22:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="XbOMNRwk";
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="j1PWAF00";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4082E10FD2E
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Apr 2024 13:22:39 +0000 (UTC)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 4327hpuM014630; Tue, 2 Apr 2024 13:22:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-11-20;
 bh=+pSeqX6Ix8+D8Tx7k9a0xV1y3dsR8yzYZhBS5WOHBfc=;
 b=XbOMNRwkBluBB7yN++XwtZFecOgKreZraZbyJGUvH/32DHQliIkZDA0um8voLsPOfhbB
 UaqK0PDghWJQm3egC0LQ48hBb524qQdepm4EKkkoDlfuHOXZ2HN9hu6+C21EnZORS5xv
 va0/gUb1leLZ3n9MWxNpuzWvRtqSnCVjsvPys5o/tzOvaVNOpOaVaZsU7vlgPZO2YgR6
 l7TjFJ8/eyvNYqxp18Tx385oF1VNlTZWYyXU33dFTazLxq0ul/1AG5/xTQRFQxyjfu2Q
 +3L7jBqqIM2T2tcgkFvlo9WGr+9KgdveVoFVu44i43M1X0mUe4jqeh5o3b7Q/pOchQmn lA== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3x69h4mnpb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 02 Apr 2024 13:22:27 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 432CleiA007161; Tue, 2 Apr 2024 13:22:26 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2169.outbound.protection.outlook.com [104.47.55.169])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3x696702c7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 02 Apr 2024 13:22:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ORIBFI0aWHXGDwyryp3ntED6cvY7lOcHXoeY3Vsm2A+zdohvFe0J4FrOkeij/COlq9U7g/uQ9N1TXysreJ1jMiVIIFMGbAwCAPiIE6HXSgoKRK4Wz68VmpM5VReZIffpSb1ZQPJz9Pv1WimMEzYs9fAjYsHok7N6ptrg/Kwxhb8Sw5KPqEJZJWQpG08CVKYfxbnCm1fPWh7E+wclTKVbuBRxV4GQzkGjpd5T7bMY/q3hxRfsk3wFrem6WzeWG4ZL6iDg2eUxfiD/CMhuhXgbOk+MXPqKVuvOo3xVY5ysd2uLYsSVHYewMI5XdtP4NUM7OxKygheDK4Hs+qVAc3pewQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+pSeqX6Ix8+D8Tx7k9a0xV1y3dsR8yzYZhBS5WOHBfc=;
 b=jGitGu5jhSEDcebjRFgrwsDxImRworQYCT3RLHhYohjw3BzM2xV985809zxuw9cZlyvfrFHFhu6vmtw7BViQABUtvw/AANVXbeNG4q2vBpqwk+TVAp359w/P2aSL9zHovEGGgW+/foDYRlXZaXv5BusfsuZMdTxsVinIdju7bTkSs2kNq7wWh9WCXHRb/ah1txnh+O2yZY4CtF90jyYTwI5izV6XQtexQtc99GsLGrtJLYkuUitGK6TvyIkdVDwNc3o3MoCGblQvwJ+hTZh6pzXANA6ACx6UAhYrWDEIz/zJzAIW1TU5Qtj5ceFXqqbcwSA/PhiMWksZ0Wyy2HUoDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+pSeqX6Ix8+D8Tx7k9a0xV1y3dsR8yzYZhBS5WOHBfc=;
 b=j1PWAF00dOrct7Qx1Y9MIXdaZhoDxZORKN/V21jNKEdHYvQkXgZnimYw02Jbc5jC4AZ7ieovWlkzCPJRnof/lrCIDxnkUXDv2hFXZGIYwtRpn+sQy4A3psOj2RNYHWrdfuci9t6KswKIhJehYzfbtzZi33IGmwpL3+pvKk8XlFM=
Received: from PH8PR10MB6290.namprd10.prod.outlook.com (2603:10b6:510:1c1::7)
 by DS7PR10MB5199.namprd10.prod.outlook.com (2603:10b6:5:3aa::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Tue, 2 Apr
 2024 13:22:23 +0000
Received: from PH8PR10MB6290.namprd10.prod.outlook.com
 ([fe80::f5ee:d47b:69b8:2e89]) by PH8PR10MB6290.namprd10.prod.outlook.com
 ([fe80::f5ee:d47b:69b8:2e89%3]) with mapi id 15.20.7409.042; Tue, 2 Apr 2024
 13:22:23 +0000
Message-ID: <99b0bc65-a3ce-4522-a1dd-a304498fc453@oracle.com>
Date: Tue, 2 Apr 2024 18:52:12 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panthor: Fix NULL vs IS_ERR() bug in
 panthor_ioctl_tiler_heap_destroy()
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Heiko Stuebner <heiko@sntech.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dan.carpenter@linaro.org,
 kernel-janitors@vger.kernel.org, error27@gmail.com
References: <20240402103358.1689379-1-harshit.m.mogalapalli@oracle.com>
 <20240402143337.38e864e9@collabora.com>
Content-Language: en-US
From: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
In-Reply-To: <20240402143337.38e864e9@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCP286CA0290.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c8::7) To PH8PR10MB6290.namprd10.prod.outlook.com
 (2603:10b6:510:1c1::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6290:EE_|DS7PR10MB5199:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Fip2G07OEGGWvJIgKDgtT3D8r4S58vqaRteKmqTnzmaPr+XpfVdwWU8FLSYiDxR7zrhxm3+fq5m6rBdwRtBR5dHSgT6mLOvr/YAfecbP/TdszOT4AADVK1VBde/oVdWPOGIyhXG8Ssieept37ZPzVPU59lhiQLendfgkZSlfagmEjKIqDeG9e+7e0+B4KDJGKJszUDPHzjiwS2/MiI9eMf9F1LvY7xZABxJhOwC+BMdrTPECTVw7v8korPDScGXTN7YH/p2nDVD+kEX0FEWPl9OofuLQVTbOoy2pgBcAkax/azOCyQxqv+oY0tcv3FLLmArBQU6C78alNBaiIrbu6rBYMH/kBJda+RFdXRAaKBuGdJHaml7fLaHazGPutfffDtfV/dvPVpqwUnsXgV8i52Y6l/vntCXNY0uvg0yfvQ2jQdve5cU+9A54gv3lr+JHqx4xwIgXQeEi2BGmSiusOzHA9y0UsVRuUhkhXtkPSNDBAwRLjLsDKhSqt4r4Cx/vgbOn07YylfhHvIrnF/9dxTKBtOnNzNjHLT2xbr9SxYmAZkjaFeAJZUYkH8y4Ej6wVmdgu5fnTZbM4Ns1d3CV9wLV0u2k6DqVCsR55BGOkrdlFhU9qhfMdbK26QLyAVaVV0o51LNGEeR8Vq/xUJrUvP3Jaj44zKlGjWd3KhJOAK8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR10MB6290.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(7416005)(1800799015)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ekQ5bE5JNDZXcDdUYXlxdzlveWpmRUNJdlNoa0RFVXp4Y3M3WG0wcnZMZXRB?=
 =?utf-8?B?djhBcWJXRzl6c2NpTk5kcTZtM202VnpZdWVRUThKWm1DYzE0ZEJmb001c0RO?=
 =?utf-8?B?QjdwMmVxNUhVdmVlMUtwcmpLRzB1dURmVDRxMlV2VWZ4MHdMZEk2OWFGWjRt?=
 =?utf-8?B?VnJUL0d2RkZ3QjV6b3c2azczMkRvV3ArS01PeWNSN3ZTQ1lxa2NZY0JZbHla?=
 =?utf-8?B?bnc0bDVxZm8zb1o5VGU0UkszR21DcVZUUmYvZ1BDbEN4U0hwUUVUdFlNb01M?=
 =?utf-8?B?SzFtWVdrUnJQYTdMK29taHNZSVdKc2xXSk9vbVFDQ25sVm10NWk2elFRSGdr?=
 =?utf-8?B?RTNCRnB3NUMxNGprcEcxZ3NXa1pNeG9LeVpGK1N1REZTL0I0OTZFVnhSY3Nk?=
 =?utf-8?B?RytDV3o4NTNzYUI2WFhWTk40Q3grRzRnQUtqTmphMmZxSTAvK1hGZ3VvVUR5?=
 =?utf-8?B?OWU0N1l3ZFdzbmVoc3pZeE1GT3gxMldYU2tWVEx0TVNPekF6akkyMkZHQ3FN?=
 =?utf-8?B?YldLTUpIZ014dW5MQ3FWQThLK0xwa2pyeTdSTTM5bUswY2xDak56SFVVcnFq?=
 =?utf-8?B?cVNXTFI1NXppZEllNkszUURlNFBrTFZiT0ptaDlsR1pHMURTWlhKbmZTQkEz?=
 =?utf-8?B?c2cyS3ZiUXhrK05valpQMzE5SEZEL3Q2WFc0NzZZZGtxZ05GTi9VaklBVE1S?=
 =?utf-8?B?ek9wY2tESmt0L3B6WHJMQnQvc3VETi81SmNTc0RKOE5pMFA1Ni9qdDQ2RXBZ?=
 =?utf-8?B?R3JIT0NGUytwU1dBYWpZTU5sbm9SOXFlSzBzUmNWbUEvam1aV3ZnSlpGV2l2?=
 =?utf-8?B?dkRXSXlkeXNXeFVtZENBWHlNejN6M21qUFZZOEkyZ0NpS2ZpQWROZDBQSU5Y?=
 =?utf-8?B?YVFOak54YVFCOGdoMnBSYkJOS2x0U0RmWC8xQUtyKzg1WkV5YTV3MTUwNFhJ?=
 =?utf-8?B?N1A4UmpLUlE1WCtlaFRwS2s0Qm9MOTlycDh6Y0k0MGFmSTF1dUlkaGJOTEc4?=
 =?utf-8?B?UTdNNW16OEI1dCtxaE9DeHg0STZJdTI2TWFBQktDdWNLUU1ZUStpUmhwMko0?=
 =?utf-8?B?OU4vMWdBWlBWNHhROS9pZTJnenNRdk84MkYzY1QyV0R5NytWSEcxUXBNemJH?=
 =?utf-8?B?NEVvbWRQRFhxSTJOU3J0L2p3MTJPUDZkUVFoZEF5eHBab2RkeTIwUEFQM21o?=
 =?utf-8?B?dlg4M25MS21CejlRSFBaSUZmeStaT3IrdXlCSE5aM21IMGJuUmZ4bW1iVFhI?=
 =?utf-8?B?WnpGSG5lSHJhem9YZTF2OVFRVTFTSmQybXA1bjhibURKcjVjTm9WR2x5cDh5?=
 =?utf-8?B?SWJkOXZ4d0xpT0l3ekJJZkZ1UklOUURBVCtEZlRkMUQzd3dKTWVsZFdnR21C?=
 =?utf-8?B?blpMZ1d0LzEzdG9wMWNCN2VzZFpiMHUyTjdnOUdoVDNaWW95cWRIdm9BK3NB?=
 =?utf-8?B?TXFBMXBheldiMHJhaEUyWFJJdG1aV3dmRGJLeTRBc2k2ZjVTb1dJMkNQU0ZL?=
 =?utf-8?B?eEszQ3ZTMnNXcFdXK1QwRDAyWHZObVVIRkpjbmhENy95Zk5kMGk1K2pEcllB?=
 =?utf-8?B?UG1Dd09TYldnOEpoZGUzR3JOUXV4MDVFUkdFSmRkL3JTR3pRbzVJd1MxYVl2?=
 =?utf-8?B?QzZXWEhrVzZWY3hDODdQemIxNE5iakJvSmlQelF5YTRsWkRVSEpFTFFSdkFZ?=
 =?utf-8?B?MisrZUVmN1RybDZDWFZ6UlNKejF2ZStUWVVnRkJUZktmNjVaMUpVVDFwRGVt?=
 =?utf-8?B?aHNSVmZPZEZtaDRNQXJQWjFxaGpnRFhGNmpBenZXYjZCR1MwaDdnNGRPTlA3?=
 =?utf-8?B?aW9RQ3RwNDlab2pCQXhMSnY2UVBjenFjcjJwR0NzZXAzK0pTc3N3Nyt3R0cx?=
 =?utf-8?B?WjBLK3lWTEh3TXFxSk9FcHd0d1Z0S3NuWUZXNUxiMHMrdmdzNWEwNy9zQTYz?=
 =?utf-8?B?SFhoN0k5U0dMWWhJVXhCU2JkTlZKOXAyYkxoZk8xMHhzbXVBSHlTU2ZsaDlz?=
 =?utf-8?B?Um93U1JEN0g5RmpWZVozWEZ6VkZIWkFXdUdRaGI5U0lVMDg5SlhXekxqMWY3?=
 =?utf-8?B?ZEhLeEpRbVU3aEs0cThxUG1TVGxEV0Y4VTExWDBFa0VubzNkODlwTXhVc2ZT?=
 =?utf-8?B?TDgxcGc4OVhBUDFPTHJmWW5JT0J2ZXNLWXkvTUcwOTgrTjZsbitwNGxnNXVR?=
 =?utf-8?Q?XTmc0nhaItd7qjBkaFv8fYc=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 1SM4d6S2jp/ce+YeYRkXhJTK/wBijr58hElmD+7VNSuwqrGMMqr6rXM8gZv6TZE0oy0p1siQAlAB3H5niDSMUKGgFkyBjoH9QCwYYNLsBbqY2KB4T+O2IwbDgA3/ipsscXxaza77qrYrUKv7spHY3KOz7KLj/QV/1wf4EW/NBAAnylZpF00akSIgla1Euqg5g0xCxmdVG3QXnhbK1AWV0MPGdlBgwhMo7SLl/6OwxgFdSi0SVoSCpW9SkTuYwJ3Ip36rk1tQcBJ7k2ri+Zz5U8/K3IInOGOPTpzLuMfjdAU7ZTkUFrpmd70+5SU2B5tPVfSOyc0TIgY7NB7KYsKSp6iBszs04TVPFTmI+CfuxWt5IS8YAx/mb9qtKsC+VlUwnjIcPEhvVhneRSPHSv9t7Kc3+kJTNlx+tXugFg8MjnHCDHNmtJojVPeDSl/XA1kaOlHpqWrHNjEMqdKc0VN7nRBzuew3ohbCUkiAhzNuLznwgmUo+uyrTQBfi37S1TYihLl8khDVNJ7fboWQ5/kKsH6hcOjtynMmDXtS+sZMdGrksL8ZFelMKKvPqTgXOQ1oliA6ZO+beXxDsmEBqsPX4OaDiiJpA+BatuBImGh1HrQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98572261-dce6-4780-8b58-08dc5317eebf
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6290.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2024 13:22:23.6638 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZktIsPwHwx8zeIUidAPGUah7As3wKbZhlCHT3SuuTW64XynW1iWnId9rCx48Fcwh5M1T1OT8Hli3d8wSpSBnTkg/TTOEU/Z2GfTKZZfFBuqjiJp7vT/RRphdypYvFMQ7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5199
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-02_06,2024-04-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 malwarescore=0
 mlxlogscore=999 adultscore=0 bulkscore=0 phishscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2403210000 definitions=main-2404020098
X-Proofpoint-ORIG-GUID: NJiZtu9h05yiXPrZJOxD25OeMsDn8SQC
X-Proofpoint-GUID: NJiZtu9h05yiXPrZJOxD25OeMsDn8SQC
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

Hello Boris,

On 02/04/24 18:03, Boris Brezillon wrote:
> Hello Harshit,
> 
> On Tue,  2 Apr 2024 03:33:58 -0700
> Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com> wrote:
> 
>> panthor_vm_get_heap_pool() returns ERR_PTR on failure.
>>
>> Fixes: 4bdca1150792 ("drm/panthor: Add the driver frontend block")
>> Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
>> ---
>> This is spotted by smatch and the patch is only compile tested
>> ---
>>   drivers/gpu/drm/panthor/panthor_drv.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
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
> 
> Actually, panthor_vm_get_heap_pool() will return NULL if there's no
> heap pool attached to this VM and create=false, so this was correct.
> This being said, I'm fine making that consistent by returning
> ERR_PTR(-ENOENT) instead of NULL in that case. This way we don't have
> two different semantics based on the 'create' value.
> 

Thanks for explaining. I missed the case where create is false and there 
is no heap pool attached, so panthor_vm_get_heap_pool() can return NULL.

1878  *
1879  * Return: A valid pointer on success, an ERR_PTR() otherwise.
1880  */
1881 struct panthor_heap_pool *panthor_vm_get_heap_pool(struct 
panthor_vm *vm, bool create)

The documentation says it returns ERR_PTR() on failure, so is it worth 
doing something like:

diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c 
b/drivers/gpu/drm/panthor/panthor_mmu.c
index fdd35249169f..e1285cdb09ff 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -1893,6 +1893,8 @@ struct panthor_heap_pool 
*panthor_vm_get_heap_pool(struct panthor_vm *vm, bool c
                         vm->heaps.pool = panthor_heap_pool_get(pool);
         } else {
                 pool = panthor_heap_pool_get(vm->heaps.pool);
+               if (!pool)
+                       pool = ERR_PTR(-ENOENT);
         }
         mutex_unlock(&vm->heaps.lock);


and change all callers of panthor_vm_get_heap_pool() to only check for 
IS_ERR() ?


> Oh, and please merge everything into a single patch instead of one patch
> per call-site.
> 

Sure, I noticed one after the other. I will fix them together in v2.

Thanks,
Harshit
> Regards,
> 
> Boris
> 
>>   		goto out_put_vm;
>>   	}
>>   
> 

