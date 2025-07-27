Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5E0B130C9
	for <lists+dri-devel@lfdr.de>; Sun, 27 Jul 2025 18:58:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C936110E2FF;
	Sun, 27 Jul 2025 16:58:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DhkGoZpT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3467210E2FF
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Jul 2025 16:58:52 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4555f89b236so30259265e9.1
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Jul 2025 09:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753635530; x=1754240330; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=r4E2OevupfQKVl0lcYB+7nYiiBvTadH7JVYN6RBSvCk=;
 b=DhkGoZpTBtvftb52UUF/Xl+9qLUt34wtw8Fb4sxMGxdWuKgf6qoBnQUm2BMX6PEUaD
 o5kWEbjnjTLv10myvu1krPWxvg99Dz3sieVpCNkWc4yB4g+XtzEZlO1dDfDjMJGjyb9E
 dTX+giAPBG/FMhKYC6umFW8wBULhZV9b6nCcKzO646objczl7FlpOJEtqRF3UEAUHmCg
 fEeIkx7AFduXshJrrLmfQpkC+F0I+nXm76mSbjtVRPBmljEkvZRLoWAA+9yqCqFtb3iD
 3CMsmpI1H/HQimCtPHUyi4BzKXSppr+tikTMNIrn9h6A+mklhngTInZ6cxAMq+1vIlGQ
 RHsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753635530; x=1754240330;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=r4E2OevupfQKVl0lcYB+7nYiiBvTadH7JVYN6RBSvCk=;
 b=J9OGYYYJVxl+kPkdjsiYFGXka8HmH0y2KTxu7HHVFEhkwNtiU7Q7Xn01mDn7R9e0Wv
 h8rveQnJ2xsgF91uPwIXR0kXUnkrULVJFaDYoiif3rvCGXBd4+QqNl+5jKK+F2OGOqst
 pYWAo4gCk6mJnmWf7pba/vvQxeST8+tfYXXCGSfD4e4lfnjU0UUTXrr45ZxU1SbDfvRF
 g249+I6TaIV5GZ2xOJOMNwOlf+Oa7W+qwBT6ZaObQPm8ITdcbkXHV9ODrC4d1h25ir5p
 CriCe/McD8Y91g2WOyhQAIJXub92zbqDyVQtw51MK1pD83l9AQTILleur/1DUc8ZsSgX
 byCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWY1NeJ1aIl716zDcik3NVeQayY5BD7RBWo7m2DiVjifLE19o/stltCgL5ugA3MdQN5+TJnN5OvyoI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzRiE5rwZNvv2/qPzzdbnnmB28pycV70znN+rpvCJ+ar8HZwUWp
 MJKAsAnJuP7Bd5gHVJLQklub2ICz8+DG+OXkzDZyJaMIMSMH4i7TLEU=
X-Gm-Gg: ASbGncuvxdpgKleN5DJN2ovx2ZWGFpCTrXyOmkcf0vi211IxgxK9liqTo4eGmScJM6A
 E2fRo/gGRooVuXAqz4h+bOcN0S2oOrlpf6w6AHyg63f3XQVfORIRhG3e/N/5HC0Fj+jD6RlAaaQ
 QC0OGfYE91okUeOTYZ1pTvwhsN13TQ5couRdNproRYj3ozM5UV4WLTI2oQWlaEQLOO3gULttr6/
 egiQGgLNUEmkG9DmUI6xFnoeO4DkiM0mRe2k/LN4nejc5tfZDd+8zUAfYWze5AXZHB+JMsJxcOW
 0gm4fC7IJK/F67ZwuLK9d8M1LTB9qcW6OmPQCUNQeePvx3RM9e5rFY+CmnRlE4w5xiqTkxJ4YnU
 OLDEdZu2xSKHzEn/z8U6H/u3mtCfILM0bMk18s90M
X-Google-Smtp-Source: AGHT+IH2MnqPI8ynh24vurJeF9f1csP4RuAkH1s2rFXLB9nATvHESor2pnIPxjgIKcm+9XP/1kSjUA==
X-Received: by 2002:a05:600c:64ca:b0:456:11cb:b9c7 with SMTP id
 5b1f17b1804b1-458786424f8mr67554035e9.25.1753635530016; 
 Sun, 27 Jul 2025 09:58:50 -0700 (PDT)
Received: from alex-x1e.localdomain ([84.226.118.249])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458704aaf20sm128545745e9.0.2025.07.27.09.58.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Jul 2025 09:58:49 -0700 (PDT)
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
To: Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Subject: [PATCH v1 0/3] Add panels used by Asus Zenbook A14
Date: Sun, 27 Jul 2025 18:50:23 +0200
Message-ID: <20250727165846.38186-1-alex.vinarskis@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Add x3 panels used by the abovementined device. The laptop comes in
two variants:

* UX3407RA, higher end, FHD+ OLED or WOXGA+ OLED panel
* UX3407QA, lower end, FHD+ OLED or FHD+ LCD panels

At last all three variants were succeffully tested. Device-tree change
to take advantage of Samsung driver for OLED panels [1] will come later
via separate series once this one lands to linux-next.

[1] https://github.com/alexVinarskis/linux-x1e80100-zenbook-a14/blob/master/0007-arm64-dts-qcom-Rework-X1-based-Asus-Zenbook-A14-s-di.patch

Aleksandrs Vinarskis (3):
  dt-bindings: display: panel: samsung,atna40cu11: document ATNA40CU11
  dt-bindings: display: panel: samsung,atna40ct06: document ATNA40CT06
  drm/panel-edp: Add BOE NV140WUM-N64

 .../devicetree/bindings/display/panel/samsung,atna33xc20.yaml | 4 ++++
 drivers/gpu/drm/panel/panel-edp.c                             | 1 +
 2 files changed, 5 insertions(+)

-- 
2.48.1

