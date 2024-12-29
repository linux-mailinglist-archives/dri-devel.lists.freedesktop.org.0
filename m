Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B699FDD51
	for <lists+dri-devel@lfdr.de>; Sun, 29 Dec 2024 05:49:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D29710E05E;
	Sun, 29 Dec 2024 04:49:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="byHnc7dP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42A2910E05E
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Dec 2024 04:49:31 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-30039432861so94728791fa.2
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Dec 2024 20:49:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735447709; x=1736052509; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=kmRmow4ij1wj8NxR26ZZrxr/RgEq3MZKXl2c41wGPBg=;
 b=byHnc7dPSPI128QF5b9bMVztiduYx6Pbyp1RoQL1cxEQvIz2eC7wiscmZ4cojTPhAb
 a66c4Cd+9Skir3AIbQeUyCUDqQlOdCoJ5oNwycMVKmblwPGiXGTKOherKkSvA6+yyzFx
 bE56f9JRLM9WOu4Q0873QkVHptPpLGWzAyDSnvx/6yRAQ3nedX7d5o9gVUkAWaTxLi+W
 IM7VKHES+Lb1tzySEGr9pxQKFM0oCkqyLDv1PuXw6m5bEH2DcP58OQctDmiIJ4TlylY/
 GvplyAbtB7KVZ9yXYER0N7PMpTXXVc8uq+n8pYAGZ1BHxL2mXAX6ZdF/x8+C+wo6vZBD
 TBcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735447709; x=1736052509;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kmRmow4ij1wj8NxR26ZZrxr/RgEq3MZKXl2c41wGPBg=;
 b=Q+Ry0wUo7a/u32OtctUZBCJO6tFa88PmPcvW48AbHB31AWQtDQ38M+b887vUYRC/AQ
 E+8mEa4AOPCYEJI06VWqzs9LZK3ia28uc7Y1O8R0CccRUQEwb/k9dPY6OYgDMPQZh99j
 jwpOg2k6sPtoIzfjS9ohrVKVmT0cMhrs0DVDPhTqIF5Vi6gk2R0snanrg2SFa5J88z3V
 4o6dMZZ9GRctSPllp5vz0A2ZNt7AW37xcmTs2xz/m4QA4QsWsJL4ZvNaq6aG8dUXONia
 PDU11KYlMrSj4ETrheUHvEx65TjzQyo5rdF3aJC1y7niwgDg4wAa5cjXDnFRDH1wJjOt
 QXlA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUgnp0b6ZN/rShrjQy8+2R1IqmPfyrgPqRtofLzmctTKjVVlM8CSn2FZSVYxDcJzQf+uR35ihzft8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz5NUJssjZt7ueUVXnAgNjZK7h8D9f6c219jzVo/g9eB4bhy+iU
 ZEj8tqsGEOfjMi8oqjbaYEHLHkhewm9nTKN95eaSlnGmlq0QUtcG/h6u8nnuCZM=
X-Gm-Gg: ASbGnctSltUapFY2Beb0GYteU0sFsUoJEj72vX/j2FNDkN0dWs+iSIWhV4pBQWe5ydx
 aci+a7kFBQI22Waqpt+XH4JNnGP1cuKjA+asr1hGx8jK0JtgTUIwJI6QScr4f21Aj1+rAkrovo1
 PSkW+S2Rolf82vSYqGGUwLXD2kWmHkSH00A6dmhFCOjmHiMep+9tYq3jZh3j6JOktQk7yMEDWhx
 AB2gnQT7npyc6vCZcwlJyg/opftmyg81taFNsuHCLhZGIkxMEEFyLQ6z3yUz4kZFoKjaAXlBUnl
 NBPH41KUSg4SqZzkftBXTQT0uNrmybgb7/1e
X-Google-Smtp-Source: AGHT+IFLdOShLFUrgmFocbWkVBhAX2agF1zyEDdRzkJIIIUTfHxFHK7o41L90uicbnh2u3edwxhOVQ==
X-Received: by 2002:a05:651c:50a:b0:300:3a15:8f2a with SMTP id
 38308e7fff4ca-30468503587mr106112501fa.2.1735447709482; 
 Sat, 28 Dec 2024 20:48:29 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3045adac821sm30924381fa.59.2024.12.28.20.48.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Dec 2024 20:48:28 -0800 (PST)
Date: Sun, 29 Dec 2024 06:48:26 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, rfoss@kernel.org, vkoul@kernel.org, 
 sebastian.reichel@collabora.com, cristian.ciocaltea@collabora.com,
 l.stach@pengutronix.de, 
 andy.yan@rock-chips.com, hjc@rock-chips.com, algea.cao@rock-chips.com, 
 kever.yang@rock-chips.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH v4 09/17] drm/bridge: analogix_dp: Add support for phy
 configuration.
Message-ID: <nqbcp4wwvzxh7qpvlobt3mw7clj22bmq72xsaw7sbzfj3dpyll@u5mq5ciijse2>
References: <20241226063313.3267515-1-damon.ding@rock-chips.com>
 <20241226063313.3267515-10-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241226063313.3267515-10-damon.ding@rock-chips.com>
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

On Thu, Dec 26, 2024 at 02:33:05PM +0800, Damon Ding wrote:
> Add support to configurate link rate, lane count, voltage swing and
> pre-emphasis with phy_configure(). It is helpful in application scenarios
> where analogix controller is mixed with the phy of other vendors.
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> 
> ---
> 
> Changes in v2:
> - remove needless assignments for phy_configure()
> - remove unnecessary changes for phy_power_on()/phy_power_off()
> 
> Changes in v4:
> - remove unnecessary &phy_configure_opts_dp.lanes assignments in
>   analogix_dp_set_link_bandwidth()
> - remove needless &phy_configure_opts_dp.lanes and
>   &phy_configure_opts_dp.link_rate assignments in
>   analogix_dp_set_lane_link_training()
> ---
>  .../drm/bridge/analogix/analogix_dp_core.c    |  1 +
>  .../gpu/drm/bridge/analogix/analogix_dp_reg.c | 52 +++++++++++++++++++
>  2 files changed, 53 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
