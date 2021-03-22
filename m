Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD7B344657
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 14:59:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A79676E48E;
	Mon, 22 Mar 2021 13:59:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com
 [IPv6:2607:f8b0:4864:20::c32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2B0B6E48E;
 Mon, 22 Mar 2021 13:58:59 +0000 (UTC)
Received: by mail-oo1-xc32.google.com with SMTP id
 w1-20020a4adec10000b02901bc77feac3eso4126587oou.3; 
 Mon, 22 Mar 2021 06:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ycw4kh6uo5mWPlwHrkQbviI/KYMjUPq3rp+uHfdtBN8=;
 b=WaafIrkRt7VtbLiAqIvMQ7prtR+nbO+j3A/PsAroCb42gPmrFUj0dDALDmw1qiVf4r
 QZ0NZtKuEHyYU8j4D1oQ4EyDnGSwIY8B6E+FcEACoxi3oYTFnf4gJm+60NHNXcdz8Tuw
 TGXNA/HE78qtHiS4kXBXalgoxVHD73NaxNxsyfE5QjBGsuJB9E7o1txUYPYC/dCwb2ln
 FWnHO0cqAzYkjWL7dKD1/snl7HuhXmqqMgnocwz3B0zQ7qy3I8ABnUUb1VB4bfWLsScH
 e2AowhcZLFchuJ6vl7u6FXEF1vmvTHQ09AdIrv5S5VgJUU1OYCOnXbWgjZA/8pZAH2g+
 BREw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ycw4kh6uo5mWPlwHrkQbviI/KYMjUPq3rp+uHfdtBN8=;
 b=pRucNlD/cEzb0T2dH9I0va2nRLqBTnA+Zu7ljP7O55o/Lbu/8RhDGAs0zKus0w/1dh
 Cm5hVFmB8rImsKROHYV/NxIWEgfePpgyhCmoFCmOnltbcvp13pN1U4ryMYKaQMBJHbXi
 CJXA3pe3S4VYqbcDw7/FXNLkCLyjVNd/gtgaRjVEk2/Gg/cRFqIeDN5/MVBj9Cp3l2gs
 EPdIMNHh7qWzqs7eQixekR+JgvxmlBkDONwAzVTc+VawwCzEvoAGaX83OedxeAgVlV6L
 o+HdmGnXzzFQsxOfsbgHkgns1lWQU9hmghl388h7HHX4zutt/6EeIvUxjrrTbWPxu1Fz
 w0rg==
X-Gm-Message-State: AOAM531AwBOkSsbGcOXJK00/8bkmk7f5txN9GSAZNu2+PegFluMTLOJg
 wy1PY8p/NS1rWe8kstzee4kH+cR8ATvtQ1ehdiA=
X-Google-Smtp-Source: ABdhPJxDOzZh9ZxCV6hb/mMM8UpqW475cGLkyoKO6WoioK+ZUYE8oTQejvUEuqG3V1Cq8b3Lbb3PcktRVUC+7Y8yAPo=
X-Received: by 2002:a4a:8845:: with SMTP id e5mr11120361ooi.90.1616421539106; 
 Mon, 22 Mar 2021 06:58:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210318202414.10547-1-unixbhaskar@gmail.com>
 <3cc678f2-36d1-1af1-5759-37aea82f41ea@bombadil.infradead.org>
In-Reply-To: <3cc678f2-36d1-1af1-5759-37aea82f41ea@bombadil.infradead.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 22 Mar 2021 09:58:48 -0400
Message-ID: <CADnq5_Muaa7MLsiUL+pyV16_HuhKJg=jwS8FwCSvgWgGH11LvQ@mail.gmail.com>
Subject: Re: [PATCH V2] drm/amdgpu: Fix a typo
To: Randy Dunlap <rdunlap@bombadil.infradead.org>
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
Cc: Bhaskar Chowdhury <unixbhaskar@gmail.com>, "Chen,
 Guchun" <guchun.chen@amd.com>, Dave Airlie <airlied@linux.ie>,
 John Clements <John.Clements@amd.com>, Tao Zhou <tao.zhou1@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Huang Rui <ray.huang@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Jiansong Chen <Jiansong.Chen@amd.com>, "Deucher,
 Alexander" <alexander.deucher@amd.com>, Likun Gao <Likun.Gao@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Mar 20, 2021 at 3:52 AM Randy Dunlap
<rdunlap@bombadil.infradead.org> wrote:
>
>
>
> On Fri, 19 Mar 2021, Bhaskar Chowdhury wrote:
>
> > s/traing/training/
> >
> > ...Plus the entire sentence construction for better readability.
> >
> > Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
> > ---
> > Changes from V1:
> >  Alex and Randy's suggestions incorporated.
> >
> > drivers/gpu/drm/amd/amdgpu/psp_v11_0.c | 8 ++++----
> > 1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c b/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c
> > index c325d6f53a71..bf3857867f51 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c
> > @@ -661,10 +661,10 @@ static int psp_v11_0_memory_training(struct psp_context *psp, uint32_t ops)
> >
> >       if (ops & PSP_MEM_TRAIN_SEND_LONG_MSG) {
> >               /*
> > -              * Long traing will encroach certain mount of bottom VRAM,
> > -              * saving the content of this bottom VRAM to system memory
> > -              * before training, and restoring it after training to avoid
> > -              * VRAM corruption.
> > +              * Long training will encroach a certain amount on the bottom of VRAM;
> > +                 * save the content from the bottom VRAM to system memory
> > +                 * before training, and restore it after training to avoid
> > +                 * VRAM corruption.
>
> These 3 new lines are indented with spaces instead of tabs. Oops.  :(
>
> (I may be too late with this comment -- sorry about that.)

I fixed that up when I applied it.

Thanks,

Alex


>
> >                */
> >               sz = GDDR6_MEM_TRAINING_ENCROACHED_SIZE;
> >
> > --
> > 2.26.2
> >
> >
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
