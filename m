Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD89B9F62CC
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2024 11:25:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01C8910EB4B;
	Wed, 18 Dec 2024 10:25:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="mtnUGujM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B38FE10EB4A
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2024 10:25:06 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3862f32a33eso3052713f8f.3
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2024 02:25:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734517505; x=1735122305; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R6d5KRf8PfhtZlX0mtZOUIjgkLomvP/2rGkRdQRL8Ho=;
 b=mtnUGujMa7cF+i7ZoPJ65eBArD9pEdgt3EBNxgPJ9z7U7nkmkwI+DJ8A8/ZxpPL1+L
 a+qdcSUGt3X6MH/EKH6EBRhrFYRMyZ9oe06v2LgF/RxvBiL7Q8R9idiTvDXhIAOFeSMT
 Q/IBAZC/BFU2DttyFsbnzE2jpOs9FOIZeQLGFY0V0MCKjpyNXak7in8o39CaYsY71qOU
 dG1NbYso++1f7l0Cm24Gc45vlGxq8dKakpFTuLVizOyLexF1NRmWw6FWG1AwMBGv0x1i
 fYrFCho/hmonQtGw7qEe1xz332iEvbGsqnvaYkqwKkKc6CyZqTEMt3hi916EjDl8MOa6
 AAHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734517505; x=1735122305;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R6d5KRf8PfhtZlX0mtZOUIjgkLomvP/2rGkRdQRL8Ho=;
 b=KjH72oQPBYdTlX0oyOX/ES2xnnmhTz8Osg7cwipV1fQNStNxejoErjiWqzzqNmRJrD
 d9RmUMMnIAUlR1gijFKRUzCwu2nopnvrcFuFFsEUNWjd8E1CnnouTOISzQz5YhzfQ6Ss
 yn1BwNntIU68bKYM85i/JNZiZuRaa2thoQOLPkBcpQGajCDuHG5/0iV0Uz9OkdgP/j27
 F8F+QvuJ/kBsQagr2s1N/wFVMTDqfyg4FopZ/JLRzVj4iNb7xOARawWbTLVZdIdnFKFr
 7U5NsFzIE50pW3BAAWi4AuZyxRXZXHJsPz5cZYJzAJoCraGbGU8yjRspDDUeNoX2TNWT
 G6oA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJNNi/s69yUKcaDtmxa9zNZslBu4R9z5NSm85Gg9I89wphY7+egYvhxj9YAvMjMNzEFhFjRIFDpVc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxaWMT7EXCKV0D/ZKqRE/Mjl3B06nMOSFbCtLRKsZ0uk4WXpoLs
 h+6+BNcdARn7gKqhmqf+c23GcL8zQB14lh2AwOdJX5ZnyPi6CvNGmLAuLnulJUw=
X-Gm-Gg: ASbGncsJ74XfmaUZn6YRvYhhCbo2WVp0BFbMCCET45x3Kj9jaNwvR/G/FeeHLPSA5y/
 VZBvqBX4N50+ulYPKCQ1QlxvboMxiujJhKuIdFBKOayjOZd2nKmwcDKpQgOuUTWotI1KGdrjtrp
 fpowodpbQWXH/3VR7/QgpGZNGh9d2fDEJSRpCee5GDMPVkDcoMvx1vA92DSGDz3WianNphc6+iT
 wWJsb/n6NFrAtkAH4Ca4DoO7XV2+Uv9LvuOzTLGzE+xNUlfb+wJxCpI1cjFzwveMf42HRwmriBg
 dg==
X-Google-Smtp-Source: AGHT+IFu57kLVG+xZGSy+aa0OFQbRCajSN1Xg9MKQV+Y7oTTjnCYZPpWrYvBr2G99GBPVeACYGi77w==
X-Received: by 2002:a5d:5f90:0:b0:385:e43a:4dd8 with SMTP id
 ffacd0b85a97d-388e4d6baddmr1510344f8f.4.1734517505234; 
 Wed, 18 Dec 2024 02:25:05 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-388c80613a9sm13561558f8f.101.2024.12.18.02.25.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2024 02:25:04 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Herve Codina <herve.codina@bootlin.com>, 
 Simona Vetter <simona.vetter@ffwll.ch>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Louis Chauvet <louis.chauvet@bootlin.com>
In-Reply-To: <20241217-ti-sn65dsi83-dev_err_probe-v1-1-3fdce386400c@bootlin.com>
References: <20241217-ti-sn65dsi83-dev_err_probe-v1-1-3fdce386400c@bootlin.com>
Subject: Re: [PATCH RESEND] drm/bridge: ti-sn65dsi83: use dev_err_probe
 when failing to get panel bridge
Message-Id: <173451750441.2945394.11537716472963142838.b4-ty@linaro.org>
Date: Wed, 18 Dec 2024 11:25:04 +0100
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

On Tue, 17 Dec 2024 17:02:51 +0100, Luca Ceresoli wrote:
> When devm_drm_of_get_bridge() fails, the probe fails silently. Use
> dev_err_probe() instead to log an error or report the deferral reason,
> whichever is applicable.
> 
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/1] drm/bridge: ti-sn65dsi83: use dev_err_probe when failing to get panel bridge
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/4e358b57bbb3e35bf20faed697305cd97aa1a388

-- 
Neil

