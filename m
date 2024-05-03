Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C048BA93B
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 10:51:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB72C10E827;
	Fri,  3 May 2024 08:51:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="RMuJTxTS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B2A610EA0D
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 08:51:20 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-2dcc8d10d39so102552731fa.3
 for <dri-devel@lists.freedesktop.org>; Fri, 03 May 2024 01:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714726278; x=1715331078; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZWk/psw7Jn7h8F9Bpz9pTT51OJv92Z7OG1gjIzaGghI=;
 b=RMuJTxTSX5W3KoHMQ8zj5HHW8LPzc/LPQ6HUr3qOdLY2e9YPi+nJTIlCuBMKKi/IAs
 gKkreSYGgJkKsY/YTCMtPrHEoPdOqM5CBYGXDv0sRrP9uwuzZuZ+jVgeR/lZ+R23ZtsO
 p5TKRslxmD+/IzAg2XvD6SfkCfLqzyj2h3Tg0RFgyX4yQ3epY0Cdk3GX8YJBMpbsu7pB
 s/YH0Ji3C1AjG2cXUO6cQGJDt6DBBsWc+07DiKnpN/7TWFUIbzB58K4DKL7eUG/hmUco
 0oOM7CC9qPgqB7/tWZ48VJAIyuyUkxx1f6/iWlZ5+Xocp+eV+5HRWSudBZvg6YV6a/jr
 Gw9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714726278; x=1715331078;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZWk/psw7Jn7h8F9Bpz9pTT51OJv92Z7OG1gjIzaGghI=;
 b=bGAn+vWW707pPndfYUxakOAWDWdmWLK5vLYdA6feKigWMefATlqscp7iXxZW6ADYKe
 ff/bvgP4ZMulozc7IrLFtjmf4YMKCsAhmk2XrhyPcrd8bAyJgBiW7dpa/G0ZdncYQnc4
 3nsxH7uz8SsMlj+FTtGBtcm0Asj9H/svY1iQiiHlcaOkjXRWY40ngawAHzodD6YbBsMy
 pyUl8Sxk6VlKxjGfcymNnBSlemSTr/57LZ4mLdHTwkU/wX1/n13ELDPlx6gsPO6WAZkG
 JY4BVPWixWKstFWzhUU89Z+I86BYcxllXvRyb6BCsa7zPACFSOnCTsyVqsyisD7oc7Se
 zyNQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXloyzufSDd3yEFQDDiJIFUEuUppVAJay2XZFR42o8yyBoe8Kb9xsy4PbkG3ySkYp2V4krWRXPjHiz/CdJ7X1TI0fFdhZYU1hIeioF88oF6
X-Gm-Message-State: AOJu0YwwrjuacjFSP58KK9b3dpQR5czDHltXmqk3Z1i1Wn7QGpTjCAHC
 ZGi2bYWC1EeahMikE9GIRgDckWRGDYW5/Gt920BQCdrmcdlqOPtzynKLvvhz7AA=
X-Google-Smtp-Source: AGHT+IHcI2LurCc2hKenAfI5jjKmPmOLR9ME3lIwcmztZCp99vEXqtLskwgBUgkpuv4Q6SUOsRVoww==
X-Received: by 2002:a05:6512:2eb:b0:51d:70d9:ece0 with SMTP id
 m11-20020a05651202eb00b0051d70d9ece0mr1451847lfq.6.1714726277628; 
 Fri, 03 May 2024 01:51:17 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 i15-20020adfb64f000000b0034af40b2efdsm3204178wre.108.2024.05.03.01.51.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 May 2024 01:51:17 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jerome Brunet <jbrunet@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20240426160256.3089978-1-jbrunet@baylibre.com>
References: <20240426160256.3089978-1-jbrunet@baylibre.com>
Subject: Re: [PATCH 0/2] drm/meson: fix hdmi auxiliary system operation
 without display
Message-Id: <171472627680.386161.1617857178874394298.b4-ty@linaro.org>
Date: Fri, 03 May 2024 10:51:16 +0200
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

On Fri, 26 Apr 2024 18:02:52 +0200, Jerome Brunet wrote:
> CEC and ARC should work even when HDMI is not actively used for the
> display but it is not the case with Amlogic HDMI.
> 
> This is important for devices such as sound bars which may use DSI
> to display a UI and HDMI for CEC/ARC. A display is not required for these
> functions
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-fixes)

[1/2] drm/meson: dw-hdmi: power up phy on device init
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/04703bfd7f99c016a823c74712b97f8b5590ce87
[2/2] drm/meson: dw-hdmi: add bandgap setting for g12
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/08001033121dd92b8297a5b7333636b466c30f13

-- 
Neil

