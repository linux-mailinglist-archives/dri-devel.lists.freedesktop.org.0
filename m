Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E693A8AC66F
	for <lists+dri-devel@lfdr.de>; Mon, 22 Apr 2024 10:13:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81C4811288C;
	Mon, 22 Apr 2024 08:13:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="mdDSiPHp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD23310F221
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 08:13:27 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-41a523e2888so4218685e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 01:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713773606; x=1714378406; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VJA4a5dlfNiF/Mn+2ESih5PJW4UfTetDxjsJggty4nU=;
 b=mdDSiPHpkLtuZk/NLz0VNRRTtkGiKFwaSalrlsWvCOlRMwKpARSgKy33ycJ+vftMAc
 B+B9THI+RG1HbAhZB0B+XE2AjJnmY6IAB/Nr+W3IwB4Nj+q4sZz1euzC7Lv8o9X2LHX7
 +Z7me6l313alh3QnQ3B1oW7SdWmfWk77w6YtdItdm+733kuS+XNSt4ESKi8uNje4yoM0
 deaa0jTjfq6VKKkrikkcJvQe8zGlQI1gDZcC+osu7fwMJdGfndpaG/pVJ8Zw5bVSf7ei
 88ZW5vxlxOBcRxNqbt7qd0gpc5yvPQczBWR57ZXPPcTrl53EdPwmcVaPEanX4qhlCyXC
 kg/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713773606; x=1714378406;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VJA4a5dlfNiF/Mn+2ESih5PJW4UfTetDxjsJggty4nU=;
 b=Ssw0DqEicK6zLuACoofkzw0KrfXVb2nFrrYOPhvGJFgzL3ctOjEM9aMS+lTnb2nkZ5
 7JNTLjyxaOGiCuQJ9Fz/Ej38NBSI9Z+32b46RI/2UxjuS1rNLjV/yi1/Hfg0rMMpKz8C
 sEC2+U5Lu9CLSY6cJ5aZPwGsCTsp0FQJsdSuK2kP2g8aYVOET/ScBeb3e9SgAM9RrlbA
 0WJ5HREP4VE64ic2dq7FQL+VCvY5oGd4v+yys+J0+EcQODmvmGwojgxpog6NGZzkZly+
 mmGAjWdhxUGqHMgSks7o1KrtY/oBw2PvzZKj/lgx4cnUSy6F6x1S7RfnsRO/RqBeIuFi
 RFcA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWs1Ck00q0hW+C79F2pAJb//6hvn71qb8Oeggt66l6zR01GaOmMfHQ+klwUXcj6CMauF0p+tcc3A/CHV9Vp0SdHPwJAZsrC/oKZUYL82rUK
X-Gm-Message-State: AOJu0YzXIVJpFOxW3LUAfMqtWsZoGf6Q/hE3j2XLdnZHahl11xVk0RO0
 Pv7qU8YvWEeXpPxuATYR63897GcJl1sPo7nlGT64Wlg5hPZnkw5ThEbptXXYGUo=
X-Google-Smtp-Source: AGHT+IF4cU+n70iM9aZ/bhIOf7ej4TQDcYHB1Zobb6c1Ifw1HLzoA9501M1WkvFgE4TgcpsQDdtYTQ==
X-Received: by 2002:a05:600c:b85:b0:41a:5de5:85f2 with SMTP id
 fl5-20020a05600c0b8500b0041a5de585f2mr1356294wmb.39.1713773605856; 
 Mon, 22 Apr 2024 01:13:25 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 r7-20020a05600c35c700b0041638a085d3sm19437504wmq.15.2024.04.22.01.13.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Apr 2024 01:13:25 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: airlied@gmail.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
 Jacobe Zang <jacobe.zang@wesion.com>
Cc: nick@khadas.com, linux-amlogic@lists.infradead.org, 
 quic_jesszhan@quicinc.com, sam@ravnborg.org, thierry.reding@gmail.com, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20240419014852.715125-1-jacobe.zang@wesion.com>
References: <20240419014852.715125-1-jacobe.zang@wesion.com>
Subject: Re: [PATCH v3 0/2] drm/panel: add Khadas TS050 V2 panel support
Message-Id: <171377360500.3418456.9021702656512233742.b4-ty@linaro.org>
Date: Mon, 22 Apr 2024 10:13:25 +0200
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

On Fri, 19 Apr 2024 09:48:50 +0800, Jacobe Zang wrote:
> Khadas has update its TS050 panel, the only different between the newer and
> older is timing squence. In patches, add new TS050 panel named "ts050v2" as
> make it compatible with the old one.
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/2] dt-bindings: panel-simple-dsi: add Khadas TS050 V2 panel
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/0546e01d5a0269f02b4aa227f44b30a5a5558792
[2/2] drm/panel: add Khadas TS050 V2 panel support
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/26f9339212db569310d4b0ef4284efcbb462a86f

-- 
Neil

