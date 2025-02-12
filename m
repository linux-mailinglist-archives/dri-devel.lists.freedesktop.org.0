Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C99EA33268
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2025 23:24:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92EEA10E02A;
	Wed, 12 Feb 2025 22:24:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="POx3VTri";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CA6B10E02A
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2025 22:24:19 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-308e3bd8286so2365281fa.1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2025 14:24:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739399058; x=1740003858; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mu/vYpK5EdDCessSAfsc81pUNCu3XRPo/EhuZMObYC8=;
 b=POx3VTriRMyPmOVo8ldO1sSWlJfV1zRhmPB3T1w5qOIqdsuaqwmjDY/HRUMdqOxEcU
 4eEmtES10wbcsfwnoVChdYFeczCXcwenc8OpgZo+qe0mQPC3D4rcs69FF5pebrHSxxTr
 8Sx7B7sYpIKsRbx66dpj4JMy4pvaP7xGoR5HjgHrf+LBH8AAoGyZgXIdRZQ5TJbvz4DR
 I01o9dJsBuovwiZg5GD4duFtGOllrAG8/nCYaEpoEmtQfDdnMm2RH0ENdqZXJzg8JvE6
 fLlczNuswj/6L5B7IebqpqYEDoq4viDEuy6eXGFSG8HX4G4QM9B4TsyNP+pgqueDC22I
 crUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739399058; x=1740003858;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mu/vYpK5EdDCessSAfsc81pUNCu3XRPo/EhuZMObYC8=;
 b=RgbG4ZUQr8V64PemApKXMgQI4rhNlcxNF4K7TEdB9XUYChwqn58WlqQ3K3u3AiZbq9
 3Hik/0oYiyvD2Vhcl1z9zXiatBJS7CAlIlEzUT3gl6kG8SSylZiLGi2uEZihz4DVVAJ+
 rs5fF9JpoQYk06hDKXkFagluiDY9uAMSqTiVo1Z+Xn3864q18sMqRkgqCu2CjaQ3wVoC
 AkCgX2XsQt++X2CBfA7luvquf0rEosahlUWuy+x9jSCCb0Iv0BnfPARci80sdY87Glzr
 ki5OQyPPm69VGXOCHxJYZdnc7Gb+QMZwwpvSDTNxXkDRSAGM685phTCcpk47onmZlNWC
 BBYw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWlVe9QAHomxatF5l4oFdSqVNaEfRcMK0hUHZlTbPiyE7tGSLjVwinKabVhKifRXmunlJbb1YzVXLE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx8TGCTtkJqNYVjf/ZWAMVf6T259M0WN2mDI91LffJU3dwSIXfj
 yaNZ7tt4CWYBfPHU656ShOGArPoBxNpu6+k9JkH57ej1pgWOgnRxiUSxhYOv1WA=
X-Gm-Gg: ASbGncvRWWlUVt3fZBd3zPSPoPEr/SvnU9Sg0LvKyuj1LfVh1BU5+2ZB7CRs73owCyC
 s6Oz0GsbfeLT0tr62MK2QYzXvcSfqAJg4sEWWtFeiifQxMFkNi+rsn1uvD8xmwqePtCfulmfddA
 b8TkFLGJ4//B1+KAgi/5ctKMnzThBK2hBOGgQ9+fI1flK5YrWKkfbHkv4ZtPMNDcY6MYTf6f3PD
 nYDISmbjUNXS5v9+cxhe1wTG5GjeiyW/QEPk7FnjxkGGMNAwdsYJUbHcrKQcfOTzFFhrI3Y6ZX4
 sdZOLo1PfcBD0bhphG1H0WIrZ/xg8+TBbJQ1/PdZsg3SKF6+uy9WEd4QgzY=
X-Google-Smtp-Source: AGHT+IEllG8xsPecNgr5L5f8FoBGVvz0RiYrsFEd203BKL9JYmw0NxRW3Sco6Y7CdnjBxXidfEeaWA==
X-Received: by 2002:a2e:bc83:0:b0:2fb:8c9a:fe3f with SMTP id
 38308e7fff4ca-3090dd56bd0mr4718971fa.22.1739399057615; 
 Wed, 12 Feb 2025 14:24:17 -0800 (PST)
Received: from eriador.lan (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00::7a1]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-309100c6415sm150411fa.6.2025.02.12.14.24.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Feb 2025 14:24:16 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Liviu Dudau <liviu.dudau@arm.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Hans Verkuil <hverkuil@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v3 0/3] drm/i2c: tda998x: move under drivers/gpu/drm/bridge
Date: Thu, 13 Feb 2025 00:24:13 +0200
Message-ID: <173939904858.578381.4749501592256297365.b4-ty@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250113-drm-move-tda998x-v3-0-214e0682a5e4@linaro.org>
References: <20250113-drm-move-tda998x-v3-0-214e0682a5e4@linaro.org>
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

On Mon, 13 Jan 2025 11:53:43 +0200, Dmitry Baryshkov wrote:
> TDA998x is the HDMI bridge driver, incorporating drm_connector and
> optional drm_encoder (created via the component bind API by the TICLDC
> and HDLCD drivers). TDA9950 is an I2C-CEC translator, being present
> on-die on the TDA9989 and TDA19989 chips.
> 
> Move TDA9950 driver to drivers/media/cec/i2c and TDA998x driver to
> drivers/gpu/drm/bridge/.
> 
> [...]

Applied to drm-misc-next, thanks!

[1/3] drm/i2c: tda998x: drop support for platform_data
      commit: b7c5169ab9ddc3432161412bc2de28111306fbb3
[2/3] media: cec: move driver for TDA9950 from drm/i2c
      commit: caa6f4a75e9f8eaebd814a9c2d1602e0926f473d
[3/3] drm/i2c: move TDA998x driver under drivers/gpu/drm/bridge
      commit: 325ba852d148434c5bcb06d513af1933a7f77b70

Best regards,
-- 
With best wishes
Dmitry

