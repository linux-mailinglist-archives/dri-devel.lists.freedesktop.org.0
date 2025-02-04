Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4DDA26F51
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 11:29:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0700B10E5DA;
	Tue,  4 Feb 2025 10:29:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="gnWcAjdM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4087B10E5DA
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Feb 2025 10:29:20 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-38da72cc47bso389853f8f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Feb 2025 02:29:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1738664959; x=1739269759; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uTYKk2hp5ZkC/HKiCXz2/2xF3prSkAzoF86kxm9Tnc4=;
 b=gnWcAjdM9ZNXnA6km/yH+5TMcOLPjy0C80gQD6S1DReG6Lyn2Qcg7Ox/ACXSTE8Yhx
 LbYGp56GOED/EE3gHmb44rEt6VjZ4ip1qDYYUZWFZmJMvWwzYHHyP5zU0pJSkz2Pr/+V
 W5SlFG1LLKxl3Av+VuSAN8mYVrwpDmZYi7fK0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738664959; x=1739269759;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uTYKk2hp5ZkC/HKiCXz2/2xF3prSkAzoF86kxm9Tnc4=;
 b=tGk95Dgyu545imG+5pd4vXbygsx47MDKaGYV/40a3zfyCJetiBnkJNlBiGUJtqgRlT
 Ef/qyI5wj2ToZvccMx8tMS2REcxHPswMWNhF9qnZNUsLt51e7PT73bxC3xIkScLwLOSR
 AHP2+4NCnjG+i/2dO2M1TClijEdrtaSMpHF1aq2gVo79nK9DyGAgkj1z3Jx8+Q52+OnP
 UW4xGg6wEvTKuMBhNNpesIjBh7I9ASNQL/6kBclZxxXEkz1h2wmU76R7NhTUC462wP/H
 z5rvie73r2cx0BzTIXZ5wzCxgpj920lY9Hnxzn6ZOkIVRTjZ5z9e6I+SFd3bMZ6RGt6o
 mLcg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXsfTQf3mW+539xE0h+bFyTfg0aFlIyrg/Tv2tkQv5FV2+gjyB522g2nSBChaUBYVviCaCqn6G179c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyqNnqBPH8UwCiTEzGE+HVK2cWRGtZ7thKviPFeXDZrLC3BzjUD
 OeK1oNzYuYmUhuqUS216EEHC2BJXok+P2xXnW2Zxqeht9vNBFEzwTeCGj5GbcJc=
X-Gm-Gg: ASbGncucZbwtSNMW7HOsdF5rVMfLVj/1rX+Ah1akp9x53BgUYUDFaMShIzpTCOy0UcB
 fXgiShFtGPuUwxo1SMszrbMNOS8nTuW4lk7qCsQqDmRlJN2Z1bJoY/GO1If8t182JZQeKzVT0ww
 18nPRf8L1YkIyVwnxP3zWcK7xBC+LCzcfWyu9SzQ+RPwppvgOX/Znyvh2A1zOLpqv5Nv1JT9wg3
 /YsNRXPz6UzzZNROxwbvZt3uYOk9XvPvaw8VoI3kdzTWaBh4jCr9zwPLBpKd+IwLNfRIw3G5wBd
 Ns7RmHGrvYDl9rsXGoPzdB2u+hI=
X-Google-Smtp-Source: AGHT+IH0ABG3sbko57fw07W4SD47FSfJVdSGiS6f5kcfoCJiNKM78OfezLJxwCUa2AYLSFcDarZ8QQ==
X-Received: by 2002:a5d:6d09:0:b0:385:fae7:fe50 with SMTP id
 ffacd0b85a97d-38c5209128bmr19595106f8f.42.1738664958647; 
 Tue, 04 Feb 2025 02:29:18 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c5c1016a1sm15414535f8f.21.2025.02.04.02.29.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Feb 2025 02:29:18 -0800 (PST)
Date: Tue, 4 Feb 2025 11:29:15 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/2] DRM: small improvements
Message-ID: <Z6Hr-2rYhL96TgB0@phenom.ffwll.local>
Mail-Followup-To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250204-drm-small-improvements-v4-0-d6bbc92f12f1@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250204-drm-small-improvements-v4-0-d6bbc92f12f1@bootlin.com>
X-Operating-System: Linux phenom 6.12.11-amd64 
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

On Tue, Feb 04, 2025 at 09:51:57AM +0100, Luca Ceresoli wrote:
> This series brings small improvements to the DRM documentation and logging.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

I've seen these fly by a few times ... is there no one at bootlin with
drm-misc commit rights who can push these for you? That's how I at least
expected these to land a few revisions ago.

Cheers, Sima

> ---
> Changes in v4:
> - Removed pathches 3 and 4 because the added warning has false positives
>   when cleaning up a connector in the init error path
> - Updated acked-by tags
> - Link to v3: https://lore.kernel.org/r/20241111-drm-small-improvements-v3-0-a9f576111b41@bootlin.com
> 
> Changes in v3:
> - patch 3: various fixes suggested by Jani Nikula and kernel test robot
> - Updated reviewed-by tags
> - Link to v2: https://lore.kernel.org/r/20241106-drm-small-improvements-v2-0-f6e2aef86719@bootlin.com
> 
> Changes in v2:
> - Added patches 3 and 4
> - Updated reviewed-by tags
> - Link to v1: https://lore.kernel.org/r/20241018-drm-small-improvements-v1-0-cc316e1a98c9@bootlin.com
> 
> ---
> Luca Ceresoli (2):
>       drm/drm_mode_object: fix typo in kerneldoc
>       drm/atomic-helper: improve CRTC enabled/connectors mismatch logging message
> 
>  drivers/gpu/drm/drm_atomic_helper.c | 5 +++--
>  include/drm/drm_mode_object.h       | 2 +-
>  2 files changed, 4 insertions(+), 3 deletions(-)
> ---
> base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
> change-id: 20241018-drm-small-improvements-1d104cc10280
> 
> Best regards,
> -- 
> Luca Ceresoli <luca.ceresoli@bootlin.com>
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
