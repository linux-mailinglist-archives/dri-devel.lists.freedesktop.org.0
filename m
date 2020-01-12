Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC6813880A
	for <lists+dri-devel@lfdr.de>; Sun, 12 Jan 2020 20:54:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B95DA6E045;
	Sun, 12 Jan 2020 19:54:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84E516E040;
 Sun, 12 Jan 2020 19:54:21 +0000 (UTC)
Received: by mail-pj1-x1044.google.com with SMTP id d5so3235569pjz.5;
 Sun, 12 Jan 2020 11:54:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WAKFhdZyK7HD40XoPNoJKm5mL4rsXQP3NWhrKWK0Lv8=;
 b=tkhxotQzMNS/84e+1iIUXadR/8wu+V1vzYgRh2Ofqgjn0UiFS8RtohOkSahN1x2BnB
 Ezl3uybClY4/hFIRyNf0sBbVgHCuNzXtXJe55THmPY/prpnj3t3FvDAae+TTzydQKw+F
 V0dlsni7YyKNdyiVKNvHvxbkh4VsGhEhktieKL5kqh5IxFfdFlFU8ZWJwRWwiFVNzhlv
 pdvzWv4Yk55XFad7bMaX0qHn93hXvzxCM4diIFhfXz7YwWngfwBrPt37tej9vLRyEygs
 TL0j5d9fmp2SzjsXIR61s9sUu3iuu5uFpEiDaUG2iBfBz99AhBekKJeHDFSi/270qNmo
 OdnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WAKFhdZyK7HD40XoPNoJKm5mL4rsXQP3NWhrKWK0Lv8=;
 b=sHHw/Xo7IkrOf+RkM4RI0XiBfelZ24jz4v4jQP0LR8zzRrRvNfoD7J7kYd2zFTZu5e
 HjOZdGGKw3toFxHi0Q8St/n2QkqAIB5WwU5VeIc20NUHwxQRKmHRHcNUJuwemjQA//Ri
 KmFRsL7Ba9WAfb3N4infNGz3ympIajPIlQpZmzGJ0hMkS5Ogk2ortsfhH4PysbeHae+w
 Ki6F1c3VVZ3mBrvFGvy6oRlDjCwY+VVEDjL7gIj5i3b9LAvUGHz3NzUmmXz5wFaSbOIF
 952y5XENN2t4OcdIN1Fn2xsFOLSmdJzLesyM9Umg0nOnjgT/ULu7aWIYVvNH8ZIBCsGd
 6QGQ==
X-Gm-Message-State: APjAAAVszreAAj5IXvsYhAUAyG2V5OLeP7wRBVxjBs5zZpL3IhSBC4hG
 yXLQs56nCbYZej//WdwfORncefgaHmY=
X-Google-Smtp-Source: APXvYqwTHGhndNZNsQKYW9nTAcuiFTj1LSY80cI+G9OpcouT/PjQ1Ca1QJlhYXRZmaQOV1+0IG/iHw==
X-Received: by 2002:a17:902:426:: with SMTP id
 35mr10638467ple.302.1578858860792; 
 Sun, 12 Jan 2020 11:54:20 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 17sm11391924pfv.142.2020.01.12.11.54.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Jan 2020 11:54:20 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 3/4] dt-bindings: drm/msm/gpu: Document firmware-name
Date: Sun, 12 Jan 2020 11:53:59 -0800
Message-Id: <20200112195405.1132288-4-robdclark@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200112195405.1132288-1-robdclark@gmail.com>
References: <20200112195405.1132288-1-robdclark@gmail.com>
MIME-Version: 1.0
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
Cc: Rob Clark <robdclark@chromium.org>, Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Sharat Masetty <smasetty@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>,
 Rob Herring <robh+dt@kernel.org>, freedreno@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

The firmware-name property in the zap node can be used to specify a
device specific zap firmware.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/gpu.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.txt b/Documentation/devicetree/bindings/display/msm/gpu.txt
index 3e6cd3f64a78..7edc298a15f2 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.txt
+++ b/Documentation/devicetree/bindings/display/msm/gpu.txt
@@ -33,6 +33,8 @@ Required properties:
 - zap-shader: For a5xx and a6xx devices this node contains a memory-region that
   points to reserved memory to store the zap shader that can be used to help
   bring the GPU out of secure mode.
+- firmware-name: optional property of the 'zap-shader' node, listing the
+  relative path of the device specific zap firmware.
 
 Example 3xx/4xx/a5xx:
 
@@ -85,6 +87,7 @@ Example a6xx (with GMU):
 
 		zap-shader {
 			memory-region = <&zap_shader_region>;
+			firmware-name = "qcom/LENOVO/81JL/qcdxkmsuc850.mbn"
 		};
 	};
 };
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
