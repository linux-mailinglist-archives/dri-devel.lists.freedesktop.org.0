Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E433D505D
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jul 2021 00:16:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47F366E4C7;
	Sun, 25 Jul 2021 22:16:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEF3A6E4C7
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jul 2021 22:16:03 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id g13so11945737lfj.12
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jul 2021 15:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LwrLY/6UukkpivGPZA28M5o/zTQMQpj6un1tsCBTWcs=;
 b=V3akwj4JaWTOlALuu6o+qvsykLX8W+xkTHT08R73aTZgGlYEZFblm2f/SAhAnB4igE
 CWJVxJhGfVaBWfd7DQHWjO7U/aTrVIUAX2x7ATEC6BKGH5l8meRqDZmdcxMO9lOP/r1l
 doJVIVLybCaSdTLLvXA6huR2MobBuyJsauYHBymEvWdyiQ5kyfQjb8sPeufBUZMuFvAz
 V75DHA4kmjNj9oVbq3goeXkzxD/OgWDoyqMRXwaHe8Vg2pAyYWZYwK9O2eLpmdq4QipN
 4IqH+ikLmruX17m/Q2/GZoLUTIEn30Z2+43SJNyRJkFeohby780zTCyjEv9Jt5To8UoQ
 jzIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LwrLY/6UukkpivGPZA28M5o/zTQMQpj6un1tsCBTWcs=;
 b=ZSqWmEfdMx0ZVctoChwZ8S2MjUVIHnf/2WPKTveX0VfSFAZexTm8MKdNpIbLonN8hg
 oRk2wKDRX67robvlggWCoqcl9LTreExkzMiuzFp+H7DB42/cRPmm8wPw0x1na07fLfDZ
 TFbgrEkWFO/KOgo2qndQBN3erbuWraCImXuwWQ28flRAaXsPUxqV09BW8u4tgFZA4YiN
 bt2exBUitc3dL9o2HaFyYiTwlq9C/AfaGSqKZaUlaeuJsb2bo9Sm6CrmrJewPWD7Vsgo
 6PMDTmIbB5n1Zmz90/V7rXzXCwiEZw2W2oIuRDC1/y7P/bgqm2mBA/HFw25k6rdjqAiS
 g/Qw==
X-Gm-Message-State: AOAM533smNN4oZz9S25RsXWN3bfFenhdjckPvHBSUXdrY1w4z+X+rOF9
 aXJsxdB1I2oax8xYOxHWTEw=
X-Google-Smtp-Source: ABdhPJw4Re5hg0FJF/1hnt1A4wQi5aU9/lOS1ItTVVZ5s50rQF+jLxU65cE8fM75iWi9OwUs2bHM8w==
X-Received: by 2002:a05:6512:3eb:: with SMTP id
 n11mr10588723lfq.418.1627251362167; 
 Sun, 25 Jul 2021 15:16:02 -0700 (PDT)
Received: from akaWolf-PC.. ([194.79.5.201])
 by smtp.gmail.com with ESMTPSA id z12sm2862647lfu.53.2021.07.25.15.15.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jul 2021 15:16:01 -0700 (PDT)
From: Artjom Vejsel <akawolf0@gmail.com>
To: 
Subject: [PATCH v3 1/3] dt-bindings: Add QiShenglong vendor prefix
Date: Mon, 26 Jul 2021 01:15:25 +0300
Message-Id: <20210725221527.1771892-2-akawolf0@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210725221527.1771892-1-akawolf0@gmail.com>
References: <20210725221527.1771892-1-akawolf0@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, paul@crapouillou.net, robh+dt@kernel.org,
 thierry.reding@gmail.com, akawolf0@gmail.com, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add vendor prefix for Shenzhen QiShenglong Industrialist Co., Ltd.
QiShenglong is a Chinese manufacturer of handheld gaming consoles, most of
which run (very old) versions of Linux.
QiShenglong is known as Hamy.

Signed-off-by: Artjom Vejsel <akawolf0@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index b868cefc7c55..1d45a2d7a7bb 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -926,6 +926,8 @@ patternProperties:
     description: Chengdu Kaixuan Information Technology Co., Ltd.
   "^qiaodian,.*":
     description: QiaoDian XianShi Corporation
+  "^qishenglong,.*":
+    description: Shenzhen QiShenglong Industrialist Co., Ltd.
   "^qnap,.*":
     description: QNAP Systems, Inc.
   "^radxa,.*":
-- 
2.32.0

