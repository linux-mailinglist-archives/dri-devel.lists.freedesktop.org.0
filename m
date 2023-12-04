Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7489803636
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 15:17:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD12410E262;
	Mon,  4 Dec 2023 14:17:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D16C10E262
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Dec 2023 14:16:38 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2c9f57d9952so21777301fa.3
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Dec 2023 06:16:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701699396; x=1702304196; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=n6YMpMOZZj4+cuOxRYdI7nrhzUfHZl6j32N3A+bPyU8=;
 b=Q+ksX5alqAWjJoVYBEPayWWJ9BR4PlR87H/chpom/ZiywFfScZvYub+OVYBhWMhrUx
 lzZvZHu9/Ko2/H7TdF7yY5u8HY5K9q2JbYE5lpWXPRjzSFr0XfWkNfdFjyQO9EPvNlaN
 ywaMAAWU8P5Uv4AvJfJkM2F7jckIcBsqQ3SFFO6wQLjCMwHAwgacsbATQghIx9sXSggJ
 rUjv9dmykypsoWF0H7JtbTxvS4K7nQmf0UidH7exWEClVX8xWdcFLMROWyrPgL0gGGY2
 C/XwJedxS6eOgoT1aA4SGDjjSWPbBboaAXlZfGPOUarBVNgi0hudrhNntwlt4Vdkl9/y
 LEbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701699396; x=1702304196;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=n6YMpMOZZj4+cuOxRYdI7nrhzUfHZl6j32N3A+bPyU8=;
 b=O2+dpdSyoafd9iesM140jHhnKpRHe4GcEVsCxSNSt8650PwPnMsIpp2Ost6MSJSOqT
 CkcKO0Fjj9lHudAHxDVWpzCbyvonkBZT2lbvJCTWxBZXk3n26ZqwMQIzgY9m1ofzVYiS
 aS5npXnxCrhy4joXH+gT8/1/pLowY2hwDRFZ+V9biB7B6B9cVESb0j4flXM0vg3ruJ16
 jgNi51YDxnniZReZSKvfD8ClkJr+G7otrtu7HMOOFqpe75zmUydpvMaoKJ78VpMNvpD8
 fzrASFdoXeNRa0r0YCzI2oyIvMTjlIrqgJLVvndDFxr+gyV0qP2u/DXBhLjEVdVKEWEU
 6azQ==
X-Gm-Message-State: AOJu0YzuRCEAsq18lVW+N48CMVAh1lf4nZTHTFqw+d8A8sj+IiuQIpyy
 LD159FjERzQE+04HGCzWdfHZyIOnQzDVd14Flh+RShOg
X-Google-Smtp-Source: AGHT+IHxlvjohMUpKehKwnggj+Lz3P6QMDf6Qpur+3rLugPmZ4qsdPayS5BHoKR4TzBjRie6bNxfgg==
X-Received: by 2002:a2e:7c0a:0:b0:2c9:f564:b414 with SMTP id
 x10-20020a2e7c0a000000b002c9f564b414mr1344885ljc.24.1701699396667; 
 Mon, 04 Dec 2023 06:16:36 -0800 (PST)
Received: from eriador.lan (dzdqv0yyyyyyyyyyyykxt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::227]) by smtp.gmail.com with ESMTPSA id
 v3-20020a2e9243000000b002c9fda71acesm487033ljg.127.2023.12.04.06.16.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Dec 2023 06:16:36 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: (subset) [PATCH RESEND v2 0/3] drm: introduce per-encoder debugfs
 directory
Date: Mon,  4 Dec 2023 16:16:31 +0200
Message-ID: <170169936702.76859.7909470270335421365.b4-ty@linaro.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231203115315.1306124-1-dmitry.baryshkov@linaro.org>
References: <20231203115315.1306124-1-dmitry.baryshkov@linaro.org>
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 03 Dec 2023 14:53:12 +0300, Dmitry Baryshkov wrote:
> Resending, patch 1 needs review from DRM core maintainers, but it got no
> attention since October.
> 
> Each of connectors and CRTCs used by the DRM device provides debugfs
> directory, which is used by several standard debugfs files and can
> further be extended by the driver. Add such generic debugfs directories
> for encoder. As a showcase for this dir, migrate `bridge_chains' debugfs
> file (which contains per-encoder data) and MSM custom encoder status to
> this new debugfs directory.
> 
> [...]

Applied to drm-misc-next, thanks!

[1/3] drm/encoder: register per-encoder debugfs dir
      commit: caf525ed45b4960b450cbd4e811d9b247bc2586c
[2/3] drm/bridge: migrate bridge_chains to per-encoder file
      commit: d0b3c318e04cc6c4e2a3c30ee0f6f619aa8d0db5

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
