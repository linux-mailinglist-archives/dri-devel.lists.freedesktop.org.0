Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE1A275284
	for <lists+dri-devel@lfdr.de>; Wed, 23 Sep 2020 09:53:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 464C36E446;
	Wed, 23 Sep 2020 07:53:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 858096E2B4
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Sep 2020 19:10:12 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id x23so4490965wmi.3
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Sep 2020 12:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:mime-version:message-id:in-reply-to
 :references:user-agent:content-transfer-encoding;
 bh=BCfT5peibKcEc4ONnM5Xp9tYYHE/inek1beNGLpIHBU=;
 b=K07PcxANtHsYhBN8KOmGnD92cSLZOMptWzQOEU6KI9EWD+/fQsUI44uV7OGYg4mvq6
 +SVLXJQqhmk8bMIUJQxzJT+QCd/M3alRugXkPjeSCfoKQCpcBeLynfuwzcsrVuRf1lUx
 GVG0VjZRzS1d/EyNjTRE5l5cGiY8hiJwHJa14ItH4ON6OEXb7cwKKXnDNqKWJIcxUZEv
 kHQz+ZelJMaIOrNyJYe2PDabjHEulDiU/5G5SBrCGPvZ43ez+v3MkmYLsF0jIfQipd8D
 0nUn5xfmQIuYJt0hbjodugwAd6K0JtDNIGfzFbIPlRbesW53iD3OZJoEfedOJSmC8AOl
 H3lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:mime-version:message-id
 :in-reply-to:references:user-agent:content-transfer-encoding;
 bh=BCfT5peibKcEc4ONnM5Xp9tYYHE/inek1beNGLpIHBU=;
 b=kbFmFj6R71Teo3GvAdhBAPc6yXMr9I0y1qTdqHI+0TtB0Jraf2Nub4dwCfB52VdmzS
 CXCgCOrqMQTkNNQdUhOk2C0pGWjgAxEJfNfXbOZCqVcv2QiNkcYJST0DAe9U1Ey4Uylz
 RBBsWb4L5d+AZ3ZFBrd1e5OaTcW2gkRFJ6UjDlL6QSBMesvLlBUUPFR16aSHskSDBb81
 z8MuaLfglNHVJyzSAfJ88MlQZzWZ1ofPzLV4xdRz0mBv6EOvzsbc0vffNClUl3LGmKoi
 qC1cBOGxs3rVIOWDs8GLruR3Lj87dM+cc+/+QDsYg9VDZPkNijd6j0yz4nm0JdXqthU8
 /QjA==
X-Gm-Message-State: AOAM532tABra7z8hYQKKPDDDyDBB9TQJ1HTpyt6TWIQGh1UTWoBRqWEp
 PptySvROTbH9d7WPnEoVAu8=
X-Google-Smtp-Source: ABdhPJyH4AtgyLBjMWyiuVND4eO/wx9+NS4vqioqipO6uwuuFSfiL63Eb8iQ84cYBGkr7RKL9i5GsA==
X-Received: by 2002:a1c:32c6:: with SMTP id y189mr2648732wmy.51.1600801810970; 
 Tue, 22 Sep 2020 12:10:10 -0700 (PDT)
Received: from localhost ([170.253.46.69])
 by smtp.gmail.com with ESMTPSA id c4sm6014814wme.27.2020.09.22.12.10.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Sep 2020 12:10:09 -0700 (PDT)
From: Vicente Bergas <vicencb@gmail.com>
To: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH 1/3] drm: rockchip: hdmi: remove
 =?iso-8859-1?Q?vop=5Fcrtc=5Fmode=5Ffixup_to_fix_clock_handling?=
Date: Tue, 22 Sep 2020 21:10:07 +0200
MIME-Version: 1.0
Message-ID: <1af700b8-c4fb-4f3f-b56b-2602cb620aca@gmail.com>
In-Reply-To: <CAD=FV=WfJJ4Tr4WZnFuUtz=XS1jHAUDfgnwy6qjyJ6iektTGDA@mail.gmail.com>
References: <20200921181803.1160-1-vicencb@gmail.com>
 <20200921181803.1160-2-vicencb@gmail.com>
 <76b8f420-2afb-eba9-5c98-6f10762c4b37@rock-chips.com>
 <1ada2daf-16f3-191f-ccc1-d3d7d0c319fc@rock-chips.com>
 <CAAMcf8Az5AVWNzMHuxXda5WUm4_E5QCwpgb2fVtaT0w2+cQELw@mail.gmail.com>
 <bd2d67ee-4023-ccde-3b2a-e88c3e076d12@rock-chips.com>
 <CAD=FV=Xv+CZhvXc583VTR2HpSEtkpho3aV5qG5_1-tKFgw_vaQ@mail.gmail.com>
 <CAAMcf8Btd4iTAVXXKd6knJdBcufTrKiX5UPas9ugV01p1ffHpg@mail.gmail.com>
 <CAD=FV=WfJJ4Tr4WZnFuUtz=XS1jHAUDfgnwy6qjyJ6iektTGDA@mail.gmail.com>
User-Agent: Trojita
X-Mailman-Approved-At: Wed, 23 Sep 2020 07:53:20 +0000
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
Cc: crj <algea.cao@rock-chips.com>, David Airlie <airlied@linux.ie>,
 Sandy Huang <hjc@rock-chips.com>, dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Andy Yan <andy.yan@rock-chips.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tuesday, September 22, 2020 5:26:17 PM CEST, Doug Anderson wrote:
> Hi,
>
> On Tue, Sep 22, 2020 at 7:52 AM Vicente Bergas <vicencb@gmail.com> wrote:
>> On Tue, Sep 22, 2020 at 4:28 PM Doug Anderson 
>> <dianders@chromium.org> wrote: ...
>
> Here's the code:
>
>   rate = clk_round_rate(vop->dclk, adjusted_mode->clock * 1000 + 999);
>   adjusted_mode->clock = DIV_ROUND_UP(rate, 1000);
>
> Input clock is in kHz and DRM always rounds down (last I checked--I
> guess you could confirm if this is still true).
>
> Imagine that you want an input clock of 999999 kHz and the PLL can
> actually make this.
>
> DRM will request a clock of 999 kHz because it always rounds down.
>
> First:
>   rate = 999 * 1000 + 999 = 999999 Hz
>
> Now we'll ask the clock framework if it can make this.  It can, so
> clk_round_rate() will return 999999 kHz.  Note that, at least on all
> Rockchip platforms I looked at in the past, clk_round_rate() and
> clk_set_rate() always round down.  Thus, if we _hadn't_ added the 999
> here we would not have gotten back 999999 Hz.
>
> We have to return a rate in terms of kHz.  While we could round down
> like DRM does, it seemed better at the time to do the rounding here.
> Thus, I now rounded up.  We should end up storing
>
>   (999999 + 999) / 1000 = 1000 kHz
>
> Then, when we use it in vop_crtc_atomic_enable() we don't have to do
> any more rounding.
>
> I guess it's possible that the problem is that the function is
> starting with an input where it knows that "adjusted_mode->clock" was
> rounded down and it ends with it rounded up.  That shouldn't cause
> problems unless somehow the function is being called twice or someone
> else is making assumptions about the rounding.  You could,
> potentially, change this to:
>
>   adjusted_mode->clock = rate / 1000;
>
> ...and then in vop_crtc_atomic_enable() you add the "999" back in, like:
>
>   clk_set_rate(vop->dclk, adjusted_mode->clock * 1000 + 999);
>
> That would make it more consistent / stable.  Does it work for you?

Hi Douglas,

i've tested this as suggested:
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
@@ -1181,7 +1181,7 @@
 	 *    this in the actual clk_set_rate().
 	 */
 	rate = clk_round_rate(vop->dclk, adjusted_mode->clock * 1000 + 999);
-	adjusted_mode->clock = DIV_ROUND_UP(rate, 1000);
+	adjusted_mode->clock = rate / 1000;
 
 	return true;
 }
@@ -1380,7 +1380,7 @@
 
 	VOP_REG_SET(vop, intr, line_flag_num[0], vact_end);
 
-	clk_set_rate(vop->dclk, adjusted_mode->clock * 1000);
+	clk_set_rate(vop->dclk, adjusted_mode->clock * 1000 + 999);
 
 	VOP_REG_SET(vop, common, standby, 0);
 	mutex_unlock(&vop->vop_lock);
and it also works fine.
Should i sent a V2 of this patch series including your approach?

For completeness i've added some printks to the original code to show the
clock values:
1.- Provided adjusted_mode->clock
adjusted_mode->clock (before) = 148500KHz
rate = 148500998Hz
adjusted_mode->clock (after) = 148501KHz <= this is the problematic clock

2.- Overwrite adjusted_mode->clock with the comment's value of 60000.001KHz
adjusted_mode->clock (before) = 60000KHz
rate = 60000998Hz
adjusted_mode->clock (after) = 60001KHz

3.- Overwrite adjusted_mode->clock with your mentioned value of 999.999KHz
adjusted_mode->clock (before) = 999KHz
rate = 999999Hz
adjusted_mode->clock (after) = 1000KHz

Regards,
  Vicente.

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
