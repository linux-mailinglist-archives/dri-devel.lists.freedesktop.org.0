Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 372B99B7882
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2024 11:18:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B97D10E84A;
	Thu, 31 Oct 2024 10:18:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="h8RiFVdj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E322110E118
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2024 10:18:07 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-431695fa98bso5762015e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2024 03:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730369886; x=1730974686; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=++I6VqJCyRbg5qV5kQRdcBUHLFkZ4m5nL8eAAwYYm6w=;
 b=h8RiFVdj5vnXxNuT3M4LYFEHmAhyw7TesjR7XCayUsvurvVB2DiAPnQdFik4GZxM2W
 NtMbEZNw8iIDXG6C8F5TReeC9cypOoFR2ICt4mXpy2smEnp7jlaedSfNtUkEr3VVeg7j
 BQXK+NHP2/E3XUY5iQx/3zkXM0+I22+/apD1vAILGkMb6Is8289gvvrr359jpzm1qaNY
 TTYlrI7SztYZyESu1kVkXKFLUZhXbBFk18+y8YYTgMKMZ3bnoCIfZdv/lGiNxKvCh4D2
 i/R5kyXrxOmtpjsdMYOG7ID9uRFtqiXGPSPMRL3A9el6xZ2Q9CsF9qcnnyEN+nJU5GHo
 Ajbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730369886; x=1730974686;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=++I6VqJCyRbg5qV5kQRdcBUHLFkZ4m5nL8eAAwYYm6w=;
 b=bWQKwObDZ2mWaK/LzMol7N5Ozm/rJHPKVoQMdStKMc1SAVwKstEp43cOVHjdHlXDqN
 9bnWqpg1lZxKRRImceCzHrasVKq67Kzc8G8zHdVeV/ZQGsKwKuh5O1iZPdrEtnFO9Ufs
 1oB580Xkn5qyWP5gY+dMWTIg+V+abggA2Vy4EvafUEJ7MtdiptkYMKYiSx5j5rgCFHbo
 jpc+sPQ8/7ceI0Rmc5PlL8HKpDmZJoYO3uRw6ht+KfLkaX2MOKaSjt3zOl18y+tamUiV
 LpHSz2pqaDa0uhS9rYxwBLaiND0p/BIr7KExv4gJdFqoijK0tdMd/eHSsOT9tI3qp/aF
 TVRw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZh1duVM6n0plUek+UkWuwTvaQIQIobsTQWOdAh+6yruUWV6WdxdHlC3iZEqFA7dcRlG4w8PLgxXw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwxTqI2yJK3BEI9LXeIpsIXUvAS6+xDDWxGU+fA0LAY5XrCZuA3
 lVp0KF/MgBnI3hSxrrppkHat9GVpaCvPbpchbGEAziYIR+CDovC9xNBZmx785tc=
X-Google-Smtp-Source: AGHT+IFCRLPGtIPF6tRE2AyAxQDhAyV+0h7hIFIEU+Nh/dwxW4Kz5xoW31kwwd/rlL20IjNGyEPQhQ==
X-Received: by 2002:adf:f5d2:0:b0:37d:4afe:8c9b with SMTP id
 ffacd0b85a97d-3806122165amr11957339f8f.54.1730369886249; 
 Thu, 31 Oct 2024 03:18:06 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381c10e7449sm1678420f8f.49.2024.10.31.03.18.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Oct 2024 03:18:05 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
 Tejas Vipin <tejasvipin76@gmail.com>
Cc: quic_jesszhan@quicinc.com, dianders@chromium.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
In-Reply-To: <20241026035928.183454-1-tejasvipin76@gmail.com>
References: <20241026035928.183454-1-tejasvipin76@gmail.com>
Subject: Re: [PATCH] drm/panel: leadtek-ltk050h3146w: transition to
 mipi_dsi wrapped functions
Message-Id: <173036988553.2180741.3119878414360083645.b4-ty@linaro.org>
Date: Thu, 31 Oct 2024 11:18:05 +0100
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

On Sat, 26 Oct 2024 09:29:28 +0530, Tejas Vipin wrote:
> Changes the leadtek-ltk050h3146w panel to use multi style functions for
> improved error handling.
> 
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/1] drm/panel: leadtek-ltk050h3146w: transition to mipi_dsi wrapped functions
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/766515ab5bba959fc8036e77e875a672916ba8fc

-- 
Neil

