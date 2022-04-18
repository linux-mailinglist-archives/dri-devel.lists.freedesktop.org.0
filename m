Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D460505BAD
	for <lists+dri-devel@lfdr.de>; Mon, 18 Apr 2022 17:44:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DD8B10E5C8;
	Mon, 18 Apr 2022 15:44:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2071.outbound.protection.outlook.com [40.107.244.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D3DE10E47F;
 Mon, 18 Apr 2022 15:44:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ECg+j2Lc1L9AGLNK/U8ZDOqjB45I+irljnRtQnzVGDuNW8C/i1KnjtOVeKhbYz8u2WxsErUkBqRtHg8DSloT9SeGHJNjfnp+vvnTrKsD5oJBHkBXjBL8n921ax1djn0IPhIJOrxnsNHNkjoNKvc+a9N4Wd9siRmnxZ6FCBgCRyGImnJrlo4fJbDUoWsYTr8A26Lcd3DLc3K4ZHMybJ5ziArXEzavnvd3zLHFdTq5iZ/qk4aKB0U3NMG4KNsHVqZxdpBJZ5e9xSt3+SjMitLJKzHmrmKiH5wuLh7j5wYNDTwfgduEqCZNtVCYbY+2XrX9IEYaIZGPpm+d74+sCLU/zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7P83yuB0EiDNEn4yinMtzdaxmFyJCdn6TnLSoMrs2ao=;
 b=PX1PEEVvO+9bo4KIeTqStFHUVgOnRtE0tviDuVsUxx5wqDqLQSn0O2FLFl1UvTVRRFKXy1N1L7i4hxGSZ80+zNjrZnazct9evmZQEkPzAUhGXV5bftmoQXD+BjldHvYrI/R1rf/5t4gXYXkRT3in/I6SQCXxF1FXNDc5+AqPqI84tq5kvPznlH/o5kz5OmpJSKJygjfUBhUYEMezSbasCmp8eBxeBzmpzgbrL8kcNPoFUP1VNfADEcYNt2LfhHokrhKAWuk5NO3iY8VX3DwvmRUEqh7xHpXSLt3ZCHS4n+EwgfcPh1HLQYceXYnZWnZW80LyNGnC78+ltYsHd1WFyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7P83yuB0EiDNEn4yinMtzdaxmFyJCdn6TnLSoMrs2ao=;
 b=FKogEcIQDoKaJAM65Dq9u5GWmEWq3rU9kbc3XM9SjxpNstCYLlrThHm20gotI/V2YJ3/9TeQLPFiZCgIzuaQ8/2/g875M3LFeHcX5nWxCyhxX37+jjArZwu7WoOm+sqjHIUjo1ciVFf3UKepmobtk+2q0K0f3LIvmAJZ+hSTPKLzBUdR+e/3NWazLYvNpBQO9nBjtyT5uymN3jorhhy5uQ+0VThrjR6iqplT4DZJVoenZpf66J8K1I/umNXyWpAMnFo6kLh4w++7mZozFaxuyL56uzwnaKIoK7UXu+bwe72CPbG+4bcKIs6LlzWQN3oEsD9TK9uW5LV6jeuVtvSFzw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by DM8PR12MB5496.namprd12.prod.outlook.com (2603:10b6:8:38::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.18; Mon, 18 Apr
 2022 15:44:02 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2%5]) with mapi id 15.20.5164.025; Mon, 18 Apr 2022
 15:44:01 +0000
Date: Mon, 18 Apr 2022 12:44:00 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Tony Krowiak <akrowiak@linux.ibm.com>
Subject: Re: [PATCH 1/9] vfio: Make vfio_(un)register_notifier accept a
 vfio_device
Message-ID: <20220418154400.GR2120790@nvidia.com>
References: <1-v1-a8faf768d202+125dd-vfio_mdev_no_group_jgg@nvidia.com>
 <aa721d27-9622-5d47-2671-a503ba6cf2ef@linux.ibm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aa721d27-9622-5d47-2671-a503ba6cf2ef@linux.ibm.com>
X-ClientProxiedBy: BL0PR02CA0112.namprd02.prod.outlook.com
 (2603:10b6:208:35::17) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 495c27ec-6719-4d57-aaf5-08da2152427f
X-MS-TrafficTypeDiagnostic: DM8PR12MB5496:EE_
X-Microsoft-Antispam-PRVS: <DM8PR12MB54965170D1090AAB2ACBC3A6C2F39@DM8PR12MB5496.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: B4DmX48Z0pkAPHy0u3omIBQ9bqWpUYZh0JAiGlPx2F0I6CXfW37YgfieAV5orDgJuZp0RxZfX503KgbQGztTOVGM5aAl0KQQ2K1gdLD4/ExGkr8KWVUt80dwTIPDzfKi5wsSzuG7FY5iMY9GqZ2K43CAoCJv7vRH3z14/ozHx6hLtfni7vmHG9qT1n/JEKgA0GdvrrNiJ8o6W+u4atwoPU2O5EOhljW5hspU+SR/cWbFe9Ewa3OzJBm4LqeHlXWXKX9LU5EaMcE4itR13YL+PDVjeKO5sr5u2yNJFKc7O6C2LIydv1TE8bK0oczcNcofvjSdnuOLLT4n+DRRJOxaweKCktqqYGAmBXPvbMkfcBEPymDyKbjgCJPUZeHNCMH56SC2APMoO4OBsB2w1Xv5AnIeFKfX3m6s/4CxZdgMjNuhv+IS41Mi/E/mTlztFFA2o4wGZmHMTuDunkCqtNtemZXK4hPj+ZyvHuN1QqY+mOP49UhzM4Q46J5k9eSiTvq9BfLZWNo8VYcQrSqKyEV1cX7Z7YfMZWWqXAE5M7lHx+R4Q+6DuRfHQtDW+otNUBSVd5UvSKjmVsbsHzAOy6KdY94VO2PYVJdYBDLo1dPR2mVrjGWiDUmf77EyRpV9cUNgEFgeOmzQCuhs21Hm2rWkrQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2906002)(6486002)(66476007)(66556008)(1076003)(4326008)(2616005)(8676002)(86362001)(316002)(4744005)(36756003)(508600001)(26005)(186003)(66946007)(5660300002)(7416002)(83380400001)(6506007)(33656002)(38100700002)(54906003)(8936002)(7406005)(6916009)(6512007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ATq2R2CFALlqst/6iO+LVlxlHMXH6/MaUNzb4FaNpeyHt2bSFHYWzNH0ykrC?=
 =?us-ascii?Q?00CsTT56fEdyx9Rd+GGDyjTjR6a3xU+Yz9BZFK2pCwT6tsHiVDQZUfcPRjg4?=
 =?us-ascii?Q?K5zFDiXyykOu+aGfPG5GsZdsAZiWJOJGpwCtjaxU2dPAqpPC0Qao8mpmBQKW?=
 =?us-ascii?Q?QGWdzyI0SRra9nKsYgxFZBzavtvU4YVGV811wOu+sxo+fjXUc7DQDSBCT8A3?=
 =?us-ascii?Q?DTb/Tm9j6BuXG93Fb9MCIXEkgdntSdUiIOR0gFH0MPic3X21mQFbxcMMmY7l?=
 =?us-ascii?Q?mezDNphvQUhWR+1m6SBK4ScNHUhsF0zm0Xs7za42MQ2vO02p/uGJ6PgKwW/3?=
 =?us-ascii?Q?daFbWtZdGWmZI7pvbeTaP1KSiLV8cO/C5l1iRlp2eWc8vyi98yy/Gq6dY0ev?=
 =?us-ascii?Q?YPiwa8EttE9jkki2RkPcGuuHP9EwoI4bwF0kB0O43I0O35g0WxNROlmj6aoM?=
 =?us-ascii?Q?HgveKB6NaaQ+/TMO7UuymYPwotpGPstSlM0GcxBbymSj6ktjbwwEnoco8BwD?=
 =?us-ascii?Q?k27lRHalMXA5XOEksFYDT2f8pAjasM1TPEOHtCo+Amekq9w1aQNklABVH9RE?=
 =?us-ascii?Q?5zD+F/gW1iZuDeT/VxytqJJk4Sa2+bgugq6FUDkRSqgn6XQS4u1eJhmMcEMm?=
 =?us-ascii?Q?kg4+0Vc0jW74ZqGfYwfm+5MnGIPuKwjRtr4x388k8HNYjw9rmbKyfF8G3J0O?=
 =?us-ascii?Q?OFGR3sYoo93k7ORRQnjEA3vlS7lTs0aiDCrOChd+OkyAEGGYtsZqqxqCF4K1?=
 =?us-ascii?Q?KaTWQYZpj38mUvRESVJ3yGZgjKWm80j5gYA9TVDFzGdTgA70SEKjxR+WY+fA?=
 =?us-ascii?Q?HEE8XCu9S7I/mgIPxwiQIKpFROiEIjpO9moUssy43LeSxMGnqPcnBM5yLt9t?=
 =?us-ascii?Q?qW24SIzwL4TSTdVwT58L/gSlGVe7VS8BMKKQ0WGoK/bH6+znMnCibarRJnfI?=
 =?us-ascii?Q?Romr4bLbNViA55jjPl8Bx+SMqjNJYKDKW0ZJNEYZRQTcxu1Nqlm4XfLCZWsi?=
 =?us-ascii?Q?DRbpQ4Qx1UIiVQe6i+vAOHbJvLovGPbJO7rsPc9BM5eNg1rxWOoPUpbBoNRT?=
 =?us-ascii?Q?DrkJUkYg/0TRmlhUg2082Czvw+PkmHRt9d/tLXrYarjIxzre6FTohS4ZnxaU?=
 =?us-ascii?Q?G989IT0yTidnJCd/9HDi2ZYu/vLTaLJo+pegkl3BOmyRkptPfaa8bY8FXsUs?=
 =?us-ascii?Q?pq0Fu0EmMPNJiSkaJqOL9QrOh5jX0L9op0JH8uGNLBEGDrM/UFEz+kLw5yUE?=
 =?us-ascii?Q?k99DFwePj2LiZweGM72UOA981ZAXMvKOMhMAnl7Uf1l6tM6Fca0Qo6Q3kCHV?=
 =?us-ascii?Q?TGeNNL0iSoWcjuxPy9bi1PRfbURHXz7ITEmxtIenhvg80HPKnKYb5wBbKdF3?=
 =?us-ascii?Q?w78NtZ2Z/3Qx9hOVBOgbPw8Q5RFTwIHoI9IJXQej0pYEoqkd7fQX+gbGbDYO?=
 =?us-ascii?Q?McH6sk9bAliKjSGxBMDANL+JLVPWhPY0BT/IArv56+gdke6aasDwkjL2eT5I?=
 =?us-ascii?Q?ByGiMH/glY0c327lzaKn9eEsTL4nulbmuS/A1kp32XQFklsarGqQNn7GlLv3?=
 =?us-ascii?Q?Vx4zp1wE7OM7jzBjSfYGLkEnIRNNfFgHbpfixutmWqMoFHVuGLn9FBDTR3zz?=
 =?us-ascii?Q?AzKT3S2UXDhtSEuxBiTo+BYBrj2EixmgllEKt6pNPT3mIiFfAYECSMQAaxfK?=
 =?us-ascii?Q?cUe3U4U6O1sqphouKG2wCCg21V21geV6Js2pvmEG9e8QndhNkBizObORyzXO?=
 =?us-ascii?Q?JPr+qHRQ2A=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 495c27ec-6719-4d57-aaf5-08da2152427f
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2022 15:44:01.5544 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ECK5ePFl6oAIv3yCrW9z4oOeeSnX3To32J33ovuqlc9Lt/ogViQT7ZtzrAqgf6co
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR12MB5496
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
 David Airlie <airlied@linux.ie>, "Tian, Kevin" <kevin.tian@intel.com>,
 dri-devel@lists.freedesktop.org, Kirti Wankhede <kwankhede@nvidia.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>, Christoph Hellwig <hch@lst.de>,
 linux-s390@vger.kernel.org, "Liu, Yi L" <yi.l.liu@intel.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Jonathan Corbet <corbet@lwn.net>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>,
 Eric Farman <farman@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gvt-dev@lists.freedesktop.org,
 Jason Herne <jjherne@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Cornelia Huck <cohuck@redhat.com>, Peter Oberparleiter <oberpar@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 18, 2022 at 11:28:30AM -0400, Tony Krowiak wrote:
> > diff --git a/drivers/vfio/vfio.c b/drivers/vfio/vfio.c
> > index a4555014bd1e72..8a5c46aa2bef61 100644
> > +++ b/drivers/vfio/vfio.c
> > @@ -2484,19 +2484,15 @@ static int vfio_unregister_group_notifier(struct vfio_group *group,
> >   	return ret;
> >   }
> > -int vfio_register_notifier(struct device *dev, enum vfio_notify_type type,
> > +int vfio_register_notifier(struct vfio_device *dev, enum vfio_notify_type type,
> >   			   unsigned long *events, struct notifier_block *nb)
> >   {
> > -	struct vfio_group *group;
> > +	struct vfio_group *group = dev->group;
> 
> Is there a guarantee that dev != NULL? The original code below checks
> the value of dev, so why is that check eliminated here?

Yes, no kernel driver calls this with null dev. The original code
should have been a WARN_ON as it is just protecting against a buggy
driver. In this case if the driver is buggy we simply generate a
backtrace through a null deref panic.

Jason
