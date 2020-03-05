Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F5BC17B802
	for <lists+dri-devel@lfdr.de>; Fri,  6 Mar 2020 09:04:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03A436EC8C;
	Fri,  6 Mar 2020 08:03:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3091989AA6
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2020 10:01:15 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id y30so2500696pga.13
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Mar 2020 02:01:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=endlessm-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=d+aqQE01oMJb6UAMOBubBoPlQDg0qTH2nDZoUSvA2Pw=;
 b=sAdchzbzWdhLon0k5KU9t969rKbfqBHE5ntd8N0XREvIVOQx75SkoByrm8ZtpBglwn
 JJwH+kZSo7V/xCdkndKCh+lFMzbfUjv2Ir9+VCbd1X+M1N1Vn6XWMdhFpdHIJ9AsBIEe
 /juGIbSFekuuNZl8IP1yGZpwpqyvTiXVpqlpYiyvf0HKPaMmi5Kppi3Oj12PyV1Bi7IH
 pishhBkEccoaWKKJF5dPSq8B3ToteJr8pHBxbflhJdhNWtETENPUr51Qvo9YbTz+D983
 G5O/+EFXyo5OYGBh9r9qucLV80RCKMyGcQa8r5LjSrNnTTsCizsY6sLSgS+HH311phvh
 mwyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=d+aqQE01oMJb6UAMOBubBoPlQDg0qTH2nDZoUSvA2Pw=;
 b=NXOCMno1m3ZF2TzoIhrgzljkWWsKI5BW0ubuu4es6LuI8xmuK2mgtFjonRGW6xMoSY
 ZyjggTeeS5tudWssi702YE+r/h8S32LgFy8fiF3wzX39oQl4aiwO380xABwkS7WPXlOW
 hL/QncjONvQtKArb9YvRItGr6ZMc+KuMIOlTt+PPLZyR/mn+DuM5E6sdn0QdkVyU2ebU
 S0JokSZtdaTAXFwGwCizgQ9KbSoGN/EvCZMQccYCAYQQVizzV7giQgvQmnz5IGOtc6g4
 JYhsAxNTgNWIwC62Oqcb194BjkcEGdfUNc0DS4sCJZ6OneLOfF0RDghYkAxhu0YYn7JN
 Y07g==
X-Gm-Message-State: ANhLgQ3yfuanZ49ZXA/vNYT9iEt6NsNNLgR24A6sfhSYTu7iO7dzFwyu
 IO7QvpIpugaER/e20SUNQ6RyjA==
X-Google-Smtp-Source: ADFU+vshcthIRHvuvF4c67fKbNw4z5+YYa5m9qu+uE4WbbYTJtO7NJ2lNM6SgCVG0yZe2IUd7F7Ang==
X-Received: by 2002:aa7:958f:: with SMTP id z15mr7770264pfj.205.1583402474728; 
 Thu, 05 Mar 2020 02:01:14 -0800 (PST)
Received: from starnight.local ([150.116.255.181])
 by smtp.googlemail.com with ESMTPSA id x4sm26340400pgi.76.2020.03.05.02.01.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2020 02:01:14 -0800 (PST)
From: Jian-Hong Pan <jian-hong@endlessm.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH 70/89] drm/vc4: hdmi: Remove vc4_dev hdmi pointer
Date: Thu,  5 Mar 2020 18:00:46 +0800
Message-Id: <20200305100046.55388-1-jian-hong@endlessm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.6c896ace9a5a7840e9cec008b553cbb004ca1f91.1582533919.git-series.maxime@cerno.tech>
References: <cover.6c896ace9a5a7840e9cec008b553cbb004ca1f91.1582533919.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 06 Mar 2020 08:03:01 +0000
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
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>, linux@endlessm.com,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
> index 1e44a3a8c2b0..d5c832c99460 100644
> --- a/drivers/gpu/drm/vc4/vc4_drv.h
> +++ b/drivers/gpu/drm/vc4/vc4_drv.h
> @@ -73,7 +73,6 @@  struct vc4_perfmon {
>  struct vc4_dev {
>  	struct drm_device *dev;
>  
> -	struct vc4_hdmi *hdmi;

Tested the building based on kernel v5.6-rc4 and linux-next/next-20200225.
The hdmi removed here still be used in drivers/gpu/drm/vc4/vc4_hdmi.c.
If DRM_VC4_HDMI_CEC is not disabled in building config, then it will hit
building error.

Jian-Hong Pan

>  	struct vc4_hvs *hvs;
>  	struct vc4_v3d *v3d;
>  	struct vc4_dpi *dpi;
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
