Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B6E63F440
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 16:39:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3E0E10E625;
	Thu,  1 Dec 2022 15:39:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A55D10E624;
 Thu,  1 Dec 2022 15:39:11 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 h4-20020a1c2104000000b003d0760654d3so2783769wmh.4; 
 Thu, 01 Dec 2022 07:39:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mOkjJ49YydlvCDY0afffT99zYYKtrxdz8Sf40U74Enc=;
 b=j9oLbiNRaXpnHIje9VKE4nLcb7+6czmhJN4g3RnHkAh16pmeBwJSme6IimLjBggE8o
 T5jUcdoPk4+n5jmxiJ6cxIpXqJk8Ia7iyQbT0WH15JN/LI/D58gYwuxKm+ohgRCpc4A4
 gHshTm+tITLuYPqv5LmhUrn7bd7xfx7bS2CJqY/G+rqfgdQgCSzB8eVMXBzffAJq0uVi
 DPUqgUcVvzNdZ8fnHhRqBcqqWqcw6uA18xg9Ci55dpZFTdOMhz8kBmdrsDqRbtipxuqI
 y4G11VZAlqJQ6DOIAhCNXtsmfNGJU7XTy37OfpZfWnOQOqpelBchjxQAVjnPc8hbd0k5
 RgRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mOkjJ49YydlvCDY0afffT99zYYKtrxdz8Sf40U74Enc=;
 b=i3MSpL55SIp7XmcbYfGy1ua4Cm5qhG33IdYqKT9kjct02E8G1buw3dLKCu4AmGvmQU
 JRASe80K7+793JplFfRfAvauRy9v4lDtF3EK9PkdDEibLlfRbZcdNuWBHEPxTpSTKIJ+
 EobspDAerWThYgGF9QbQ2vBWIFY0oXDCkommLXZ3Gz7ox7z9jP80asYamRxjFRLIaehz
 iVfM1yuOv5MNA+MnccRRHNjGKWta+dYt7HM5bBfEqze1U9FQ6IFSbZmqFJE9sTRQnIVY
 K+s/2Hj90zMcEL9JNCxzRyeSDTYjWbTU1Li9nGvff6uY5IWf03rPUvc3GQj5ygrLKAMQ
 67gA==
X-Gm-Message-State: ANoB5pkv1SalJQJtarIGYmiDUKlVx9SXvWZCnvJsbS62PN/RRYOgXfau
 HLTilEPuVZibCg/gOkhBGDw=
X-Google-Smtp-Source: AA0mqf4yPSTXLm0ri7Bg8PiPcSSS0dFxtztOpvXhzUoK76TcINL8V/D9Zo+enxFgpf63HDNxnZhGcg==
X-Received: by 2002:a05:600c:1d23:b0:3d0:8193:c1c with SMTP id
 l35-20020a05600c1d2300b003d081930c1cmr1156702wms.143.1669909149638; 
 Thu, 01 Dec 2022 07:39:09 -0800 (PST)
Received: from wlan-cl-kit-cs-172-17-20-201.scc.kit.edu
 ([2a00:1398:9:fb03:6341:588f:5b6d:9173])
 by smtp.gmail.com with ESMTPSA id
 fn7-20020a05600c688700b003c6b70a4d69sm5523597wmb.42.2022.12.01.07.39.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Dec 2022 07:39:09 -0800 (PST)
From: Peter Maucher <bellosilicio@gmail.com>
To: alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] drm/amdgpu: add GART and GTT to glossary
Date: Thu,  1 Dec 2022 16:38:22 +0100
Message-Id: <20221201153820.257570-3-bellosilicio@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221201153820.257570-1-bellosilicio@gmail.com>
References: <20221201153820.257570-1-bellosilicio@gmail.com>
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
Cc: Peter Maucher <bellosilicio@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

GART and GTT are two abbreviations that should be mentioned in the
glossary.

Signed-off-by: Peter Maucher <bellosilicio@gmail.com>
---
 Documentation/gpu/amdgpu/amdgpu-glossary.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/gpu/amdgpu/amdgpu-glossary.rst b/Documentation/gpu/amdgpu/amdgpu-glossary.rst
index 326896e9800d..d86bea7926dc 100644
--- a/Documentation/gpu/amdgpu/amdgpu-glossary.rst
+++ b/Documentation/gpu/amdgpu/amdgpu-glossary.rst
@@ -30,6 +30,12 @@ we have a dedicated glossary for Display Core at
     EOP
       End Of Pipe/Pipeline
 
+    GART
+      Graphics Aperture Table
+
+    GTT
+      Graphics Translation Table, mostly synonymous to GART
+
     GC
       Graphics and Compute
 
-- 
2.38.1

