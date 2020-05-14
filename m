Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B61E81D3DBC
	for <lists+dri-devel@lfdr.de>; Thu, 14 May 2020 21:41:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33E1C6E3B8;
	Thu, 14 May 2020 19:41:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08EAE6E3B8
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 19:41:21 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id f13so3619130wmc.5
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 12:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=NFCWAEu05B4EVTuscfDYGoNeadlz+Kx9w9Y5eJvPttc=;
 b=iiMsiC+mv/wgW8vole6F8NN4cEtIXPvO0pSRH18Z9qVdXjuaSJnnDp9RkqXhzJ+Qt3
 2EhRuywExWkh2CmcncaOfPNzSP4bIY/pKSEdh/sRcGiInH8zjYAIpRs7Y3injlZP7Ndx
 hV83PYAdgnTRVurii3t5KVdNlPKufu+e1UoR4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=NFCWAEu05B4EVTuscfDYGoNeadlz+Kx9w9Y5eJvPttc=;
 b=KU2fEYjX79qB1PFAoT0mrBfy4FgGFB35Jt8WhUE7bnHzX3Fx7tb4XfH/XmjWxnGusG
 V1HuYlqjG+EloQKU6jKjkoFfJ5FAHERdCWnkXR+FZM2BWSZ2DHr5elrHFpIeMDLA73pm
 nKKxl3V0iMlo04yOTmcdCQyyqOGBEv20w8khkoJp56/66pd/40QwOiFBVV5+8ZvqJr/n
 kF/p3IrvWDnIs9SbO69iOWDo5k2r1Cp1H9wFQduSy/9TuzfKObRkZRIMKzyVpUjciULM
 zXUWm6WhC7SI56q6KdW8Hm8X626T+1Ro5Q1fio0jz+PUUXlNndsq1l8FqLXVH4G02cIi
 8Slw==
X-Gm-Message-State: AOAM533EM3CHicSmf4WrsmDx4smIaodWq+ZFHBoti5cilMYLjIooLIGk
 geFr0V8lrj3D7F3uYKvQj/T7sg==
X-Google-Smtp-Source: ABdhPJwFpfjqo8vtjxSzoQQvQrMS4vYTIbF1RS6H6blsGaggnazJUNp8mnWAkPEh3BAF2LXxL3D5Zw==
X-Received: by 2002:a1c:5985:: with SMTP id n127mr9963996wmb.64.1589485279605; 
 Thu, 14 May 2020 12:41:19 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id c125sm125672wma.23.2020.05.14.12.41.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 May 2020 12:41:18 -0700 (PDT)
Date: Thu, 14 May 2020 21:41:16 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v1 08/18] backlight: add backlight_is_blank()
Message-ID: <20200514194116.GB206103@phenom.ffwll.local>
References: <20200514191001.457441-1-sam@ravnborg.org>
 <20200514191001.457441-9-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200514191001.457441-9-sam@ravnborg.org>
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
 Kefeng Wang <wangkefeng.wang@huawei.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Lee Jones <lee.jones@linaro.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Jonathan Corbet <corbet@lwn.net>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Russell King <linux@armlinux.org.uk>, Andy Gross <agross@kernel.org>,
 Uwe Kleine Konig <u.kleine-koenig@pengutronix.de>, linux-pwm@vger.kernel.org,
 Michael Hennerich <michael.hennerich@analog.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jani Nikula <jani.nikula@intel.com>, linux-arm-msm@vger.kernel.org,
 Jyri Sarha <jsarha@ti.com>, Thomas Gleixner <tglx@linutronix.de>,
 Allison Randal <allison@lohutok.net>,
 Support Opensource <support.opensource@diasemi.com>,
 Jingoo Han <jingoohan1@gmail.com>, Douglas Anderson <dianders@chromium.org>,
 Zheng Bin <zhengbin13@huawei.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 patches@opensource.cirrus.com, Enrico Weigelt <info@metux.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 14, 2020 at 09:09:51PM +0200, Sam Ravnborg wrote:
> The backlight support has two properties that express the state:
> - power
> - state
> 
> It is un-documented and easy to get wrong.
> Add backlight_is_blank() helper to make it simpler for drivers
> to get the check of the state correct.
> 
> A lot of drivers also includes checks for fb_blank.
> This check is redundant when the state is checked
> as thus not needed in this helper function.
> Rolling out this helper to all relevant backlight drivers
> will eliminate almost all accesses to fb_blank.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Jingoo Han <jingoohan1@gmail.com>
> ---
>  include/linux/backlight.h | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/include/linux/backlight.h b/include/linux/backlight.h
> index b7839ea9d00a..e67e926de1e2 100644
> --- a/include/linux/backlight.h
> +++ b/include/linux/backlight.h
> @@ -165,6 +165,23 @@ static inline int backlight_disable(struct backlight_device *bd)
>  	return backlight_update_status(bd);
>  }
>  
> +/**
> + * backlight_is_blank - Return true if display is expected to be blank
> + * @bd: the backlight device
> + *
> + * Display is expected to be blank if any of these is true::
> + *
> + *   1) if power in not UNBLANK
> + *   2) if state indicate BLANK or SUSPENDED
> + *
> + * Returns true if display is expected to be blank, false otherwise.
> + */
> +static inline bool backlight_is_blank(struct backlight_device *bd)
> +{
> +	return bd->props.power != FB_BLANK_UNBLANK ||
> +	       bd->props.state & (BL_CORE_SUSPENDED | BL_CORE_FBBLANK);

This definition here doesn't match backlight_enabled/disable() functions
we added. I think to avoid lots of pondering and surprises we should try
to make sure these are all matching, so that once we rolled them out
everywhere, we can just replace the complicated state with one flag.
-Daniel

> +}
> +
>  extern struct backlight_device *backlight_device_register(const char *name,
>  	struct device *dev, void *devdata, const struct backlight_ops *ops,
>  	const struct backlight_properties *props);
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
