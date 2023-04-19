Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5013D6E7032
	for <lists+dri-devel@lfdr.de>; Wed, 19 Apr 2023 02:10:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DD1B10E384;
	Wed, 19 Apr 2023 00:10:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com
 [IPv6:2607:f8b0:4864:20::833])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C42510E185
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 00:10:37 +0000 (UTC)
Received: by mail-qt1-x833.google.com with SMTP id u37so6721337qtc.10
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 17:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681863036; x=1684455036;
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=UyEq/Tf7QLl6d9zXXGWl73RQz/CxSbYGosQOapTIRD0=;
 b=BH1v+IPmPbOUXgkeCbLN1FEEOG8L7DbpXaa4IdtDc4H6TO2Lca10KggzIwAdfHnmCp
 Eocn2M2Lfyi3QZuJjXa/dFdVW6omCj29iNF9dPmQiIVslt7FwduTSEUdGUw1npL3CLrf
 BwJT+jPH6JQAD6eNPL4fzqRQmXIu8mfEbbDwbL78H8T4J7WVoYJ2QHdJnxPusyi5tO50
 H0sHqEht4NlZ7NJgYh0HgX3Yv5o6+dIw0/3M7zhc5ml6qWV35SPrZkEpJINSaVqvbGZf
 UZYxT+JhC4tE0oRxPAJEsOcKMbrODHaquRV0pSpuzXPChKgMscNVNrFt+gG7dGfXuSjb
 1xSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681863036; x=1684455036;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UyEq/Tf7QLl6d9zXXGWl73RQz/CxSbYGosQOapTIRD0=;
 b=G0hIB/VMZBhPQSj9lEofTCgFfDL5CpV7sfhqTA1NuctSGUz8MpAIPige2buiI2p1Kr
 4BRSUdfP73MG33YzHyB5wcwk5LABIHDR2okcSH9gPEpldpBr5qs8vvU8ljo8YjEiQ3C7
 eSsIU2x/oVucecto/bjsPwliUISAlnUsnZvbTujeZkTB0tbsuAsqvOl/Vl17AnpLZvDP
 ApYGn4AF6vyUah4ZsQeI4vx8cQ6ZpPHQTyFeFhAWLtWcniEMGPKeflNb2v1JEWwaMQ82
 i/jhk4QU9gTwWzHhjPVqhtnXVNS9NDIkhzOW3b66REJ2BejGkU+RG8LgoOzDv00Zzg5Y
 Dyxw==
X-Gm-Message-State: AAQBX9d8pe5NTR0Xn8aGLLcbDIY4tSJqO9au6exqXIHbD1hcNG3+2WR3
 5hvZOFknABhaARxVzmE1xvc=
X-Google-Smtp-Source: AKy350bik89bg3Bh7J8Q8dUtjUHyetGtf2M9+Xo42hsDtxUodGDcOq+h/v/8FR0+uue+NbSiL3NveQ==
X-Received: by 2002:a05:622a:3cf:b0:3ec:47bb:9767 with SMTP id
 k15-20020a05622a03cf00b003ec47bb9767mr3211241qtx.20.1681863036044; 
 Tue, 18 Apr 2023 17:10:36 -0700 (PDT)
Received: from stbirv-lnx-2.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id
 d14-20020a37680e000000b0074d1b6a8187sm2639035qkc.130.2023.04.18.17.10.33
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 18 Apr 2023 17:10:35 -0700 (PDT)
From: Justin Chen <justinpopo6@gmail.com>
To: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 bcm-kernel-feedback-list@broadcom.com
Subject: [PATCH net-next 2/6] dt-bindings: net: brcm, unimac-mdio: Add asp-v2.0
Date: Tue, 18 Apr 2023 17:10:14 -0700
Message-Id: <1681863018-28006-3-git-send-email-justinpopo6@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1681863018-28006-1-git-send-email-justinpopo6@gmail.com>
References: <1681863018-28006-1-git-send-email-justinpopo6@gmail.com>
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
Cc: andrew@lunn.ch, f.fainelli@gmail.com, opendmb@gmail.com,
 christian.koenig@amd.com, richardcochran@gmail.com, linux@armlinux.org.uk,
 justin.chen@broadcom.com, edumazet@google.com, robh+dt@kernel.org,
 Justin Chen <justinpopo6@gmail.com>, krzysztof.kozlowski+dt@linaro.org,
 kuba@kernel.org, pabeni@redhat.com, sumit.semwal@linaro.org,
 davem@davemloft.net, hkallweit1@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Justin Chen <justin.chen@broadcom.com>

The ASP 2.0 Ethernet controller uses a brcm unimac.

Signed-off-by: Justin Chen <justinpopo6@gmail.com>
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 Documentation/devicetree/bindings/net/brcm,unimac-mdio.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/brcm,unimac-mdio.yaml b/Documentation/devicetree/bindings/net/brcm,unimac-mdio.yaml
index 0be426ee1e44..6684810fcbf0 100644
--- a/Documentation/devicetree/bindings/net/brcm,unimac-mdio.yaml
+++ b/Documentation/devicetree/bindings/net/brcm,unimac-mdio.yaml
@@ -22,6 +22,8 @@ properties:
       - brcm,genet-mdio-v3
       - brcm,genet-mdio-v4
       - brcm,genet-mdio-v5
+      - brcm,asp-v2.0-mdio
+      - brcm,asp-v2.1-mdio
       - brcm,unimac-mdio
 
   reg:
-- 
2.7.4

