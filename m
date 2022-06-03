Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76DE953C786
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jun 2022 11:26:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CA86112319;
	Fri,  3 Jun 2022 09:26:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C97D112303
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jun 2022 09:26:17 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id m20so14759152ejj.10
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Jun 2022 02:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r779VgB4wPd+dO4BnumFEEMoK5PeDls8DqXi+jzyZUk=;
 b=f+R+5qwCa/e3GQGG5kIjgqbEG8D0AdLZlPvlFWMh0nANKNQzW25nh67lFvGWHCmAme
 wOZoM1OGTH0JeDjUwMxkml0tO4CqWLYLZQ1j1e1/7UxPc+laMO9d2p8ZlhqXiAl8w5zz
 mOydMzVojO09VGYCR76P1s6s98gZneDmcc284F7lteaHR0iVxd9C48JjrqtvhutP+tEf
 VhR8yS0bB/ViUYgebS/icgc3Eqq79B+9kKvJAvRRdtBV6hyGOgfJn7mJEtBCcKKvJLkK
 Q8iICT4ObJzmFPSSfmdc75WMslEfDLvDI0zORjM9sprETND4l+SiBcZHEnH1vLKH/XT4
 bTdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r779VgB4wPd+dO4BnumFEEMoK5PeDls8DqXi+jzyZUk=;
 b=Aanj4iXQ5D8gwjmlur3zsguH1fJm/ffiGuD+swC9GtTHRFblJfMkx0lOUn84h6fjLR
 W9fk745xR1SWnClCkTcptbzWaCcWFsP6BWVoLYWSqqAn2BPAEaEj7kJcM7RPsbEaAq9u
 3F6tFik/ztrwGcyRRphZoGgLXJfQhW1AaLxAJ+L3Hlk69XQZtRUM6mce4qUru4JIubar
 xr+LYABNjxoERBNYgAdME/MZcO93z4CsYrbr9/hLVr5WL6tfTWFRKD95p0TSDyh/501R
 WehCQLTd3rBlYVSk1jOxFZxVmW8zmdYnF7GiH/hPSLPHmdOsNIGVmUrEfKvHCV27afVo
 BwQA==
X-Gm-Message-State: AOAM530CPPCKBXzZ9X8CCs2FoWFezGhpaD614br21nxyXokzfQxvXmPu
 ImD9Z1KU/a/S821kPhxVGqs=
X-Google-Smtp-Source: ABdhPJymvabgWIehxXXv6/WYRjeKoxF/7tX8NhrdZc6D5mjdvNWIrrXXtNRW0Oi0fIl8Utj3MhmLSA==
X-Received: by 2002:a17:907:3e15:b0:6fe:f10e:6337 with SMTP id
 hp21-20020a1709073e1500b006fef10e6337mr7918695ejc.209.1654248375876; 
 Fri, 03 Jun 2022 02:26:15 -0700 (PDT)
Received: from morpheus.home.roving-it.com
 (3.e.2.0.0.0.0.0.0.0.0.0.0.0.0.0.1.8.6.2.1.1.b.f.0.b.8.0.1.0.0.2.ip6.arpa.
 [2001:8b0:fb11:2681::2e3]) by smtp.googlemail.com with ESMTPSA id
 b5-20020a17090691c500b006feaa22e367sm2617672ejx.165.2022.06.03.02.26.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jun 2022 02:26:15 -0700 (PDT)
From: Peter Robinson <pbrobinson@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>, bcm-kernel-feedback-list@broadcom.com,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Emma Anholt <emma@anholt.net>, Florian Fainelli <f.fainelli@gmail.com>,
 javierm@redhat.com, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, maxime@cerno.tech,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Stefan Wahren <stefan.wahren@i2se.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Subject: [PATCH v6 1/6] dt-bindings: gpu: v3d: Add BCM2711's compatible
Date: Fri,  3 Jun 2022 10:26:05 +0100
Message-Id: <20220603092610.1909675-2-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220603092610.1909675-1-pbrobinson@gmail.com>
References: <20220603092610.1909675-1-pbrobinson@gmail.com>
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
Cc: Peter Robinson <pbrobinson@gmail.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

BCM2711, Raspberry Pi 4's SoC, contains a V3D core. So add its specific
compatible to the bindings.

Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
Reviewed-by: Stefan Wahren <stefan.wahren@i2se.com>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Acked-by: Rob Herring <robh@kernel.org>
---
Changes since v4:
- Change compatible to align downstream and other HW, reorder to suit

 Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml b/Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml
index e6485f7b046f..217c42874f41 100644
--- a/Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml
+++ b/Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml
@@ -16,6 +16,7 @@ properties:
 
   compatible:
     enum:
+      - brcm,2711-v3d
       - brcm,7268-v3d
       - brcm,7278-v3d
 
-- 
2.36.1

