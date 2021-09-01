Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32CC43FD78D
	for <lists+dri-devel@lfdr.de>; Wed,  1 Sep 2021 12:19:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98F746E187;
	Wed,  1 Sep 2021 10:19:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2059.outbound.protection.outlook.com [40.107.244.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D13FF6E187;
 Wed,  1 Sep 2021 10:19:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k8cAwbFzPB/83oSi+QwN8bv2p7iHrtsj929duFBQkWbaBHFptZtUFdNBcwZ17Gf1HZRoopB4cnfi13g0nvWsvT/MuQRRxMgVqWFa4s++EyPLBVGiou4skjsDWXMy7dJXBa5e0H3pFYzuLuXIKWkv1J4tPjHlUB8GGtKLz/vxRI8TOxsTfZe2fWwu4DOORUL5llijMB0j9A6ysf5F1IeDhxKy/yPZ7KC2XoBh4k7va+cXqrfHxBvgVwatHQwx/esexdoNy/gag1XrgYq/U9XUK2g/FOTqWBWROvBV388Kn+ZQ9/Qdh5VjDGQb7kk74mO7+8n4/PVyL0/xtPUXsGXbrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2QFB4BLyfqMWtOGXz04QVWbu8STlkqdVOeC7JPcsdcA=;
 b=WYL00HpsFBM05FvKVoaNFbLXhfKinYEosImfm4McJ0dZ/KhH3qIsDikQfCJAecC1+Sn/DP9vf4khWvog27WCwYb6Mb7PpvSkmANVprctQeYAd+akvSycPnBX7UitEKlmqmGSVYI4bk+920hy4JcyW5rIZaZqt6ufM63h2TtrWU1AeJWpujVpQopIRQUBqpNdtw7MoAxXOG6nE1hdDyJsepmtsx8vox8G7WjK9rFFX33Tg/HKSpUSnDmAN2CVzQbCNiD6/bMuBtJAS4YnCdfrTisV10z2fhYoLG9oMMMLpcNZio8bPrRqSnDTvtlhBkWiRBOr2/Wirb+FOe+gKmq09w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2QFB4BLyfqMWtOGXz04QVWbu8STlkqdVOeC7JPcsdcA=;
 b=XAbhlhZkxz5R9lnFhFVJIVnvZbxW+rxacE3hiWnulxHnQWhxodsY8enBwfYbCZQmxkN26RhGwLUTW9uhY9wv7h18g9ItJU1BT80c9p6BlPveAwFkfukMxZUKnOfQl9/zn3ZEvY+Pb4GcJCIVi56K03qYiDDVNhqIuuwpMxJJKtg=
Received: from BL1PR12MB5269.namprd12.prod.outlook.com (2603:10b6:208:30b::20)
 by BL1PR12MB5255.namprd12.prod.outlook.com (2603:10b6:208:315::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Wed, 1 Sep
 2021 10:19:32 +0000
Received: from BL1PR12MB5269.namprd12.prod.outlook.com
 ([fe80::acc6:c407:1353:6a]) by BL1PR12MB5269.namprd12.prod.outlook.com
 ([fe80::acc6:c407:1353:6a%5]) with mapi id 15.20.4457.024; Wed, 1 Sep 2021
 10:19:32 +0000
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
Thread-Index: Adeezw8WIoeNdpdaSO6/zguUPH+5CgAOtiEAAAQJJ3A=
Date: Wed, 1 Sep 2021 10:19:32 +0000
Message-ID: <BL1PR12MB5269B303372A6251EDD1DC2C84CD9@BL1PR12MB5269.namprd12.prod.outlook.com>
References: <BL1PR12MB526942160701B46D4B28EEEC84CD9@BL1PR12MB5269.namprd12.prod.outlook.com>
 <CAKMK7uHKX0rSVk_yBPo_KAEJ-UeLk5UxQ2kBdv+FD2j9zAjfZA@mail.gmail.com>
In-Reply-To: <CAKMK7uHKX0rSVk_yBPo_KAEJ-UeLk5UxQ2kBdv+FD2j9zAjfZA@mail.gmail.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Enabled=true;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SetDate=2021-09-01T10:19:30Z; 
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Method=Standard;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Name=AMD Official Use
 Only-AIP 2.0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ActionId=e78a97a4-d54a-42ff-a26b-71e1396565b6;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ContentBits=1
authentication-results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0faa9574-2f19-48f1-77e7-08d96d31fd84
x-ms-traffictypediagnostic: BL1PR12MB5255:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BL1PR12MB5255EB6281091089B47DE08484CD9@BL1PR12MB5255.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bD9T+UyMw2m8Xizl36DnujfHJYh5hukCL5WqbfjxBT1f8alS2+VPhuhBfHVxJPdo/heBxs6YRQauNHSlfHmzXYKROTE7SPDIqeF2sOhurZQ3Yc3ZJJclYSwZdL+caNVl0HX+h2oPeuDiLNPSW0PPjjw6KVqeXez2tKT9o8UtOL2SBUqJ5pr6l7JphZHnrT1mGIEjby0AVX8qLdJTHAcJiZ6GYKEWwO5Ys8Gi6xwk48Vu59doW4VuYHx2mIN+wZFHTVlnNc4+N8qasX6b20JLjFsEHWquvLFnkMMCeNAvz29+dGAShFRr5/kUXRIcNgFd0NSBiqOHpJfTA7Zp5QbvrbY2w+aNncHrUC47CwwAfcl2vZsOqiIT7HZUcyHYj1wI5/Lw0VkUItLpMlP5jhCLuJfr3BU2K9Fk3xg4+Ky7wVptPFXrVJE628I3SW95TUlLYB/gUlL4/A34bywRsgSrEEo+2VHbW10DG+z28mAkyCmxPYUjbBVIH5WN9XksWw9DyaerglYQwrqQPK8fKzmZAiZ07f81KUUt/aayuYHdHimKH2YvLbum4EFeYWZ0QkQt4xqjbndTrs2BS55BkkAhg3S+tWaHBFl+EQ/wQD2jrX2M4OyoRiotjF8tteFCcSuobjNd76NZua1yarOBIa3dGQX2fE1BdgX0VR6ChraBJCYEYzSvJl9Q0+6FDSFJKpROq3rmAVi3qYo9WT6FUbOYxJT6Z7tTP2AeJtomGcWkDsKngMtyVMOmkT6NdnBnp2tRqK191bDClePbO1zFMJDT5z+B9upWI4qswteyabN3o4qdjqZdotE6aXzktA1im8/uhwr5Z/Na1EoEWIVPfnnOPw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5269.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(376002)(396003)(136003)(346002)(33656002)(5660300002)(66946007)(76116006)(66446008)(316002)(66476007)(53546011)(2906002)(83380400001)(9686003)(4326008)(66556008)(186003)(54906003)(52536014)(64756008)(7696005)(6506007)(8676002)(966005)(478600001)(45080400002)(8936002)(71200400001)(26005)(86362001)(38100700002)(122000001)(55016002)(38070700005)(6916009);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?pOwrI0+SCXpinjmeHMBoIDdfhDEpFE2Cf8dc8jaGey/zgVFgeLeZMZeOQVam?=
 =?us-ascii?Q?kqRaYpSNJLj4LubfNfDjA1PiE9sCSDpP7hsBeEaM2BfULJLRbBEFQDWf7gwh?=
 =?us-ascii?Q?XH28FzMRzkoXNHO21Nr6ANbllGGDNvUC89pM+EH26l7h56h5WdYGzCwaoN5x?=
 =?us-ascii?Q?BsW4Vlr0rHWihxh9n4+OB7gf7mVW+f+9vGQrl8moVU1S8g4trqoKJMIJPumb?=
 =?us-ascii?Q?OyGEJHpYNUj9tVo1Wg+BdKKjBkNv+08EYKJvSvA9H35ZvfIzR8TucsgUbunu?=
 =?us-ascii?Q?R6FbpM7kYmr5FGEawN2EwiHxn6GfU61keoTp0/ZDm25JMMHenKSfMfItvxQ7?=
 =?us-ascii?Q?EosjkW1sP/N0lE571bRviWQgrCLSJYDuU0XgUqOUgEUNbMcB4E8CAMXV168x?=
 =?us-ascii?Q?i4HTsfx+nkG+DDseUaFcx0l/Dt1oUW4moT9QKJmZjcQkprnkZTxMhEKUTkef?=
 =?us-ascii?Q?Q7XG7yRll/neLnLDJWbpnmNkHyiw8UFDpnhVE0E708RqUbXV2wFWwKETfSpV?=
 =?us-ascii?Q?btk9xRRLY7+va0R15Wn6ZWVofXljfG5es6T1/YupCECk/RdYRattOx7vJALG?=
 =?us-ascii?Q?8VSHmu21lRyvBDgIMBA8CXkTfW5O5rAR8jchw5GTQXglg4RK1vCOtqrZcWhj?=
 =?us-ascii?Q?bSPKyITYqPdpRvJVrl0pVEt9e1u4GsFpRhNYnXnPHB8Nx8nU5mjPYQuUZxSz?=
 =?us-ascii?Q?fxn6mWYeTmYZOhTppTagVzj+9CQEDmYx7wgpNh9nFYUaXGFQT0zsWsuPgA7y?=
 =?us-ascii?Q?34g2wfYoj7ruX6lUN4IIwezVsoQcMWL7WLT3wqyPXKoEF2ICRWP+T5nSIeS0?=
 =?us-ascii?Q?Nu1W9YPegHBjuXRhqiwSPTPGeSZJceLsCPa2rvG1/+vW0bMKwPyKslJqxO2T?=
 =?us-ascii?Q?UY7gKx01Q7rUpDs0EdQEjq0L5Dq6R3N6LEdh+lTbomOXAy13DktBocX0uBA4?=
 =?us-ascii?Q?l0c/OwRyZxO7zYh5FEr7ulpdIhzaa3U2Nc75gL2QdEm4v4FPlq+/xTVBiBde?=
 =?us-ascii?Q?uyLwffrM94WTu319I32lAmD97X6cvfGr/appFNKRWcNbb6C2G+aIt0IRznje?=
 =?us-ascii?Q?xhgeBsPsPdRn7zH8CuZNBy9rO7FSb7dw5KLVhdoMeCMSaYHT7wEjW1cXyNvl?=
 =?us-ascii?Q?CHo8SgHEC63OvdcMyLxImFCGMq13LechtKYho+mlcFtMxxYIlPJfwejGVhn4?=
 =?us-ascii?Q?Gm4y5uv6Q2S5xGI1Skg/FbhctcifL9fQFKn0hH/PTl7CSw4Ziq4q/bJ8aQCI?=
 =?us-ascii?Q?O2En4Qgh7vNY/fE9ks/8bKcmFg+iSuS5C/h6zD3rMylrhIiFNgQcdV08qdm+?=
 =?us-ascii?Q?eh30sMJlEYX3N3ycxjo3N37A?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5269.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0faa9574-2f19-48f1-77e7-08d96d31fd84
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2021 10:19:32.2025 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3v9ZF2VVGn4Xc8tPTjAPrmKjvm9DOUUkn5g416L0+PBB4fq99FXvcGGdYfNsya+u
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5255
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

Daniel=20

From the link you share it looks you(or someone else) have quite a bunch pa=
tches that changes DRM_SCHED or even amdgpu, by that case before they are m=
erged to kernel tree I'm wondering if any AMD develop reviewed them ?

They looks to me somehow conflicting with what we changed in our repo....=20

It is really a chaos for AMDer if someone else out side of AMD changes our =
kernel driver (or/and scheduler) without reviewed by AMDer, just like we ar=
e requiring your review if we tend to change scheduler's logic here ....=20

This one changes AMD's code: https://lore.kernel.org/dri-devel/202106251333=
27.2598825-2-boris.brezillon@collabora.com/
And I didn't see any reviewed-by from AMDers ...

This one also touches AMD's code: https://lore.kernel.org/dri-devel/2020060=
4081224.863494-12-daniel.vetter@ffwll.ch/
Which is conflicting with one patch we submitted (in our repo rightnow), an=
d neither see AMDder gave a review-by on this one (let me know if I missed =
it)

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
