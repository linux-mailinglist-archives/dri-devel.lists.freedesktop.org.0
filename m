Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA3B2184E2
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jul 2020 12:23:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 867716E1F4;
	Wed,  8 Jul 2020 10:23:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 506AE6E1F4
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jul 2020 10:23:48 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id f18so2345151wml.3
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jul 2020 03:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=z8+r2cqqKhJKYoH9hGRghRj6vIVi2wdr4Y4kgj/xsjY=;
 b=FxaDndhVThqHQeAQ2Ik51rYAKq7WOGd0GnVrsra1PkjPvOt6h7eRoSCYIkGbJ1Ls1j
 SVqBqikrI9JsvQTATOqSx0rLWaMHgYaJAKIN7X1ZRvoQzF4iigpHlJKc40mk4hSsHuHR
 QSzgnzzEHXyIsiH8th/ZY6PA2tAal2gdhFISOQ5x79VHtc22BKOvIeggrDSaSSNlviYl
 +IMrpO4J6SEeA8JUSpCNGv3hLszRXFeJjDTTmujmBpiXcVPoKeALwrb/9QQsK+UGhXi9
 O0HK/XKP7d0jFpADs55NK2P1aOgAe+BBy6jrYeQIaQQd/UQvThQvxNWvTNtK+VaspXci
 mVWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=z8+r2cqqKhJKYoH9hGRghRj6vIVi2wdr4Y4kgj/xsjY=;
 b=jJNOrkYis8fQfdu0l+uQ/XbEsvMb7HglzdE3Q0sVsrBOuQ/JGkpkOPTJLzW+tM1AA0
 nz5uXy/AZmHV96J37MQWH8ht+PuccafB8BieQ6WRMJKKDtVl7Zo+gf1yikSzF3hUUqV9
 3jFjeqTVpHE/7wVQd82ZixdM9tTloRl+hlFcC/Hd+X7ICqAmEXevK7MBMZ5h+sZJZqkQ
 9vb6WJYWrO7XP6GjBWSK/Q4aP7VflqyKrMOLBPnWm8zysaGkDnHoI7I2X16GXJ8tMfZC
 /nezJn7NabvhmcaN9gz0cjZuE+dupVfblld98M6Ury4b/aUbTFyUvmi1Yg9ebwBE6Lhg
 7FXg==
X-Gm-Message-State: AOAM533tA7s24hSvnDJS6qON5EVSVBtRbRz0cyiE01EJlj1cfdNY3klX
 TjUb8m3MDFN+wEqxCxUAGYPi6A==
X-Google-Smtp-Source: ABdhPJx17kgaBLLSo3ldC/0JUfIhPPXRByUkKLn2LBh2O7xRk4tCviFU6vHXMutiSwjsym1QA6ryeg==
X-Received: by 2002:a1c:7fd7:: with SMTP id a206mr8525032wmd.104.1594203826992; 
 Wed, 08 Jul 2020 03:23:46 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id v66sm5669394wme.13.2020.07.08.03.23.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jul 2020 03:23:46 -0700 (PDT)
Date: Wed, 8 Jul 2020 11:23:44 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v4 05/20] backlight: improve backlight_device documentation
Message-ID: <20200708102344.4vj5jy773mtbzif6@holly.lan>
References: <20200703184546.144664-1-sam@ravnborg.org>
 <20200703184546.144664-6-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200703184546.144664-6-sam@ravnborg.org>
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
 Uwe Kleine-Konig <u.kleine-koenig@pengutronix.de>, linux-pwm@vger.kernel.org,
 Michael Hennerich <michael.hennerich@analog.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 linux-arm-msm@vger.kernel.org,
 Support Opensource <support.opensource@diasemi.com>,
 Jingoo Han <jingoohan1@gmail.com>, Emil Velikov <emil.l.velikov@gmail.com>,
 Andy Gross <agross@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 patches@opensource.cirrus.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 03, 2020 at 08:45:31PM +0200, Sam Ravnborg wrote:
> Improve the documentation for backlight_device and
> adapt it to kernel-doc style.
> 
> The updated documentation is more strict on how locking is used.
> With the update neither update_lock nor ops_lock may be used
> outside the backlight core.
> This restriction was introduced to keep the locking simple
> by keeping it in the core.
> It was verified that this documents the current state by renaming
> update_lock => bl_update_lock and ops_lock => bl_ops_lock.
> The rename did not reveal any uses outside the backlight core.
> The rename is NOT part of this patch.
> 
> v3:
>   - Update changelog to explain locking details (Daniel)
> 
> v2:
>   - Add short intro to all fields (Daniel)
>   - Updated description of update_lock (Daniel)
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Jingoo Han <jingoohan1@gmail.com>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
