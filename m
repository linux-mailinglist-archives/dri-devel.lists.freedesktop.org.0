Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 016573CD55B
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jul 2021 15:01:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC2D689BF5;
	Mon, 19 Jul 2021 13:01:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10hn2236.outbound.protection.outlook.com [52.100.157.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A92189A88;
 Mon, 19 Jul 2021 13:01:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fVI7BM/c4HCUfRh4cIHiqOjK3+SFLV6EhPtW9c7pRVL+f9NKA9U68oQ8e/SCOwYNaN9b1/T/7V/iOeAMORgIYXlN5t8ANNY6aLJgpWbt5lfO+1oZFVNBH+1Ba6XSyKBYB5GWeRQxTTOD/Gfjk4zx4ll/gpoNTPtytlhsmW1YaJPTNoZd0WsbyfyNbFj9tiAqwtDar0j1BBXKQxvvjBhHZdptDaUAwesVcaQS7THPhAkNoSJ4yBDHk7kPiTI6dmSbOlYsg/3KU3zpKHXZyeBqiy4imPNkf95NJOC9mldQyDBTOXKmGvPLm6u8/63+sdIG3iXMeUVQnjBsFA6YmZM/LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LklVu4oYDEr0pY/4vez7iS1ynH+MZLUhu24FYyL80yA=;
 b=D5b68j5wGAktcv8H7RGTJ2agBWhN9azL6cjbXksz1VYLg7uWUFGoIWAmUlCETD3PyfUXo5BXwkd+XLLWBk6mKXWXg45O/x97Vikl1nQIhlZ8RK3CBlRrq2lRN0M8XIq3lAAxyK/80rMKQFk6NAMqHv1UlumcQSF1YaGr1ax6X0D8JgBu9zSmvxl+lm4JExF8E/g1kqH2/JailNeSbnfIICxdjkkXPswcZMLI0RSj9WOTWpCmBeGKjemWCMkUPp6ui9EGSML/2GukFxmYShX0woWLExTwwmejg78UGVE/szMeOuldo+x92wrDhklVUJ7cb0OiRU9oRCwmQQY2ePGGPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LklVu4oYDEr0pY/4vez7iS1ynH+MZLUhu24FYyL80yA=;
 b=aK7Ky1e/8kGpojSdpT/ZuPD943cvImZuBUbYVKQ2vLQaZaW+3FLL/Ex1UQKHany7HZ3fnThdlnXZn5eV1SdFAEFHeTjG+CJFE1rUXqlf2wFzr+z87TZ0oUlrH8IxuzdOlAYYa8MU3GxCUszjQWRU9M+QUvkRzIg8VzDBRtWb9sZDbLwLTsbv3uSFXpWhY2AnGCNYBFDNdO8cYtvoWqHCTZR6F1BqFEEsyetrgc/O8L4JRGYvWvTUPWsWBI0yZI5r0DAov9M3nx368ng41AQGu9aa6gUobK1kqxhvIKOUTeFV4JeOLPTCFBO4TgxkUYn8NKHqf40ME9Sklo7x/6kYfw==
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5304.namprd12.prod.outlook.com (2603:10b6:208:314::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.31; Mon, 19 Jul
 2021 13:01:33 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482%5]) with mapi id 15.20.4331.033; Mon, 19 Jul 2021
 13:01:33 +0000
Date: Mon, 19 Jul 2021 10:01:31 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH 03/13] vfio: Provide better generic support for
 open/release vfio_device_ops
Message-ID: <20210719130131.GQ543781@nvidia.com>
References: <3-v1-eaf3ccbba33c+1add0-vfio_reflck_jgg@nvidia.com>
 <87wnpma299.fsf@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87wnpma299.fsf@redhat.com>
X-ClientProxiedBy: MN2PR06CA0027.namprd06.prod.outlook.com
 (2603:10b6:208:23d::32) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (142.162.113.129) by
 MN2PR06CA0027.namprd06.prod.outlook.com (2603:10b6:208:23d::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend
 Transport; Mon, 19 Jul 2021 13:01:33 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1m5Stn-004QAT-Te; Mon, 19 Jul 2021 10:01:31 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ddec79e2-62af-401e-66bb-08d94ab55574
X-MS-TrafficTypeDiagnostic: BL1PR12MB5304:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB53040EA018057BD68941EA8DC2E19@BL1PR12MB5304.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Esqu1HQ/v2Ir1ltm3aEcOkcmyZkLUHZSax3ATg4xJE8NPbiADFQbGR0zHTGf?=
 =?us-ascii?Q?y37CdKt0dFVpPbzRdTln4L2rlKCq3x916+ScJyTqwb+TikZqbRUSr8hhVgbk?=
 =?us-ascii?Q?fJCNUCafeHRNa863bzI/IBQYmZvha8kQ2z9LQSmdgGcYzJ2QuPnvrw92W+oX?=
 =?us-ascii?Q?xoC0IQ5qsLT6PJolMJpioz6E5LfBi4svNSrZam26DBY1yRWMkHEsqNfusZ5K?=
 =?us-ascii?Q?Zs09eqqCH65eua9OjLCAR6ochdCk5Im3Ls+9YJEHCTFwAT2ase63g8NrzrUI?=
 =?us-ascii?Q?kfKWAmfefRUo1fT9vF45CK3LpOu7oyqMZ/Aivc8Bc5wstTgDvaUvwM5wuGrP?=
 =?us-ascii?Q?cVmTdOSvO/V1U89OBJmXlxLpGePSV43Fib6vkeuWuK7Aphumor3sztJIAtLK?=
 =?us-ascii?Q?A4PiGQfKryYvoOwNJA8jBJbLEStC+WgAPjG/CdKAlfVLTC5MngknXcaoWq2m?=
 =?us-ascii?Q?c+mRXIvT/eZKJwst81zOOIlTnGBmbS2w8V60uAHLFWNYOd//wgASSb8zctaZ?=
 =?us-ascii?Q?tTBmdR0VCx8eDVtqge2+a5PpBiI0I2UiPmWvaEO8pz60uMkTahQrFD4QmrIf?=
 =?us-ascii?Q?7Tkb+0IOg8g6AV9rHAbzBm/FhawsgB/RE697oxYvSQ/yA23j8ng9/+AGQEFR?=
 =?us-ascii?Q?FaZxwAwo9cMkJLtDWMU9KscP6b1kxb+LS0UoXaXHEzH0ETxFe1kuMa2Qs+pZ?=
 =?us-ascii?Q?21FI7wXRuBRj3pDDVTbW+MaZF3U/ctbA9A1q2PLFWTFpbfol0H6fPLFFjVUd?=
 =?us-ascii?Q?xHdqwn3faiypB3YgDOB8bJklTF8TTFpPQwiha4zXutI+XMzZ8hYWYsDsweoN?=
 =?us-ascii?Q?aQARE1huIJlGlMvaEkrHY3h128BHP2ea0Pl3uUjduDj5JDvayihjI701u2W9?=
 =?us-ascii?Q?nEuENADG746zsMMdNmdirEOdQLtpQgvkKpLal/lrkFgky3wnimevl54IDBcz?=
 =?us-ascii?Q?WDY6B5v0xS9pKoc5EdmsgJ1u0UqpLnjEq32AsOw3kNxIG9cAtRyQeifpSCdY?=
 =?us-ascii?Q?8PwsjrrmJPnSXUAyOMEH2VPpS21Xp0+BTKc3ZTDfTvdv1lI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:5; SRV:;
 IPV:NLI; SFV:SPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:OSPM;
 SFS:(4636009)(376002)(39860400002)(136003)(396003)(366004)(346002)(83380400001)(4744005)(426003)(1076003)(2616005)(316002)(9746002)(9786002)(86362001)(2906002)(36756003)(66476007)(66556008)(8936002)(8676002)(54906003)(66946007)(6916009)(4326008)(5660300002)(38100700002)(33656002)(7406005)(186003)(7416002)(26005)(478600001)(107886003)(27376004)(41533002);
 DIR:OUT; SFP:1501; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LBGOoZ3j9eYZ7AQi+svk+xPSgtqIHM77IG66AhmB0BzZT3P3RikyC4qmdUcU?=
 =?us-ascii?Q?uavKJE0CJKCYZRaojy7FR63M6jayg2mmpib674Y8j8zKjSlPy/697MzTSDir?=
 =?us-ascii?Q?G4hNWWQQOwMtTRwnNIKQdbscfuLTRUwkhZdmNnWOX/om1oZDpPruz3MjIZZC?=
 =?us-ascii?Q?t1XUcr1pUVzmP/AD/SUV4uewvYRglQJ64XnSQl8pA3GKW1zjPJnoN2VVTqwE?=
 =?us-ascii?Q?QE/bHA90cPvGMTDgJw9H2VfmrAUe7hHbNLZYY6bpV7Oihal5PPdvudXzVwZT?=
 =?us-ascii?Q?+8h7aHrNYdcl9aSuxnZPyrepVQ0YwRjYp7BBQqd/v5KYMBj4lB/wmNXYWqh4?=
 =?us-ascii?Q?pdcfmlGalLErFYrLqUYf5mdYQlw4UXrkDrBeIf0+bVfsjQ6Ptz6YLqQYC5iB?=
 =?us-ascii?Q?UFWq3x9w0vc4C3/bjUDFcK/o7JOZZDAY+8PhK3zf1Uyj2S4uL7mAypu5VblU?=
 =?us-ascii?Q?e8X/pqwHEg4lin3j4OxhGGDlIIrppsQWlgq9/MbgnfAjcnV6WhlUMoVH7l9Y?=
 =?us-ascii?Q?j5KZ36Jn6dYB4guRF3LYT/+X1zADABWq9255jX3HALV6L86RIWusU5mQB4u4?=
 =?us-ascii?Q?F2S0N2K+eLx9hQSmD456xCHN7M94NvbgXSm6pUJk/9sGUehtdPSJ7qnCVjIW?=
 =?us-ascii?Q?gPEKsT1BzGplZ6k2Q4y0HfA4gyHe4JcEystStiaxUGfV4es2wVkBX0ieIN38?=
 =?us-ascii?Q?Iy41d1us6IrUQay798xUork8NCBc9G3UeaGoLImnNus2uK19p6R9Zsh8b/JV?=
 =?us-ascii?Q?Gtm7v0gqLNIsoPyCxhsp1M0rKor3barwwqQHdwLlaCCUmEwRFvfq7DcXoQLp?=
 =?us-ascii?Q?xnIlGuHItsM5ijE8kf53dAunUd0XeAqNUP+YIwVfBtB0cPTGSIr0LL9wyXOQ?=
 =?us-ascii?Q?zYzJ71u2WFZJU3lrn+XiAg1aiHqR/awD7T4RYEZlLCY0kV9HgF7p+VkzmFlD?=
 =?us-ascii?Q?N7jtLskAICQkdzHkUXGvlFLc+quH9GXR9gV7WsYFxQMNpVIaMh6KOnaF+FxZ?=
 =?us-ascii?Q?9sVPbluuQt4G3nlH3Y5ZKbQQ+hAdiryNjbBSs4u1TsHSqtbIf8c89d5Caue2?=
 =?us-ascii?Q?rJG2OMt8EB0n+nEoebEECJk2THJwUWrtKE7Y+hOGX1ovuCtZo2QGIlWELZJj?=
 =?us-ascii?Q?3N3DBxM+BCzHTvMwfoHMDLncNbkGBppgKDTF4i/b6xHLB7MtPGTo2HRUQ8ui?=
 =?us-ascii?Q?neTdHNv82u9iM5IwyZk/PhHblVSgpIZ0S8/rrXPIbTCPu5ZCCYBQ13tjK06Q?=
 =?us-ascii?Q?xVTzvvWHamA+pIDpthNOUMFFlHX2U6XK9WTMY+hyYCBVFzEUAOJ7/sB6hbHN?=
 =?us-ascii?Q?daJvtl2XSg5GIazrWM3cNl0Y?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ddec79e2-62af-401e-66bb-08d94ab55574
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2021 13:01:33.6627 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1uTsOQpqhqeG/XZY0JeS7hLv2VqnQsodbSzFSsvtB8Mk/iwWgpJ0hnU+KOYbPWyu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5304
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
 Yishai Hadas <yishaih@nvidia.com>, Peter Oberparleiter <oberpar@linux.ibm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 19, 2021 at 02:58:58PM +0200, Cornelia Huck wrote:
> > -	ret = device->ops->open(device);
> > -	if (ret) {
> > -		module_put(device->dev->driver->owner);
> > -		vfio_device_put(device);
> > -		return ret;
> > +	mutex_lock(&device->dev_set->lock);
> > +	device->open_count++;
> > +	if (device->open_count == 1 && device->ops->open_device) {
> > +		ret = device->ops->open_device(device);
> > +		if (ret)
> > +			goto err_undo_count;
> 
> Won't that fail for mdev devices, until the patches later in this series
> have been applied? (i.e. bad for bisect)

What are you seeing? At this point all devices will have a NULL
open_device and skip this logic?

Jason
