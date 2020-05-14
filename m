Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DAAA71D3E5D
	for <lists+dri-devel@lfdr.de>; Thu, 14 May 2020 22:03:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F82B6E043;
	Thu, 14 May 2020 20:03:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68E566E043
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 20:03:54 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id m12so27182230wmc.0
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 13:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=0T9FZKzhaNIAyAMhurXfRjBv09XxUrY4eeMiZKg77EU=;
 b=VAIiWBZd2orVmWNlsBdww0kQaG/rvtc7vet7nyyZlSVy3XFuYBQVE80Glibbmi1Q/H
 P7xZZPm/sIwfTWY1GifVPJ6d0KCv5ZLDS22MX0SAdwHCH6ahi3ME03a3kF/lqQvAxdpl
 XDNuG1qZ6i5qtfURURGheV0H/P+nYP3ryGwSk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0T9FZKzhaNIAyAMhurXfRjBv09XxUrY4eeMiZKg77EU=;
 b=LYb60VbeDAABNusWPQz4qKqOzPdLA0Ljtgp+rwkqEhlYVM0q3bJtv8vtf4kUCVI9v3
 eZ5lDrzMgjzQtNPACUx2sOwYux4yqqXt0JKfaj0DaPE2pUprIReKqbjYdXKVBW1ZYhpl
 eUT70b6QKWFqZJ+CYWmjQHJBZbBXICI/83LwmppcCl9VLTdGazyAAEfu8WX9vGteicfn
 no52tv0Ufbf/y8cq6m/7Xx4+erzi8pc2TmI0G/vLIss50+VUncAa/xRVo2iDS9k1KEKa
 yZI5MrSiYElSMY5FqH9pi6zK+yMc74+VWtxytSi/6XghA7Bd2EERSXdyGEbq7ABne5dV
 4bLQ==
X-Gm-Message-State: AOAM530iS64pNAo3C+smN8fX+tdTGNS18u7tTaMUjO8P2HCdxNMv7x0R
 H/Oz5m4XgCtarNfNndFKTR9hmw==
X-Google-Smtp-Source: ABdhPJyYd+AOcu5tx+w8CHn4dey+W+3+gPxvcA9FEiyAuntQNRmQiufc1W5mxesih8+QEvnI7mVCfQ==
X-Received: by 2002:a1c:c309:: with SMTP id t9mr14300wmf.113.1589486633043;
 Thu, 14 May 2020 13:03:53 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id q14sm18882wrc.66.2020.05.14.13.03.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 May 2020 13:03:52 -0700 (PDT)
Date: Thu, 14 May 2020 22:03:49 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v1 08/18] backlight: add backlight_is_blank()
Message-ID: <20200514200349.GD206103@phenom.ffwll.local>
References: <20200514191001.457441-1-sam@ravnborg.org>
 <20200514191001.457441-9-sam@ravnborg.org>
 <20200514194116.GB206103@phenom.ffwll.local>
 <20200514194646.GA460099@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200514194646.GA460099@ravnborg.org>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 Kefeng Wang <wangkefeng.wang@huawei.com>,
 Douglas Anderson <dianders@chromium.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Lee Jones <lee.jones@linaro.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Jonathan Corbet <corbet@lwn.net>, Russell King <linux@armlinux.org.uk>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Uwe Kleine Konig <u.kleine-koenig@pengutronix.de>, linux-pwm@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Michael Hennerich <michael.hennerich@analog.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jani Nikula <jani.nikula@intel.com>, linux-arm-msm@vger.kernel.org,
 Jyri Sarha <jsarha@ti.com>, Thomas Gleixner <tglx@linutronix.de>,
 Allison Randal <allison@lohutok.net>,
 Support Opensource <support.opensource@diasemi.com>,
 Jingoo Han <jingoohan1@gmail.com>, Andy Gross <agross@kernel.org>,
 Zheng Bin <zhengbin13@huawei.com>, patches@opensource.cirrus.com,
 Enrico Weigelt <info@metux.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 14, 2020 at 09:46:46PM +0200, Sam Ravnborg wrote:
> Hi Daniel.
> 
> On Thu, May 14, 2020 at 09:41:16PM +0200, Daniel Vetter wrote:
> > On Thu, May 14, 2020 at 09:09:51PM +0200, Sam Ravnborg wrote:
> > > The backlight support has two properties that express the state:
> > > - power
> > > - state
> > > 
> > > It is un-documented and easy to get wrong.
> > > Add backlight_is_blank() helper to make it simpler for drivers
> > > to get the check of the state correct.
> > > 
> > > A lot of drivers also includes checks for fb_blank.
> > > This check is redundant when the state is checked
> > > as thus not needed in this helper function.
> > > Rolling out this helper to all relevant backlight drivers
> > > will eliminate almost all accesses to fb_blank.
> > > 
> > > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> > > Cc: Lee Jones <lee.jones@linaro.org>
> > > Cc: Daniel Thompson <daniel.thompson@linaro.org>
> > > Cc: Jingoo Han <jingoohan1@gmail.com>
> > > ---
> > >  include/linux/backlight.h | 17 +++++++++++++++++
> > >  1 file changed, 17 insertions(+)
> > > 
> > > diff --git a/include/linux/backlight.h b/include/linux/backlight.h
> > > index b7839ea9d00a..e67e926de1e2 100644
> > > --- a/include/linux/backlight.h
> > > +++ b/include/linux/backlight.h
> > > @@ -165,6 +165,23 @@ static inline int backlight_disable(struct backlight_device *bd)
> > >  	return backlight_update_status(bd);
> > >  }
> > >  
> > > +/**
> > > + * backlight_is_blank - Return true if display is expected to be blank
> > > + * @bd: the backlight device
> > > + *
> > > + * Display is expected to be blank if any of these is true::
> > > + *
> > > + *   1) if power in not UNBLANK
> > > + *   2) if state indicate BLANK or SUSPENDED
> > > + *
> > > + * Returns true if display is expected to be blank, false otherwise.
> > > + */
> > > +static inline bool backlight_is_blank(struct backlight_device *bd)
> > > +{
> > > +	return bd->props.power != FB_BLANK_UNBLANK ||
> > > +	       bd->props.state & (BL_CORE_SUSPENDED | BL_CORE_FBBLANK);
> > 
> > This definition here doesn't match backlight_enabled/disable() functions
> > we added. I think to avoid lots of pondering and surprises we should try
> > to make sure these are all matching, so that once we rolled them out
> > everywhere, we can just replace the complicated state with one flag.
> 
> Will add it in v2. When all user of fb_blank is dropped we can
> safely remove it then.
> And as you said on irc, the risk of introducing regressions is lower
> as we see some creative uses in the drivers today.
> I already did some kind of audit - but I may have missed something.

btw one pattern I've seen in a few places with a few greps I've just done
is maybe worth putting into a helper too:

backlight_force_enable(bl)
{
	if (bl->brightness == 0)
		bl->brightness = bl->max_brightness;
	backlight_enable(backlight);
}

Just in case you run out of ideas anytime soon :-)

Cheers, Daniel

> 
> 	Sam
> 
> > 
> > > +}
> > > +
> > >  extern struct backlight_device *backlight_device_register(const char *name,
> > >  	struct device *dev, void *devdata, const struct backlight_ops *ops,
> > >  	const struct backlight_properties *props);
> > > -- 
> > > 2.25.1
> > > 
> > 
> > -- 
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
