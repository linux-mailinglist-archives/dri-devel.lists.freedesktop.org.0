Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C9FB3DF8E6
	for <lists+dri-devel@lfdr.de>; Wed,  4 Aug 2021 02:24:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B64C6E981;
	Wed,  4 Aug 2021 00:24:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5355C6E981
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Aug 2021 00:24:07 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id f42so1457490lfv.7
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Aug 2021 17:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LwrLY/6UukkpivGPZA28M5o/zTQMQpj6un1tsCBTWcs=;
 b=GTNBf52OLnhvYLjsS6mwdexNtknfTjxS53LsMKJ0C6muLAFzoMkVs/szLlRRCxyW1X
 qPrTbfaFUy6XqdRlGPIs0i3FzJerK735eHUimkd1dnKkCxguOk31wKLupxXPOpNS+gqv
 FWeNfD6qEy91nuZiBWHDUG+NcUIpc8eEmdEVocl/DG7EshXfzeqEtRoEgbnog9R77igR
 Ge4q2gfuH113c/2sOMd7Wzwri71kPUoQFDWW4cRSd7rIZTFfCn/zqWw8LxsqpLudtbHV
 6MyrwI2iB8LwXdw6fIz/0uzdI0WeJKD6UC004pW01+T01EraSPEcq8MGRvK2rJeJ1hDF
 3Qmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LwrLY/6UukkpivGPZA28M5o/zTQMQpj6un1tsCBTWcs=;
 b=gZ9h8iVkg+Zq9bAUlOwAFfCQQTNigKec1ryyI0OpxaU+vQ6IxqnAQfrUdWybT+crkW
 se94RQJn8KYUDoDqqGWW+zFqt0M5gSbpfQMv2yVyGS6um9Cjzc2utwhBqL4OXai5fuAH
 LPzB84pQvUSYlTojO+QgnxQdmYm4yplvqYDwc45/JjKtvhsR4eWWccejNXSYOC40Hezj
 K6Cs9wO6kNq9fqY/3hS8wbRTK9o7NXYSMbMCN6d3gGZ/HtfXz3GhNHHH/R0DgRAMMvup
 yDdoKmrEtdoSZ/q/KaKWOJ6N5TPSOKr175mHK5KtwYyx8+nOGCmUWziVyVZBSaLv2I3F
 SrMg==
X-Gm-Message-State: AOAM533yK6YoinmKMXzHas0Qwh5O/UDEsS74JuRD4ga6v2PnXrrIUPqg
 bllVMYTMSAmY7rT4zZJjE0M=
X-Google-Smtp-Source: ABdhPJzEtU+tSz7TTxXibyiV9Pqjl9Ur7dpwIVuY8Yahr+tY/7Y5gyu42mE5AozJecRcssTsJsArUw==
X-Received: by 2002:a05:6512:15a3:: with SMTP id
 bp35mr12869844lfb.99.1628036645662; 
 Tue, 03 Aug 2021 17:24:05 -0700 (PDT)
Received: from akaWolf-PC.. (broadband-5-228-138-51.ip.moscow.rt.ru.
 [5.228.138.51])
 by smtp.gmail.com with ESMTPSA id t17sm40992ljk.102.2021.08.03.17.24.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 17:24:05 -0700 (PDT)
From: Artjom Vejsel <akawolf0@gmail.com>
To: 
Cc: thierry.reding@gmail.com, sam@ravnborg.org,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 paul@crapouillou.net, akawolf0@gmail.com
Subject: [PATCH v4 1/3] dt-bindings: Add QiShenglong vendor prefix
Date: Wed,  4 Aug 2021 03:23:51 +0300
Message-Id: <20210804002353.76385-2-akawolf0@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210804002353.76385-1-akawolf0@gmail.com>
References: <20210804002353.76385-1-akawolf0@gmail.com>
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

