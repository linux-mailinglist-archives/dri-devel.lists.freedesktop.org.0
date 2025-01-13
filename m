Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57862A0C572
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 00:16:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C3FB10E440;
	Mon, 13 Jan 2025 23:16:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="NOFVwKA8";
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="eGo1sW2k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3723910E43C
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 23:16:38 +0000 (UTC)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50DMB6jd029204;
 Mon, 13 Jan 2025 23:16:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=
 corp-2023-11-20; bh=niydGLW+l3VrHLpFvGOHQzZpg4pJZgSXGKNXTIzGj7Q=; b=
 NOFVwKA8NvKQR77PTuwEdYpqv1VoDewvDuClaj8Hp11IUu59UvSzFf9YRGyxzwF9
 rEhY8dGhYH46+b3nc0EPCOdLPIqA/b7gxGqRxPNWQy9KrjWcUr/ncNU/MNqYyKWc
 FZLbJ9MH4IpCt6MQf6LD8uLzDv9ylXn8pWbeGdRRN+SdjEdV6RVgXsWJGRGEdVtY
 OtZ2WgY+1tvFokeu/70KFYHyGL21hsutVZjPHp6gAgujeBw/pwDPvXmh8QJJtHVb
 k9uHapmQ30p7rfOW4R+eQ7MAbMANTzStEYoR17JSwFheyWmvJyHGNvc+XyQiBxXq
 xFINhn9pY/8fjRJqcAivYg==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 443gh8vm5w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Jan 2025 23:16:26 +0000 (GMT)
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 50DMWY3A038746; Mon, 13 Jan 2025 23:16:26 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2177.outbound.protection.outlook.com [104.47.57.177])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 443f37kang-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Jan 2025 23:16:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TJ6ZEUgcQatkNGOCjttxWRIp2cgUM/SHCWBaMSO1IuGc79C1pnIKbO3F39ELtMTqeGavcR7IrF4xUUjK8R0ubOrL7r306WaMGXmTbS4qZXY1RWYRPq9e0dKzGONNFgg20ldDAInMYQ4Jve49De4Io9qD9Z03ml3MrIUFkufW0ETTosAnQiYkiKwikMrWWnN/fQPETqysu0ZV0dy7GGYeqJoPSeaz/XQs23WUvrKd9QHB9bBZnwlcASZcX/W+RzTR8H5XkzCFSmoGLw60MGwAW3RN+FrqJLj3Q8Me/b9ycew07WXvinJILo4H/ZDmT4/bE+4BgIhL+W6XhV8pISyf1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=niydGLW+l3VrHLpFvGOHQzZpg4pJZgSXGKNXTIzGj7Q=;
 b=gUW/K3nDYhBQYpo60OVDi9aI1bxGvd2WynA/mrBBW3WeRYdDFmVE4aeFylq016DwBRUnC0IFT2g60LiqBCuAOPj+7oN1F0b9QKEAANLaVg9uBrFbEaRrzBKaa2pb1g9zyIyfdP7zFp9HikahUmdhfm3mg5xIY9BjL27Of7iepV2EaNbJh7YgKyw3E3iFixhSytEECetFIzDSi45EZKbXgIa0RFDNn1mw4GaHLe6bT03LACIyvgQx3UM6s04wkbwC00q2LZozRktbcdWSgGfa4bq9uiulGaHAR8j5z8xYjyJwk1RfmNtH2NTgOtOpjkG7kkpB8k1TBh0SGF46zGte8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=niydGLW+l3VrHLpFvGOHQzZpg4pJZgSXGKNXTIzGj7Q=;
 b=eGo1sW2k6sER6cIJlgqzX8kKbdjTcLShfiC3sNzHXBzio+xGstQxlffIN23OLLQA449A/jTJE53rM/drQ5la6or1/wiS17PS8LBc8Y78hNF6xnxeh4ezzrogamz5WfNY4Vw7TlKRSRgCRMQNysA0mrothYkPdwp6/GBPmehmThA=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by DS0PR10MB6848.namprd10.prod.outlook.com (2603:10b6:8:11f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.17; Mon, 13 Jan
 2025 23:16:24 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%4]) with mapi id 15.20.8335.017; Mon, 13 Jan 2025
 23:16:24 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Jaya Kumar <jayakumar.lkml@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Matthew Wilcox <willy@infradead.org>,
 David Hildenbrand <david@redhat.com>
Subject: [RFC PATCH v2 1/3] mm: refactor rmap_walk_file() to separate out
 traversal logic
Date: Mon, 13 Jan 2025 23:15:46 +0000
Message-ID: <9406e61c80f86aa642958bf8d468491bfef6a336.1736809898.git.lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <cover.1736809898.git.lorenzo.stoakes@oracle.com>
References: <cover.1736809898.git.lorenzo.stoakes@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0063.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::14) To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|DS0PR10MB6848:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b559997-bf63-4609-685f-08dd34284c55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?eMwY2sBcoqhK/cC7Yb+QmhzOino2U9UgXLXCMWakzObwKVhVv8X7/PfIGhPi?=
 =?us-ascii?Q?ZwFC8WZZRKMTdKsimwduYlVawx0zn81f9g7XIXR7+jx/ySJ9rP7cRC4f2I0G?=
 =?us-ascii?Q?G1NMP/0T9m7NGwYRxb9s0zygAxpG9wqjhOMK1zuB7KP0J89tFoZiu3W9FgTX?=
 =?us-ascii?Q?EFF7KhXK4TSRV0wcr0nQHtq4afWLxpwhoN/aPk51H7wbBQlXGxJSKHDXinWr?=
 =?us-ascii?Q?yu2w4vKfhDcREIoq3Z2N/2aoyoJaS6b5QCjE9ivBq5GKDei922TtPuZjJbJK?=
 =?us-ascii?Q?SbmgLUaiRFdVlxJjA3P7NN3ca39GAUEPslu4tYLiQIGWQxwqqGQzapsFaSK/?=
 =?us-ascii?Q?rcv96xFOWlAwGVacrXh7s4UWsC3D0qg0IXWae/ywa7FY1fxqIpstmpApGwYE?=
 =?us-ascii?Q?3bgrhtswje9Gi3HxoXsTBguV7Xw5VzKG5q0enpG+XnWTNZs02Uh/sSrMhjK7?=
 =?us-ascii?Q?FTRr1N6Q6vjlZ46UHNtEIUTbU2JaX9hPw/S4DcrvnNFyMBhujLOd/gqWXzi/?=
 =?us-ascii?Q?1YMzLGIM0ir33NUlQTHplxKO3U4x/agMOJE7U4MHsPtubFayBFRndnbv0S+B?=
 =?us-ascii?Q?gvXcqkt1O6BtOqgg74mz04iK77hlSmC29VBjLuvCQvyHHqBQJ9tl1Pvi/DQg?=
 =?us-ascii?Q?WX2G3Cco8liPT/FSMOdR8RlBE98+RJdK1aONuwN5Jco/HJzBcme+j4PxaCZc?=
 =?us-ascii?Q?VQ0IUE+V59FpGZn0trT3iOXwcpe66GG5SegRRO76n6q10raddRZfNaCU1B0L?=
 =?us-ascii?Q?PD4LefaCa8kVwEF7cLiijcWXiShOOKqNAH+WUih0jAI5QpHCMSRxzg8b1WRW?=
 =?us-ascii?Q?untdVOClG7ck36X8I+WTvZNHbawb7bvLxSqkfSqDqEefSo6xb/YXhwrDG4Wv?=
 =?us-ascii?Q?NlIt5ouc+sIv/JZwgWY5Z2gXeS8w5R+UpnYBsH5Zo5Uec7PszkUbh8D0nx6b?=
 =?us-ascii?Q?ugFl7aJgLl22JdqoLLo7oHjnrA5XPWMjLoS1K+xQE7Lx+/S8RcUd5F0TgUU5?=
 =?us-ascii?Q?xaJGlwSbbREt626TYLC7I4JObDrNKX6ZC+RZ2SiYaxcgL02p6vek67KuRwty?=
 =?us-ascii?Q?o7707q7zqcfS3MHus29ssQQ6fgZXF9B7WQR+uiJ+hcp6+K2Lbp7xrf8e9VXJ?=
 =?us-ascii?Q?fCgJ7ImcBz4KWhkIAB+kmHNL4YaOuFQpQnBXbguR/3OHcGenqDNyHuSwy/gI?=
 =?us-ascii?Q?L0Ua/xqdhOOq+oU+y3cUdMHZ/Ii5nCTYAjtbHb5QPlnenNUzY8Cbk/XkkxNz?=
 =?us-ascii?Q?yOKrfUHrmXagHDjfxv9XPg2wfAjOCdENFh+DPqETGXIQq0gn/l+bxg6ykKkM?=
 =?us-ascii?Q?n6+y4XyYNxJ80tfE5NjGSia7BBa2dZ5yX0NDL5odh+gwp+wBVZgO3TwfYiqQ?=
 =?us-ascii?Q?NP4+6hGZvx9hdJiFZdrnLr8u2P5o?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3366.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Mcs8ly/PPphN5RjDESZAOmQsSMA0mvdQird/c+q17wLvFzMGt652C6DZYG4s?=
 =?us-ascii?Q?CLZ6w8JJXomomoHYasPiNjqvBclllcNH3cTJthlQb604CpfnHJJCaW7Swq4J?=
 =?us-ascii?Q?WzApXcbep3RhsZEd46kiVYSUpUavlhn15MPmeXMOScpYvlj8j14MqpOkwmdv?=
 =?us-ascii?Q?RXiTdIir47OdyJi8VPHq3uJE7nR6KH1mt7Fr/7xLjwHFt4O3RXSzjoH0tO1Y?=
 =?us-ascii?Q?aaE9Bm13l2BI0gFK+D+K0K8fIpVGVAZQC1/OTXh6Rar7FMOp4L0NVf0qIpmL?=
 =?us-ascii?Q?mFBuY3W92Ztn2tFMYcLRlyd4qAjhjAMqrbRzu5zhf5FbGjv4jY2AIrocYD5X?=
 =?us-ascii?Q?huBeXoyIdeDyeAeY4hV1sgvFxt4HXkuWugELu/F4eIqFOYTljWP2yVQW1kx0?=
 =?us-ascii?Q?oeWz341zYIrAEgNuEEZAcbWBNIfnE/BxTQRPVJf7MAQ6CPkftoKcqmpVqdfT?=
 =?us-ascii?Q?Pdzz1z8d2fV2D6jquMTraJhlFX2qubixcMoDE+ZRzGrK5+OmNJbHmGFiScV6?=
 =?us-ascii?Q?DmPnPhbUatIrQAyRl0MP79/Mb5Cm0bu+JnP4PF40bURRvySZTKNFfYDuRKfa?=
 =?us-ascii?Q?SJv+zDyAuJOnIaA9vLNrFew+RwyENq/GIMpBwyKOQGGrlR7Mc402EoyJGgsS?=
 =?us-ascii?Q?RwdC0Tek9zJYIYlsxJnHf+OWNEdJBogsK1fVS2k+jLYctVnXSHBX7ZLEGCjv?=
 =?us-ascii?Q?0DEWZw7vlzVb5Vk6+BbrRPzXiEx2NTWF6I36KDvN+27FOvAaEnwfoZHXGrfh?=
 =?us-ascii?Q?hZS+mSwMIcVQlBMmOEG7WHNXkM+bEBM9O6ACVOElUWvPslptnYkUgz+8QDBb?=
 =?us-ascii?Q?O9B66jV6g/fCo69gBNu73ZSqP7doJ3yPi1nXrdJRwhUrqT6h5gUYy8RuMiAY?=
 =?us-ascii?Q?+v7cD0fX5S2YROHvNm1TTnGJD8xtkTF0prk2lgZSF4pHoHqmGs2o676DrjO4?=
 =?us-ascii?Q?FPoTWdI9G96Wxtuuro6BSDyhCG+WX6acHO3vCDXqXeftEN7GfmHMYYYCmUFb?=
 =?us-ascii?Q?3TLi2/r2ZW2B9e2fAR9uiLCB21sgZyCVFKhsh0locwFYR6zUKYVXMBMh6VqM?=
 =?us-ascii?Q?5wfQS6Y2T4WTNW4OdkJFGc/LDi4fmw805hPeSFVl+XjmMwzytgcw7lDE8DZ/?=
 =?us-ascii?Q?y4RolVMyKP/mt7PYL+jqYKVBwdXVSoKhePmXVu9amcUcMvcjxOQF0C5g5kYo?=
 =?us-ascii?Q?x4/EaZMvOCzruotqY9RLNQKo1xvhwIGQ1t5OUlEch2RDrg60mGs810Rt2SNl?=
 =?us-ascii?Q?+aRV4dfCAWClGL58NEgNDyBafJkpg2hmfm4Cp+qQrH9HqjXO6rHE6j6f6gGZ?=
 =?us-ascii?Q?II3zA/+q3Bhoy6+Oqawdscm5qep0ZPHOR31Xg3Ttr7YbFMA0pcYtEMNv0A4s?=
 =?us-ascii?Q?H+rAZy8LwUaI+yiESmYGThiLnCI2k0P9iy9oJRDG4FOcHzEUUZTTiTye50jO?=
 =?us-ascii?Q?kEk9xw/5e7C9YH+iCtO0tRHCaS3YXBAnnnj96B7do/LP2kiyNgWniw37/lJl?=
 =?us-ascii?Q?N0kv1yGOLLncmc0MQcsPGk/rRFWYfc/OFjlm1x4dFnGBchWsc556tuMhWo8k?=
 =?us-ascii?Q?as6PqIlE+bVwYkXFZLMpUAUTeG5pLYeJjhRl9h6R7tLMpfAVeS6z7MezFuty?=
 =?us-ascii?Q?Vg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: JSwIRezVZp+e1sNZlZoOoaOAgiKgOR87M64i7yUHcOOdj6zUy38rDLML4TW1oO/2oW/d39qyYOlYuc4PnBvE0KQIk5gcYzQk3Lx++9UPHf2jd7Mnz3Aaghc5Eg0sHKuk2YCUVoA2abSjDYWrdL4k0pZ9Fni5s5Sx+Tq4rD+y47xzqWotrJYY+/KUf8UM7c0hbY+xRanzT0NMpqlu4vDrcJ5FI/V+VqAbpHVEPoQgbnlejQCJ+XIqj8OwofjIHjuZ/YA/nasdujXq1bfMd25f43gBgBHOcnqEH2j5IaIuh5PBqzxPkvIBKor3O+li1hPC3EKGTnaBHKs/FnhLw1f1Nj3xCvTW6KYmCF0I15jcIczUmGjdm909HXA5zYT7J/YSN8TMCjz3WX9G1TWjwMuR/uyncGwlvHsdwy140iowL8+zu/YayJ+7SlMZEKbMsIdC+bDBYMf2epdOOkOHVMg4pFFLcL3tpn4Bo9iVIQVKceMiLnVSixwJ1f7clOofSgoXGmdhcSWb+9YxFTkWSM0QgWCJgZB7G7CUFlohNS5b2EG8WulTUrybjKiTbF3j5OUJUYP80i+QQugNCiuAU5kJuLqzniJnDVwrkjXmygAaR7M=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b559997-bf63-4609-685f-08dd34284c55
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 23:16:24.1388 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nL5z+fikOA4xukntHQ5byYfP1GTY5gOZ291Q3LksN+nFgMsQ33Dt3NSJ5OOiSZYVBm1fusyQ03KIflb+PBlGwKcoXXr7L/zk2J9UGh5QTk8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6848
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-13_09,2025-01-13_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 mlxlogscore=999 spamscore=0 phishscore=0 bulkscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2411120000 definitions=main-2501130183
X-Proofpoint-GUID: J4mqIu4rvUmTGVu7f9gYK83duefwHmsI
X-Proofpoint-ORIG-GUID: J4mqIu4rvUmTGVu7f9gYK83duefwHmsI
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

In order to permit the traversal of the reverse mapping at a specified
mapping and offset rather than those specified by an input folio, we need
to separate out the portion of the rmap file logic which deals with this
traversal from those parts of the logic which interact with the folio.

This patch achieves this by adding a new static __rmap_walk_file() function
which rmap_walk_file() invokes.

This function permits the ability to pass NULL folio, on the assumption
that the caller has provided for this correctly in the callbacks specified
in the rmap_walk_control object.

Though it provides for this, and adds debug asserts to ensure that, should
a folio be specified, these are equal to the mapping and offset specified
in the folio, there should be no functional change as a result of this
patch.

The reason for adding this is to enable for future changes to permit users
to be able to traverse mappings of userland-mapped kernel memory,
write-protecting those mappings to enable page_mkwrite() or pfn_mkwrite()
fault handlers to be retriggered on subsequent dirty.

Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
---
 mm/rmap.c | 79 +++++++++++++++++++++++++++++++++++++------------------
 1 file changed, 53 insertions(+), 26 deletions(-)

diff --git a/mm/rmap.c b/mm/rmap.c
index c6c4d4ea29a7..a2ff20c2eccd 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -2653,35 +2653,37 @@ static void rmap_walk_anon(struct folio *folio,
 		anon_vma_unlock_read(anon_vma);
 }
 
-/*
- * rmap_walk_file - do something to file page using the object-based rmap method
- * @folio: the folio to be handled
- * @rwc: control variable according to each walk type
- * @locked: caller holds relevant rmap lock
+/**
+ * __rmap_walk_file() - Traverse the reverse mapping for a file-backed mapping
+ * of a page mapped within a specified page cache object at a specified offset.
  *
- * Find all the mappings of a folio using the mapping pointer and the vma chains
- * contained in the address_space struct it points to.
+ * @folio: 		Either the folio whose mappings to traverse, or if NULL,
+ * 			the callbacks specified in @rwc will be configured such
+ * 			as to be able to look up mappings correctly.
+ * @mapping: 		The page cache object whose mapping VMAs we intend to
+ * 			traverse. If @folio is non-NULL, this should be equal to
+ *			folio_mapping(folio).
+ * @pgoff_start:	The offset within @mapping of the page which we are
+ * 			looking up. If @folio is non-NULL, this should be equal
+ * 			to folio_pgoff(folio).
+ * @nr_pages:		The number of pages mapped by the mapping. If @folio is
+ *			non-NULL, this should be equal to folio_nr_pages(folio).
+ * @rwc:		The reverse mapping walk control object describing how
+ *			the traversal should proceed.
+ * @locked:		Is the @mapping already locked? If not, we acquire the
+ *			lock.
  */
-static void rmap_walk_file(struct folio *folio,
-		struct rmap_walk_control *rwc, bool locked)
+static void __rmap_walk_file(struct folio *folio, struct address_space *mapping,
+			     pgoff_t pgoff_start, unsigned long nr_pages,
+			     struct rmap_walk_control *rwc, bool locked)
 {
-	struct address_space *mapping = folio_mapping(folio);
-	pgoff_t pgoff_start, pgoff_end;
+	pgoff_t pgoff_end = pgoff_start + nr_pages - 1;
 	struct vm_area_struct *vma;
 
-	/*
-	 * The page lock not only makes sure that page->mapping cannot
-	 * suddenly be NULLified by truncation, it makes sure that the
-	 * structure at mapping cannot be freed and reused yet,
-	 * so we can safely take mapping->i_mmap_rwsem.
-	 */
-	VM_BUG_ON_FOLIO(!folio_test_locked(folio), folio);
-
-	if (!mapping)
-		return;
+	VM_WARN_ON_FOLIO(folio && mapping != folio_mapping(folio), folio);
+	VM_WARN_ON_FOLIO(folio && pgoff_start != folio_pgoff(folio), folio);
+	VM_WARN_ON_FOLIO(folio && nr_pages != folio_nr_pages(folio), folio);
 
-	pgoff_start = folio_pgoff(folio);
-	pgoff_end = pgoff_start + folio_nr_pages(folio) - 1;
 	if (!locked) {
 		if (i_mmap_trylock_read(mapping))
 			goto lookup;
@@ -2696,8 +2698,7 @@ static void rmap_walk_file(struct folio *folio,
 lookup:
 	vma_interval_tree_foreach(vma, &mapping->i_mmap,
 			pgoff_start, pgoff_end) {
-		unsigned long address = vma_address(vma, pgoff_start,
-			       folio_nr_pages(folio));
+		unsigned long address = vma_address(vma, pgoff_start, nr_pages);
 
 		VM_BUG_ON_VMA(address == -EFAULT, vma);
 		cond_resched();
@@ -2710,12 +2711,38 @@ static void rmap_walk_file(struct folio *folio,
 		if (rwc->done && rwc->done(folio))
 			goto done;
 	}
-
 done:
 	if (!locked)
 		i_mmap_unlock_read(mapping);
 }
 
+/*
+ * rmap_walk_file - do something to file page using the object-based rmap method
+ * @folio: the folio to be handled
+ * @rwc: control variable according to each walk type
+ * @locked: caller holds relevant rmap lock
+ *
+ * Find all the mappings of a folio using the mapping pointer and the vma chains
+ * contained in the address_space struct it points to.
+ */
+static void rmap_walk_file(struct folio *folio,
+		struct rmap_walk_control *rwc, bool locked)
+{
+	/*
+	 * The folio lock not only makes sure that folio->mapping cannot
+	 * suddenly be NULLified by truncation, it makes sure that the structure
+	 * at mapping cannot be freed and reused yet, so we can safely take
+	 * mapping->i_mmap_rwsem.
+	 */
+	VM_BUG_ON_FOLIO(!folio_test_locked(folio), folio);
+
+	if (!folio->mapping)
+		return;
+
+	__rmap_walk_file(folio, folio->mapping, folio->index,
+			 folio_nr_pages(folio), rwc, locked);
+}
+
 void rmap_walk(struct folio *folio, struct rmap_walk_control *rwc)
 {
 	if (unlikely(folio_test_ksm(folio)))
-- 
2.48.0

