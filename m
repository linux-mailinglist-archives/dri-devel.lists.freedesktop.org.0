Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE06F89562C
	for <lists+dri-devel@lfdr.de>; Tue,  2 Apr 2024 16:06:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C948610F279;
	Tue,  2 Apr 2024 14:06:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="ndcEVVla";
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="BXAuMLEU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3786E10F279
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Apr 2024 14:06:12 +0000 (UTC)
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 4327hqr2020074; Tue, 2 Apr 2024 14:05:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-11-20;
 bh=kpWrjS3zr0Dh06PCqItw29WJLCw3h+wq1OXQF0szMrw=;
 b=ndcEVVla+z3G4ZvqV5Dm2lU8tZgh5aVktdU59lKDFJ1tKEdro/3hvLGSFHrxoKnXhLGq
 6gQMjnWBZ7akJCSMjvIN1y/rqBB/1KyinN8oBBz8vSmE+lQ3BNvVmPsSzdyTx8HotXor
 1AgNrLTWQNO+0X2ZmxOpwMyqoWOT1jIYCvgY3lwDG94QJd0iVoI43TujzP0aaloI3dtl
 +hPSZzbedZwqtsn7VO5Q/rbtaOiLtfNDAdhtYPnKM372VRzbcTmKWIOb1LSf2wyaSci/
 M6LyOObFxOhqZcJsz6tGk9nZ/gO6TBCqLBNk6WmFpBziGAykb+8ZZlIdNYnvs6zfn26y IA== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3x7tb9trey-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 02 Apr 2024 14:05:57 +0000
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 432Ctxsi031038; Tue, 2 Apr 2024 14:05:56 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3x6966uq5e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 02 Apr 2024 14:05:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=et3luYum5JZ/YQTayQy4m4a3MvJrjwsPiHyvPM8B9LW5e0SYHA/tsQ3wnL5Xvc/LkogGi5PU+DtPN1Kd4gpLehyaQTIpDwV9NvruBaVz/kHCpBg2QU7n4qoBgWcsgdw3mln+uE/PIhMF0NjyO5LngOCvPsYZReq5YD9/XLZF9jHXYYeAa/m/vyhg/RByLcowBQ2PvqQ+9mV+d3N6i8alx5mek80Q4Imnlv4ar6DCVEVNJFTqe6Q0FBBO9bQAeWdKZNCSycqGARtvW5IxA3rZkyZNmD5X3v7xWpQgEFE7ZZ7pb0e22nV4XHZL9rKPK3VUPaooAma1gchOgZAb4QpQfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kpWrjS3zr0Dh06PCqItw29WJLCw3h+wq1OXQF0szMrw=;
 b=CfEsNotg81q3F//IQ1awaA/c06IFSj+hVTNGzacSbNpKZe8GtY2xxzVv24Wv4kuWOFWbUIeHE7aNvtrAt/+A95MI1TOeUyCTPQ+V9CL8VBjlSSCXcDN6u95IQz2c0ojObT20oz1bcvdWu3Ap3doX6s7D8vU2IEDLyd+Z5GL6MPAtyQzmtLG2GYpWfdY4eCBdfjcJQ18KzalmzBELVeWZ3SVK36Ral9wvKCPkpdo71b+Uo/b+A6nsAv7T0wU+AcCnObI26V+sCv4CUlZW4N6mBEQxGZ1IdBKxORN5Z5ge8RcThUZ5BUoUOowF9wVCP829INfONdQpFC2iAMLbs8Ievw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kpWrjS3zr0Dh06PCqItw29WJLCw3h+wq1OXQF0szMrw=;
 b=BXAuMLEUmkNjAww33WSl9EDaEMh9IHkTj0W8hdvvbkogVVyJYPI39QAIISj2amROTROSiHN5L0tMSJdilarEsrd6aBNDD+oiQ9wTLZq9ZyEHmnX6wsOv3l3mLz8U6OqLclzc9lS5J7nR9fNILirpUCbSvgvrlXmQfxE5n4sItg8=
Received: from PH8PR10MB6290.namprd10.prod.outlook.com (2603:10b6:510:1c1::7)
 by SA1PR10MB5709.namprd10.prod.outlook.com (2603:10b6:806:22b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Tue, 2 Apr
 2024 14:05:53 +0000
Received: from PH8PR10MB6290.namprd10.prod.outlook.com
 ([fe80::f5ee:d47b:69b8:2e89]) by PH8PR10MB6290.namprd10.prod.outlook.com
 ([fe80::f5ee:d47b:69b8:2e89%3]) with mapi id 15.20.7409.042; Tue, 2 Apr 2024
 14:05:53 +0000
Message-ID: <b35d0de5-be46-42a1-b7e7-b24a72d945c7@oracle.com>
Date: Tue, 2 Apr 2024 19:35:41 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/panthor: Fix couple of NULL vs IS_ERR() bugs
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
References: <20240402134709.1706323-1-harshit.m.mogalapalli@oracle.com>
 <20240402160226.4a1ac2d1@collabora.com>
Content-Language: en-US
From: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
In-Reply-To: <20240402160226.4a1ac2d1@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCP301CA0032.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:380::15) To PH8PR10MB6290.namprd10.prod.outlook.com
 (2603:10b6:510:1c1::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6290:EE_|SA1PR10MB5709:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8VaV/wmZyEexd1h0f2xlf7BuWnrlhVDHU4RDZQF7kU4X1KvpIPis/khkWvplBQG7//aKyknjXXMl8FcEunIDVJo/LY4dt3eRYgH91XJmPAAsHq9LvFzSMeaLZBwABPL4sIiNqpJMDli55Ir2od4BcSwCNwoCC/ivEynxd3yNf2meK2KpBofUrKSgcqS4P1z/769Hd8nwE8InOBbi1IP/Ran6u5cBuqvzx7Z36oQH3AyAhn9T09DWKhXUMVvtMGp96SzXHgToUV78mbUcX08pyWGBGW+XCTQtpoCDPFSZA1SDWC8Eame7PiaA/6m9074SyTGzI9xl46povSo4gu/vzETJzAvU5Tw76WqbrCP3p5oGRok8xl9vW1vJxCoz6PhgHWl5tkGoACLV5E1qWb39qFvuFb4oTqIzzB9M0kOhdCGWwo/7zivub8pWwqLjJWAzT+dgOO3nNOd4DKBsy7ujTmAd/iZaxYFduZyRuSwujoAn1qGM6VMM/k5tBnJGq10w3+Kqh+Fb7x7NBQHWXOHUUPq/t3PEh5z+tK5pjgPJIqAy52g/Q4hA2P1etweX5JUz93a9l6nPi3f+uncLXLCtawADE3j8vZ3s6ZdL0zIuFGk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR10MB6290.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7416005)(376005)(1800799015)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QmlLL0Vka053SUtNMHNldEowQ2hQM3JNa0xZTTg2TitQVkxxeGdReXpQMTRu?=
 =?utf-8?B?UlVVZ3poeGM1Y1U4cnhaZlRKOWt3MEM1SUtVcm5WdFJtZWVxYk5Na3lNVDln?=
 =?utf-8?B?MDlTWFJGRnAwcy9IY1dsRkZzQmI4NlUyNUdHcnorUVdQTTVzQUZvQ1FOWHJj?=
 =?utf-8?B?NkJWUjdJU0ZNdks3ekZwNTVhTFNNQVhzV0Fwc0lBMVZKMmV3YTJzM2dHWENG?=
 =?utf-8?B?UEFYZjltZEFQL0RzTWg3V0tBd3lrNXh0V21EQ0tMb1l1a0xHcFlKcDBkWGYx?=
 =?utf-8?B?bDRsTFJZUUVpN2I0QW5kWkdUT2haNm5FNzlXc0FPSUlCNzFFbXNLWEpzQ1hB?=
 =?utf-8?B?UWJyWklrT0UrUXBRNHRuTjRrSHYza1R1czJNSnVjOUcxa1QvQVF2UVlQdDh0?=
 =?utf-8?B?YW82Z2NxZGhqcndUVVF4eXdKTEYxNHJaZUFuTnlmUFFncXh3Nm9LQjRrVkhM?=
 =?utf-8?B?MzZLN1U0R25JWFVRWWN3eURoeGV1Q1NJRElYL29JVlRjRjFLc3hhdjM0b1Bn?=
 =?utf-8?B?U2VTUVpaQXdjUnFXNFlwWEtUeXYzcmhsOENiMTVyQTF3cThCeTk4RU5mZ1JO?=
 =?utf-8?B?VzNqQ0ZXMlhUcVlyNlhVekZ1czREUFZVMkpLWU9lTTdCQ0ZVVnJia1FWT25j?=
 =?utf-8?B?YXRvR3FMTU1sNXc4TWhoblhIYzZrMzdIN1dIdnN4b0hDM0IvSElCUjJWT3k1?=
 =?utf-8?B?ZTdJZFNOOTNsV1JsejI5aEFnaXRXWWRrSksxd1h6eTZOVk56TkZESEdYWUsv?=
 =?utf-8?B?cHVGdEtJYVkzcjNMRVdzM0FNM0FxZ0FZeGgwVE93YUJyQzgxcHc3RGxMYlN4?=
 =?utf-8?B?VkMvMEtNRzRZQXZjZVlQVkZzNlVGQUJhSmNPSWtCT0IycVFVTEVFWkFKTlBY?=
 =?utf-8?B?VEVJWHhRdEV3ektNdCtyK0s0MlcrWit3bk03QUVGZHVhSXphTFRpdnpndjJp?=
 =?utf-8?B?RzZ6NzJONlZCTmVBNHkvZG9waXpub25qU0hvMVlCSGtLT2ZFZWFlY2t0dm9M?=
 =?utf-8?B?REwrSDFsZUdjb3l3aXFIY1YzVmo5Z2xIVHJLSEFkeHMxYTJnaWVsZkZHbWlT?=
 =?utf-8?B?eERrL0prdWsxWTM3SllQaHZKUi9YU3lQaDVKR2NtcFJpTFdMRytjTHArcjEr?=
 =?utf-8?B?RXFPUlVONGVadno1eWNOMHVER3RGRzYzZ1U4eUNKaWY1OWhoWDA5NjRnT1h1?=
 =?utf-8?B?NDJuRGMzYXRsSmJ0V0x6SEZkZFl2NEQzL2lYMTYxOUZhV3F2YnhZOE1pYURa?=
 =?utf-8?B?KzcyVzc4cGtxcnVuckRTSEJ3QnZpTnVYbjRrZWJrT1p5RmRXQVJBWHpWbktE?=
 =?utf-8?B?U2RtakoyUFdBVUxwWlM5dmlxdUJReFpUN3Y0ZHpVaFFtVi8rM2hZS2FvUGRE?=
 =?utf-8?B?ZVpXVmFjWmtVSFJYNSttUlVRZS9CNWI5dTVOTDJ0T1NNV0d6ampuekFQOU44?=
 =?utf-8?B?Vzh0SEJKalpwWVRJOWFGWjRXbFhDaklPZkhVUUJ0TU13cmh5VDNvL3Q2cmZv?=
 =?utf-8?B?cFJBcHlNVHk1ZzVsaUUwQkw4WGZRZXRBUFRXYlZmeVNNd0NFMHdkaVRlTG4v?=
 =?utf-8?B?TStxc2E0cVhlMmliU0p6ZDJPQzdkTVY2LzRGUkVGb0x1a0pGUkF0THhyQjVD?=
 =?utf-8?B?Y2hyb0VKS1ZGZWtwYkVOdVpFQU95NXN5WDNmeThSS0FZU3Y5blJlM1FtS2Zo?=
 =?utf-8?B?Y2J4N2l3TEpCeVR6ajNlMUlRUkhwNkVOODllcE44N01kRW1UalJhSnNNcTJz?=
 =?utf-8?B?Vit3THFYVTRqUHNQNlVJTEZCYlpCZkJ3YXhUQ1pxVkpxK0Q4OWVma0hCdzdK?=
 =?utf-8?B?aDZmMXR5K2ZPY0NxdGRpUjBDQ2tlT2lFbnRaVjRiallQWUdlRStwYzBQUDh0?=
 =?utf-8?B?UmNwVzZmL04rNGdNMDI1dUdRNkNQcXk5bHZEeFQyYWgvQlpiMDB5SGhvZFpG?=
 =?utf-8?B?eDh6dEJmbndTaFpXbHdjakFMZWEzclhqeHA2UzlMNWR3d2gzWjI1dHlCOHVh?=
 =?utf-8?B?VmNUVEVFUGVKWVRkOHBQck0xWkFWWGdDdUlURXJtNTZ6VzNhc0VXOGdBTTRj?=
 =?utf-8?B?U0pVY0d1NysxM0h0UzJwc2JlajIybFhPYksxSW9LazV2NXI4Mzg0ODM1Sy9P?=
 =?utf-8?B?SG5Qc2piT0RVWXNrUlhvejNaUWg1K1VyNS9WRitHSU5PdGc4Y3JFUlI5S2FD?=
 =?utf-8?Q?ECJ+ElfDVN6Ioh9RgqmGhpE=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: OVQ0cOkElWhsb2TV1PF/+thxi/MTgjRE+ozWilNX17ujTJLthr1F7mT21x8kSfaVOK6B9E8xnvGgLUbKFiwdpURtO9KAzXdA90icHCL9hfB3EJ0L40+XbVRWmcRU8fQubXNMOUmI2YWMklpMmBppTDd7dHFSYgrkjVcyiA+0PmLjI1aE36ptkfKEz5VnGfS/pW7fuK4oKKyyE1YafT9/dSwP+o2JHx9lurQBEXhwi35SaP9Wps8HKu/PtB9lVySbSSRNeNGZH2enBoAEe20UKFuG++yFJkLRWzonPGRUegchLRSbVbPBkHvgloKr6/dwZ7XQTX+VPOsPbYwpXPCXCcmFDFHp1ZGz+wpkufkx8a7xvoeroIZz5DQBilO8dX7HhsK0+7EWCNGXSzHGS8XNytKCocvkm46+LwwMmg4EkAf/KpMRIwbvutxRtiYkeWzi1wm9SPleJDozA+jHGYqLlFDakGo/YaMlHPfcrep2aADmY7n3XGZpZmyWTc/fi0IOBXsmX7vBq8J57eTdbB5ohUqEZF5+eEAMvB1IEPy5kkcL37BTyb+qOA0bBjDbCXS+WCZxk5+NkoY7m0lo5ig2YfgrD3adRB+kh2yhgU3nI9M=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22b84a58-0efe-4f2c-31c9-08dc531e0234
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6290.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2024 14:05:53.3270 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UCuTCaKS/XliQp+GZSdw0LEN9Tma68TuQnMJNfgPrwWxpAqXozHKmVWfk7yQQiU2NhJ/IvgCCGKgITLBkAULK8XhFLM03roFtmjTui4pFxj9YOa9ri6Jr0kTUkTSvJxY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB5709
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-02_07,2024-04-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 mlxscore=0 adultscore=0
 spamscore=0 phishscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2403210000
 definitions=main-2404020103
X-Proofpoint-GUID: Dy65GmtL6TwWSCUkfN8MP8xNUND7_Nz3
X-Proofpoint-ORIG-GUID: Dy65GmtL6TwWSCUkfN8MP8xNUND7_Nz3
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
On 02/04/24 19:32, Boris Brezillon wrote:
> On Tue,  2 Apr 2024 06:47:08 -0700
> Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com> wrote:
> 
>> 1. The devm_drm_dev_alloc() function returns error pointers.
>>     Update the error handling to check for error pointers instead of NULL.
>> 2. Currently panthor_vm_get_heap_pool() returns both ERR_PTR() and
>>     NULL(when create is false and if there is no poool attached to the
>>     VM)
>> 	- Change the function to return error pointers, when pool is
>> 	  NULL return -ENOENT
>> 	- Also handle the callers to check for IS_ERR() on failure.
>>
>> Fixes: 4bdca1150792 ("drm/panthor: Add the driver frontend block")
>> Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
>> ---
>> This is spotted by smatch and the patch is only compile tested
>>
>> v1->v2: Fix the function panthor_vm_get_heap_pool() to only return error
>> pointers and handle the caller sites [Suggested by Boris Brezillon]
>> 	- Also merge these IS_ERR() vs NULL bugs into same patch
>> ---
>>   drivers/gpu/drm/panthor/panthor_drv.c   | 6 +++---
>>   drivers/gpu/drm/panthor/panthor_mmu.c   | 2 ++
>>   drivers/gpu/drm/panthor/panthor_sched.c | 2 +-
>>   3 files changed, 6 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
>> index 11b3ccd58f85..c8374cd4a30d 100644
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
>> @@ -1385,7 +1385,7 @@ static int panthor_probe(struct platform_device *pdev)
>>   
>>   	ptdev = devm_drm_dev_alloc(&pdev->dev, &panthor_drm_driver,
>>   				   struct panthor_device, base);
>> -	if (!ptdev)
>> +	if (IS_ERR(ptdev))
>>   		return -ENOMEM;
>>   
> 
> Sorry, that one deserves a separate patch.
> 

Ah okay, I was confused about the same.
So I will send a V3 removing that part and could you please use the 
independent patch that I sent before ?

https://lore.kernel.org/all/20240402104041.1689951-1-harshit.m.mogalapalli@oracle.com/

Thanks,
Harshit

>>   	platform_set_drvdata(pdev, ptdev);
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
> 

