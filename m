Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB0905708DA
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 19:30:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AD548F89F;
	Mon, 11 Jul 2022 17:30:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA0B08F88E
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 17:30:38 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id x91so7154586ede.1
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 10:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Sw8gkUx8zCiOOcTJXnmfRDnj5fxg2VeQXfJ+u4gc5/4=;
 b=acvDDtc3nLB2RKkk9baYJ+3X9Tc/uc6EQ3Z+eK9dFjTK30Jzc4d572TluawWOu0Uvl
 xX7BvT1dhlxTq2DjFuBLbjO5niFHLbcy/ylswUeMuNHcUTJnry2cRSA7CiFhOoqbxT8R
 xDuNfuBAWBbEyWgwPaipg25EuKfxvBm4hVFSg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Sw8gkUx8zCiOOcTJXnmfRDnj5fxg2VeQXfJ+u4gc5/4=;
 b=sS6P3qVdwFpcSIS8xJCCgLOrfa5ETzs+rAj9dU5rut+x0SQ/7BT6GVpFU/c5Eksz6z
 c9qqXhPpkCGnFmUVBpD6n3hM7IdiKK07Ha2NS7DKaV5BzB/gxIlspJEpaGZ6PFBkixjn
 IcKB2jJr/Gkp3iZFlO6LyFgI3RnOA8bOP0a/t7k279Gfg5fumtDL4UrcGVBf+ZpyJO2x
 eKpIUHrsDz3oOt5g+wuvWPYOpul2sA4pB66amo1RpuWJ5KZmC3aQFSeHd+YYUuHiQx0i
 rNN9cefHACurGjI7Pf3nVdhm+ExJCKfOuaxK8UcUK/EzaTNQzJRryBqZxFi2mxvjn/RV
 xTPQ==
X-Gm-Message-State: AJIora/7Ntn0W3XjpUqJ0msKBi88YZ+gMaxKHJwOq2PVUfoJxdUFbgaY
 /5CJvdWukKlKBO+zOca4P5WwVT8AOPfNxjlLkVM=
X-Google-Smtp-Source: AGRyM1vMwKCICdPKDb0OakwSDZb5oHRpFKax4dr7kVjOTiLUn8SP3LCAFn8S52x1Xtn0jxOQObwk9g==
X-Received: by 2002:a05:6402:294c:b0:43a:91a9:a691 with SMTP id
 ed12-20020a056402294c00b0043a91a9a691mr26626677edb.182.1657560637239; 
 Mon, 11 Jul 2022 10:30:37 -0700 (PDT)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com.
 [209.85.128.52]) by smtp.gmail.com with ESMTPSA id
 f15-20020a17090631cf00b0072af3deb944sm2862724ejf.223.2022.07.11.10.30.36
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jul 2022 10:30:36 -0700 (PDT)
Received: by mail-wm1-f52.google.com with SMTP id
 z23-20020a7bc7d7000000b003a2e00222acso2144475wmk.0
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 10:30:36 -0700 (PDT)
X-Received: by 2002:a05:600c:3d95:b0:3a2:e97b:f3ae with SMTP id
 bi21-20020a05600c3d9500b003a2e97bf3aemr4140499wmb.188.1657560237962; Mon, 11
 Jul 2022 10:23:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220711092117.360797-1-dmitry.baryshkov@linaro.org>
 <20220711092117.360797-3-dmitry.baryshkov@linaro.org>
In-Reply-To: <20220711092117.360797-3-dmitry.baryshkov@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 11 Jul 2022 10:23:46 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XQbP2OSf6vtPOQtuXajUOuQ9Vz7t7pmcSraSzcBJD2ig@mail.gmail.com>
Message-ID: <CAD=FV=XQbP2OSf6vtPOQtuXajUOuQ9Vz7t7pmcSraSzcBJD2ig@mail.gmail.com>
Subject: Re: [RFC PATCH v3 2/2] drm/bridge: ti-sn65dsi86: support
 DRM_BRIDGE_ATTACH_NO_CONNECTOR
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 Sam Ravnborg <sam@ravnborg.org>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Robert Foss <robert.foss@linaro.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Stephen Boyd <swboyd@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Jul 11, 2022 at 2:21 AM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Now as the driver does not depend on pdata->connector, add support for
> attaching the bridge with DRM_BRIDGE_ATTACH_NO_CONNECTOR.
>
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 18 ++++++++----------
>  1 file changed, 8 insertions(+), 10 deletions(-)

 This has been on my list of annoyances for quite some time now. Most
excellent to have it fixed, thanks!

Reviewed-by: Douglas Anderson <dianders@chromium.org>

Tested together with patch #1.

Tested-by: Douglas Anderson <dianders@chromium.org>


Unless someone yells that there's a problem or someone beats me to it,
I'll plan to land in drm-misc-next sometime next week.

-Doug
