Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E8917225A51
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jul 2020 10:48:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4012289DBF;
	Mon, 20 Jul 2020 08:48:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00A9689DBF
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jul 2020 08:48:30 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id w3so24296717wmi.4
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jul 2020 01:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=3Mvv6V7aL0bS8bLhb+v9J48PYxr/jDUQbWZDKJ3of4k=;
 b=GPZr4RzzAiGFrXA4Lc2u8SHFw4nz+8LttAOAp071b1HN8JGHbq8hJeNnFyFnZfQNpI
 wfvmIupf6FmdZMHcWDZ0RGgfmR6/UkXw1Ry9fxlPWa55mXeOllJIylslp/fcTX1P5tpX
 X4PGv9AY4r+UTZ4ZUwjPhWtlHUj2YMSTGaYw/KHK8TwLdyFW4hiMT8Iz731WhgUcs+Rb
 yoVZvTLCdpKiKVYTxaGVMCUqMrf8WZjC1zVmAwKexn5OhhWEN+kFygPDdy0g1OcaX5tg
 Tdc2WARpJx4H5rlw2EUN8LdK4kBj/RkauWc0R3XCvaYw6Oo12LBLFN0aPNKxOJUEsnJ7
 RQGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3Mvv6V7aL0bS8bLhb+v9J48PYxr/jDUQbWZDKJ3of4k=;
 b=FKAqgzni5huF7fC1h1ZU7bb2q/5njwI9gUi5U46u5bLgaKuU/PhsoEdFj3Y/7QnGMa
 cL8q9MU+3GwG7Nrga2Zp5XKtuT+9lAf+xKOreyG40tnnCi7hulw+QjqhsbJqdk2SaZMA
 VO2nP3mO5oG/7FATj92T0vToCqJysT48N+Tcp6WLommeEbSp/oYofLUcZwkNBzqGo6GU
 c44ORC4eqslrqlujASV5KJQbCtJqpwNz+Jw9ce9+XNS1lR3NXSWCeC+bxa9jZFBY6FpO
 MOZ0QxnGAWo4Xv4QCVVXG37dh8MWR0WqxkxDaAOm9sd2L40tNG3k2BlUSIXX3okMiWA4
 S+xQ==
X-Gm-Message-State: AOAM530amHdiwCLtFuNYSdXc/550aJ1a2/2wkRlcXnrQFZO5ZNd3JfgU
 AuRNcbyfhlGJ7n3+kjoRxxloDw==
X-Google-Smtp-Source: ABdhPJzE0VX+v4xxb0yfbr3uIHhTnBrDiWh9q2HaxcqnvtD/UybPjPxZBEj8tuo6izQM73ENIq/qcA==
X-Received: by 2002:a1c:a74c:: with SMTP id q73mr19955891wme.96.1595234909650; 
 Mon, 20 Jul 2020 01:48:29 -0700 (PDT)
Received: from holly.lan (82-132-214-103.dab.02.net. [82.132.214.103])
 by smtp.gmail.com with ESMTPSA id l15sm30561453wro.33.2020.07.20.01.48.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2020 01:48:28 -0700 (PDT)
Date: Mon, 20 Jul 2020 09:48:22 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v5 14/19] backlight: cr_bllcd: introduce gpio-backlight
 semantics
Message-ID: <20200720084822.wt5guzetkrgbgdcc@holly.lan>
References: <20200719080743.8560-1-sam@ravnborg.org>
 <20200719080743.8560-15-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200719080743.8560-15-sam@ravnborg.org>
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

On Sun, Jul 19, 2020 at 10:07:38AM +0200, Sam Ravnborg wrote:
> cr_bllcd can turn backlight ON or OFF.
> Fix semantitics so they equals what we know from gpio-backlight.
> brightness == 0   => backlight off
> brightness == 1   => backlight on
> 
> Use the backlight_get_brightness() helper to simplify the code.
> 
> v2:
>   - reworked to introduce gpio-backlight semantics (Daniel)

Wasn't this added for v5? However, I spotted this change amoung the
other patches so no worries...


> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Jingoo Han <jingoohan1@gmail.com>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
