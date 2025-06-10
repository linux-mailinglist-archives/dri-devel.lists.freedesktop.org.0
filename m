Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A2BAD35B5
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 14:13:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9559410E519;
	Tue, 10 Jun 2025 12:13:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ShuCo9Pp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0958210E51A
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 12:13:04 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-451d7b50815so46457705e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 05:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1749557582; x=1750162382; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=le0aK+IVPXNrNAOYji4i4jCtbavYpjFKQlnb+jNZ6sY=;
 b=ShuCo9Ppec+VFMpve96QN4ATtlVsufVmo7ezbKhQaz043Z3RX9ZowFXDBQLz0ZqquB
 VC1T4LSvo8ChBHxusppnvDYcfkzb1WlANenHnNy4+EVNK4v2ys97ZvBZADTvvWDEg/SZ
 3xF2vkfyoUzcuyaKzljaDr9R0M10tWZeBpaA7Bdk7oEHWkh7+uYdaOsSKD9TLuXi2LeK
 2VTaqwwRmeSR1q7I2FQ1vSqeAWvTF3hgJvQP9tJnyuFQNSlwEaTbgqQTAqfFUPEcwlsj
 7N2apOXsOzxtgGFvWz5MVsB/5q/OgLmYY795KhkVhmz6teVdqL8k4bgmGyPBYNMZdUGT
 +6GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749557582; x=1750162382;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=le0aK+IVPXNrNAOYji4i4jCtbavYpjFKQlnb+jNZ6sY=;
 b=EGtnwfELOWNA+pjT27NF8Ym43lAGD9/SQkQH0OqyVagk0zSv3khLRKVH2OZ+O3S130
 zn9l7+8KPzEUJt5YBPCsKVD5X5a7V3JfRi1h5MHQNakh6q/tqj7jijIIKY9q/YycAo4x
 +14hYxqxGCcCIKGT7NnkEtjT9dBHuo+0riY8p/9pGakJ0Ce7Cub+/m3TJWCYrThI0bjD
 nG7mcS7Me4oDbUGi83Zm6Wozc+xolKl8Idz9H65PqJuuKpZMcn39v56zlAP6bVWLpHf1
 Gkewvs+cctM0JK73lEXKvRWj3o82IFJZ9RQHsvLZi8WaMS0HaS526VA8GXstBSsZHRyq
 UBnA==
X-Gm-Message-State: AOJu0YwyTZcV2g8pjodyu8F9TGQeMoUARWo99lNUWWx8Km/D2RHcidVH
 Lmm6a7bVOYm4VmuezKhH4hltnnZuNvY9Z0jHpgbjFN5ZencLyl7zHkyem8IFsL0izXA=
X-Gm-Gg: ASbGncszgY32p+LP+nbn1WvLob6aPX22lAOlOTuPg+dvpzu9FHItRa7dKv0XGmeyNVy
 BpURuqdR2aqm6nsKH+ErFhBhei5D8b0y+bpdhNVeGCPKGR+bQZrfSCpk8umGEQHcFFa7Io/a3FO
 ulR7Jld1jxgnxOIEsXxhvkMp9SkbstYAYr8cH9lkjV29tL0B+Huc7CZcNXxMuAyqS2VRQUnzIlh
 +SDjqggtVxMmFOdb/wnbcLirRWsi0IKxFkYRpHSk2nYBPGacSQ/PjuEjRHV0F3dc+sajAqcMbe9
 E0CI5HljTTeP0l8aXTnsny/vDtew6KvAh2sFNF9AIq6PGhEUBV8Bsn8NhysuyynLPoYzK6CrAQN
 4DlC7o3toE11Nj5A6Hw==
X-Google-Smtp-Source: AGHT+IHtuwgbAB28mjkjsgeLFZ8wDfI2Y2ogosy9kF1ck/rOXLBqv8pI/FyeIKnEC4hwL0TCuba0WA==
X-Received: by 2002:a05:6000:381:b0:3a4:d6ed:8df7 with SMTP id
 ffacd0b85a97d-3a531cf55d5mr15185230f8f.59.1749557582546; 
 Tue, 10 Jun 2025 05:13:02 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4531fe85260sm9841035e9.0.2025.06.10.05.13.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 05:13:02 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: dri-devel@lists.freedesktop.org, 
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: Conor Dooley <conor+dt@kernel.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 David Airlie <airlied@gmail.com>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>, 
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>, 
 devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
In-Reply-To: <20250608142908.54121-1-marek.vasut+renesas@mailbox.org>
References: <20250608142908.54121-1-marek.vasut+renesas@mailbox.org>
Subject: Re: [PATCH 1/3] dt-bindings: ili9881c: Document 7" Raspberry Pi
 720x1280
Message-Id: <174955758192.1700488.11354565917020465872.b4-ty@linaro.org>
Date: Tue, 10 Jun 2025 14:13:01 +0200
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

On Sun, 08 Jun 2025 16:28:16 +0200, Marek Vasut wrote:
> Document the 7" Raspberry Pi 720x1280 DSI panel based on ili9881.
> 
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/3] dt-bindings: ili9881c: Document 7" Raspberry Pi 720x1280
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/808d26afdcbf1abe5176261afbf945825652b748
[2/3] drm/panel: ilitek-ili9881c: Allow configuration of the number of lanes
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/2f7e4a6997362a929419fc352ad8f424143ae482
[3/3] drm/panel: ilitek-ili9881c: Add configuration for 7" Raspberry Pi 720x1280
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/29a9b3a504c0d18bcc7f0547371409e9dcbc045e

-- 
Neil

