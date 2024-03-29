Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8853A8921BD
	for <lists+dri-devel@lfdr.de>; Fri, 29 Mar 2024 17:39:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07FF910E20D;
	Fri, 29 Mar 2024 16:39:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="kHWvMEX6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB6AC10E1CB
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Mar 2024 16:39:02 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-41549a9dcbaso10264965e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Mar 2024 09:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711730278; x=1712335078; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=2N2sjDVZQ5s5rWMc1AGGuzwDRxJwDXuM3KrfxZH98mw=;
 b=kHWvMEX6JYitPdBeHBZsNFgRZXNN5RToCIKtgL2TVhp2S2Sc3eE8TGwC5nLAEb544/
 a+ISDJlguCF85LUowPxNAhLsJti1L0cqH4r06jABuN4kdBiNUUJTtP66VpHGFa3zZZEt
 2GANNrl9UxFkc9gHEWGZQr3G9mgUBPxad6Ts630TlSoTHLjneFEVAFDtjRNmYn2wHb//
 RYoyaqMdm+wCZkh5KDOEGEhGaWnmXFhJl7fYCAUGCUBVKB6e4QpzrcltPf40r98tyyII
 nnoDE2K8Pcfa9y6GE7WkxuBbwzBAbkKKxg3ken4o0o52eTAvlgJWe5JqTiZ0gxbJhxc2
 xFRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711730278; x=1712335078;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2N2sjDVZQ5s5rWMc1AGGuzwDRxJwDXuM3KrfxZH98mw=;
 b=G/WqUUQK7go0fFVyi3MGw3LNBwxJKXLvE2PN8dpfO6tXv3w4URJsXF340MrdFULTOk
 mZmKKwt3jOEBX/6b0d6rkwRGixLB+lbz6j/MaKh8HcYXn3mq4ah5x1J5eNzTLoS8/jk+
 pMGBQfmtb5JWkpOy7RDYuTI7CIQat+0q8ZrIgnwYEO8+vViHAJJ6Nw89ndUEkqvvIq34
 67I2AA3EfKOo+qYjSgt4Ln8GOC1m/rs+S06pysxhsFT+AACrO7JzafJ+OkV/OhsstFr0
 mrvVyY6b+6kaaCf7UhewY3dwCDrHw0tzf+ev8wBbdiwQk9FB4lHrG26MZgnk47ZTCQbJ
 VZdw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVoo1HEfFhE09TDNrWPQad/E4hQnYmzbviIJlLOBIARirXIPKH4oxQoqWpLqWkz1cmXco/IDGvlYy3fcjPoYVmFGK8hC/BFtAp1BKadSY+N
X-Gm-Message-State: AOJu0YydJc7HZc6gWGneu/dAS2N06lZEyMg+eMJPkzi5RL2xa3H+tPhF
 ESLXOViC3EzqklMxSwyLLnDCp8VX8U1DHjjU+XfzLGY1qhDCFxRFKqKhuWUo01s=
X-Google-Smtp-Source: AGHT+IE9lrROr7Xt4WRR3WKh9SAKOAjngnqU+7gTIU7bJRWiC8dVxAT6q6g7+dXPYYDLeV3MgA6fBQ==
X-Received: by 2002:a05:600c:4e8b:b0:414:f60:5d6a with SMTP id
 f11-20020a05600c4e8b00b004140f605d6amr2080570wmq.0.1711730278063; 
 Fri, 29 Mar 2024 09:37:58 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 m4-20020a05600c4f4400b004146bcdde06sm5958736wmq.6.2024.03.29.09.37.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Mar 2024 09:37:57 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <20240109230704.4120561-1-christianshewitt@gmail.com>
References: <20240109230704.4120561-1-christianshewitt@gmail.com>
Subject: Re: [PATCH] drm/meson: vclk: fix calculation of 59.94 fractional rates
Message-Id: <171173027724.1500306.13941100169169682823.b4-ty@linaro.org>
Date: Fri, 29 Mar 2024 17:37:57 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
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

Hi,

On Tue, 09 Jan 2024 23:07:04 +0000, Christian Hewitt wrote:
> Playing 4K media with 59.94 fractional rate (typically VP9) causes the screen to lose
> sync with the following error reported in the system log:
> 
> [   89.610280] Fatal Error, invalid HDMI vclk freq 593406
> 
> Modetest shows the following:
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/1] drm/meson: vclk: fix calculation of 59.94 fractional rates
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/bfbc68e4d8695497f858a45a142665e22a512ea3

-- 
Neil

