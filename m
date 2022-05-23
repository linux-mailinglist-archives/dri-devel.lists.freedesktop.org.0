Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08624530E7F
	for <lists+dri-devel@lfdr.de>; Mon, 23 May 2022 13:03:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71BDE10E437;
	Mon, 23 May 2022 11:03:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2114510E437
 for <dri-devel@lists.freedesktop.org>; Mon, 23 May 2022 11:03:46 +0000 (UTC)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24NA0qFL001784;
 Mon, 23 May 2022 11:03:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : in-reply-to : mime-version;
 s=corp-2021-07-09; bh=fyZeTPPnloARzgJaNtfO8n9if/QRnebH5ILdMKTdLCg=;
 b=zPP9mm7YNAjuTu9AyWF+xpjxWvjENVT42gCuwJNWdpVoADZ0jJFWu0A3/NOHSOC2dAN+
 P9JvnyQK4z/f+3pX1pU7zWP02YDw93uqcgT/xW206bRLPEVKkPNC8/pD8bF57SSBUrpI
 VKURvP4Kfg41jiPj6t9F7k86AKeHJ7s3VDe8pMv/fSdaSpig5Z/fbtrPCe0rvemOKzhh
 /RpmMakMf5gHlWvVMYm2pwzlV1yUrBkT0Al/E8ApRerrs+82cT85d6Y5VP7IDe7x1/6u
 EjBNOxVVbgqd0PiODEJyzcql7Xi+n2nuL8M/W/ZlyiIpIXNaY2CpRviCa+FhgPqIepke xQ== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3g6qya2xry-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 23 May 2022 11:03:44 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 24NB00Br027859; Mon, 23 May 2022 11:03:43 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com
 (mail-bn1nam07lp2047.outbound.protection.outlook.com [104.47.51.47])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3g6ph17wcw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 23 May 2022 11:03:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qrv9oIw658wv6ZpiIjlKUoId2eFBJH+pg0BTcKt8ctmZf8FUllWkwe3LS1K4j657o8sySxGGO1OKtgf/P7+C/64r6sxG8uecHCOP6QWv+qtURYdffeCGzliz6099RO5daa9UtcJ/yxN11VDcxx03hl4GZFiPjtctqWeZx9/tVywnl0UdnDjsPHczkY+CDMIrAFPl0yI0cLcDJD3oeI1WfSCblZOpoky48v3isvWbHLatKX2xzH04Vb5gjVZW8LTsI3BdgVfhi9eiIVWYPAJUj94kTRKVXKaruXkXm2Z3olpt6BgDlJshk8PnazbXhg3len7dlKGD/fTxiMrWUusbMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fyZeTPPnloARzgJaNtfO8n9if/QRnebH5ILdMKTdLCg=;
 b=R3hE4lHeYGfQS6sbkVtDEV2XhiYyWxC404wi2gWg3qUphjzFoAmFfn1WuBnYwaeAj6RzivY067640gzpcM4/yt8V5pu98Mr++Xo2tCQO3H7OQXYe2j6wdBNcINSexveNP9lc0ap1coueg5978/zAjbdP1QUWTUfCho1zPT5KFf1zSpq71iijNrn9GHZ2v2FqTvt/WxoqQzngguEObe+CG/KZiTnnXw9F8TPcxVkbMrIi7/VIb4slMKu4wLeavHhseS2fWH3k5lUC6ZBGrQBNEzJ0Q6URSPqZ2g3VWelVCTfiusJPlr5L8y9pmGMdhE0iTDRaBYRhICwWsGPEeCHJ5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fyZeTPPnloARzgJaNtfO8n9if/QRnebH5ILdMKTdLCg=;
 b=YfWnNAidLsySKIfvpHFQXC2PGzoQEEhTsHR5gBemisuFK4Rp234oqBhxaxbjvhCnv+1HYMUxWyYxceXzmzNRo0UXpW+ekUGz5Kv6S8f2c/bFfzGQXlzGUFJJ0UJcNUE/+ECG81ypiLMvdYQywhgZcCOyTFTx4+kfbGRHXAfyV1Q=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by BN8PR10MB3153.namprd10.prod.outlook.com
 (2603:10b6:408:c1::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.19; Mon, 23 May
 2022 11:03:41 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::86f:81ba:9951:5a7e]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::86f:81ba:9951:5a7e%2]) with mapi id 15.20.5273.023; Mon, 23 May 2022
 11:03:41 +0000
Date: Mon, 23 May 2022 14:03:20 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: kbuild@lists.01.org, Vivek Kasireddy <vivek.kasireddy@intel.com>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] udmabuf: Set the DMA mask for the udmabuf device
Message-ID: <202205210319.OvuI0mKr-lkp@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220520062308.3660563-1-vivek.kasireddy@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNAP275CA0043.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4e::19)
 To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f7ca53d5-72aa-48dd-42cb-08da3cabe512
X-MS-TrafficTypeDiagnostic: BN8PR10MB3153:EE_
X-Microsoft-Antispam-PRVS: <BN8PR10MB31532373AE4DBE4F2EC564E98ED49@BN8PR10MB3153.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: T3XBk9WwuqwFYMTGhO37qLzvNPSeRNlp5pSqhNnSwylsuEAGe42aPCAkcVGubtfD5xOTXJCg2Y74hvXy7SzvRgtPa9mOZ9PV9jA8cdSn5uzmDQ+3Qm2kObf1hmzyAx29+Nh4vvEb1CbgOA5Ow46+cRGBXJvacaY6Vja/v0zb7oAomOsXyzStnj4N7cKbRNBzWFv915mjZ5XK+TDRvo7hhHIayffEbOMlYr8OPJhxVUq5ekaweAZvu9tApLQlJQI3cj8evR15XOK5i7oX1EGjPFPyELu11mmx+G08ZmanUU6YvLXtM4cLQEkb1WZzVLcTSaMFqwpHzgRsrOCV0Kjiy/E6M5JbWF8YrMmAa/6OUE4fEbybjL7KRtVmo9ol0iNvmCrFz5Fvn59bPyLrz6oWOII/bkPqt7nHLHOC+J+j8lzhFXkJ5O7dnEcp/qcT1AZvuM7WbPx0j1MLSkJKWVVqW7q0q5hikTB8Um+ROG6kwxe/nsShpko8GbzdD6F6eecTzYQQS0/LgYsHfdOU1l/ceuZiCzcdgPAlp27U7UnNZTb5qH5DTF6IEmIp9KMUgOCFC1O57WXYfayncFmtOBYFeKYlfQkNd5uK3w/UMpSsbTOJ47z/bMcyQMMbsX8kEBQBtDVGmLerB9fr+s98uFsPXd5gyRaNC96nOQp+BB540/jI0H9NJwjVMsTBQhg79doyWE82r91jMi2ihTyZ3/rmqPb7ftHesb4/sXom8nD2wVGYgLppIeXnzArJuF51qN+30UKEjpaoXjTsF2iQxAEsCdENgoHB4m2132nb4aV/mWB/spj16Jw54HfYqh7U6qWF
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(4326008)(66476007)(66556008)(86362001)(66946007)(36756003)(8676002)(508600001)(83380400001)(2906002)(1076003)(186003)(6486002)(966005)(9686003)(54906003)(8936002)(44832011)(316002)(5660300002)(52116002)(6666004)(6512007)(26005)(38350700002)(38100700002)(6506007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?km5Rl7A6wIQ+eLl9DKUqIBJfdeaBSnO20EWE1RBe56Kws3wcY0mi9p3wF6/e?=
 =?us-ascii?Q?Di7s7L8uWpp7umjL+8EhPsmxKe2J8S/+y7R5upHmdEmZD2JvI9dQTb59NGs2?=
 =?us-ascii?Q?6/HYUpR8ee1Usc6BUIZYDa9lpywQz5MbOdp1TizVAXB50x+6hiuVRZ+Se+kA?=
 =?us-ascii?Q?MN8P4/cq4SKDXitM+RFW12u4z1jWbUbMza1miNFp88XeWdV389ZB8HPl8JsK?=
 =?us-ascii?Q?LuB1j/SzMLq9QGeSIjJ7AVM6p40UcpvVNLkbo6LkB6cR90JvZMVZKp5txBWc?=
 =?us-ascii?Q?4GZz4ga85bIXZNPwDeaP/NfrSqRhshWvTwOUBMkc3FciXVhowTNAgVvzc6Zt?=
 =?us-ascii?Q?AAjxBtbGJ4syVDsRgw921wSimUy2r3oRTeYxpRyccnMRJF+mluDWVEn2V6yU?=
 =?us-ascii?Q?12cPVsE5o6J6VOxiPn1nfByJaDAVIlYNy5wK+U7uVf1LrsQKLBVWegJ4DNiV?=
 =?us-ascii?Q?rTNrekMiFoqeb4UCr1Si21aczQtOsDNeu+glEzCrG1wb3y2aZCZyXarzj6So?=
 =?us-ascii?Q?eqx/g2XU+FjMFc0uRwKz4NTfHFtzGb4sZIiO9NufbQqrfFM1EqwNg2TbrZ8c?=
 =?us-ascii?Q?eiWEkSPUTlx8AwvKRoC87ZWuCeink3YVXZIb4z4R8HPToP4c0MfyTHch+Oz6?=
 =?us-ascii?Q?0DRLVRAj0+l8v+/+ITeMWqr8Ebchyst1BrHp372G+wLHH3QpkORYkmkOgczv?=
 =?us-ascii?Q?kHV6rYdYmw4pukVjySh2z+be+2a55r21wZm2aOmDUBTpr0Z9czQ05IK6q0q6?=
 =?us-ascii?Q?k6noluVfpifY6/PJJjOmtRG7s32r0QdGhZ2KqVUpI9WM8Oq5BwU1z8/ObKRK?=
 =?us-ascii?Q?nXMQ7RYhsyCdXdCcei2+kWadhmLWmyKTgu+W6e0wMAM+FGHTP7xh4OTY3BJH?=
 =?us-ascii?Q?KPfqVl4kdN80B9wXRM/cVde+SKqWrAf219dtVzBLg/LK/lpqd0X6F/CP8BRa?=
 =?us-ascii?Q?4X3xcDlZtJ92MeVw5EaZ2RRgRjUnyzU4n/XhNm+Tv6mpsw8KDRC31kLU2Nfe?=
 =?us-ascii?Q?Ro/hXTzeOwnja41rGKhipG7ldN1A6izUkMQgjB5B2m18jLs+Vi7mk15NQMyE?=
 =?us-ascii?Q?lmJVxJUGg50PKVrWHg6HJy3IQ/X4klWn4zJ322P2UOjtOldc4ZD6AtJ+YF3m?=
 =?us-ascii?Q?aTQ90ZgSHxrVUAwY+OFNPGXRI3cxW3IEZOpskHJFkTqebStyBtxQHW3Xo/BG?=
 =?us-ascii?Q?jNVBWHllDomWr4JJtsiiyzRkQ5sw3firRs3uskj/Cj2zjmkb3KjwvMlgMbEt?=
 =?us-ascii?Q?XLXogP5GdUiiefSmqT25DCaYdtBNYGnQm4wIvhA34893xGSe9U12y5rSqBMD?=
 =?us-ascii?Q?TI31PQbVgQao+ry038e3zAvdoBE/+mcNUH+/k4/t2Qa6a7GCSHZLZH7aSEIC?=
 =?us-ascii?Q?mvtU+39gGs88qRJ4dkEW2o2gnVFYEKX9Y1hQVreXXV8jo1wLXtmBytssvAZQ?=
 =?us-ascii?Q?RbnQAKDItPV10tBKkfmhpJh+//18Jq6ioz9oYfE86k2P335wqM1McElq7+jv?=
 =?us-ascii?Q?ya939v5jYK8SKZkDHyrP1otl+/NvQrUWgTyaPrrkoLqbOqIucYx8KvDEWbO5?=
 =?us-ascii?Q?OU24oHI7Abt2/fCos3+sraQdlMEXi3nsPQnxdRClphFK9OuHJMZcRb4lcHyK?=
 =?us-ascii?Q?O9ssWOEhvyrkJLuf2sBTX9A9vDY1v+PT5Lqcn1DcWH7uv+tUb5kMEQlU47lI?=
 =?us-ascii?Q?6WNLeziXpZYEcARqgjn0DMmN4yYElKboyPDL9AbsAioiq4TuBSvHRyaaBNnO?=
 =?us-ascii?Q?21O1Csb2GlbRkGlZvzxWfZC4uPGHmK0=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7ca53d5-72aa-48dd-42cb-08da3cabe512
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2022 11:03:41.2849 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vevbQKaXkNrxkJUPLq+0s4E8yduatXkHUHNaq2to5n5+wUaM4uVeKQbOGddzDdZRJM0gisOV2X5SZMvWuYDGYBTQ6veXLDBIkedvcBrQsyk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR10MB3153
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.874
 definitions=2022-05-23_04:2022-05-23,
 2022-05-23 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 bulkscore=0
 mlxscore=0 mlxlogscore=999 suspectscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2205230061
X-Proofpoint-GUID: FuAqQw-02wX1lYiTW8laoPK49umyQBzQ
X-Proofpoint-ORIG-GUID: FuAqQw-02wX1lYiTW8laoPK49umyQBzQ
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, kbuild-all@lists.01.org, lkp@intel.com,
 Vivek Kasireddy <vivek.kasireddy@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Vivek,

url:    https://github.com/intel-lab-lkp/linux/commits/Vivek-Kasireddy/udmabuf-Set-the-DMA-mask-for-the-udmabuf-device/20220520-144218
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/20220521/202205210319.OvuI0mKr-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-1) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/dma-buf/udmabuf.c:383 udmabuf_dev_init() warn: '&udmabuf_misc' from misc_register() not released on lines: 380.

vim +383 drivers/dma-buf/udmabuf.c

fbb0de79507819 Gerd Hoffmann   2018-08-27  366  static int __init udmabuf_dev_init(void)
fbb0de79507819 Gerd Hoffmann   2018-08-27  367  {
0fdcc793991b9f Vivek Kasireddy 2022-05-19  368  	int ret;
0fdcc793991b9f Vivek Kasireddy 2022-05-19  369  
0fdcc793991b9f Vivek Kasireddy 2022-05-19  370  	ret = misc_register(&udmabuf_misc);
0fdcc793991b9f Vivek Kasireddy 2022-05-19  371  	if (ret < 0) {
0fdcc793991b9f Vivek Kasireddy 2022-05-19  372  		pr_err("Could not initialize udmabuf device\n");
0fdcc793991b9f Vivek Kasireddy 2022-05-19  373  		return ret;
0fdcc793991b9f Vivek Kasireddy 2022-05-19  374  	}
0fdcc793991b9f Vivek Kasireddy 2022-05-19  375  
0fdcc793991b9f Vivek Kasireddy 2022-05-19  376  	ret = dma_coerce_mask_and_coherent(udmabuf_misc.this_device,
0fdcc793991b9f Vivek Kasireddy 2022-05-19  377  					   DMA_BIT_MASK(64));
0fdcc793991b9f Vivek Kasireddy 2022-05-19  378  	if (ret < 0) {
0fdcc793991b9f Vivek Kasireddy 2022-05-19  379  		pr_err("Could not setup DMA mask for udmabuf device\n");

misc_unregister()?

0fdcc793991b9f Vivek Kasireddy 2022-05-19  380  		return ret;
0fdcc793991b9f Vivek Kasireddy 2022-05-19  381  	}
0fdcc793991b9f Vivek Kasireddy 2022-05-19  382  
0fdcc793991b9f Vivek Kasireddy 2022-05-19 @383  	return 0;
fbb0de79507819 Gerd Hoffmann   2018-08-27  384  }

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

