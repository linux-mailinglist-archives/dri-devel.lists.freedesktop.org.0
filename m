Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 357BB23B5B6
	for <lists+dri-devel@lfdr.de>; Tue,  4 Aug 2020 09:27:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 343166E442;
	Tue,  4 Aug 2020 07:27:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30083.outbound.protection.outlook.com [40.107.3.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4E626E372
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Aug 2020 23:19:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZFTH2lNeyQ/nNmMf6TDWuGk6sgS+0+FFWWk4BTHJ15biMkbv9a7AZzTrrtewqpW4HK8slGlhAN2KfTKS3pmLqr+RjlledU6C3ftVIeeeNlCon9IIKGG/sQZwgQGBukKxYEWbv2WL6Eu0FTG8FfXKMVcAQQ/5T8Ka5/YFaYKvB5dqz2KeerznmneCbJ+j67T4/AFkI4nC8EAD3a2J5H5KfVVe56MVNpJ/FhllsPiQWF9gPjVeFJCslwjKXQO6cNxeZNbC4zqJoQQ49tNQLsAD8jIRbhZaYmLEPo9I/Jt7uyL7C9WX+7UU+HJb4Ms6qzJ3QVFbiyDstexYOA3OhW8RKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EtSJea5dq9g1BmFJOds0HV2zbUMHLd/DNWpQmyUZmrw=;
 b=g/JzjnpZWWm/mxJrAa1b6HFDW28wPEYgseLJYDTjK7hyTk376EwnbUZfsoQnBg9hMWNQMecy6XrNUe8uim+OB0g0ZDkToPwVoumaT9IB30ud3ETD/aLGT1ySx1D+eQXR68WPhEQIERwhXleiFMMJYYqyyU5K/8Qfw7g/N2tJ9BwvyJzd0JhiKYJkv71o97tlqGnFrF0ZfiToaGJE5UOQ2+UeTe7tstnXR7k6l1/hVUuQvmDJODbQNhmxd/vFzDr9o2v/CXMH4MGyRMfM7AqoDuxo5FR8Q6TmJYlWtBav/wZYXrDZSn163U7t/Ys0aZSMQhvUjZZM/AgbONsq70nz0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EtSJea5dq9g1BmFJOds0HV2zbUMHLd/DNWpQmyUZmrw=;
 b=SJDh8Mkh+WsNMAEsa72zcen9GRhnhJy6/W51t2zQK9T0cZIrC11A+wJF0Q36nMsDKbg40xp3cjm0ehdRIY7U9ITDCH+Hc9THTlPeSy2GsgYKlFN3/TNm/ESaxMQsy3f/o+UD1wn8vLb6/ZwNucvaHIg7Dmg7gdN/rEoxoJeRCzk=
Authentication-Results: nvidia.com; dkim=none (message not signed)
 header.d=none;nvidia.com; dmarc=none action=none header.from=mellanox.com;
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (2603:10a6:803:44::15)
 by VI1PR05MB6351.eurprd05.prod.outlook.com (2603:10a6:803:fe::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.18; Mon, 3 Aug
 2020 23:19:28 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::10b0:e5f1:adab:799a]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::10b0:e5f1:adab:799a%4]) with mapi id 15.20.3239.021; Mon, 3 Aug 2020
 23:19:27 +0000
Date: Mon, 3 Aug 2020 20:19:23 -0300
From: Jason Gunthorpe <jgg@mellanox.com>
To: Ralph Campbell <rcampbell@nvidia.com>
Subject: Re: linux-next: manual merge of the hmm tree with the drm tree
Message-ID: <20200803231923.GR19097@mellanox.com>
References: <20200730192110.1466e63e@canb.auug.org.au>
 <20200730120303.GQ19097@mellanox.com>
 <cf7af4c9-592a-2143-831a-cb0f44bc768e@nvidia.com>
Content-Disposition: inline
In-Reply-To: <cf7af4c9-592a-2143-831a-cb0f44bc768e@nvidia.com>
X-ClientProxiedBy: MN2PR04CA0006.namprd04.prod.outlook.com
 (2603:10b6:208:d4::19) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:44::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (156.34.48.30) by
 MN2PR04CA0006.namprd04.prod.outlook.com (2603:10b6:208:d4::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3239.16 via Frontend Transport; Mon, 3 Aug 2020 23:19:27 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@mellanox.com>)	id 1k2jjn-003A3w-QB; Mon, 03 Aug 2020 20:19:23 -0300
X-Originating-IP: [156.34.48.30]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: adadbc83-1692-417f-3cc0-08d83803aac7
X-MS-TrafficTypeDiagnostic: VI1PR05MB6351:
X-Microsoft-Antispam-PRVS: <VI1PR05MB635163C642316B8ACC4EBC4ACF4D0@VI1PR05MB6351.eurprd05.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1417;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Hvn4LdvA+U7wkIdJtzCNfddm0LNjNtIhqYxVXxYDCrAeomPziHxxPCNX9z2upageIh7QiT3A9JIDTua/DDMl1ef8tnZGRo/09cLeEWYyPo3Y+4vYrJ/2tE7Uc7ZgCZUc++PDDc4ZKGpd3bl2LNCIqmiy4MRs9/+JKW1lLWIKTFgKmxXeNRDK+NRCwOlPJ7sOc943EubUgmQPWi4WQDMN3iqORZjAN8pmSEFUtM4dZDfuYTnSPJeFffc3HXsOg5Z/qJVS7JMBzPyaCAAVaxN0H1nchFQVadzonK2GeF5yboEO/q2W48Ns/VTqBlT6jnhm
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR05MB4141.eurprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(346002)(366004)(376002)(39860400002)(136003)(478600001)(9786002)(9746002)(8676002)(316002)(2906002)(54906003)(1076003)(86362001)(5660300002)(4326008)(36756003)(6916009)(66946007)(66476007)(66556008)(26005)(426003)(186003)(33656002)(53546011)(2616005)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: q1Tv0ojeTQNENKi6jwkJd7APTQnuMtYintjXTglSAP10+OtVUnxYmbBF/2ywWQI71HDoaZPnOqWdRvOWdp6Gf6NUCkpH/WC/0X0ELBJD6GljdwhzqR43WhiSResLKFj7/P3LcS7OH/NkN5sRiMkQbMJiuTTwUKOBjK6/hs8zwGRnhyEcXclOJM1A9C4KxfgfFLzNy+tQcblxUa4llvQygAry57tqVrsDWAuKu//LOj99U8mpk2NRfU5sHvuousGvV4ovRrztcPHyugKy7UyFCAWzsI2ANDDvqUQxZolDIpIsrWZw0NWJ88m+3roWI8LAwZm1KXhIW+gPzT9SCpcdovOLJJFTYF/OCzbTxq7VTyKgbobJxXrdu63mksXvHzqsH5Sr3Qz26WfV+PTlWUr7a77VV7fZVoYso/TLo5DejsRKe9WFsPlbsTP/VjrXTXU0M7vd3oJpkAdXh1Hn2eaa7Yohx+3jUzEp2EkPD250IbVESBCsAIw2b/EAgIOrX9NO+s4pcujPTmfTiZtZfD3XIP1N1WAH6x7l7K6xCUgMvCBMBbA0VlIYCrPcUNEw9CiciQfajdkSiWcGlBanVcWgFTcM4Kz4Xxp1AWpV1+RhwQsJ8W6EzOxanPZEWVEK6T1vJZ3HoDaOF2eAMQSoL1waIA==
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: adadbc83-1692-417f-3cc0-08d83803aac7
X-MS-Exchange-CrossTenant-AuthSource: VI1PR05MB4141.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2020 23:19:27.7334 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UaJypfXWAWFP1gwdS2Di64tLq0JISLxZViuXm7PzOf/kkaAUNSa/ApRzI5mi8LWy3eLqDhZPiuNIJfCF700i1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB6351
X-MS-Exchange-Transport-Forked: True
X-Mailman-Approved-At: Tue, 04 Aug 2020 07:27:04 +0000
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Dave Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 30, 2020 at 10:31:45AM -0700, Ralph Campbell wrote:
> 
> On 7/30/20 5:03 AM, Jason Gunthorpe wrote:
> > On Thu, Jul 30, 2020 at 07:21:10PM +1000, Stephen Rothwell wrote:
> > > Hi all,
> > > 
> > > Today's linux-next merge of the hmm tree got a conflict in:
> > > 
> > >    drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c
> > > 
> > > between commit:
> > > 
> > >    7763d24f3ba0 ("drm/nouveau/vmm/gp100-: fix mapping 2MB sysmem pages")
> > > 
> > > from the drm tree and commits:
> > > 
> > >    4725c6b82a48 ("nouveau: fix mapping 2MB sysmem pages")
> > >    1a77decd0cae ("nouveau: fix storing invalid ptes")
> > > 
> > > from the hmm tree.
> > > 
> > > 7763d24f3ba0 and 4725c6b82a48 are exactly the same patch.
> > 
> > Oh? Ralph? What happened here?
> 
> Ben did email me saying he was planning to take this patch into
> his nouveau tree and I did reply to him saying you had also taken it
> into your tree and that I had more nouveau/SVM patches for you on the way.
> So, I'm not sure what happened.

Well no answer from Ben and it looks like it is in the main DRM tree,
so I will drop the 4725c6b82a48 patch from hmm.

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
