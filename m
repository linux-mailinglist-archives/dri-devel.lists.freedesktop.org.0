Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C3C877C77
	for <lists+dri-devel@lfdr.de>; Mon, 11 Mar 2024 10:18:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A91E10E2D4;
	Mon, 11 Mar 2024 09:18:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="yJFEsWbm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com
 [209.85.128.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EEAB10E11F
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Mar 2024 09:18:24 +0000 (UTC)
Received: by mail-yw1-f174.google.com with SMTP id
 00721157ae682-60a434ea806so3689087b3.3
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Mar 2024 02:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710148703; x=1710753503; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=OddnUvr2yeelUv7t7V53Ryf3xtKdhUkQoQ3ZQBksq5s=;
 b=yJFEsWbmMndrjSnbaYiDFI+CEgTvq9J79ruLZVEsj0i78FqPrvcEGjXGmUy+z7apjL
 PvEHw8VOcaTrvB4zLECez0kFG4rvBQaqok/apsuTUI6q94w0IPSad3q8pOdYSIRFfp+i
 PJpKU7bWLaBAgTu0QLuYEix7/qOMx6FiXtEjw5sq3yI7HIi5+yCjrC1OEQQCM5J8u0wS
 0QIcbddDtZcPxg0N6eEIhDBka6wIZYUgTDvb0tLB7FlH2w6VO8Y2+yweuCeBwX5Y0bgr
 nawoOBjUZRZceJfCgiDfutR6S4t0g6cwEQEZBtiD6Sq47UCYHldomXn2YQ0T9p7RAJDw
 Uhfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710148703; x=1710753503;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OddnUvr2yeelUv7t7V53Ryf3xtKdhUkQoQ3ZQBksq5s=;
 b=ViRJY8+tS08tGnJTSu9gmdXtHA4ISc9oecs7q93lLv8VXy3+S9JaMM+0AboiLW+S+Q
 DNeXVpnAdO6mT+vMWvHgRZG0dAIsA5OPwiHrkh1GKmnE3/Sq3ISb0Et9kB4od9HsFFM5
 hivYY8iAxdL+JHSpo3ITwXrJ0oTklRcBe0zKLEqW3CfCDLiBBuScLOnsw8F9BU77/cW3
 P/UFbiq03Pj6uXiyIDtjPi3/4Yy44qqreU7m/3QRRzpBxJwexBUJ7cbKuu/gI3ty0nSZ
 D/UcT9cJ/aWWxbau+fE0mf2csmLL/KlYlBzkzcriehFRIjr/8oqJT2PAQtL3xWvydXGD
 XWsA==
X-Gm-Message-State: AOJu0YzhhumGdyVLrJcXyew9JiF3AZ78+oFW5q0lDXhQtSNHZ1hcgoxg
 7KbRLBmOhvZwP78UlYtx+KYrJm+EE+0RkDMNI8l8Tk6kgAUukzDLWnI47tWe1b3tvOVRwC55SEe
 5xVFAFYlTwh7sNH0rAHNdHIzT8eAs5RvQ8mGkQw==
X-Google-Smtp-Source: AGHT+IHEX1iouU1yG/Awb1oFLg4oNi0bkStT6aw9cSPtx0U9ZVN9BP/7gw+E3Mt6fNXAm4zl1ZbFZpP2n1nW2HL9IDk=
X-Received: by 2002:a81:60c5:0:b0:609:879a:aef7 with SMTP id
 u188-20020a8160c5000000b00609879aaef7mr5710333ywb.30.1710148703159; Mon, 11
 Mar 2024 02:18:23 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1709913674.git.jani.nikula@intel.com>
 <ed97f4f036263cdc4f34330cef91214970f99a77.1709913674.git.jani.nikula@intel.com>
In-Reply-To: <ed97f4f036263cdc4f34330cef91214970f99a77.1709913674.git.jani.nikula@intel.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 11 Mar 2024 11:18:11 +0200
Message-ID: <CAA8EJprRWrGsDPtAyTT=Vq7nDVkmx4DJ35xn9VAE+tzxfcKNWQ@mail.gmail.com>
Subject: Re: [PATCH 7/8] drm/bridge: lt9611uxc: use int for holding number of
 modes
To: Jani Nikula <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 8 Mar 2024 at 18:04, Jani Nikula <jani.nikula@intel.com> wrote:
>
> lt9611uxc_connector_get_modes() propagates the return value of
> drm_edid_connector_add_modes() but stores the int temporarily in an
> unsigned int. Use the correct type.
>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Robert Foss <rfoss@kernel.org>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>



-- 
With best wishes
Dmitry
