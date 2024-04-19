Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B4EB8AA924
	for <lists+dri-devel@lfdr.de>; Fri, 19 Apr 2024 09:28:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C82F610FDBA;
	Fri, 19 Apr 2024 07:28:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="Bdzqx0cz";
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="TiyyBTKd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 427EC10FDBE
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Apr 2024 07:28:04 +0000 (UTC)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 43J1JBD1009563; Fri, 19 Apr 2024 07:27:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-11-20;
 bh=IeOq8PZRhWCxPOFhozxnb4TQRXR4vIbsz+fcKvRfu9w=;
 b=Bdzqx0czV3oJfzc6kJoOq4DUACX6wcAS+NkU/5dCSZnVOHN2om9hXICLW01DbOKDU8/4
 BPfVOB/gET/PXVmX4kzpDA+bHa783xX4ohM7Vm4YoNLaBgWKQ8WN6D/OW6pW2KjUNy2c
 V5aOSPINu0CfuI/Tq3+P/6YfRrPLMKjQcrrylEW9BA9n6QRQEiZdB9E7lCeDJCLgj7FB
 vMZXk+DzRXtcg2XOdHBonwgI77ZFsaBPmI0iyYYBv2+LhweQWoOYbU8mfuxjJiWQJB0Q
 QubyMdlhgrFsLHjmEJb4vbjGWrDh1voWBec+1NCwBT0HZp5STlEOA+SIiZABoDhJisJD ag== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3xfhxbv3m1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 19 Apr 2024 07:27:49 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 43J6gBRM016728; Fri, 19 Apr 2024 07:27:48 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam04lp2168.outbound.protection.outlook.com [104.47.73.168])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3xkbjbqj2x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 19 Apr 2024 07:27:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g8jhdkgu3wOWPYRubDokWEVB9PGnhty9kd2EbJ5p+PR9IsdGap/va0VFlCHXZqrOySOCdcehhMWZTgAdWzVSqjlnpA9mRG+ORtq0od+UsF76rCbU6Y/wtHKIA6NdqIw0gJqSUC/Q8SO48R3DT3dwWxwQNXTtApYmD3ht52C8ee+qcFnwuZm7k/tK6hUFZQdj98LSeSATms+X6B00Z1B5dngC3MI983H732yMVyP9/w9bKlfqO/GSHY4mHyDfO/mounO8zT9y+93teM+cGrT86f51Hj6v22SXe8NNUrICAWvNxKTGHIa910o8w7PbB95pyxjKoHUCt+0SkbO3ZzDdag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IeOq8PZRhWCxPOFhozxnb4TQRXR4vIbsz+fcKvRfu9w=;
 b=UW92fGOw1OAW2LkPWlKZQYh6nhfm+WCep4Q29p8S966fhKJyq1n6t0mLT5nUhSGdZPqk7eUDTiQVsdyUzXHrZTVW4B4eC7pTfLQrep5MyuJusiKEtUuACPIsz+Kz1ekYK/hLnvepP5iBc5AWYSeeAOPb0kEasV2KDykj/ctI+JDxlu7NvIx2HWyU4jrtixQAMbPUlgD9c2QjR7zrDmxy5RRTCprUIy+W5XE9vVcqDbvxdfZa8jk4eKtW1ex0AKmcYhrxU/SX1YnWOY7uLkHH7e5Sf1ZrOiGB+17QMx/8VvpL256y5L7oD111OS2vitxhU2n9p+oY7So+oH8wLBNnyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IeOq8PZRhWCxPOFhozxnb4TQRXR4vIbsz+fcKvRfu9w=;
 b=TiyyBTKdVz7ibHlQmH3h29B3zVCQFwqsP+EYKDv2Dn3QKXqdRNv8hwaR2qUrlappBOuS934YuAZU7tggl8vlU0gfww2ru2KD5RgWCcCXshV8TR8spJDZ0Fk+/swEHMLHvCJUL8DNnUvgKBTMqcI4GLiQt3g7LQvvhAsbIyWMnXw=
Received: from PH8PR10MB6290.namprd10.prod.outlook.com (2603:10b6:510:1c1::7)
 by CH2PR10MB4293.namprd10.prod.outlook.com (2603:10b6:610:7f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.40; Fri, 19 Apr
 2024 07:27:45 +0000
Received: from PH8PR10MB6290.namprd10.prod.outlook.com
 ([fe80::309b:26bb:11d5:cc76]) by PH8PR10MB6290.namprd10.prod.outlook.com
 ([fe80::309b:26bb:11d5:cc76%6]) with mapi id 15.20.7452.049; Fri, 19 Apr 2024
 07:27:45 +0000
Message-ID: <d2485cb9-277d-4b8e-9794-02f1efababc9@oracle.com>
Date: Fri, 19 Apr 2024 12:57:35 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [bug-report] task info hung problem in fb_deferred_io_work()
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Cc: jayalk@intworks.biz, Daniel Vetter <daniel@ffwll.ch>, deller@gmx.de,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 tiwai@suse.de, namcao@linutronix.de, bigeasy@linutronix.de,
 LKML <linux-kernel@vger.kernel.org>, Vegard Nossum
 <vegard.nossum@oracle.com>, George Kennedy <george.kennedy@oracle.com>,
 Darren Kenny <darren.kenny@oracle.com>, chuansheng.liu@intel.com
References: <271372d6-e665-4e7f-b088-dee5f4ab341a@oracle.com>
 <CAMeQTsbCESSTrEyHgqF9HreSuzQ9kMBnGpKLT0QNJ+n4hv9qOw@mail.gmail.com>
Content-Language: en-US
From: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
In-Reply-To: <CAMeQTsbCESSTrEyHgqF9HreSuzQ9kMBnGpKLT0QNJ+n4hv9qOw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TYCP286CA0010.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:26c::18) To PH8PR10MB6290.namprd10.prod.outlook.com
 (2603:10b6:510:1c1::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6290:EE_|CH2PR10MB4293:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fc81102-32ee-41a5-9749-08dc604234da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7iyf9oBhof1TRaVHi32OGdIhGSP7igGgFfloIpHNTKNh8ijcYCv4RyEesZhUMGYBsHuSRtsvbLmJUxaXAPyFrFpWA/JGWRR4EiRpBGH7+Nr2otrzwGYpgdt/VLttDq10s1MIsV6fD6dBy82Xxq23QRGthTaZW+aaDnA/42zRWUkkZq2rE03eEnWc1SI70xWX7HdQmVnTAVz33WqFmcEUVdV/ek+pKC+8K81PnppMpMvQz4act6IiBzhk+e4ZFevgcnxbFQZumAnW4pNyiXL2OW0rj1kHKKNLbcDe7GADgUgdI9U5xwwEp8okimA5J0v4xOP9Pwc90tGDFRZr3xZhstFHLcgIAx44/iSfOMHldpxyKqy9fBAiVeYX5EkKvWTVEjXOQcWoCTM2j0G1zgQFTSrUYGhimDsyRenLrcOnSIug1rzyEjIMbsaZpGt/zUu1N+Vn/9M8eAOgohw7hHxwPD+cQDTHoaXImrnJHvf+rb/jIF/dLgzlja+Ocn0Qvom/lCo5aPC+NqPgGa8YBes4uvx4K17nN3cTIGdwhNogqG5/t/vXPR/AIwgyRuAaKLgucvu5ZbhDOtmxDmap89t6RSpP2gJuWAEixwOur8+MrxLJGyLsuJNu8q7gRezztqQD4iTCZy8BswW6+BZpricojp9Cj/9IUPeshG07nTUokWE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR10MB6290.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(7416005)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QnNsN2hOeTJsbUF5eXBOVHkzQ2s5bWE4Um02R2JsNGRUalN6VHpjUjZkUTkz?=
 =?utf-8?B?dzU5NFFsSjMyZUVzMlc5WDBpWDBmV3p6elBYTkhFa2FHcC9NSDA4cldscG1T?=
 =?utf-8?B?WGhMTkYxU1ZYbzVXYTJMOXlsdjFHL3A0Wm1HY3RzT0VYdEtWTHVuSlpEOUpM?=
 =?utf-8?B?VGVmWGF1RnJYdkdhUTBsTllDeTlnb2l0dnJxRy9tUVZsbC9xb2VMb0J3OG00?=
 =?utf-8?B?LzhnZGtxNHMxRWhVK1ZJQ0xwSDNacDlTd1pNcXk2VjlkWDg5bnlLdm91a1Vm?=
 =?utf-8?B?WGVvb2dmMXNXQjNKVmlieUwzM1FLd2htRk41MFlDbmRCWjcvelZOYXVwaWpu?=
 =?utf-8?B?U25sZjQvNGJiUUV2UnhQUGpJQUNMemZaUi9jVFBtUG0zeXBaVE42TWNFRHAw?=
 =?utf-8?B?Z1BCOUJINllOK0h6L2ppSzdaVWpqNnUyUmlHclh4LzJjVFpBbmh6eEJoaFFY?=
 =?utf-8?B?VFQ4YmlHdG1BRGMyZ0NrelhhOEs5dzdtUWlHUnQ1QjJtRHozcmI4aGd2cjls?=
 =?utf-8?B?UFdCcERkN1JoeXZkekEwNy9kaWJONWdZNVNPV2xpWEtTMDRyRlZlYXBtbk5M?=
 =?utf-8?B?UWxUY2V3eEhQdmxnbFg1Si9icTBQdjh6NjFndGNlSk1JUjE4SFlLb0lyREh1?=
 =?utf-8?B?eGVGaFBVZFpBR2NtVzhicVgrck5idnZmaS9kMVg2VEN1UVIzanViMWlBR1Vl?=
 =?utf-8?B?UVQ1UTZiMG1hRm85R1ROMzBJb0hPQkRYTzlIK1JSR1o4V0hBT2tEa1ErNkVi?=
 =?utf-8?B?ZFB5R0F6cnIzbG5ka3dFdXp1NmhjRTB1Ym5qVElXN251bjl1c3JtT1A0UXNv?=
 =?utf-8?B?QUhnbDdBaXpiWVdIaFFPdzgwS2dnWlBNUXZvYkV6ODhhSFAvZnI4aS9KcFAx?=
 =?utf-8?B?a1gyTGNob1RFRnA1aXRQb0wxTWkxVXhOQS9NUklYWk10MS9mM1I2QUJEVGZG?=
 =?utf-8?B?czdFcXpCT2ZlUmMrZiszcllGTkkzaWVkalRkdFRrYXhSbU9lYXVxaGU5QzIw?=
 =?utf-8?B?WUFLS0FDNzdXZkFxbUZZV05aZm0yYkw5NGo5NkdvVll6RkQrZG9sWEg0Tlcr?=
 =?utf-8?B?ak5vMUtmSGRyVUx4L2FUNXcxZHBxcDNuSWFFRXVNLzBtWDhubTZscGNYVVZt?=
 =?utf-8?B?eExISVJXOFdjYkkwelA4dkZvM3dyTHJYNExsZlRlMlN2ZStwY2Zrb0lLNTVC?=
 =?utf-8?B?eTJQT1pZVklYZUxYY3pyenFtYTRyZFpsanY2aFhES3puaEQ5VTdHTzdpY2x4?=
 =?utf-8?B?Sjdsem9qb05QeHphYkk5cklRdlJGOHRrMkQ2OS9UWVRXN29kcUFCNE5RZ0Ju?=
 =?utf-8?B?SGwyaGdKYitpZmsyRjBDUjY4VEZxMDJOWFdDUndKN0huQ2xNNjUwYnJld2hy?=
 =?utf-8?B?ZERiUUV6QTR2WnNneEZzZFZobnNoMnVkWVIwaXpEMkRaYS94UnBuVHVDUm9B?=
 =?utf-8?B?SmhtY25FbEx4T2xFK2IzTk1tSlhzYVRPQnBaSytoK1V6dEs2anJaWkxzV0FO?=
 =?utf-8?B?dnJJZC8vVUlwd05PUmFrWWZTRWJYZERGRnh1V0pXU3dqSHo1NjN3OWNrWThw?=
 =?utf-8?B?WHlnZ213Q0xuZ2hQVUhnZE45dEY1aGwydjhybUlmOFhNakVNcTkvL2ZRanJr?=
 =?utf-8?B?aklZazY5eStGMmlsUDhackY1a2dHMW53bG45dng2dC9mWllmUG5zY2ZNaFA3?=
 =?utf-8?B?UHc4MElUVGQreXdtdTZBcmwzRDVMMHZGbGNNTWpJdmNRaXRjb1FwR0diV1hz?=
 =?utf-8?B?bTRwaFZpcXRrd3J0ZkFGLzFFUkltLzNQU29DWGk3QlRlZkZVcHpHTEFSbWxU?=
 =?utf-8?B?WDYzb3hxdXZQdFBHSVY2OWxEc3JDcWlZYmhIOW8zOS9DSXd3L3dPdXBWVU9l?=
 =?utf-8?B?V0RiQ1F5RllLSmxyYk50Q3dGSWtwVUpVdjBOdEZrV1FQVEFvM3lnU0tsWW5I?=
 =?utf-8?B?S1RnWjQ0M1ErMnJDR3pKWjlmQVVmaTlBMWIxdCtNSmlVTFVSR1Ewa25LbE12?=
 =?utf-8?B?QzZWQ25XcUNMM3A5UXpabGhMSlJlMU5sTHRSWFY5bDVHZXlyY2ttalpONUlT?=
 =?utf-8?B?YlQ3Mmh2WGJ4cU1aN3FRMjhQMHAvZU5KNnh4QVdNOFFJWWV4Z1JvU3dxZFlO?=
 =?utf-8?B?MmFkNjU0bGN0TDJvTVhDRHg4bnVkRHRHRkU0R0NMa2Q1RzQ0UlhqVUNxanhn?=
 =?utf-8?Q?lseoqN/ikEInUHu4w7sFn7I=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: /2Vw1GQNgeUuEInTRmos9ijC6vYx5JJupU9L9v/r3s0YRWwv/6cw0Cz97QWfPMffUohO1NI21XlTvE1355yt9GRwEWTxtodyjmTMOWJY2U8DAiG9BBQk6EO0S2iYqghMq8qj6ff8CNzn556/ZAYOHt3s849CvNsrlm4dhMgMHfB2795EB24/hGzBeUzxAKHhAzOpYCFPLmO/KvWOxlIdd1peBSbjN09Rbbkhx0kyiwLrC43eWGMp6IHJfaFgC2uOZatzzN3yZPxVqOBcnOyyUE83PJhxr+rCe2ZtYdLFBhhVhLwdeMzfYjCJTv87Izr1hIrI/5Y+RzM5NvcPiygEMmSkTztAxJyYpXOvm1o4m1MVHjvv3PKXrQwJQJ80T9g5Cmes7oXyTg8ZTgSlenvwe0sgQHKeDsPgHx2XH8ZkPXQFZtqo16cUvApckPuazvlCMF248UnQj932OWwTd+kyGVrh/tujLcSIxCB4XbT+3w7+qpM1gHLLhu7Y+pjTuZEWpEaPFzwLJSdtQB0UgVrVQ5JQfpHE2jwE/pfomuvUk5g1CO6nW3yGLK9J1PAdN02HPgttlQbVcXn51WcWfNA8PNROevnRpPahkvT9pQmV9i4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fc81102-32ee-41a5-9749-08dc604234da
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6290.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2024 07:27:45.2006 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6jlueWNBx9MlcVTeNXPhozx+iydPQSc2pHSW4/ivs/rfvRlRi7RvSIV4pvOVxRlx8ib9c3whJg75xHEShYsvKQk4UMcD9gVm9HIH29BBXz17vgY94Jp7cXA9aJEw7Ec2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4293
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-19_04,2024-04-17_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxscore=0 mlxlogscore=999
 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2404010000
 definitions=main-2404190053
X-Proofpoint-ORIG-GUID: LwgFOxc5QTctoywWuQTZbnz5JXvs_l2-
X-Proofpoint-GUID: LwgFOxc5QTctoywWuQTZbnz5JXvs_l2-
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

Hi Patrik,

On 18/04/24 18:44, Patrik Jakobsson wrote:
> On Thu, Apr 18, 2024 at 2:40 PM Harshit Mogalapalli
> <harshit.m.mogalapalli@oracle.com> wrote:
>>
>> Hi,
>>
>> While fuzzing 5.15.y kernel with Syzkaller, we noticed a INFO: task hung
>> bug in fb_deferred_io_work()
>>
>>
>> This is in 5.15.149 tag, and this is introduced by a set of commits:
>>
>> 2655757a3f10 fbdev: flush deferred IO before closing
>> 15492bab7393 fbdev: Fix incorrect page mapping clearance at
>> fb_deferred_io_release()
>> 87b9802ca824 fbdev: Fix invalid page access after closing deferred I/O
>> devices
>> 9a95fc04261f fbdev: Rename pagelist to pagereflist for deferred I/O
>> 186b89659c4c fbdev: Track deferred-I/O pages in pageref struct
>> e79b2b2aadef fbdev: defio: fix the pagelist corruption
>> 0616b00a31d6 fbdev: Don't sort deferred-I/O pages by default
>> 5d3aff76a316 fbdev/defio: Early-out if page is already enlisted
>>
>> I then tried if it could be reproducible on upstream kernel as well, and
>> it did. below is the call trace with latest 6.9-rc4 based kernel. I have
>> enabled the LOCKDEP to get locking related information.
>>
>>    INFO: task kworker/0:3:1077 blocked for more than 122 seconds.
>>          Not tainted 6.9.0-rc4+ #54
>>    "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
>>    task:kworker/0:3     state:D stack:0     pid:1077  tgid:1077  ppid:2
>>      flags:0x00004000
>>    Workqueue: events fb_deferred_io_work
>>    Call Trace:
>>     <TASK>
>>    __schedule (kernel/sched/core.c:5409 kernel/sched/core.c:6746)
>>    ? __pfx___schedule (kernel/sched/core.c:6617)
>>    ? schedule (kernel/sched/core.c:6804 kernel/sched/core.c:6837)
>>    ? __pfx___lock_release (kernel/locking/lockdep.c:5406)
>>    ? schedule (kernel/sched/core.c:6804 kernel/sched/core.c:6837)
>>    schedule (./arch/x86/include/asm/preempt.h:84 kernel/sched/core.c:6824
>> kernel/sched/core.c:6838)
>>    io_schedule (kernel/sched/core.c:9019 kernel/sched/core.c:9045)
>>    folio_wait_bit_common (mm/filemap.c:1272)
>>    ? __pfx_folio_wait_bit_common (mm/filemap.c:1206)
>>    ? __pfx___mutex_lock (kernel/locking/mutex.c:751)
>>    ? lock_acquire.part.0 (kernel/locking/lockdep.c:467
>> kernel/locking/lockdep.c:5756)
>>    ? __pfx_wake_page_function (mm/filemap.c:1091)
>>    ? __pfx_lock_acquire.part.0 (kernel/locking/lockdep.c:5719)
>>    fb_deferred_io_work (./include/linux/pagemap.h:1069
>> drivers/video/fbdev/core/fb_defio.c:248)
>>    ? lock_acquire (./include/trace/events/lock.h:24
>> kernel/locking/lockdep.c:5725)
>>    process_one_work (kernel/workqueue.c:3254)
>>    ? __pfx_lock_acquire.part.0 (kernel/locking/lockdep.c:5719)
>>    ? __pfx_process_one_work (kernel/workqueue.c:3156)
>>    ? assign_work (kernel/workqueue.c:1210)
>>    worker_thread (kernel/workqueue.c:3329 kernel/workqueue.c:3416)
>>    ? __kthread_parkme (kernel/kthread.c:293)
>>    ? __pfx_worker_thread (kernel/workqueue.c:3362)
>>    kthread (kernel/kthread.c:388)
>>    ? __pfx_kthread (kernel/kthread.c:341)
>>    ret_from_fork (arch/x86/kernel/process.c:147)
>>    ? __pfx_kthread (kernel/kthread.c:341)
>>    ret_from_fork_asm (arch/x86/entry/entry_64.S:257)
>>     </TASK>
>>    INFO: task r:2664 blocked for more than 123 seconds.
>>          Not tainted 6.9.0-rc4+ #54
>>    "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
>>    task:r               state:D stack:0     pid:2664  tgid:2664
>> ppid:2618   flags:0x00000002
>>    Call Trace:
>>     <TASK>
>>    __schedule (kernel/sched/core.c:5409 kernel/sched/core.c:6746)
>>    ? __pfx___schedule (kernel/sched/core.c:6617)
>>    ? schedule (kernel/sched/core.c:6804 kernel/sched/core.c:6837)
>>    ? __pfx___lock_release (kernel/locking/lockdep.c:5406)
>>    ? schedule (kernel/sched/core.c:6804 kernel/sched/core.c:6837)
>>    schedule (./arch/x86/include/asm/preempt.h:84 kernel/sched/core.c:6824
>> kernel/sched/core.c:6838)
>>    schedule_timeout (kernel/time/timer.c:2559)
>>    ? __pfx_schedule_timeout (kernel/time/timer.c:2544)
>>    ? mark_lock.part.0 (./arch/x86/include/asm/bitops.h:227
>> ./arch/x86/include/asm/bitops.h:239
>> ./include/asm-generic/bitops/instrumented-non-atomic.h:142
>> kernel/locking/lockdep.c:228 kernel/locking/lockdep.c:4656)
>>    ? mark_held_locks (kernel/locking/lockdep.c:4274)
>>    ? lockdep_hardirqs_on_prepare.part.0 (kernel/locking/lockdep.c:4300
>> kernel/locking/lockdep.c:4359)
>>    __wait_for_common (kernel/sched/completion.c:95
>> kernel/sched/completion.c:116)
>>    ? __pfx_schedule_timeout (kernel/time/timer.c:2544)
>>    ? __pfx___wait_for_common (kernel/sched/completion.c:110)
>>    ? start_flush_work (kernel/workqueue.c:4192)
>>    __flush_work (kernel/workqueue.c:4207)
>>    ? __pfx___flush_work (kernel/workqueue.c:4195)
>>    ? __pfx_wq_barrier_func (kernel/workqueue.c:3742)
>>    ? flush_delayed_work (kernel/workqueue.c:4249)
>>    ? __pfx_fb_release (drivers/video/fbdev/core/fb_chrdev.c:375)
>>    fb_deferred_io_lastclose (drivers/video/fbdev/core/fb_defio.c:321)
>>    ? __pfx_fb_release (drivers/video/fbdev/core/fb_chrdev.c:375)
>>    fb_deferred_io_release (drivers/video/fbdev/core/fb_defio.c:333)
>>    fb_release (drivers/video/fbdev/core/fb_chrdev.c:383)
>>    ? __pfx_fb_release (drivers/video/fbdev/core/fb_chrdev.c:375)
>>    __fput (fs/file_table.c:422)
>>    task_work_run (kernel/task_work.c:180 (discriminator 1))
>>    ? __pfx_task_work_run (kernel/task_work.c:148)
>>    ? do_raw_spin_unlock (./arch/x86/include/asm/paravirt.h:589
>> ./arch/x86/include/asm/qspinlock.h:57 kernel/locking/spinlock_debug.c:142)
>>    do_exit (kernel/exit.c:879)
>>    ? do_raw_spin_lock (./arch/x86/include/asm/atomic.h:115
>> ./include/linux/atomic/atomic-arch-fallback.h:2170
>> ./include/linux/atomic/atomic-instrumented.h:1302
>> ./include/asm-generic/qspinlock.h:111 kernel/locking/spinlock_debug.c:116)
>>    ? __pfx_do_exit (kernel/exit.c:819)
>>    ? __pfx_do_raw_spin_lock (kernel/locking/spinlock_debug.c:114)
>>    do_group_exit (kernel/exit.c:1008)
>>    __x64_sys_exit_group (kernel/exit.c:1036)
>>    do_syscall_64 (arch/x86/entry/common.c:52 arch/x86/entry/common.c:83)
>>    entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:130)
>>    RIP: 0033:0x7f9cfe71e5f1
>>    RSP: 002b:00007ffd636aec08 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
>>    RAX: ffffffffffffffda RBX: 00007f9cfe7fc510 RCX: 00007f9cfe71e5f1
>>    RDX: 000000000000003c RSI: 00000000000000e7 RDI: 0000000000000000
>>    RBP: 0000000000000000 R08: ffffffffffffff80 R09: 0000000000000000
>>    R10: 0000000000000020 R11: 0000000000000246 R12: 00007f9cfe7fc510
>>    R13: 0000000000000000 R14: 00007f9cfe7fc9e8 R15: 00007f9cfe7fca00
>>     </TASK>
>>
>>    Showing all locks held in the system:
>>    1 lock held by khungtaskd/50:
>>    #0: ffffffff950219c0 (rcu_read_lock){....}-{1:2}, at:
>> debug_show_all_locks (./include/linux/rcupdate.h:329 (discriminator 1)
>> ./include/linux/rcupdate.h:781 (discriminator 1)
>> kernel/locking/lockdep.c:6614 (discriminator 1))
>>    3 locks held by kworker/0:3/1077:
>>    #0: ffff88810005ad48 ((wq_completion)events){+.+.}-{0:0}, at:
>> process_one_work (kernel/workqueue.c:3229)
>>    #1: ffff8881080dfd98
>> ((work_completion)(&(&info->deferred_work)->work)){+.+.}-{0:0}, at:
>> process_one_work (kernel/workqueue.c:3230)
>>    #2: ffff88811416db38 (&fbdefio->lock){+.+.}-{3:3}, at:
>> fb_deferred_io_work (drivers/video/fbdev/core/fb_defio.c:246)
>>    1 lock held by r/2664:
>>    #0: ffff8881141fe078 (&fb_info->lock){+.+.}-{3:3}, at: fb_release
>> (drivers/video/fbdev/core/fb_chrdev.c:380)
>>
>>
>>
>> Syzkaller initially generated a long reproducer, Vegard simplified it to
>> the one below
>>
>> C repro:
>>
>> #define _GNU_SOURCE
>> #include <sys/mman.h>
>> #include <fcntl.h>
>> #include <stdlib.h>
>> #include <unistd.h>
>>
>> int main(void)
>> {
>>           int fd = open("/dev/fb0", O_RDWR, 0);
>>
>>           char *ptr = (char *) 0x20000000ul;
>>
>>           mmap(ptr, 4096, PROT_WRITE, MAP_FIXED | MAP_SHARED, fd, 0xff000);
>>           *ptr = 0;
>>
>>           mmap(ptr, 4096, PROT_WRITE, MAP_FIXED | MAP_SHARED, fd, 0);
>>           *ptr = 0;
>>
>>           return 0;
>> }
>>
>> This needs to be run as root to see the hang in 122 seconds.
>>
>> 238 static void fb_deferred_io_work(struct work_struct *work)
>> 239 {
>> 240         struct fb_info *info = container_of(work, struct fb_info,
>> deferred_work.work);
>> 241         struct fb_deferred_io_pageref *pageref, *next;
>> 242         struct fb_deferred_io *fbdefio = info->fbdefio;
>> 243
>> 244         /* here we mkclean the pages, then do all deferred IO */
>> 245         mutex_lock(&fbdefio->lock);
>> 246         list_for_each_entry(pageref, &fbdefio->pagereflist, list) {
>> 247                 struct page *cur = pageref->page;
>> 248                 lock_page(cur);
>> 249                 page_mkclean(cur);
>> 250                 unlock_page(cur);
>> 251         }
>>
>> It is stalling on lock_page() in fb_deferred_io_work()
>>
>> I will be happy to try any patches and report back.
> 
> Hi,


Thanks for the quick response and sharing details.

> This sounds similar to the SUSE bug [1]. We fixed it by reverting [2]
> in the SUSE kernel. The problem seems to be that flush_delayed_work()
> kills the timer and re-queues the work but doesn't guarantee that it
> is finished when returning. So when the device is closed, the
> fb_deferred_io_work() function can still be queued and tries to access
> memory that's been freed.
> 

I tried reverting that commit but saw some other similar problem,

here it is:

[  618.508726] INFO: task r:2682 blocked for more than 122 seconds.
[  618.513662]       Not tainted 6.9.0-rc4+ #55
[  618.517105] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" 
disables this message.
[  618.523204] task:r               state:D stack:0     pid:2682 
tgid:2682  ppid:2636   flags:0x00000004
[  618.530325] Call Trace:
[  618.532470]  <TASK>
[  618.534394]  __schedule+0x787/0x1b10
[  618.537506]  ? __pfx___schedule+0x10/0x10
[  618.540784]  ? schedule+0x1e6/0x290
[  618.543698]  ? __lock_release+0x103/0x460
[  618.546982]  ? folio_wait_bit_common+0x22a/0x8b0
[  618.550697]  ? __pfx___lock_release+0x10/0x10
[  618.554268]  ? mark_lock.part.0+0x77/0x880
[  618.557614]  ? schedule+0x1e6/0x290
[  618.560545]  schedule+0xdd/0x290
[  618.563324]  io_schedule+0xc4/0x140
[  618.566251]  folio_wait_bit_common+0x32a/0x8b0
[  618.570062]  ? __pfx_folio_wait_bit_common+0x10/0x10
[  618.574231]  ? mark_lock.part.0+0x77/0x880
[  618.577575]  ? __pfx_wake_page_function+0x10/0x10
[  618.581430]  __do_fault+0x2fc/0x610
[  618.584329]  ? __thp_vma_allowable_orders+0x25e/0x9f0
[  618.588442]  do_fault+0x22e/0xb60
[  618.591222]  handle_pte_fault+0x55a/0x7e0
[  618.594543]  ? thp_vma_allowable_orders.constprop.0+0x66/0x1e0
[  618.599204]  __handle_mm_fault+0xf93/0x1580
[  618.602652]  ? __pfx___handle_mm_fault+0x10/0x10
[  618.606460]  ? find_vma+0xc5/0x150
[  618.609324]  ? __pfx_find_vma+0x10/0x10
[  618.612497]  ? lock_acquire+0x1bf/0x230
[  618.615639]  handle_mm_fault+0x288/0xa80
[  618.618882]  do_user_addr_fault+0x39a/0x1280
[  618.622453]  exc_page_fault+0xa0/0x1c0
[  618.625530]  asm_exc_page_fault+0x26/0x30
[  618.628807] RIP: 0033:0x40118d
[  618.631429] RSP: 002b:00007ffdae7ffa40 EFLAGS: 00010207
[  618.635586] RAX: 0000000020000000 RBX: 0000000000000000 RCX: 
00007f8c00b4d557
[  618.641281] RDX: 0000000000000002 RSI: 0000000000001000 RDI: 
0000000020000000
[  618.646822] RBP: 00007ffdae7ffa50 R08: 0000000000000003 R09: 
00000000000ff000
[  618.652349] R10: 0000000000000011 R11: 0000000000000246 R12: 
00007ffdae7ffb88
[  618.657931] R13: 0000000000401136 R14: 00007f8c00cedaa0 R15: 
0000000000403e08
[  618.663498]  </TASK>
[  618.665808]
[  618.665808] Showing all locks held in the system:
[  618.671090] 1 lock held by khungtaskd/51:
[  618.674595]  #0: ffffffff950219c0 (rcu_read_lock){....}-{1:2}, at: 
debug_show_all_locks+0x75/0x340
[  618.682063] 1 lock held by r/2682:
[  618.685101]  #0: ffff888100072fe0 (&mm->mmap_lock){++++}-{3:3}, at: 
lock_mm_and_find_vma+0x3a/0x6b0
[  618.692648]
[  618.694194] =============================================
[  618.694194]


Note that, reverting all 8 commits doesn't show any issue on 5.15.y, but 
that does not look like a feasible solution.

I think we can say that the issue is localized to the above pointed 8 
commits.

Thanks,
Harshit


> Patch [2] tries to solve the problem of not throwing away pending data
> when closing the device. Perhaps calling cancel_delayed_work_sync()
> and then follow up with a manual call to fb_deferred_io_work() would
> be enough to flush the remaining data?
> 
> -Patrik
> 
> [1] https://bugzilla.suse.com/show_bug.cgi?id=1221814
> [2] 33cd6ea9c067 fbdev: flush deferred IO before closing
> 
>>
>>
>> Thanks,
>> Harshit

