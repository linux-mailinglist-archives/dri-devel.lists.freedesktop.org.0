Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E768B052E4
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 09:24:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9628610E52C;
	Tue, 15 Jul 2025 07:24:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=scandent.com header.i=@scandent.com header.b="BEA33YAX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
 [209.85.160.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C471810E518
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 22:18:16 +0000 (UTC)
Received: by mail-qt1-f171.google.com with SMTP id
 d75a77b69052e-4ab60e97cf8so22968161cf.0
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 15:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=scandent.com; s=google; t=1752531495; x=1753136295;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ouMuj11MjFvdwjVughz3WZjGk79DPdwniSFwLLOcIJQ=;
 b=BEA33YAXQAJbmg+q+ZufQ+SR2fbsZAXqKDDwoCf08tGr5z3gCGwbQcM2rRpD04tgvC
 YIJplSeZ9gyQVWojwiAxp0TPbTALIQXS7t1LAq8ntwMZoniX7DNVfZc/VU70kYCLn/w9
 CSPcmv3aYxtmTVqDOUjoVxTleHGT25Juqkn+RE8ERPH0Opl/MviJ/wW0Z71Wkv6QTlc8
 PS3yNxvE5q2PfeEaMKsyFBnJQ2G3XCmEElo8oBbsJPEuEJQ/K+LFpBu6IBY5LKNbD004
 oTaX/NVYZU2lEazWgLUde7rXimcpr7fdUK2UFp6vD0jSIbfBshL5Xu5nxdih3Wyu8vwZ
 3tUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752531495; x=1753136295;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ouMuj11MjFvdwjVughz3WZjGk79DPdwniSFwLLOcIJQ=;
 b=NyvDGKcKp883wiBKd6Xz3FuC4YDoI1Jx0s7zkkXcsstl5Ki/GuTB2HdLMLcJuEKcOp
 MbO1Z5OpTc0WF8BdjIRbpSn+kMY1ZbaoeCTgZEbuWm50l1AIaQmwnpjKijZ50vujjTmR
 ybiZC/HyWNlGAARonnrYOx39i8gdAoP4imYbxWpbLK8Gs4fPYLztqgwbepR+MmYM94qc
 TNvTa81ICdHFzUDZ7do4bPkJT0KeJ/OGcx4l4zJy3p8XY3cT7l2vKOwU09fSA5QPBQCX
 4OGJ90GwyqgdLui3dErd/vPInaiOHM80O8IasAhkw0+GxTT25+kIkmaPsMFEi+h5sltd
 w6LA==
X-Gm-Message-State: AOJu0YziFIeOJqcQ6lfxr0MXY/N1kUzqqykk95jVFt6oFWjc+29FP+uo
 6Y//2DFkOf+RSE+fz8HcM2J/5swMnFhRktTIKU5bs9pzxP/vf4iAVHiCheQ4sV1ugxOmRplcDut
 wwpHDNYc=
X-Gm-Gg: ASbGncuDwxB+jtHFNDLQO0VwxDZIcX04wM8IsjbUdll5gaGvQ2zMyIBTVldSPxVl9Z9
 n69YKeg7nQCwYJxHWynq200QetFWML21p2tA2A3sF5YGQTvJrbj4vFmT2/tswpOU6ss+vfcwMZD
 wepJFEJPHTEEK6qg6wwMeVU3CymSvtQfO2bLVwbMkOpybNvTQEoGyR6pbaQ8L5QnO7gXS6Qp84q
 ukLAf0qpr9vMUnEr6IlwZPAu9oIamjOqFmktGilbOU2o+pdzkdBSeg+mXSlwuBFEkaUx3eqGgWY
 YLajYw5mXvg750CEGLKrMWeuSCxBGu508vM5F8pcDHMsIyNSaXv67uE0MKmQCZv87DwxmBXQ2DJ
 IJI8uLGX7rtzkISxdkGkGqwPL/UXPGsqMy4aGppcNiqVo1RtzTQRZcAuc9G0=
X-Google-Smtp-Source: AGHT+IGSSrEk0sdISqge7G0djRIjWuuV30fns6i4QsiVDwWMYt0jZAnn6a3hXxiBvovc3VD+dN/cfQ==
X-Received: by 2002:ac8:6909:0:b0:4ab:80e0:955f with SMTP id
 d75a77b69052e-4ab80e09e16mr13247631cf.34.1752531495432; 
 Mon, 14 Jul 2025 15:18:15 -0700 (PDT)
Received: from vserver (ool-44c5118c.dyn.optonline.net. [68.197.17.140])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4ab3a1ceae0sm37822021cf.25.2025.07.14.15.18.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jul 2025 15:18:14 -0700 (PDT)
From: Richard Yao <richard@scandent.com>
To: dri-devel@lists.freedesktop.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Akshay Athalye <akshay@scandent.com>, Richard Yao <richard@scandent.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v3 2/3] dt-bindings: ilitek-ili9881c: Add Tianxianwei
 TWX700100S0 support
Date: Mon, 14 Jul 2025 18:18:00 -0400
Message-ID: <20250714221804.25691-3-richard@scandent.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250714221804.25691-1-richard@scandent.com>
References: <20250714221804.25691-1-richard@scandent.com>
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

Document the compatible value for Tianxianwei TWX700100S0 panel.

Signed-off-by: Richard Yao <richard@scandent.com>
---
 .../devicetree/bindings/display/panel/ilitek,ili9881c.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
index baf5dfe5f5eb..28d5fff79992 100644
--- a/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
+++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
@@ -21,6 +21,7 @@ properties:
           - feixin,k101-im2byl02
           - startek,kd050hdfia020
           - tdo,tl050hdv35
+          - tianxianwei,txw700100s0
           - wanchanglong,w552946aba
       - const: ilitek,ili9881c
 
-- 
2.50.0

