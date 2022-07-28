Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB1558402D
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jul 2022 15:39:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEB809A9FE;
	Thu, 28 Jul 2022 13:39:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3EAF9A9F0
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jul 2022 13:39:29 +0000 (UTC)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26SD2lTT018068;
 Thu, 28 Jul 2022 13:39:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2022-7-12;
 bh=K0CWaI8QiRXpya7TUprvSJlHEMbCY6N+Bb8zjq8eCaY=;
 b=Y0Ebigt4V5OuXAPFMAM0iw1Aaz+/BnXEQEmXSKeDlXLu46Uil7BAEgTLpU9Dh1L/169q
 KbHAwZytapzmY18lc58mnEEJg6dFLYKmVswTVXycv1DImpGakv8HlpwHP3lAExN9uGPl
 1nOXvYDRZGewTKeWFlGFGMPWhWYmQv3EeTgveTSdtk5BODpUnUdQxpz80Kn0b7E8LZ8z
 ymmx4MQ8H75i4eyM0oKe06H7l8rm+9GI69ddkMzPtRp+AFNCFKXJc1Vog07EinFAYNao
 ED6xrsSoMCzItQjK2XUSxbaB8v46ngshvNOkSrIaMICtU9IQjOS0N9BWp7B1AQu8eGZD uQ== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3hg9a4vr16-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 28 Jul 2022 13:39:28 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 26SCgqLL016626; Thu, 28 Jul 2022 13:39:27 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3hh6539b0v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 28 Jul 2022 13:39:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Io+oCX8bdfDRP7urgqlxP7wjiAdkLKHfxdMi52COY1pc8rl93UQLYKkOH+zWc0MWj3m1CQZeZrXi/VuMgrfjJLnDorN8PboKzygC3AsJBQMUHlI0I7mebOusrkKFa49CWc9pYLpL7lu70vr2Gtz5JTn1XnOLBAHk17JewAuSi+T5EKAosx4noASnlPRVczusgmOGOJD31+EZ/HjHavM11kN2CCQrtDfFS9o7cEB5sjMU1zMrLAO6KEdJwCmdwjXee/QcSia7qXuyopaxkUQ2qftDT6+C1b9XnAoM7CkoLlpLpS5Zbg2ou5Budxq+Ug4GvrZKG3cHQWeEuzpfB6cr8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K0CWaI8QiRXpya7TUprvSJlHEMbCY6N+Bb8zjq8eCaY=;
 b=KdFWbooIYO7Fl7qkqUlpRZpRSroYj1bsIDsdsFeBnslkmy11FahWksH61LbcpT9t63y8/RmqYwKYKE/DPoGr0xjRIyOQO8mx1UO7T5Mk0oS8sfgXFni5TTbqfRg2WfA0RrLI3m4Jubc6fAXss00FNF5Vk2JETr8/8KpmAAw5or5mfsAUWLcxh45uZSjYI7HxTe9syb6ZlJDWv+m19vRs19j7zxg2rBiIhJYquNd1mKEBe3agORi+SiDbudVd3TKk8G+CY+eEq1qnSK1mlv4N7wrIipkdyQeoCCpWlWy4i5Bqc+W9iTKw4Gq3f2JhPhzH16YjHmC5Bn/MmBBW5OPK8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K0CWaI8QiRXpya7TUprvSJlHEMbCY6N+Bb8zjq8eCaY=;
 b=uQzFS+dXatVfHEz0geal81clHU4iqQNuEg35GpAnZbJZ6261rJjYPd8V3ZesBch/p7JYiyd8wjKjRF183fSOSwg2CkHGFRnBh5mybwnNR7Vl/s833lNpKwz0Aa1GgJb7wlcaCTqhQ16jyJ2u4CpiUNZhp62VRxvBVUghlELNkEg=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by DM5PR1001MB2185.namprd10.prod.outlook.com
 (2603:10b6:4:2f::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Thu, 28 Jul
 2022 13:39:24 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::209e:de4d:68ea:c026]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::209e:de4d:68ea:c026%3]) with mapi id 15.20.5482.011; Thu, 28 Jul 2022
 13:39:24 +0000
Date: Thu, 28 Jul 2022 16:39:03 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: "Liu, Chuansheng" <chuansheng.liu@intel.com>
Subject: Re: [PATCH v3] staging: fbtft: core: set smem_len before
 fb_deferred_io_init call
Message-ID: <20220728133903.GU2316@kadam>
References: <YuDlfLeossnntH/C@kroah.com>
 <20220727073550.1491126-1-peter.suti@streamunlimited.com>
 <BL1PR11MB544569ACF9F4EE383F07959597969@BL1PR11MB5445.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BL1PR11MB544569ACF9F4EE383F07959597969@BL1PR11MB5445.namprd11.prod.outlook.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JN2P275CA0047.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:2::35)
 To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f665f8ac-3291-4ed9-4b42-08da709e958a
X-MS-TrafficTypeDiagnostic: DM5PR1001MB2185:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tfvVpzWDvXbIFcwce+q6dsbJkdqFHwarw4ABVYX6gmaVAgWmwLiOb2A3MymlBohCmgB6c3+D/3g/QuBD1A7dLlkt/SbHnyn02i8W+Z5e0EfuaH7h8XqWK57KDrnSJLCjV3r+q9Iql7EKW0aOIHIlpXBUxE9PHJ5ooeHxaTU3oEC9tQFiASgJtXpb1BY1hStBrtP6ZtmqwKr1IeGarplSmWYygXVUuU5wfbZKH5VDsrbkO4zN2LZNxFs82esmXtBwnnHfM1JpTytN2t+tlYj3e7DaFK3BW6NHumLJ13ITUVr5ctO6iguXC3AjwL4cqH8aK6BRqnwJ15h8eSwjd7oWr0pHhTnh/AvP1Dlnz/+T9b3Pwj8xTrcZfYUjWQJ9FfJmGcMfKG+GldY5e0QPAxiGm/HbXIQAbT5/UZfXA0hU0Twqeb7vvolxZanFLWFPPVaawRB69bSPNtNYODFhXxVf4gItsW+mfXphHWnxXg9Hqi0PWxyFGIXhlB8oaJgxnMKVd1fg41/geZLg9CpOjEnlczNV8we4coO1tkfBbCBRFdlWBJLQGsxLkz5HklKraY4TERBOy/7rZwIBt8KcfcVVbG5DG1bgyPyQjFceP7PamU7lW/CqWRxbSh3Bis2/zXW5/PVOp5YM8Ho8SUOdob4y7L3AiWNiibxykYAMRQ5PsOZUKtlFOTwcEoor6dlL+dbjm5QYDjXqlsc5MEYhbddd5I2nNK5rhu1Jo6LuJox8bC5TdBiROOus72ZkCE9DaUugOWVFsRF4nXRz0obE542SBPzgMnbOdBkYEGxurbO2En2eSQ1PQVT76+enl1QNxOIR
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(7916004)(136003)(396003)(39860400002)(346002)(366004)(376002)(38350700002)(8676002)(4326008)(66476007)(33716001)(8936002)(5660300002)(66946007)(66556008)(6862004)(44832011)(33656002)(6486002)(38100700002)(1076003)(186003)(26005)(2906002)(41300700001)(9686003)(316002)(6666004)(86362001)(6506007)(6512007)(478600001)(52116002)(54906003)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6m5bs2U2UflaMvM6agpm12wyA3yswyLiSIeUubLasNxvgQv5m9uagCbTyO0Y?=
 =?us-ascii?Q?U3KlMdDIoJYi3c2ISEJlJmSIHMObWm4BHV+4xolN7+YrzOnN+k1cjY04UyLO?=
 =?us-ascii?Q?b3yrGtPwzJ+jh09DYzX8NWJ1KUYWyUHaLNqDBxBaPUv+QZMhn+etOzJcGY6U?=
 =?us-ascii?Q?lBJqRyZmYBF+x/tWTogmhKHuDy5e3J63irdXv8Ywd4O7yeyVCUKp4UPp5a5Y?=
 =?us-ascii?Q?f/ajDmAB6mlxM2Iaf1AgeFSl65HBDClJP43UcfDbjUc2dRKt+A7XqObhoaZ/?=
 =?us-ascii?Q?djgj7OJmg/QSlfNVoB/dXW3tjYT8xTbef7WdoFGce6XePwW73qddTisqHbr4?=
 =?us-ascii?Q?pBTmG8kxKNwCGQKHMw7nehMKrTnnZWW1haBwOzm+CKn3GMODEs1jACKnZs/Z?=
 =?us-ascii?Q?ZxagtOEcPK+BVi3EYupAEEqj731bqzFn27Ygj6dH82zHuysr7fr7rwgOTC8K?=
 =?us-ascii?Q?phNHDWOjKh865XjYLYFf0EjNYJx4/rSBlmINyHPJ8SHGgUBQLcxGSLcCCbS2?=
 =?us-ascii?Q?eulaVZ645nbu0z7PS2zjYvQr8pxJ/vP0cj6LwdO3JEqfcP4AR0768wd6G1YF?=
 =?us-ascii?Q?GTUZDtGccpF/zblCwryL9fX2cN7VRkh+J5rALw/cBYA6bN0m5oJmLRl4Sc63?=
 =?us-ascii?Q?cWK5hM3eWC+jhvbk8A7d1YiAmvbNs4guqBfRYKO/EgvSqvY7C9H8gG+VNztJ?=
 =?us-ascii?Q?JNvSxGerTyUqE/gHPoKPckHz8DgQ2Ce9zI538h43Zg6I2LMbVXXxMkDamueZ?=
 =?us-ascii?Q?MTW0C1c/I+GtKKnQZRijJECiZQCpBMr+ZPVfOIt140GJufkqp7QNRmBOwBOR?=
 =?us-ascii?Q?Q5ZezHICCvbFGrqd7l2rYTERdxNuFVy+oBQ4dUCJ+T6HB3MHVQuGIzNffjIB?=
 =?us-ascii?Q?Z0IG2T2HRMKZzAUQcxuW6MEolFKd+hoGh3cSjN3tp3bXdXXs1nmb3uDAyLju?=
 =?us-ascii?Q?Dw0q4VsgPHiuwP6Sdkja8PoLxBS4Soutlbh8SOc/v4CV/CU8iSsKVpDpBYHP?=
 =?us-ascii?Q?Ze3eAKGO6KLB2oY7+CW+A5Q0y03pL7BIyLxktY5yrcdlLqkG1Q7FfhMTtDda?=
 =?us-ascii?Q?UQlFRDJSAlwgSZsOlM7g4/K2+801yXeYINiIJu8b5+ss14C92QVkL49GzkAz?=
 =?us-ascii?Q?nYiprefFHYY4T8+CImnOBKWvvUYdHMTMp/rDhMOYeO9VRp2hLzvycZwo8Rf/?=
 =?us-ascii?Q?e5qyybVPbV96BFRIcu7JENspOThMndNTbE4vzjam/d0sGYUP0CTu0NDw6S/i?=
 =?us-ascii?Q?Wp5MbJfOWEx0AmmGKpORcZjwddNcFnD930kw6ANbVEk3vadQEtRG3xOPoqio?=
 =?us-ascii?Q?Xy6NCjDlyxmaSkXOL8JOwCrUBGXkpwne/4alKvAhxFyiWkGzKUGqw04syFWx?=
 =?us-ascii?Q?lsGadcwXvntlJNg0GqDzrrFY5KtVzzC2hEcB9tpBJ57D569u9SiEw1Wzcjf6?=
 =?us-ascii?Q?25o2mIrT4bRIqxaFzQw/ftJ+cvWtcQPHDT5XKsc9mZWuHLeq9PRRgArlOvsU?=
 =?us-ascii?Q?xLdvUs22qKyajCOpG2mJr5UoveAqxbaz9R+g+6YdXVP/JhmRsTOFkW9ZpCax?=
 =?us-ascii?Q?boeaphX85hzTEztWVW49RXGhyZU8oVlOvwJB+rp8hiSZ87QbHcqY6v+T+tGS?=
 =?us-ascii?Q?7A=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f665f8ac-3291-4ed9-4b42-08da709e958a
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2022 13:39:24.7201 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GfN0UJ98FJXAXtioNFkJ+PX8E7g+F0XxA4Z7EasJ9wV0ODUilo7nmExvlgkYQlNgf1xTif10d1XpjWGDgbvfOAezzkAJv8FGBrn6LqIzd9U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1001MB2185
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-28_05,2022-07-28_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 phishscore=0 bulkscore=0
 adultscore=0 mlxscore=0 mlxlogscore=999 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207280061
X-Proofpoint-ORIG-GUID: qgLaJsKG9qwECGt38vlcjaRT4wBeBLK3
X-Proofpoint-GUID: qgLaJsKG9qwECGt38vlcjaRT4wBeBLK3
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
Cc: "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
 Javier Martinez Canillas <javierm@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Peter Suti <peter.suti@streamunlimited.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 28, 2022 at 12:49:15PM +0000, Liu, Chuansheng wrote:
> Hi Peter,
> 
> > 
> > The fbtft_framebuffer_alloc() calls fb_deferred_io_init() before
> > initializing info->fix.smem_len.  It is set to zero by the
> > framebuffer_alloc() function.  It will trigger a WARN_ON() at the
> > start of fb_deferred_io_init() and the function will not do anything.
> 
> Please show us the WARN_ON() call stack, then everything is clear.
> It is the driver itself issue to be fixed. I saw Thomas made such
> WARN_ON().

I don't understand the confusion here.  The code is very simple and the
description seems very clear.  No need to redo the patch.  I think
Peter tested it before the WARN_ON() was added so he probably didn't
see the WARN_ON().  I told him to add that because it's pretty obvious
what will happen just from reading the code.

> 
> > 
> > Fixes: 856082f021a2 ("fbdev: defio: fix the pagelist corruption")
> 
> Don't agree with such description.

I don't see how you can disagree?  Before your patch the
fb_deferred_io_init() did not use info->fix.smem_len and now it does.

regards,
dan carpenter
