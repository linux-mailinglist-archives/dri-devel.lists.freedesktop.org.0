Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64CB94C157C
	for <lists+dri-devel@lfdr.de>; Wed, 23 Feb 2022 15:35:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3574110E79C;
	Wed, 23 Feb 2022 14:35:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com
 [IPv6:2607:f8b0:4864:20::c31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87FAD10E736;
 Wed, 23 Feb 2022 14:35:38 +0000 (UTC)
Received: by mail-oo1-xc31.google.com with SMTP id
 k13-20020a4a948d000000b003172f2f6bdfso22520366ooi.1; 
 Wed, 23 Feb 2022 06:35:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=1DHKICKFTEmke2sn2EXkA3bpw2jggt1Z3d5emz9rOhg=;
 b=F4uM0dOCVs/8BV3LDhBHGdMtxu6pQJH9ZSlSsPLT0bfIwwRylYBQrSaszpCiYZtW5m
 iomWSWVyO4+8ss7li4hAbJYUlLeVDcQpfIFB65KaGqnwoLyCaT6Lq7J0cJiCFLj8/jxv
 wYfNgmYA/CnijwF02r9x+8bZz/mg+SFv5n9LeJVoLcEoXa9CIyTZBLH6sKiJIbAn9Qpg
 Wwyua63Cli4uzo0xUSORTEHycIGYyxxpl9RTw0TJPyZPzYgdsfNYhux06DqDqhqRXKlM
 /slP7vxJvDERCz4CS9GufCqfSc0IIWUMtf91KFMnhS0XcST4vCBTkKMxXPzIqHpNcWRf
 HntQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=1DHKICKFTEmke2sn2EXkA3bpw2jggt1Z3d5emz9rOhg=;
 b=nL8aiFrGZIiK2JPBoGIwZCOlBBXO3OlFfKF9/HX2oYC/Yf/6nPGhRhnen5IDZ3HLia
 3YC4gy7cRNud65TwRVe+vIh0jTvHALB5oDOrTNC+VA1YEtVRLI0WPahbHDOoGRs2yOAv
 3AgTBVT73YfR7Gn9FDwktxwdnDg5du58yMbClo2/l4n9hDxeL/KymejBT9eBz9xgLgNN
 RCTo1xZYh66Jhwx77EmCOztaNy2k8rH0PofKr4sQ0O6CWQZkvhSJijqcvccG2dq0KoDb
 0I9jWYusU+ceGajdGRrsIFfqfcuJT6UNO1KPSdmTy+sMxe8KnNo8dH7uagHnybIk7Ly7
 Lo/g==
X-Gm-Message-State: AOAM5323CL80u5mIBBELfcKeb0cdZcAS2dWp03ymfhjE7hBh057x0Tyn
 m01M5fg5fJTdeHcDdm3+4VgHoRBGb2l7ygUzq7olyOiC
X-Google-Smtp-Source: ABdhPJxY4Zt3QR00jWc44U0fLugqEHv/kShc5mx906KbMDEg8WX271M5u9oOURMRztzGZeTInm5+0BtvAbr9xAGjQeo=
X-Received: by 2002:a05:6870:912c:b0:d3:44be:7256 with SMTP id
 o44-20020a056870912c00b000d344be7256mr4105596oae.73.1645626937669; Wed, 23
 Feb 2022 06:35:37 -0800 (PST)
MIME-Version: 1.0
References: <20220221095705.5290-1-Jiawei.Gu@amd.com>
 <202202212330.nxcvFWEe-lkp@intel.com>
 <d7314af9-449c-f6ac-95d9-168d27990814@amd.com>
 <CH0PR12MB51567C166A9C3D54FD31EB71F83C9@CH0PR12MB5156.namprd12.prod.outlook.com>
 <aa5ea6d6-aaaf-f3ee-03ff-8397dfc4f43d@amd.com>
In-Reply-To: <aa5ea6d6-aaaf-f3ee-03ff-8397dfc4f43d@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 23 Feb 2022 09:35:26 -0500
Message-ID: <CADnq5_OOsZQUJ0uqH3CSXczrO49Ddzabr8M-JBNqTQ02xzUT2A@mail.gmail.com>
Subject: Re: [PATCH] drm/sched: Add device pointer to drm_gpu_scheduler
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: "kbuild-all@lists.01.org" <kbuild-all@lists.01.org>, "Chen,
 Horace" <Horace.Chen@amd.com>, "Gu, JiaWei \(Will\)" <JiaWei.Gu@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Deng,
 Emily" <Emily.Deng@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Alex Deucher <Alexander.Deucher@amd.com>, "Liu, Monk" <Monk.Liu@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 23, 2022 at 2:42 AM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Well that's bad. This should not be pushed to amd-staging-drm-next at all=
.
>
> This patch is touching multiple drivers and therefore needs to go
> upstream through drm-misc-next.
>
> Alex can you drop that one before you send out a pull request? I'm going
> to cherry-pick it over to drm-misc-next.

Yeah, no problem.

Alex

>
> Thanks,
> Christian.
>
> Am 23.02.22 um 08:15 schrieb Gu, JiaWei (Will):
> > [AMD Official Use Only]
> >
> > Hi Christian,
> >
> > I noticed that and it has been fixed with the latest patch.
> > And I pushed it to amd-staging-drm-next already.
> >
> > Best regards,
> > Jiawei
> >
> > -----Original Message-----
> > From: Koenig, Christian <Christian.Koenig@amd.com>
> > Sent: Wednesday, February 23, 2022 3:12 PM
> > To: kernel test robot <lkp@intel.com>; Gu, JiaWei (Will) <JiaWei.Gu@amd=
.com>; dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org; Grod=
zovsky, Andrey <Andrey.Grodzovsky@amd.com>; Liu, Monk <Monk.Liu@amd.com>; D=
eng, Emily <Emily.Deng@amd.com>; Chen, Horace <Horace.Chen@amd.com>
> > Cc: kbuild-all@lists.01.org
> > Subject: Re: [PATCH] drm/sched: Add device pointer to drm_gpu_scheduler
> >
> > Hi Jiawei,
> >
> >
> > can you take a look at this? The kernel build robots screaming that thi=
s breaks the V3D build. Probably just a typo or missing include.
> >
> > I would rather like to push this sooner than later.
> >
> > Thanks,
> > Christian.
> >
> > Am 21.02.22 um 16:51 schrieb kernel test robot:
> >> Hi Jiawei,
> >>
> >> Thank you for the patch! Yet something to improve:
> >>
> >> [auto build test ERROR on drm/drm-next] [also build test ERROR on
> >> drm-intel/for-linux-next drm-exynos/exynos-drm-next
> >> tegra-drm/drm/tegra/for-next v5.17-rc5 next-20220217] [cannot apply to
> >> drm-tip/drm-tip] [If your patch is applied to the wrong git tree, kind=
ly drop us a note.
> >> And when submitting patch, we suggest to use '--base' as documented in
> >> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgi=
t-
> >> scm.com%2Fdocs%2Fgit-format-patch&amp;data=3D04%7C01%7CChristian.Koeni=
g%
> >> 40amd.com%7C33c94d7ecffe465c671d08d9f5522651%7C3dd8961fe4884e608e11a82
> >> d994e183d%7C0%7C0%7C637810555454343325%7CUnknown%7CTWFpbGZsb3d8eyJWIjo
> >> iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp
> >> ;sdata=3D8Kj1h9%2BCR%2B8nDeUXW%2B%2FQOFbiavK5oHons0mRPyHhq%2F0%3D&amp;=
re
> >> served=3D0]
> >>
> >> url:    https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A=
%2F%2Fgithub.com%2F0day-ci%2Flinux%2Fcommits%2FJiawei-Gu%2Fdrm-sched-Add-de=
vice-pointer-to-drm_gpu_scheduler%2F20220221-175818&amp;data=3D04%7C01%7CCh=
ristian.Koenig%40amd.com%7C33c94d7ecffe465c671d08d9f5522651%7C3dd8961fe4884=
e608e11a82d994e183d%7C0%7C0%7C637810555454343325%7CUnknown%7CTWFpbGZsb3d8ey=
JWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp=
;sdata=3DKMrQ%2FsAoUV768eWdTF1FdmXo44kDPjWKnwoi4rvVnqs%3D&amp;reserved=3D0
> >> base:   git://anongit.freedesktop.org/drm/drm drm-next
> >> config: ia64-allmodconfig
> >> (https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fd=
ow
> >> nload.01.org%2F0day-ci%2Farchive%2F20220221%2F202202212330.nxcvFWEe-lk
> >> p%40intel.com%2Fconfig&amp;data=3D04%7C01%7CChristian.Koenig%40amd.com=
%7
> >> C33c94d7ecffe465c671d08d9f5522651%7C3dd8961fe4884e608e11a82d994e183d%7
> >> C0%7C0%7C637810555454343325%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMD
> >> AiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=3DtL=
Vb
> >> OkxAyxSD%2BVUHUmS6BT5RfOzO4q3sotVZ2YHGV9o%3D&amp;reserved=3D0)
> >> compiler: ia64-linux-gcc (GCC) 11.2.0
> >> reproduce (this is a W=3D1 build):
> >>           wget https://nam11.safelinks.protection.outlook.com/?url=3Dh=
ttps%3A%2F%2Fraw.githubusercontent.com%2Fintel%2Flkp-tests%2Fmaster%2Fsbin%=
2Fmake.cross&amp;data=3D04%7C01%7CChristian.Koenig%40amd.com%7C33c94d7ecffe=
465c671d08d9f5522651%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637810555=
454343325%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBT=
iI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=3D8QLSr7JTjK87bBGwgOLxU6AU4bCeHo=
WX2zyx7SGYL7M%3D&amp;reserved=3D0 -O ~/bin/make.cross
> >>           chmod +x ~/bin/make.cross
> >>           # https://nam11.safelinks.protection.outlook.com/?url=3Dhttp=
s%3A%2F%2Fgithub.com%2F0day-ci%2Flinux%2Fcommit%2F9fdafca855faca0a3b8f213f0=
24985c4112fa0bb&amp;data=3D04%7C01%7CChristian.Koenig%40amd.com%7C33c94d7ec=
ffe465c671d08d9f5522651%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637810=
555454343325%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLC=
JBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=3DW9HKTScDzhoA1DClCigH2QQUgcI=
zLStBS%2Bx9ieYPbK4%3D&amp;reserved=3D0
> >>           git remote add linux-review https://nam11.safelinks.protecti=
on.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.com%2F0day-ci%2Flinux&amp;data=
=3D04%7C01%7CChristian.Koenig%40amd.com%7C33c94d7ecffe465c671d08d9f5522651%=
7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637810555454343325%7CUnknown%7=
CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn=
0%3D%7C3000&amp;sdata=3DFNJyugHVXenGmYqwgoK9kzKKjC3WGMia%2BNUduLNb0Pc%3D&am=
p;reserved=3D0
> >>           git fetch --no-tags linux-review Jiawei-Gu/drm-sched-Add-dev=
ice-pointer-to-drm_gpu_scheduler/20220221-175818
> >>           git checkout 9fdafca855faca0a3b8f213f024985c4112fa0bb
> >>           # save the config file to linux build tree
> >>           mkdir build_dir
> >>           COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-11.2.0
> >> make.cross O=3Dbuild_dir ARCH=3Dia64 SHELL=3D/bin/bash drivers/gpu/drm=
/msm/
> >> drivers/gpu/drm/v3d/
> >>
> >> If you fix the issue, kindly add following tag as appropriate
> >> Reported-by: kernel test robot <lkp@intel.com>
> >>
> >> All errors (new ones prefixed by >>):
> >>
> >>      drivers/gpu/drm/msm/msm_ringbuffer.c: In function 'msm_ringbuffer=
_new':
> >>>> drivers/gpu/drm/msm/msm_ringbuffer.c:90:15: error: too few arguments=
 to function 'drm_sched_init'
> >>         90 |         ret =3D drm_sched_init(&ring->sched, &msm_sched_o=
ps,
> >>            |               ^~~~~~~~~~~~~~
> >>      In file included from drivers/gpu/drm/msm/msm_ringbuffer.h:10,
> >>                       from drivers/gpu/drm/msm/msm_ringbuffer.c:7:
> >>      include/drm/gpu_scheduler.h:463:5: note: declared here
> >>        463 | int drm_sched_init(struct drm_gpu_scheduler *sched,
> >>            |     ^~~~~~~~~~~~~~
> >> --
> >>      In file included from drivers/gpu/drm/v3d/v3d_sched.c:23:
> >>      drivers/gpu/drm/v3d/v3d_sched.c: In function 'v3d_sched_init':
> >>>> drivers/gpu/drm/v3d/v3d_drv.h:158:26: error: implicit declaration of
> >>>> function 'to_platform_device'
> >>>> [-Werror=3Dimplicit-function-declaration]
> >>        158 | #define v3d_to_pdev(v3d) to_platform_device((v3d)->drm.de=
v)
> >>            |                          ^~~~~~~~~~~~~~~~~~
> >>      drivers/gpu/drm/v3d/v3d_sched.c:394:49: note: in expansion of mac=
ro 'v3d_to_pdev'
> >>        394 |                              NULL, "v3d_bin", &(v3d_to_pd=
ev(v3d)->dev));
> >>            |                                                 ^~~~~~~~~=
~~
> >>>> drivers/gpu/drm/v3d/v3d_sched.c:394:65: error: invalid type argument
> >>>> of '->' (have 'int')
> >>        394 |                              NULL, "v3d_bin", &(v3d_to_pd=
ev(v3d)->dev));
> >>            |                                                          =
       ^~
> >>      drivers/gpu/drm/v3d/v3d_sched.c:404:68: error: invalid type argum=
ent of '->' (have 'int')
> >>        404 |                              NULL, "v3d_render", &(v3d_to=
_pdev(v3d)->dev));
> >>            |                                                          =
          ^~
> >>      drivers/gpu/drm/v3d/v3d_sched.c:416:65: error: invalid type argum=
ent of '->' (have 'int')
> >>        416 |                              NULL, "v3d_tfu", &(v3d_to_pd=
ev(v3d)->dev));
> >>            |                                                          =
       ^~
> >>      drivers/gpu/drm/v3d/v3d_sched.c:429:73: error: invalid type argum=
ent of '->' (have 'int')
> >>        429 |                                      NULL, "v3d_csd", &(v=
3d_to_pdev(v3d)->dev));
> >>            |                                                          =
               ^~
> >>      drivers/gpu/drm/v3d/v3d_sched.c:441:81: error: invalid type argum=
ent of '->' (have 'int')
> >>        441 |                                      NULL, "v3d_cache_cle=
an", &(v3d_to_pdev(v3d)->dev));
> >>            |                                                          =
                       ^~
> >>      cc1: some warnings being treated as errors
> >>
> >>
> >> vim +/drm_sched_init +90 drivers/gpu/drm/msm/msm_ringbuffer.c
> >>
> >> 1d8a5ca436ee4a Rob Clark     2021-07-27   47
> >> f97decac5f4c2d Jordan Crouse 2017-10-20   48  struct msm_ringbuffer *m=
sm_ringbuffer_new(struct msm_gpu *gpu, int id,
> >> f97decac5f4c2d Jordan Crouse 2017-10-20   49                 void *mem=
ptrs, uint64_t memptrs_iova)
> >> 7198e6b03155f6 Rob Clark     2013-07-19   50  {
> >> 7198e6b03155f6 Rob Clark     2013-07-19   51         struct msm_ringbu=
ffer *ring;
> >> 1d8a5ca436ee4a Rob Clark     2021-07-27   52         long sched_timeou=
t;
> >> f97decac5f4c2d Jordan Crouse 2017-10-20   53         char name[32];
> >> 7198e6b03155f6 Rob Clark     2013-07-19   54         int ret;
> >> 7198e6b03155f6 Rob Clark     2013-07-19   55
> >> f97decac5f4c2d Jordan Crouse 2017-10-20   56         /* We assume ever=
where that MSM_GPU_RINGBUFFER_SZ is a power of 2 */
> >> f97decac5f4c2d Jordan Crouse 2017-10-20   57         BUILD_BUG_ON(!is_=
power_of_2(MSM_GPU_RINGBUFFER_SZ));
> >> 7198e6b03155f6 Rob Clark     2013-07-19   58
> >> 7198e6b03155f6 Rob Clark     2013-07-19   59         ring =3D kzalloc(=
sizeof(*ring), GFP_KERNEL);
> >> 7198e6b03155f6 Rob Clark     2013-07-19   60         if (!ring) {
> >> 7198e6b03155f6 Rob Clark     2013-07-19   61                 ret =3D -=
ENOMEM;
> >> 7198e6b03155f6 Rob Clark     2013-07-19   62                 goto fail=
;
> >> 7198e6b03155f6 Rob Clark     2013-07-19   63         }
> >> 7198e6b03155f6 Rob Clark     2013-07-19   64
> >> 7198e6b03155f6 Rob Clark     2013-07-19   65         ring->gpu =3D gpu=
;
> >> f97decac5f4c2d Jordan Crouse 2017-10-20   66         ring->id =3D id;
> >> 84c6127580c1ce Jordan Crouse 2018-11-07   67
> >> f97decac5f4c2d Jordan Crouse 2017-10-20   68         ring->start =3D m=
sm_gem_kernel_new(gpu->dev, MSM_GPU_RINGBUFFER_SZ,
> >> 604234f33658cd Jordan Crouse 2020-09-03   69                 check_apr=
iv(gpu, MSM_BO_WC | MSM_BO_GPU_READONLY),
> >> 604234f33658cd Jordan Crouse 2020-09-03   70                 gpu->aspa=
ce, &ring->bo, &ring->iova);
> >> 8223286d62e296 Jordan Crouse 2017-07-27   71
> >> 69a834c28fb514 Rob Clark     2016-05-24   72         if (IS_ERR(ring->=
start)) {
> >> 69a834c28fb514 Rob Clark     2016-05-24   73                 ret =3D P=
TR_ERR(ring->start);
> >> 375f9a63a66bae Rob Clark     2021-07-27   74                 ring->sta=
rt =3D NULL;
> >> 69a834c28fb514 Rob Clark     2016-05-24   75                 goto fail=
;
> >> 69a834c28fb514 Rob Clark     2016-05-24   76         }
> >> 0815d7749a6852 Jordan Crouse 2018-11-07   77
> >> 0815d7749a6852 Jordan Crouse 2018-11-07   78         msm_gem_object_se=
t_name(ring->bo, "ring%d", id);
> >> 0815d7749a6852 Jordan Crouse 2018-11-07   79
> >> f97decac5f4c2d Jordan Crouse 2017-10-20   80         ring->end   =3D r=
ing->start + (MSM_GPU_RINGBUFFER_SZ >> 2);
> >> 4c7085a5d581a5 Jordan Crouse 2017-10-20   81         ring->next  =3D r=
ing->start;
> >> 7198e6b03155f6 Rob Clark     2013-07-19   82         ring->cur   =3D r=
ing->start;
> >> 7198e6b03155f6 Rob Clark     2013-07-19   83
> >> f97decac5f4c2d Jordan Crouse 2017-10-20   84         ring->memptrs =3D=
 memptrs;
> >> f97decac5f4c2d Jordan Crouse 2017-10-20   85         ring->memptrs_iov=
a =3D memptrs_iova;
> >> f97decac5f4c2d Jordan Crouse 2017-10-20   86
> >> 1d8a5ca436ee4a Rob Clark     2021-07-27   87          /* currently man=
aging hangcheck ourselves: */
> >> 1d8a5ca436ee4a Rob Clark     2021-07-27   88         sched_timeout =3D=
 MAX_SCHEDULE_TIMEOUT;
> >> 1d8a5ca436ee4a Rob Clark     2021-07-27   89
> >> 1d8a5ca436ee4a Rob Clark     2021-07-27  @90         ret =3D drm_sched=
_init(&ring->sched, &msm_sched_ops,
> >> 1d8a5ca436ee4a Rob Clark     2021-07-27   91                         n=
um_hw_submissions, 0, sched_timeout,
> >> f1b7996551a40a Dave Airlie   2021-07-30   92                         N=
ULL, NULL, to_msm_bo(ring->bo)->name);
> >> 1d8a5ca436ee4a Rob Clark     2021-07-27   93         if (ret) {
> >> 1d8a5ca436ee4a Rob Clark     2021-07-27   94                 goto fail=
;
> >> 1d8a5ca436ee4a Rob Clark     2021-07-27   95         }
> >> 1d8a5ca436ee4a Rob Clark     2021-07-27   96
> >> f97decac5f4c2d Jordan Crouse 2017-10-20   97         INIT_LIST_HEAD(&r=
ing->submits);
> >> 77d205290aa944 Rob Clark     2020-10-23   98         spin_lock_init(&r=
ing->submit_lock);
> >> 77c406038e830a Rob Clark     2020-10-23   99         spin_lock_init(&r=
ing->preempt_lock);
> >> f97decac5f4c2d Jordan Crouse 2017-10-20  100
> >> f97decac5f4c2d Jordan Crouse 2017-10-20  101         snprintf(name, si=
zeof(name), "gpu-ring-%d", ring->id);
> >> f97decac5f4c2d Jordan Crouse 2017-10-20  102
> >> da3d378dec8634 Rob Clark     2021-07-26  103         ring->fctx =3D ms=
m_fence_context_alloc(gpu->dev, &ring->memptrs->fence, name);
> >> 7198e6b03155f6 Rob Clark     2013-07-19  104
> >> 7198e6b03155f6 Rob Clark     2013-07-19  105         return ring;
> >> 7198e6b03155f6 Rob Clark     2013-07-19  106
> >> 7198e6b03155f6 Rob Clark     2013-07-19  107  fail:
> >> 7198e6b03155f6 Rob Clark     2013-07-19  108         msm_ringbuffer_de=
stroy(ring);
> >> 7198e6b03155f6 Rob Clark     2013-07-19  109         return ERR_PTR(re=
t);
> >> 7198e6b03155f6 Rob Clark     2013-07-19  110  }
> >> 7198e6b03155f6 Rob Clark     2013-07-19  111
> >>
> >> ---
> >> 0-DAY CI Kernel Test Service, Intel Corporation
> >> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fli=
st
> >> s.01.org%2Fhyperkitty%2Flist%2Fkbuild-all%40lists.01.org&amp;data=3D04=
%7
> >> C01%7CChristian.Koenig%40amd.com%7C33c94d7ecffe465c671d08d9f5522651%7C
> >> 3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637810555454343325%7CUnknow
> >> n%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLC
> >> JXVCI6Mn0%3D%7C3000&amp;sdata=3DJTbXE%2Fv85yMSdX1zm4Em1aUZ32N29bf3Frll=
Bk
> >> r%2BsMQ%3D&amp;reserved=3D0
>
