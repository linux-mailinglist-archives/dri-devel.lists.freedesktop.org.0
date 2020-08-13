Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F2E243AF5
	for <lists+dri-devel@lfdr.de>; Thu, 13 Aug 2020 15:46:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 877E36E114;
	Thu, 13 Aug 2020 13:46:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3E666E114
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 13:46:00 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id a14so5343870wra.5
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 06:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=+mDarYxBbq/J7Ixc+CG3XEZjLyzyzKfnJvqheYjMPSo=;
 b=XYEFqrb5M5fB90DCMr82s6xu+3kUi6clBH3J28tKhMKeygyzSyUtxHNkRA/aXIPrip
 /KqR/1taagrKL2diCV5inDH2lOvvXlLdeLhm3SxNslPAp9BnkdXdUkeaPxLrV07LMk8F
 vnJEQrP2qAqie3vzkghqQtRDLvf8N2RATLMESMuSYNxOAendWUG/PVRbBlTNmYpRunj2
 NqA9kyuj7qTxop4DFEjiMJUfkzt8sIEUFt/eCzfIzJYShJ8cI35gx4jmzRgqBK4FEbgP
 nb9ccd1ky7aEbw2chQw5x5eD/J1I23/yWnTg2P0J1tgAo2d2umAFUtxPbYPA9gWBniYm
 b7hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+mDarYxBbq/J7Ixc+CG3XEZjLyzyzKfnJvqheYjMPSo=;
 b=Tbk4+mnabk//HRc0K7U8eKiSon+vEmAFvW4R4VccCqWmGelOH2QCFa5enF7SOaN5en
 1ObHtroqrCuMGSAGYjJmAfQ1cpzfYTUwgAvNtph/9L8kp4EBryPEWw3FUpJpQJ6TLher
 eI1bg09yRoNKplRmJwwaVMIPgETS2xAC7pnUgsaKvipuEPQaShdfEhRKnEs9Muo9B7s+
 hXg9TqwRpKNOziIlfOMVBekM8Bkn2TefaKi0p1OLFXpu1jp3iiVFh74oDU2ox3q/eNBj
 k7etHOpL/XyvUsqwda6JXPPgLVSD8XuAQbtSC1SVQqvS1V8gjUFvJzR6Id01gcBDi/2r
 kBww==
X-Gm-Message-State: AOAM531OVRG+czApEL1kfG19ySJID55fTO6DMoRqidSr1dZzi+eNlZWG
 Xl8Tbw/5tRTZ6dXUB/wT1D1mPQ==
X-Google-Smtp-Source: ABdhPJx7xfjEhBxs/ZAYptGT+NyxCdP60vku9IappFsc1k/bm/potYSblfH9oTAcEG9YnIt13D4dGw==
X-Received: by 2002:adf:ab46:: with SMTP id r6mr4167024wrc.260.1597326359282; 
 Thu, 13 Aug 2020 06:45:59 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id d14sm10603833wre.44.2020.08.13.06.45.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Aug 2020 06:45:57 -0700 (PDT)
Date: Thu, 13 Aug 2020 14:45:53 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Alexandru Stan <amstan@chromium.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Lee Jones <lee.jones@linaro.org>, Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>,
 linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Matthias Kaehlcke <mka@chromium.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: Re: [PATCH 2/3] backlight: pwm_bl: Artificially add 0% during
 interpolation
Message-ID: <20200813134553.2hykfvqjtgr4e2pl@holly.lan>
References: <20200721042522.2403410-1-amstan@chromium.org>
 <20200720212502.2.Iab4d2192e4cf50226e0a58d58df7d90ef92713ce@changeid>
 <20200807082113.GI6419@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200807082113.GI6419@phenom.ffwll.local>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 07, 2020 at 10:21:13AM +0200, daniel@ffwll.ch wrote:
> On Mon, Jul 20, 2020 at 09:25:21PM -0700, Alexandru Stan wrote:
> > Some displays need the low end of the curve cropped in order to make
> > them happy. In that case we still want to have the 0% point, even though
> > anything between 0% and 5%(example) would be skipped.
> > 
> > Signed-off-by: Alexandru Stan <amstan@chromium.org>
> > ---
> > 
> >  drivers/video/backlight/pwm_bl.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> > diff --git a/drivers/video/backlight/pwm_bl.c b/drivers/video/backlight/pwm_bl.c
> > index 5193a72305a2..b24711ddf504 100644
> > --- a/drivers/video/backlight/pwm_bl.c
> > +++ b/drivers/video/backlight/pwm_bl.c
> > @@ -349,6 +349,14 @@ static int pwm_backlight_parse_dt(struct device *dev,
> >  			/* Fill in the last point, since no line starts here. */
> >  			table[x2] = y2;
> >  
> > +			/*
> > +			 * If we don't start at 0 yet we're increasing, assume
> > +			 * the dts wanted to crop the low end of the range, so
> > +			 * insert a 0 to provide a display off mode.
> > +			 */
> > +			if (table[0] > 0 && table[0] < table[num_levels - 1])
> > +				table[0] = 0;
> 
> Isn't that what the enable/disable switch in backlights are for? There's
> lots of backligh drivers (mostly the firmware variety) where setting the
> backlight to 0 does not shut it off, it's just the lowest setting.
> 
> But I've not been involved in the details of these discussions.

It's been a long standing complaint that the backlight drivers are not
consistent w.r.t. whether 0 means off or lowest. The most commonly used
backlights (ACPI in particular) do not adopt 0 means off but lots of
specific drivers do.

IMHO what is "right" depends on the display technology. For displays
that are essentially black when the backlight is off and become
difficult or impossible to read I'm a little dubious about standardizing
on zero means off. There are situations when zero means off
does make sense however. For example front-lit or transflexive displays
are readable when the "backlight" is off and on these displays it would
make sense.


Daniel.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
