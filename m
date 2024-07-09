Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F7492B9EC
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2024 14:49:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7555410E547;
	Tue,  9 Jul 2024 12:49:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="NhHxcf8U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D02F10E53E
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2024 12:49:46 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4266182a9d7so18755745e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jul 2024 05:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720529385; x=1721134185; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=iYPXuYNWuUC0ybpVuOxAnF8IJKAQUMORqNNA7E3t+Ys=;
 b=NhHxcf8U/GF+UjxyEKlAEvfYNOZl4adiWEPR4Io17Mi9Hir+l+qBpnLPbGtCyF0dmt
 cs/aV5guV3kfCfa6ddvN0tpY9obsvjFaVV18e2lFZc3k/f/eEdgueOV41gg26tsmL73N
 qsigCVBfxUkUDRsaN12/bzsgfzK7vaxX0OuLTNaC9rne+zymxkd+yhanrtWv1vo8MaUy
 ax0CX3pSnCh7okNQELxtisDNIlha1OL8XZ+E9HQ+FI/TME3eWsM8T3lBCKM0QK8YNH9i
 qiWOuWDZtNQmBiDy/2rdvKGB2OwUQNxcqZT7UVKxS3zCTWeFx2k7MM0EeKeb/uJyVUc6
 IJdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720529385; x=1721134185;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iYPXuYNWuUC0ybpVuOxAnF8IJKAQUMORqNNA7E3t+Ys=;
 b=IC8zhDoCZEUqXIZQQDNVtPtbsl+NdFbc0KR9yQH5+F9wxWv6g9KwNSGIf76HWTY5/h
 awt+r052eKJRQs/GKXLLnidgKBYWVmVOcfX+/nvGvG5zVL0uDpfrXGAvijjORgAszdsl
 QLqdjIHqC3oipAYJqETq+vez7h4/cAjJpCARwmIROtvtci7ydJaFRdNgEHpvbhyQYHgs
 8AsVmJH5Z1hhZyE2xDaqDc6ic93c69k8xro/X4Vb7krEioUnHBH3VZTG+kbBbKmqz0s7
 Gaxv9xjxUbI1g2bDHnZxdxuF657mlryJHQ0s+DpKYJ2qDqGtxatG+vhorgEtGxWUL9+e
 sEPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUiyZh9rHzPstNbmxu09E1EZ44Ryseu2Cp1uLOabIcQyHUFhGSNg1nvg0VlMNHA4JVQT7ExeyKr8uhEFqXvUC6JVg/uKwxIsizkXQd/6ugs
X-Gm-Message-State: AOJu0YyHjtZWXhVpo2umU6bjEDmXq5fc7b2nCXo5Jhx8dEUoCMkmST8N
 lpt9w9hKYMAn1O1r1CYLt7nN2zPYgcTTqemfkUXjaHsmspwyOlQXDw0WeNlqX5g=
X-Google-Smtp-Source: AGHT+IFcDYqdCyBzlJ2hUBfUEgeqmdLsG6jtJ7rQwZ01MQc6/OtCfICug2ElL+2i54FmsrLOnVfnXQ==
X-Received: by 2002:a05:600c:428a:b0:426:6153:5318 with SMTP id
 5b1f17b1804b1-426707e209emr16226835e9.19.1720529384508; 
 Tue, 09 Jul 2024 05:49:44 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4266f6e9666sm39540095e9.9.2024.07.09.05.49.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jul 2024 05:49:44 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: megi@xff.cz, javierm@redhat.com, quic_jesszhan@quicinc.com, 
 sam@ravnborg.org, airlied@gmail.com, daniel@ffwll.ch, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Manikandan Muralidharan <manikandan.m@microchip.com>
In-Reply-To: <20240701085837.50855-1-manikandan.m@microchip.com>
References: <20240701085837.50855-1-manikandan.m@microchip.com>
Subject: Re: [PATCH v2 0/3] Panel HIMAX support for Microchip's AC40T08A
 MIPI display
Message-Id: <172052938350.987180.18063209253133555309.b4-ty@linaro.org>
Date: Tue, 09 Jul 2024 14:49:43 +0200
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

On Mon, 01 Jul 2024 14:28:34 +0530, Manikandan Muralidharan wrote:
> This patch series adds panel himax display controller support for the
> Microchip's AC40T08A MIPI display.
> 
> yaml file is validated using the following commands
> 
> make dt_binding_check DT_SCHEMA_FILES=<converted_yaml_file>
> make CHECK_DTBS=y DT_SCHEMA_FILES=<converted_yaml_file>
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/3] dt-bindings: display: himax-hx8394: Add Microchip AC40T08A MIPI Display panel
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/223c12dd492d67d90d3712ef3d9e042116a47522
[2/3] drm/panel: himax-hx8394: switch to devm_gpiod_get_optional() for reset_gpio
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/1dcfca093be9e013a53e3c9b74b3f60ea9c5160e
[3/3] drm/panel: himax-hx8394: Add Support for Microchip AC40T08A MIPI Display Panel
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/014e597d35816b56c7aac1348b77c73657c4066e

-- 
Neil

