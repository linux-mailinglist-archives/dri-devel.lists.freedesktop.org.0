Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E9B14533BD
	for <lists+dri-devel@lfdr.de>; Tue, 16 Nov 2021 15:10:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9F9F6ECD7;
	Tue, 16 Nov 2021 14:10:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAF7D6ECB9;
 Tue, 16 Nov 2021 14:10:47 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id be32so42652946oib.11;
 Tue, 16 Nov 2021 06:10:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=5HnVFJwWxg/ead1ggRoAcMkKVf7joaKRzX46q0j0YsM=;
 b=Xv/csU2qOw/aioZ99vKZBzivV3PtgbiYJ8sW4xrGt8h7qQ3fK7UpGR0/FKWUlHoj7F
 xgitvwDMRhKAE3bnJg+M/zBkSERNOWH7IcCFjrhPTnO9+iCPPfhBOauY4CATfNRElIfX
 wVbfWcH4yODKiI9LmRtc5v7wtMVAZl95QlD7TBnusNepfkuOLTi+FwvZCm2dzXOFe8b3
 TQGinioEjHT7KNs+QqsozcWvdtTnIR7LqQlm72kpD2S1uIi9c1Yz/pP5TUwn6nyLbHGh
 Q9wAAkO4mpOvESn1o/M0dLdHScVEDIXw1krvS1Dz+hn+k745DYvdVfBVPWbH6jr1VkOT
 kX/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5HnVFJwWxg/ead1ggRoAcMkKVf7joaKRzX46q0j0YsM=;
 b=Wy47MJdbzOlmaYU4+57lfxfolGRqrtdN6ze2+885VjT608i+cXnPuWLnUnwH6Tw9Ue
 KyYOfMoxvYmQ/Uj0BbT77rrbYNA1klQP8EVFan/ZJ5sZ+suG+X5mIqFw9uOa+tuT9Ton
 KqsYCCuBqRznAEgaGTOAwkJ7eoT9efhli3s5Dtk6YiCWIhh09sFw3ESl6rhlr9VNT2K7
 flmNudnqtwpvrDZZeKaGKFZqOOnR/Sux1frOXE2wugFNC9dzb3H4U+hKWd+dyrR/ZsG9
 iEd3LNCYzL1+CtOLg92u7vwXZQfV4ozYMO0pNrB8vsqkbD0AnLUoNJD0MsdN9WB7Il13
 xVtQ==
X-Gm-Message-State: AOAM5318t6Hnhu9bTRJjbRmawwep+e5Uj3c5NSW+I4v8X0B0jxQ5hFRy
 /JNWx6laa5JzGKnbauT7IZuoPnMgTFb2HFEn7VU=
X-Google-Smtp-Source: ABdhPJxAMFbgyc+VmrraCujRVBPJP8ul1wExNXToDQKBtrJGDTAPMG76wJ7uh5JRIJ7Tn5iq2mWCtehApChxVOfAGW0=
X-Received: by 2002:a05:6808:300b:: with SMTP id
 ay11mr5137841oib.120.1637071846981; 
 Tue, 16 Nov 2021 06:10:46 -0800 (PST)
MIME-Version: 1.0
References: <735f8781-982b-a09f-32fe-fded0024a587@gmail.com>
 <58097218-40dd-55fd-32d2-2a299d39230f@daenzer.net>
 <YZIA/dkvjuMsup24@lang-desktop>
 <cadb9503-b390-e254-ffba-5e2e11f100cc@daenzer.net>
 <YZIiqM6PKKL/ZMNy@lang-desktop>
 <f1b88742-b07e-5973-1e30-9674a5950bf3@daenzer.net>
 <YZJFHMEqm1oz7QJN@lang-desktop>
 <e44a237c-0073-2eec-1a47-c5faf99f77b4@daenzer.net>
 <YZMlGSA9iG3aVCUu@lang-desktop>
 <391ee32e-f1b1-d92b-c9f3-17dbc0a9d690@gmail.com>
 <YZNlE9bZSJmTvS6d@lang-desktop>
 <52cc2823-35b3-0cb1-2119-82a3677e9b99@gmail.com>
In-Reply-To: <52cc2823-35b3-0cb1-2119-82a3677e9b99@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 16 Nov 2021 09:10:35 -0500
Message-ID: <CADnq5_Phwb-qDwtco+dm5n9Z2oveTpba=vxNLjD+geh9wRgFxg@mail.gmail.com>
Subject: Re: Questions about KMS flip
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
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
Cc: Michel DDDnzer <michel@daenzer.net>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Christian KKKnig <christian.koenig@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Lang Yu <Lang.Yu@amd.com>,
 "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 16, 2021 at 3:09 AM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Am 16.11.21 um 09:00 schrieb Lang Yu:
> > On Tue, Nov 16, 2021 at 08:14:08AM +0100, Christian KKKnig wrote:
> >> Am 16.11.21 um 04:27 schrieb Lang Yu:
> >>> On Mon, Nov 15, 2021 at 01:04:15PM +0100, Michel DDDnzer wrote:
> >>>> [SNIP]
> >>>>> Though a single call to dce_v*_0_crtc_do_set_base() will
> >>>>> only pin the BO, I found it will be unpinned in next call to
> >>>>> dce_v*_0_crtc_do_set_base().
> >>>> Yeah, that's the normal case when the new BO is different from the o=
ld one.
> >>>>
> >>>> To catch the case I described, try something like
> >>>>
> >>>> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c b/drivers/gpu/dr=
m/amd/amdgpu/dce_v11_0.c
> >>>>
> >>>> index 18a7b3bd633b..5726bd87a355 100644
> >>>>
> >>>> --- a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
> >>>>
> >>>> +++ b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
> >>>>
> >>>> @@ -1926,6 +1926,7 @@ static int dce_v11_0_crtc_do_set_base(struct d=
rm_crtc *crtc,
> >>>>
> >>>>                   return r;
> >>>>
> >>>>
> >>>>
> >>>>           if (!atomic) {
> >>>>
> >>>> +               WARN_ON_ONCE(target_fb =3D=3D fb);
> >>>>
> >>>>                   r =3D amdgpu_bo_pin(abo, AMDGPU_GEM_DOMAIN_VRAM);
> >>>>
> >>>>                   if (unlikely(r !=3D 0)) {
> >>>>
> >>>>                           amdgpu_bo_unreserve(abo);
> >>>>
> >>> I did some tests, the warning can be triggered.
> >>>
> >>> pin/unpin operations in *_crtc_do_set_base() and
> >>> amdgpu_display_crtc_page_flip_target() are mixed.
> >> Ok sounds like we narrowed down the root cause pretty well.
> >>
> >> Question is now how can we fix this? Just not pin the BO when target_f=
b =3D=3D
> >> fb?
> > That worked. I did a few simple tests and didn't observe ttm_bo_release=
 warnings
> > any more.
> >
> > The pin/unpin logic,
> >
> > 1, fist crtc_mode_set, dce_v*_0_crtc_do_set_base() pins crtc->primary->=
fb(new),
> > old_fb is NULL.
> >
> > 2, second crtc_mode_set, dce_v*_0_crtc_do_set_base() pins crtc->primary=
->fb(new),
> > unpins old fb.
> >
> > 3, amdgpu_display_crtc_page_flip_target() pin/unpin operations.
> >
> > 4, third crtc_mode_set, dce_v*_0_crtc_do_set_base() pins crtc->primary-=
>fb(new),
> > unpins old fb (it is pinned in last call to amdgpu_display_crtc_page_fl=
ip_target)
> >
> > 5, amdgpu_display_crtc_page_flip_target() pin/unpin operations.
> >
> > .....
> >
> > x, reboot, amdgpu_display_suspend_helper() is called, the last pinned f=
b was unpinned.
> >
> > And I didn't observe amdgpu_bo_unpin() in dce_v*_0_crtc_disable() is ca=
lled.
> >
> > If the logic is wrong, please correct me.
>
> I can't fully judge because I'm not that deep with my head in the old
> display code, but from a ten mile high view it sounds sane to me. Michel
> what do you think?
>
> BTW: Nicholas are there any plans to get rid of all that stuff? It would
> be a really nice cleanup of rather flaky code I think.

We just need to add analog support to the DC code.  Darren was looking into=
 it.

Alex


>
> Thanks,
> Christian.
>
> >
> > Regards,
> > Lang
> >
> >> Thanks,
> >> Christian.
> >>
> >>> Regards,
> >>> Lang
> >>>
>
