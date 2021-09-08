Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1577A403B6A
	for <lists+dri-devel@lfdr.de>; Wed,  8 Sep 2021 16:22:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11D766E0F0;
	Wed,  8 Sep 2021 14:22:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB44E6E0F0;
 Wed,  8 Sep 2021 14:22:26 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id n24so3437849ion.10;
 Wed, 08 Sep 2021 07:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YpdBvQHElQQMTNbuBwkHS1EwYa93WjW1ptFmOObW2Xw=;
 b=IA+yYcV3lrwLM0feMjVIJieiMAU0XNB/HFLzY2A5TzPYgPoXoPsc7hFBlZ1dNFRT+L
 whiebHATH0j5SnEd4lwNEoYYqtnminOZ/+/guARgLywB57EQpYVhAopw3vhc/thO42uL
 zxXSslYCLF1t25LM8VsTYVipsZbuIYFCPsCvsVWF1uyBlA0fiCWpIdry2seOLCEeKWwo
 uXdDZ5dEKM3o736PeLoDhy/NAS7AO85Rzl9HGX6qxp/dANyX+9364yVr1O1dhiRmP0KA
 NXnlFxIXdpWik2j8m3qyG7OkjLL91wEPJT6RiPe5pLfHVZakKi476sTmScQEVf4h3YvY
 +eDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YpdBvQHElQQMTNbuBwkHS1EwYa93WjW1ptFmOObW2Xw=;
 b=fOaaxxIhsAc961+qFddLoEgRJjnap5TdHAZj6mOZazNSL1y2uGpQ+hXd+kjqX5xWfA
 r5/Gm8PPVKeWTrvNNDJn09l4CCkNAGCb6zzT9Sxk09fQNerjvIJeNBm4Pcng9+PTet8t
 n7UCQ7MlUO6H/7ssZOWL4fjgFf2zXgpdVsfCoM+ZMwAGB+bzjKaCHqpQ0ABbTdTFPx+v
 3z0i9HRd4F3E8KoNC4CnnP8bKSGGBdIjLexIocHNjyrthVb05dzpNG8pT9VOFdkwEE7U
 m4EIicEzcaEN7kGO5vM9+3YzGyzhLVEvR4BrptMpUrIATN9BPUiGuQK9QFdVwUh01hrE
 z4+w==
X-Gm-Message-State: AOAM5334HDecm0Hk+aeJgF6SHHVquPcjusREFhPCUkuMs/WvYVN4zWPP
 f+Q/3i9Q19zwlFqssZFWmYtxdN1WjD9o8bGZ1A0=
X-Google-Smtp-Source: ABdhPJyI/7ApcpbBgb+r9bxjYHvbYNE2+8+uKXOYdImqu4lLCliR7ctiq7PlopceQaBnnrce+6hzXGm/HJ9S1fqsSbU=
X-Received: by 2002:a6b:7a03:: with SMTP id h3mr83894iom.39.1631110946133;
 Wed, 08 Sep 2021 07:22:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210901181138.1052653-1-angelogioacchino.delregno@somainline.org>
 <20210901181138.1052653-2-angelogioacchino.delregno@somainline.org>
 <CAOCk7NoOdjxp0vxu9XJzYsi7a04kpqpTOZHm42ApAN3MqkqtDw@mail.gmail.com>
 <CAA8EJpp6tj10A0QUR1E75t7BZf2Y3jHUyVNniYhEUd9rXj8Vrg@mail.gmail.com>
In-Reply-To: <CAA8EJpp6tj10A0QUR1E75t7BZf2Y3jHUyVNniYhEUd9rXj8Vrg@mail.gmail.com>
From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date: Wed, 8 Sep 2021 08:22:15 -0600
Message-ID: <CAOCk7NqhuCJqh-u6ke=Mn=EPgHnc7C2RS_X1nSCg_Nc8An=yPA@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH 2/3] drm/msm/dpu1: Add MSM8998 to hw catalog
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Dave Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, Abhinav Kumar <abhinavk@codeaurora.org>, 
 Rob Herring <robh+dt@kernel.org>, MSM <linux-arm-msm@vger.kernel.org>, 
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>, 
 freedreno <freedreno@lists.freedesktop.org>,
 lkml <linux-kernel@vger.kernel.org>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Martin Botka <martin.botka@somainline.org>, 
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 paul.bouchara@somainline.org, DTML <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
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

On Wed, Sep 8, 2021 at 2:26 AM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Hi,
>
> On Tue, 7 Sept 2021 at 22:13, Jeffrey Hugo <jeffrey.l.hugo@gmail.com> wrote:
> >
> > On Wed, Sep 1, 2021 at 12:11 PM AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@somainline.org> wrote:
> > >
> > > Bringup functionality for MSM8998 in the DPU, driver which is mostly
> > > the same as SDM845 (just a few variations).
> > >
> > > Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> >
> > I don't seem to see a cover letter for this series.
> >
> > Eh, there are a fair number of differences between the MDSS versions
> > for 8998 and 845.
> >
> > Probably a bigger question, why extend the DPU driver for 8998, when
> > the MDP5 driver already supports it[1]?  The MDP/DPU split is pretty
> > dumb, but I don't see a valid reason for both drivers supporting the
> > same target/display revision.  IMO, if you want this support in DPU,
> > remove it from MDP5.
> >
> > [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?h=v5.14&id=d6c7b2284b14c66a268a448a7a8d54f585d38785
>
> I don't think that we should enforce such requirements. Having support
> both in MDP5 and DPU would allow one to compare those two drivers,
> performance, features, etc.
> It might be that all MDP5-supported hardware would be also supported
> by DPU, thus allowing us to remove the former driver. But until that
> time I'd suggest leaving support in place.

Well, then you have a host of problems to solve.

Lets ignore the code duplication for a minute and assume we've gone
with this grand experiment.  Two drivers enter, one leaves the victor.

How are the clients supposed to pick which driver to use in the mean
time?  We already have one DT binding for 8998 (which the MDP5 driver
services).  This series proposes a second.  If we go forward with what
you propose, we'll have two bindings for the same hardware, which IMO
doesn't make sense in the context of DT, and the reason for that is to
select which driver is "better".  Driver selection is not supposed to
be tied to DT like this.

So, some boards think MDP5 is better, and some boards think DPU is
better.  At some point, we decide one of the drivers is the clear
winner (lets assume DPU).  Then what happens to the existing DTs that
were using the MDP5 description?  Are they really compatible with DPU?

From a DT perspective, there should be one description, but then how
do you pick which driver to load?  Both can't bind on the single
description, and while you could argue that the users should build one
driver or the other, but not both (thus picking which one at build
time), that doesn't work for distros that want to build both drivers
so that they can support all platforms with a single build (per arch).

From where I sit, your position starts with a good idea, but isn't
fully thought out and leads to problems.

If there is some reason why DPU is better for 8998, please enumerate
it.  Does DPU support some config that MDP5 doesn't, which is valuable
to you?  I'm ok with ripping out the MDP5 support, the reason I didn't
go with DPU was that the DPU driver was clearly written only for 845
at the time, and needed significant rework to "downgrade" to an
earlier hardware.  However, the "reason" DPU exists separate from MDP5
is the claim that the MDP hardware underwent a significant
rearchitecture, and thus it was too cumbersome to extend MDP5.  While
I disagree with the premise, that "rearch" started with 8998.
