Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13466AA8D98
	for <lists+dri-devel@lfdr.de>; Mon,  5 May 2025 09:56:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71CDA10E391;
	Mon,  5 May 2025 07:56:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ibb9xO2Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B766310E334
 for <dri-devel@lists.freedesktop.org>; Mon,  5 May 2025 07:56:02 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-3912fdddf8fso3021791f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 05 May 2025 00:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746431761; x=1747036561; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l0+U68a2XGi/Gy+rKQXUVaZpntA8Xl9E4Z35KhAv5DU=;
 b=ibb9xO2ZYL45Y0/jbxLIUv89Tos8yWUjrUzlqMG/8bzPMkqjIpZs5/bAAlF4tr3GBy
 xkwPDt4L6ymA/bY4DZ6Ee/As7egzQ++NIlMhH6h657LZH2lsNO0f5+UzGkUulDZm4NwK
 JitbkPJkj21bWINGTdG/79dpN2TqRIdSqAb8su8bcWeAw2nwWRVJ6FqYRJUIpQjQY77W
 1pxS1eBaJA+RfGGqHAxEpzy68REWmfglOIf4UN5l46FEGzQ36584ilS+Go1yhOwaudaB
 q++zC3oZEK3xaRWXb7LvTVRVuvUXfxhZPRDOT8WzGLehSYhe7J4TY9bWexFVoKiL/NJq
 iFBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746431761; x=1747036561;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=l0+U68a2XGi/Gy+rKQXUVaZpntA8Xl9E4Z35KhAv5DU=;
 b=SlEf+lq56cGE/Y6uuvefENyZ3QVFddWNpmo7EbcV/MmfQ2EPwFfhHfEJ/bDtbrRQNW
 nLzShn9hsRe+5xD7R6qkB1+J8EwehQMI2eu9k6ZY3433IF9QL/VXbyARlVjUL/il0Zcr
 rMh4yEfWAAhD4GTGRmEnBwiyRyimAiuyFhlKwLhUsxd/GhoEYfIfUIcuwLqkDUX0wkN3
 HHFFT/fJXWmItcaJ49Nwig+iVOMuoTIQZxNRtkuhnt3XCoLxH1HgjDAZ9IIMxbdWaR08
 jDdlK+Z0veiMyqrXBTB5++SdLHU00FsWnFCS5N37q4buH0g5bQ3+q0L4tBLEKgkaAXhh
 t+Jw==
X-Gm-Message-State: AOJu0YyDeEnAIGvDI/8/7VFknNDOlyNNNLzyI4tEKuHGp0svDQE8THhY
 REjL039JF3qOscsYIi5I7PIng6rIwi0nJRfAZr9qZwIFIDhIS+wm/pKYRbPI1nY=
X-Gm-Gg: ASbGncsni1GM4XlluGD2FXMVQjoUcju0WHiQn387RLutWl2xicl2uFSpH0FJLkjV4CC
 vSnkhbYleKcKpggJzhNO4Z3DhtipaM7U1tMKQjMPac8qolYpYAerNPTgDE23ndUUuKt93tCrqze
 HoeMCSRjSvAKIR3XzVbgzIDhI9LYPg3pywcfbuypOxy9qYeJiFPELX9GMdWTEuMyAPtrm8RRtQe
 DhMhUhyfGzw+lckJFHeGh7Al/FJFfwB6a3ALBXuDrlR1RZVJ4TyUW3zRhZQ/oy8MBK4J9sAo/Qy
 /hdzbaEOQaMC48QmlsXgj1PO8u/0Lk9MUXT32pDlfZBreMlW8db9PMmEnFTZJw==
X-Google-Smtp-Source: AGHT+IE1zsUZXtFLT8WhSEKKdrwAh5iufLxarm4El3WD5TPCKfmzBJVqSJnVfCgpEFuzgdcvwuvCGQ==
X-Received: by 2002:a5d:5f4f:0:b0:3a0:3d18:285 with SMTP id
 ffacd0b85a97d-3a09405d3efmr11171834f8f.25.1746431761360; 
 Mon, 05 May 2025 00:56:01 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-441b89cc480sm127209395e9.2.2025.05.05.00.56.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 May 2025 00:56:00 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250430-lavender-panel-v3-0-7625e62d62b2@mainlining.org>
References: <20250430-lavender-panel-v3-0-7625e62d62b2@mainlining.org>
Subject: Re: [PATCH v3 0/2] BOE TD4320 panel
Message-Id: <174643176006.170941.1513188445177832800.b4-ty@linaro.org>
Date: Mon, 05 May 2025 09:56:00 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Wed, 30 Apr 2025 21:42:11 +0200, Barnabás Czémán wrote:
> Add driver for BOE TD4320 DSI panel, used in Xiaomi Redmi Note 7
> smartphones.
> 
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/2] dt-bindings: display: panel: Add BOE TD4320
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/af28dfc32bb4bffd9666ac20891db9d3bce8a742
[2/2] drivers: gpu: drm: panel: Add BOE TD4320
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/7220a310b9fbe431951e31487f7ae92498420e52

-- 
Neil

