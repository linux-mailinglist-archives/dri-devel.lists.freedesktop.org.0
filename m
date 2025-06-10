Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76267AD35D5
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 14:17:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 741EB10E52C;
	Tue, 10 Jun 2025 12:17:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="nj9GTzqI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD3D110E537
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 12:17:15 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-43cfe63c592so61695405e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 05:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1749557834; x=1750162634; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yJibE8vzk8gYYAz656wGhXQdfbfshNUam9Sx/5ZqBBA=;
 b=nj9GTzqIfki3ACO9EVkUV0gPiIVybDK1OrnoHwwfMReEEYxAmko6u6JH5tHx8uaYel
 iBMCt4PChE3tiI7kTmFdSGdes/EDNWW3dnjcWzO3d8dkOCDwljxSK5nhUf7MV8uVuTET
 jb7YN4S7S/2C4B87uQCAZjquGL+barbcQtwgFaFIOgbFnzG6vJ51QlBYzLt5YVaTkoWh
 UTbtsYHx/ymC+Is7fpWXOkHAEh41hwt+qas09ez2UyrPu1JYJLka8D+sdw2+bOiZNRjO
 bVJyr1Ubatyn8zFl2PBb6FggBIjHRV08e4JOGiz8+XdflktNTpviBBPeZQ2CNkx6DZIj
 Vw9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749557834; x=1750162634;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yJibE8vzk8gYYAz656wGhXQdfbfshNUam9Sx/5ZqBBA=;
 b=VSUeZwUGXV2oDUodAUDblAYa+haskqk8YBWSSpvaL1c+RRoECBunMoL9M/ZNiHSNBZ
 WhhsHTlBT4minBshg6mw90OWUKpUvwbgCO7kT7oMeALMCV8F8MVzcbBtPa2nTVBCQ2OE
 PBQBs9XpCpemDtpCaVsmhP8rmsMrmMeBE9yKP6pi+Oot6Ne9/oq1XWugzoEw+stE2dYw
 Aa/tmwSAw4rZowvRratEv/2qBjHRgbN75d6ruHiC9buJGiHG9bZkbSvmU36+O2/k0JY1
 Xfx23tT5wrMLuV0wR0xiexHCtqeX9q6J5Yrl6vBdQ3F/rI9QcV63fhdQuzE6Ynv5dKU5
 HcUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWc4B1KzVU+4WAgVdV2BoEh8oWld+9Q+Wg5WtHZfz33k0EUk2hYXRAXC0LbGgLp3JDTOOEC7of7Q8w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YySArqu4lExcqW/PO0IFxC4Ln1VQ5TBLuL6seExjUR63WqACjhE
 pLN2ljCVaIRHSVjhzjzoPyVQrLuWhJZQCWJRX4JU6b5pzNJCPu0t1Ppaujh+Y95rr94=
X-Gm-Gg: ASbGncucRmsU7EBVxNMhbOboiD7lmC700baQPZ7Y6vyT0xmb7gT7zALRFvTwVxUW9UX
 m5vzT5O2u7aYUjTTWQBxdvccfU7ed2nKj7RU0cC7UlsDCgjnjRyeY1JsUySXsYsIUyZwiszsvKD
 NZR8hyjfWtWS3cyvA52qyj8wAmd1QaeEpdOFEwpUMFNjPbMx+c8pOB/zr6EMkOQv2MFWryXq2jr
 px8NCad5qjKyU1VrooFqBmjNf36rmLI8CJ8XPK/8JYx5K1zDEfanlPt63dyRC0PST1sZvAhsV4B
 yWuJwK7dH9r+fiTz051sccgmbG2ChnDPlnP78slExRHG11qz0qYvmcfJeVMqqFxwDQSUUR+sl66
 7j7cFHsWy/zKpYixWbQ==
X-Google-Smtp-Source: AGHT+IHeRxL7AIpQs/dULM8FxMsmTh1TJE0pgJiXuKAcZExlRGsP8IQNBSgadCI7/pKMwjfUXDxtaQ==
X-Received: by 2002:a05:600c:1e09:b0:439:643a:c8d5 with SMTP id
 5b1f17b1804b1-452012ace18mr187168685e9.0.1749557834455; 
 Tue, 10 Jun 2025 05:17:14 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4526e1595d4sm136313625e9.16.2025.06.10.05.17.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 05:17:14 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <20250609202751.962208-1-martin.blumenstingl@googlemail.com>
References: <20250609202751.962208-1-martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v1] drm/meson: fix more rounding issues with 59.94Hz modes
Message-Id: <174955783398.1721274.13530320235871545331.b4-ty@linaro.org>
Date: Tue, 10 Jun 2025 14:17:13 +0200
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

On Mon, 09 Jun 2025 22:27:51 +0200, Martin Blumenstingl wrote:
> Commit 1017560164b6 ("drm/meson: use unsigned long long / Hz for
> frequency types") attempts to resolve video playback using 59.94Hz.
>  using YUV420 by changing the clock calculation to use
> Hz instead of kHz (thus yielding more precision).
> 
> The basic calculation itself is correct, however the comparisions in
> meson_vclk_vic_supported_freq() and meson_vclk_setup() don't work
> anymore for 59.94Hz modes (using the freq * 1000 / 1001 logic). For
> example, drm/edid specifies a 593407kHz clock for 3840x2160@59.94Hz.
> With the mentioend commit we convert this to Hz. Then meson_vclk
> tries to find a matchig "params" entry (as the clock setup code
> currently only supports specific frequencies) by taking the venc_freq
> from the params and calculating the "alt frequency" (used for the
> 59.94Hz modes) from it, which is:
>   (594000000Hz * 1000) / 1001 = 593406593Hz
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-fixes)

[1/1] drm/meson: fix more rounding issues with 59.94Hz modes
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/0cee6c4d3518b2e757aedae78771f17149f57653

-- 
Neil

