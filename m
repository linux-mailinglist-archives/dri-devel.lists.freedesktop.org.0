Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B5671A64A6
	for <lists+dri-devel@lfdr.de>; Mon, 13 Apr 2020 11:29:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D45EC89DD2;
	Mon, 13 Apr 2020 09:29:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D11C56E2DE
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Apr 2020 16:57:27 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id k11so4979292wrp.5
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Apr 2020 09:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XHtQD/meuXaYe8UaCWq5ou0S7rpgnlSgQuuCrxXrgqE=;
 b=RWrw26nqS4KT9PlkFPDn2JxIpRqcyPHhXMFaV2xV/LRA5u0k8ivXmdSjtFyCEqZfs/
 w6d951CQrL1mkIvQKsxH9o9MjSCclbzSWvG8mH72tmFcKpKfRqa3g1YP8QzUIoSPuWRl
 VfC7wxNrZMh142P0OaR5q4xJ3A8rcTAIzhZSXShlqTSlELXp0V+oV4zQjnrmXwL8gBp7
 8Iy1gSh8L065we/ErvRTUYKpFeXymglr0A96fJfQmniKcFkQnfRxAr6e07HealZfhgrm
 H0r7FiZGM1Np9CXQUXmq3rMU4WLM/x6xnx8oh3NXwpxvXewCfyiF5eM6LzfF1sZdS2hU
 IflA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XHtQD/meuXaYe8UaCWq5ou0S7rpgnlSgQuuCrxXrgqE=;
 b=mcYUJznJHdiRzUXzOfZZ6Dsk1h8rmoqhAqEZAC6VOjUS4mlQ5NG3UQLfohJyFWfvGd
 lhvj1O3sIG+duIqwzNKuuTCVd7OJaj4wNKJK0K8r1vI/n1aohQJ6SCh1EIwAg5o+DP/+
 qEzFFR0ITS8+2bdykBqOYCZkOBRsuDsuNFHy0LsI54w7ixT7LJ8+MdNCAbmZo56SndtM
 Zd+j4hEyYKN3oAXq6SDTtaxuVcWI+6K+EetjZiHjAC6AjV/16YqSAHT92Yh06sx82pjr
 IeeJbzWChRDEs/rgsh6lnpDI9F4pQ3RHwDVR3cpW3tjqHLFoA2d6R/xE3L7bYhRjVxpX
 hHRQ==
X-Gm-Message-State: AGi0PuaqNKQjAOkNbgUEidMNMm9p7ce4/MgK3lOnC6Qb92olhxCNeD9a
 MhkXReJgJ0C/b/lR041eUFhoTeg70RE=
X-Google-Smtp-Source: APiQypI831li2YGPKN/VZUe6xPsQn9Sks+evd0nSUfRQDu+keljhtZbYvFFAXX996GgtLV3jKygrbA==
X-Received: by 2002:adf:80af:: with SMTP id 44mr10792605wrl.241.1586624246453; 
 Sat, 11 Apr 2020 09:57:26 -0700 (PDT)
Received: from localhost.localdomain
 (p200300F13710ED00428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:3710:ed00:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id z11sm7781992wrv.58.2020.04.11.09.57.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Apr 2020 09:57:25 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: robh+dt@kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: [PATCH v5] dt-bindings: gpu: mali-utgard: Add the #cooling-cells
 property
Date: Sat, 11 Apr 2020 18:57:00 +0200
Message-Id: <20200411165700.1576314-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 13 Apr 2020 09:29:25 +0000
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, Qiang Yu <yuq825@gmail.com>,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The GPU can be one of the big heat sources on a SoC. Allow the
"#cooling-cells" property to be specified for ARM Mali Utgard GPUs so
the GPU clock speeds (and voltages) can be reduced to prevent a SoC from
overheating.

Reviewed-by: Qiang Yu <yuq825@gmail.com>
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
Changes since v4 at [0]:
- Added Qiang's Reviewed-by (many thanks)
- re-send because I missed the devicetree mailing list in v4


[0] https://patchwork.kernel.org/patch/11448013/


 Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml
index f5401cc8de4a..4869258daadb 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml
@@ -107,6 +107,9 @@ properties:
 
   operating-points-v2: true
 
+  "#cooling-cells":
+    const: 2
+
 required:
   - compatible
   - reg
@@ -164,6 +167,7 @@ examples:
       clocks = <&ccu 1>, <&ccu 2>;
       clock-names = "bus", "core";
       resets = <&ccu 1>;
+      #cooling-cells = <2>;
     };
 
 ...
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
