Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 816D26622D2
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 11:16:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20C3A10E3B8;
	Mon,  9 Jan 2023 10:16:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A14B710E3B8
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jan 2023 10:16:42 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id ja17so5877458wmb.3
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jan 2023 02:16:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=mH4f9OANiE6I82Rid3V8ENaOi03PPyxh8l5jpzwCQ2g=;
 b=moQWNsgTXKScXgCJUB9sQ+uMKOIfJExITq8dYoMSPNwcVjlG8F3+FhYxyVh4mGab5D
 WPiXjNjY6lbEwvUtN9024Wrnx3OUzFIw0m/ZG8q1W6rCDpa1OoN0eTzHWcgTYugr7EDL
 YuY02QZRv0AJ8p+UNO/6Ogy0wV3o+Iz78jfaTQzZ7ei9W5SH4b6Rj2NS4RVOQ1RmtqYD
 AwOrO3RLmFBkhvmD+X+7RozXxiVNmh0qKURl1hGhMdJYI4NTFZPDH0blYgsP/9otzFgP
 K01EH5s5q7BmAd84+euEhlkabIW9Ub+SNuvUL391QaNXzwQqDIupg5ItSsvCS8YlK+/2
 oHXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mH4f9OANiE6I82Rid3V8ENaOi03PPyxh8l5jpzwCQ2g=;
 b=zahgg2aWQecUvyWd0IY/imO6ftGh+vxz9IA1X6ODlHY2KDwwIOFtCw/liUXUmkybIy
 1Outqao+thcd7g/0eynyf0EOciLJ4ktY23oEo/cgCwmSQ9HP6APKxbChJ8BylJwewU5m
 0kneFtQOPvp/t/yOfu8+AMIBQ0TkmLpKmy827jZL6Qj5swy9nsZ7blqwm/t3UkwxYgbw
 82Qc0XbPQKsf61SmAFtBDTADYMbn3Hah7efzOAvzM+Zv/w0XbimcNQaIcsFzULI+UQWW
 xFyyYRsdSGFOUQv3UIqfi0qcibW3pahVjNC5apXgI49bYpSRfalG9Jr74hBh+xhv9Plm
 Rpyg==
X-Gm-Message-State: AFqh2krz3ko5fT0tj7yP9w9tXp1Rc6tUQzcMWywM2isxo0D1PxAywstn
 p9+fs91xoiU6xZsiwbzkZ9BRPA==
X-Google-Smtp-Source: AMrXdXsACLbkYa2fzH0tS4O/LJpxq4OHjiRZNRCmRiAMjrrNnwIY8/sgFFZXOY2oEtev7X11zGWG7Q==
X-Received: by 2002:a05:600c:220c:b0:3d2:3831:e5c4 with SMTP id
 z12-20020a05600c220c00b003d23831e5c4mr49516520wml.40.1673259400970; 
 Mon, 09 Jan 2023 02:16:40 -0800 (PST)
Received: from aspen.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175]) by smtp.gmail.com with ESMTPSA id
 u8-20020a05600c19c800b003d9780466b0sm11970130wmq.31.2023.01.09.02.16.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 02:16:39 -0800 (PST)
Date: Mon, 9 Jan 2023 10:16:37 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Stephen Kitt <steve@sk2.org>
Subject: Re: [PATCH RESEND 1/4] backlight: aat2870: Use backlight helper
Message-ID: <Y7vphX2Ohyv/xZz7@aspen.lan>
References: <20230106164856.1453819-2-steve@sk2.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230106164856.1453819-2-steve@sk2.org>
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
Cc: linux-fbdev@vger.kernel.org, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>, Lee Jones <lee@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 06, 2023 at 05:48:52PM +0100, Stephen Kitt wrote:
> Instead of retrieving the backlight brightness in struct
> backlight_properties manually, and then checking whether the backlight
> should be on at all, use backlight_get_brightness() which does all
> this and insulates this from future changes.
>
> Signed-off-by: Stephen Kitt <steve@sk2.org>

This RESEND seems to have dropped the Reviewed-By tags provided the
last time is was circulated:
https://lore.kernel.org/all/20220608143233.l5pbopafqc4n6uwq@maple.lan/

There's only four patches so I guess I can add them again so the tools
can pick them up.

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
