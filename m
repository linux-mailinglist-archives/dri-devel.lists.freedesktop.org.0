Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F167D843B22
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jan 2024 10:30:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E45D113AD3;
	Wed, 31 Jan 2024 09:30:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5DA6113AD3
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jan 2024 09:30:27 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-a350bfcc621so554693766b.0
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jan 2024 01:30:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1706693366; x=1707298166;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Xk9fhyP0CkSTpvqSdLIvIAOMOdEQrJYka04kzpQbSCI=;
 b=MjFfDhNpu5qU38lrhONKGzzm5B1efn4K079L0QhbsTkxredTB6CQMvEF7JojOow9vo
 BzskhFg4FK4llh90uqajC31o0WBYh3nDjQbU/bPQ0NWpChFx/z3xyCe1ffvwjCMNAbhA
 e8Q5K8RjxyTw3obSS7pF0jBrmeY++reQx6cHQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706693366; x=1707298166;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Xk9fhyP0CkSTpvqSdLIvIAOMOdEQrJYka04kzpQbSCI=;
 b=XkufMeHFQNbhRgI/n2tFdD2h6GtSNlgB25xfRR+2DY+rHz0YztU/T2MnewlXZFq8yV
 9U46uNaIiB3As+ypNsOi/1csxGaRTR55PDIDokaFJv127byuDBLpv7dvvQkCABPKgmja
 e8nvhYS9Xms/VCUYCDFvsiLoODDLL5JpJipmj7JyA939B8ioZ396YmlO1UupV69jW9wT
 Dc8mrvTYhdAtKeLpwn1cI13N1SHNqevcXA+W9ZlxcGqwjEH0uouaSGgm3POvxUxO8Smi
 KS6WfGIinwAkP7zxuwOHsU59bkK2ehAWCQ+/wDkKNXJj8YV6SFRqTdfhjsNXTub+HSYS
 qjTw==
X-Gm-Message-State: AOJu0YyJcy+yotTC7fWAFaRlUM6qRGepWkZLybY7jP/IDZipzBnuvLLh
 ICaW7KvM+q8/Gowy+JpQTw5bK0NJGWHhu+27GUc81kLwg982mOP5IkE3OhvfdEI=
X-Google-Smtp-Source: AGHT+IHXEGDr4fGmwlGPRIVoGEbaTU3wb+9v6LQhDK8+IaSm0AjVrt+5w0SlCJUkC1vHmi19sAEe4Q==
X-Received: by 2002:a17:906:190a:b0:a35:7191:d952 with SMTP id
 a10-20020a170906190a00b00a357191d952mr670959eje.53.1706693365993; 
 Wed, 31 Jan 2024 01:29:25 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-82-56-30-170.retail.telecomitalia.it. [82.56.30.170])
 by smtp.gmail.com with ESMTPSA id
 g22-20020a170906349600b00a367bdce1fcsm321436ejb.64.2024.01.31.01.29.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Jan 2024 01:29:25 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Subject: [drm-drm-misc:drm-misc-next v2] dt-bindings: nt35510: document 'port'
 property
Date: Wed, 31 Jan 2024 10:28:44 +0100
Message-ID: <20240131092852.643844-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Allow 'port' property (coming from panel-common.yaml) to be used in DTS:

  st/stm32f769-disco-mb1166-reva09.dtb: panel@0: 'port' does not match any of the regexes: 'pinctrl-[0-9]+'

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>

---

Changes in v2:
- Rework the patch to drop errors found by command
  'make DT_CHECKER_FLAGS=-m dt_binding_check'.

 .../devicetree/bindings/display/panel/novatek,nt35510.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt35510.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt35510.yaml
index a4afaff483b7..91921f4b0e5f 100644
--- a/Documentation/devicetree/bindings/display/panel/novatek,nt35510.yaml
+++ b/Documentation/devicetree/bindings/display/panel/novatek,nt35510.yaml
@@ -31,6 +31,7 @@ properties:
   vddi-supply:
     description: regulator that supplies the vddi voltage
   backlight: true
+  port: true
 
 required:
   - compatible
-- 
2.43.0

