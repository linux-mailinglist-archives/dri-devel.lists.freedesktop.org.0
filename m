Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A59ACEA81
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jun 2025 08:55:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6471E10E9A3;
	Thu,  5 Jun 2025 06:55:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="pgm/0a48";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 048A310E9A3
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jun 2025 06:55:46 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-3a376ba6f08so346494f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Jun 2025 23:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1749106541; x=1749711341; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YTgawIlCqa6snL5rle0l3SP+UrYy+5hrMdq2H5aZTbg=;
 b=pgm/0a489bnxXWTQz7Mbz4SURRIOW1CVsaxUAIAY6ug0PHJDBGm9WzlJgq7yqs0UxV
 DlrpjoACV00GdAvQMGohWOebU2ScQlEhIGIFI804wxr3sVf+gccES3cGdoESV7yj1Nbh
 a+PMWusa1yoLJYiip4I2sjN+qik+FrsWxkr7e6o3DZgYPv1Lxx68pej17Lm4A4hI57QA
 b276+Jat3a0IHXFRYHjbYU+HKI3je/LYdPiMRGZYzk1Xi/DoXYnXCQFmg4WjDRKGbkuR
 n/X58zm5+aIKkJJaHoxORC75UVmmCRnhZBt3MozA/QyOT36E6G7TtB6lmLGklTNYALT8
 3jXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749106541; x=1749711341;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YTgawIlCqa6snL5rle0l3SP+UrYy+5hrMdq2H5aZTbg=;
 b=iQIPdl12VQeSbbaz02X/jZfvbpd3mH1/oLjqufSV2p3tnOfqMSEgB1AIYW4Z8v3ZaW
 Btll/7UHov1uELws4UYIOENOLo41EH0vQgEK1yOPGxA31vENYUP8iezU1syQyW4qdvjC
 wxrDGcX4sBfzRjcb0/kiRPo060LyqOxoBL7rhlKo8gPjGQx3kvEtaj7XYHZSPrGXtpq1
 2rXawlkIBjB83EgmwZsn8q/hOUaZJ1lo8x5IEhPN9iJbn7Tcdf87X/z01UJ9PAkdJNvL
 PEjT6ALheeulTqB2LS9EWbOMhITdSHvXPQrFkZs1bG/SVsAFQ6oCAtbf72AfwOmM/I20
 9Z1w==
X-Gm-Message-State: AOJu0Yy4J0jRRBCOF4VJBzvaV8+gj+gbiBTgGnHIrzuqkqBhbBJT7M6p
 75y3xMUPre5j+kxEJggH2Tr1B2cTKiz9T5KFjb6ys9hTDpbsjnLSfXuNYTeCM4cGBjA=
X-Gm-Gg: ASbGnctQ6JuNnpMYJQTOh2H9uCyVXrkIjap0diYrdGHXfUnm7t3JUy2plLegYTXSxuJ
 RxS/jAzNjwv7FtdBbowOZ8CkoDwZZkZG1YFecuvweNknHQg5FtJERA2ClMU7t3LmR8TX7zGfZ0d
 YkQV3/yGKNgC9QDavTLefT0FPkbuGr5nHbt9jfycec7xab82vOzteLKsQMcqh9Y0e/ojt5Io3JG
 zo52zVBR6PglnrJCN7ze6PkbcdXgNL52RMv1Txqi5ezoVjDQ14uaLggYrsP+5UeDxqB8q60LF8a
 vl1jzQYmad+MAQSTjhcvTIKqoNxOb2RqwgUgkS+65U5ArYyW8/ZZaUDsJFfJekq/X05bufCY
X-Google-Smtp-Source: AGHT+IEL+6tBVVRvp0xx1uUE5vKVrbbEUAQcz4JgR/37DUDVvCUG2yUMzTiEh2o7sHCW73N+Ae3r9Q==
X-Received: by 2002:a05:6000:26d3:b0:3a3:7387:3078 with SMTP id
 ffacd0b85a97d-3a51d8f8ff8mr4161811f8f.4.1749106540703; 
 Wed, 04 Jun 2025 23:55:40 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a526057278sm1910099f8f.63.2025.06.04.23.55.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jun 2025 23:55:40 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Michael Walle <mwalle@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org
In-Reply-To: <20250520074439.655749-1-mwalle@kernel.org>
References: <20250520074439.655749-1-mwalle@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: display: simple: add AUO P238HAN01 panel
Message-Id: <174910654001.1422723.810101462867818295.b4-ty@linaro.org>
Date: Thu, 05 Jun 2025 08:55:40 +0200
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

On Tue, 20 May 2025 09:44:38 +0200, Michael Walle wrote:
> Add AUO P238HAN01 23.8" 1920x1080 LVDS panel compatible string.
> 
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/2] dt-bindings: display: simple: add AUO P238HAN01 panel
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/a3bc2ee00b488bb7a90770447a886c678d64756a
[2/2] drm/panel-simple: add AUO P238HAN01 panel entry
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/8a45632ed3179995b2956cfbf140655701301471

-- 
Neil

