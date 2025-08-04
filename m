Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE02B1A611
	for <lists+dri-devel@lfdr.de>; Mon,  4 Aug 2025 17:33:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CD2C10E598;
	Mon,  4 Aug 2025 15:33:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="JaW/6102";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12A7A10E596
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Aug 2025 15:33:04 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-3b7834f2e72so2936652f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Aug 2025 08:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754321582; x=1754926382; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NF0bABbFtUOCdENunGBm+800fnNuZ9jGoGcS2XTVZ08=;
 b=JaW/6102bVHY8hf6Yq0rQYQjRORhh+FCpyfsxzxjEnua2lcepxMAk72Otmdn55LkBF
 QU78r3DXc4V+oejRr+FDNkbwVunl9S//FNqfyMH/EyG/twC8pl5nBrshlb5rngyLzgwf
 c1PzcmDao4xbCi6dglnX85wHL48VN8dHqIVrkEPv4wQHNqN1GBXx96LkQ17iXQa4H1d3
 d12OsCgZaNbvhJXbo3mgOAwyoKZU7TFpDaVbE7pR2XEVGlvWH+N4MbpNYDEkLT04DZYh
 iKVnybQs+ZKnl6az30JLwH3x2EQRHXErL4YMldOciUYZmG0E6OvAXqW1Hov9Y9wBZ5OW
 Navg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754321582; x=1754926382;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NF0bABbFtUOCdENunGBm+800fnNuZ9jGoGcS2XTVZ08=;
 b=ugtzo+AjahPau04RlTI0m4KcPSK/uBewjw6hI7LBupx2uWAG+/oGKsGyboZGKG5AmG
 rqaIDXrLB6mkjRyhROu7wFARtt/yCFXu3cK8IfL2H/X/TS4J8wTuzmTJcquKfoSm0Dau
 IDoMBImH2JGY8sEAkBdcX8Fb2Q3nrUGlooahiciNP7uZeQaIWPQpffya9ZJravjyiqkK
 tmIzBn75Nj4w6qFC4QaTGynoXPdmSWt2llZ607xRu4ZFXwRGIyl1IqkPIPMFud8K5O/b
 /T5weGhRu1ZfrYNu8OtXzJEkKR+/v6bqn5M69U01G0noFRpCzZu//T78MqKlhXMuqcWS
 34Gg==
X-Gm-Message-State: AOJu0YzmO+dx/cBZdF7AZ7p7et4ZbMUbzt1yxtMuR+sf7Beyn82d0bd+
 OFiwFo3Gk3/09/2YzGRFNykO50zj8tD8klDazt/yLT5TmLhEpKLP0+mt6Lvw3Kmh7Bg=
X-Gm-Gg: ASbGncvc5rHLpz8D/2/u5jSCiTxW62ort3e4MTFHzUE6ufeJvSHmQ7TEiRv3Y57kplC
 ZBjt4gO6bkV1qk8RoNMQXy+4USmkGAJbDsIc6YRUp1JhQtpdlIiJhlx0VHG1Azu7KA9BfpqBz9J
 hOcOtl5e7hIz7R7NV5dlqCnQ/OlxwHZd311X2Wk8mWZH4TT5y0fbtjQb/IolChe35J+cFIU40OR
 dnSwvb2irHgbkCVvz2YmkmLMQhg9RiJCiPhtmJTr03N0bW7DSyS9KGzuVuZYad/iloh26ZNo+/y
 PYNuMRlXEJ3tHTgzvrg18s5yfHQb1HaFzhj/51TrXdknFrP+2Hy0tGMsiDWSarx7x4JFZrBv02f
 zrd2+MZv78eu6szuHEWnAQ7CcEVKnOPjYK2QFkCHxgd8=
X-Google-Smtp-Source: AGHT+IFbfMK/bmmvR2bxmeaaYPGg3/jjzcbguCAvI/0THADshNsYjUr+ODiBlJg/RDp44aRIYORCwg==
X-Received: by 2002:a05:6000:1884:b0:3a5:1cc5:aa6f with SMTP id
 ffacd0b85a97d-3b8d94b9b2bmr6339040f8f.34.1754321582515; 
 Mon, 04 Aug 2025 08:33:02 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c47ca5fsm15664010f8f.63.2025.08.04.08.33.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Aug 2025 08:33:01 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250717135752.55958-1-clamor95@gmail.com>
References: <20250717135752.55958-1-clamor95@gmail.com>
Subject: Re: [PATCH v1 0/2] drm: panel: add support for panel used in ASUS
 VivoTab RT TF600T
Message-Id: <175432158144.3671011.146928832203319467.b4-ty@linaro.org>
Date: Mon, 04 Aug 2025 17:33:01 +0200
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

On Thu, 17 Jul 2025 16:57:50 +0300, Svyatoslav Ryhel wrote:
> Add support for Hydis HV101HD1 MIPI DSI panel used in ASUS VivoTab RT TF600T.
> 
> Svyatoslav Ryhel (2):
>   dt-bindings: display: panel: Document Hydis HV101HD1 DSI panel
>   drm: panel: Add support for Hydis HV101HD1 MIPI DSI panel
> 
> .../display/panel/hydis,hv101hd1.yaml         |  60 ++++++
>  drivers/gpu/drm/panel/Kconfig                 |  13 ++
>  drivers/gpu/drm/panel/Makefile                |   1 +
>  drivers/gpu/drm/panel/panel-hydis-hv101hd1.c  | 188 ++++++++++++++++++
>  4 files changed, 262 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/hydis,hv101hd1.yaml
>  create mode 100644 drivers/gpu/drm/panel/panel-hydis-hv101hd1.c
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/2] dt-bindings: display: panel: Document Hydis HV101HD1 DSI panel
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/bd068333ef090d63a7cf952d70040e768b0aa4cf
[2/2] drm: panel: Add support for Hydis HV101HD1 MIPI DSI panel
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/fdb4e289d2d6fd172591d802db71cef3134c1cf8

-- 
Neil

