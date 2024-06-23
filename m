Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C34913893
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jun 2024 09:14:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A98A10E121;
	Sun, 23 Jun 2024 07:14:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="YSWJ3x+P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 157A310E0D1
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jun 2024 07:14:17 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-2ebe785b234so34880571fa.1
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jun 2024 00:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719126855; x=1719731655; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=H/G7lWWyMcTrrdaWBAemzFpBma6XodZApkrD3joMBV8=;
 b=YSWJ3x+P9MeCB0e1f4oxI7z3gz2XKOe4Ba8hZ5BEyxsyLALEF2DfGLnhsTNmaAWM86
 raZWWL7PTspZro35plJLD6kACYBAHzQQIx58uytnaZM6BuXEIaRX3yh+MUxg5dTPPaGG
 Q1plFvv+97FyPHb75z0zQETs5ORJxWD8Ff3ceGc0jjVXVHnm/JnThAWbd0X0txbyjpEE
 T/n8XAfhyHb5M5T5jFIt4xOH/Q4uNpl0zyk+kDfaZSKUsKEO0HgIq0imVMFIQIROEnwI
 /nzVDm0xn+xgQgrSB/qh2rW89EvIzWzUu8UuLhERrbg2c+/NyNQEv5dwZLh+HAmTeGqp
 mU2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719126855; x=1719731655;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=H/G7lWWyMcTrrdaWBAemzFpBma6XodZApkrD3joMBV8=;
 b=IFgBjFYI3ajkWQ35KQSsL5JOnJAWyCIRGlKgQBBMZkk9tolzCUXJqZt3dQaWyvfj0L
 aeVb2voAnvHMiUjTCe2y+Z7D86+blp/SJuWzKgy+dMMBmp3UisYSyiHnroITqmA39toA
 DzQtfc9gUeWIDgPcwxJ2aCpCMbXNuosJZqVLKl0tJrQEDRzvw5ibPyjMyCTTwohgcG6A
 gOHmT3SJUdkyuI5FHVVjHmrwjJbXaqxb4T3ALKH2ABzehkFeiUXY63FrtkAePhN2zLEJ
 F+4Gq02YxhwfnE4DSzGp9uAKKUIZ2xE1DyXtKdzBCg+iypD1TWu6aeJhoAcpw0i54bOv
 /NGQ==
X-Gm-Message-State: AOJu0YwlZ2vZlTwDu+XqkTEVgtUWrcFmNmf7/BD3Mv31JVIsEWVtxSyu
 Acb5PirY5wApLbnNoX57MyIF3kAg1zzx8iwiOgO6p+0inWBgu0pHlkELt5WS546YbiWtd0pOwqx
 P/08=
X-Google-Smtp-Source: AGHT+IGCXzpKzAWEZDDMff6e538LG5vnXwcBSawfwbtDrYSJqp9jQVrXNBvgXank3WTFEN/iyu8pLw==
X-Received: by 2002:a2e:3a13:0:b0:2ec:53a9:2037 with SMTP id
 38308e7fff4ca-2ec5936fb73mr16089271fa.37.1719126855020; 
 Sun, 23 Jun 2024 00:14:15 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ec5b031208sm1886861fa.26.2024.06.23.00.14.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jun 2024 00:14:14 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: dri-devel@lists.freedesktop.org,
	Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH 00/11] drm: conversions to struct drm_edid
Date: Sun, 23 Jun 2024 10:14:07 +0300
Message-Id: <171912674290.840248.15020048378690686373.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1715691257.git.jani.nikula@intel.com>
References: <cover.1715691257.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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


On Tue, 14 May 2024 15:55:06 +0300, Jani Nikula wrote:
> Convert more drivers to struct drm_edid.
> 
> Compile tested only.
> 
> Jani Nikula (11):
>   drm/rockchip: cdn-dp: get rid of drm_edid_raw()
>   drm/sti/sti_hdmi: convert to struct drm_edid
>   drm/bridge: analogix_dp: convert to struct drm_edid
>   drm/exynos: hdmi: convert to struct drm_edid
>   drm/hisilicon/hibmc: convert to struct drm_edid
>   drm/loongson/7a1000: convert to struct drm_edid
>   drm/loongson/7a2000: convert to struct drm_edid
>   drm/msm/dp: switch to struct drm_edid
>   drm/tegra: convert to struct drm_edid
>   drm/imx/tve: convert to struct drm_edid
>   drm/imx/ldb: convert to struct drm_edid
> 
> [...]

Applied, thanks!

[08/11] drm/msm/dp: switch to struct drm_edid
        https://gitlab.freedesktop.org/lumag/msm/-/commit/b1510bee17f5

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
