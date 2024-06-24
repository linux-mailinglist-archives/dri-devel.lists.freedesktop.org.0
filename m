Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A44B49145D7
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 11:05:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7BB910E3BC;
	Mon, 24 Jun 2024 09:05:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Ek9GSaUB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EFB310E3BC
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 09:05:42 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-2ec58040f39so15559161fa.2
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 02:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719219940; x=1719824740; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FGebS0vkuwx3hnzjLTve2Sw95b1MHPirmaMeFfxgZ6Q=;
 b=Ek9GSaUB6e+apx87ae1HTa+Hkv0M+rceuE9J1zXOMICVvQEiG2pTSyTaHtmkvDO44O
 6qIMYH+mF3faE+9oTegHWKCKFKPdQCt+Qhx8mrdhoaUVhSFlWSqlezuhV2aTxgtx3qEP
 3TONRp0nalMJA2I7UWOJg0C31Qs4VdPuXTkuUBTTeJAdysaoVla2ZUaZA1rmgxKxoW6q
 XmldQCtE1HAy8pFJ3M7LAYTrt24yVtVvsd/TyVs97sczxgoLCe2duDabVd1FmSZ7+QWA
 2uFdqLgXp3E79OgGJARXPYiKGNBk6q86VgOMM6veP0LnOg96013xCoWpMiqPM4IIcTCI
 DKMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719219940; x=1719824740;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FGebS0vkuwx3hnzjLTve2Sw95b1MHPirmaMeFfxgZ6Q=;
 b=hHoXuhbhcBsTkucp8bAtNN8KxV6jrEQgdc4ZZBYiMXEtY3BHZOE5l9LjTGguF80Rwx
 MRoSKDeRL8pT30VkAeZ4n2ayB0fNoNXFLnLWftwpTpu3okYRxzZXFUqAhB6u5hv8qaS3
 2tWcnG5ZFxfhWx3DZwrq56sZc8WZ4BuoMOxjkwGQFFgeBizPX/mYpZu9CfgLRADeYkqs
 k4Y5vaWwfC7POjCLSEFD8psRvgcdt8j4VSq28hqnX5Vyg7jMORzw6egpyUmnlkTunS28
 VmhingeTP2pt8Vn9HAMQuhkczUJ/Pbb3taCiVj/X/DAZ2QkY5/ZSw4gcDWO8hf7SZxDR
 l9mQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVKNmBF1898wlE+JxM/vBFyghelUnr+geIVBQEzButW17znUXQeLFYoGYYuakGG5Zlou09iyoy8JiLC6HU2M7XwMaW8LSDFc7oYP14mmHY
X-Gm-Message-State: AOJu0Yxe9wROIVQINaYpFk37yReHR8DKiVDTeJndiqcLtBLkz+GCFiVB
 clCSbcXyxaOXMd60RUL4kTYhcqYKvqajYRmNXzzOIpsW//iPfhdalwEpK5NNkec=
X-Google-Smtp-Source: AGHT+IG6zcGQsoxbWQCNE+7aa01TpZbpNJBjYwOYrGWeGHPkluLHLC42jKkkUz5io9dRYoS5RJ7lPA==
X-Received: by 2002:ac2:5617:0:b0:52c:b606:2b2 with SMTP id
 2adb3069b0e04-52ce0673b84mr2577772e87.46.1719219939772; 
 Mon, 24 Jun 2024 02:05:39 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3664178f5f7sm9323088f8f.19.2024.06.24.02.05.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jun 2024 02:05:39 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: quic_jesszhan@quicinc.com, Tejas Vipin <tejasvipin76@gmail.com>
Cc: dianders@chromium.org, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240621131648.131667-1-tejasvipin76@gmail.com>
References: <20240621131648.131667-1-tejasvipin76@gmail.com>
Subject: Re: [PATCH] drm/panel: asus-z00t-tm5p5-n35596: transition to
 mipi_dsi wrapped functions
Message-Id: <171921993900.3622623.7767680483331122397.b4-ty@linaro.org>
Date: Mon, 24 Jun 2024 11:05:39 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
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

On Fri, 21 Jun 2024 18:46:46 +0530, Tejas Vipin wrote:
> Use functions introduced in commit 966e397e4f60 ("drm/mipi-dsi:
> Introduce mipi_dsi_*_write_seq_multi()") and commit f79d6d28d8fe
> ("drm/mipi-dsi: wrap more functions for streamline handling") for the
> asus-z00t-tm5p5-n35596 panel.
> 
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/1] drm/panel: asus-z00t-tm5p5-n35596: transition to mipi_dsi wrapped functions
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/47e851ec4c02e8cbee95614c3acc746ae7551dcc

-- 
Neil

