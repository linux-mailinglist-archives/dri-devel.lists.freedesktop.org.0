Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0931977ABC
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 10:12:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F3DB10ECB4;
	Fri, 13 Sep 2024 08:12:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="XG5vK3QV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5815C10ECB2
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 08:12:20 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-42cc8782869so17686425e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 01:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726215139; x=1726819939; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t0r5NSVGvA6R+p9isw+xAU6FXGHr3gH4wttEfKwzaS8=;
 b=XG5vK3QV+mPQh+G9nx1jeqRqrwSfa/xCjblJK9/hh+FuGBU77UhBZXLOJDvdbmeQUD
 7/uzlXgjWWATb/XhtAoD47HPOvmLOUbjUEQBP1Fd2EDE+DK6y7ODT3ED4i3S4TIs7Lkn
 SyF/Qqf6j//RkpSCKBUzI4/+3RAHzI3GEmrV0kwk7Duez2YeCJHvJNGfzU/skyMAoG44
 JeT1/OAsO9iDstQ1AoHj/vVOvp1w3oMXv5i2hflBhMcwW6TytmrGBrRD6AQ57YiIl2s6
 1aKPOUigzNijmMoo59ZZeX1IEX38dZQWuAbc+St/aklqKHF+H7nICFGQtuTcI/r9X+kt
 4xqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726215139; x=1726819939;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=t0r5NSVGvA6R+p9isw+xAU6FXGHr3gH4wttEfKwzaS8=;
 b=etprmW58Zeg3SpPYnVRtAo1sD9u3E9TiZlDK58A1YhvUq9cYKTzcuTq7cKcVpOM5Fs
 XGRxkCUIh7oQQtesPvPQq/HeiYGcYwq0GdwxXLXEo0HUyXcP+CBGwjZVjmYbgvJYGEn2
 j2Ssl1fCzO45xyizjBzi62zEOe8twc1CneIbYL3r2sz5QVqnefTFpNFs7Nz1gTaquXs+
 VzUdJsncY21Pb2NKLTw8eMkziIYE6SqTlvsXOzDpfy05eYi+4MqmDm3PspJqpudd67pn
 uHP3wJRXko4AS65ulI6vu0v5KhuWMhgvyXlBudNqfpgAkR6OODKDrypqSL+fYnnp8DmE
 g2xw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWlC6Gl7j0ZXM/UKU64YMKi6mkfPwRHFlPYiN6BN/BzvDS0+RVL2Fq27+NjpZIdmQYZht6lSC4isLY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyAPXIL7TcDoE8LPrS7XUkusr0JGoGNATtJ4VmJIOmuHgYcwvMk
 rZU++KBybCxE48S7yrXa+ZnPhfaA/qAz/zExW+3WDgbsSdcHtCWKrGEptIBlMC1DD5DHjVwbnzS
 K
X-Google-Smtp-Source: AGHT+IHKCoqIrR00MIB2H5fC4M6tQHk0HWR3yYjAaCZBvq8+1I8/ph5GwodmeCdVgTr2vxoTjiNoXQ==
X-Received: by 2002:a7b:c453:0:b0:42c:de34:34c1 with SMTP id
 5b1f17b1804b1-42cde34376bmr39361535e9.2.1726215138694; 
 Fri, 13 Sep 2024 01:12:18 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42cc137556esm106939955e9.1.2024.09.13.01.12.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Sep 2024 01:12:18 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: rfoss@kernel.org, Fabio Estevam <festevam@gmail.com>
Cc: victor.liu@nxp.com, dri-devel@lists.freedesktop.org, 
 Fabio Estevam <festevam@denx.de>
In-Reply-To: <20240626230704.708234-1-festevam@gmail.com>
References: <20240626230704.708234-1-festevam@gmail.com>
Subject: Re: [PATCH 1/6] drm/bridge: imx8mp-hdmi-tx: Switch to
 SYSTEM_SLEEP_PM_OPS()
Message-Id: <172621513800.966490.6367488933916767161.b4-ty@linaro.org>
Date: Fri, 13 Sep 2024 10:12:18 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.1
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

On Wed, 26 Jun 2024 20:06:59 -0300, Fabio Estevam wrote:
> Replace SET_SYSTEM_SLEEP_PM_OPS with its modern SYSTEM_SLEEP_PM_OPS()
> alternative.
> 
> The combined usage of pm_ptr() and SYSTEM_SLEEP_PM_OPS()
> allows the compiler to evaluate if the runtime suspend/resume() functions
> are used at build time or are simply dead code.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/6] drm/bridge: imx8mp-hdmi-tx: Switch to SYSTEM_SLEEP_PM_OPS()
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/017703370638c07cd6affe661118f697ee113881
[2/6] drm/bridge: imx8qm-ldb: Switch to RUNTIME_PM_OPS()
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/02b16c5236e1823047f001b9496e59458c9a7482
[3/6] drm/bridge: imx8qxp-pixel-combiner: Switch to RUNTIME_PM_OPS()
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/be227772f7e957f98c3c828459b1221cae84de2e
[4/6] drm/bridge: samsung-dsim: Switch to RUNTIME_PM_OPS()
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/5de3c40a1dc503bf915bbc048aa8f5efb369650c
[5/6] drm/bridge: dw-hdmi-cec: Switch to SYSTEM_SLEEP_PM_OPS()
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/46fe7763c65674be67828cdbe3a72d6d9b8f8aa7
[6/6] drm/bridge: imx8qxp-ldb: Switch to RUNTIME_PM_OPS()
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/8fdd9cb4f8c03a943090ef55ffb552e05c6defc6

-- 
Neil

