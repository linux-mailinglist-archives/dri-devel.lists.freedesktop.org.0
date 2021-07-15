Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA6FC3CA0FF
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jul 2021 16:55:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CB4B6E860;
	Thu, 15 Jul 2021 14:55:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2052.outbound.protection.outlook.com [40.107.92.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90C3E6E860;
 Thu, 15 Jul 2021 14:55:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oLs0WNpAymiVptj1LPtku7XXqxvB1ZBKC22Xqd9DkfQQkHKUV3Rkh5S5nAbgA6BNTSTAONmxMDFq+1/nLwk3l4h8FPW+/ZBQ14kqAJRPGYdrwSxTlfkYc7iKtEYFsys3PPVCHdvRNWDL1DM1LltrXpXWqq3kSz6JxUotWcWjCHodYMeZdeu8NMAAAKLLsFBrFF25SPsoFYyRjRl+os0YVu9CJN+njDXhOHFI16nBqnMBlpW5gTC0rMxnUdfoee7svHydlx472mpmJ0MNOONTjQwhRSRr7XS//fBIVd0S0d1dYZIc5S3rM/fGr9Ral+a8phaiD3Y6cuh1djwpH86NXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=guA2e0ovaaT8BnGSBE34Q9CJNmQ8V+ghtdZcvwWQSKE=;
 b=k5gN3gXAnaGGXrZ8awgkuKKzCsYsfPv1oP7XC+np4p4fJQmn871HHFRV3Se8OmyJyAqAH+L56FCdxyC45a0e/NvaUB0+OPYUR/8DOWUbBnD2cmNv6gxdAUw9KzYif+GizLaOC/tq7YNba1hZLN08+lDnMRnhLN7RcIXZ3B+9YGiNiHe7eX8u+/F/LWQiZ8kUpusdJvDJpxdLiY//sXtY/h4oBkd3CBtWnDr6iQ7pLnYUTuQ3YJMvTNyAyhOaD1C1IXSoe6JJ3rt/pVEGnQe5B+SbHcngmDRwVqBQBvOTrDlyao3dqhCiIoFOHi0OyrCX6td+jOWreW1bLomrV8J3IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=guA2e0ovaaT8BnGSBE34Q9CJNmQ8V+ghtdZcvwWQSKE=;
 b=tDVqvhDKpCD/tTNQt52ua/3R9H+suP/L8PCeUl6MaRaqL47izTpRdovkmw5buAobA6tqzKb8F190QqSc11VnabRS2ODyG9b7EW2u5l/4stzHWZMNuSGoL/4l7Et356b5J89dDRcE8lvW8s4KqBjQ6i9cwsbA/cIa3RIjoNCEHBDKhPlD3zvBYbNH8N6usnQYVgGSHkkIC9B75np6R0mUEtCq4vo/Fwspg5sqSXJk0Kw4QARVnKPNcFZ7IovrqrJsuAXRRJLb5w8dbqfVDkawxJCTQhkM1ioS3AwLHCy+LedHGX2qUwRDnKPuite4RNvphuH4Tof6G5jnZZzBcFYdZQ==
Authentication-Results: nvidia.com; dkim=none (message not signed)
 header.d=none;nvidia.com; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5061.namprd12.prod.outlook.com (2603:10b6:208:310::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.22; Thu, 15 Jul
 2021 14:55:50 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482%5]) with mapi id 15.20.4331.024; Thu, 15 Jul 2021
 14:55:50 +0000
Date: Thu, 15 Jul 2021 11:55:48 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Kirti Wankhede <kwankhede@nvidia.com>
Subject: Re: [PATCH 00/13] Provide core infrastructure for managing
 open/release
Message-ID: <20210715145548.GD543781@nvidia.com>
References: <0-v1-eaf3ccbba33c+1add0-vfio_reflck_jgg@nvidia.com>
 <862e9ad9-e1f8-4179-4809-9b5b2743e640@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <862e9ad9-e1f8-4179-4809-9b5b2743e640@nvidia.com>
X-ClientProxiedBy: CH2PR14CA0057.namprd14.prod.outlook.com
 (2603:10b6:610:56::37) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (206.223.160.26) by
 CH2PR14CA0057.namprd14.prod.outlook.com (2603:10b6:610:56::37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Thu, 15 Jul 2021 14:55:49 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1m42mC-002gn2-4p; Thu, 15 Jul 2021 11:55:48 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6d4b88ec-2636-4001-a9d2-08d947a0a246
X-MS-TrafficTypeDiagnostic: BL1PR12MB5061:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB50616A6C01DDF7C6F131AAC6C2129@BL1PR12MB5061.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eo8LYRLGsdqOCItotTvWoarad4KYfMIxhR/hcIGnm8aTILLtEopc8kMPL/DR8QIPs/A230IADYFDEUR5jjsmOn1zexocS7u+BHO7+9532DxCfJpgGDFx4GJ6qwAb+e7I4EsqxilPPeknlXnXa91SKijMKeTMUXkjytdJd/6for3nJEeKGxBV0zJU1O2+JuLVQ7Cl5bWF+OMdUFzhX5SqF8whA0wC9Ziz3vnx3UsZ7LLISL0Xlm1OrxTLqZ/W44jbBvZzl6bBbcZF/82hbboajP+C+JnoJ2hp+Ym/3+3f0izxTDlNjaicf7R2ftmNbWM5K5wm3B/0/3G5BhXLy+Uw/LEl1B943IjMs8fmu6U2SEAR8ExhR1EokhnaBHPuQ/7I/3pyaj2Zq0TE7/ZDlUqRofnQPlwSca3/AQ7YFQ660DObZYWnTd7zhUtntLoNDWcv1b7fzgAfFyeuhK0aXrKfULfl4TBL06Gwmj6URNDCx/U9fqGOoyQy2bUV7jVlsXmcOsbBjD+ueKHNx8m28YqV5ari2E5KsRRdYoJoSpyFJGNGyZz7J+qveOEdMycmgzQ6IE5V1IWqmZhH5Y0jVj+wRzub7bPSU4esn9opihd/tSJwV4LWbUdtMdOX4nLYE5GvCDTVVS0ZJsK8bI9LkynRo5oiIhoTdL1by7U0ltiG9j9PEJrXjEhTL4FN9x9O9TwJwbfX6xJ5zrtfS7New3aOOg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(136003)(366004)(396003)(376002)(8676002)(4744005)(478600001)(5660300002)(54906003)(37006003)(186003)(1076003)(86362001)(2906002)(6636002)(316002)(36756003)(426003)(66476007)(66946007)(8936002)(33656002)(83380400001)(6862004)(66556008)(2616005)(38100700002)(107886003)(26005)(4326008)(9786002)(9746002)(7416002)(7406005)(27376004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FYVLkBk1VNHvjyxZw0ZNpplUByUzkXMSrTz4nrBMHqjqTt+v53EynhZy8XR1?=
 =?us-ascii?Q?MBXvY/T1zNkBrr5pHQR3EqjRoDaPBQsWRztWtQNOrxTi5Nw3W9txNgz3+4UD?=
 =?us-ascii?Q?mbKGs9/ukWf66uRScagCa1MYcU7cS0K7d7rW5bk0YB4JGhpJnRkmfuxQcasI?=
 =?us-ascii?Q?6D2r7HkX0krO94h8yfveQUHttnydYq1bNawaT/571hfhLT3lFzjp5iLMigv2?=
 =?us-ascii?Q?gQnahZvzCU6jL4XPiCFidM6KpI0Fq7TPuNLbc7kqy/pD4iTdK3X9KcbNi9ON?=
 =?us-ascii?Q?4aYtJBsa8HgkARzeO86AnMt3yfd/U+X2xF29pRfKbVD8vdADBTVdWZEJW61n?=
 =?us-ascii?Q?d8MrN5ErVmSCkbn24+H4i1d/3AubTkFABxxwoY7xTFnyzuHaewH1n0Cjpgwn?=
 =?us-ascii?Q?jCBGmFvVG2+3ESQcbrFARfVo6+bP+tzUP0mBxVCKxu8W9Ufc14Atr0Q/Lh9b?=
 =?us-ascii?Q?bjRQOocAMZ7ZrPrZkComqydvf35j/R+rct6vD+QHqxdamTdTf65ib2W3IzRB?=
 =?us-ascii?Q?X5gSOhMZLZBYLDHe3D/jSE4aaRmq0JmBPMWekHYUeiIVtthggbuW0NE/vMyY?=
 =?us-ascii?Q?UByGe/6IEsUXRAt7yD3ve0CjGbzfbbR55XZMXm4kLuSb3u/Efk0Zm8bWRN7E?=
 =?us-ascii?Q?sMByz97cQPXO7CGLV9z9yrS1dUYjECdXbPnfx9dmQObZW2tv5GMJ9Kp2LRAs?=
 =?us-ascii?Q?ba+uaC5nvwS0jXewyHDSYxco5quPxkNRrrrWzhoqnvogqi5Wv3lyE3ohkfzm?=
 =?us-ascii?Q?AiD+0TfzLkAwhUhk0O4ShgG1EVRylY6UsNAA3+jAAW+dBHGO5JSHXhWd7NOE?=
 =?us-ascii?Q?sC0yO4pzmf8xgYgtRqCoglM1KaJ3ivfRForMoWkhmTqqGGP0HSWj28DahxHP?=
 =?us-ascii?Q?yv3d/H6niEfjmfVJhLAjlGDE4HrvRo2D763AiUoXzAA2B3G7aDKHSL4Ofb04?=
 =?us-ascii?Q?EIq4p7p+vn4VFIX3vgqret4WGJT6rsGsWS6Agt2i8athw/u/Z1zzvbynLz3U?=
 =?us-ascii?Q?s0E4uLbRz7z5PHyRD1y1lInVKNg+47rFoQEnhbY5I9Qy2fE8ce3vtySyVxQu?=
 =?us-ascii?Q?BKEzUJc7kqN0Rbc4eSaOzpSPDw3rbL7s/GqFA06EUcQnXTdIe6m3aloHUNY0?=
 =?us-ascii?Q?g3KJLGB6DUNLf5pAAdioIzRiIvQX0UpCkPJFQYTVCpPx5y2O+cG1PjuFiFIZ?=
 =?us-ascii?Q?87B2x204X+BRMEfNuD+85aeHchmr/Vxz3DV275GN02h9iO9BV+dCJlG63Ga2?=
 =?us-ascii?Q?cXEHkpap1ORfHetUe7X6sMlkvsRgSELrfR6P6AactV687hZdmwmj9IND1FYd?=
 =?us-ascii?Q?3Ho4/WooVON8PgbN6MzueXRk?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d4b88ec-2636-4001-a9d2-08d947a0a246
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2021 14:55:49.7612 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7R3CRmrkFBvWf9epZ850JB0cjoUsrbVUULXGCCFvoDNKiayQ6RQskkFDH9j8e+UJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5061
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
Cc: kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Max Gurtovoy <mgurtovoy@nvidia.com>, Vineeth Vijayan <vneethv@linux.ibm.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>, Leon Romanovsky <leonro@nvidia.com>,
 Christoph Hellwig <hch@lst.de>, linux-s390@vger.kernel.org,
 Matthew Rosato <mjrosato@linux.ibm.com>, Jonathan Corbet <corbet@lwn.net>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 intel-gfx@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>,
 Jason Herne <jjherne@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gvt-dev@lists.freedesktop.org,
 "Raj, Ashok" <ashok.raj@intel.com>, Tony Krowiak <akrowiak@linux.ibm.com>,
 Yishai Hadas <yishaih@nvidia.com>, Cornelia Huck <cohuck@redhat.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 15, 2021 at 06:58:31PM +0530, Kirti Wankhede wrote:

> > Review of all the drivers show that they are either already open coding
> > the first/last semantic or are buggy and missing it. All drivers are
> > migrated/fixed to the new open/close_device ops and the unused per-FD
> > open()/release() ops are deleted.
> 
> Why can't open()/release() ops be reused instead of adding
> open_device()/close_device().

It could be done but it would ruin the structure of the patch series,
obfuscate the naming of the ops, and complicate backporting as this is
a significant semantic difference.

Overall when funtionality changes significantly it is better to change
the name along with it

Jason
