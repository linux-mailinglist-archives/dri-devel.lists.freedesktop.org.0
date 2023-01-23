Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D6CFE6781DB
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 17:40:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3E9110E50C;
	Mon, 23 Jan 2023 16:40:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B0BA10E50B
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 16:40:44 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 x24-20020a17090ab01800b00229f43b506fso10768875pjq.5
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 08:40:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=edgeble-ai.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VEdlNj5oGQ8HsVBCaYjphfQCvJbj24DR39NtSIHHu+c=;
 b=bmoyzLkFOm0ulSzOlhELl/PBbVJ2Q5hT4mcL9naaWxSHDc4xSjbpn606WxAP6RraLT
 uwbkmY7QueI7cVgqYvtPp42Zkk1DF0GBVmGODw8LAawOmnIUrWPR+ltAMrbaNPGSrRrz
 m2jJclIap8rClXNLFcGTU67J1/79rghzyU5UzKxkkPVxikScC6NRn7dokE0kaWGg2xtj
 b9juCwYsTd0XFntv0aqZXbGZnXXDDUiaSbR3B8STv6Yc/4veq79kExgW0dOj/DUplXxi
 pmwet+pdGmuN2QvThvBW8a6/pq0WCHx5qo5a/3+unyrCbpVLcTNINhtq32IFo1DvJtVI
 85Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VEdlNj5oGQ8HsVBCaYjphfQCvJbj24DR39NtSIHHu+c=;
 b=JAlznAtdLp1PQhF34oi5NC3izS2yUM/KJQu0YebWSppk/bRyRWfQLFSUaPC0YDKpJa
 v2QO5UoSO6mxBRlbZ7+W+2VIY74Y4Rr0oQ8QgKwR9RRcyl8DRrPkN7KubErWb6QIpNeg
 0axsEKjxWduP3DXLHUNFZRr/QnN6CZ6aXy9A8moAV26Sy0c8ffym0Nw2A0GtFtmfV9JI
 dImB70JUg04hMPN9xoDbFRco/fezgiRHVG1LBIDvJrOh8brfWM+VxSYM6MaKF8of1ZGP
 MzuEo2U/cYIpphulHPE5XXdUp0flErlH5B2+XLOHEg5Dufn/c4zBL2SSP51lNfRRl98C
 Ak5g==
X-Gm-Message-State: AFqh2krQpBCSzuT5aIdRrdRRSeQ7p2xhZmHUNfhDbN4e7G+YUxs2YYvB
 1+E4YFIVGzZcyszg0vQacoD0Kg==
X-Google-Smtp-Source: AMrXdXtxlEvkoZnGh+RPY4XpTzfAD4zeR5koPnz80BaGyn4oau9sgWIXID8Knk1gt0MICIg/oNgxDg==
X-Received: by 2002:a17:902:ba88:b0:193:1fc5:f611 with SMTP id
 k8-20020a170902ba8800b001931fc5f611mr25344304pls.38.1674492043774; 
 Mon, 23 Jan 2023 08:40:43 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a15f:2279:f361:f93b:7971])
 by smtp.gmail.com with ESMTPSA id
 a3-20020a170902710300b0019269969d14sm17679971pll.282.2023.01.23.08.40.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 08:40:43 -0800 (PST)
From: Jagan Teki <jagan@edgeble.ai>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Thierry Reding <thierry.reding@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 3/4] dt-bindings: display: panel: jadard,
 jd9365da-h3: Add Radxa Display 8HD
Date: Mon, 23 Jan 2023 22:10:17 +0530
Message-Id: <20230123164018.403037-3-jagan@edgeble.ai>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230123164018.403037-1-jagan@edgeble.ai>
References: <20230123164018.403037-1-jagan@edgeble.ai>
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jagan Teki <jagan@edgeble.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Radxa Display 8HD is a family of DSI panels from Radxa that
uses jd9365da-h3 IC.

Add compatible string for it.

Signed-off-by: Jagan Teki <jagan@edgeble.ai>
---
 .../devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml b/Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml
index 10ba1b813304..d81b7fab4604 100644
--- a/Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml
+++ b/Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml
@@ -17,6 +17,7 @@ properties:
     items:
       - enum:
           - radxa,display-10hd-ad001
+          - radxa,display-8hd-ad002
       - const: jadard,jd9365da-h3
 
   reg: true
-- 
2.25.1

