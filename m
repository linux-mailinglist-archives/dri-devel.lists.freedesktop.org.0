Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5BE63D3BE2
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jul 2021 16:38:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1AE46E083;
	Fri, 23 Jul 2021 14:38:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2085.outbound.protection.outlook.com [40.107.236.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BE1B6E083;
 Fri, 23 Jul 2021 14:38:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ks/MwgjWPlG/oBjExD9jq1GPAPfmtC1JJgj6w5oRT/WtJp5Hs9SYYX8bGKbtlR2IF6zjjblVkiusp1fqc7O8Y5fT0jIeXg5a9hp/MYmkf4D9BFEtd6Z00+jVzV0AsGAylNIZr1iPOfAGVJQw+5rXYYxFBQ8ZrVzlqwQmOzb06XB1XNm/RgNTW+WQfWnQmNFYB3v7E4CJZpA5N+mjhwrJ7xF5r5MrPIYsDMyZUcc1bVLtojQfrtTVuluLostV873xQ6qlKOgOlTnbKEvq8EU6ngbUhGVVy/fDNcnrH9zsqJ8Cu2e7Rgta4XwK+KJrWeHD+Dh2qQssGRmlf19nDcLAOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IMUOF5y0l/BAN/lslmWX4zK20mhdCrNLrk5pBsBtkTw=;
 b=VxDeNCO7fdzSlgGuiJxULPMym1Te9tA9qH1vI3cU4aEZNloXbSOYda/HMzqp0nFAP0OOSBXCgej8/C4A9pS2q6hJ0E4GyitSjPNKMBfUqRryNI2imeyR/qObSnKtjwCfRkv57C4OZlEy1gpvWMOgjgfEZ3RQkOBWaaYnbJa5iZI5ARhJaz+a13GuGTo5wXt3HEZ+Xd5MxPcXHVSjNPO2Wn1eHIIrvYtO19gzcpbu82znfxvMQ5d8UxVhTv8ZymnjTdNSAXKU8ZWizq/PopcKjZz97PkVaLN82RFAmRDtZqkbSzTYpakyhvY2nh98b3o05ZpkgYae7IwBKQo7c6S81w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IMUOF5y0l/BAN/lslmWX4zK20mhdCrNLrk5pBsBtkTw=;
 b=C5eYSLE7s2LpoEbxMlEuk0fg3LpTAqydZjxZmP0mle7BL21ugvH+ye/sq73+oVP3x/wTD6HA9UXXr2tkRPM+fshz7UIhkWWHXf1Pk8U4iwRSAZ9X/NipvaJIWwWm1TprxV+hOsACgZQlTN66tX65zEFF4p+5Ni27kgFg/fcEG0vTuy7jRTWfaFc3Qlw1fT7KOUK3V+XZ86RnBLtTxR7vv0rkc74u/Z50lcpT14l5wx5qi/Q8Uk0OHyV0CHcG3gNjzxT3GEiRo9Q+GIe4Jdlji4R4kMHxsN50wtm+bRCgcAJWnyKfCA/U/0zsV4x5ljdOmnbVqjy/rDi3U5ApQehqcA==
Authentication-Results: lst.de; dkim=none (message not signed)
 header.d=none;lst.de; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5240.namprd12.prod.outlook.com (2603:10b6:208:319::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.28; Fri, 23 Jul
 2021 14:38:13 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482%4]) with mapi id 15.20.4352.029; Fri, 23 Jul 2021
 14:38:12 +0000
Date: Fri, 23 Jul 2021 11:38:11 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH v2 04/14] vfio: Provide better generic support for
 open/release vfio_device_ops
Message-ID: <20210723143811.GA1672295@nvidia.com>
References: <0-v2-b6a5582525c9+ff96-vfio_reflck_jgg@nvidia.com>
 <4-v2-b6a5582525c9+ff96-vfio_reflck_jgg@nvidia.com>
 <20210723073914.GC864@lst.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210723073914.GC864@lst.de>
X-ClientProxiedBy: BL0PR02CA0077.namprd02.prod.outlook.com
 (2603:10b6:208:51::18) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (142.162.113.129) by
 BL0PR02CA0077.namprd02.prod.outlook.com (2603:10b6:208:51::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.24 via Frontend Transport; Fri, 23 Jul 2021 14:38:12 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1m6wJX-007Atx-Ab; Fri, 23 Jul 2021 11:38:11 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: be181b7b-9ca3-4536-17b4-08d94de77fb3
X-MS-TrafficTypeDiagnostic: BL1PR12MB5240:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB52405EF79365EA502BD6157AC2E59@BL1PR12MB5240.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1tz/Evf4o6rfquhlWxk0GWdeyCdDV6wQNsRgriqYqv+YWa6uEUCIAHqG+iIoIntbYftCpor4hj3DhVuN0oI1ufLKfNoIEmJqqJF327obHwai4mInRsk0VbXgduXNTpQyIlwWrHK4Gg29WrkxlTqw1mbjsg/KsUQlatdoEaJAXgmESHg12RP/BTGgw6YOO/NTi7cv8yc0y3OYTbEPX+bJ1izKKoYsKnKTLXt/VCZ43cX3D0WA5XnhejS/EE7JvOwQZ0L61abpQ72wEM/6cg5sMLAsBrOnVDkiOSfEzkurQYOehy/Mt1bSInsaDJ4ewx+cq9ZOw7UOnHIE/AGXPK8vbI5ftg2Pt3kyxrb7z0d3OtnCI6Vqpb2LiDX3JQNBz6tZnR0oTWLvFAopMQTrPd8bwNhpQWXrxQ9J5DVY4Vxjn6opp3esOUssAqVkn2CoMLDbwnBaqLO7k/Ug0I4E5PPZSLELzZLBzX62PZ0w7eST58hQ4kJ+yT2BMSOYFeoZ3qBziHbVWpmlb7uO5hdKvs6EkJGU1zdysGcl9h1tTbswmEs8cUW/X8ZKZNF2rEviVf6N5cuRRjZyE01M8R82G6+pQ5+I8fHqY6Esll4BNKQbvf8j/Rj72sNPleV97KrXG0IqnxzyMtES9bvgZx0LZfrNTFckam54Nqz2T7OAL//x/NdmyznBx35tY+vP8niWixvm
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(366004)(346002)(396003)(376002)(36756003)(2906002)(2616005)(186003)(7406005)(6916009)(54906003)(86362001)(7416002)(33656002)(66946007)(8936002)(26005)(8676002)(5660300002)(1076003)(83380400001)(4326008)(9786002)(66556008)(316002)(478600001)(426003)(66476007)(38100700002)(9746002)(41533002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?A7Trh6+xMMDI7FmkhpoKMEOds/JCp6Q6/bTKKahLij7k0FyNPcWDuQoaRkTs?=
 =?us-ascii?Q?jLYqXjZAwzO0QlhwmqmCQbmb6x4KIIo+vXWvPwnxC+bpBEjJm+j+Kaf33S89?=
 =?us-ascii?Q?FY0M7iSmVNKJCvjETUs1oXbfa6yXBlEPcvhkdAUwC7OFf/oo/edZGDJ1HWDk?=
 =?us-ascii?Q?wtxTQxftGO0ubmLPULk1KcacK53lZA3IyyUaEEg+vT8HQzjgGzgHWb9V9D0B?=
 =?us-ascii?Q?fxml/YpPsW/HDGINR4Jx6KJCyd+FArbp2ic5wcrZdsSpVj5CBZNtK87dbm90?=
 =?us-ascii?Q?BoA3dVFtXqgQrL+vJyIs219Bjc1I8WKwgiTLSDZvvw3M9Rl0tFPsijucnfVn?=
 =?us-ascii?Q?uVuoH2g6FcFe5Lcu1wV8tiOo4NvVb6K9UASNBJO1d0+fPz9MC4L0Cy2+HimX?=
 =?us-ascii?Q?jxmX/3iQgcFi+qhIXvzyEeqBG8mSXxFG0R1AY/FKogEoxEYZM26wa+O3bByy?=
 =?us-ascii?Q?M5bzH45iNAoBTWPla4t84w+w6NeApHzaU06quapQufZToHWcRL2Nv+efz1EW?=
 =?us-ascii?Q?PFyhfX3CUhQgov9FFuW8oy1kto9jKmTEhFy43th5iLMJllCC1Ygz3uRlNv5r?=
 =?us-ascii?Q?y3SGSH8ByymUmukm5IGUiY1rZZK/Y5D7W+rudeqNXZ41ENKlxqZrXFhu8i8P?=
 =?us-ascii?Q?6ii2/YsReH9rqh/RpcgEw5XCJo66upTuyDe7yL89HmnBVReUQ1ZupKa/23s/?=
 =?us-ascii?Q?dz2by1ZyzCPrZJgD+NjQ31bv7QI5CNAsAqSbSK9EuZ88vCOYE3hp4mUbWaEd?=
 =?us-ascii?Q?oMFpHf1XRRNSv8Rjl/Mc1aILXwfxT+ZSOZBrmuAH0wg6u5QscMfLU1ESDMiJ?=
 =?us-ascii?Q?v3+IhWB8wEpVSWXu2k3XI/K9/Y2fqsQrnXNchl8um2rGfr3ip8UTEw+tkjI1?=
 =?us-ascii?Q?72hHHan36dxSqpoVF9zr6mhlc/hHA0EBKFejWWR3wk9LTsmZVWPet0tO95R9?=
 =?us-ascii?Q?01JsiHrPVSZK2xOe2+z4p6qfDPq8TXuzHlvdevZBTTvj91N3cSPBa2RYJ9AX?=
 =?us-ascii?Q?IiClOxX3DhjQ6XxGqVr0S6s70y4DxmL5Awhrerf15BVaUyC7xHsUiiFD6XPl?=
 =?us-ascii?Q?qM1qtFrz8ROgxwf9CNW/awF4sZLrGHeAOnSFubsKFjCxweElDao+Nflbdaze?=
 =?us-ascii?Q?52yvS5Tg2m7kyJ+1sgR7G64nKPCw/H2Kk8B9jyHvvuyHoRWHJgaTSaku3iH6?=
 =?us-ascii?Q?iVdhXddCphTFZ3LF42aeZcxvEHjHXTL721KU3M1QgMXkIVEvWhkD6R2PIG27?=
 =?us-ascii?Q?VscLKNpbeZ84paA/mP7p/56wNgYuP9rPAFvco3fneBhmNB9Ujcrfi9vdyMh9?=
 =?us-ascii?Q?Xul8Hg6SSlyiWEMceU1lweos?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be181b7b-9ca3-4536-17b4-08d94de77fb3
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2021 14:38:12.8826 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NcrPMzXg+dYA6i1u3uYaV4t4RuSm8DEXCvAGucuFGGk5ZJHcz7JJKLQbEK0KuJ0Y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5240
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

On Fri, Jul 23, 2021 at 09:39:14AM +0200, Christoph Hellwig wrote:

> This looks unessecarily complicated.  We can just try to load first
> and then store it under the same lock, e.g.:

Yes indeed, I went with this:

int vfio_assign_device_set(struct vfio_device *device, void *set_id)
{
	unsigned long idx = (unsigned long)set_id;
	struct vfio_device_set *new_dev_set;
	struct vfio_device_set *dev_set;

	if (WARN_ON(!set_id))
		return -EINVAL;

	/*
	 * Atomically acquire a singleton object in the xarray for this set_id
	 */
	xa_lock(&vfio_device_set_xa);
	dev_set = xa_load(&vfio_device_set_xa, idx);
	if (dev_set)
		goto found_get_ref;
	xa_unlock(&vfio_device_set_xa);

	new_dev_set = kzalloc(sizeof(*new_dev_set), GFP_KERNEL);
	if (!new_dev_set)
		return -ENOMEM;
	mutex_init(&new_dev_set->lock);
	new_dev_set->set_id = set_id;

	xa_lock(&vfio_device_set_xa);
	dev_set = __xa_cmpxchg(&vfio_device_set_xa, idx, NULL, new_dev_set,
			       GFP_KERNEL);
	if (!dev_set) {
		dev_set = new_dev_set;
		goto found_get_ref;
	}

	kfree(new_dev_set);
	if (xa_is_err(dev_set)) {
		xa_unlock(&vfio_device_set_xa);
		return xa_err(dev_set);
	}

found_get_ref:
	dev_set->device_count++;
	xa_unlock(&vfio_device_set_xa);
	device->dev_set = dev_set;
	return 0;
}

I'm also half inclined to delete the xa_load() since I think the
common case here is to need the allocate...

> 	xa_lock(&vfio_device_set_xa);
> 	set = xa_load(&vfio_device_set_xa, idx);
> 	if (set) {
> 		kfree(new);
> 		goto found;
> 	}
> 	err = xa_err(__xa_store(&vfio_device_set_xa, idx, new, GFP_KERNEL));

AIUI this is subtly racy:


  CPU1                               CPU2
xa_lock()
 xa_load() == NULL
 xa_store()
   __xas_nomem()
     xa_unlock()
                                 xa_lock()
                                  xa_load() == NULL
                                  xa_store()
                                   __xas_nomem()
                                    xa_unlock()
                                     kmem_cache_alloc()
      kmem_cache_alloc()
     xa_lock()
   [idx] = new1
xa_unlock()
                                    xa_lock()
                                   [idx] = new2    // Woops, lost new1!
                                 xa_unlock()

The hidden xa unlock is really tricky.

The __xa_cmpxchg is safe against this.

Jason
