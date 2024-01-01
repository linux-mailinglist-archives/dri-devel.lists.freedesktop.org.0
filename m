Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40826821457
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jan 2024 17:16:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B841898A7;
	Mon,  1 Jan 2024 16:16:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5814898A7
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jan 2024 16:16:14 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a26f73732c5so546122566b.3
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Jan 2024 08:16:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1704125773; x=1704730573;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CW3Z4rHUB+JDGSn9srF1tyf6s3+qOGgrdqYnKXE4nAQ=;
 b=Oy82kqbV87ZhE5WXr1KIk+Vvrt/gazUtJOs+/oM+83aV9wYy84ttquaCVFgtf4RDci
 N3eRDvUYat8sUQoRx+tO7Zudts8a4jj4wtjVw/oV+uq9STsGvtUXEKWYPTCkFhPMzalZ
 m/Ol5DIiwMrjRpYdZxbobqhzjhBMc3DYgKfJU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704125773; x=1704730573;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CW3Z4rHUB+JDGSn9srF1tyf6s3+qOGgrdqYnKXE4nAQ=;
 b=Al1l3lNzcixiwAKDkShU2MAQ9XWSeEfE93/LFw7ubdscwFOJ/kT81bTwN3xvoqI7/u
 apZARf39IwNehVtHC6hbLpELoVAJBSYRI1JK9dda0HH18dJuoCY+OMjorYIIwNxEmdsc
 yk3I+jKjbvXUwLbdqhgYn+BnGHCDJCFPKx3uAe+h27VM4D3FYcb0k90R0/sFFHqtaFq8
 9LlWLEHqAkHXM3ALwySESQSRvxYqC0MzMhX0jXJazPvnlmD8NYcaa0Np1NXRXLOgz3+E
 fW2IETC6TzqwjjFPU33XK5097OLOs3wB2KkJ8nVHyAdXAeFCRRG8UT2Q4JbdTS4Rmn0r
 RXBg==
X-Gm-Message-State: AOJu0YyNSh+uZ26xvF8K+BlaRjxptr+Mc5nS7LyzfkH/VGXBzc7nIGOr
 zq7LxLmmxcJSK+tYaJfwHVaWdxYTP19a7tczfYMhpjYTthg=
X-Google-Smtp-Source: AGHT+IEKeh5MrJ9goeqlfb+g5umXqiODj0UhS/GiSGSqks5kniFAS7Q1alMtKVi8maJNCh0fCz9dsw==
X-Received: by 2002:a17:906:3885:b0:a23:53f6:d66f with SMTP id
 q5-20020a170906388500b00a2353f6d66fmr8265521ejd.138.1704125773446; 
 Mon, 01 Jan 2024 08:16:13 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-82-48-44-179.retail.telecomitalia.it. [82.48.44.179])
 by smtp.gmail.com with ESMTPSA id
 ep16-20020a1709069b5000b00a27d5e9b3ebsm1897857ejc.105.2024.01.01.08.16.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jan 2024 08:16:13 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/8] dt-bindings: nt35510: add compatible for FRIDA
 FRD400B25025-A-CTK
Date: Mon,  1 Jan 2024 17:15:48 +0100
Message-ID: <20240101161601.2232247-6-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240101161601.2232247-1-dario.binacchi@amarulasolutions.com>
References: <20240101161601.2232247-1-dario.binacchi@amarulasolutions.com>
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
Cc: dri-devel@lists.freedesktop.org, Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, devicetree@vger.kernel.org,
 linux-amarula@amarulasolutions.com,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 David Airlie <airlied@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The patch adds the FRIDA FRD400B25025-A-CTK panel, which belongs to the
Novatek NT35510-based panel family.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v2:
- Add a dash in front of each "items:"

 .../bindings/display/panel/novatek,nt35510.yaml        | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt35510.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt35510.yaml
index bc92928c805b..8e69446e00e0 100644
--- a/Documentation/devicetree/bindings/display/panel/novatek,nt35510.yaml
+++ b/Documentation/devicetree/bindings/display/panel/novatek,nt35510.yaml
@@ -14,9 +14,13 @@ allOf:
 
 properties:
   compatible:
-    items:
-      - const: hydis,hva40wv1
-      - const: novatek,nt35510
+    oneOf:
+      - items:
+          - const: hydis,hva40wv1
+          - const: novatek,nt35510
+      - items:
+          - const: frida,frd400b25025
+          - const: novatek,nt35510
     description: This indicates the panel manufacturer of the panel
       that is in turn using the NT35510 panel driver. The compatible
       string determines how the NT35510 panel driver shall be configured
-- 
2.43.0

