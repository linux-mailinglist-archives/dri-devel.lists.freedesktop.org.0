Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C7BC498568
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 17:55:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A77EA10E344;
	Mon, 24 Jan 2022 16:55:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B74C310E247
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 16:55:34 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id p203so10043800oih.10
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 08:55:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rU7StC0vWHC6lDgyRB9OrYSRZCxJxqMjaJg6rAe9Yu8=;
 b=SbKgG2c+STKyf1fu/56122rac9jR+PH+pXSU2ntKiPGdvRHBeEoOjbzAfddbFcmBlP
 oTC0UABtn1j98kdYSHU2MDgsDcEl60C03yJXzsTg3hh5EYZWgkqlsL3SgQ//bnq7uQa4
 l7zMsnwhfTEdG/M2itjyr3MQq3abiNDcKWNvU3yGUzcz6m6zesSkhp7efE/lmBSs4eU1
 ZMHqwmhDCFQPu5JIZQhIa9r30dN/rsOAkb4JQAN2lSe9g23GsSrqG/P6+TRd05JqUNyR
 wqMoI0laFObT0hU/+Qv67i5YasWkAed2xLGwUopkgpw0y305QpW0IOPj9JKIkboXu3+N
 fktA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rU7StC0vWHC6lDgyRB9OrYSRZCxJxqMjaJg6rAe9Yu8=;
 b=TfSwq7NJKNVHD0iDQ++PTZXhLAs8U0XOKrO7AIwHv7XZIrZE8S4rl2OIA3AyMJxbgK
 0r2eDuewhtOgZQa/K6dWYCYi0X0dE2NDWvCK42lsHPCI6Qk/VX9SljBio8CdtIpLUY0i
 bGCmDzdxGhleu3YMJssRwKJUcoQe/Qqeu3VmdhN0P98mENnWY7m5X48XeoVKhbvWqeeC
 3/iy4IitH7dkdr6q9bZdp8pjzyi2b8a78rkzRgmAeUky0AbbHWp3qXksMbCdRk7ECuTZ
 dL2/sWjItpeR8vNh9ApwzIVp/mmoO+xM3Ny6amLi72AoLF9JjdQOOEQN07G9A8tVFLJT
 SUYQ==
X-Gm-Message-State: AOAM530ETmuifuSKP4ptn/UakUxUqth5JRTnC0HgYl5e2qjzWoyOlwNq
 74Pkf5gfcPZC6uAXdQXEUk3bgkkcMAU=
X-Google-Smtp-Source: ABdhPJwCzE3kihzj0hMg6jGxBCbVT5pJNxTin21Ous/7hNUaGdinQd3cdZsTbygXQ25Z9VgKxNYnCg==
X-Received: by 2002:aca:c104:: with SMTP id r4mr2130359oif.93.1643043333646;
 Mon, 24 Jan 2022 08:55:33 -0800 (PST)
Received: from wintermute.localdomain (cpe-76-183-134-35.tx.res.rr.com.
 [76.183.134.35])
 by smtp.gmail.com with ESMTPSA id v22sm4418370oot.10.2022.01.24.08.55.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 08:55:33 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/6 v2] dt-bindings: vendor-prefixes: Add Geekworm
Date: Mon, 24 Jan 2022 10:55:21 -0600
Message-Id: <20220124165526.1104-2-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220124165526.1104-1-macroalpha82@gmail.com>
References: <20220124165526.1104-1-macroalpha82@gmail.com>
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
Cc: devicetree@vger.kernel.org, Chris Morgan <macromorgan@hotmail.com>,
 emma@anholt.net, airlied@linux.ie, robh+dt@kernel.org,
 thierry.reding@gmail.com, mchehab@kernel.org, sam@ravnborg.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

Add vendor prefix for Geekworm (https://geekworm.com).

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 294093d45..c0c7627c6 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -455,6 +455,8 @@ patternProperties:
     description: General Electric Company
   "^geekbuying,.*":
     description: GeekBuying
+  "^geekworm,.*":
+    description: Geekworm
   "^gef,.*":
     description: GE Fanuc Intelligent Platforms Embedded Systems, Inc.
   "^GEFanuc,.*":
-- 
2.25.1

