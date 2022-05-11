Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80CC35231D3
	for <lists+dri-devel@lfdr.de>; Wed, 11 May 2022 13:35:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1230310E4B3;
	Wed, 11 May 2022 11:35:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [IPv6:2607:f8b0:4864:20::735])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A395210ED68
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 11:35:22 +0000 (UTC)
Received: by mail-qk1-x735.google.com with SMTP id m1so2009319qkn.10
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 04:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=g2dieohjKJl3LRE3v0qEPyCNFBVg0n7LQ+TeFcHI+fU=;
 b=JLISchbWbGmgePFdtjCGDZEIifvBjm7I2Nx32rbSTcMIy3DXwdp6bvLxRowwcaRGxn
 MuqAjFikGzI5MArfUMGNkFDB+2+X8SsHbDKXrl8Fqa30LF75JxCBJ8GG1VPyzPS06YVW
 tO7s4D+AXuTZ/j5s1wNiCeSD5QxVE049VdGgxLTsiX4lP39Zc75M9ThwMYfc2FqEMS5W
 H5BND9luFZHGweAfMY/+GtFaHv+XJLxB4G3cQcLx1qNK/TQ2Wqvz15ZRRT5vCgumwZCD
 7sqo8XL54qD2EHxiQN0K2Ik1MFb1jFKgtuwC2ZQI4Y6AQYBW7RW2vIeKZ0l+FxsaPKcB
 rotw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=g2dieohjKJl3LRE3v0qEPyCNFBVg0n7LQ+TeFcHI+fU=;
 b=kDGjnE53vzN7kajRQXC+5yisn4ccLK9jjmmq2ozzHLwVaDsIKlYsHHyGNXjl98Jw9x
 UWS+HH7/q7op5HnUDxu5Ftc131bvek4AY5wVOnHHUUxfgXh6PZ+F1BmEp0eWWHyrRGwO
 R+XerkAtflUW4kWPLkXluvYj1d/loZEky+2Xbjph91hhEL3jrk0VQ6HEwylRmOJjB4Ye
 WWzLpkoe9nHg4Y9FkxlOjN9EPtZUaJnCxeGByYqOSmLLgu/j5sccEoeHwjFWS5B4oJBW
 5NpUhq/Lq1bqXrLeFDzCel4wSBBkeLUpg3UOXkp3Cy51FwbPxNabpWGCXB0ia77HmdH9
 fEEw==
X-Gm-Message-State: AOAM532dYPapJCdGsSw0juUayWNqIcaXFtuP4y02VasxT5M9zoZYrezc
 dINsV6cczaSWZhJF1m6yYck=
X-Google-Smtp-Source: ABdhPJzL+T1CaXI7PLHaqwNmp5VdAf/xHGHpPqT6b/rkgiogHkmm9AYlEj1W+JT7TF0qhCvUdXzqqA==
X-Received: by 2002:a37:9ace:0:b0:69f:b424:25b4 with SMTP id
 c197-20020a379ace000000b0069fb42425b4mr18428024qke.250.1652268920787; 
 Wed, 11 May 2022 04:35:20 -0700 (PDT)
Received: from master-x64.sparksnet ([2601:153:980:85b1::10])
 by smtp.gmail.com with ESMTPSA id
 bw26-20020a05622a099a00b002f39b99f6basm953377qtb.84.2022.05.11.04.35.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 May 2022 04:35:20 -0700 (PDT)
From: Peter Geis <pgwipeout@gmail.com>
To: linux-rockchip@lists.infradead.org,
 Jagan Teki <jagan@amarulasolutions.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: [PATCH v2 1/3] dt-bindings: display: panel: feiyang,
 fy07024di26a30d: make reset gpio optional
Date: Wed, 11 May 2022 07:35:14 -0400
Message-Id: <20220511113517.4172962-2-pgwipeout@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220511113517.4172962-1-pgwipeout@gmail.com>
References: <20220511113517.4172962-1-pgwipeout@gmail.com>
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
 dri-devel@lists.freedesktop.org, Peter Geis <pgwipeout@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some implementations do not use the reset signal, instead tying it to dvdd.
Make the reset gpio optional to permit this.

Signed-off-by: Peter Geis <pgwipeout@gmail.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../bindings/display/panel/feiyang,fy07024di26a30d.yaml          | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/panel/feiyang,fy07024di26a30d.yaml b/Documentation/devicetree/bindings/display/panel/feiyang,fy07024di26a30d.yaml
index 95acf9e96f1c..1cf84c8dd85e 100644
--- a/Documentation/devicetree/bindings/display/panel/feiyang,fy07024di26a30d.yaml
+++ b/Documentation/devicetree/bindings/display/panel/feiyang,fy07024di26a30d.yaml
@@ -35,7 +35,6 @@ required:
   - reg
   - avdd-supply
   - dvdd-supply
-  - reset-gpios
 
 additionalProperties: false
 
-- 
2.25.1

