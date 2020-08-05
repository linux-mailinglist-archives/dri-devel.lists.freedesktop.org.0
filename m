Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB0423C6CF
	for <lists+dri-devel@lfdr.de>; Wed,  5 Aug 2020 09:16:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 847D86E4F8;
	Wed,  5 Aug 2020 07:16:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 885536E4F8
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Aug 2020 07:16:43 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id c80so4841847wme.0
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Aug 2020 00:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=bsAWe51LRmhttaN+jreBKLb/W+iUzuar0hPXkyOXdPE=;
 b=Up1cszkKBtCfUaYcQOEexHRr2eLVq4UnS8ykcMDwHopDK303vPXlGmbuEQkBH2O7DE
 hkf9jdAJdZ3wPjsSflqq1YBMPe1pQWY2ImXrKZLytbSngVccUJinQ9ErBJWhGdzRsuqi
 ew3+zmj9vNCriF/uyJbSbXzqoP58PWwbkGu54=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=bsAWe51LRmhttaN+jreBKLb/W+iUzuar0hPXkyOXdPE=;
 b=Xn1f3szDd7ezWcBWLyWJgiZ/JfXosl1yczEdCbnBGwL+SVdQgPueZr72NsAsA9pXQY
 hdeHDBMFz3IiguclrboKU4grc3t6+EqoMIN4ioE3PyayvR6toeikGNjb5JYVzmByEF1o
 OGnr9RhjoLUwHFqtiwU4zSOYRwLd/W2yZLevldPrj1++yq0picJFKA0pnOF/+r3oYjzO
 uvzVB9I5eIY7k+v1FmLV6//WBQPFCG/VQwOHQd8gsdYpRWufw84BFadFkmFnSbIcTjFu
 QpV+YGqIjVkUWxYNP/h4BgU+rugUF06WZbII1bLz2uH4NE1fyVaU/cTd8d9zCIKnWDAQ
 b0YQ==
X-Gm-Message-State: AOAM53215Z1OGNX+Rg7OCtGLM4nSQzWOTZzr/VNO1yTIx2SVYhFAez1T
 FEChmVYExDLXY+eTpNd2wAfNBg==
X-Google-Smtp-Source: ABdhPJwcDo/Z9KsraUHYacJ1dMZg654FY2aBMeCnWIyggXS5LA0TkUPh++mNabuyCXT2TOrsPZi5tw==
X-Received: by 2002:a05:600c:22c8:: with SMTP id
 8mr1823804wmg.143.1596611802090; 
 Wed, 05 Aug 2020 00:16:42 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id c4sm1488676wrt.41.2020.08.05.00.16.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Aug 2020 00:16:41 -0700 (PDT)
Date: Wed, 5 Aug 2020 09:16:39 +0200
From: daniel@ffwll.ch
To: 
Subject: Re: [PATCH v1 03/22] backlight: Add get/set operations for
 brightness/power properties
Message-ID: <20200805071639.GS6419@phenom.ffwll.local>
References: <20200802110636.1018743-1-sam@ravnborg.org>
 <20200802110636.1018743-4-sam@ravnborg.org>
 <20200804164330.GL6419@phenom.ffwll.local>
 <20200804195600.GA686651@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200804195600.GA686651@ravnborg.org>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 04, 2020 at 09:56:00PM +0200, Sam Ravnborg wrote:
> Hi Daniel et al.
> On Tue, Aug 04, 2020 at 06:43:30PM +0200, daniel@ffwll.ch wrote:
> > On Sun, Aug 02, 2020 at 01:06:17PM +0200, Sam Ravnborg wrote:
> > > Add get and set operations to incapsualte access to backlight properties.
> > > 
> > > One easy win is that the get/set operatiosn can be used when backlight
> > > is not included in the configuration, resulting in simpler code with
> > > less ifdef's and thus more readable code.
> > > 
> > > The set/get methods hides some of the confusing power states, limiting
> > > the power state to either ON or OFF for the drivers.
> > > 
> > > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> > > Cc: Lee Jones <lee.jones@linaro.org>
> > > Cc: Daniel Thompson <daniel.thompson@linaro.org>
> > > Cc: Jingoo Han <jingoohan1@gmail.com>
> > > ---
> > >  include/linux/backlight.h | 72 +++++++++++++++++++++++++++++++++++++++
> > >  1 file changed, 72 insertions(+)
> > > 
> > > diff --git a/include/linux/backlight.h b/include/linux/backlight.h
> > > index d683c053ec09..882ceea45ace 100644
> > > --- a/include/linux/backlight.h
> > > +++ b/include/linux/backlight.h
> > > @@ -474,6 +474,78 @@ static inline int backlight_get_brightness(const struct backlight_device *bd)
> > >  		return bd->props.brightness;
> > >  }
> > >  
> > > +/**
> > > + * backlight_get_actual_brightness - Returns the actual brightness
> > > + *
> > > + * On failure a negative error code is returned.
> > > + */
> > > +static inline int backlight_get_actual_brightness(struct backlight_device *bd)
> > > +{
> > > +	if (bd && bd->ops && bd->ops->get_brightness)
> > > +		return bd->ops->get_brightness(bd);
> > > +	else
> > > +		return -EINVAL;
> > > +}
> > > +
> > > +/**
> > > + * backlight_get_max_brightness - Returns maximum brightness
> > > + *
> > > + * This helper operation is preferred over direct access to
> > > + * &backlight_properties.max_brightness
> > > + *
> > > + * Returns 0 if backlight_device is NULL
> > > + */
> > > +
> > > +static inline int backlight_get_max_brightness(const struct backlight_device *bd)
> > > +{
> > > +	if (bd)
> > > +		return bd->props.max_brightness;
> > > +	else
> > > +		return 0;
> > > +}
> > > +
> > > +/**
> > > + * backlight_set_brightness - Set the brightness to the specified value
> > > + *
> > > + * This helper operation is preferred over direct assignment to
> > > + * &backlight_properties.brightness.
> > > + *
> > > + * If backlight_device is NULL then silently exit.
> > > + */
> > > +static inline void backlight_set_brightness(struct backlight_device *bd, int brightness)
> > > +{
> > > +	if (bd)
> > > +		bd->props.brightness = brightness;
> > 
> > Looking at the drivers I think including a call to backlight_update_status
> > would simplify a lot of code.
> > 
> > > +}
> > > +
> > > +/**
> > > + * backlight_set_power_on - Set power state to ON.
> > > + *
> > > + * This helper operation is preferred over direct assignment to
> > > + * backlight_properties.power.
> > > + *
> > > + * If backlight_device is NULL then silently exit.
> > > + */
> > > +static inline void backlight_set_power_on(struct backlight_device *bd)
> > > +{
> > > +	if (bd)
> > > +		bd->props.power = FB_BLANK_UNBLANK;
> > > +}
> > > +
> > > +/**
> > > + * backlight_set_power_off - Set power state to OFF.
> > > + *
> > > + * This helper operation is preferred over direct assignment to
> > > + * backlight_properties.power.
> > > + *
> > > + * If backlight_device is NULL then silently exit.
> > > + */
> > > +static inline void backlight_set_power_off(struct backlight_device *bd)
> > 
> > I'm not clear why we need these two above? I thought the long-term plan is
> > only use backlight_enable/disable and then remove the tri-state power
> > handling once everyone is converted over?
> > 
> > Or maybe I'm just confused about the goal here ...
> 
> My TODO for v2:
> - Check all get_brightness implmentations.
>   Using backlight_get_brightness is wrong - find a better way
>   Check that they do return the actual brightness and not just the copy
>   from the backlight core

Well it's only for the get_brigthness callback where I think this is
problemantic. In update_state callback I think it's a good helper.

> - Get rid of all uses of power_on/off - this is just another way to
>   disable backlight - so be explicit about it
> - Consolidate the backlight_set_brightness(); backlight_update() pattern
>   to a helper
> - Look into a mipi helper for backlight

Imo perfectly fine to leave that out for some todo, otherwise this will
get huge.

> - Consider if we can change the backlight core to use an u32 for
>   brightness
> - Take a look at Daniels rambling about drm_connector and backlight

Also something we can postpone I think. We can still used devm_ together
with a refcounted backlight (like we do with devm_drm_dev_alloc), and my
gut feel says refcounted backlight is probably the way to go eventually.

But also, we've been talking about drm_connector->panel for years, there's
no rush at all.

> - Convert some platform backlight drivers to updated interface - to verify
>   that they do not add new demends
> 
> The above should address feedback from Daniel etc. Thanks!
> No promises when I get time to do it - this list was mostly
> to help myself so I did not forget.

Sounds all good to me, and thanks for doing all this work!

Cheers, Daniel

> 
> Note: My ISP blocked my attempt to reply to PATCH 0 - so I replied to
> this with the TODO list.
> 
>         Sam
> 
> 
> > -Daniel
> > 
> > > +{
> > > +	if (bd)
> > > +		bd->props.power = FB_BLANK_POWERDOWN;
> > > +}
> > > +
> > >  struct backlight_device *
> > >  backlight_device_register(const char *name, struct device *dev, void *devdata,
> > >  			  const struct backlight_ops *ops,
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
