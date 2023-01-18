Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1523672747
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 19:42:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBFB010E05E;
	Wed, 18 Jan 2023 18:42:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B01C10E05E
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 18:42:37 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 l41-20020a05600c1d2900b003daf986faaeso2270061wms.3
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 10:42:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r0LA6cGaaxp3puXrMYIx3Plq7Ps/ZLbe9KrZC2IbOQA=;
 b=YExTC/Qap6Zd/r31YyFxFW2AAxAohGzM9iZbu1SpJxcRj+Rthc0uYF8EkM8SG2477I
 gUkXHvvA/BedGsHIzD/Aoars3OKUXniJhSIMbIkExCVD1IZOH0jGESqgvr5AO84s+IFI
 7xHWlp3ZcnxvFeqL+2kDv72hdr5eBGPfqulV/eAdgnzEELH6PR71CVdPHV+L2Sfj2Xe0
 PwQfFMsG8l29SP9CeQ8yS6P3rOM0pmuICmCS9HfQm5Tp5yb/E9pzazwVJxFIIUWoTibj
 CGpdtvV88H7OCE+jhwibrOyPs1LY6nX+PRmwh0O7Alt5YVjWdN06ZcS9Epi8BMg5YaOA
 679g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r0LA6cGaaxp3puXrMYIx3Plq7Ps/ZLbe9KrZC2IbOQA=;
 b=7JNaMOClgxPRvEXXHupp35FHv0/jFEubCgpgo/a0/Ee1FVsindNcVxlZ29BHUg8Lsd
 YbSKst8Ud7FkzJrjhAW/5hBKCEmakfrh7dPiHmQ7dl6VvCXkLoQvRFV9Tu6ZSYbGBYx0
 dTQdeu2Wkb37CU7UF+s8N0jrPPvpvvWhjk4Mzz8rzNaAlXZz4KKbukjXW7u/wOJ6eo+F
 0lLcNEUHGKElcUsPqTOO3ptPWXfNSlWLhBDhtWXaGyQSXS+vP76zXbl/Ks7VpHR9el+P
 l+xJh8vVC30I4x86CZpSFGjFatBSFxhxuZCUzRN96/Wny6h7PT1U1mQBg8vH69sTz0qi
 Nc6Q==
X-Gm-Message-State: AFqh2konz5eLZZO3E2+dRmDGlGMWh9XfSvpg00kA1mFnH0i4IMp4XRHB
 de68gJ+CpxB4I+iSjeXSgy5vPNafuOI=
X-Google-Smtp-Source: AMrXdXukmf9b8exM0b1FemrAVyfFt8TCuarQhQM/rUVlgYFNAbZeXExDbZYZ7Vu46FK65hS+UPLJdQ==
X-Received: by 2002:a05:600c:b8a:b0:3d9:f806:2f89 with SMTP id
 fl10-20020a05600c0b8a00b003d9f8062f89mr7497630wmb.41.1674067355624; 
 Wed, 18 Jan 2023 10:42:35 -0800 (PST)
Received: from archbox.localnet (84-72-105-84.dclient.hispeed.ch.
 [84.72.105.84]) by smtp.gmail.com with ESMTPSA id
 m31-20020a05600c3b1f00b003db0cab0844sm3149306wms.40.2023.01.18.10.42.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jan 2023 10:42:35 -0800 (PST)
From: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
To: dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v3 0/3] drm/rockchip: dw_hdmi: Add 4k@30 support
Date: Wed, 18 Jan 2023 19:42:33 +0100
Message-ID: <5902537.lOV4Wx5bFT@archbox>
In-Reply-To: <20230118132213.2911418-1-s.hauer@pengutronix.de>
References: <20230118132213.2911418-1-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: Dan Johansen <strit@manjaro.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Sandy Huang <hjc@rock-chips.com>, linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wednesday, 18 January 2023 14:22:10 CET Sascha Hauer wrote:
> It's been some time since I last sent this series. This version fixes
> a regression Dan Johansen reported. The reason turned out to be simple,
> I used the YUV420 register values instead of the RGB ones.
> 
> I realized that we cannot achieve several modes offered by my monitor
> as these require pixelclocks that are slightly below the standard
> pixelclocks. As these are lower than the standard clock rates the PLL
> driver offers the clk driver falls back to a way lower frequency
> which results in something the monitor can't display, so this series
> now contains a patch to discard these unachievable modes.
> 
> Sascha
> 
> Changes since v2:
> - Use correct register values for mpll_cfg
> - Add patch to discard modes we cannot achieve
> 
> Changes since v1:
> - Allow non standard clock rates only on Synopsys phy as suggested by
>   Robin Murphy
> 
> Sascha Hauer (3):
>   drm/rockchip: dw_hdmi: relax mode_valid hook
>   drm/rockchip: dw_hdmi: Add support for 4k@30 resolution
>   drm/rockchip: dw_hdmi: discard modes with unachievable pixelclocks
> 
>  drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c | 40 ++++++++++++++++-----
>  1 file changed, 32 insertions(+), 8 deletions(-)

For the whole series:

Tested-by: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>

Tested on two monitors:

Monitor 1 was an Iiyama ProLite G2773HS, which only does 1080p60 over HDMI.
Testing on it, I found no regressions; all the old modes still showed up
and the 1080p60 mode worked as expected.

Monitor 2 was a Philips 328P, which does 4K30 over HDMI. Without the patches,
the 4K modes were absent. With the patchset, the 4K modes are present,
functional and picked by default.

Great work!

Cheers,
Nicolas Frattaroli


