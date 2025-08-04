Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2BDEB1A60A
	for <lists+dri-devel@lfdr.de>; Mon,  4 Aug 2025 17:33:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D768910E58B;
	Mon,  4 Aug 2025 15:33:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="cza8XhU0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6920910E572
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Aug 2025 15:33:00 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-451d41e1ad1so31836195e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Aug 2025 08:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754321579; x=1754926379; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cTa7o52Sju7xMLjz8WbVJTsYb20sJmccUB4UlGJWqxA=;
 b=cza8XhU0RKKs7rowJ5ThdGvZv9z2s6k3p/sMjaraevbbwFZCV/2GePwYTInasXcSCj
 L2FQD6hcf6cO0szSXi59NCS6S/Hi933YiJHcUhSN+izKlEHPIRabWpydOV6292ocWoGx
 xMIwT9Cr0ptjUi1Nt50BhcaV0ytqu4M7WIPGcweoJqOLsx4yyKwbGYHk0aGHnLYl/Yfv
 eVmH6zWVnn10q5fiPhwlwZnDx05Ljuq/kqp0IfoS+i+TbQvd881P0MJlhRqqnLbjupQO
 eOC/WR91nE/y6KmGNCM/3kIZphVrcaNKfAJfpRYVq7pNY/h8/4Gy9s9ffp+wnmb+1VF0
 JLFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754321579; x=1754926379;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cTa7o52Sju7xMLjz8WbVJTsYb20sJmccUB4UlGJWqxA=;
 b=NOmwivw37Ud1eZ/2mXGNiHmNtYUTsTQmZMaaG/rwL25/XKWn0dZP73rQ8d7dGjvHxV
 A1IqvS7cdZzYGLdOwgjO8IeokH3cbLiBX/Us9fmBDhwsWd1xc6SaZpuHYou4niskPrr1
 rSbjwrcwO1V6SjdZGUiU+oUUwnC1eWcStWgBoXiqn3lRAO6p/LbbNC0UChCZLZJ39Jmf
 D+2s6xX7j1Gk/HvE6GCHgp4l5J+SLQG9GqxSCIR6rxavXr9/avLL5JNdUTIy9Y/3LNbm
 wvcnZ+SptqZEw7MOoiQxcR3eC+3xQH2W7nxXpN/TxKDPXrK1U7q7szQgXbZfs7rKthC5
 pHUg==
X-Gm-Message-State: AOJu0Yy4aYwBH5TdCMGjE0gJ+wnpAzV5jaQ+kBk469peCwKdijWiPZ17
 cSs0zutdeLKHa1JOC5fUbfjAblBCk1y9tLgNTyzGpDGRwTNy20LLAg6p3E7re21adD8=
X-Gm-Gg: ASbGncuFrPL54TkRztAIJhO5SEnX+uprIKB/Zo4TPYwI8S1VyAZDf015zfdK9MeBF8y
 OSgkKgeW1a4VY7sBrMBux7y/34vllaQkj/i9NQ5hEx5m7hSoHFaq+wPMemrE4FHV0pDvvujpCn+
 M6knE/Vbv/qCFdeSoL190J5g6UqeGwqDA2kozokLgz/xO4461BtCl2c832n/5NjA00RqwKAed/N
 qZdh3pPjdo0ESsx+bmBfq1/3rEX2poYLlxNY5IACRz/eBGdnsnGF8ApfjhZJypbdik8daG4V2V4
 eDw5PILMYPZ2r2A81pACYyARqr6jjfUOA2u5O67Mg5jvBi9/KqRrvbn6dqpo3d6H+bAynfz5wvi
 EAkVp5fPVJ6ptWo8fj5Mcacps7RmRe35NiGXGEUtJZeo=
X-Google-Smtp-Source: AGHT+IHsFdSh2BGQcoPWO0NP0zi5EFOvsmKW2I5qgsqHsYv6bx+I9/Lnv6/qQFJC3vfzR2NEu/NgtQ==
X-Received: by 2002:a05:6000:24c6:b0:3b7:9214:6d70 with SMTP id
 ffacd0b85a97d-3b8d94728c4mr7097621f8f.15.1754321578854; 
 Mon, 04 Aug 2025 08:32:58 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c47ca5fsm15664010f8f.63.2025.08.04.08.32.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Aug 2025 08:32:58 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
In-Reply-To: <20250721-panel-samsung-s6e8aa5x01-v5-0-1a315aba530b@disroot.org>
References: <20250721-panel-samsung-s6e8aa5x01-v5-0-1a315aba530b@disroot.org>
Subject: Re: [PATCH v5 0/2] Add driver for Samsung AMS561RA01 panel with
 S6E8AA5X01 controller
Message-Id: <175432157792.3671011.1104200917154441096.b4-ty@linaro.org>
Date: Mon, 04 Aug 2025 17:32:57 +0200
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

On Mon, 21 Jul 2025 20:08:58 +0530, Kaustabh Chakraborty wrote:
> This patch series introduces a driver for Samsung AMS561RA01, which is
> an AMOLED panel using the Samsung S6E8AA5X01 panel controller. This
> panel is found in several (mostly Samsung) phones, it is a ~5.6 inch
> 720x1480 panel.
> 
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/2] dt-bindings: display: panel: document Samsung AMS561RA01 panel with S6E8AA5X01 controller
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/f3e1caef597e7f29dd2326dae7fa5964ae46c91d
[2/2] drm: panel: add support for Samsung AMS561RA01 panel with S6E8AA5X01 controller
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/47d7953d8e1e774265ec2c79e37871af97abadb2

-- 
Neil

