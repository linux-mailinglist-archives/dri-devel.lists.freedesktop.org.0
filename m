Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C18DC9F90E7
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 12:08:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B03210E376;
	Fri, 20 Dec 2024 11:08:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="d7ccbN35";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45D5F10E376
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2024 11:08:24 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-385f06d0c8eso1036650f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2024 03:08:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734692903; x=1735297703; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ft1cfegnjdEfopbUv8p0C02Uuy5jO0NQLRksUM8iE20=;
 b=d7ccbN35Dcn2UopoKIDBWQpxdsqZxtd9WdqPyhr9zSaim2wd1+PhztyCWdzUrnZVJh
 8vT654hTPo1ysHsZ3PjhbSRXrCemy1iVLVDbLNEM1oMp1iEaVqN5nK1enGjV68jjapy0
 AFqYuZ/QXUbLQyFSOZewk1AW6dekO11QKFXd+U7QXSzwKuj5WZCFlOK12rL9YV1awWJs
 iuWFinxeabNiha0z+0pB+bBLHJGbpF/Imtcy0sXdDTlyg4auB8b6QXAyb8gc4C3MVKsh
 RfVeGdaxYqHOv+QkgfMQw1JsAQpIEDmW7sr5YO3VgXBwTLTTwBQOc9/JSf1BoGbBAccN
 eN/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734692903; x=1735297703;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ft1cfegnjdEfopbUv8p0C02Uuy5jO0NQLRksUM8iE20=;
 b=VdYhQ13tm2iLhQO0qKZzb/G4V0ZIW/GYmiLnxoqaywPYPcVhcjY5J02uWrKGXxTqdG
 X7sk/pyJ2URWxoShJxFiaNGV8UsTOJ6SIjgUfZkO5gqXy2bUGfkenSHj0XFloYbF186E
 CH9vUqUJNCjD0/R9EXeyca1JbPj0vyaKpMTcD70FnNoAkT7KR/pWdtij6E4Sg5wEIbZ0
 r9kz7omyQzD5V3pKUEw9XuiLakZb6QQaTTpECo2xwrXdh2b6sHwLLdCWmjbEk1Ke0ges
 GwNUTvSNl/+KqWQCuLyPSnrob3cIeDsPlj1Ouy7o0qNEolGN8qxc+wtsFpZqjAM7a7mN
 WxSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVf/K7gyVmZzAM7cyhjGj/aYPgDSWb0H8OdpAdBK4Lni731pLhuLrT1+ap6obDsx/BlVW3F6kDbolY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwOAUsMcrPofpnumwXA2eaD6bYpXxwLPnrg7Sg3wlpYckqOCgR3
 xE8YReY/4bZvdAFffyKWNr5cSb9mawnaOTMhQ+a7EZMAl9Whz7mkVl85woV0Bq0=
X-Gm-Gg: ASbGncvWQBaHWw8BYdLNE3z1YnlivY1tzV/Z2jP6z2avrCMt/rWPhnNn+VFfNaRizrO
 EUKSvdj38uxBCTaUcVF2L52BRCakzkqRBzfPXZ6kNdvY2jqlz9Gh/kmEDR09hHgjUDk6fduVZf/
 8SLMResJXx84mqT7clLym/PwYWpND9sWuOseJeoc7ys2OmpXb84VXaCVeZVIF73tpjYOFIc1+Vh
 PeNKyz1DLDOWyQfxSICUz0249mpDmElaJnTs56VGxkPYQ3D9mtTBuDtR2n29tNQnK05Ib2sdrXx
 5w==
X-Google-Smtp-Source: AGHT+IGx8ROIJvyIoKxf3TQEsPJ66XsDm53FG93Ps6HVcl3kMQltTDaau+asG4n6Dkz86K6zAZ/7SQ==
X-Received: by 2002:a05:6000:2c5:b0:385:f195:27f with SMTP id
 ffacd0b85a97d-38a221f339emr2333877f8f.5.1734692902734; 
 Fri, 20 Dec 2024 03:08:22 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c8474b6sm3790616f8f.51.2024.12.20.03.08.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Dec 2024 03:08:21 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Xin Ji <xji@analogixsemi.com>
Cc: bliang@analogixsemi.com, qwen@analogixsemi.com, treapking@chromium.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
In-Reply-To: <20241219070330.224996-1-xji@analogixsemi.com>
References: <20241219070330.224996-1-xji@analogixsemi.com>
Subject: Re: [PATCH v4] drm/bridge:anx7625: Update HDCP content status
Message-Id: <173469290130.3312755.9971815452869868353.b4-ty@linaro.org>
Date: Fri, 20 Dec 2024 12:08:21 +0100
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

On Thu, 19 Dec 2024 15:03:29 +0800, Xin Ji wrote:
> When user enabled HDCP feature, userspace will set HDCP content
> to DRM_MODE_CONTENT_PROTECTION_DESIRED. Next, anx7625 will update
> HDCP content to DRM_MODE_CONTENT_PROTECTION_ENABLED if down stream
> support HDCP feature.
> 
> As anx7625 bridge IC will be power down after call .atomic_disable(),
> then all HDCP status will be lost on chip. So we should reestablish
> HDCP again in .atomic_enable(), and update hdcp content to DESIRE if
> current HDCP content is ENABLE in .atomic_disable().
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/1] drm/bridge:anx7625: Update HDCP content status
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/a253b0b1292b4db0fec5733acceffc87bad4ffaf

-- 
Neil

