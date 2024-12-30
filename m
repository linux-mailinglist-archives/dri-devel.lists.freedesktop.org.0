Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 829129FE61C
	for <lists+dri-devel@lfdr.de>; Mon, 30 Dec 2024 13:52:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E52C310E4BA;
	Mon, 30 Dec 2024 12:52:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Lr/9YVpV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 255FB10E4BA
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2024 12:52:36 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-53e399e3310so11190173e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2024 04:52:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735563094; x=1736167894; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=5Whv3w5+5QDDBIWkUbKKLfY2NqWbDdylwB0SvEbCmtM=;
 b=Lr/9YVpVvI1M//1bG9UMcZ4hjZQtc9RgbwEGRYZXQRuYiYpNg1Mp9kuw+h4kWCV7eT
 ti3JYCYzCJ2Ok7636DRsKDviW1vU30mrU2p/Nu0/PY4f7soCwOaExbbFSei7TlAY+zo+
 3o0uqzl1Por5Iv0CKf0s+wpIO08OHr9lLpORN0/pRCPy70FvkBGO/vLYwtrzSvMBcBwG
 DzxUEb3XN6EM75O9nNs0CVtG+1R9fEB6B5hqjYc4cNRwj2f6JmMUzRzouCsomZMRBrSU
 9MAHgVLjwCaxTkoKXSPi/tch7Dl5CDWN35a6prW52v7OdFmYQv/5VZ3SV3ns7muYou4n
 Alsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735563094; x=1736167894;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5Whv3w5+5QDDBIWkUbKKLfY2NqWbDdylwB0SvEbCmtM=;
 b=dw/CeuGz8MH6zIy4WeyMWKvTH0usnqnkxo06RBx2oyohf1jrSoHJIXKiXruhxqe25t
 CIeC2C/PugGdKqWU4D2teWWDrzHc39d/T4cJpkao1fT0agSWBuW+1eItsaNaGYg3S1DL
 uKHO2P/JMNjHLPZQeBqLDBpGAIJtOoykbwSYwt/rll+MqIr9VGebaRHor2SquvME5uqe
 3aa11xLQ1emMPxaMYc8H2Eub1tTiklK24N0rMmg9qzrhFln4B2oOjA0kSjn2lJNXRVbj
 MQGejjo7ujdTjzq+ExmVzbmB+SknN/LurMDk8cOrGrpvlecOvSEk8V0PS4XkSKx7mV7I
 7WSA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4MtGOpN0mU+ELZam9kOlGZrVkG8awYEOVvCd5rOcG0XJPlMFzCKlSXTQidjgB2Aag2pXcBp0uBMM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxHhLyiHggilSw9HinMyCokfVw3NaCR191fd3d5IrBN2e3e3D+p
 GMUJ5Rp5Mho49P4nr6iXmbaIPHULJiKVpejYGdwOUGIp3s5fElEO3KhK6wL0gLE=
X-Gm-Gg: ASbGncuxvPD7YjFHFQlvmmfXd9wMqYp/zuY2hyUzOnsEEB0ztO8s02u5bId4mWnKCHa
 PY9PXt0lCXgOZxPfMgwQ+SpfcnSNKejWm0pD2YQNRDb+S0npkAueiEW4Jisz1wJv/WU8ITyfZwR
 mwH9MDtWh5R0YaEtOZaBS2vbLjUdDKdSlD5606Bx8C9GS6LdHb7jYx15i51GrhA/h1q+bkod+1H
 3V5d8hDvMhnJO9S/97vTgcIdNeTh9Ej5ZXXOkH+81YOqVmxlTA+yCD7nV03en4MyK61qp/3d7ue
 /3b7iEgmUScNpkyV3r/bFOk7PLxOFEn0TqoJ
X-Google-Smtp-Source: AGHT+IEW593Bqv5NB/vO2QEA4rz6rsbxfXb7nT58hLPf3Wn4NzBw3y0XPudnrMXfV5cdFkQkrpllxQ==
X-Received: by 2002:a05:6512:1255:b0:540:3550:b0f8 with SMTP id
 2adb3069b0e04-542295305b7mr11077421e87.24.1735563094455; 
 Mon, 30 Dec 2024 04:51:34 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54223821504sm3074015e87.198.2024.12.30.04.51.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Dec 2024 04:51:33 -0800 (PST)
Date: Mon, 30 Dec 2024 14:51:30 +0200
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
Subject: Re: [PATCH v4 12/17] drm/rockchip: analogix_dp: Add support to get
 panel from the DP AUX bus
Message-ID: <tlfkh3vwuwtqiaps3l4krv2grttlbe7ahienvjlglnzzdn3czk@pfdgmrvp65yf>
References: <20241226063313.3267515-1-damon.ding@rock-chips.com>
 <20241226063313.3267515-13-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241226063313.3267515-13-damon.ding@rock-chips.com>
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

On Thu, Dec 26, 2024 at 02:33:08PM +0800, Damon Ding wrote:
> Move drm_of_find_panel_or_bridge() a little later and combine it with
> component_add() into a new function rockchip_dp_link_panel(). The function
> will serve as done_probing() callback of devm_of_dp_aux_populate_bus(),
> aiding to support for obtaining the eDP panel via the DP AUX bus.
> 
> If failed to get the panel from the DP AUX bus, it will then try the other
> way to get panel information through the platform bus.
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> 
> ---
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
