Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD0C1A29AB
	for <lists+dri-devel@lfdr.de>; Wed,  8 Apr 2020 21:51:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B31A6EACB;
	Wed,  8 Apr 2020 19:51:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F125E6EAC9
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Apr 2020 19:51:41 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id g27so8957070ljn.10
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Apr 2020 12:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vKqNr/2OY3y1JwLr1v1LEruLN8ujEKMCeTY+OOF8/84=;
 b=bHS7qaEqvgeEmoXrdQAsSmgXvwjipMph7e2NhwD3DcZERvCsfX+fgHl2RzAZKQuwfc
 smDlse3qwJ7qVawxoHhHo5bWQabgy4Ghd4cWBGSdq9rGoKI2op9gp1ozuOwbXPLEMwkN
 DJFpNHC3K+VRp1PV4AhfVQ6p5/xpo8v0CgEJvsd4GQS/xuyIA2k3OZzDrseHQulq0/1B
 lj3rvJ8Ioo1pv7g5g8w4X5/SRFnw3b/sD//bkFKCCEFLEWLKer+Q/D3P5KLfK6fo27wp
 c+GgJD7ikj4wFLo7s2cFqdZsmd1CnZYRsE9VBFUFxP+pHEjrOjWPCqfnAKNQdUnE/6OZ
 kfwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=vKqNr/2OY3y1JwLr1v1LEruLN8ujEKMCeTY+OOF8/84=;
 b=bfKiXKcj93UBZt6130cWkZgAFGJJfuQMDM2MuNS20dLpiY0nbRTQ7kJipj8W1nlbZw
 VNmB68rb4oSPL0MNJVqNNpgO0W6Qx3WPzWfe7sIpza1V8WCU6ln6X1zaowMeAO8NE6fJ
 b6HpcJAKqH40LSExtLhXG2j7TQ+EG7HuHMzCd4iqXsUAxzN8sgOhrDSoox+/CeDXUO4F
 uIllzKm6wQSrJy8JjpfySg5uRBs8aBCDwI6SEF5WtDrzEtwXmhlr5zB2hYi2uxVJTI0u
 pRTQTvYWweqVYqPUsUso68m6sQ4LYpYSjqeeP8/oqm51SI5IRMH5H565Sx/h71NYn1vk
 h/EQ==
X-Gm-Message-State: AGi0Pub5fMgjIPsr+DiowXCdp9aU76q9ROXzcgkJOSJWGjd9V78OUsAr
 y3/2XRENzj6yCsq7i7bVG9cJilPE8Dg=
X-Google-Smtp-Source: APiQypJtn86WxJVj9pRVPHicvxUhAn0189Nw+j+tpzho9zVSCakjfHSw3LA2tLqOp2qOJOFhe6zNcg==
X-Received: by 2002:a2e:9a89:: with SMTP id p9mr6061321lji.222.1586375499702; 
 Wed, 08 Apr 2020 12:51:39 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 i20sm3961304lfe.15.2020.04.08.12.51.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Apr 2020 12:51:39 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH v2 01/36] dt-bindings: display: allow port and ports in
 panel-lvds
Date: Wed,  8 Apr 2020 21:50:34 +0200
Message-Id: <20200408195109.32692-2-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200408195109.32692-1-sam@ravnborg.org>
References: <20200408195109.32692-1-sam@ravnborg.org>
MIME-Version: 1.0
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
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Both port and ports names may be used.
port - for a single port
ports - if there is more than one port in sub-nodes

Fixes the following warning:
advantech,idk-2121wr.example.dt.yaml: panel-lvds: 'port' is a required property

advantech,idk-2121wr.yaml needs several ports, so uses a ports node.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 Documentation/devicetree/bindings/display/panel/lvds.yaml | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/panel/lvds.yaml b/Documentation/devicetree/bindings/display/panel/lvds.yaml
index d0083301acbe..f9132d50821c 100644
--- a/Documentation/devicetree/bindings/display/panel/lvds.yaml
+++ b/Documentation/devicetree/bindings/display/panel/lvds.yaml
@@ -102,6 +102,12 @@ required:
   - width-mm
   - height-mm
   - panel-timing
-  - port
+
+if:
+  required:
+    - port
+else:
+  required:
+    - ports
 
 ...
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
