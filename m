Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8C33D272D
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 18:00:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86F7F6EA89;
	Thu, 22 Jul 2021 16:00:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DBFC6EC83
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 14:05:58 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id f30so8750839lfj.1
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 07:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SOSmzvWDnV1n+6dhGf47+1g6nbwp/1OAUc7BCbVeW+M=;
 b=uKldJXrG1YhdQp0OJwXKaAdtdz1+SW0ptLgGX9sTRZX8Sccd77jAnqn5c7TY/O/4dj
 1f6/nxEPnLT3zzo+C+vsV/UBAmSVftTeE8EWG6FOnrxGptGkD2ny7L0NkQYUZ5supgLu
 Iyz760KN9bNqjC/CHfCnCQ7vRllmBive6StX7SYuYbmoWDOqz/1o7aUMNWIzK4cJJzT/
 +00Mx1EY5YNFpWodJVgY/gAqxraIZN4p2XLNMQlhvlCNui5k/wTORmP2BxcT+skVOTI8
 Ed4nDi8ECW6KfKDhDf2/nzz1vMLdc7icbhRCJr1vk21otzXNI2O4JUKvqClj0gKBOOoZ
 9ZFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SOSmzvWDnV1n+6dhGf47+1g6nbwp/1OAUc7BCbVeW+M=;
 b=D25YcRwE9ToAXOyGS6k3ur2J16OyOfVHRi2FgdVzpeAtueooYNHl8Kq2OU8txIyaFk
 +99QcEJfrS7hMcCoR0jiqbkmJ8oHHhpAPTFrn7ucguRPLaxYsa0iimiOAOkIH+unrPAS
 GV/zQ4O6MUuiiyhN2gJ63VCu40iAznUbF5DB1Xdu6s2ULqdceHLIqi1C1zbveurT90eJ
 /hUwT5/bjDpLuA6/D6u3PCJGG8XHQ4UBPKQk0hqdMg1IN68ObOwNeYFb2zwidtDQ+I4f
 /oOPcp/lNOOC2dGz9tnKxqizansl90eKQNf4cOt8ZodqbwYBGA5QRGZjYMxUib5N2XLf
 Nkpw==
X-Gm-Message-State: AOAM532+VgDFeRwALlDqhHt171P3W9gIpj/XpY1X1I9dy0qEPnHLdBDL
 aPJhLIHU0QfsgN7Meff/C9Q=
X-Google-Smtp-Source: ABdhPJwYxSivOMyygZ3RW7OhMkKi4qlqKdtB5TAH5fJ63oXm1RRjDOeZdx4rR4FHk7vZn0xYJL8VzA==
X-Received: by 2002:a19:7514:: with SMTP id y20mr29224931lfe.623.1626962756497; 
 Thu, 22 Jul 2021 07:05:56 -0700 (PDT)
Received: from akaWolf-PC.. ([194.79.5.201])
 by smtp.gmail.com with ESMTPSA id p8sm190584lfu.163.2021.07.22.07.05.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 07:05:55 -0700 (PDT)
From: Artjom Vejsel <akawolf0@gmail.com>
To: 
Subject: [PATCH 1/3] dt-bindings: Add QiShenglong vendor prefix
Date: Thu, 22 Jul 2021 17:04:30 +0300
Message-Id: <20210722140432.1426173-2-akawolf0@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210722140432.1426173-1-akawolf0@gmail.com>
References: <20210722140432.1426173-1-akawolf0@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 22 Jul 2021 16:00:25 +0000
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
index b868cefc7c55..52996cbf2cc4 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -924,6 +924,8 @@ patternProperties:
     description: Qi Hardware
   "^qihua,.*":
     description: Chengdu Kaixuan Information Technology Co., Ltd.
+  "^qishenglong,.*":
+    description: Shenzhen QiShenglong Industrialist Co., Ltd.
   "^qiaodian,.*":
     description: QiaoDian XianShi Corporation
   "^qnap,.*":
-- 
2.32.0

