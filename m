Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB353D3B32
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jul 2021 15:30:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7E1C6EE56;
	Fri, 23 Jul 2021 13:30:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2065.outbound.protection.outlook.com [40.107.243.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 322E16ECD5;
 Fri, 23 Jul 2021 13:30:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JwqPC/lih+N90JdThmnlvhEKrJTHqTpVgzdw3HyU8CIkDC7ND+dwa2bgPxYvSJTqB8OMe8rPUWN2pEPdiTKHnwMFIpDHB9/YlVre83o3ZxVXLb84E8k2GFHJwUwgm82NFWTBaT+LoX8qU3o/b7qIBeraRErkc3ImhAp7Yh7IvxuaRnfO9S4wYLRdEZXU3qaiqUi/6kJkXe8dzL7fiae0wblNzT/iMjZ1es97SaUY5IzuryR06n8gF+PHW4WhlIsJbYmVmj0b/f4rNVCfUFrj62Rkgr5YAhI/YR91CII3qfCZq2T1GUjxCQIhTF0XLBm+dWm+gXYeTnBfMKPxtBAMTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ixm/3PGHpM+2T8JfnMsnOGYOFBJxJnwguIemqmMbpxI=;
 b=Q4n7ADc4A92pyX9HnX+c2QALFQ93NXmA3TJs/5EkBcD0PvqEhOfRLrG8rm38RpmvxR+dF35QZiJ8ef5eNRmSIP50UrOdhNyGvVIwoRF8XaokQNrjXZv1bzmds8v9wid4mOVKYztN9UBEr4l8xZ971hylk3I0oOKrZoDRBhbNzXpVy/BbxoldpK6sz5Y6OoEk0cMioY4ibTdHNkFKFL1JRB219zzTtbKopwZ9xMpr1DvcBBNH1EjkpmBX/CsNoHZEPtJEot3GNwfderXI+Fpv5SJjFmXPuVwQ9pmLQ67AFYSImj/aRVrK17T3XLhqgZTXRkPJTitM2F33tn4pqdkBPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ixm/3PGHpM+2T8JfnMsnOGYOFBJxJnwguIemqmMbpxI=;
 b=Fy7lKh/2dkRvlnXRLZvIikry5NzMnbK4zFqJwZ1YAVXXWzcUNlihtOyOoBG5nSf1cigNT/qU14389geoUecZ1v3A1VFt+LiEdCEveJuVSx08ObI7x4QBB3rT8WXy8EahgHHHqHcb7ZD2PUU41cAMy/psF/9jh7nXIkEPar3jra3vdDOysHid7Lzzavi3X5gN17pAEXJ7CE1qjPKK+wbiJkeCqs+SW8KSWpkprEw1Bnamv8/DZm/Zp58/Ep74qa7HcYhGGu0ra0jF7Yo86/UaT1yYrKs3QJkoglfNE/XPmqta34w/clTA1ChuZxefZ+zkmNvM/wbT6Wk9DpEoZ1LXHA==
Authentication-Results: lst.de; dkim=none (message not signed)
 header.d=none;lst.de; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL0PR12MB5523.namprd12.prod.outlook.com (2603:10b6:208:1ce::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.26; Fri, 23 Jul
 2021 13:30:10 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482%4]) with mapi id 15.20.4352.029; Fri, 23 Jul 2021
 13:30:10 +0000
Date: Fri, 23 Jul 2021 10:30:08 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH v2 09/14] vfio/pci: Change vfio_pci_try_bus_reset() to
 use the dev_set
Message-ID: <20210723133008.GV1117491@nvidia.com>
References: <0-v2-b6a5582525c9+ff96-vfio_reflck_jgg@nvidia.com>
 <9-v2-b6a5582525c9+ff96-vfio_reflck_jgg@nvidia.com>
 <20210723080543.GD2795@lst.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210723080543.GD2795@lst.de>
X-ClientProxiedBy: BL1PR13CA0329.namprd13.prod.outlook.com
 (2603:10b6:208:2c1::34) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (142.162.113.129) by
 BL1PR13CA0329.namprd13.prod.outlook.com (2603:10b6:208:2c1::34) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.7 via Frontend
 Transport; Fri, 23 Jul 2021 13:30:09 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1m6vFg-0070KD-3p; Fri, 23 Jul 2021 10:30:08 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 96f76225-97b5-4fc8-db5d-08d94dddfe19
X-MS-TrafficTypeDiagnostic: BL0PR12MB5523:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB5523380775658FF19292E301C2E59@BL0PR12MB5523.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sWvfK6eSD52ZtfoNNj2xCCq9lHrINi3vxEX19fgJvV59e+lU1bOe7GFwrkw5mdYaTx5HGP14yAL0DIFXcI4g8EIl5NSjpCj2dNrUPfH4QXr5zht4cd/8LbVPnoI/P3uQK1oF5p6jiqAyEtImL+ai/KjW8oVIl5uTIn7IvaPeypu4fOJgFtJ13Hj2jSiNTxB56DIB/BZEHhbxYbjqRhyk95dIV1lHOG0MhbKEPAcxCSFZCsW8wEo/GDJgq5TZQy8s8xISVZ62k0F5wN1u8EtMs04aG/PGofaBmvoDQF2nKbhOPkYG5cyf53Y1o9uBn4kxrm+FAE6oFLpWDWVuhYNBwUVoyHHChpvJ/3v8N6dQAJ4qljTSvwidrKpfGyzMuG+jadiXm9hCGRLQVFQiF7V1nhj/+c6XMAeCAJKlrsSeg9D2pQL3ScQkv9Q3cGN0q/rC3fVWRwjp6jz0OyeEDnMjuQT1p4qbShIE3e3CpBI5ciS9kJQVgjOZop0wih1DobLapDVbhzToPMyIiUBnXUw7Bicpvb1LO+s6Bh47yCzgq+SC/IO+oaHPOvc4jxgAf2Npe5JcCSA7kqSOBwIzVpN5GYYOPB1LrAXuFix+Q6oD2UEPABjNq6L/cPj2oAMTMetfYHqV08ge81vXOekL/uICeg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(39860400002)(366004)(136003)(396003)(8936002)(6916009)(9786002)(9746002)(4326008)(426003)(2616005)(316002)(54906003)(5660300002)(186003)(33656002)(7406005)(1076003)(7416002)(66556008)(66476007)(66946007)(26005)(8676002)(478600001)(83380400001)(36756003)(86362001)(38100700002)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OBtWxs68TVjjMrt+DBsPyFtqSuBO1yvIaAG5HZ8VWLD98I7LEzWvZRqVcPT7?=
 =?us-ascii?Q?Mo7s8py67aMY6qVW9gpu7PERhEtbUdFB7yV/hpkFcN8lRZ3lHfgRLJb0h7Wq?=
 =?us-ascii?Q?6onhiC++6pj59alLyCpMk/zVrMT/xZYj/rn8F8CjSBvuTkc7rgqqfGZoViRF?=
 =?us-ascii?Q?g8+xsKHBPsPPJqeEYuH/r9yaoN7WKHCr5i8K+UqCW1+Quruvt49vThpkNm0t?=
 =?us-ascii?Q?iaPtu3Yo4YAhlSTTsGXrQ12rEyoRXE7thNSRm9uBKOMPG9wE/NU0zASm0KP0?=
 =?us-ascii?Q?1lshSZibhkXtRFPspvs9I8m/z+pNPSVx4YtlSO/cY515kzjsdT3aMBqWq6nM?=
 =?us-ascii?Q?ZVHhnOt4NzNj3cULpifjvYKD361yLXvOeKuq2I8SKIzrUXR+iNmhIUij9Tji?=
 =?us-ascii?Q?TwHhMWIiI6AvH6XqdLCcKezAgqIZinJsJ461n36ZWdEywmn/sSy/KMHvpa7+?=
 =?us-ascii?Q?kUJNJehkCZ/xPgtXg5Pyafc4ADDtSDfOI6ws9K9gx4MJ15lRQX0YaQlgIjrU?=
 =?us-ascii?Q?SsS8tuc5Yr0Et6JFsiAT+YAe5kQ9VSl9fGQ1JcPosXuzZz5VYvH46nlO41Gy?=
 =?us-ascii?Q?FLwYqB1AgdoOe5jwmeYkril9C45wYXuoMMVmX4eHvWbhQYFUwZHShg7yBua3?=
 =?us-ascii?Q?Et8zQSzviHDRGvwhu6upvS+02uZF2or1+/JUMMb6WoZhEcEe2EmDton2PyrQ?=
 =?us-ascii?Q?EepUwP7U2mn76imD3Ry0eZflR97JTyHsb2q/jSG+cx9aOaSI7hqrBVmPC2jx?=
 =?us-ascii?Q?kmkZlwWl+L8FcnzEWLuh5Qt6gy4SkgcQhf1dqVyCPljKlXa0ELOczCoM+hz5?=
 =?us-ascii?Q?GHUaDp2/tXgybYDuYx6tfykAxkEICHTwUSNJZGTsmsd/q4J1lFGJ5qBtAmet?=
 =?us-ascii?Q?rUtlDpc8zX7nzmdtxSE8L/wS2Z8QeDxnW4FGZUJzxb393dRe+D8qNsRZTatK?=
 =?us-ascii?Q?N3WISlIFJSn/8ptutGdHLv10yTn18EoMiSc8mO4N46rpYcL+qJUbVaLBHINp?=
 =?us-ascii?Q?805weWuw7AUsx/8benfxcbFFaLbkE7x7ryWA4kTK1EL3oJ0uiNhcGGrBbi0i?=
 =?us-ascii?Q?1uiBG1hLfmcHll+NiQa64utU9xEkUlHm/EB2mJHummTZGPiJAH1lFoqQILxB?=
 =?us-ascii?Q?cnmyM4558omUlTfOsWhG7TbNIaT2IBUi1BoA6ZPo7Sj2pPTGSVsR3zLu6A9A?=
 =?us-ascii?Q?WicNOJ1uT4+671xx2Qc75nQBYtMePiL8Pkq26jdtrWCRv1Si6PbnNUD3u8tj?=
 =?us-ascii?Q?fvFKgMPz3tFiBrdZiDi5dQCnXZKEdK7tOXLHk9UYCLDgzR++Vok3vdl5OIeN?=
 =?us-ascii?Q?MMghmC73B7zx6YoewZulo8oQ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96f76225-97b5-4fc8-db5d-08d94dddfe19
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2021 13:30:09.9856 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BAAEpD5AQ4dAqSjzcRtExVDfk0gnQNhM4E0WO6U276kvv5AaoK+o9Cdpcw5CGAaH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB5523
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
 Kirti Wankhede <kwankhede@nvidia.com>, Max Gurtovoy <mgurtovoy@nvidia.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>, Leon Romanovsky <leonro@nvidia.com>,
 linux-s390@vger.kernel.org, Matthew Rosato <mjrosato@linux.ibm.com>,
 Jonathan Corbet <corbet@lwn.net>, Halil Pasic <pasic@linux.ibm.com>,
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

On Fri, Jul 23, 2021 at 10:05:43AM +0200, Christoph Hellwig wrote:
> On Tue, Jul 20, 2021 at 02:42:55PM -0300, Jason Gunthorpe wrote:
> > Keep track of all the vfio_devices that have been added to the device set
> > and use this list in vfio_pci_try_bus_reset() instead of trying to work
> > backwards from the pci_device.
> > 
> > The dev_set->lock directly prevents devices from joining/leaving the set,
> > which further implies the pci_device cannot change drivers or that the
> > vfio_device be freed, eliminating the need for get/put's.
> > 
> > Completeness of the device set can be directly measured by checking if
> > every PCI device in the reset group is also in the device set - which
> > proves that VFIO drivers are attached to everything.
> > 
> > This restructuring corrects a call to pci_dev_driver() without holding the
> > device_lock() and removes a hard wiring to &vfio_pci_driver.
> > 
> > Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> 
> I think the addition of the list to the dev_set should be a different
> patch.  Or maybe even go into the one adding the dev_set concept.

OK

> > +static int vfio_pci_check_all_devices_bound(struct pci_dev *pdev, void *data)
> >  {
> > +	struct vfio_device_set *dev_set = data;
> > +	struct vfio_device *cur;
> >  
> > +	lockdep_assert_held(&dev_set->lock);
> >  
> > +	list_for_each_entry(cur, &dev_set->device_list, dev_set_list)
> > +		if (cur->dev == &pdev->dev)
> > +			return 0;
> > +	return -EBUSY;
> 
> I don't understand this logic.  If there is any device in the set that
> does now have the same struct device we're in trouble?  Please clearly
> document what this is trying to do.  If the bound in the name makes sense
> you probably want to check the driver instead.

The PCI reset this code is tring to do effects a set of PCI devices,
due to how the HW works.

Along with the vfio_pci_for_each_slot_or_bus() this is computing a set
wise 'is superset' between the list of pci_dev's the reset will affect
(the reset group) and the list of vfio_devices that we have locking
control over to sequence the reset (the dev_set).

If every PCI device we will reset is under the dev_set then we
directly know it is safe to trigger the reset. If any PCI device is
not in this dev_set then we cannot use the reset as we can't know what
will happen to the device that we don't control.

Let's use a different word than bound? vfio_pci_check_device_in_set()?

> >  static void vfio_pci_try_bus_reset(struct vfio_pci_device *vdev)
> >  {
> > +	/* All VFIO devices have a closed FD */
> > +	list_for_each_entry(cur, &dev_set->device_list, vdev.dev_set_list)
> > +		if (cur->vdev.open_count)
> > +			return;
> > +
> > +	/* All devices in the group to be reset need VFIO devices */
> > +	if (vfio_pci_for_each_slot_or_bus(
> > +		    vdev->pdev, vfio_pci_check_all_devices_bound, dev_set,
> > +		    !pci_probe_reset_slot(vdev->pdev->slot)))
> > +		return;
> >  
> >  	/* Does at least one need a reset? */
> 
> These checks look a little strange, and the comments don't make much
> sense.  What about an incremental patch like this?

Sure, it can go in a function

> diff --git a/drivers/vfio/pci/vfio_pci.c b/drivers/vfio/pci/vfio_pci.c
> index fbc20f6d2dd412..d8375a5e77e07c 100644
> +++ b/drivers/vfio/pci/vfio_pci.c
> @@ -2188,10 +2188,34 @@ static int vfio_pci_try_zap_and_vma_lock_cb(struct pci_dev *pdev, void *data)
>  	return 0;
>  }
>  
> +static struct pci_dev *vfio_pci_reset_target(struct vfio_pci_device *vdev)
> +{
> +	struct vfio_device_set *dev_set = vdev->vdev.dev_set;
> +	struct vfio_pci_device *cur;
> +
> +	/* none of the device is allowed to be currently open: */
> +	list_for_each_entry(cur, &dev_set->device_list, vdev.dev_set_list)
> +		if (cur->vdev.open_count)
> +			return NULL;
> +
> +	/* all devices in the group to be reset need to be VFIO devices: */

It is not "need to be VFIO devices" it is "need to be in our
dev_set". Have the PCI dev bound to, say, a mdev VFIO device isn't
good enough.

Thanks,
Jason
