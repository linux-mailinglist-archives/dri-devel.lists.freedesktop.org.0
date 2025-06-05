Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C95DACEA7E
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jun 2025 08:55:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F21410E93D;
	Thu,  5 Jun 2025 06:55:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ec20u4a3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 229FA10E99F
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jun 2025 06:55:43 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-450caff6336so3280715e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Jun 2025 23:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1749106541; x=1749711341; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I1cmNoRs5L/SZXtziMOQOBk1cq8IiZkG+yzMUuOZvQQ=;
 b=ec20u4a3/vwAQItarCapjZjptnVujFUwtJYOc8GGukI+yQR5maaFNmVBwHFc4jb5BS
 TUVh+6DXup+0j+jASTNOqjxvrOPX9medDo2E2TlsU6THaL2yBVOLecN853mMCe8AUGCa
 /dISRUq/orT7TYsvIAJNUr/imhP5YJOiaQWtZLZGucCO9IiQMhfIkfJWxkxSuq3j3CxU
 FnIPFACVl9hA+g7tVcj1vcPdtc1u/ULVcNYYq6UMa0CH/BLMnZVCcgBbaSWwwr6QPCN9
 c9pAZXu/xbXbKuePHIxziZ4Nh2ZkPledn8oO1VW0PAFv6Mjpn1fOznIfD0L2jmvpJo8I
 tNVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749106541; x=1749711341;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I1cmNoRs5L/SZXtziMOQOBk1cq8IiZkG+yzMUuOZvQQ=;
 b=NvdICFxlu2BgcfOE6xOQibzlZZMm8FwRFW4EPo7Itb3TVu1dwrVm6LJDyyVcIaKdG2
 J2bhXRnts4+AJvxnAAQGG8981rJIfLUtiRKiUSv/7BZPhomTiG69pn2KdeIV5huHmvej
 3uEdH+hKF7kjmcIaN2CFly1GLiM9XFnCPhO+sOj/h6pbAgC8rQmhz2WIqibSGO3Bpm73
 dB77KI2Ix06Bd/zX2HtVqA3Jy/9FvvNHwc3X0JjSPjpJUrlDgrlHaHGEvmxqm0ad4rZl
 X2kukYGLAWlGEUL/z5jJukIokY50cGT8cDxA+ISDtoFykdFkAl3flW6zGnZK+SK92tON
 305A==
X-Gm-Message-State: AOJu0YwvYh0wC+W7HnXXzI1A8xXrm0pVnJDB3SjCVje18Dd31JwpXg6/
 iEpPjBiuFuC6DnUm8w0EL3pxgkFwrAhbdmonaYUyBNRoU+Hs7/R6/Ap6Qb3N7X2Cn0/yb8Y78cT
 ZPMxj
X-Gm-Gg: ASbGncu5Dm+5ks2qCkwqHLtMQKOrbgJ3kUE6iNUUH+ZUgrMWJ/H7GHp7m7vr3e3X4Px
 HZ5lr2sq75EQEymSpBFV24sV0Sw+mDs2W7XVnAcC3fDB8ghhd4Zbf5VLnLmX8QL6q2Vqh1/nCDS
 9KPdCzqg+D0FHUiqOmFmv3zIhZ0xC3jcZt9sqtDwPtsDrv/9BU9ZDKKZ+Zue1WFNC8BlnkbGRcu
 M9EbhakcTQMbXMoWnnsPB3QZY925E140/az2B5ty7Lo/p/9KareoG/YZuYFOSnb8UOQITDTC71B
 SpqwJLygGQVnR0z+oClL0XL+ACmw7A8LhnY7XeYwwXmGCBnGjixcJzGaHCOqGS96LO5Z3s9joyH
 sFc+VJLk=
X-Google-Smtp-Source: AGHT+IG4qMaCm9ff92XhUazbUDhs+FfvLsC7udBMc/0wwXw4qh4sez9eJKKpj+5LACYOzCSDf4/esA==
X-Received: by 2002:a05:6000:2388:b0:3a4:f7af:b41 with SMTP id
 ffacd0b85a97d-3a51d91d9abmr5074479f8f.15.1749106541527; 
 Wed, 04 Jun 2025 23:55:41 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a526057278sm1910099f8f.63.2025.06.04.23.55.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jun 2025 23:55:41 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: dri-devel@lists.freedesktop.org, Chris Morgan <macroalpha82@gmail.com>
Cc: linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
 sebastian.reichel@collabora.com, heiko@sntech.de, conor+dt@kernel.org, 
 krzk+dt@kernel.org, robh@kernel.org, tzimmermann@suse.de, 
 mripard@kernel.org, maarten.lankhorst@linux.intel.com, simona@ffwll.ch, 
 airlied@gmail.com, quic_jesszhan@quicinc.com, javierm@redhat.com, 
 megi@xff.cz, Chris Morgan <macromorgan@hotmail.com>
In-Reply-To: <20250603193930.323607-1-macroalpha82@gmail.com>
References: <20250603193930.323607-1-macroalpha82@gmail.com>
Subject: Re: (subset) [PATCH 0/4] Add DSI Panel for Gameforce Ace
Message-Id: <174910654079.1422723.8534685714859723952.b4-ty@linaro.org>
Date: Thu, 05 Jun 2025 08:55:40 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
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

On Tue, 03 Jun 2025 14:39:26 -0500, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> Add support for the DSI panel as found on the Gameforce Ace handheld
> gaming console based on the RK3588s.
> 
> Chris Morgan (4):
>   dt-bindings: vendor-prefixes: Add prefix for Huiling
>   dt-bindings: display: himax-hx8394: Add Huiling hl055fhav028c
>   drm/panel: himax-hx8394: Add Support for Huiling hl055fhav028c
>   arm64: dts: rockchip: Add DSI panel support for gameforce-ace
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/4] dt-bindings: vendor-prefixes: Add prefix for Huiling
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/4d20c1b073e6b501ec82db2d409f27a8eccb2b5e
[2/4] dt-bindings: display: himax-hx8394: Add Huiling hl055fhav028c
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/ab9be0b75af59876727b8a88dfc28d6b59a70446
[3/4] drm/panel: himax-hx8394: Add Support for Huiling hl055fhav028c
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/b837937c0237ea4f17493bc17f8ccd4a5e29b2c5

-- 
Neil

