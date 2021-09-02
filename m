Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB733FF0D7
	for <lists+dri-devel@lfdr.de>; Thu,  2 Sep 2021 18:11:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3933D6E5D1;
	Thu,  2 Sep 2021 16:11:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47A296E7D0
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Sep 2021 16:11:32 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id
 c42-20020a05683034aa00b0051f4b99c40cso3195171otu.0
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Sep 2021 09:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=dzEou6YcMJ6JD1i6QRk/UFl0Y6spW+ZnNXrdmmKzYgw=;
 b=eZ4CzawNnSlGuKqam62Ue09kEZTDCXrwMLL6RWj7+GVQA4XCFhLnKBF/+19HKKCi13
 6q0tkuY0CO4oG2KbRmMVW4ftIIvodA6JvvsDrrGWU5Yj9HuSyafIas5jbfA/uLvFNIee
 QkoPbxzSpqEWGe0ctDb4p67dT/KThQEaVeJRw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=dzEou6YcMJ6JD1i6QRk/UFl0Y6spW+ZnNXrdmmKzYgw=;
 b=C0YgW7KxSj0VTl9x83E693ypuog0JjnHhdogOaJpkzDpnU3cFATPAr/n9wp7tqNOOf
 m9iiQEpIXaH0d3wrLGOnVkyrQ3JBqqW/MvqsNIV3d/kQkubzWRSJoFY028A738cUAgcW
 ZMK8sy+VWdP2IjzY/MW67y6IPYOHU3jygXnNCPsDssTq6Q5XX0PD0HubE/06ULtaW0mU
 HgmQppim+if9LGL1PQLVpXbJDavAYkOYkNNXLGc4n1l1f9D6Zkr9B1co787h9R9y/V8z
 KVmWwwAsSpXx4kVQUmWOpP9ZiUDmnJYlKSvetHKCUAl5kObXfc2PLgvToWm4l9Km4JQO
 kUlg==
X-Gm-Message-State: AOAM532xbVbzzTGFO3wXT9eX0rRtuS51RGMhQprQ14+wqOaxWhMviD43
 NvQd6Q+4Urssi2CJPg8A0ZFDwTu2AadXsPbnFhwdRg==
X-Google-Smtp-Source: ABdhPJy+odBURBazoegzkjo3j/ynQj4aroWzhcufLArUZB9edpkISnLo80XhtQZGH5GFlBKcPpnpj4kB6JbPYl8H1kM=
X-Received: by 2002:a05:6830:70b:: with SMTP id
 y11mr3307944ots.281.1630599091430; 
 Thu, 02 Sep 2021 09:11:31 -0700 (PDT)
MIME-Version: 1.0
References: <BL1PR12MB526942160701B46D4B28EEEC84CD9@BL1PR12MB5269.namprd12.prod.outlook.com>
 <CAKMK7uHKX0rSVk_yBPo_KAEJ-UeLk5UxQ2kBdv+FD2j9zAjfZA@mail.gmail.com>
 <BL1PR12MB5269B303372A6251EDD1DC2C84CD9@BL1PR12MB5269.namprd12.prod.outlook.com>
 <CADnq5_PUvgt9Cv2L3G4GGBJv_WBhtOp8DN+3WMvoES_80UMKfQ@mail.gmail.com>
 <CAPM=9tz-66nXR8gbMucsBo5Q1VJ5AsrVZh4pF0r0WfFi7CQtzg@mail.gmail.com>
 <BL1PR12MB5269F6B279EDE278C8FDF90A84CE9@BL1PR12MB5269.namprd12.prod.outlook.com>
 <a1f2cfdf-e1af-e265-3d96-b8f5c47a0b84@amd.com>
In-Reply-To: <a1f2cfdf-e1af-e265-3d96-b8f5c47a0b84@amd.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 2 Sep 2021 18:11:19 +0200
Message-ID: <CAKMK7uENdQRw+5a=A_C3V6BpzqhU1asL_Bnm34r5ZjPpqu=gfQ@mail.gmail.com>
Subject: Re: [diagnostic TDR mode patches] unify our solution
 opinions/suggestions in one thread
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: "Liu, Monk" <Monk.Liu@amd.com>, Dave Airlie <airlied@gmail.com>, 
 Alex Deucher <alexdeucher@gmail.com>, "Grodzovsky,
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

On Thu, Sep 2, 2021 at 1:00 PM Christian K=C3=B6nig <christian.koenig@amd.c=
om> wrote:
>
> Hi Monk,
>
> Am 02.09.21 um 07:52 schrieb Liu, Monk:
> > [AMD Official Use Only]
> >
> > I'm not sure I can add much to help this along, I'm sure Alex has some =
internal training,
> > Once your driver is upstream, it belongs to upstream, you can maintain =
it, but you no longer control it 100%, it's a tradeoff, it's not one compan=
ies always understand.
> > Usually people are fine developing away internally, but once interactio=
n with other parts of the kernel/subsystem is required they have the realis=
ation that they needed to work upstream 6 months earlier.
> > The best time to interact with upstream was 6 months ago, the second be=
st time is now.
> > <<<
> >
> > Daniel/AlexD
> >
> > I didn't mean your changes on AMD driver need my personal approval or r=
eview ... and  I'm totally already get used that our driver is not 100% und=
er control by AMDers,
> > but supposedly any one from community (including you) who tend to chang=
e AMD's driver need at least to get approvement from someone in AMD, e.g.: =
AlexD or Christian, doesn't that reasonable?
>
> I'm fearing that just repeating what Alex said, but to make it clear
> once more: That is *not* necessary!
>
> The shared repository is owned by upstream maintainers and they are
> usually free to do restructuring work without getting acknowledge from
> every single driver maintainer.
>
> Anybody can of course technically object to upstream design decisions,
> but that means that you need to pay attention to the mailing lists in
> the first place.
>
> > just like we need your approve if we try to modify DRM-sched, or need p=
anfrost's approval if we need to change panfrost code ...
> >
> > by only CC AMD's engineers looks not quite properly, how do you know if=
 your changes (on AMD code part) are conflicting with AMD's on-going intern=
al features/refactoring or not ?
>
> Well because AMD is supposed to work in public as much as possible and
> ask upstream before doing changes to the code base.
>
> Additional to that design decisions are supposed to be discussed on the
> mailing list and *not* internally.

Yeah I'm honestly really surprised about the course of this discussion
here. With Alex, Christian and others amd has a lot of folks with
years/decades of experience in how to collaborate in upstream, when to
pull in others proactively and when that's not needed, and in general
how to plan upstream work with the lest amount of risk and surprises.

I think step zero here needs to be some training at amd and then
re-planning this effort, before we get back to technical stuff.
Otherwise we'll just get bogged down in pain because expectations
about the process don't pan out.
-Daniel

>
> Regards,
> Christian.
>
> >
> > Thanks
> >
> > ------------------------------------------
> > Monk Liu | Cloud-GPU Core team
> > ------------------------------------------
> >
> > -----Original Message-----
> > From: Dave Airlie <airlied@gmail.com>
> > Sent: Thursday, September 2, 2021 2:51 AM
> > To: Alex Deucher <alexdeucher@gmail.com>
> > Cc: Liu, Monk <Monk.Liu@amd.com>; Daniel Vetter <daniel@ffwll.ch>; Koen=
ig, Christian <Christian.Koenig@amd.com>; Grodzovsky, Andrey <Andrey.Grodzo=
vsky@amd.com>; Chen, JingWen <JingWen.Chen2@amd.com>; DRI Development <dri-=
devel@lists.freedesktop.org>; amd-gfx@lists.freedesktop.org
> > Subject: Re: [diagnostic TDR mode patches] unify our solution opinions/=
suggestions in one thread
> >
> > On Thu, 2 Sept 2021 at 01:20, Alex Deucher <alexdeucher@gmail.com> wrot=
e:
> >> On Wed, Sep 1, 2021 at 6:19 AM Liu, Monk <Monk.Liu@amd.com> wrote:
> >>> [AMD Official Use Only]
> >>>
> >>> Daniel
> >>>
> >>>  From the link you share it looks you(or someone else) have quite a b=
unch patches that changes DRM_SCHED or even amdgpu, by that case before the=
y are merged to kernel tree I'm wondering if any AMD develop reviewed them =
?
> >>>
> >>> They looks to me somehow conflicting with what we changed in our repo=
....
> >>>
> >>> It is really a chaos for AMDer if someone else out side of AMD change=
s our kernel driver (or/and scheduler) without reviewed by AMDer, just like=
 we are requiring your review if we tend to change scheduler's logic here .=
...
> >>>
> >>> This one changes AMD's code:
> >>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fl=
o
> >>> re.kernel.org%2Fdri-devel%2F20210625133327.2598825-2-boris.brezillon
> >>> %40collabora.com%2F&amp;data=3D04%7C01%7CMonk.Liu%40amd.com%7C6c507d1=
8
> >>> d65341ef53bb08d96d7976e6%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%
> >>> 7C637661190727875969%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJ
> >>> QIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DBWJSkK=
N
> >>> y2%2BwjxbQrfxGPzuJ5PBpBwB4aV0ZH6QoJGEg%3D&amp;reserved=3D0
> >>> And I didn't see any reviewed-by from AMDers ...
> >>>
> >>> This one also touches AMD's code:
> >>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fl=
o
> >>> re.kernel.org%2Fdri-devel%2F20200604081224.863494-12-daniel.vetter%4
> >>> 0ffwll.ch%2F&amp;data=3D04%7C01%7CMonk.Liu%40amd.com%7C6c507d18d65341=
e
> >>> f53bb08d96d7976e6%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C63766
> >>> 1190727885929%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2
> >>> luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3D%2F8vIVXCWjHk=
M
> >>> 56pcYI9EvuzhbsZhV9WczkKaBJE67KQ%3D&amp;reserved=3D0
> >>> Which is conflicting with one patch we submitted (in our repo
> >>> rightnow), and neither see AMDder gave a review-by on this one (let
> >>> me know if I missed it)
> >>>
> >> Monk, this is not how upstream works.  You need to participate.
> >> That's how communities work.  There's a reason all these discussions
> >> happen on public mailing lists.  The patch author can't be expected to
> >> know every person on every vendor team to CC with a patch.  If you
> >> have concerns, you need to raise them when the patches are being
> >> discussed.
> >>
> > I'm not sure I can add much to help this along, I'm sure Alex has some =
internal training,
> >
> > Once your driver is upstream, it belongs to upstream, you can maintain =
it, but you no longer control it 100%, it's a tradeoff, it's not one compan=
ies always understand.
> >
> > Usually people are fine developing away internally, but once interactio=
n with other parts of the kernel/subsystem is required they have the realis=
ation that they needed to work upstream 6 months earlier.
> >
> > The best time to interact with upstream was 6 months ago, the second be=
st time is now.
> >
> > Dave.
>


--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
