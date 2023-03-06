Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E636AB8B2
	for <lists+dri-devel@lfdr.de>; Mon,  6 Mar 2023 09:46:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB64E10E15D;
	Mon,  6 Mar 2023 08:46:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3B0D10E15D
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Mar 2023 08:45:59 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id r18so7954335wrx.1
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Mar 2023 00:45:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678092358;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KGgblINf1oSUrHE7vG5UT+0t4KWItuliO8YSeFEQXWY=;
 b=iOJyqICbzCSAVKWpCfc6JpA9YbSYbxHXP4R5jAPaCHCsvueoKbxUQMlYCWgeLcrbge
 Hncqgks31sxch5hNeBQqK7AENqtXDM8PGlZ6cTh5f86NaLzbFiqGx4WSupKawRwdp6E2
 f8ODmJ9eqUvR9KcceYLmgQz+4kdBCnjeNtq8Pj2ANL44gtk/vn07L4AESDHjmP5tuf6k
 0UKHXzk3KhV2mjSzwr9B+s8L7CkUKxmRrJCCeuyriS+00MWf7nCScqtTnrGZUU4Tebs2
 kxXFmIBLzAkg3p36h37mkHUvEwyIlIw3C1/VsQkbr/ALxDPLFn6quZUHHuZZWCKu9XWP
 vsEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678092358;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KGgblINf1oSUrHE7vG5UT+0t4KWItuliO8YSeFEQXWY=;
 b=mzZbSJ5+i9tF1yV7m0cnbwejJ5c1h0/1EYn2Te3zlYarHHvhChfZAZ/P6LONUwoYZG
 5UhuLMhKBKdp7q+eYEIz7ZT3qTHozaa7GfmrZzvV4xzCizXKOIYTcHhbNfghIT51wh4q
 RVyKOYwm3W1Y3uEfLh5BOBmLdcWsB/S9dQPy+d30gWpAdcvHs4tz7JeHnZKzFhcsT4Kd
 wXBzLle25Oq6AL6dUP2VnUcqTzVh6iHfIHDZHqE9BroCHGjqFKLCCCsO10M4G/IYmBgl
 LjmvEZnJ1/kh3eB2O9PjSZWl3rkrD7v+ve7sVEtQ79iu1d4To3615iEQbTnrjgn9oC2d
 udaA==
X-Gm-Message-State: AO0yUKWGc1jqQIP/ZmBaByttNrvFUuPKk34ZcjK9ggZMKycJSdsHF486
 y0W5m04MuvsM4vA1fjxEtQpE5w==
X-Google-Smtp-Source: AK7set/Gb8DdX2nE0tkhozoqEePJKzDSd7X/y8H/U/U9bI2QOtXMyKO3rmaLpFPIItSL5DQyJNdN7A==
X-Received: by 2002:a5d:5407:0:b0:2c6:676c:4af with SMTP id
 g7-20020a5d5407000000b002c6676c04afmr5664040wrv.36.1678092358179; 
 Mon, 06 Mar 2023 00:45:58 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 h18-20020a5d4312000000b002c7107ce17fsm9345093wrq.3.2023.03.06.00.45.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Mar 2023 00:45:57 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Da Xue <da@lessconfused.com>, Carlo Caione <ccaione@baylibre.com>
In-Reply-To: <20230210-relax_dmt_limits-v2-1-318913f08121@baylibre.com>
References: <20230210-relax_dmt_limits-v2-1-318913f08121@baylibre.com>
Subject: Re: [PATCH v2] drm/meson/meson_venc: Relax the supported mode checks
Message-Id: <167809235742.23820.6915365420027351819.b4-ty@linaro.org>
Date: Mon, 06 Mar 2023 09:45:57 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.1
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
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, 13 Feb 2023 10:32:09 +0100, Carlo Caione wrote:
> Relax a bit the supported modes list by including also 480x1920 and
> 400x1280. This was actually tested on real hardware and it works
> correctly.
> 
> 

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next-fixes)

[1/1] drm/meson/meson_venc: Relax the supported mode checks
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=bf458e5b139894234444e4f88500616a8398b719

-- 
Neil

