Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A01F1D7F2C
	for <lists+dri-devel@lfdr.de>; Mon, 18 May 2020 18:50:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBB5C6E447;
	Mon, 18 May 2020 16:50:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11A506E447
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 16:50:44 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id h17so12657367wrc.8
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 09:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=BdW89KVUrfgJZgJ6lFQwQ5B2siSxs0MlWvrsl3aUQvQ=;
 b=kyAoq1KRo6MAV61Q5tg0wLc1p7tEFFGM9R1ue2/8u5qXYjgnOMfFMq2+VHjUopZxUE
 hNwkvfIh6pLFNnvXrcmBW1+67wD6TWvuEohaowOSAcNnMqfaec+9mCC3UifrTn6DKq4M
 zNp47EWNQpzTFKO/Bi26pxmQ5fSWHCYiF+3yzgKP5JC5NhHJGTETi+b8zUAaLD3zNIcU
 cmu2QwQOGNnfevQqsaxnRfFi7Xu7DRu6IhBsEKE4EYZumKv62GY3NjicT5Xrhs0DeF63
 z7ZlNqwgdXA4FVYyRhaNtapFsuZMyzJcEzLrohOHDnUB2MVZrSBHWdLXyBO2dqOYLvpe
 nTCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=BdW89KVUrfgJZgJ6lFQwQ5B2siSxs0MlWvrsl3aUQvQ=;
 b=XED+UPj2y6e0J58QRWTPlvCixNUsv7Ki3ri9psgLAN55Y7Uz9u23BJ1eOSz1wlnKpg
 04fYKvEs4p4SEoT7eh7sajgFgMe8uBAzO2e834MuJ5U1yl2hmNxZiUTnJJj199Ln9KvM
 F95oyrPiQs0DFuY7LTxUnlB3ACOitFGI8nWIUvJ/t/AuYStdEfNF50PNa2xG0kYgQ3r3
 B0Eubyke11W4P2zctfjchY1RsmqO/95e8eciFggRd+g3fTnkr+QCVC3c9EwjipY9Jbvo
 l/4ugU22Pv1uMYMl9IuPZ9EPTgFuFIURjKKj9Wia/v7afH3/ocYJU1lsLg7FRhZshxzf
 gXEA==
X-Gm-Message-State: AOAM532cyYlLsCPgaQXJEV+2AWc4u2ghFQbERr5HJyYNQyeNz6gYDv7X
 bgFqH6BWmWATgZpmvS+t5KnwhA==
X-Google-Smtp-Source: ABdhPJx5yS9SSHVUTWVYS7UghxQM9AekWaDO8lrmLR36Nmb3f1pPvSwvNzKB+hZoMPyglpPGPYxrww==
X-Received: by 2002:adf:fb08:: with SMTP id c8mr21082644wrr.421.1589820642769; 
 Mon, 18 May 2020 09:50:42 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id w13sm16641638wrm.28.2020.05.18.09.50.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 May 2020 09:50:42 -0700 (PDT)
Date: Mon, 18 May 2020 17:50:40 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2 12/16] backlight: wire up kernel-doc documentation
Message-ID: <20200518165040.4es3gdydes4so72k@holly.lan>
References: <20200517190139.740249-1-sam@ravnborg.org>
 <20200517190139.740249-13-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200517190139.740249-13-sam@ravnborg.org>
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
 Jonathan Corbet <corbet@lwn.net>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Russell King <linux@armlinux.org.uk>, Andy Gross <agross@kernel.org>,
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

On Sun, May 17, 2020 at 09:01:35PM +0200, Sam Ravnborg wrote:
> Include backlight so the documentation is now generated
> with make htmldocs and friends.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Jonathan Corbet <corbet@lwn.net>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


> ---
>  Documentation/gpu/backlight.rst | 12 ++++++++++++
>  Documentation/gpu/index.rst     |  1 +
>  2 files changed, 13 insertions(+)
>  create mode 100644 Documentation/gpu/backlight.rst
> 
> diff --git a/Documentation/gpu/backlight.rst b/Documentation/gpu/backlight.rst
> new file mode 100644
> index 000000000000..9ebfc9d0aced
> --- /dev/null
> +++ b/Documentation/gpu/backlight.rst
> @@ -0,0 +1,12 @@
> +=================
> +Backlight support
> +=================
> +
> +.. kernel-doc:: drivers/video/backlight/backlight.c
> +   :doc: overview
> +
> +.. kernel-doc:: include/linux/backlight.h
> +   :internal:
> +
> +.. kernel-doc:: drivers/video/backlight/backlight.c
> +   :export:
> diff --git a/Documentation/gpu/index.rst b/Documentation/gpu/index.rst
> index 1fcf8e851e15..c9a51e3bfb5a 100644
> --- a/Documentation/gpu/index.rst
> +++ b/Documentation/gpu/index.rst
> @@ -12,6 +12,7 @@ Linux GPU Driver Developer's Guide
>     drm-uapi
>     drm-client
>     drivers
> +   backlight
>     vga-switcheroo
>     vgaarbiter
>     todo
> -- 
> 2.25.1
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
