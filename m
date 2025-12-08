Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A86E0CAF401
	for <lists+dri-devel@lfdr.de>; Tue, 09 Dec 2025 09:11:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8BF310E49A;
	Tue,  9 Dec 2025 08:11:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="A259waqE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72EAC10E3B3
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Dec 2025 16:09:27 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-37d275cb96cso39204821fa.2
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Dec 2025 08:09:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765210166; x=1765814966; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+6YJOjTEDWIwVZhIEu7U0+PRzwWU7tV8413g0FiGGOA=;
 b=A259waqEtHLX8jHSm1Lgu97Rb8J3x8GyXpxrR3MBMyHPpkQdxmRxwL+esl4xh8DoT4
 kDVl9USbZ3X3gVDnqbD//TQBIpds7hkbPmhi4AX1olzavPMoCWFBDhDB37o2j03+/S+M
 aknlgXwsTj60TK55GBMzoX2mX/NkaQegiCJ7xJ7vT0GELz/OTR//pFrRqJ9lJQ6gHTso
 QyEwzUjdUHeE4Mp1SZLmx7VJiaiJPW6iKdCCnc1fmJ8ps2HvUv0i8RV92yhATnscXElI
 nXXgU9Hn3kFbm1+3dAIdAE/afpkt6OadbzaLtAtpTA3eweZcXvhn6JbBhMiBIvqj96vW
 dMOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765210166; x=1765814966;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+6YJOjTEDWIwVZhIEu7U0+PRzwWU7tV8413g0FiGGOA=;
 b=MUZrryVp3BKyoFxXNHjnMy8rShhxjDlnxvZEXYPuFpD7DbndIKhV2qEDAtPW+itUG0
 BqvVNITThrWREebJ9EzfmGQ30hbEeCTnQisd+tqiFBXWeH4RhZPrNcYvFdiSTadQX1EB
 LiNXW2Rtxk03NE5qeQY4XTvExnKdmNjINC348zPVVGJjNb9bYj69VWIyetdMLzhsKDSr
 olAFrnXY97MTpE+fIYL02Hs6t9+T/5/NiLXhrHY2WZj0KLfk2O4PfQIVdVGUOj3wIVFD
 zVM28RzpuZtRZFbvFXMDuL1+oOnqYhkI+dTRVG9pDZr21Gfte9tkHoIAfOJzFfuKfuF1
 gquQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW7WCn5w6oW/Ehe3Aqu7CW8oA6GYJZe6DxyQPwFwEt+tsYhCLwe6NDE4L4eWUpqkDeBEEQPWcdNf74=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzwdidYD70vbywPjulA17W8XrS4k4JpccsbLK2T9fSD5Ds44Qsr
 M5U/4rKXzbxtUBxY2gUwHGAsvmjd/9a3aFU3huaa8zfdTDJQoCtUducR
X-Gm-Gg: ASbGncsFMVEQgv1KUV5P51I0Fmgt6rdXqfK2P9aXiBDsFR101cPSKbuRWkM9r1fTqPc
 0Nk+puI1823eoPhILqDAzeBOy/Ty+MR6yynmbX4SwzaNLVaj6GfAnLeK4xQwvdG1IQuQueA8nDT
 Glb9g28nmOtTFWbTeyuv75hOfRTZm+xlfQ/DQU3xhv76yrAQcuGF4BYvgsg/bvAjR9fPgBLv39E
 Mn/8I4wDcXReqjjka+JupVi2nt5qR2hAotzH8xA5fwZtjFkMrQKRRzGQEa8jINiX8rp/8ccwKsM
 BcOoBtqkdembtwAafvPpagqDp++F6wNTIO8C9R/IB9wER1ayCKx/uABiGp1ULK9hJ+3+lyQxX0p
 cjOD/5EPM2lecM7eIdC1I4XnYiEtj/KfaIABWLI3Pf1lVmSTcnzY5ioNFyALmpoz2b7Yg/YlGAw
 F7znQnBiQvy4jjY1MqHqI=
X-Google-Smtp-Source: AGHT+IHvGsnxGNA8T5LG95souf75pxrvmgi6XnAgO9WRnrxskKFU0kIr+OSaWegOdf8hi5iMgv0OJw==
X-Received: by 2002:a05:6512:61a:b0:598:853e:f26e with SMTP id
 2adb3069b0e04-598853ef2f5mr2174493e87.52.1765210165486; 
 Mon, 08 Dec 2025 08:09:25 -0800 (PST)
Received: from vovchkir.localdomain ([95.161.223.42])
 by smtp.googlemail.com with ESMTPSA id
 2adb3069b0e04-597d7b24725sm4207106e87.22.2025.12.08.08.09.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Dec 2025 08:09:24 -0800 (PST)
From: Vladimir Yakovlev <vovchkir@gmail.com>
To: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
Cc: Vladimir Yakovlev <vovchkir@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] support for xr109ai2t panel
Date: Mon,  8 Dec 2025 19:09:16 +0300
Message-Id: <20251208160918.3760498-1-vovchkir@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 09 Dec 2025 08:11:41 +0000
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

Hello!

This adds support for the STARRY XR109IA2T panel based on the hx83102 chip

Changes in v2:
- Corrected case for hexadecimal code.
- Uppercase characters have been replaced with lowercase in the panel initialization sequence.

Thanks

Vladimir Yakovlev (2):
  drm/panel: himax-hx83102: add panel starry xr109ia2t
  dt-bindings: display: panel: Add compatible for STARRY xr109ai2t

 .../bindings/display/panel/himax,hx83102.yaml |   2 +
 drivers/gpu/drm/panel/panel-himax-hx83102.c   | 193 ++++++++++++++++++
 2 files changed, 195 insertions(+)

-- 
2.34.1

