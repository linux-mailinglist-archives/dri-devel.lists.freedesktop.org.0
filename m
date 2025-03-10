Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E0BA5A549
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 21:50:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65E7710E2CB;
	Mon, 10 Mar 2025 20:50:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="jcaL74nZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B40CD10E2CB
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Mar 2025 20:50:41 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-30bf7d0c15eso38643101fa.0
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Mar 2025 13:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741639840; x=1742244640; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=MFIKZkaTfjlzWSNll4lqXgpcQhLW3KQ5qFxK5aL+7cU=;
 b=jcaL74nZ8NszkVXmqBsHSe1XEHgURelcCvtZKmlVjWHszRSrICnIgw40WqKWlyWBSx
 Ea7IC2AknPKx5eO2FBNYvp8tKYWtZFBnz3MllAHtMG6747rHjkUh+Mwk5C528dDk/5Rf
 pS+/AGqRhSxAVB485dYGvaq7xu67OTJbkZ9A2n6asof75F1paeADjciqruKUvMHvoQeN
 T3UfG3kZDAEyta7omBBrCd/jGHHcw/6dBbtQ5prK0qoBmv7SLIkvu4tLb3oeA/Yof2il
 +H+vz9XtDHZhyGYMFqU9GEPwnYk9aNInfg3I/Vadl3YOOaoXJE6YadOm0Pr9FmVF4ggc
 LJIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741639840; x=1742244640;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MFIKZkaTfjlzWSNll4lqXgpcQhLW3KQ5qFxK5aL+7cU=;
 b=X9uKrR0MvVwEuSD5QyXGDlcoc36Ot4O7J19GrqXFqrFKxXaQln+UXSspYMhx6VWLMZ
 phEiAuYTLRjgSP0n29rzyGSXjv2G7xvonHJNba15dLiTeSaeCsMGK9Zfq742E0rl7NdI
 WY6R+r02rQckRlMK1KYorndv0cEPY6IYzAXcofGUtbJ/Z6IP/gsdIyVAWP4cjrkfAeTz
 pYQOxNEf91Aiwqn2iS/1XZ2dN/+tW8NQCAI/dnTHJQm8ecC4dWE/aHPROh/XVDnUT7Ya
 qPgdE679l3DqoHXmzDHAjhaYNu+P6L8DCedB8QPES9q66MgAdJ/VQum26MuVqBX2xsFQ
 C5ww==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRJhg3VachV4EF8EhwWkVTHrWTZwLWeSYFErzinQhI9nrNOJ1bNsHLh1RfzqbhkMtWaqLDOcvF2f4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzwVwZ0NWN+iecSn5mL1HM9WbssXDuE15f1av93KKnzD/t83hcO
 T8IjPie5CR+b/P/DJ1zOBs7ONb8JCyxCBW7KUIunD8sOdRZAYkmPfdJavaWtf4s=
X-Gm-Gg: ASbGncstLmDn/5YO4tvWSB/hfosGQw6tX6/qYlQbrrelu0pBTj8U6ICX61s49JbxG+w
 56K9KBmUCHtkmRzychA3EhSHiQkSDPokx1qtZoZVIqidI9bfjFz0P5bdrcEQHeyn1ZTIAMnC1wa
 mD7jXlea4xaZVkp7giGErXvGaPg4BivlE7mkZrnnV5b8zM6uHyVdingKYKYwe3aqOTB4pm9xJVf
 +wlLJJwCdCvpUusd5SXc2YTQOuFhN8lmJdwYvP3uq/7J6/fETFQnXHPMk+dI5xv7VEqLl3opJi2
 Jc4docjKyfN39wXwDBS7LOBjH0PnlGOI/Ve9WHRYSs8MLOPoJx/BK7znWmBROYjLsjO+ypTvdKs
 7YqCM5QLs8F5PVFLe5I6L258l
X-Google-Smtp-Source: AGHT+IGcrlELrZBnhqzie4iDaP6avVfnzS9Zwuy/y5VMLk7WTqgSbAIjxpbHVS4pswFb2Tc4oA719A==
X-Received: by 2002:a2e:bc27:0:b0:30b:bb45:6616 with SMTP id
 38308e7fff4ca-30bf45e2500mr50729081fa.29.1741639839816; 
 Mon, 10 Mar 2025 13:50:39 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5498ff85e23sm1362140e87.225.2025.03.10.13.50.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Mar 2025 13:50:38 -0700 (PDT)
Date: Mon, 10 Mar 2025 22:50:35 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: heiko@sntech.de, andy.yan@rock-chips.com, hjc@rock-chips.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, 
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com,
 dianders@chromium.org, 
 sebastian.reichel@collabora.com, cristian.ciocaltea@collabora.com,
 boris.brezillon@collabora.com, 
 l.stach@pengutronix.de, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 07/13] drm/bridge: analogix_dp: Add support for
 &drm_dp_aux.wait_hpd_asserted()
Message-ID: <gnwqnapqlc7bym2nd55oif5lxxiibeme22upepbrgafilpcxxn@py5j7ju4rac3>
References: <20250310104114.2608063-1-damon.ding@rock-chips.com>
 <20250310104114.2608063-8-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250310104114.2608063-8-damon.ding@rock-chips.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 10, 2025 at 06:41:08PM +0800, Damon Ding wrote:
> Add analogix_dpaux_wait_hpd_asserted() to help confirm the HPD state
> before doing AUX transfers.
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> ---
>  .../drm/bridge/analogix/analogix_dp_core.c    | 21 +++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
