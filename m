Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BEEAE3FEEB6
	for <lists+dri-devel@lfdr.de>; Thu,  2 Sep 2021 15:31:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6237389CC1;
	Thu,  2 Sep 2021 13:31:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BF75899E7;
 Thu,  2 Sep 2021 13:31:29 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id c79so2506964oib.11;
 Thu, 02 Sep 2021 06:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=DlakZWjL3B0PyUoUWgeFyjFMdA4bnhWlqnLUhIomQRs=;
 b=CoLkJUvQwnWFduu9eyxKeTop+z1djuDkBrA/OLxD/mksuM3ZtRN1QnkkC/LD8Cnlyp
 NtFU5EzP8K5gBHEcFzEBPCXBTV3rcPwwocL4ScBWSQXSTvc91TwvCQPZ2siycNXUn/9F
 2NOjjmNY1khUjK98y7nkW180An7CZdiNx0McliJHQhg45Fo7mZpuxKdFXe5xS5D46/gG
 NsYpDFkr12l1288lq8WC61BgU7fs2ElkDLGVlrevsqFHPB+6lgAG/ujB4mHgbQVuJZH+
 jfoX+slNlDhIB+i3Y2Kb+HfXOeZEiO6uRvLK2sGvsXCu2DzsXIfevvuFnrQ9MMCU8TUU
 asLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=DlakZWjL3B0PyUoUWgeFyjFMdA4bnhWlqnLUhIomQRs=;
 b=qUVTC8pR3zbzkQv93frgB7+NuOrHFZ3xtHNGxO+jNm2++Xrz1PfOkiLHHQmqgh8oTh
 ixP1eIIIr7FkcQ/vXkrpF+yBrDUTZLXaSVFt0QEjW2NnbJp5DvBzYIZvrCX+aEKZVIYu
 a4iyJc0mNKrmBHI2BuQv6v58ma9pI2e7r2cwJt5wHVhLFJsK4qusmXjQbNy1CyZjrlMd
 dTD0Xe+0Y/kyFKLzKfqyUqE7KRzgy9WK9BdqXzyWT92KjdaCCeblKPE2qHAnsvG+eYSK
 YYJElueZ18HzVsZ7OtYQNi0ovhkYf7p0Ef0DMn8sw+MFF8MWtdq80/UiXMCGehgYTsiZ
 6CbA==
X-Gm-Message-State: AOAM532HPMVgAZfznnAwUsHVUnSsYMTPAfQrOcHDfiID17aw/aKK5QRn
 LAT3CZ/xwhIa4pVBvOKrdH6e1RnKQmBK6zvP6sUh1luT
X-Google-Smtp-Source: ABdhPJy2khPEuKFJNUzjYQ3eB6mcy3GWzG9OV5JGv38rjUKZzk85+RIShvOHdhUnlO/ySQhKFN4S7bWNdx84StCiiK8=
X-Received: by 2002:a05:6808:1310:: with SMTP id
 y16mr2159125oiv.123.1630589488430; 
 Thu, 02 Sep 2021 06:31:28 -0700 (PDT)
MIME-Version: 1.0
References: <BL1PR12MB526942160701B46D4B28EEEC84CD9@BL1PR12MB5269.namprd12.prod.outlook.com>
 <CAKMK7uHKX0rSVk_yBPo_KAEJ-UeLk5UxQ2kBdv+FD2j9zAjfZA@mail.gmail.com>
 <BL1PR12MB5269B303372A6251EDD1DC2C84CD9@BL1PR12MB5269.namprd12.prod.outlook.com>
 <CADnq5_PUvgt9Cv2L3G4GGBJv_WBhtOp8DN+3WMvoES_80UMKfQ@mail.gmail.com>
 <CAPM=9tz-66nXR8gbMucsBo5Q1VJ5AsrVZh4pF0r0WfFi7CQtzg@mail.gmail.com>
 <BL1PR12MB5269F6B279EDE278C8FDF90A84CE9@BL1PR12MB5269.namprd12.prod.outlook.com>
In-Reply-To: <BL1PR12MB5269F6B279EDE278C8FDF90A84CE9@BL1PR12MB5269.namprd12.prod.outlook.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 2 Sep 2021 09:31:17 -0400
Message-ID: <CADnq5_PAEo0N4qrBFdv_o0S9+Vcjm7KeTcJ-BNKS=5qUzFyLwQ@mail.gmail.com>
Subject: Re: [diagnostic TDR mode patches] unify our solution
 opinions/suggestions in one thread
To: "Liu, Monk" <Monk.Liu@amd.com>
Cc: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 "Koenig, Christian" <Christian.Koenig@amd.com>, "Grodzovsky,
 Andrey" <Andrey.Grodzovsky@amd.com>, 
 "Chen, JingWen" <JingWen.Chen2@amd.com>,
 DRI Development <dri-devel@lists.freedesktop.org>, 
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 2, 2021 at 1:52 AM Liu, Monk <Monk.Liu@amd.com> wrote:
>
> [AMD Official Use Only]
>
> >>>
> I'm not sure I can add much to help this along, I'm sure Alex has some in=
ternal training,
> Once your driver is upstream, it belongs to upstream, you can maintain it=
, but you no longer control it 100%, it's a tradeoff, it's not one companie=
s always understand.
> Usually people are fine developing away internally, but once interaction =
with other parts of the kernel/subsystem is required they have the realisat=
ion that they needed to work upstream 6 months earlier.
> The best time to interact with upstream was 6 months ago, the second best=
 time is now.
> <<<
>
> Daniel/AlexD
>
> I didn't mean your changes on AMD driver need my personal approval or rev=
iew ... and  I'm totally already get used that our driver is not 100% under=
 control by AMDers,
> but supposedly any one from community (including you) who tend to change =
AMD's driver need at least to get approvement from someone in AMD, e.g.: Al=
exD or Christian, doesn't that reasonable?
> just like we need your approve if we try to modify DRM-sched, or need pan=
frost's approval if we need to change panfrost code ...
>
> by only CC AMD's engineers looks not quite properly, how do you know if y=
our changes (on AMD code part) are conflicting with AMD's on-going internal=
 features/refactoring or not ?
>

We keep as up to date as possible with upstream.  I don't have the
bandwidth to verify every patch, but in most cases I try and look at
them.  In your first example, the patch basically just adds a new
parameter to some common functions.  Drivers that don't need that
parameter don't use it.  It shouldn't really affect the functionality.
There are lots of changes that touch our driver that we are largely
not aware of.  E.g., APIs that we may use may change the function
signatures with no intended functional changes.  If problems are found
they are reported and resolved.  It is a collective effort.  If there
are changes that would conflict with stuff we are doing in our tree we
should bring them up when the relevant patches are being discussed.
We can also make changes to core functionality like scheduler, ttm,
etc. that would affect other drivers.  When we send out the patches we
cc the relevant maintainers, but ultimately the ones who participate
in the discussion set the direction.  That's why participation is
important.

Alex


> Thanks
>
> ------------------------------------------
> Monk Liu | Cloud-GPU Core team
> ------------------------------------------
>
> -----Original Message-----
> From: Dave Airlie <airlied@gmail.com>
> Sent: Thursday, September 2, 2021 2:51 AM
> To: Alex Deucher <alexdeucher@gmail.com>
> Cc: Liu, Monk <Monk.Liu@amd.com>; Daniel Vetter <daniel@ffwll.ch>; Koenig=
, Christian <Christian.Koenig@amd.com>; Grodzovsky, Andrey <Andrey.Grodzovs=
ky@amd.com>; Chen, JingWen <JingWen.Chen2@amd.com>; DRI Development <dri-de=
vel@lists.freedesktop.org>; amd-gfx@lists.freedesktop.org
> Subject: Re: [diagnostic TDR mode patches] unify our solution opinions/su=
ggestions in one thread
>
> On Thu, 2 Sept 2021 at 01:20, Alex Deucher <alexdeucher@gmail.com> wrote:
> >
> > On Wed, Sep 1, 2021 at 6:19 AM Liu, Monk <Monk.Liu@amd.com> wrote:
> > >
> > > [AMD Official Use Only]
> > >
> > > Daniel
> > >
> > > From the link you share it looks you(or someone else) have quite a bu=
nch patches that changes DRM_SCHED or even amdgpu, by that case before they=
 are merged to kernel tree I'm wondering if any AMD develop reviewed them ?
> > >
> > > They looks to me somehow conflicting with what we changed in our repo=
....
> > >
> > > It is really a chaos for AMDer if someone else out side of AMD change=
s our kernel driver (or/and scheduler) without reviewed by AMDer, just like=
 we are requiring your review if we tend to change scheduler's logic here .=
...
> > >
> > > This one changes AMD's code:
> > > https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fl=
o
> > > re.kernel.org%2Fdri-devel%2F20210625133327.2598825-2-boris.brezillon
> > > %40collabora.com%2F&amp;data=3D04%7C01%7CMonk.Liu%40amd.com%7C6c507d1=
8
> > > d65341ef53bb08d96d7976e6%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%
> > > 7C637661190727875969%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJ
> > > QIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DBWJSkK=
N
> > > y2%2BwjxbQrfxGPzuJ5PBpBwB4aV0ZH6QoJGEg%3D&amp;reserved=3D0
> > > And I didn't see any reviewed-by from AMDers ...
> > >
> > > This one also touches AMD's code:
> > > https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fl=
o
> > > re.kernel.org%2Fdri-devel%2F20200604081224.863494-12-daniel.vetter%4
> > > 0ffwll.ch%2F&amp;data=3D04%7C01%7CMonk.Liu%40amd.com%7C6c507d18d65341=
e
> > > f53bb08d96d7976e6%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C63766
> > > 1190727885929%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2
> > > luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3D%2F8vIVXCWjHk=
M
> > > 56pcYI9EvuzhbsZhV9WczkKaBJE67KQ%3D&amp;reserved=3D0
> > > Which is conflicting with one patch we submitted (in our repo
> > > rightnow), and neither see AMDder gave a review-by on this one (let
> > > me know if I missed it)
> > >
> >
> > Monk, this is not how upstream works.  You need to participate.
> > That's how communities work.  There's a reason all these discussions
> > happen on public mailing lists.  The patch author can't be expected to
> > know every person on every vendor team to CC with a patch.  If you
> > have concerns, you need to raise them when the patches are being
> > discussed.
> >
>
> I'm not sure I can add much to help this along, I'm sure Alex has some in=
ternal training,
>
> Once your driver is upstream, it belongs to upstream, you can maintain it=
, but you no longer control it 100%, it's a tradeoff, it's not one companie=
s always understand.
>
> Usually people are fine developing away internally, but once interaction =
with other parts of the kernel/subsystem is required they have the realisat=
ion that they needed to work upstream 6 months earlier.
>
> The best time to interact with upstream was 6 months ago, the second best=
 time is now.
>
> Dave.
