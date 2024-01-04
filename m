Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD588823DA3
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jan 2024 09:42:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFB6E10E3BF;
	Thu,  4 Jan 2024 08:42:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B082410E3BF
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jan 2024 08:42:21 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a28b1095064so26695066b.2
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Jan 2024 00:42:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1704357740; x=1704962540;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sXGsllobW7FM1Bh/GFVmgfSyiJn/KRbyHxvKaq5XBd4=;
 b=pV3gdtDtlusVMkrmOci/jRtghnMSWGOdSnjrg4ZARaMWOvnKuLC7DMNI2NV1PwiZF1
 yGch28Nt2rW/Mio1BTXmVDvnQDLS/fivVpX6qCmRZLTjKzh/t97DSJ9QzOx3XcuqukFq
 DIBkG5CXDEa1c7ySiil3sml9wcVXX4vZ8e0mQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704357740; x=1704962540;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sXGsllobW7FM1Bh/GFVmgfSyiJn/KRbyHxvKaq5XBd4=;
 b=RIampKbDUJedo8suqzCuPbLaTce7ehCgFAAKcLX1q8D8HqW51mxOMFWnIg3jUVctH5
 ZCIhvuEiQuqpfTz4j15V1LX/mljVp4CJh548VXLAnWURYQWl5ulN5Kh52CAfAIDWFDnU
 YeoHesMMbBOSFAQ0VgURYC7moAZOiM87DFuEYpOb20/VbvUfZCXbbaT7M+IWXFr1F0G9
 vW3qKcMiQrfOi1G8gkwQd12vhDwzZTjDz3Cavhfw3Zj0QOa/3HeSR7uK5Oqd3N9BMCXe
 sq8hSUpqRtY4MkQSBBOZVSrjNQNsVoZ7ZK77ep6kpRSmgnfbZ8abNwv0hO494yi8Msy8
 CjjA==
X-Gm-Message-State: AOJu0YwhfUgXpwx2fUYId9+b/1qdiLaRVIEE5s5KjlddX7zcGPzWNE++
 1bMeJZpz9ZQmDw/j1fB/7057PAsUsAkUrA==
X-Google-Smtp-Source: AGHT+IHmEppr/O53EySgWZMtoqd5scwBe7uUi57gjWCkgd3DZxEW3k2aOYRvBqHMPyUXPJ0NsC2ihA==
X-Received: by 2002:a17:906:e083:b0:a28:27df:b38 with SMTP id
 gh3-20020a170906e08300b00a2827df0b38mr88170ejb.201.1704357740231; 
 Thu, 04 Jan 2024 00:42:20 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com
 (net-93-150-255-34.cust.vodafonedsl.it. [93.150.255.34])
 by smtp.gmail.com with ESMTPSA id
 wh14-20020a170906fd0e00b00a233efe6aa7sm13495704ejb.51.2024.01.04.00.42.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jan 2024 00:42:19 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v4 5/8] dt-bindings: nt35510: add compatible for FRIDA
 FRD400B25025-A-CTK
Date: Thu,  4 Jan 2024 09:41:45 +0100
Message-ID: <20240104084206.721824-6-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240104084206.721824-1-dario.binacchi@amarulasolutions.com>
References: <20240104084206.721824-1-dario.binacchi@amarulasolutions.com>
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
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The patch adds the FRIDA FRD400B25025-A-CTK panel, which belongs to the
Novatek NT35510-based panel family.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v4:
- Put the "enum" list in alphabetical order

Changes in v3:
- Use "enum" to have less code changed

Changes in v2:
- Add a dash in front of each "items:"

 .../devicetree/bindings/display/panel/novatek,nt35510.yaml    | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt35510.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt35510.yaml
index bc92928c805b..a4afaff483b7 100644
--- a/Documentation/devicetree/bindings/display/panel/novatek,nt35510.yaml
+++ b/Documentation/devicetree/bindings/display/panel/novatek,nt35510.yaml
@@ -15,7 +15,9 @@ allOf:
 properties:
   compatible:
     items:
-      - const: hydis,hva40wv1
+      - enum:
+          - frida,frd400b25025
+          - hydis,hva40wv1
       - const: novatek,nt35510
     description: This indicates the panel manufacturer of the panel
       that is in turn using the NT35510 panel driver. The compatible
-- 
2.43.0

