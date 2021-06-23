Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C4E3B10EB
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jun 2021 02:06:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A46616E881;
	Wed, 23 Jun 2021 00:05:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2069.outbound.protection.outlook.com [40.107.93.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 975456E87F;
 Wed, 23 Jun 2021 00:05:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B3/KBdJDauQ7dVt5+j3SNsPYpt1TvZFwcKBAe/soen3qdXoWy/gKEc+plQ7pohVAa5gCm47wBBjYygAqdsZfnxN2AOj1etAaTLVtNs6NMm8ZMrkuTf/7Y6H7aDU0yjuUTf8M/c9RcloWuzKJ+Tw5b+wBaemP9QOzXAWV+NwCzIG70rqsy+5zPBQfj/qLJajjjCEw71/XKNdH45M9k/yx1mXdRgNyEuacgwT04rbD3BTtAMiLG0Gr81Uw5TLVXjIwdmUtWh/sNgIb/qZu6SlbNTy9HU4DhTouIRxs4RRB/OkfJCDcpWf+u6OrLGEPUZ7mJFFYa40nOHtCeyVTX8xTPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=00vjd5eelAB3Z7Vn7EjsipaY4AuovUAUgikKTrMKhzM=;
 b=lXEulpoItrKWYdS/wGXx7cnk4ZQRk7/IPZa/5nSNzSn7NE8130514GFVTO5+8VxU5/GmbWltpSaZabrvjNI9GLr9T9PLkuy/VQ2qUS/sTVCv1qraFglMNj+g99jf2mOsMpjMVAT8tTv5BIt631uU2pRFwVsPgXaEBKrwZak4D7TesDuA2kykh0l5XERVXV7gGIMMGgfFCfcBdze20bxlO40gRZQaeRIZPgHppQo6l/gVzcEuhEFq+npBNw7F6nVUtbZ0UhoDnWOqO9KtyH5wU0tqaP9jYdEegO4Jy7c+6DPcuDIlg5rpQCTdcfxyOcrkKLyzOCctZYbrl+k4mndrfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=00vjd5eelAB3Z7Vn7EjsipaY4AuovUAUgikKTrMKhzM=;
 b=jsNY7CzXfOG07PJuCaZasImaDQMH7rmjvakSFgWf74FikzwL0O4Z/4kTOl51yVpToh2ovtBVBKEhP76CCLM2PPQOgY9/REnC1keEUJRr9isqXr0oxuhwmV2GKH+W3y2gPwL+5hLm2zzBY8c/iMU404D8HvPi2IGrd+uW9f15iWcgAVDWB6KbFBlfXwj7XsIoDRolCbZIG3Sg9UQEGL1S86ofAGbKvvLH9tH5qDqSbaaYMk7SxUEprv20648i1rzZHv7Fafs5tWIcFqiRcr8olmMV8YxTDyzYw+N6iWCwjMY3uOy1Tlm5YfOhEavViog33blxHaIwweMoknNHZI0g0A==
Authentication-Results: lst.de; dkim=none (message not signed)
 header.d=none;lst.de; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5206.namprd12.prod.outlook.com (2603:10b6:208:31c::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18; Wed, 23 Jun
 2021 00:05:51 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::3d51:a3b9:8611:684e]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::3d51:a3b9:8611:684e%8]) with mapi id 15.20.4264.018; Wed, 23 Jun 2021
 00:05:51 +0000
Date: Tue, 22 Jun 2021 21:05:50 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: Allow mdev drivers to directly create the vfio_device (v4)
Message-ID: <20210623000550.GI2371267@nvidia.com>
References: <20210617142218.1877096-1-hch@lst.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210617142218.1877096-1-hch@lst.de>
X-Originating-IP: [47.55.113.94]
X-ClientProxiedBy: BL0PR02CA0048.namprd02.prod.outlook.com
 (2603:10b6:207:3d::25) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (47.55.113.94) by
 BL0PR02CA0048.namprd02.prod.outlook.com (2603:10b6:207:3d::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.21 via Frontend Transport; Wed, 23 Jun 2021 00:05:51 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1lvqOs-00BGsO-Ht; Tue, 22 Jun 2021 21:05:50 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: db3435c1-3125-49fe-86d3-08d935daa988
X-MS-TrafficTypeDiagnostic: BL1PR12MB5206:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB5206A1FB5B9C0F2BD51DB5EBC2089@BL1PR12MB5206.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FMI2kWyz/BN5MjZjGURmfvJglsflb5Bhsj7jW8FZNjXnC0fY8oppCwp3C3+R2Wxn5v1CFgn/9au0Pp2vb+mvhDpkG1FM0rIXZRn9XE5+3XYJqdY52a7/UGR5vOMIcGc+SrbraqxX7Zmzbp48AyIJs8oB2G3rprXVBylUUYOuO8MysGSmoslMEmOOFjSoGvgeczOusPcXzEq1IVOEtnCVfDDkz7dmvMul5Q8BQrVGvC1zV1h+PQK9uGMOWvjNM0YGQZY9G6n6egEfLgGnEaox8FERjKnP21YOc/q/St73VJ74nJgE5pQc2GaeokHLKZMMx+TRN0ycsgtwgLOzNQULXhY1xFktQ2BL626JmtrEc/3t+2t/WOgDwyD/nD2004rGZMKaP++tswPMBVMAfGGjlON+CYwX6A75DN72MM3CtiIMDVWXJiiOkz8LRfCajitpp3Of8aal40iCCBxEanHVf63bbHyQmMHsKtKYsora+c4n800HNvuM8iiv8stYDEv82I2riHnCw+vJn7W6CyW1mlNrwhpTGxGsLnLAk/NAT7GOKiIiQT7sT1mS7dO+ZpeUz3xLrZxYSYKTOESYP1MfZKaeevhdMWoQKHHDS9z6/ey1V3wkuEkg8gb/YJbflbqtR5200d7hhzoGKAd/YZMCEqj009Wq/57dnAF1RmX8drftCak4uhhsQMpn47AbTd2pcbizzWesIFKIkzkd52LP9a53Q5x1Gt3BSKa65FfoWRjn3KaX1sVOFe4gxezeOakmblH7giunK4rmCVfthp6S9Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(366004)(396003)(346002)(376002)(6916009)(8676002)(36756003)(8936002)(86362001)(9786002)(9746002)(478600001)(316002)(38100700002)(2616005)(426003)(966005)(2906002)(4744005)(66946007)(1076003)(66556008)(66476007)(54906003)(5660300002)(26005)(33656002)(7416002)(186003)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?p8OXyhdzcu+DPmcstmmHumq6IL7nNzruzvpzeWheHwnLpZ7hRqia9G41pO3K?=
 =?us-ascii?Q?4Oe16pCitCvVYdXU40sCtnXAXmM36UX+vrhKNEnOqnqkRyLPeHkw9+KtxuLC?=
 =?us-ascii?Q?nlDDs1br4BNAx/w1vF4GwAiQQQ0KEMFCpYjjo+Q1I8BPWw6PMYKLOYipoAxt?=
 =?us-ascii?Q?RDYpT33/IZghZUz+OoR/ljnHXc3mOJruyzn/VI1BNi/FGeoQEaLxlRT7xDCz?=
 =?us-ascii?Q?2jLUWYZIsYYIsZZCUAyxwQm23jLykuE+jGmePPBFNDEle4XEG/D8lJvz7E53?=
 =?us-ascii?Q?cZUGFmfzPMGc82aqo1PcuSQ5bGqp0J5hwww9w2HYb+GWitoJWPyOhMGAl9DI?=
 =?us-ascii?Q?Pjv21fQ+vl5wKfJKveUeeSSfxZui3lYAEHLUURLOazFLjpCtCLug2PYgt5x4?=
 =?us-ascii?Q?XXtUHDN/azMk38Sx+EPi9RRzInnyfW5cFXb5bLm6e+t7u+RPCca3wvayF24b?=
 =?us-ascii?Q?mFxUDxK2i8edZXDMXvZRl7VKEBG8saFUQP+LB9T82GqiFqvehf/fh/cRZU4A?=
 =?us-ascii?Q?QZx0Gj5Fdvap7yakWprOFT/418Xo3su4IGo1Z0ey8JPvYG9w97bg34VUQJTk?=
 =?us-ascii?Q?nzsJbAvi/1+qyiViwS5oXdQe1h409bzRmL8oEJCd2h/uTS+4jAR9MwuWUZG8?=
 =?us-ascii?Q?HZsM/m5GSUrJnsVnbgGhl4xXpdXaBvZLRUVeBfP6/RR0hMSnWYEPHROqrGKg?=
 =?us-ascii?Q?PMpopIlqJbYiLlD8nBVbo5+pviYwMja4uD5eTWKKldUUoYbiY2wtgN0JwRPH?=
 =?us-ascii?Q?e+Vkmmr/r+CpZ2yUBJoYfeksoiU3s/nnaN7Ul7bWTOcoN4fwxxBysJGvP/7h?=
 =?us-ascii?Q?qXzG3oD14Ep7BylXWwXPI9tcfPltFKi/awdm4GaKq5U+zyCkmAtT1NOlligE?=
 =?us-ascii?Q?qJ5SeiJKHK+P5d5YToFZ/GBnQy8uR1YrDUZogwJPjjH+etrXm/g6/NNhkw/3?=
 =?us-ascii?Q?+ulD5IoYyzted5o8HGKXeHI5XnDj6LaB8unF8hbQ3oAqb/TaM4H1XKTGZM0b?=
 =?us-ascii?Q?i5WhusVsf9qMLN3IZV2b7ZZlgOz/brC9wk8ZK7NeLdKagSxQSFGufJC21et1?=
 =?us-ascii?Q?yvukRezvP5xvSQJaF7zVrv0LhiIXehVKiIkv/2eTVaLVLR4doaF0JQH8UQMM?=
 =?us-ascii?Q?u/rNinWe0wcbq+zo/I3DeBsDpo2GEsmjowQQRatPrpWwtWYkaMHXPp7eUFZL?=
 =?us-ascii?Q?4RdsyyPQZU+XAvnYctYnZgwxI3ZbmM8OTWJnINTCXz16YgkSwIxEFeMC6psn?=
 =?us-ascii?Q?Zvj6uxdU3xoZu+ttiCbXhVWl8iz6TXgYYIEvpDHp6JjwFPRQ4jr1814enl1X?=
 =?us-ascii?Q?DykCWpNBC1R39XWHV7Iwg0Jm?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db3435c1-3125-49fe-86d3-08d935daa988
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2021 00:05:51.5245 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UjBGZjHrBZ+ImINUr7RJ9ye3BtoW5h/xfhAjdOoZ5oMF6HbtDLAt602iD5iIx6JL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5206
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
 Kirti Wankhede <kwankhede@nvidia.com>, linux-s390@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 intel-gfx@lists.freedesktop.org, Jason Herne <jjherne@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tony Krowiak <akrowiak@linux.ibm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Cornelia Huck <cohuck@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 17, 2021 at 04:22:08PM +0200, Christoph Hellwig wrote:
> This is my alternative take on this series from Jason:
> 
> https://lore.kernel.org/dri-devel/87czsszi9i.fsf@redhat.com/T/
> 
> The mdev/vfio parts are exactly the same, but this solves the driver core
> changes for the direct probing without the in/out flag that Greg hated,
> which cause a little more work, but probably make the result better.

I did some testing and it looks good, thanks

I see Alex has this in hch-mdev-direct-v4 in linux-next now, so
expecting this to be in the next merge window?

The AP prep patches seemed sorted so I'll resend the AP patch in three
weeks

Jason
