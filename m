Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD411D888D
	for <lists+dri-devel@lfdr.de>; Mon, 18 May 2020 21:57:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B4A06E47E;
	Mon, 18 May 2020 19:57:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6467C6E47E
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 19:57:01 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id f134so735741wmf.1
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 12:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=PbdRyg5kcd//DX8aThqSi8QmNWbORlgHp5rh1J6SqIY=;
 b=kA7beYhILj0prjYk3znsZ8vtZ7ZDrlQiKMA8sojxIRQXdGFCC8xIgp5oYZcsv/epOa
 z+WwumTl1Z5l7ZX9B/eSRrqY5mx549cQYP//s64DW4RKuMRcjPBWW5fQi5fAZlenSkZJ
 Nt1WvnhlH1BgUXRpg/hIsSY/DfNuQGXGDvjHA4ulU45A3PQ10l2Ii7oIjU1ZrqUblkDo
 NA0ch0kHTUl/VyMp6QdehDNFFaESotNNxJsywuZFaJQrnp3f1uIg+jX+nk1vK3Ecm+b4
 P6xmu/BErHxodXVZt88F3zAeY0oXRqfODvYoE6KNDpKet9iKSLYq8FddTeCPBpnQTVNX
 KOyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=PbdRyg5kcd//DX8aThqSi8QmNWbORlgHp5rh1J6SqIY=;
 b=rY4HtlukrKnJ4XhH43d4ylH1gv6sokUg5IlsoZEA/YQTbgCX0Zwj8NP+3z14KHqG6U
 YMOZeamREljIDcTcss28I47ttPHh2QHOb+3SpR6Vll9Dasi4cEVb5yMP+OR3cCQAEvr2
 RsQ7/mOWbkMWu8FVbYU2DLw9u3tKvMvBCtDsRLqaUIqn3L7S+J+CfGfMdSZdgvPMO5i/
 meaC97JzSA3hJSXUci+4yxQb1LZqBfq7Tj56wHV22686eX81TG4HghDQ79+Y7ASoWsxe
 YCHtaZuhSKzGQoU7yj0EEyNdbVaPp7Ji0UCgC+N/DwvSNqhy4VZRgXkB1jjvF2GYUCFm
 aW4Q==
X-Gm-Message-State: AOAM532Ia1CJWyWHTqrHvaTOYLrNEg8YdubNJgA7Rh2EZvIGsS5oL0Qq
 Zlo2E3Zp6KscOAwKhC8T+9i25Q==
X-Google-Smtp-Source: ABdhPJzoU8qbbvxxC3cizf6NI6NFIEqaKyHByjJ4SgRZLqqZ0f2ZQseTGjC1Xa9OdZep5QtoO5pCtw==
X-Received: by 2002:a1c:3b87:: with SMTP id i129mr1150807wma.38.1589831819961; 
 Mon, 18 May 2020 12:56:59 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id u10sm769695wmc.31.2020.05.18.12.56.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 May 2020 12:56:59 -0700 (PDT)
Date: Mon, 18 May 2020 20:56:56 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2 15/16] backlight: make of_find_backlight_by_node()
 static
Message-ID: <20200518195656.z2wag34mbr3e2hip@holly.lan>
References: <20200517190139.740249-1-sam@ravnborg.org>
 <20200517190139.740249-16-sam@ravnborg.org>
 <20200518165648.ltgtofjsteyyse4j@holly.lan>
 <20200518181227.GC770425@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200518181227.GC770425@ravnborg.org>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Thierry Reding <thierry.reding@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Jonathan Corbet <corbet@lwn.net>, Russell King <linux@armlinux.org.uk>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Andy Gross <agross@kernel.org>,
 Uwe Kleine-Konig <u.kleine-koenig@pengutronix.de>, linux-pwm@vger.kernel.org,
 Michael Hennerich <michael.hennerich@analog.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jani Nikula <jani.nikula@intel.com>, linux-arm-msm@vger.kernel.org,
 Support Opensource <support.opensource@diasemi.com>,
 Jingoo Han <jingoohan1@gmail.com>, Douglas Anderson <dianders@chromium.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, patches@opensource.cirrus.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 18, 2020 at 08:12:27PM +0200, Sam Ravnborg wrote:
> On Mon, May 18, 2020 at 05:56:48PM +0100, Daniel Thompson wrote:
> > On Sun, May 17, 2020 at 09:01:38PM +0200, Sam Ravnborg wrote:
> > > There are no external users of of_find_backlight_by_node().
> > > Make it static so we keep it that way.
> > > 
> > > v2:
> > >   - drop EXPORT of of_find_backlight_by_node
> > > 
> > > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> > > Cc: Lee Jones <lee.jones@linaro.org>
> > > Cc: Daniel Thompson <daniel.thompson@linaro.org>
> > > Cc: Jingoo Han <jingoohan1@gmail.com>
> > 
> > Assuming the 0day-ci comments are because some of the patches have
> > already been sucked up in a different tree then:
> Correct. For now only drm-misc-next have no users of
> of_find_backlight_by_node() which is why the other trees failed.
> 
>  
> > Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
> Thanks for all your reviews!
> I will shortly (within a few days) address the comments and send out a v3.
> 
> Is is correct that I assume you or Lee or Jingoo will apply the patches
> to a backlight tree somewhere when they are ready?
> If you have a tree you use for backlight patches I can base v3 on that,
> given that I get a link and have access to pull from it.

Absent holidays and the like, Lee usually does that actual patch
hoovering.


Daniel.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
