Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B5F65A5D12
	for <lists+dri-devel@lfdr.de>; Tue, 30 Aug 2022 09:37:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14C9210E8A2;
	Tue, 30 Aug 2022 07:37:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 959B610E853
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Aug 2022 07:36:59 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 h11-20020a17090a470b00b001fbc5ba5224so11013415pjg.2
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Aug 2022 00:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=mW0Ka0BY8O9KwOHEGKvdoQs1XCAF6flhw+El+K+1goY=;
 b=cPxrekHtixkCW7rsobHtN/up2/yx+UckIYflRTNPufG9p3vLSUbFzBJS0YTNDoSQPO
 sx4uYsTBnSdLTwIt3e68ztYDYVCWWkZssCfhLhxOcCE5PhRCWsDPscM4YL2pd9pydPsE
 l4aolK5F6lm8ywsN01CX/uhbcy5T7cpEaBloDNqF44vK5L0xkXLrRoValUA11xegbMRF
 7dQdUaB5svhaIM4qiVkTV05kYcqHNuKUscTl2TCkijeGFUQqAGdKeDL0JEKKC9fcnbDY
 zDjqdnHgMzPNj/xROZamnyjTl+uFaNGjc2J3iawdAT8ZxAC3WderXbWLKd62ySNvBYm+
 Z/PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=mW0Ka0BY8O9KwOHEGKvdoQs1XCAF6flhw+El+K+1goY=;
 b=yE0GucJwmnfV2cJvY8w8LWSRzkGaPXncgiWa8AbitiHzPSHdvXRkuAp6mZddGUkMPt
 OVdM8n56KvgIMMX34ea+DyVt79SvEc6T1X2HbR8WJiJl1Hojqi1t8L99gZF5H+YUD4Gt
 8fd835aV9dELyZuizCo/SFTKioDjDrK4I3IETXP1pgOjT2/2F9Kg4FWqJQ1pGOLvRnPT
 iDNi0nK7tG1CincumOcIPIzPClZpGKX3tXTNEdCnKvnW7G8Dcfx6Sy1hzGnSXRWhQJcc
 98UAU3i9UsEd/xtY3sOcyDYMZBr23J5AFS5W7bRTopC+DNH+Duj+YTCL0KaAWdVPVynz
 t9jw==
X-Gm-Message-State: ACgBeo0Kt/OhdYLpdaGboJkL1I8pWOoEBnHPRKM6P4ChjAOUyO7JJcH6
 Yzap6B9y31JAEPVe/7mUaGjUN00ou+LCnsmUlw==
X-Google-Smtp-Source: AA6agR6AktxFKg4sYEz+T2ZcPFmq/8NnPqYEz8hav2t453LIvDiMGEJ//Bin3+mAW3vHW4491Gs4SD3q8r/5RJsDNFo=
X-Received: by 2002:a17:90b:3b41:b0:1fb:5376:fb06 with SMTP id
 ot1-20020a17090b3b4100b001fb5376fb06mr22210009pjb.240.1661845018775; Tue, 30
 Aug 2022 00:36:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220716081304.2762135-1-zheyuma97@gmail.com>
 <CAG3jFytOyhy_es2cULpp0TCdp70HTcqKo1hd-ZxVaC4O-vi-3w@mail.gmail.com>
In-Reply-To: <CAG3jFytOyhy_es2cULpp0TCdp70HTcqKo1hd-ZxVaC4O-vi-3w@mail.gmail.com>
From: Zheyu Ma <zheyuma97@gmail.com>
Date: Tue, 30 Aug 2022 15:36:47 +0800
Message-ID: <CAMhUBj=8a2w5HcACB96wxyjja_kaUg8ZtCNwWv8cqGQsG814Fg@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: megachips: Fix a null pointer dereference bug
To: Robert Foss <robert.foss@linaro.org>
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
Cc: martyn.welch@collabora.co.uk, narmstrong@baylibre.com, airlied@linux.ie,
 DRI Development <dri-devel@lists.freedesktop.org>, peter.senna@gmail.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 jernej.skrabec@gmail.com, jonas@kwiboo.se, Laurent.pinchart@ideasonboard.com,
 andrzej.hajda@intel.com, martin.donnelly@ge.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Robert,


On Mon, Aug 29, 2022 at 11:03 PM Robert Foss <robert.foss@linaro.org> wrote:
>
> On Sat, 16 Jul 2022 at 10:13, Zheyu Ma <zheyuma97@gmail.com> wrote:
> >
> > When removing the module we will get the following warning:
> >
> > [   31.911505] i2c-core: driver [stdp2690-ge-b850v3-fw] unregistered
> > [   31.912484] general protection fault, probably for non-canonical address 0xdffffc0000000001: 0000 [#1] PREEMPT SMP KASAN PTI
> > [   31.913338] KASAN: null-ptr-deref in range [0x0000000000000008-0x000000000000000f]
> > [   31.915280] RIP: 0010:drm_bridge_remove+0x97/0x130
> > [   31.921825] Call Trace:
> > [   31.922533]  stdp4028_ge_b850v3_fw_remove+0x34/0x60 [megachips_stdpxxxx_ge_b850v3_fw]
> > [   31.923139]  i2c_device_remove+0x181/0x1f0
> >
> > The two bridges (stdp2690, stdp4028) do not probe at the same time, so
> > the driver does not call ge_b850v3_resgiter() when probing, causing the
> > driver to try to remove the object that has not been initialized.
> >
> > Fix this by checking whether both the bridges are probed.
> >
> > Signed-off-by: Zheyu Ma <zheyuma97@gmail.com>
> > ---
> >  drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
> > index cce98bf2a4e7..c68a4cdf4625 100644
> > --- a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
> > +++ b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
> > @@ -296,7 +296,9 @@ static void ge_b850v3_lvds_remove(void)
> >          * This check is to avoid both the drivers
> >          * removing the bridge in their remove() function
> >          */
> > -       if (!ge_b850v3_lvds_ptr)
> > +       if (!ge_b850v3_lvds_ptr ||
> > +               !ge_b850v3_lvds_ptr->stdp2690_i2c ||
> > +               !ge_b850v3_lvds_ptr->stdp4028_i2c)
>
> This chunk fails checkpatch --strict.
>
> Alignment should match open parenthesis
> #39: FILE: drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c:300:

Thanks for your suggestion, I've sent the version 2 patch.

Regards,

Zheyu Ma
