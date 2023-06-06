Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F4272455E
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 16:12:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38CBC10E355;
	Tue,  6 Jun 2023 14:12:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF1FB10E355
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jun 2023 14:12:11 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3094910b150so6294495f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Jun 2023 07:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686060730; x=1688652730;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d8VaZ858WGTztv9OyCXzp4p0rlgykAZTm6ZPkmQwQoQ=;
 b=PJrWvg+7yLEkuxQcPa7D4RMCK89IfL/gJOfMvRycs4Qgky0SQXPslBXwTvjsPBZjnZ
 OshfLDhQVzZAf0kKwXqlbn1pUminA8vv7Ih2l/0e8SLdlF7mOPfVbCc035BPY45V3MM2
 oORGsM+1XSWgZL/amlp2huSS+tR052kG7gSXdqbxcbDrcejFdgtOMXlQECOH0B+0vumB
 Sg8wqsI13m9aP0GxzXgsszWGhlyTLMDepYduYIYL2P906pS1I0YYNh3ebzNJoi1H/RfI
 5z1kCUc/VcapiVPMDMuJxpMJoOkK5duLjBEBM/Je7OBPAuf8SS4dDpJUobWTFcwRgXE+
 OSbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686060730; x=1688652730;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d8VaZ858WGTztv9OyCXzp4p0rlgykAZTm6ZPkmQwQoQ=;
 b=YLeiH+dl7nOGlXiiEJOa0S/MVnrM3AJKm9tgo9qXbpTzAqeHLLOvxMJ3HffLeL9Fo5
 RZS4B1FivHPlofRbb+Ge+cVo6tl5ncAK7NSuMMbFrBd51FxppJwjfkUyQAbYLnIXUbbx
 lJd1V9FyKSkTRWhjcVdfXjCWJDSsfI4tr1A3i3E/Y9sR/BONKfXlLpSJpf6QhOVk7PMf
 4RQWmMr5vnIrcByaoT7GJY3Uwkko3i5sR0sP+EG2E2DDjnijYe+TS3KQCyrAjUIYEj3h
 2aiMPhM4cJpGD70s1qkbHpUzqc957OjFQn7S0FfX/zHbLsFNTMeK2waS1H05zfR2wI+C
 BYGg==
X-Gm-Message-State: AC+VfDzgqi2ohPmpRCA1oTU1xFK8w+ThpQqGsFdvkowB7GzzZ9GzmWX3
 vnSfUSq/NO/SyokDy8Hn7Fg=
X-Google-Smtp-Source: ACHHUZ7kXhUfSKsOLk232B5A4piHFS4OhzgcPjlrkjl50WY8ohBAQ+PjbqGx4YX4kqE22/mxxJVfGA==
X-Received: by 2002:a5d:4d45:0:b0:30a:e5ba:170d with SMTP id
 a5-20020a5d4d45000000b0030ae5ba170dmr2082349wru.32.1686060729450; 
 Tue, 06 Jun 2023 07:12:09 -0700 (PDT)
Received: from fedora.. ([212.15.177.3]) by smtp.gmail.com with ESMTPSA id
 g7-20020a5d5407000000b0030903371ef9sm12694315wrv.22.2023.06.06.07.11.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jun 2023 07:11:54 -0700 (PDT)
From: Paulo Pavacic <pavacic.p@gmail.com>
To: neil.armstrong@linaro.org, sam@ravnborg.org, airlied@gmail.com,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org
Subject: [PATCH v3 1/3] dt-bindings: add fannal vendor prefix
Date: Tue,  6 Jun 2023 16:07:55 +0200
Message-Id: <20230606140757.818705-2-pavacic.p@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230606140757.818705-1-pavacic.p@gmail.com>
References: <20230606140757.818705-1-pavacic.p@gmail.com>
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
 dri-devel@lists.freedesktop.org, Paulo Pavacic <pavacic.p@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fannal is a one-stop-solution provider for touch displays in industrial
application, committed to delivering a variety of professional high-quality
products and technical services globally.

Website: www.fannal.com

Signed-off-by: Paulo Pavacic <pavacic.p@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 82d39ab0231b..f962750f630a 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -462,6 +462,8 @@ patternProperties:
     description: Facebook
   "^fairphone,.*":
     description: Fairphone B.V.
+  "^fannal,.*":
+    description: Fannal Electronics Co., Ltd
   "^faraday,.*":
     description: Faraday Technology Corporation
   "^fastrax,.*":
-- 
2.40.1

