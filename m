Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C156397DE
	for <lists+dri-devel@lfdr.de>; Sat, 26 Nov 2022 20:00:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C978C10E160;
	Sat, 26 Nov 2022 19:00:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18B9910E786
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Nov 2022 18:00:28 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id e27so11851748ejc.12
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Nov 2022 10:00:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:to:content-language:subject:from
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c0rYuzAxULrdHur/y5TCtz7+5K0txbc/x5K5DhHN34Y=;
 b=QvfiLxFDaY2/VzJNbz4grXDD/kXNFb2Kp9TmkyQ3k8vQ9oC12xoPWKSWtyAmSfT2sd
 MpPaghYcxx5TYl0eyf0HTSjH5MdtKTtbgMtEiNU4ZXT862oU+OeBHnP+9d8wBKFfBTww
 CRfCkKSFCvcSUUZq8VfuspFCw960rz/lNTarRqfUclTcTRezPsYTLPMewexMcpJojce0
 nLwzxKlfLQ33YXslsWnsMmOK5+reF2LGlUeMEy3Gn85x7Xn/gn00KaRVl93E+doAXdTI
 eIGhVUj3aZuhmpJavba5lcGEZF4RFdCpXXqVKyiW/JWkJBw6upt2nA+hRPIneDPH41eJ
 F+Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:to:content-language:subject:from
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=c0rYuzAxULrdHur/y5TCtz7+5K0txbc/x5K5DhHN34Y=;
 b=xn7HeuOAy5N9PRQUs8J0PLkpyO5SIdvORQfOWJkbWaHEetTuD8oh6fPdOuhInzs3S8
 ClxYy/31vvIG5Q1HvB+cD0RaH2VF/NeAxJ0n74NTURP0UuIdLbEjTEl0f7UDs8c4jxXA
 JQQZxv7V4obnkbnE/6FJGNAXB4XCGOarOTAHXtpdSI0U2yQLAk4lhKj2OCyhyyhdwhxd
 /+7cRmD+c5/Jcf+LFG1J5qjn5vCh3xay5HDSpE81iNlDnDCDUkNmjYTy75zqFPgXQeVK
 8/SKqrlntF+TmI4PCIuJ1BkxuTIiRuM5epCx4Mii3Oiyy/M+lVjtguucfY/kyP82Woan
 TN/w==
X-Gm-Message-State: ANoB5pnPPxHl3gbXeyWs7ga2iJfB4iuufytGCVSmoPRk4X740gs1RsPb
 LBc1IPBRLshTwxdOv1aAf2w=
X-Google-Smtp-Source: AA0mqf503dntU4cQY4CFUWoBQKXWGaLfG8CKJ+p/PwYiVfOz/wKl3CmYMbwFAXtWZjDhYTUXSGxmkg==
X-Received: by 2002:a17:906:be9:b0:78d:3e11:1036 with SMTP id
 z9-20020a1709060be900b0078d3e111036mr33905298ejg.76.1669399226664; 
 Fri, 25 Nov 2022 10:00:26 -0800 (PST)
Received: from [192.168.178.2]
 (dslb-092-072-004-196.092.072.pools.vodafone-ip.de. [92.72.4.196])
 by smtp.gmail.com with ESMTPSA id
 f26-20020a17090631da00b0077909095acasm1810208ejf.143.2022.11.25.10.00.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Nov 2022 10:00:26 -0800 (PST)
Message-ID: <29019f53-93d9-04de-7f3d-622069e6cc1e@gmail.com>
Date: Fri, 25 Nov 2022 19:00:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
From: =?UTF-8?Q?Otto_Pfl=c3=bcger?= <affenull2345@gmail.com>
Subject: [PATCH 3/4] dt-bindings: display: panel: mipi-dbi-spi: Add missing
 power-supply
Content-Language: en-US
To: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 26 Nov 2022 19:00:23 +0000
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

The power-supply property is currently only mentioned in the
description, but not listed in the properties section as it should be.
Add it there.

Signed-off-by: Otto Pflüger <affenull2345@gmail.com>
---
  .../devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml  | 3 +++
  1 file changed, 3 insertions(+)

diff --git 
a/Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml 
b/Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml
index c2df8d28aaf5..d55bf12ecead 100644
--- 
a/Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml
+++ 
b/Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml
@@ -80,6 +80,9 @@ properties:
        Controller data/command selection (D/CX) in 4-line SPI mode.
        If not set, the controller is in 3-line SPI mode.

+  power-supply:
+    description: Power supply for the display module (Vdd).
+
  required:
    - compatible
    - reg
-- 
2.30.2
