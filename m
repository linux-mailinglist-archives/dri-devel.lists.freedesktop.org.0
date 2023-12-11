Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE8E80C439
	for <lists+dri-devel@lfdr.de>; Mon, 11 Dec 2023 10:16:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CB2810E36D;
	Mon, 11 Dec 2023 09:16:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DFB410E36D
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 09:16:20 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40c3984f0cdso24953335e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 01:16:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702286178; x=1702890978; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SjMxzyRwkdL/2AYzzLiQnqwjdltPGTpYZH9r0TugZAM=;
 b=rY5WaIMJuOy76ovmXUPUgM3sTp0fBqDU7KJ8sPY7d+Wu6qkzAcff2jGJWCwTiD7DzK
 O33tU1IAIFexaz9sBQV7KHQuXlYXUoVR3YrvqOEhjrufVtyRUv0h9y8M5z7cXbXfSyvR
 VgGuXvCRkDR5ymbTvU8ERY725FgFwwGdZnkSimPFrjEwR4PDMPtJukXMCSGZY3UDDBW6
 4K9YqcjuPAWAkmhoXCUlxYNbfhoCjxklQ0S6pUnkZ4jSA4vVfZCgp1Lxu8hKMfpqB0tX
 0DEHQgRpaM6n3CfBRxrEo+RS9Mcm9dAGNMyQXUTjwzNL8OVuPa2p+MvCYbpyF4YR/4ag
 Wtdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702286178; x=1702890978;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SjMxzyRwkdL/2AYzzLiQnqwjdltPGTpYZH9r0TugZAM=;
 b=SsyVgJVruzc0ZWFF33GCoO0F7ra7eGXd8pofYSitQ32yve0BsTXV0Ab4vrr/QOUCwp
 OYRVcuvqs7BfVTSRxlNAzyn7Fzeko+fYNsW0/FSMXBaIhA/Tfk+8Lr+PODQzfgtdRDPC
 0YMwPsWTtP63Rcif2xPSFGfuPLbmz3R7U01hldrWksNprw/1IGfqD/shpyFocgRSQuxR
 DOJc/V+nWQOAw2lceK1lNc7RGyhP+RcNhPgxs22ot5Bu0U6hS+lpBSuZvHdI6CZUvaG0
 Me/QY7qWUAFFMxnKC1QHxU8rPg1NWyhzWkIH9N/mSrU79xPM0ZihFsETqndxYUkthXb0
 b3mw==
X-Gm-Message-State: AOJu0YxeZvNDJtYuDHtQpx+OK8ZLeqwAbrV8O5Kp4wR1u25Zve/FNbXT
 71NvgrfsqUMvSN9OPpiRvyU+4w==
X-Google-Smtp-Source: AGHT+IGqUFHwBiG4qbbgxDSACeXDifjNebaZ+jVC5Fhm47uH9wX7VT0O54VgSxVi0RX0nkInjt3V5A==
X-Received: by 2002:a05:600c:4f4d:b0:40b:5e21:dd34 with SMTP id
 m13-20020a05600c4f4d00b0040b5e21dd34mr2438020wmq.98.1702286178694; 
 Mon, 11 Dec 2023 01:16:18 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 bd19-20020a05600c1f1300b0040839fcb217sm12398470wmb.8.2023.12.11.01.16.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Dec 2023 01:16:18 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: dri-devel@lists.freedesktop.org, Marek Vasut <marex@denx.de>
In-Reply-To: <20231209063714.1381913-1-marex@denx.de>
References: <20231209063714.1381913-1-marex@denx.de>
Subject: Re: [PATCH v2 1/2] dt-bindings: display: simple: Add AUO
 G156HAN04.0 LVDS display
Message-Id: <170228617769.2409693.256554551788540699.b4-ty@linaro.org>
Date: Mon, 11 Dec 2023 10:16:17 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Liu Ying <victor.liu@nxp.com>,
 Sam Ravnborg <sam@ravnborg.org>, Maxime Ripard <mripard@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Elmar Albert <ealbert@data-modul.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Sat, 09 Dec 2023 07:36:59 +0100, Marek Vasut wrote:
> Document support for the AUO G156HAN04.0 LVDS display.
> 
> G156HAN04.0 is a Color Active Matrix Liquid Crystal Display composed of
> a TFT LCD panel, a driver circuit, and LED backlight system. The screen
> format is intended to support the 16:9 FHD, 1920(H) x 1080(V) screen
> and 16.7M colors (RGB 8-bits) with LED backlight driving circuit.
> All input signals are LVDS interface compatible.
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/2] dt-bindings: display: simple: Add AUO G156HAN04.0 LVDS display
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=bf7f730dea3125b2272ad7268f59e8992c5b7822
[2/2] drm/panel: simple: Add AUO G156HAN04.0 LVDS display support
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=9e52d5c808215b0033cdbeca72700b1e401ea987

-- 
Neil

