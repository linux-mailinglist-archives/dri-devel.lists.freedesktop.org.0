Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA255B01DA8
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 15:35:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A074010EA58;
	Fri, 11 Jul 2025 13:35:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="R3vVtcCX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1601310E252
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 03:58:40 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-32b7113ed6bso14568011fa.1
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jul 2025 20:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752206318; x=1752811118; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aAyGyV/ROok4pI9Bzo4icqARtJ1bPtyu3l7jtXPJYx0=;
 b=R3vVtcCXYXAmpDJ+6pN9StVu3dh+iKxH0opIScMJ1MOQEz34zZosME+V1SRmYqpo8o
 bydFFmmljEdOLTawsHEUhvQW9ggkza2s0s8ajtWZZ3Pqnz/CZoc60iNOK1J/wEc8w/Hx
 WOTOvPbzh30MGcxe/zBNdzxWpAzi9O9LXyuSVLNYYKzsKjYIG8STYsnh3yUq+eLt90/0
 d5e0rsMPPc1ovsG+DWiJu2kzMatBmHO1GtgrPVrXSZZ1QduhtVw1SlQ92CKxFseg28IQ
 /sj/AFClse6oKOG5FkcFb6VQxZKd2UTc0yfmnSWUVBpfsM6wpj80t2HGCfarR7cbqTp9
 51mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752206318; x=1752811118;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aAyGyV/ROok4pI9Bzo4icqARtJ1bPtyu3l7jtXPJYx0=;
 b=sP0R9cFDJn21tIVU8+T0uR1GNXzvS/S9boEu5jFoVWn/rXkindkZAQ4MF1FP162D//
 R0KJc2/AVu/zlMKUrTdFRvhW44NWZxbbtMB2OkixZeMDnoyxYBqUBMNgl789YVgD5vTF
 /eaPEcW0FpJ7N94Vn7/do7I2m6dzhw0wtV7EWYZnUYE0ye0CZTbFQ/CCAH54RsYoh9sZ
 2NvBKAOwvJl3pm5FbVWEFWJtax/xF4IJxIk49Ld7gqmy4S0e000YdQyg/izXAqrVG2sj
 NSmHDmJlwFaBJ6RZVHF4HisM1u7sP1xnJ4e8ZQmT503wBbZv364nB9cnEkUQBtGC0fFR
 lgBw==
X-Gm-Message-State: AOJu0YwTcuuH7Yt1zNl+Owhzyxm1YRRVH92nM+Gup5LqG9cgN4yD06Vh
 XgS+zWyA8SopLHM4qGizTviovoMRu9Byd/WYx1DqshuokHtKhh5nlekD
X-Gm-Gg: ASbGncvTgIida4utGrWPxYZvNNRjep9Dh8NuSh7HF/ssWLVdcj29sLcdGdha3gos0bE
 iVoeY7FKj51Lh/qwtBdvDLtZbiIuwfu+8oO6nvvqrALLniBcrEg/FImzfB94WrxkpKRz285qyZB
 oj0UeGywCfM+QcqUMu7YrgphQ+yl1R9a1YFFT04A+n+Psa2Yx68nCpDl+OeQ0hX0Dg4DxKoY2CD
 JNwk+IKQVuLf93WqqhmIE6S//kSZbjDiTegdXd3OYCOhRp3AG1W9hB6S+hfzWvkg5jkmPqnXEWe
 5fmz2OUAyt+olRrmGZWY87fVqVmChQqTt3cFx2b0JXn+TwtReK2q5vtSYrAVRKi3tbXl/58abFm
 HJuSgmJa0NCM=
X-Google-Smtp-Source: AGHT+IFtt4gy09VuR+9hOE1KziZmPtb3mGCWJrKa92kTcM9xUQYQNVoHoopk6977gNAOL2psPZEM7g==
X-Received: by 2002:a2e:a594:0:b0:32b:7284:7b with SMTP id
 38308e7fff4ca-3305329b33emr5078191fa.6.1752206318153; 
 Thu, 10 Jul 2025 20:58:38 -0700 (PDT)
Received: from junAIR ([212.192.12.80]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-32fa2943d46sm4971191fa.40.2025.07.10.20.58.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jul 2025 20:58:37 -0700 (PDT)
From: iuncuim <iuncuim@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.or>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
Subject: [PATCH v2 1/3] dt-bindings: gpu: mali-bifrost: Add Allwinner A523
 compatible
Date: Fri, 11 Jul 2025 11:57:27 +0800
Message-ID: <20250711035730.17507-2-iuncuim@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250711035730.17507-1-iuncuim@gmail.com>
References: <20250711035730.17507-1-iuncuim@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 11 Jul 2025 13:35:21 +0000
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

From: Mikhail Kalashnikov <iuncuim@gmail.com>

Add a compatible for the Allwinner A523 SoC, with an integrated
ARM Mali G57 MC1 (Valhall-JM) GPU.

Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
---
 Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
index b8d659d27..aa19f8819 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
@@ -40,6 +40,7 @@ properties:
           - const: arm,mali-valhall-jm # Mali Valhall GPU model/revision is fully discoverable
       - items:
           - enum:
+              - allwinner,sun55i-a523-mali
               - mediatek,mt8188-mali
               - mediatek,mt8192-mali
           - const: arm,mali-valhall-jm # Mali Valhall GPU model/revision is fully discoverable
-- 
2.50.0

