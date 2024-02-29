Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD51486C43B
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 09:53:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D53310E16E;
	Thu, 29 Feb 2024 08:53:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="qYTrc3qG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6668D10E16E
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 08:53:06 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-2d24a727f78so7206161fa.0
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 00:53:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709196784; x=1709801584; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=6YCkAMwndPY5JXUyFNPlUTDBu8Mn74IDbgKtuE9Roys=;
 b=qYTrc3qGfMEIws+NoV1juDHM1MH8mIGboG6v4JvY+sdcuVadrnNZdckIYczAefUbxd
 fAYSYxYDEY9N+rj0RTCDgjb7N6KmWm509RqfWa4WUnBkslY/pBHD+PrbgUtMi0m8h8qK
 rd2Mhj7lRiy7ES2u/jO5ygYV8TG/VkWeoZcMBHfm/Uq8J3FDiUr8xnXWhamtNaaHu80a
 kOWfNDQBLgwH4z3/p3qLO8PEFsd58JJJ4pigddiqDDq4UAZw5FcrG6kDgnvdRj4DOrLa
 ZYSWEhTQ7s4vakD321ijz4xsWBA5VPhB5JNwRltN1xEbGZJi9SkO6z9W+0WKYXXPdqjT
 ux/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709196784; x=1709801584;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6YCkAMwndPY5JXUyFNPlUTDBu8Mn74IDbgKtuE9Roys=;
 b=pvAH5l2PX0RUVtYO5YDb4MWl0bz28RzUzoE83SU8JhQ4dMZLFYbGGXvkyceyI3cnig
 UyUXD+JmO69uGXbDiLiT+vcFKIiy1XWQAh33jPPmEWfGQRVnP+ODtfiOXDcjZwEYk6/p
 lRb90Oit9qg0+GkldP9HX7/9phxR1ZA2qHueZUDGqYybXwIM1077xMLIKDl/ns9yBoUr
 byd3errCOvFTu7qiko9TqGw7JzQq06dbzj51LBVH3Usy8ckswdo78AjbdFmay6B3WNuw
 au+4JaYEXlpyKXM6o7RA4MhnEg0reutEVZzMN12+Uc0JnQEhpBQ2hZinzTjzxZoPKBcQ
 LpqQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdliGJ++l2bpRj9digUohPJWkQqFOHoXpsg6u+gFLgr2KuOAyz8yduWeboYxX5MoZ5hilo12m/8SfQT8oSQJGIe07svHq2bgxPNT6wg0fc
X-Gm-Message-State: AOJu0Yy4NHQgwMkNjrowW0gSHfDlrWHHx5vegiSI65i36Xyrtf0hbzkc
 J1iHA8+WrglSgby4Vtpcs9N2Frwu6hL7g1s9zpUF2s40sD6kxg3mmT3juu077TDqAqTtG/W9rCc
 x/wU=
X-Google-Smtp-Source: AGHT+IHi3einEO6k8IOuS7H+FVSXmqnBzg3Xm6fjChZanRXFLI+Eg9cbk9F9XQqbm4zd3PzaOUZEUw==
X-Received: by 2002:a2e:854e:0:b0:2d2:cdb8:2dcf with SMTP id
 u14-20020a2e854e000000b002d2cdb82dcfmr1057749ljj.36.1709196783988; 
 Thu, 29 Feb 2024 00:53:03 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 n12-20020a05600c500c00b00412abfb0ed0sm4715433wmr.0.2024.02.29.00.53.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Feb 2024 00:53:03 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Richard Acayan <mailingradian@gmail.com>
In-Reply-To: <20240209001639.387374-6-mailingradian@gmail.com>
References: <20240209001639.387374-6-mailingradian@gmail.com>
Subject: Re: (subset) [PATCH 0/3] drm/panel: Pixel 3a Panel
Message-Id: <170919678300.2018319.4183838499915522690.b4-ty@linaro.org>
Date: Thu, 29 Feb 2024 09:53:03 +0100
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

On Thu, 08 Feb 2024 19:16:41 -0500, Richard Acayan wrote:
> This adds support for the AMS559NK06 panel with the S6E3FA7 display
> controller and enables the display subsystem on the Pixel 3a.
> 
> Richard Acayan (3):
>   dt-bindings: display: panel-simple-dsi: add s6e3fa7 ams559nk06 compat
>   drm/panel: add samsung s6e3fa7 panel driver
>   arm64: dts: qcom: sdm670-google-sargo: add panel
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/3] dt-bindings: display: panel-simple-dsi: add s6e3fa7 ams559nk06 compat
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=2689b33b88641a3b9a8cc411a0c8094cbed7e871
[2/3] drm/panel: add samsung s6e3fa7 panel driver
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=bf0390e2c95bf630b22dddc7cde5f83762b658e5

-- 
Neil

