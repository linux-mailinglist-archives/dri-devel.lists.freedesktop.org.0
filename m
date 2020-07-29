Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CFECF231A4B
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jul 2020 09:26:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C8F96E463;
	Wed, 29 Jul 2020 07:26:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC1D56E463
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jul 2020 07:26:08 +0000 (UTC)
Received: by mail-oi1-x242.google.com with SMTP id y22so19895887oie.8
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jul 2020 00:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dDmmebkXIz4CjLiFs9kSGs/6GlucFeZ7qPJxtjmG4sA=;
 b=IZlhPDfY6bld0s6GMWo7mrYppG162jxfqsGG5h60rx90fVE1Q/X7tVUH2nzrp4yk1Z
 riMb3hViLjhGc25J41okCk+gUPWr2KPAQK0YbOtlwvH8dVlNu0DrKz98jRbJeqOyfdc5
 V6gyhGAvxs+tO64kWF8AH+le5f+EnYvb3dsXQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dDmmebkXIz4CjLiFs9kSGs/6GlucFeZ7qPJxtjmG4sA=;
 b=ftBbeO27vH+/9pi9vTBCshW9ZVoWBVLMWFRnEuWvy0c1CxxstWGe78fgLUTTt+KA71
 2GVjng0+g8rCX298hQX3LTcCiIRYaZtO2vFNzZwXnkclAFoSFnTg51MAhfVA/YnHhjQG
 R/6wgdLgOKbl3kLjUkfNAV2knZMeUHJyxCJDIWAuP44gOho1ZztIEiJOeu2KjdsSu1z3
 5oDVYgTjvn2ObvhCPlEVsN2vElWvxPL57QLbZ0zAGAl+spqPuPKKQcVY1ksx9n5QYJ6F
 4Ew+Y5qsRQP5rakY+GqZmMadb4AuGW4O1F4yxw+7p1rgg8caKtn+KGKQH+lCtU83oFeC
 V3rQ==
X-Gm-Message-State: AOAM533P4aTku/lTe4DC7SCzqTZyeWx0ZsMtvFXnWvTusU6kjbY00I2j
 WJl8cT4pHWEYlEXHrFC0c8Oj7zhl/tYTzkMIpD5nwA==
X-Google-Smtp-Source: ABdhPJyeoc7J2ZuPX6yN1xkaadXh+SXP0p+C+fIAhj+NB33LrYWtHdKkCD1jXJiQnKbwCMIwIq63lFM2VlygcOWgyII=
X-Received: by 2002:aca:da03:: with SMTP id r3mr6666859oig.14.1596007568182;
 Wed, 29 Jul 2020 00:26:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200725063429.172139-1-weiyongjun1@huawei.com>
 <20200728220205.GJ6419@phenom.ffwll.local>
 <20200728223543.GU13753@pendragon.ideasonboard.com>
 <20200729002944.GA11598@xilinx.com>
In-Reply-To: <20200729002944.GA11598@xilinx.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 29 Jul 2020 09:25:57 +0200
Message-ID: <CAKMK7uEKRrfHzmZ2mh++bQTmNeBuhpKsz2K2b83oM0SXBMOGFg@mail.gmail.com>
Subject: Re: [PATCH -next] drm: xlnx: Fix typo in parameter description
To: Hyun Kwon <hyun.kwon@xilinx.com>
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
Cc: David Airlie <airlied@linux.ie>,
 "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Hulk Robot <hulkci@huawei.com>, Michal Simek <michals@xilinx.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 29, 2020 at 2:33 AM Hyun Kwon <hyun.kwon@xilinx.com> wrote:
>
> Hello,
>
> On Tue, Jul 28, 2020 at 03:35:43PM -0700, Laurent Pinchart wrote:
> > On Wed, Jul 29, 2020 at 12:02:05AM +0200, daniel@ffwll.ch wrote:
> > > Hi Hyun Kwon,
> > >
> > > Are you all sorted with drm-misc commit rights so you can push the 3
> > > (maybe there's more) xlnx fixup patches to drm-misc-next-fixes?
> >
> > Thanks Daniel for bringing this up.
> >
> > Hyun, would that work for you ?
> >
>
> Should I commit small fixups directly to,
> https://cgit.freedesktop.org/drm/drm-misc/log/?h=drm-misc-next-fixes?

Well these patches right now need to go there, but that's not always
the case. We have a flowchart for that now:

https://drm.pages.freedesktop.org/maintainer-tools/committer-drm-misc.html#where-do-i-apply-my-patch

> I received the account for drm-misc a couple years ago, and was able to access
> back then. But now someting has changed, and I can't access at the moment. I'll
> need some time to fix my setup. Maybe some help would be appreciated to speed
> up. I may ping you offline if you don't mind.

Sure, happy to help out.
-Daniel

>
> Thanks,
> -hyun
>
> > > On Sat, Jul 25, 2020 at 06:34:29AM +0000, Wei Yongjun wrote:
> > > > Fix typo in parameter description.
> > > >
> > > > Fixes: d76271d22694 ("drm: xlnx: DRM/KMS driver for Xilinx ZynqMP DisplayPort Subsystem")
> > > > Reported-by: Hulk Robot <hulkci@huawei.com>
> > > > Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> > > > ---
> > > >  drivers/gpu/drm/xlnx/zynqmp_dp.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> > > > index 821f7a71e182..3d53638ab15e 100644
> > > > --- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
> > > > +++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> > > > @@ -44,7 +44,7 @@ MODULE_PARM_DESC(aux_timeout_ms, "DP aux timeout value in msec (default: 50)");
> > > >   */
> > > >  static uint zynqmp_dp_power_on_delay_ms = 4;
> > > >  module_param_named(power_on_delay_ms, zynqmp_dp_power_on_delay_ms, uint, 0444);
> > > > -MODULE_PARM_DESC(aux_timeout_ms, "DP power on delay in msec (default: 4)");
> > > > +MODULE_PARM_DESC(power_on_delay_ms, "DP power on delay in msec (default: 4)");
> > > >
> > > >  /* Link configuration registers */
> > > >  #define ZYNQMP_DP_LINK_BW_SET0x0
> >
> > --
> > Regards,
> >
> > Laurent Pinchart



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
