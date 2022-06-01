Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5106A53A36E
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 13:03:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18E8010E3B6;
	Wed,  1 Jun 2022 11:03:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DB6010E2B7
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 11:03:09 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id k16so1828065wrg.7
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jun 2022 04:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OnvXF5s5GrKznhV9RiSELRMKmTLaCDRSK8iW7WfFUKs=;
 b=OSFoRwjoVdXIYu1i8ASpaOgYErZK4abslLMXIg14B84wAwFiqo3ENN+jRsPEoJ1Qf/
 GLH1IRKGegXk5UyjI56HuSfaL8fRcHqT/tLQR1yQhZuowLnSOkMz+m8eE0ZA5sqDWtb5
 72JIkmAjAkMQi6RXRQ4ydVKsHV/drR+t1z08uKcTGSNK9e+Q3LHL7nfR3YS+YX7MnYoU
 1XSUr8cX+KOUatphzmZqQXYnoG59hGlt6Sw9mJXR1sCrOBxlJgPHlhiZp47XB0HZw7B2
 QW5VwJ5kA4c3fRYWaG4nPYTbuRxCppGSGBluTJcKleeWxLsfIZk4dYvaJDnj43LQsCfA
 L84Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OnvXF5s5GrKznhV9RiSELRMKmTLaCDRSK8iW7WfFUKs=;
 b=wLUU1lUhqX1RGbUiU5DTsOPoxdvu1rqMnaiV9N3jBix5YDXjExoDZsh10QgwlcGvch
 9K5Z53fr2nY3+7eIJ7pyOGN2AfIbJqKw8wPXoOV2GapwyS1/oId0MttR8o3lXRSau0vI
 5CpxLDZmdRYe9La7t4OORmZwSwi+dxMKpoBzQ0mzMxipYE/JVFJJk+btJoqR2wB2uPFO
 RXHp2LcBOY7kNFDo7wnLUoiDfO91IFaPsl8rKR/pOzzZMs84KTdNtg26oG391Z24XWf4
 UdRpBNecQA/sMCSwjC9YGUViIRSiO5CWmFa1LCDlDDA2aB7k6y/XDpU+DafLji6aisoO
 ULbg==
X-Gm-Message-State: AOAM532hL8HPCglYgIPOjbsAyt7+DypWWbBTNU62mDuHRPYDUZsiBn9v
 kJ5NSdesaG+fZI8UzjMND+A=
X-Google-Smtp-Source: ABdhPJymYOkcWRKsxtIvvy63ziXLPzoCyHa9UOjlimZGWPD9nRjpBYX2OWLNLJkY8aFJfPMxiZ4dzQ==
X-Received: by 2002:a5d:68c1:0:b0:210:2e3c:5b0d with SMTP id
 p1-20020a5d68c1000000b002102e3c5b0dmr15031597wrw.694.1654081387634; 
 Wed, 01 Jun 2022 04:03:07 -0700 (PDT)
Received: from morpheus.home.roving-it.com (82-132-215-116.dab.02.net.
 [82.132.215.116]) by smtp.googlemail.com with ESMTPSA id
 j14-20020a05600c190e00b00397381a7ae8sm6074559wmq.30.2022.06.01.04.03.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jun 2022 04:03:07 -0700 (PDT)
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
Subject: [PATCH v5 1/6] dt-bindings: gpu: v3d: Add BCM2711's compatible
Date: Wed,  1 Jun 2022 12:02:44 +0100
Message-Id: <20220601110249.569540-2-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220601110249.569540-1-pbrobinson@gmail.com>
References: <20220601110249.569540-1-pbrobinson@gmail.com>
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
---
Changes since v5:
- Change compatible to align downstream and othee HW, reorder to suit

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

