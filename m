Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6573F1F8FCA
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jun 2020 09:28:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C9AB6E279;
	Mon, 15 Jun 2020 07:27:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02E686E15E
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Jun 2020 14:06:55 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id t7so4908445plr.0
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Jun 2020 07:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=uSoq7dCkhb9mg6g/FHh6ciPwhzSs4StAhWsPV10NcgA=;
 b=MWEhjEMlIWaRzZOFGHKl5DpDcy/ta1NJS5teLU9l2r6JRj1OuweO5LwNEadZ0XT3I8
 iN1ILO8lx70Xh4JGH9lLePEiDKIXr6xt2OHEnWcRcc2+g7jxE1x3omzKgNBOj7M1q2yW
 Yzi2C8m/1XvXMZrOQnShhvBFbt7ggYFH6/B820Js1usox2I9GRQDVtt95jL8MejBWxVk
 9bIfJCBJo2KVxAG2NvmD13hPM4HmWwhAxIp4WHppltLxtFJAHhiaN77/slgKVAip/StG
 gxfyyuLRpNtSq2uBCjbWNOY4hfwJs/lO1rmRNOPGX+orQ0ZEl85R+R/V2EQfnSq+e9f1
 nMlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=uSoq7dCkhb9mg6g/FHh6ciPwhzSs4StAhWsPV10NcgA=;
 b=IMZmuJYLDTFdOI3ueGw7W3GA/cDWfFiLRAZ8JIDUjVpuWzOwMFw9iCV10akFieFEtV
 xPWyC8HWlxZE5lBKQq0sh4X4l43Hq9tAKO/YvNW3neghom3N5pAYT8Ip3Ot/cdEOkMOx
 SklAukKJeW3GUYRxFvnIllkYVUNNuq9GO7NTy5Plm9znrv1h2EKGVpw5+Obu20EhyX4B
 RVlbhNfffx0P7tUD9m1fIqW8/vVTIAiHos64bUeQ1csJNcMDea65QuyL7KeCVzhXCUwQ
 QKWbE1+W8WkqgLMUCV71Jp6n1tO+CqGjwXfNVFn6VSyK1quuvjSSkTuBV3OMX1i2Akoi
 hVyQ==
X-Gm-Message-State: AOAM533fJF3l1DDozUVYSU92bMnsfqFk1Xtu4XNvwrlcwo2NMiB2vyox
 oFhP2JjA8DV+gvWtNW9TKSI=
X-Google-Smtp-Source: ABdhPJx9BAJzdZyVkEBmSd3z/lTFGCtgPcOb2RpfJmJKzh5RMJXOCrPDQ/0KRZ79O8xEXlx+9HOODg==
X-Received: by 2002:a17:902:848d:: with SMTP id
 c13mr15357259plo.289.1592057215546; 
 Sat, 13 Jun 2020 07:06:55 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:d809:ffb0:2ceb:aeb8:b257:998d])
 by smtp.gmail.com with ESMTPSA id k12sm9054291pfk.219.2020.06.13.07.06.52
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 13 Jun 2020 07:06:55 -0700 (PDT)
From: Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 Noralf Tronnes <noralf@tronnes.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 1/3] dt-bindings: add vendor prefix for EastRising Technology
 Co., Ltd
Date: Sat, 13 Jun 2020 19:36:46 +0530
Message-Id: <10dbf4687981634c510462804b8af6bbcf113fbf.1592055494.git.kamlesh.gurudasani@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1592055494.git.kamlesh.gurudasani@gmail.com>
References: <cover.1592055494.git.kamlesh.gurudasani@gmail.com>
X-Mailman-Approved-At: Mon, 15 Jun 2020 07:27:17 +0000
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
Cc: devicetree@vger.kernel.org,
 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>, linux-usb@vger.kernel.org,
 dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add vendor prefix for display manufacturer company EastRising
Technology Co.,Ltd

[1]https://eastrising.en.ec21.com/

Signed-off-by: Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 7a39732..1b3d445 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -279,6 +279,8 @@ patternProperties:
     description: Dyna-Image
   "^ea,.*":
     description: Embedded Artists AB
+  "^eastrising,.*":
+    description: EastRising Technology Co.,Ltd
   "^ebs-systart,.*":
     description: EBS-SYSTART GmbH
   "^ebv,.*":
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
