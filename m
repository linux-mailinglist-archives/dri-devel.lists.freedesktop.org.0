Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD6271030C
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 04:50:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7786410E62B;
	Thu, 25 May 2023 02:50:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DED810E626
 for <dri-devel@lists.freedesktop.org>; Thu, 25 May 2023 02:50:22 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 98e67ed59e1d1-2553f2706bfso386333a91.1
 for <dri-devel@lists.freedesktop.org>; Wed, 24 May 2023 19:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20221208.gappssmtp.com; s=20221208;
 t=1684983022; x=1687575022; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RpwfMsZIM/RuZJMwhQTZ2UB3MwnIPR30emTjY22XhF0=;
 b=KHedM/CVXZ9cf6hNEYMtXSj5ut+e+GcTxZxtBOh30Z1+FpTfqZY2ZS5JSnGqgyu4jP
 LfQNcV7WR6BpEfrB3/8wrI1u0atJ55Avmi8PcZ3aUOy4EenA1iodx8f4NJzaqAMM/iV1
 yx7Otwh6HkJfkziH/B2Bi3pEggtU1xOZsv7KlUZw1YbOIV0ZSBoSTgrMKOqeOoLP+yjt
 w69nUcVwkYKEoTSS48q+HrqM5Ie1arT1id4cR9EQS+hesBpUDqBSRVhAfgm+aOBdAZzY
 vrwmUyT6rSotPORsa/bVaYV/mRcp+IpQOpDx8eguuToq1QTUfi4PGRjz4vVmBvv8HSIw
 hbMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684983022; x=1687575022;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RpwfMsZIM/RuZJMwhQTZ2UB3MwnIPR30emTjY22XhF0=;
 b=Fx9+t9Zagq8y3aV4fA4/ufQIdbrMSGhRBZf94WdF4x9G2p3wirIhLdKvSBxbmF5eJx
 hDGzG/9WoXacAup1od/5xOG5hHWWpr9HVcA7hj1KDko55Hdxff1kSw1xqHgtTkjalE1Y
 64LsQJGqesBRqJ17yNfA3tnNhBG/4NDyJyO+jhhSs3fIVgyUdpBABh4WDJ0spPDRW/0F
 ERSZSDZtP+Cgf3ZkxpQSr4rgf3P17Vthl/dJB4NYscR4p6k396GsspRBGhak7C3cC7nI
 +s/E2zF0hpCfPyMUXIbyB+K4yRuewd72QNg0BIlawMAmDWS0NSdCSRVOiEB7AyNHd4ae
 DcCw==
X-Gm-Message-State: AC+VfDwir/Dw7jaWkpoXOSampUHz5TrwHXNqE2QvHwZhVjh3pRQmcjgY
 YAbhU2pnmK7HQA99lZWMd/8aNg==
X-Google-Smtp-Source: ACHHUZ4WgUyHEalLnXKujv6G0ziF4q8IDMdhMFSyCM3orhs22q3QLabVelnxHkXTjk+bcJBY28stHA==
X-Received: by 2002:a17:90b:f91:b0:253:3dd9:79e6 with SMTP id
 ft17-20020a17090b0f9100b002533dd979e6mr202431pjb.0.1684983021805; 
 Wed, 24 May 2023 19:50:21 -0700 (PDT)
Received: from yc.huaqin.com ([101.78.151.214])
 by smtp.gmail.com with ESMTPSA id
 j6-20020a17090a734600b00253239144c5sm171815pjs.42.2023.05.24.19.50.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 May 2023 19:50:21 -0700 (PDT)
From: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
To: dianders@chromium.org
Subject: [v3 1/4] dt-bindings: display: panel: Add compatible for Starry
 himax83102-j02
Date: Thu, 25 May 2023 10:49:57 +0800
Message-Id: <20230525025000.3692510-2-yangcong5@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230525025000.3692510-1-yangcong5@huaqin.corp-partner.google.com>
References: <CAD=FV=XUuzjjLq3YP3683jOd06odwk5Dox5MS8oY8goB-_8T5w@mail.gmail.com>
 <20230525025000.3692510-1-yangcong5@huaqin.corp-partner.google.com>
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, neil.armstrong@linaro.org, sam@ravnborg.org,
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Conor Dooley <conor.dooley@microchip.com>, robh+dt@kernel.org,
 hsinyi@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The STARRY himax83102-j02 is a 10.51" WUXGA TFT LCD panel,
which fits in nicely with the existing panel-boe-tv101wum-nl6
driver. Hence, we add a new compatible with panel specific config.

Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml     | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml b/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml
index aed55608ebf6..28a7beeb8f92 100644
--- a/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml
+++ b/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml
@@ -32,6 +32,8 @@ properties:
       - innolux,hj110iz-01a
         # STARRY 2081101QFH032011-53G 10.1" WUXGA TFT LCD panel
       - starry,2081101qfh032011-53g
+        # STARRY himax83102-j02 10.51" WUXGA TFT LCD panel
+      - starry,himax83102-j02
 
   reg:
     description: the virtual channel number of a DSI peripheral
-- 
2.25.1

