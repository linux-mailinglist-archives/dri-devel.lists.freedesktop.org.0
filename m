Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F0813388C
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2020 02:39:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51B9B6E839;
	Wed,  8 Jan 2020 01:39:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EDE16E172;
 Wed,  8 Jan 2020 01:39:09 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id x185so768346pfc.5;
 Tue, 07 Jan 2020 17:39:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MpMZKtCVP5H19ia/f+a2yLDX2x/btP4p2EtO5S2C8R0=;
 b=PTNrkiZCCRqh7q4+WlA2u3gZ0CPVfLsmHAxEQSzh7KJpFGQvQCJEOjFoc361J5ReoM
 bDbAX+Gn8kdD9vGVY9Tz9bhALuubM4ufM+ZDpoWs4tKqRQGPKBGt3JLM5zD1RB1viNwx
 eMD4wP7x49zztbHZ1fry4eCEv6Xh0Vp9Kak+KoDFwt3TMzgjy6ya+gBPi1hepZNQcxyW
 P7j2t6GX7Qa8W6+ykndCqK8fwWfNpQU2KJJzFiwkpr6aqWuLKZW8j3zJkPBfWyDn9sff
 vsZ+WglNwLEYTRMpJFibloTFCBYrI23anV5Ar8R1GUouTTCpjYXvmEvx6xpbwz2A+TzT
 c+ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MpMZKtCVP5H19ia/f+a2yLDX2x/btP4p2EtO5S2C8R0=;
 b=CBoHTIoydXhPbcdT/VJnE54Anm+0u8vsvAdjhc9wIboP8HFgy6DBujGZUlqGSgoIyS
 /ReCd+K01bYY442GI8ZrVmkWtsuq/UmRAJ0oZeFL2bH+YRN6DH4XspQ9Is1WDRNjd1E8
 T95zZ2HdWnlLLnij66XKJ4j4ZH1ImbhJKWGIODTmmJwtP5UI4zD0XLrcifAIDeRRgm/i
 lPcw77F1uqmoLsa6dBK1ss595dG60kRU9WWYACwouUUNd71w/Ceg2Vr8kkhyJ9AVnZHk
 D8ac0dCEAoud8Jm5B9IBozvqcGi8jCj8u1D+05O47uxBb9YEE2ID9qiwlDW+S6QNv5xO
 RI0Q==
X-Gm-Message-State: APjAAAVIE4Mr5p9OlopljlxdothdWv+LvhIHSxiGKAL1Szsun/2gl6l9
 VOpbvoa5GAPMze9Ll1K0276/wVJVexc=
X-Google-Smtp-Source: APXvYqyAgXNYwKw4Qv5zmp1K0i3BPG+Boxcg0LDC+VNeJrhMhkOhY8m0e5wcPQOFGhwdWiZ4i4RQVg==
X-Received: by 2002:aa7:982d:: with SMTP id q13mr2477164pfl.152.1578447548749; 
 Tue, 07 Jan 2020 17:39:08 -0800 (PST)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id b42sm814584pjc.27.2020.01.07.17.39.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2020 17:39:08 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/3] dt-bindings: drm/msm/gpu: Document firmware-name
Date: Tue,  7 Jan 2020 17:38:43 -0800
Message-Id: <20200108013847.899170-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200108013847.899170-1-robdclark@gmail.com>
References: <20200108013847.899170-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Sharat Masetty <smasetty@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 freedreno@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

The firmware-name property in the zap node can be used to specify a
device specific zap firmware.

Signed-off-by: Rob Clark <robdclark@chromium.org>
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
