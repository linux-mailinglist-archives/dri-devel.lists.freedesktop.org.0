Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C722AA5A54C
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 21:51:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A0E910E2EA;
	Mon, 10 Mar 2025 20:51:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="a49I3h9w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 343C510E2EA
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Mar 2025 20:51:19 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-30bf5d7d107so35770991fa.2
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Mar 2025 13:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741639877; x=1742244677; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=kxNF8e48hf51wGrFc06CsODYSc9fXYwI5IwZer2AB2U=;
 b=a49I3h9wIYz1stRYF4ps6b1VgN5rn/oCrkETRAtNzdSnmaj2NGKnjh/m8OWXLKBV7m
 7RLmd6m3e9cAe0z5dG5P/JelzTtg17at2TgA0acBHNTYeqWqJ8HT1RPnRrokxJaYjeRh
 dyG9aqZEMAL8exSGGXP/sk1udkkMpDHmvcy3BqJKvbnIOaYRYxf41toLp3sSptdFYDp1
 zOCxRi/Yl0oN96LG6AxuhzHaUiJT7SQRC0YpCnmcPZ/oXViGrKYGj82X42ZG9Q/tj0+e
 JsJ5qRFru+S1JFjzrtMvWHEdYVOLzTu4oRYSkuN+zRqClQ2S0I8PNFlwT3A3DTGq6Hyf
 d4Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741639877; x=1742244677;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kxNF8e48hf51wGrFc06CsODYSc9fXYwI5IwZer2AB2U=;
 b=ImEpgjzKvn1mcnACR0yJVkTJAHfRtvsRVXExJz8ncVUvIxpwS8W3ttIG+IPK3d3tJ9
 uwmLX3s8OY6cQo4nd/QX3PqHbEs/MpY09CQh9huIz264TGPbXEayHXecH6+y4J1xtwol
 +0ZK3jNj79AEqDNK8FehmgG0hew1w9OXo7cIfT/AvKXnbRhXRYodT+jxSZbTn+sRalb6
 905BaYnd7n5UZqAIjj+qQURkZdYQOZNy8JxIGbGgddvInJwKS6OrGJ2NrdfEoE5acmiG
 2ih6hllzauCcV3OBRCUwKMdeN4AHIf2uLEDJ+nr60RyhG4gjP7NkVnu7s7OLoN0W30c1
 ujoA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZYAhQ5PVTxpkGudUcQtY3ekfphptmvE2OOIzTA/S0yRqpyE1oGMlnrsn6w/j8qGMCVn+cx5tL8CA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwpbabugMlgmCeDbRNt8npaq15z+93ZSZQ2Gh7V1s5itWUIIJPl
 lX5OgEiOhbQBqLZmaqZqyS1FEk6XlwuGBAkPgjSR29hkO9hl/n+ySzHC9FznCGQ=
X-Gm-Gg: ASbGncu3L0cr9L9BhtRbKJki62avNdilN1QvCkOKm+39URjzvrVCs6++vFI3MY9yM2L
 wlR4zkv/7muyHh+snkHxl4mPun3zUUDM1KVPnwY3SOOXZnFRGEWHs+Lv0hwt4DmH9L0KnkSYy+b
 hOB7/W+nsWxF0iCzgNeo7/tn5ZXBOzSFsniCmpvRE2Vh0r/1p4BBntQZuC+rfxJ2oIDQrwv5Ev1
 0Yi2ZqvLX9rMjlpM7oQLLUHjPnFDeEqzE8M46ZZDZXig28tgFMv8M66eqFs8p/H3gQJ1h1B3LhW
 Cr3a5mtQJiTK5fst/Y1Y2LENbEtou86UfB2MGlCUYa7GG5LgHf+B5mVnBUpOcy+GCxb4DXQkQC0
 SZ2WySHpBHY6tf5784NQu7aOr
X-Google-Smtp-Source: AGHT+IFPbDF/2E9yu0QkgjYjNcSbSQMHb9SKSyVgCW0jWJzt0rN/zgSyXWNMQzVNMXXx8FaEgf2kjw==
X-Received: by 2002:a2e:81a:0:b0:30c:12b8:fb76 with SMTP id
 38308e7fff4ca-30c12b90187mr13907201fa.15.1741639877485; 
 Mon, 10 Mar 2025 13:51:17 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30be99e81cbsm17438501fa.93.2025.03.10.13.51.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Mar 2025 13:51:16 -0700 (PDT)
Date: Mon, 10 Mar 2025 22:51:13 +0200
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
Subject: Re: [PATCH v8 06/13] drm/bridge: analogix_dp: Add support to get
 panel from the DP AUX bus
Message-ID: <mz7qmjokw4b3zk4y2u45ykzgtgqpsu6f53pflhqodyjd6svvvk@7jzggqezbubl>
References: <20250310104114.2608063-1-damon.ding@rock-chips.com>
 <20250310104114.2608063-7-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250310104114.2608063-7-damon.ding@rock-chips.com>
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

On Mon, Mar 10, 2025 at 06:41:07PM +0800, Damon Ding wrote:
> The main modification is moving the DP AUX initialization from function
> analogix_dp_bind() to analogix_dp_probe(). In order to get the EDID of
> eDP panel during probing, it is also needed to advance PM operations to
> ensure that eDP controller and phy are prepared for AUX transmission.
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> 
> ---
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
