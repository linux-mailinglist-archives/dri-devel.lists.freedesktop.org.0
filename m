Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0BA32185C1
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jul 2020 13:12:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC7EC6E22F;
	Wed,  8 Jul 2020 11:12:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EC5F6E8AB
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jul 2020 11:12:37 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id f139so2516929wmf.5
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jul 2020 04:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=KWMYsCIIwxFSG880I4t0GE07CfKjbPZlJ7KIzjiu+UA=;
 b=FlRyf2w3IeuJcSIXaRhEyiB+m1dyETGbjVwWInkoQG8zzP6AIOzw1VvGcKTto7BQId
 i0oztRldanGJbnXrtAhGnGzNA78Qb7acEwIBrg1HxZbDyU+xA0FJWx14yUUgmfe3kAUN
 ozlTiB6YXLFRcfVPJwoXz0Qe4fmlfBY/5hXxMBNDgYOYwuvQ9GGxnT/05LD05pTtRr0B
 MH5glHsvUljRB6XBRqxj8wU3tyURW2JY4ug3/wdTOB6gAo8QR3waseZDSgiFiMf7pGKR
 V2f1HL8APW9sTxoElaVPxGdk34BYPxEDwhO5VHOuEiIjSsE4QDboz+tCRuSmHKtTSPV8
 ePhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=KWMYsCIIwxFSG880I4t0GE07CfKjbPZlJ7KIzjiu+UA=;
 b=ZrqwfgamBmWiZ9IVa69RW9iUoDFxjUCrRsjx5YVk2yLtFeD0OqU48mDvdWmFvMxay9
 bsiYEmnoHrimtnWweG1CfMy3h6hgIwefGzBl5935nxgPFbMH4xIJYKO152xdedAUw4OT
 iQ4cx1BS9XwiW81xFbtl3Jdw1G/Ov0s0kCjS1A/ooLGfvrcPIaE3qqZTMGCMaztxYJ4z
 79SMCR6f/NXEUmxboghyB47cWWoO5Y5j5F7VEKywvZ1NNKUOSgmLDzR5ZIOVixUX2wZB
 5kq+sDWRCWlqxgXjHBUQebP3rd3Ca9mcbMfSnHtjjCLCqzCJxbjxYGGgM9WM7gGIRkKa
 j1Cw==
X-Gm-Message-State: AOAM531uV+iFIcWwqk8k2zA31tbDypIrZLLFi9ghPeLTPST4KoKtNcjV
 Q0qUJPKH01N8/ReCBYUNl9rEJA==
X-Google-Smtp-Source: ABdhPJxdNEZSUWxZN120W/Uysct/7lRd/HGK2fWkBPFYCgZ+eyy2mBJwgwJi42FTJzQdl9q4PNhayQ==
X-Received: by 2002:a1c:2982:: with SMTP id p124mr9232454wmp.26.1594206755934; 
 Wed, 08 Jul 2020 04:12:35 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id v9sm6410921wri.3.2020.07.08.04.12.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jul 2020 04:12:35 -0700 (PDT)
Date: Wed, 8 Jul 2020 12:12:33 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v4 16/20] backlight: jornada720_bl: introduce
 backlight_is_blank()
Message-ID: <20200708111233.ui6r6bvdchj3vboj@holly.lan>
References: <20200703184546.144664-1-sam@ravnborg.org>
 <20200703184546.144664-17-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200703184546.144664-17-sam@ravnborg.org>
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

On Fri, Jul 03, 2020 at 08:45:42PM +0200, Sam Ravnborg wrote:
> Use the backlight_is_blank() helper to simplify the code a bit.
> This add support for fb_blank as a side-effect.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Jingoo Han <jingoohan1@gmail.com>

This driver exhibits the "how does userspace know what writing brightness zero to
sysfs actually does" problem so can't use the backlight_get_brightness() helper.

If you respin it would be good to see that in the patch description but
that's such an extreme nitpick It think, either way, this can be:

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
