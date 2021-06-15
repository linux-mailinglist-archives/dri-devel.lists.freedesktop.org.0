Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 085CC3A8A3A
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jun 2021 22:35:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 995EC6E0AB;
	Tue, 15 Jun 2021 20:35:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2054.outbound.protection.outlook.com [40.107.94.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C7D56E0AB;
 Tue, 15 Jun 2021 20:35:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HBblvPjoe0zUc6+JKQ3OzdxsrBSmZynirZgqB3Ejk/AdgJYWMH3Vo4q+gI5vHG7PM+z3pAQMDVn6relRNQ7nd1Qk1d+fV8BJwhFds9/Eceva7jsfXVclfVCTajZuPmJMqaF83ZWANuFPyrU7nDnOYGS/CXgQZdOgvqf5caPkArs9XAOIPVTwMRd+T8yjDftUMIXojVZhx1LRDcjUQJ+hYYkJ5M10RKkJUsPdtw9MYO0GJ5pykhBtoWFi3rnBp8hY3HAUd50eIW2SKRIykEx+ttbZc/aIDwjB7TlIGjWwDH8TqPv7x9cOTwlRHuA4fA80aGJ48P0ki07a7L387LclAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SyNPjse/mrrpjUSRXvN/I7o7CCAw5Tg26RPrmMOYX7M=;
 b=ToEdKNgEk4kxxIm1itoM8++UOmikcZzpeDT+80YHhMyL07LwdFzlWp+Lbb2EtBZSuZz2IyMgnRM/QqZ7kVuGb93n8Jj1FZpkPfe8Y5YvGLBfO6CGXasD6Q4vbL1xR4Zz36irzjzlBqyan4OtapjbQnFd4ar5JXtuzaJJHCIkwut9QuVTjRK230jk3uORXc3N5+exMi35giVZPVL4IadB1v95xbUV0n0e3dW9l4ABjquAUhgHaTEkrusWHLJp80WG9JJO1CXK6+pw8Ni/gW2WzrQh03vgBp2trYWk+bEd3550GnKQs/6Nhp/E0ZTO14aKekzMmAK+OVKfoQgEQUtryw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SyNPjse/mrrpjUSRXvN/I7o7CCAw5Tg26RPrmMOYX7M=;
 b=WuVC82WAsArqMqYUR+ZOgnm6/jGIOOw1i4Tkgluf7OhI9/NvY29cvKeudekWmNrFoG4fzA31MhyjyefT4G7NEpMrYw+NV9fusjc7xR97yLzzq7iHVe4J8znw38z7I7nFkMMzGIPFq4Lzp3WCmD4ZqYsnqadewUW+lZLhTs5yC5ta2bp7C6pZ3iDcNu18ns4mPHL+r2abLlSFNXvy8cTuMnBea1+3J5M3WXiUTp9YD4BLhjfSr087vAI5bbLimZy8oox6RzoOY8sX1MpVQmTjTirUNIknOCl5hoq4La7BVL/zj8mKbDszGvDnu5urEp4++Py/IZfir+zkWAq/TQhVUg==
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5096.namprd12.prod.outlook.com (2603:10b6:208:316::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.15; Tue, 15 Jun
 2021 20:35:16 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::3d51:a3b9:8611:684e]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::3d51:a3b9:8611:684e%8]) with mapi id 15.20.4242.016; Tue, 15 Jun 2021
 20:35:16 +0000
Date: Tue, 15 Jun 2021 17:35:15 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: Allow mdev drivers to directly create the vfio_device (v3)
Message-ID: <20210615203515.GW1002214@nvidia.com>
References: <20210615133519.754763-1-hch@lst.de>
 <20210615133549.362e5a9e.alex.williamson@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210615133549.362e5a9e.alex.williamson@redhat.com>
X-Originating-IP: [206.223.160.26]
X-ClientProxiedBy: CH2PR18CA0028.namprd18.prod.outlook.com
 (2603:10b6:610:4f::38) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (206.223.160.26) by
 CH2PR18CA0028.namprd18.prod.outlook.com (2603:10b6:610:4f::38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.20 via Frontend Transport; Tue, 15 Jun 2021 20:35:16 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1ltFmF-007EAe-CR; Tue, 15 Jun 2021 17:35:15 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c84e145d-ea49-4669-ecfa-08d9303d15ad
X-MS-TrafficTypeDiagnostic: BL1PR12MB5096:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB50965060D1ED7D046BCCCD86C2309@BL1PR12MB5096.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KIZ3yfi44ag0nkWPBZaCs5H4dg2Gpiw1SVwYzj5Xy3YdEGesCaImK8VETbUq8MvTXH+8a/2EgElNNhUiW2qBz+XGNRi7LugJPpwSN7/K2AFY+WS5sCB9DUGGm624k0ZJwCHln/tJUGDOlcVG0HktRLmXcJw8OpDbf4e6fsGwVA7LG8v2nCYihFuMhD4LTyT7S6LzXKcEOXzjE8kUMGzXnCEHtEnM+Gvdgd0dTymh36l20GEyE3WG60b4PMBBT3jqdezlriyvEPhL78jvFAs6HUuApFfAnIpnLYCW8oH72BYR753V15T+tNmho+WB8lhUkwM0RKWQNpVNysvjjDb8R+2dZcOPyxlgwf2VtThA0fYPzDi/N0pcvBrQCqxJVuD4oDi5CuMpztvySa1l2hoClb2M1qrfVnJkmwVXeTeH4i/cDpGDPhX6eQuU6iO9ZYAL4lzg+7LUVQdnAeyKhFCHAdPmpVKmgqsFtA+3Owgax/12Rb3JM6vkEHj0IhDb/fVakfCOOlOurLFO6awsj++9olvSW2ou1iziTl39/ztaWKAfJeji+xlGnK3eczXX1hLSvG2cJni1zpWxb+2uU++PZb2r1v0foSYYSPv8n1a5OoNTH8KOI5pnQhrRJTfmcY9vAQ8kwOFiS+ylEHKKwqzKWgdLBeQ6nLX4KkjQo+Pzs7C4V4mIxS2+SDMXq9njg3SwKQH+c6lIPu9ZuytFpr7P652Sw02J6NJ/tLqCjsJNZW4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(366004)(39860400002)(346002)(376002)(33656002)(66476007)(66556008)(6916009)(8936002)(86362001)(2906002)(186003)(8676002)(7416002)(38100700002)(478600001)(4326008)(83380400001)(426003)(54906003)(5660300002)(9746002)(966005)(26005)(316002)(1076003)(2616005)(36756003)(66946007)(9786002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?w3HvP2u6Tgo2+qQ4cFJsMO+q1qmdyBmlYrcy8NZog/oYwZ0paRsrGWpTopCE?=
 =?us-ascii?Q?8GGGPeeNztUdu0PqJ7YG+BwhwV8CsQ/ayUmZNu56jMd4MzUG/Z0xbf0vw44q?=
 =?us-ascii?Q?RWBPDayTzXackd7W2yl40VS1oB43cBkbQi9GVjWTQxtSR7GIRwxBOkAmKpoA?=
 =?us-ascii?Q?3F/JtOf+g5x+M1ERUU3/hraOIUz1uuMPxUss+c1iGxKtG/oTftUysJpqvusB?=
 =?us-ascii?Q?xC3avtGPLMwSk0qOS6qI20piuP9U5FU4i7MfQmU9hRPpRO4dlQ7weSppLgVJ?=
 =?us-ascii?Q?5Fyk1gsDzsUPCCzje4zKaxvwXVYDdUpF5UUINLTq+qK5OdXPAgPgrCN55Njj?=
 =?us-ascii?Q?AXdpjdfjzwYQ/rRwPFn/kXWUg2xSRLMOACE7n8KfAnPiFINVfytSJwPiE/Xk?=
 =?us-ascii?Q?WN+mZGPVTpi2AINZXzrin5fPKFM18OE90S1wGgPGoaZ4bCtj3qi35HDB6O+j?=
 =?us-ascii?Q?HScoNOIXgot2IhOfZkp58/ESePQSrU28WqxlX36RYE8RLiPXVEq1wOiGqZuP?=
 =?us-ascii?Q?mV3TA8s3GFbikoSLfrJwUmOU92fTAPu76VAX4O65t6Yf6qd6K6vAIlImULjm?=
 =?us-ascii?Q?NyNG5/8fV4EhjntSRBZhakw+3PDoxLZDXfRu+IcbeL0nmfk1aipL3G3OYALX?=
 =?us-ascii?Q?jTkD6wD+ULR6oxcHLaN7CD7kP7kBMWCL4rV3tinSDCTk1+6mt0AItABLvIoQ?=
 =?us-ascii?Q?7gwZX5rMCxdykywFpdI7f6LKZpNc+zHfEdSFAuLoBNMR5a06z5Ixv9xR8DJO?=
 =?us-ascii?Q?hPrcKnUworn3Oh9UxX2s8ytPLl8kxsOKYtmB3X5SE8+7s4pV4w+6uMXWvDkD?=
 =?us-ascii?Q?lxDOBMmTTyS4OX60uuHiF/LX5bNcSsU4WtlVoWM6WqbjW5dCf1KIbyMu/sQk?=
 =?us-ascii?Q?wOSevZ2GGfYOGvEDiC75zA7O1h9wEeQQnjGlKf/r1qXFQrtn6WtT0XCvf+3b?=
 =?us-ascii?Q?TbbZnogIIjaWeF7U0F5uspiW14JJwac2MQnwJ6eP9nEFSyNqoscKl5ztkVp1?=
 =?us-ascii?Q?8iXv6grcZNwlWHFTlP7r0lqVzh19AkxADN3LQX9NQooz/Dassp4EejLVY0Fv?=
 =?us-ascii?Q?XKXCJlEqNY5k56+uMCRZWD32wpUdT8N4Usyz3B+3cIcecn946kHlWfU12Czw?=
 =?us-ascii?Q?ykXm2tVl2vFA9T1Ks8yo0W2/Vau9y8CucbYtsoXaYGsvF4e9lA2m294JMgmw?=
 =?us-ascii?Q?3GFpD/HqC2UytLNzXFl0zZKcJwAn07Ic6Tqb/zeMbLw1rGlm4lzeVkWaT4g8?=
 =?us-ascii?Q?wdOcp00V6bL1Lxpua/D5mhgS3sLMQ6F+VADA3g7TLcJ4ZL7t6ZqtSHDnW0wY?=
 =?us-ascii?Q?oL3U6CW8YHgk3lwTwnN8YMlB?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c84e145d-ea49-4669-ecfa-08d9303d15ad
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2021 20:35:16.6833 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c3qeVrzV/I+FjL2YkX7O3f6kngbz/DorJFCUV3w9n8sATmcXaVsvbpNCCHk+7H0/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5096
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
 Kirti Wankhede <kwankhede@nvidia.com>, Christoph Hellwig <hch@lst.de>,
 linux-s390@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 intel-gfx@lists.freedesktop.org, Jason Herne <jjherne@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tony Krowiak <akrowiak@linux.ibm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Cornelia Huck <cohuck@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 15, 2021 at 01:35:49PM -0600, Alex Williamson wrote:
> On Tue, 15 Jun 2021 15:35:09 +0200
> Christoph Hellwig <hch@lst.de> wrote:
> 
> > This is my alternative take on this series from Jason:
> > 
> > https://lore.kernel.org/dri-devel/87czsszi9i.fsf@redhat.com/T/
> > 
> > The mdev/vfio parts are exactly the same, but this solves the driver core
> > changes for the direct probing without the in/out flag that Greg hated,
> > which cause a little more work, but probably make the result better.
> > 
> > Original decription from Jason below:
> > 
> > The mdev bus's core part for managing the lifecycle of devices is mostly
> > as one would expect for a driver core bus subsystem.
> > 
> > However instead of having a normal 'struct device_driver' and binding the
> > actual mdev drivers through the standard driver core mechanisms it open
> > codes this with the struct mdev_parent_ops and provides a single driver
> > that shims between the VFIO core's struct vfio_device and the actual
> > device driver.
> > 
> > Instead, allow mdev drivers implement an actual struct mdev_driver and
> > directly call vfio_register_group_dev() in the probe() function for the
> > mdev. Arrange to bind the created mdev_device to the mdev_driver that is
> > provided by the end driver.
> > 
> > The actual execution flow doesn't change much, eg what was
> > parent_ops->create is now device_driver->probe and it is called at almost
> > the exact same time - except under the normal control of the driver core.
> > 
> > Ultimately converting all the drivers unlocks a fair number of additional
> > VFIO simplifications and cleanups.
> 
> Looks like we need an update to
> Documentation/driver-api/vfio-mediated-device.rst to go along with
> this.

I have those updates in the patch that removes the old way, do you
want to move them forward to here?

> Also, if we're preserving compatibility with the "legacy"
> mdev_parent_ops callbacks without deprecating them,

I view this as breaking up the work into manageable steps and patch
series. This is already at 10 patches just to provide the
infrastructure. The next steps will be to move the driver conversions
ahead.

> does it really make sense to convert every one of the sample drivers
> to this new direct registration?  

Yes, the rest of the drivers will get converted eventually too. There
is no reason to hold things back. Depending on timelines we might be
able to get AP into this cycle too...

Jason
