Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F5D11D82AD
	for <lists+dri-devel@lfdr.de>; Mon, 18 May 2020 19:58:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A96E26E455;
	Mon, 18 May 2020 17:58:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 020526E456
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 17:58:48 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id n5so517202wmd.0
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 10:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=JcQPpn/8Qske42SdTGdaDbTrNDjZkL6arDPQ+Oq5m/E=;
 b=A6sVdY9ZTFt5uBkQBFNu2+Q51qV7PtSAYYL5tWVLKk7AP6Vscge6DYyFmy+EV0mMvC
 ZJYNo8z7r2qWtET6q268I0b3z95HbyNdAnvbcAfY2hlnx4QDmIgtWQoqyB1ZGl5L2YoY
 td2vrO/yKhWBuozXs5MfwlyLzwH1HlXlPrbPj72wqjloywx23TffcW2TlwnKS8H33u5N
 EWlZySkfNZIix6zKndP9CFfyS2rUdh9MykOl8kzyGGSWsO4znYMsn/JHjAn95gjlB9Xc
 ZCuuDgDFsqDzlWFlZn60Wjtcq/rTmYMJBZFdMIlorpwKmX9v1m+aUhTVZBuWyFgsBq+o
 0wGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=JcQPpn/8Qske42SdTGdaDbTrNDjZkL6arDPQ+Oq5m/E=;
 b=WrYYjh4JR89Vv9ojgSa8ytUoOCki6ELwounjeN2DYzEdmC8BfhJdJLGeQtcMs9j9Vd
 PNdZ0oNNN6/xLsZ/laJOwG/JsFbZS1MPvkyF+H9LZPN2C6+8jQNkGMQvjUHT/a9QPdLb
 eGzmVH1SoY7YkPdj5cq/V9m14l379hiN34dCZsFTXLkJBujooQ6HuW16ZHC9EsZBPBOY
 BSXIgpONjcOgePUNsksOv1StgV7HQ4olXcvbsFsFiusgz/BUwYL+UhOWF4rKV/FyX63+
 c3AkY9T6K8Ly7AJaVdT8vflyLi60ZZV9r0poqagNHzLBVi+MKhHIi+eeW3OZaURTsfBh
 RVKw==
X-Gm-Message-State: AOAM531wMCFdrjvfbV34yi9TnfFX5JQn1VrKwyuDeBcUVIaJLLtzTXfP
 1/azBlis+TE9fLTQKVPLBmPMdcUxIb4=
X-Google-Smtp-Source: ABdhPJzlkX5mlMq+o1Eawxybh6+vja1NRE3jDgeLBrfENsGuF4ESeez0ZivS6kcv2Hvz7B0CqN9vOg==
X-Received: by 2002:a05:600c:220f:: with SMTP id
 z15mr559467wml.95.1589824727605; 
 Mon, 18 May 2020 10:58:47 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id n13sm17169533wrs.2.2020.05.18.10.58.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 May 2020 10:58:46 -0700 (PDT)
Date: Mon, 18 May 2020 18:58:43 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v2 06/16] backlight: improve backlight_device documentation
Message-ID: <20200518175843.fw74gkdm4ib2w5is@holly.lan>
References: <20200517190139.740249-1-sam@ravnborg.org>
 <20200517190139.740249-7-sam@ravnborg.org>
 <20200518160324.mak4mhgyrgdbr7ww@holly.lan>
 <87o8ql2n1i.fsf@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87o8ql2n1i.fsf@intel.com>
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
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Jonathan Corbet <corbet@lwn.net>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Russell King <linux@armlinux.org.uk>, Andy Gross <agross@kernel.org>,
 Uwe Kleine-Konig <u.kleine-koenig@pengutronix.de>, linux-pwm@vger.kernel.org,
 Michael Hennerich <michael.hennerich@analog.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 linux-arm-msm@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
 Support Opensource <support.opensource@diasemi.com>,
 Jingoo Han <jingoohan1@gmail.com>, Douglas Anderson <dianders@chromium.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, patches@opensource.cirrus.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 18, 2020 at 08:03:21PM +0300, Jani Nikula wrote:
> On Mon, 18 May 2020, Daniel Thompson <daniel.thompson@linaro.org> wrote:
> > On Sun, May 17, 2020 at 09:01:29PM +0200, Sam Ravnborg wrote:
> >> Improve the documentation for backlight_device and
> >> adapt it to kernel-doc style.
> >> 
> >> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> >> Cc: Lee Jones <lee.jones@linaro.org>
> >> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> >> Cc: Jingoo Han <jingoohan1@gmail.com>
> >> ---
> >>  include/linux/backlight.h | 81 ++++++++++++++++++++++++++++-----------
> >>  1 file changed, 58 insertions(+), 23 deletions(-)
> >> 
> >> diff --git a/include/linux/backlight.h b/include/linux/backlight.h
> >> index 7f9cef299d6e..e2d72936bf05 100644
> >> --- a/include/linux/backlight.h
> >> +++ b/include/linux/backlight.h
> >> @@ -14,21 +14,6 @@
> >>  #include <linux/mutex.h>
> >>  #include <linux/notifier.h>
> >>  
> >> -/* Notes on locking:
> >> - *
> >> - * backlight_device->ops_lock is an internal backlight lock protecting the
> >> - * ops pointer and no code outside the core should need to touch it.
> >> - *
> >> - * Access to update_status() is serialised by the update_lock mutex since
> >> - * most drivers seem to need this and historically get it wrong.
> >> - *
> >> - * Most drivers don't need locking on their get_brightness() method.
> >> - * If yours does, you need to implement it in the driver. You can use the
> >> - * update_lock mutex if appropriate.
> >> - *
> >> - * Any other use of the locks below is probably wrong.
> >> - */
> >> -
> >>  enum backlight_update_reason {
> >>  	BACKLIGHT_UPDATE_HOTKEY,
> >>  	BACKLIGHT_UPDATE_SYSFS,
> >> @@ -221,30 +206,80 @@ struct backlight_properties {
> >>  	enum backlight_scale scale;
> >>  };
> >>  
> >> +/**
> >> + * struct backlight_device - backlight device data
> >> + *
> >> + * This structure holds all data required by a backlight device.
> >> + */
> >>  struct backlight_device {
> >> -	/* Backlight properties */
> >> +	/**
> >> +	 * @props:
> >> +	 *
> >
> > As last patch. Why no brief descriptions?
> 
> There are no "brief descriptions" in kernel-doc struct member inline
> markup.
> 
> It would be possible to shorten this to:
> 
> 	/**
> 	 * @props: Backlight properties
> 	 */

Sorry. Loose phrasing on my part... basically the question is why
deviate from the form proposed in "Writing kernel-doc comments"?


Daniel.



> >
> >> +	 * Backlight properties
> >> +	 */
> >>  	struct backlight_properties props;
> >>  
> >> -	/* Serialise access to update_status method */
> >> +	/**
> >> +	 * @update_lock:
> >> +	 *
> >> +	 * update_lock is an internal backlight lock that serialise access
> >> +	 * to the update_status() method. The iupdate_lock mutex shall not be used
> >> +	 * by backlight drivers.
> >
> > In addition to the typo this directly contradicts the advice in the
> > original "Notes on locking".
> >
> > A change this dramatic needs to be fully explaining in the patch
> > description.
> >
> >
> > Daniel.
> >
> >
> >> +	 */
> >>  	struct mutex update_lock;
> >>  
> >> -	/* This protects the 'ops' field. If 'ops' is NULL, the driver that
> >> -	   registered this device has been unloaded, and if class_get_devdata()
> >> -	   points to something in the body of that driver, it is also invalid. */
> >> +	/**
> >> +	 * @ops_lock:
> >> +	 *
> >> +	 * ops_lock is an internal backlight lock that protects the ops pointer
> >> +	 * and is used around all accesses to ops and when the operations are
> >> +	 * invoked. The mutex shall not be used by backlight drivers.
> >> +	 */
> >>  	struct mutex ops_lock;
> >> +
> >> +	/**
> >> +	 * @ops:
> >> +	 *
> >> +	 * Pointer to the backlight operations. If ops is NULL, the driver that
> >> +	 * registered this device has been unloaded, and if class_get_devdata()
> >> +	 * points to something in the body of that driver, it is also invalid.
> >> +	 */
> >>  	const struct backlight_ops *ops;
> >>  
> >> -	/* The framebuffer notifier block */
> >> +	/**
> >> +	 * @fb_notif:
> >> +	 *
> >> +	 * The framebuffer notifier block
> >> +	 */
> >>  	struct notifier_block fb_notif;
> >>  
> >> -	/* list entry of all registered backlight devices */
> >> +	/**
> >> +	 * @entry:
> >> +	 *
> >> +	 * List entry of all registered backlight devices
> >> +	 */
> >>  	struct list_head entry;
> >>  
> >> +	/**
> >> +	 * @dev:
> >> +	 *
> >> +	 * Parent device.
> >> +	 */
> >>  	struct device dev;
> >>  
> >> -	/* Multiple framebuffers may share one backlight device */
> >> +	/**
> >> +	 * @fb_bl_on:
> >> +	 *
> >> +	 * Multiple fbdev's may share one backlight device. The fb_bl_on
> >> +	 * records the state of the individual fbdev.
> >> +	 */
> >>  	bool fb_bl_on[FB_MAX];
> >>  
> >> +	/**
> >> +	 * @use_count:
> >> +	 *
> >> +	 * The number of uses of fb_bl_on.
> >> +	 */
> >>  	int use_count;
> >>  };
> >>  
> >> -- 
> >> 2.25.1
> >> 
> 
> -- 
> Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
