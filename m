Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ACF3E4736A7
	for <lists+dri-devel@lfdr.de>; Mon, 13 Dec 2021 22:43:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93EF910E9DF;
	Mon, 13 Dec 2021 21:43:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E84A310E9DF
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Dec 2021 21:43:20 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id r26so24936012oiw.5
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Dec 2021 13:43:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=TmGwTxtk1ApFzRT5JcuqotjuO1Eq6SC3X6wTg4aSOGc=;
 b=eNaZByPA3A9BMSPWspOZQZYK28rssM3XgZvdRx5XCTDo+TI+Z8nG1+mtIgUfxDnjCQ
 bTEdUbOAJjsIjMzHXemYzUBdwPs2m2wTR//V0+o7cw+D60ALBLxTHVQuUEx5jmat3Cjs
 p1UaXu+fZVvCxOFZfcOs4V3KjhAoTqrodl634=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=TmGwTxtk1ApFzRT5JcuqotjuO1Eq6SC3X6wTg4aSOGc=;
 b=kzBKmTT+X2R/1LxG3zEbmn9khUUWamW+lS6m3mlMfuJiD5fc+4+/SbP0Xx82EZiomz
 S8X0qdLBBYqq8eKYQfIt7TsWYMPnEUtae9JO/7e7VgGcYQDYdFn4mQASaeHud5y+4Vi1
 19UY8FdRSxAEBaj3ErjF2404JDpxVkXl4sQipHf4lyu8TH5AOosR3WDFLxG/Tzt6yn7/
 gLFjS1Ad7fk7xTZiF7Vw8T39Q9rW5chxeVF4ftLhb5hIVCz7ITngAQyI++YcxrKRBLsR
 pxVdvtJLhp3JCcQDxVBFDKcYW5bXdaZImnJgqh2NVHZ7RIHScn9VihcQE4Szf9EClskZ
 QtEQ==
X-Gm-Message-State: AOAM530Z6cHYL5vPul1uBEMuHkfyaok6YP7EzXgf8D9UETXyBo/0Z/d+
 jH2q7GT4IHZeoitUKldY25W1xYpZXnBj5YAuzDDWEQ==
X-Google-Smtp-Source: ABdhPJwBmJUtITTggfiBEHtxlPNAqOaF12KYEh1ljweCao7w72Js/U/c7J5QINoBhIaZJpcXb7QiXAChzLKfd0d+7y0=
X-Received: by 2002:a05:6808:211f:: with SMTP id
 r31mr1129616oiw.64.1639431800144; 
 Mon, 13 Dec 2021 13:43:20 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 13 Dec 2021 13:43:19 -0800
MIME-Version: 1.0
In-Reply-To: <Ya+mV/zuRVVIGVy1@phenom.ffwll.local>
References: <20211202222732.2453851-1-swboyd@chromium.org>
 <Ya+mV/zuRVVIGVy1@phenom.ffwll.local>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Mon, 13 Dec 2021 13:43:19 -0800
Message-ID: <CAE-0n53dnsAdjBUVmDMbcvrSJEE=RPu7PGX_zaWCZ_ZBUAythA@mail.gmail.com>
Subject: Re: [PATCH v4 00/34] component: Make into an aggregate bus
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
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
Cc: linux-fbdev@vger.kernel.org, Emma Anholt <emma@anholt.net>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Xinliang Liu <xinliang.liu@linaro.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Liviu Dudau <liviu.dudau@arm.com>, dri-devel@lists.freedesktop.org,
 Jaroslav Kysela <perex@perex.cz>, Paul Cercueil <paul@crapouillou.net>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Russell King <linux@armlinux.org.uk>, Will Deacon <will@kernel.org>,
 Vitaly Lubart <vitaly.lubart@intel.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Saravana Kannan <saravanak@google.com>, Joerg Roedel <joro@8bytes.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Sandy Huang <hjc@rock-chips.com>, James Qian Wang <james.qian.wang@arm.com>,
 Chen Feng <puck.chen@hisilicon.com>,
 Russell King <rmk+kernel@arm.linux.org.uk>,
 Tomas Winkler <tomas.winkler@intel.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Russell King <linux+etnaviv@armlinux.org.uk>, Mark Brown <broonie@kernel.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Takashi Iwai <tiwai@suse.com>,
 linux-omap@vger.kernel.org, Yong Wu <yong.wu@mediatek.com>,
 Tomi Valkeinen <tomba@kernel.org>, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Jyri Sarha <jyri.sarha@iki.fi>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 linux-kernel@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>,
 Sebastian Reichel <sre@kernel.org>, Tian Tao <tiantao6@hisilicon.com>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Daniel Vetter (2021-12-07 10:22:15)
> On Thu, Dec 02, 2021 at 02:26:58PM -0800, Stephen Boyd wrote:
> > This series is from discussion we had on reordering the device lists for
> > drm shutdown paths[1]. I've introduced an 'aggregate' bus that we put
> > the aggregate device onto and then we probe the aggregate device once
> > all the components are probed and call component_add(). The probe/remove
> > hooks are where the bind/unbind calls go, and then a shutdown hook is
> > added that can be used to shutdown the drm display pipeline at the right
> > time.
> >
> > This works for me on my sc7180 board. I no longer get a warning from i2c
> > at shutdown that we're trying to make an i2c transaction after the i2c
> > bus has been shutdown. There's more work to do on the msm drm driver to
> > extract component device resources like clks, regulators, etc. out of
> > the component bind function into the driver probe but I wanted to move
> > everything over now in other component drivers before tackling that
> > problem.
> >
> > Tested-by tags would be appreciated, and Acked-by/Reviewed-by tags too.
>
> Thanks for pushing this forward. Unfortunately I'm completely burried and
> it's just not improving, so merge plan:
>
> - please get Greg KH to ack the bus/driver core stuff
>
> - please get one of the drm-misc committers we have from Google's Chromeos
>   team (there should be a few by now) to review&push this.

Sounds like a plan. Thanks!

>
> Otherwise I fear this might get stuck and I'd really like to avoid that.
>
