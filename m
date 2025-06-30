Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 132D1AEE2DE
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jun 2025 17:41:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 340D710E496;
	Mon, 30 Jun 2025 15:41:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="BqJyRBkd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8920710E496
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 15:41:21 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-453066fad06so30752705e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 08:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751298080; x=1751902880; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wIBoKnvqHm7jPzDveA9hy26/rZ1VMnuhsibGyxt03cs=;
 b=BqJyRBkdjhbJbKcSX4DOELcwMf/PHUX2WZEts0IBUWYqOO65JKK234roDAsi6MPxZ2
 2G9hHuv/JKHjnuE7Db/tdROyNPxbF8tbBzjc5hoKlhdiM/+/X2l3hfDEeqYIoVWOgJe+
 n1fkARneB7M25kieRdxVfJyj4hTYH6SCCvdFuxyyUSe/C6vC/kigI4rLb74qL0x/LbuV
 SeEtrACWQ8s6JcTWh1SEdQ89H08gWL0jun6BqmSDLEGUI7ufSo/bQow9ZV/ZC2+mzhp3
 1DHoseWEvf/uyBkUw2Fh6U/4snyAe2rRFYGr/5QjRUi+pc4//PxJaQL8qWTxzx6oRXF1
 ffHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751298080; x=1751902880;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wIBoKnvqHm7jPzDveA9hy26/rZ1VMnuhsibGyxt03cs=;
 b=Fp7s/RRtHWaK+62Cl2QQslPzKmFMmI65D/AHnl9e+6V9dTNedBC9cmNIBFov3u1evI
 vhTh/8lKvMQ+9L0b41tvQvJuOAJFBgxuEmgqoV2roSMaQkQ9hrClrpam2UMt2Ya8F7MW
 DPZgTS1T+b3075aEY4eZdMS1vXkU+Z7XBLrRw0dG5V4ZfOtIgSMgyDxyz/yYpjI1hFgB
 uy7/083tEIlNOrxldJp5Nos5RSfYB9sP0QQ2Jy9ldj6LUE2xdIAgxxjokvr2g2+QTjn/
 Puz/ALRH6eU/OIbD5Qe/YRsJoT3qnelqI/QSx+EJbhvim3a6yNF/Dz96C3o5YWz+semJ
 PuRw==
X-Gm-Message-State: AOJu0Yx+G8kj+6pzeQHdKV3AEaHc20wpZUcFcE0Cwz5IfwmhKvzN2TlO
 ZnZtg1U3yEMt/gjPOyAbUlW+jeQEnsBIDN7VMqKPz/42l+xhADKiXq149bGWilwHnG4=
X-Gm-Gg: ASbGncutAFEc4WhOaTld79gZsEtHAmRwnxdCFXZ4AHbK3ADNZ2Y+A3t5YafC2QujC2X
 T9FosBh6uhQBtv8r+p7pHw9JN+tX9FMKPs20EWXfaXKXCZ473OI8FifbrVQdcGmu/gCpWioDzCL
 io/mS+D2o3MmV6970qDJm98QkWJKPstP05AuL0vu31zTplPk7ZwznI7IlG5wcnXjV78ZUHWpjPG
 yvuJk3ri8uJkqeh1iKctPHAbYNM/j/rAEMCJMUnusTPg4cDSFKz+7/PriowOp6laHLtJlEu3doP
 DlP1opbbUv+rIm9wkZFfir/gsM69Q+zMIIsUsbgIQRQv+jI5O/Ceu9A+AzIu5GWW7r3xeS0Nhb7
 ozgzgmm8=
X-Google-Smtp-Source: AGHT+IE4551ep9ypNSyk+kUT7ORHBKsH3ZNJO70PmyyYi6i5YwLUZhV22aROUA+T9WDlUEHG+Ihrqw==
X-Received: by 2002:a05:600c:5392:b0:445:1984:2479 with SMTP id
 5b1f17b1804b1-45390bad330mr126646345e9.5.1751298079968; 
 Mon, 30 Jun 2025 08:41:19 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-453823ad01csm170270975e9.22.2025.06.30.08.41.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jun 2025 08:41:19 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Luca Weiss <luca@lucaweiss.eu>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
In-Reply-To: <20250611-fp3-display-v4-0-ef67701e7687@lucaweiss.eu>
References: <20250611-fp3-display-v4-0-ef67701e7687@lucaweiss.eu>
Subject: Re: (subset) [PATCH v4 0/4] Add display support for Fairphone 3
 smartphone
Message-Id: <175129807911.2286551.14063311790282968036.b4-ty@linaro.org>
Date: Mon, 30 Jun 2025 17:41:19 +0200
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

On Wed, 11 Jun 2025 18:33:14 +0200, Luca Weiss wrote:
> Add a driver for the HX83112B-based panel, and enable it on Fairphone 3
> to enable display output, and enable GPU as well.
> 
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/4] dt-bindings: vendor-prefixes: document Shenzhen DJN Optronics Technology
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/978a84297371ac33a15c56a7d31fd1b125427dac
[2/4] dt-bindings: display: panel: Add Himax HX83112B
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/54bd1390e98450a2c1cad99da3e2594e92c41a4c
[3/4] drm/panel: Add driver for DJN HX83112B LCD panel
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/df401fa1b80775109e2a52360fcb0b2b2300525a

-- 
Neil

