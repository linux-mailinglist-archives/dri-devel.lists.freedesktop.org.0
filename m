Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2622E87EB93
	for <lists+dri-devel@lfdr.de>; Mon, 18 Mar 2024 16:05:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5043610E8F7;
	Mon, 18 Mar 2024 15:05:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Oborg7CM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D88EF10E8F7
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Mar 2024 15:05:27 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-513da1c1f26so4798715e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Mar 2024 08:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710774326; x=1711379126; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Lw55mJTDDxZ1K/cIy6WxXdv3l0985blDRwLkE03YRpI=;
 b=Oborg7CMAL0qHANoAuJ7Y09hp5QKE1Ne1zS4gjK7mr+9CPxGtDK/UOh5NniR1xW0YJ
 xQu7x4q8enAD+ahs/vlvqNJ1jDmhpO3AxBT8ydMs2L5foSyWdyUtRSL0iwRs2lxKhYF2
 isM/JQe5JGd5SaGZFEdbJxJ8iqZJ4jlly8ZLX0/fPtdqZUTTh+WnuGrBHxGURv7cs4zd
 wrGuG91npXXqSQ8sN9MSNxpAngRN24ls1HQCBgpRmJCSb9gt8sx5X3BDcZsrHvpKIGs6
 ucsIokO3negHOCiYiqKWyvpho5GxFDwxHCwqfLfkxq3bBGbbDfexRgbRzDWyxxr1+19i
 VYdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710774326; x=1711379126;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Lw55mJTDDxZ1K/cIy6WxXdv3l0985blDRwLkE03YRpI=;
 b=B8fcJwMefixj4e12FH7oMuqTj7+0o8tCr9apMmY5h0lIdlDSSAkxjgH6E4Kf8Fi+U5
 rH9XhSX/NVXYFW8Cxnx6N3JgUqS1pm4lroJlJfx5Z+OPCWmq1+DeDHKRjxQ5WNJhXF3L
 y+rBaKWNwEin/y4sGD2xk7GD4sHLCNDS7ybOLOSvFI/IOiWamG125L9ZtwiJj3jnhxEf
 aMjOHRcDGz/+WDbEYZv8gd+a6hKdqeL2XypxLMXwY9a7hqS05URNji5HgpCZqceUAscd
 auhh0sr5sFTT+WL1n8kLKqaGi01eZVgPcZtBGIABcrF8jjhXHJJHAeSNTptxKIAzjdFj
 eEFA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVAhoUCl32kl1vK8uoiMzRk5KMrPbiLknJ6HF7p7Da6IH+TDYUEup8xjlRP1h44ALcQHYnOfx2eO0ts3Ga/uHaPZYBUimuFT0RwD+pwvYSG
X-Gm-Message-State: AOJu0YxIJw+1K77FDm9qzYLyCsdulJSZ6rvZFqjqSGGKw8ZGNNDyJgDt
 WnyIkKLfwtaOJretvNtVdeZBdwT1dTwhaGKcJtk9ZJCySeqMrwlY6da7k0r8jMY=
X-Google-Smtp-Source: AGHT+IHCgOcwR7UDs/bvxSOUb3fBuHIJicmJyacnVaRq5aIkQS/vidxg7StuFD6lZdBoGgYfzuNIPw==
X-Received: by 2002:a19:3850:0:b0:513:5a9e:78af with SMTP id
 d16-20020a193850000000b005135a9e78afmr8028856lfj.58.1710774325631; 
 Mon, 18 Mar 2024 08:05:25 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 v17-20020a05600c471100b004140e9211e7sm4556317wmo.35.2024.03.18.08.05.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Mar 2024 08:05:25 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 Imre Deak <imre.deak@intel.com>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240318-revert-select-drm_kms_helper-for-drm_panel_bridge-v1-1-52a42a116286@linaro.org>
References: <20240318-revert-select-drm_kms_helper-for-drm_panel_bridge-v1-1-52a42a116286@linaro.org>
Subject: Re: [PATCH] Revert "drm/bridge: Select DRM_KMS_HELPER for
 DRM_PANEL_BRIDGE"
Message-Id: <171077432467.2094782.16965623014261223688.b4-ty@linaro.org>
Date: Mon, 18 Mar 2024 16:05:24 +0100
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

On Mon, 18 Mar 2024 15:16:21 +0100, Neil Armstrong wrote:
> This reverts commit e3f18b0dd1db242791afbc3bd173026163ce0ccc.
> 
> Selecting DRM_KMS_HELPER for DRM_PANEL_BRIDGE leads to:
> WARNING: unmet direct dependencies detected for DRM_KMS_HELPER
>   Depends on [m]: HAS_IOMEM [=y] && DRM [=m]
>   ...
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-fixes)

[1/1] Revert "drm/bridge: Select DRM_KMS_HELPER for DRM_PANEL_BRIDGE"
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/dbd9698830ebafcb6f3be6498fd4a6968dcbf89a

-- 
Neil

