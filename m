Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D3641196EC
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 22:30:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 742586E95A;
	Tue, 10 Dec 2019 21:30:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7724C6E984
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 21:30:12 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id r14so14954215lfm.5
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 13:30:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=StsS/69FutA1nN7N98WwTYGRBxsgRrzIAB2gro1J7SU=;
 b=teLVRGpVO9aX1Xtmff3aE8MOjXAblaxvQsN0PT3HW9p0Vor4OShm0t4Z/yiGmooji8
 itYT/f+M6dTuU3FbtpGWHKwDW14hAtF7CRljqra5sWojsuX4pvIL8z5GHVRI7Q4CyeT2
 iXyjHA8OzaKa2myRJ9oiQXjG9gTw1qBCpOunO7jg2UQ0r1efL+wACdUFtsoBBb6uqAgD
 TIlYDdFhiuDPC7sM8rjfOpeuz6zFfNg2vf8O+p3JRqSq1ydu8YSkxy3w90Z+Yv2tCw4G
 tLn3yUXZi2/RjinSjGcyTOQQIKqJSpE2oNm6Mnp0kTeTBum7r+ZVEz4FySclHgIJQ/5Y
 a0UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=StsS/69FutA1nN7N98WwTYGRBxsgRrzIAB2gro1J7SU=;
 b=YSwaPZ0VskCLWNAuSlzJg1XQUQxaf/sMLmFEy8asojUDICmLWOWvBkSOGJDvjxmXVn
 mhiSSgthanZLPgs1+d0awVsH3vIy5uRXAtgHv8W0a9O7OMfZV4rchYUQaCZt8D+CbrM0
 wj24Wxv7W9VJITINQJuOutGsJGGlzl1AuseO6Gs1DC/gEkirXAvnNjRvFF/VKmfrY3DE
 bZlDJs87akH6uoFY2im19nbPme+6D25S6v9ZRPNYZIe6clMZw+68kxUcwTfoqZ+lSsq0
 VXnzi0MTbXdwPMvAoKtYNG6+XcIG5+VSNUzHSF2NAgnIdeEgwJZYES2giZLKERBNK3Fs
 4U3Q==
X-Gm-Message-State: APjAAAUBhIjD2FLnQhrLo0jnvl+InN+9ipo06Yr9ndYuINWMStHm/ysz
 IAPsETFHdmvHjVYfxi7nUxJ/DXm3UNv+h/nexNy09w==
X-Google-Smtp-Source: APXvYqwXhTtL7+VPyKO5IiSh3n5ljqSh1XlMtM1WFF3mWEN1L8FeOTpdPXx2wgMF2Um6Vk9E5Nzc+gaF1rXax/33moo=
X-Received: by 2002:a19:8a41:: with SMTP id m62mr22748lfd.5.1576013410922;
 Tue, 10 Dec 2019 13:30:10 -0800 (PST)
MIME-Version: 1.0
References: <20191210194758.24087-1-sam@ravnborg.org>
In-Reply-To: <20191210194758.24087-1-sam@ravnborg.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 10 Dec 2019 22:29:59 +0100
Message-ID: <CACRpkdY-8VMN-nZ=uTmOB_10_WGLFggkEDn_M4AYDn1P-bCXEA@mail.gmail.com>
Subject: Re: [PATCH] drm/drm_panel: fix EXPORT of drm_panel_of_backlight
To: Sam Ravnborg <sam@ravnborg.org>
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 10, 2019 at 8:48 PM Sam Ravnborg <sam@ravnborg.org> wrote:

> Fix link failure for module builds of panels.
> The conditional compilation around drm_panel_of_backlight()
> was wrong for a module build.
> Fix it using IS_ENABLED().
>
> Fixes: 152dbdeab1b2 ("drm/panel: add backlight support")
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <maxime.ripard@bootlin.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>

Looks like the right fix to me:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
