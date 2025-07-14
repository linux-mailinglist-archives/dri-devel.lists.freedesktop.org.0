Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 824E8B052F7
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 09:25:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A677010E53F;
	Tue, 15 Jul 2025 07:25:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=scandent.com header.i=@scandent.com header.b="HChIq76z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
 [209.85.160.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FA5110E0AB
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 19:17:39 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id
 d75a77b69052e-4ab53fce526so26158551cf.2
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 12:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=scandent.com; s=google; t=1752520658; x=1753125458;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oWoIZzm0uqcPp9ZelvtCnlGSyRPqWxQLJdYrHzVMirc=;
 b=HChIq76zOBoxW+e873KZaTB7t1MORBlS5Q+m7M3sI0iSwi9CAiX7SjaxBQuCiRBvLF
 P0MH7m61q1mOwtG2/o4Zs7k3y+NEMUJAdExhZn+iSZptcLaOCnZirt4qI1Ito1ao9u84
 4HQ/bRZHLNirQz8xaNbr6qJJ3oTF67vxE25ZlVD6SZnSaEoSBV8ETUuV4kxhb+14guCK
 Dy2xDd4yCndvqAoZZLW0diR2ZlMFoytfFpIeTOS2cgLf5YPs07dfL52OJ3ZLCIfPfC3x
 CF5pVXxnhFmxkBbXRUwZ2wuL8zn0Cv4t1fjyJiA+VOgdZam9/LMse1kDpq4XAs/8CIXP
 kK4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752520658; x=1753125458;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oWoIZzm0uqcPp9ZelvtCnlGSyRPqWxQLJdYrHzVMirc=;
 b=CkZ7545duqa/lFdEE5bplwittLbYUeNFvJf8CrUEQJSuPBVOLqGCcRevQm77ZkzakV
 3HsxjBerZ0b/KflIOsrSZw3X77dRZ7BuR9CpWo1Nz0xLe6yqiom0R1k+itGtmPHdeQjC
 NWUfYaLGHius58+vuXoLXUM8jJkiJpZyikBIqztIaIPPmQe8UVUs0JckCK9Mim0qv3nB
 nlDxMtuqC0sfWRySKMD5fnYhwksE4m5qSBA2AuqtHo5hCAPROY92bmUhT/p9SJgS/u+D
 W5xz0IcE3Fo/dFJS8VGviBinkPAyRoTa+Kbb0/h1AshS/UROEWMabvoDkWcb9fK6Qbx+
 fRWw==
X-Gm-Message-State: AOJu0YwxrxhB/uLPBqySozzX21fsbmjPh4nsAeTT91ICk3jRAvyT+WLj
 166CWXKc4dJXbtxwzqV+9ZtM2Q2BfYQJ9UA7aQJQA8F/da2WUOP98sMKr1Hwx203pJXTZ7ey9FE
 vpWiNJOk=
X-Gm-Gg: ASbGncudsXpHM079LHLSKN/FGlQ1fcaiJjmv/hk9qFLtbBekpyROeUQSFipMmRoV8cS
 xs83a5U054WwC5MvJSsf9msv8ed4k1MMR39bEttJ0PDJEkmBk6q2TiNMtS4mIM8jj8x5p6MqIJ3
 JuzhuRV1m91wRrvffX1KflfU7Cq/4UYCE/4+xu5tXTBBrabRZ9SdKJkt25v1LlQ55ZWBXQFyqiP
 y40e54pfTCU+d1qiCace571YZQ8rj9AVlqO9Z5LTTeBJHlRmkqmlyeRiQnlJZ0BZKy6AILz38/Z
 67cpg4nrT8RF0IeGUOqzq4/Ui+vWc13WooyrFh/BfkHaTB9tXH/k2pzw1F2ydujYOub5v+CKBFu
 ohXDBT4SUH9SEi6iGraw2I90J3dxMBywlz2+oz0d/TYDlndCl
X-Google-Smtp-Source: AGHT+IH9gnkyuOuPKjSw4HN8uBsSQTfAFopuTxzSbsZaRocX/u4+4/u1WhT40OcTC4OtUT869qGIsg==
X-Received: by 2002:ac8:5c81:0:b0:4ab:5b3a:5f14 with SMTP id
 d75a77b69052e-4ab5b3a6171mr148318871cf.4.1752520657836; 
 Mon, 14 Jul 2025 12:17:37 -0700 (PDT)
Received: from vserver (ool-44c5118c.dyn.optonline.net. [68.197.17.140])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4ab801e542bsm1482521cf.3.2025.07.14.12.17.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jul 2025 12:17:37 -0700 (PDT)
From: Richard Yao <richard@scandent.com>
To: dri-devel@lists.freedesktop.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Akshay Athalye <akshay@scandent.com>, Richard Yao <richard@scandent.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH 2/3] dt-bindings: ilitek-ili9881c: Add Tianxinwei TWX700100S0
 support
Date: Mon, 14 Jul 2025 15:17:22 -0400
Message-ID: <20250714191729.2416-3-richard@scandent.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250714191729.2416-1-richard@scandent.com>
References: <20250714191729.2416-1-richard@scandent.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 15 Jul 2025 07:24:49 +0000
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

Document the compatible value for Tianxinwei TWX700100S0 panel.

Signed-off-by: Richard Yao <richard@scandent.com>
---
 .../devicetree/bindings/display/panel/ilitek,ili9881c.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
index baf5dfe5f5eb..c181f5adcbc5 100644
--- a/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
+++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
@@ -21,6 +21,7 @@ properties:
           - feixin,k101-im2byl02
           - startek,kd050hdfia020
           - tdo,tl050hdv35
+          - tianxinwei,txw700100s0
           - wanchanglong,w552946aba
       - const: ilitek,ili9881c
 
-- 
2.50.0

