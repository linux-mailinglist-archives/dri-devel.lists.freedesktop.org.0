Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7416E4FCD88
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 06:20:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25DB210FDE4;
	Tue, 12 Apr 2022 04:19:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A88E510FDE4
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 04:19:56 +0000 (UTC)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23C1kKe9012649; 
 Tue, 12 Apr 2022 04:19:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=TpllYDvCuxc+f8Ux6GuY1sR+6vtNh1R7sdw0/FKSRQI=;
 b=JEsgaf3ysriMp+hZyxciiWcEiLARJkRfpn0Ym2U8cvLgJeiGq4MCCAbxiATCIu0h4/CU
 SioZPpMIWBig/Y5GSpAdLXK+D4OJ83lB1Z4qg0rwzP8w8W4X9/aax4exajSd7fBLBmP4
 wlZAsdWVVTS29wXdtD9+27kXx/2JNgyQRDURMY/gWCyBFJZi5UPI8KuUqqP9Yi4+c11E
 JJziBw5NNE1Mxgfuc5465mLPVoBcaJ8ro8fjUR6p8mU0kL1mq1IPN8t2lOI+cTQaa4BW
 fuOcZ7OzMEUi8sYOSlJJGRtKoIL76QwMenpe3FyQG76x8zN5mrM8CM1gZjmm+9E9PTw2 6A== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com with ESMTP id 3fb2ptwkbf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 12 Apr 2022 04:19:52 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 23C4HLix036827; Tue, 12 Apr 2022 04:19:52 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2172.outbound.protection.outlook.com [104.47.56.172])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3fb0k2rm8j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 12 Apr 2022 04:19:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E+zzk3mn7RBJI3NBWQF96UFIPNv6Ol3n6BaXHnRGTo5ZhgcYSJs/gllle0v71tNMpk8M5UOKXPNOGB1o8F0Aa74uenr32QF+EQPt0HcTC1SVVTOoLg3CcuXRrzTVZma3tReRzuW2PZVZjATCnXtfmimBq7dzp4K26kJzHWGhYADIjI1s9UKBHi9MLeShb3j2y7RP/ZTyAZrSTvgugTQpa9qCxryHOQITm614a501JTFbbZKTFg54Yq32zI0dP2L3nPHZ5y0Hr6p9v9XM3xOChdHq0f2p3gf+Dv3UsA6Bwib3KkqTRAc2r92nquu+I+MYS1GJg3ZxCakM/zkCAR00+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TpllYDvCuxc+f8Ux6GuY1sR+6vtNh1R7sdw0/FKSRQI=;
 b=Q4Pwnp4cQbkeQ08fgLE65MQio6uEYakjYokbiP0pKf+tcp5hHJysduIOBYEYSGe0C5MfDXMz6GIVYW5+W5oKJiA66YEGBeKJoFllJsf+Rsdry3pRdhOsha3HPtJq2mieKHAP887tRyEAUMkvzl0AfYYcVFjGRytJxVn/pz+VYTpUwhANmvoC7a2pivuPBL1EKr/5wH1ywv0+QSewTPEhcIx6LMrZZ183LmPzhBOJhbjxHHijf7FfHbb/dM279QgikHxNerAyw7tlIDIzob9OYBNalHT4+iGF7Y8CemjQuIKN4s5BCtj39x+wEgXxd6dTl0PEM7c0TZerhpma7CswxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TpllYDvCuxc+f8Ux6GuY1sR+6vtNh1R7sdw0/FKSRQI=;
 b=g1TO2id60fl/xjubY8DtXx7t+wfz5UqTM7aDwKxeGbpRJqdLCrBeYek6x0euYrwrfGzgdRDWdcsjUpUCvG5jgJK2YICC57HrGMxj3K/lU6eLhg52r24mP0OVoy6PmrYbLQGEL6Mxzgur1GDDB4i7NGJBttNAKE1XYWOP4cz928I=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by DM8PR10MB5495.namprd10.prod.outlook.com
 (2603:10b6:8:22::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Tue, 12 Apr
 2022 04:19:50 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::b5d5:7b39:ca2d:1b87]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::b5d5:7b39:ca2d:1b87%5]) with mapi id 15.20.5144.022; Tue, 12 Apr 2022
 04:19:50 +0000
Date: Tue, 12 Apr 2022 07:19:36 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH] drm/exynos: fix IS_ERR() vs NULL check in probe
Message-ID: <20220412041936.GK12805@kadam>
References: <CGME20220408102327epcas1p409b13bf2da7e19b0a24571ce50e3ea92@epcas1p4.samsung.com>
 <20220408102134.GA14120@kili>
 <c7606920-b5c9-f8e3-3026-631a796c195a@samsung.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c7606920-b5c9-f8e3-3026-631a796c195a@samsung.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: MR2P264CA0101.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:33::17) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 245ff2e5-b527-4021-cc1e-08da1c3baf9d
X-MS-TrafficTypeDiagnostic: DM8PR10MB5495:EE_
X-Microsoft-Antispam-PRVS: <DM8PR10MB54952018119AE1CD5D47B8728EED9@DM8PR10MB5495.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ebYLWi0U0SYeoFA2EhdfNs7npTWv6h+ExjPxRCB63Zd5W9rJFzXkT4YmvCb9WvGtP1tmAgMzMN62wmbncl64bD/+GkgxYtv/IUw//zEdHIOpI+LLHKsM622BYrhB3gA15eS/eWVu9EsNnkt0qhPY6GaMPkQe/Vw7wTr61ZNSyVGS57uDUKAynIxscZLazd4iih+4+6EbUYsIOxmdR7yo1MGwOJ4yyiUleCh9UJ3p436ECGMhcx2GTtP5RYVudaupa/zOvugC/ytEaqlWyzTF4pW0XSGTYIqy3m/j7styLRnV9FjEblF9vF0NMk/x63l2Ia6LBb0hTz/1YhrEcmLOjQwXcCqOmxXPkxEUHQjtGXENCgTNJLQyE+PodLCtaMtV3/S89B+fag7enaNPDSyjLAECjrPKzz0biEtToMeBv1+C0IhIU71akrpmA5wyhp7xKKwZQZOdJpsZllp0/bBFEOfkt6kevh6GU3aU+ihvUQsqlDP/JcQrJ7aHWeb33XByHjLQLWVRkmlgys9aaaXHxSRnQalKV+gYmVwAbfmcckJMJBeHA0hXTzOaTXpVQSQt7NF+z9NCu3sL6uILor/RVKp+c/ZUgs+VclYI+vPHuD24/T0yKKKIABqGmcI52jq+GIaSN7DHeND8uZe6Uc3q14biue3SnPAxlxpha3WseL4V89BIbDTSKN9d3QSJqfSR+Xpehv2IcWgTyLm1OZnGaPGrzr1c27dcPoSMx8Q4mQ+TrUjdl35xd9rsWz3BBXMjVtxFa1djGbSEA3FObk3z4ti9/dyLn58vKBQO8mUOXrI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(366004)(8936002)(38100700002)(6486002)(966005)(86362001)(52116002)(33716001)(6506007)(38350700002)(6916009)(4744005)(7416002)(5660300002)(316002)(66946007)(4326008)(8676002)(66476007)(1076003)(186003)(26005)(508600001)(54906003)(44832011)(66556008)(6666004)(6512007)(9686003)(33656002)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+QZgL5PoMbGGqVk+rSR2s6n/OF93qIE5eDz98Cf16xXf0e2xnbPqrNyYi+11?=
 =?us-ascii?Q?5zeQQCOcwnz/Q/UhaDMM2mLJOwp1OGOAq73WzM03eAvEGhYvgkkscxCb4HqC?=
 =?us-ascii?Q?34oBU/ynNAXriMTbQAbozXNMTFrwOX3QPE4gl3WmvMGMvI8t7dbZ8eWrTH2k?=
 =?us-ascii?Q?lKewqmHAD1mcNlwDdcBWBLCf4mnAuiFe2nSXhPUCTN4LeNIuz3E14x+/mXv1?=
 =?us-ascii?Q?5lNeIbUkkZBISlSblTWicGkWZvUROKZWNAnBJyKPxxUeKoaw5cVsQYYvl215?=
 =?us-ascii?Q?IjYDjY072c873ff3J/XZnCpC8FHc0W5Az1Q15HYMdfINpbY/rbPHVsdjDRQe?=
 =?us-ascii?Q?19G3v+whphuNIjtrJd+hvi4IxcHILHVxdebwXpoiyU43HBVcmZ+QnqUv1oHF?=
 =?us-ascii?Q?zP+lFnwJfjI6jYXCIQePKISdd5hnupWI67UhBB0MhiR9kwGT8OTS6+X7omIc?=
 =?us-ascii?Q?ohmHHoBLL1LVa8svQKfRslDgQQE0KlQmHNzLhxeZU+61wGqq7Xtxu7ODZBWL?=
 =?us-ascii?Q?wIBlAkt7vXBXHIenYcT8g1+NsA10MOJyCCcdF4S+Exmlz74Lm3wZS3sDDoT9?=
 =?us-ascii?Q?aXHQCW76Fbt9xDITl4O+dkOJVhyHM2Rxtr6TpPOCrAIGJZ319Nav+lj1GEfD?=
 =?us-ascii?Q?xw5xA7u6dOIzDkBkXGPIFcPiHTgpKoL6C69SRclkA/GyBhQ7m0ynTqEHR7ud?=
 =?us-ascii?Q?YvuWngBqxl9YdAIpIlJmAnd9tBTGj5ACynB8AJq1+byuI3MNtk1UiVt31jdl?=
 =?us-ascii?Q?z8ulFwSTHYFQwP/hdAUd23IEdnUvtOokBIqvb6R8pacomzzzF/ypwD7pmHcR?=
 =?us-ascii?Q?J54FAHGUZAHQy6rVhxzR8PEUYSbkGUKtW+Dy7xljm6dSy7nY2bwAUpLxSiDE?=
 =?us-ascii?Q?U+B+8HBadFYuRcKKKDocPkcbJV2Wd6SOojm/yCjeR+oCvSIEY7zsMHt2dmNI?=
 =?us-ascii?Q?kl4jPXNrhjEZReFAofhRDSuRmVoiSditsKLAoLqvDtRhTLzts54DVnRdvu4D?=
 =?us-ascii?Q?fq9mgnBSqfpbneIj1nNxwfcfAHj0gWA+lNwgdefO34vIbb5H66S+xZX5KeYn?=
 =?us-ascii?Q?1oMCiQwfr2j5cFYarYkLrcScp7JPB3ez7JZB2bXOMH4ZHln64yLRWJjT64w9?=
 =?us-ascii?Q?KjZrjrlnhWcg4wx5G2Pk1+eS81jIEEv1/x1XhQUOpkhtEpSOlTVzU90SnMjR?=
 =?us-ascii?Q?LyfpGX+0QzY1a8yrPpsJVsD7OxPCAdEichsHGfeB3At5KVtE82QJXMTGaNmR?=
 =?us-ascii?Q?gZA1TA5QU1Z9SklP7IXLhd47uW5G+Gm+LzYfVUy/VrtT7hpHAwbIyVWNyYEi?=
 =?us-ascii?Q?ed7w1urWPFo46KN0b9TJRl/aUgGiW072sAOnWHJ12GQvsxckVgUM6Fb7XVhe?=
 =?us-ascii?Q?f2Hi8gT85Fmrfp1HdUSl3NEAa51EmrCDJjakf6yRD3JehNs1oDP78LJUTQOp?=
 =?us-ascii?Q?HaNj1RD6V6cEVFasQxsmhZ5BhO4zB5dCAqrXUoQSMk2a9QiKDTRNks1+TvCd?=
 =?us-ascii?Q?X/w1XCZDllE97Xue15FONu2nPBePiYe03O7NwVyH5Bsg9mIuTZQzlMdrBomG?=
 =?us-ascii?Q?3p5JbqbRhhdGSJDE1JGn1oSYHtI9RIm+jG4YNT2kYfi+yqyLNzgZrN4DLb3m?=
 =?us-ascii?Q?ZmGSYeohl8w92KHLmUR2Q/Rf0VI6EC2t181x8s353pmW5ty3doU1eoOxW1CO?=
 =?us-ascii?Q?tKwn98dQwKRizp8d/W7fhj1wNF5PlxRxOVYHfnwf9R6IYREePbelcHxPG5+q?=
 =?us-ascii?Q?WeRhi3OdjtKQS8vdN8+Z3HLIpcMHmt4=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 245ff2e5-b527-4021-cc1e-08da1c3baf9d
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2022 04:19:50.3380 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K+MyJmPJPIikGJpXxxziev63ZFR0eeNB0g0xMWj1hcerFQ752KmnJSuYXhdOnhDSW0yoKfni+DVew/36GB5Xb6IOl6sEkRPAoEs/Q21r2cM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR10MB5495
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.425, 18.0.858
 definitions=2022-04-11_09:2022-04-11,
 2022-04-11 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 suspectscore=0
 malwarescore=0 mlxlogscore=844 spamscore=0 adultscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204120018
X-Proofpoint-ORIG-GUID: 1SMOzQYsc_UpuF6yrSg-YZzWmzI-6Uuk
X-Proofpoint-GUID: 1SMOzQYsc_UpuF6yrSg-YZzWmzI-6Uuk
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
Cc: linux-samsung-soc@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>,
 David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 12, 2022 at 10:01:20AM +0900, Inki Dae wrote:
> Hi Dan Carpenter.
> 
> Same patch[1] was posted so I will pick it up. 
> 
> [1] https://www.spinics.net/lists/arm-kernel/msg967488.html 
> 

It's not the same.  That one returns -EINVAL and mine returns
-EPROBE_DEFER.  I obvoiously thought that -EPROBE_DEFER was the correct
return but I wasn't positive.  -EPROBE_DEFER is kind of a special
return so I think it matters to get this correct.

regards,
dan carpenter

