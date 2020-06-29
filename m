Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E7E20DFAB
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jun 2020 23:55:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BD7D89E0D;
	Mon, 29 Jun 2020 21:55:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B6B589E0D
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jun 2020 21:55:14 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id j10so14080207qtq.11
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jun 2020 14:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=pxT9s3EqTCXsQUMXPgZ+Qokg9lpeo3j26jsBumMOCzU=;
 b=ePlik7Ay+GtphgAve5CAj2xfrx1QbFpyLuV9Kb/NolXB4GJ6mN4x6SRxTM05MGUGZY
 L4JZ2AaAOqXVSjnHzBhFG+eeT3JCYJC523zT6LjjUgSNeraRgXk9GqCqY/YXUxqy+m8B
 SvUnn6W46acMHTKbrVac5HEJsCyseTx8/oV4zMHcpF8MN3Si9Whw0hHem8MPQCmc+ZvM
 5bvmjwAMijkPprReMHxkI4EW3ylkqa2qHtGA+k9oxE65VsKYB05gqamw99Z6lY2FX+OT
 YfaZ7oV+3hYgj4pOtKqkmrWq9RxH7URle7h/3iPWsuTwL77xzRMq8i4a73VET+ZHF4dd
 O3Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=pxT9s3EqTCXsQUMXPgZ+Qokg9lpeo3j26jsBumMOCzU=;
 b=o8p5ENCHZjrDiW8T30TepaySBgCGQaj8EE4TFGgubGA5RttGnKxMJtVleUqnox6wa7
 Xr4lpl86N/um3lGxBt9c2X1GqQDVGlARJ+Rxu0HU4tXd/oep5TOvCf76nKgVeIX3/vh7
 mZ7wdA3Py7lPWigvNtcnhaulFK6imAuxbTvFC5biKLgDDlCw+Vqfdsn5ie9xl1/zRN/u
 lvyx0flygspGq4zzvsU18RtV4UcjQWKwkGbt/7TJByZ3xSSMJ1hb7OVelXxaS5DGUM26
 85X7Vx1lhOKorgCNGHADTdjCkUOkk+aWszwSI59two9mYtylR+Ig+gIxnyRcfDnUN+sA
 Ketg==
X-Gm-Message-State: AOAM530LsBg3FvjC3efeRjLn+gY0W3N69rXcYSBTai23Q3fjlor30PL5
 QwCC6T+qcdmOz5V3N9BcM6w=
X-Google-Smtp-Source: ABdhPJxIHZpJNY5deu/0qCP2zBVuz+QM1abOEiGajD0jG0PAcaTa16luYlmNk9g12tIeL52RqwDZHg==
X-Received: by 2002:aed:2c23:: with SMTP id f32mr18080683qtd.164.1593467713391; 
 Mon, 29 Jun 2020 14:55:13 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:482:92b:9524:444f:ca0e:d637])
 by smtp.gmail.com with ESMTPSA id
 d19sm1185983qko.114.2020.06.29.14.55.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2020 14:55:12 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: sam@ravnborg.org
Subject: [PATCH] dt-bindings: display: arm: versatile: Pass the sysreg unit
 name
Date: Mon, 29 Jun 2020 18:55:00 -0300
Message-Id: <20200629215500.18037-1-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
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
Cc: devicetree@vger.kernel.org, robh+dt@kernel.org,
 dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Pass the sysreg unit name to fix the following warning seen with
'make dt_binding_check':

Warning (unit_address_vs_reg): /example-0/sysreg: node has a reg or ranges property, but no unit name

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 .../bindings/display/panel/arm,versatile-tft-panel.yaml         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/panel/arm,versatile-tft-panel.yaml b/Documentation/devicetree/bindings/display/panel/arm,versatile-tft-panel.yaml
index 41fd5713c156..be69e0cc50fc 100644
--- a/Documentation/devicetree/bindings/display/panel/arm,versatile-tft-panel.yaml
+++ b/Documentation/devicetree/bindings/display/panel/arm,versatile-tft-panel.yaml
@@ -33,7 +33,7 @@ additionalProperties: false
 
 examples:
   - |
-    sysreg {
+    sysreg@0 {
         compatible = "arm,versatile-sysreg", "syscon", "simple-mfd";
         reg = <0x00000 0x1000>;
 
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
