Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F74CAD2A5E
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 01:19:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22C4E10E206;
	Mon,  9 Jun 2025 23:19:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XyhRWX26";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 101DF10E206
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jun 2025 23:19:11 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-3a4fb9c2436so2530078f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jun 2025 16:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749511149; x=1750115949; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9vSVjvUP5pzFqCNMAgN8V1P/hYKkRfbNHW13r/UQoJM=;
 b=XyhRWX26GdcSHImlomAC1kK7suY5TtTkJ+J2VrQnAo4JrMmaBqD6iYOjNVZU6HZ625
 yUSTi37tTdgrZs+gh45ioqS5GuCt932YNZKqUxAATYJecDbhq3XOcGYI4uOVrWqI+1Fn
 4DYsLfOkeOOm0Cf5ZYZaaLUHGCi58l1LUCdREgsEaAVrf2+gWv6S1teglGV9hqHfESZt
 2qzqk2QrHPqkKuIUrr5gFwvrz3geVxc0hCLpq+s1wsx1/P9Evh0l1F7ENXfnMTZ2sQWd
 xcCkKZwPMOeppt6FJWyc1XXviMtn98Z3HUQe8uEHJOxG0eQ2ojj20zOGckRgUzcxaNvJ
 UCHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749511149; x=1750115949;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9vSVjvUP5pzFqCNMAgN8V1P/hYKkRfbNHW13r/UQoJM=;
 b=PKx8zL3SUPqsVl5MlzRxkOXhlH0k6VoMIogPHouXNPGqijveJgUPBrzHPfgTKQZul6
 QzGcYfoFnBYmaWboR44VOSr61xphD2V8OnwtbrpiaZ7cHNA4ReGJLKl4OI7g4rSgEWE5
 e1NymcR15Jp+yeMD+qc4NLpzIvG7PcAcvezMNHNYZtoF6eHiuMbq1aN9dn8iniFtXOpi
 0/CQATm9iVfgVOMfTMdGft5xeXFp63jBBMD5/Gg7kvyvC/GOIOoH7vhoGiI8r+TdfifP
 Y2cdA6FUySwHMzvlyN5/CXNkU3tb3hQNsljyqWrUrWoqOtlYcm2hvM1jFHXSBHmvY8xp
 vBqA==
X-Gm-Message-State: AOJu0YzbEaMCdYu0N+eKg9SZzEmWrGFvcsnDEJQi50Dtu4ZdHbR4oRbp
 mSa0ux4iGUi7JLAJ08s8LLBtUsb6NV+hmE02LPszUOv/h/Rl+fC7ubfX
X-Gm-Gg: ASbGncsECKDRfMSNMMaESB1z3bYHJX7wFGa5ai0+3nLJzyBon+/TMN15dgLcsFojDkq
 wpYPnhX2Wd1gNv6ye0ckZ5i1AqB44+4Vcua7xzT5ROOtu1iuCXRbk/hTBKIq+Rr6Sb95ZkyWnLk
 B+4T9QtCd2KSkRFSiX/Sn6XCXVjVbM5ceqvN1LA6w2Ol/uDTiredMX5qJLpp+WW5xd7TGCcg9WE
 IFiTiiOkkcdj0Ip+4Yv+dgTlnhK311x4HtjYTaaydjGhmwqiArrUuve9E8d/55UbCey4yazI3Jw
 nu7AMxijabp/XX0QkPn74ZutvwFGvKd8czUhZnxNavXtiWx8oEJSWEYYzJozB7J2C/sA7eQba7c
 1hoqD9e08NbBNFcJM/FGA
X-Google-Smtp-Source: AGHT+IHR0S6UKeu38kBall8nzPHP5mE6KK0m4w1kvD2JToJoXXZea95MeWR/Gq7+9AsDTW1rcc9hvg==
X-Received: by 2002:a05:6000:2482:b0:3a5:2848:2e78 with SMTP id
 ffacd0b85a97d-3a53188e2f2mr11635785f8f.28.1749511149486; 
 Mon, 09 Jun 2025 16:19:09 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:3c26:913e:81d:9d46])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a53244f0cbsm10546543f8f.81.2025.06.09.16.19.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jun 2025 16:19:09 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Prabhakar <prabhakar.csengg@gmail.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] dt-bindings: display: renesas,
 rzg2l-du: Add support for RZ/V2N SoC
Date: Tue, 10 Jun 2025 00:19:05 +0100
Message-ID: <20250609231905.511904-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Document support for the DU IP found on the Renesas RZ/V2N (R9A09G056) SoC.
The DU IP is functionally identical to that on the RZ/V2H(P) SoC, so no
driver changes are needed. The existing `renesas,r9a09g057-du` compatible
will be used as a fallback for the RZ/V2N SoC.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../devicetree/bindings/display/renesas,rzg2l-du.yaml          | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
index 1e32d14b6edb..2cc66dcef870 100644
--- a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
+++ b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
@@ -25,6 +25,9 @@ properties:
           - enum:
               - renesas,r9a07g054-du    # RZ/V2L
           - const: renesas,r9a07g044-du # RZ/G2L fallback
+      - items:
+          - const: renesas,r9a09g056-du # RZ/V2N
+          - const: renesas,r9a09g057-du # RZ/V2H(P) fallback
 
   reg:
     maxItems: 1
-- 
2.49.0

