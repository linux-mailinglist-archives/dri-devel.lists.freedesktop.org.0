Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA93B3FD7AD
	for <lists+dri-devel@lfdr.de>; Wed,  1 Sep 2021 12:27:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB0526E17B;
	Wed,  1 Sep 2021 10:27:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2053.outbound.protection.outlook.com [40.107.223.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A54E6E17D;
 Wed,  1 Sep 2021 10:27:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HOg2W2DPY4TPD0Kh52nFLrOhPSgbr5WYTkgR7nwbmdqw0F+ctEEr2EpASx/BqZOkNCcq7quxwpx11df5h2onfdCLks1DDTJiFkjqMiYx9+7fFHM7kTCh3zNZ5QMiMK7CtzojMkfgu1vTAnC9LtPdbUOtHZkYkwKEjBtcTJNhXqkLMvFGZM5e2i4TPEW9YW4oi+9+89jR2AqF/wVuG/zNaPLOVNfKJIP6oPQ23l4AqOFIuQOcBIvT9fMSodQaf8jMAMpxGoAGlE7B7LX9j+A1N1MDuPXDoWITwlnMPJ0RFo8uhhgXuQpWnvryawSTjjAc8TnHiifAwydWf2MXHjSuEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l55S7AdrT91svjHRjJzgL/otZlDa8L9c/lO0dziu0mM=;
 b=WdS7lvZtCWGJkliCYaAsH4fNd8QFgK71b5IQFntl2quDbvtgo8utjZZSQ7Y2BjkQPHCYiqE6P5f6jKkRV+tdpYAJuEAjXzo0EPt14/pNxy0lUayLN76rIO45VBSQpKqeUpW6GIN5PiZJq6EwZBleupLlGEqptYjcx/L3m0widQkygW8q4Tn8XjnY4lVYvAIK+1eyYQIAYXgCj3u9qXDY95XTNu+iKSHYpH5q+JOYgD9IcB2oDzCSTcaEzT9QYDcBsB0X5tcHRGm3biogLc15ZRTXVl1HKMXckGxUHvrO0t/U8ZjWlrQoGFCdjwlDt06c2P+92L7TtIuo2Z81ZGkqig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l55S7AdrT91svjHRjJzgL/otZlDa8L9c/lO0dziu0mM=;
 b=X+cX2wAVopTmRMymmbqFgDlL2A+RvVftAEAVRhxrfv+/FPH3jxakCAjaaXpfetzEELV2msAnk4UHPs5UCk4Z8ZslGDZu4okF0laL7C3upzmYcdd2SY4xuDOQQK6+n5fMLaOhSFrr5JEJMS8pfWvvfWFQtfOTZw6j0Dddjffs0VA=
Received: from BL1PR12MB5269.namprd12.prod.outlook.com (2603:10b6:208:30b::20)
 by BL1PR12MB5350.namprd12.prod.outlook.com (2603:10b6:208:31d::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.16; Wed, 1 Sep
 2021 10:27:40 +0000
Received: from BL1PR12MB5269.namprd12.prod.outlook.com
 ([fe80::acc6:c407:1353:6a]) by BL1PR12MB5269.namprd12.prod.outlook.com
 ([fe80::acc6:c407:1353:6a%5]) with mapi id 15.20.4457.024; Wed, 1 Sep 2021
 10:27:40 +0000
From: "Liu, Monk" <Monk.Liu@amd.com>
To: Daniel Vetter <daniel@ffwll.ch>
CC: "Koenig, Christian" <Christian.Koenig@amd.com>, "Grodzovsky, Andrey"
 <Andrey.Grodzovsky@amd.com>, "Chen, JingWen" <JingWen.Chen2@amd.com>, DRI
 Development <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: RE: [diagnostic TDR mode patches] unify our solution
 opinions/suggestions in one thread
Thread-Topic: [diagnostic TDR mode patches] unify our solution
 opinions/suggestions in one thread
Thread-Index: Adeezw8WIoeNdpdaSO6/zguUPH+5CgAOtiEAAAQ/QlA=
Date: Wed, 1 Sep 2021 10:27:39 +0000
Message-ID: <BL1PR12MB52694D10067BED3B1913268084CD9@BL1PR12MB5269.namprd12.prod.outlook.com>
References: <BL1PR12MB526942160701B46D4B28EEEC84CD9@BL1PR12MB5269.namprd12.prod.outlook.com>
 <CAKMK7uHKX0rSVk_yBPo_KAEJ-UeLk5UxQ2kBdv+FD2j9zAjfZA@mail.gmail.com>
In-Reply-To: <CAKMK7uHKX0rSVk_yBPo_KAEJ-UeLk5UxQ2kBdv+FD2j9zAjfZA@mail.gmail.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Enabled=true;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SetDate=2021-09-01T10:27:37Z; 
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Method=Standard;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Name=AMD Official Use
 Only-AIP 2.0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ActionId=d1028038-f8c2-4365-aa87-5d9a8724ca81;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ContentBits=1
authentication-results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6fc022e1-2357-443b-314e-08d96d332034
x-ms-traffictypediagnostic: BL1PR12MB5350:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BL1PR12MB5350325302850BABB336D62484CD9@BL1PR12MB5350.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: s8DFWMsulSAYP8eYZM/YXoHnQoh27U8o0dKE2c4dr7Mkk1ZBoxWgZkYsKKuLH1O74E92DqVRCBpqo32gVUufKbYEst4tPwf05uqwkrVSsbDM782mNi0L5XgDU0JfjoKVYrTd72mjh/27ML0wf2cBEqD2qbGgnB6pKg5axcxtkZBbQKZUe0Ql5XViIrS6rTo2tZzLqUghrkuATSX8UWITelHaEuFBVptYBpoC2G29xU87x3+UyZN4CphqmCIlYuQs27VjSh1RepkIWXA6gnzq3XNgRvdswR5vRBYvNn2ZusjZyfiFQlVB+WBL6tC29l4u9umXeaPj7659AONpPAtLsMcRzwr87EMwe2vD6xCXwkWCgChVjwIRIdusvTEW1ro72uo+nDKoVm9MxCQoXQcTjps5LhoPx6dN1WQyoKixocJlvVDGumDh9S+0FBNZWt5NnUvS93LojtmH5c89fmXbpaVe29J7TZMOlUwP7Di2P9641wtgw0hymlFXdXqqDpzMcb8TGP9TrRjQ3qFmb1uYcoGrD+nh40ztCSKh8kPHnyF1jurTIc13I1M5+3ubWnC7Xrl7flsOBZLoIameI/DUckSnHne24/L/Fy8gv27M2vmQiujwl0vaLKZ2GqkCCtBE3oA/j4EmxNUBF6Oamlg00K6NLlXzvA5NHmjRYWFRfFhBtKGurzriZqZvyd29YGukHebYkCl9vYUWzr+4AfuTj5VftMv/WdpwcnyedJYWQAsRnbErj2d23N8RKJLvQWLh6qWTFfLkW41Zv2TjbvSxhZVhWPaWGOPW9RGS40Ch4DTO1X46DtBQHU1KFtK6vNdVgg9Hch5d8lKmvOrUJrf3RA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5269.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(136003)(39860400002)(376002)(346002)(8676002)(52536014)(54906003)(7696005)(33656002)(4326008)(64756008)(53546011)(186003)(86362001)(26005)(66476007)(316002)(83380400001)(66556008)(76116006)(122000001)(6916009)(45080400002)(38100700002)(71200400001)(66946007)(6506007)(966005)(55016002)(38070700005)(478600001)(9686003)(5660300002)(8936002)(66446008)(2906002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?3DXJUfuy36ce0/C8aoYLQlbUFKvl+/Qf1s8t6tGJxk+tCPEi0skmr2hcc5sQ?=
 =?us-ascii?Q?GToJRIAB9QrmWEH2ze5TeAMu02Lj+pnr5EiDghLPoPxgZd86pxt0D3a40hKY?=
 =?us-ascii?Q?5vyp9qcJq2TzVCXX4i2VrOrA5eu9gkk0+QDNSSLrT7kU5MvMTTJt+fSAYjo6?=
 =?us-ascii?Q?+NmE0yQ4RD9wcofRB2CquEVvaBhVViZIqNZfs9GaUKKn5X+K8DlFmr4TqX9F?=
 =?us-ascii?Q?sjo0PG7F8/asUkyDhW9FXpRchuMRDYqmD3WVKZHZFsch9lG5ALp3iNbFZW1N?=
 =?us-ascii?Q?a1gPZwRBbztOPTvNnDJY6wnQkPa+gH9/NcgC5S4HKIN0pXsPNi3mnQL4VPnv?=
 =?us-ascii?Q?Kvz1KGNkndlyocXZIW7/QuICC5beN0NEPnTbJ7Mz9wUi9aQMog9hEUZ3w8mY?=
 =?us-ascii?Q?kdkgq3n2AP+iQy7JDsSIuXCL1qpqDJmyFRN94mngOFec0/r2OPS9FGjwDp/D?=
 =?us-ascii?Q?2yy+Wxy61D4tsBKg9+SOFQUnMrH0ok6Hz0nmss9XOCZ4Nw8VMjj3IdiaHD+q?=
 =?us-ascii?Q?IDKxXxJ9wgM68JFSHVQ/UJpNFCoX4sm4rGyquFH7vS1pqvK/bMKJLTKXwSsW?=
 =?us-ascii?Q?NgcNkk4J3wEJb8iH13OjrIU9ETxjhmkbikTUWUCvY954h66f2cL1iHVMSVhe?=
 =?us-ascii?Q?ErH7VUhiPwSsafL3GXlV4sn6RIhhj0a2Nw+JriGEGIHxsrL/yOuKuccEhBh7?=
 =?us-ascii?Q?wfAvwoJorIZ5Y/0HDn1SPVak6L989e9lnH+0jA9HDtax0Na2n8pi5b9S3ysB?=
 =?us-ascii?Q?4bs/8/wz9LahtsXz6xfjDdnM577L4gyDIXk5W60zWn3d83Ye52PbluSJWYG6?=
 =?us-ascii?Q?85OZMkEqq3ghzFDrJirKKDxSZYh9PMkD6YvLN3UepfqTQwfslEIZNbRjqNHJ?=
 =?us-ascii?Q?kPMR+wLrf0In7+b7qBEuMBBa6Pc68eD3n+o7+rsl1u/CnHXaNYrl+gvdy7u1?=
 =?us-ascii?Q?wzIGSa2p3c8FvtI4BUnkpRdZW6e09lRliK1/e07FUx/KaTlai+n+5FDsWvTc?=
 =?us-ascii?Q?C8J2zVTTH5trM46JiYSdYHuoWvMQ1ZSpkHCb1rSnK6fwi83kiDHsqwNnwrIu?=
 =?us-ascii?Q?3AHpDdvU2g78IM4EaDl4eG8L4GtW0H46/TeMqDSKdspkihHSOf7tH7hdvFbr?=
 =?us-ascii?Q?2S7xi3KhXeSlQgc7IFqwQZp1hV3NxKLLq7OcaZ+oDvvWeCrB7bnHz/KQF2Xx?=
 =?us-ascii?Q?4fPl5LdSKxhByaifA+va04k8C7TvllaC0H2hsQ5s2DuwWnuBDhcYd1Ccqhyr?=
 =?us-ascii?Q?KRpGabscDhN/PWAIMlJkKcNaP5DhNKSoW8AqRZ9s4C1RM/gwsDEqhLSwllTL?=
 =?us-ascii?Q?MzAA8mNzXWTh8wgEENVKOqcS?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5269.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fc022e1-2357-443b-314e-08d96d332034
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2021 10:27:39.8984 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qcprCerfrAl/QVH1cTNRSYFYMMH4O1gnUOMKj87bmTLukP5XC9SVFIyNMY91933z
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5350
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[AMD Official Use Only]

>> For me your project exists since a few weeks at most, because that is wh=
en your team showed up on dri-devel. That you already spent 6 months on thi=
s within amd, on a code area that very much affects shared code, without ki=
cking of any thread on dri-devel isn't great, but also not something we can=
 fix, since time machines don't exist.
This is partially true, because in the past months our change only resident=
 in AMD driver, it is till now that we found we had to make changes in SCHE=
D level=20

>> Your team hasn't been active in any of these discussions, but now sudden=
ly pops up out of nowhere and demands that your approach needs to land asap=
. That's really not how upstream works.
if our changes on DRI level part cannot get merged soon that's fine, we can=
 discuss more, but that's not suddenly pops up from nowhere, we already wor=
ked on it for months inside of AMD drivers.

>> I think the best way forward is to go through the above process again an=
d essentially restart. So submit a complete patch series with problem descr=
iptions, solution you picked, why you picked that, all the amdgpu patches t=
o get there and the core patches too. Since it sounds like a bunch of this =
has all landed already you probably need a patch 1 that goes back to 6 mont=
hs ago so that we can see the overall direction, and review whether that's =
the right one or not.

We are not objecting this approach,  we didn't do that because previously a=
ll what we need to do is resident inside AMD driver ...   because we try to=
 avoid change DRI/DRM interface part ...=20

For the patches you shows to us with links I'm sorry that due to some IT in=
frastructure reason me and my team didn't see it before (we kind of work in=
 AMD repo ... the patches you shows didn't get merged in our repo yet...)
One thing I also want to emphasis here: if any code need change inside AMD =
driver please always let us know and review.

Thanks=20

------------------------------------------
Monk Liu | Cloud-GPU Core team
------------------------------------------

-----Original Message-----
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of Daniel V=
etter
Sent: Wednesday, September 1, 2021 4:18 PM
To: Liu, Monk <Monk.Liu@amd.com>
Cc: Koenig, Christian <Christian.Koenig@amd.com>; Grodzovsky, Andrey <Andre=
y.Grodzovsky@amd.com>; Chen, JingWen <JingWen.Chen2@amd.com>; DRI Developme=
nt <dri-devel@lists.freedesktop.org>; amd-gfx@lists.freedesktop.org
Subject: Re: [diagnostic TDR mode patches] unify our solution opinions/sugg=
estions in one thread

Hi Monk,

On Wed, Sep 1, 2021 at 3:23 AM Liu, Monk <Monk.Liu@amd.com> wrote:
>
> [AMD Official Use Only]
>
>
> Hi Daniel/Christian/Andrey
>
>
>
> It looks the voice from you three are spread over those email floods to m=
e, the feature we are working on (diagnostic TDR scheme) is pending there f=
or more than 6 month (we started it from feb 2021).

For me your project exists since a few weeks at most, because that is when =
your team showed up on dri-devel. That you already spent 6 months on this w=
ithin amd, on a code area that very much affects shared code, without kicki=
ng of any thread on dri-devel isn't great, but also not something we can fi=
x, since time machines don't exist.

So we have to make the best out of the situation and move ahead where we ar=
e. From my understanding you've done a bunch of changes to the scheduler co=
de. As far as I can see there's been two related things your team has done:

- remove some allocations from scheduler code, because that can lead to dea=
dlocks. I've kicked up this topic quite a while ago here

https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flore.ke=
rnel.org%2Fdri-devel%2F20200604081224.863494-10-daniel.vetter%40ffwll.ch%2F=
&amp;data=3D04%7C01%7Cmonk.liu%40amd.com%7Cd90ad990ac1a499c266208d96d21138d=
%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637660811106940372%7CUnknown%=
7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6M=
n0%3D%7C1000&amp;sdata=3DpG5sG5pjVXEAMaahvfNS11VwbHkYWRuWrtHFXM9mEyo%3D&amp=
;reserved=3D0

This is just one patch of the entire series. This is an area where we reall=
y need a consistent solution across all drm/sched drivers, not something th=
at individual drivers just fix in their own way.

- the other one is the timeout issue for the patches you cite here.
Again there's been discussion on this on dri-devel with Boris from panfrost=
 about how we can handle at least some of the races in tdr.
That resulted in lots of discussions and documentation improvements.
Those patches are merged now, link
https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flore.ke=
rnel.org%2Fdri-devel%2F20210625133327.2598825-2-boris.brezillon%40collabora=
.com%2F&amp;data=3D04%7C01%7Cmonk.liu%40amd.com%7Cd90ad990ac1a499c266208d96=
d21138d%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637660811106940372%7CU=
nknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLC=
JXVCI6Mn0%3D%7C1000&amp;sdata=3Dm6U6tJbX2x38xiwQXE1oV0sz2BxXZfPlcouyqIqPZNU=
%3D&amp;reserved=3D0

There's been more than just this, also quite some doc patches from Boris th=
at explain how it's all supposed to work and be race-free.
Again your driver isn't the only one with interesting TDR races.

Your team hasn't been active in any of these discussions, but now suddenly =
pops up out of nowhere and demands that your approach needs to land asap. T=
hat's really not how upstream works.

The other thing where I'm struggling is that there's a lot of missing conte=
xt for outsiders. The patches sometimes come with zero commit message, for =
tricky concurrency bugs. And there's no context with what you've done alrea=
dy on the amdgpu side (since that never showed up on dri-devel), which make=
s constructive discussions here really hard.

Now fixing these bugs is obviously good, but the way this is supposed to wo=
rk when touching shared infrastructure is:

- Before you start merging anything kick off an RFC thread on dri-devel (or=
 whatever the topic really is about) about the problem you have and how you=
r trying to solve it. This can be just text if it's a big thing, but it can=
 also already include some proof of concept solution in the form of patches=
.

- Then we iterate on the solution, across drivers and shared code _together=
_. Not "merge amdgpu code first, then get annoyed when the core changes don=
't land immediately after you've practially finished the project".

- This might mean changes to other drivers if we need to adjust interfaces.

On the plus side you can plan much better, because you know you have upstre=
am buy-in before you start to put in real work on the project.

> Honestly speaking the email ways that we are using now is not friendly an=
d quite painful to me ....

Yes this is painful :-(

I think the best way forward is to go through the above process again and e=
ssentially restart. So submit a complete patch series with problem descript=
ions, solution you picked, why you picked that, all the amdgpu patches to g=
et there and the core patches too. Since it sounds like a bunch of this has=
 all landed already you probably need a patch 1 that goes back to 6 months =
ago so that we can see the overall direction, and review whether that's the=
 right one or not.

The not-so-painful approach would have been to do this from the start,
6 months ago. It would definitely have helped if the tdr discussion we've h=
ad just a few months ago would have involved your team too, I'm sure there =
would have been some good insights from amd's side. I'd really want you and=
 your engineers involved here, so let's do this properly!

Cheers, Daniel

> Can we try to put all our opinions, suggestions, or even objects here tog=
ether, let's go through them one by one, it's too hard for us to reply each=
 email on different questions .
>
>
>
> For [PATCH 1/2] drm/sched: fix the bug of time out calculation(v4)
>
>
>
> This is a fixing patch on the timeout timer in scheduler, can we complete=
 this one first ? it should already resolved all the questions and suggesti=
ons.
>
>
>
> For [PATCH 2/2] drm/sched: serialize job_timeout and scheduler
>
>
>
> I think I already explained the questions raised by Daniel in other=20
> thread , regarding why I use __kthread_should_park()
>
> For other aspects, can we put all our opinion synthesized here ?
>
>
>
> Thanks !
>
>
>
> ------------------------------------------
>
> Monk Liu | Cloud-GPU Core team
>
> ------------------------------------------
>
>



--
Daniel Vetter
Software Engineer, Intel Corporation
https://nam11.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fblog.ffw=
ll.ch%2F&amp;data=3D04%7C01%7Cmonk.liu%40amd.com%7Cd90ad990ac1a499c266208d9=
6d21138d%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637660811106940372%7C=
Unknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiL=
CJXVCI6Mn0%3D%7C1000&amp;sdata=3DNA3iopIUYFOuTokczRA%2BNBcwVrvMMMHGPM96%2B%=
2Bm0nEg%3D&amp;reserved=3D0
