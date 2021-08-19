Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA9C3F1722
	for <lists+dri-devel@lfdr.de>; Thu, 19 Aug 2021 12:12:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D5346E825;
	Thu, 19 Aug 2021 10:12:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-relay-canonical-1.canonical.com
 (smtp-relay-canonical-1.canonical.com [185.125.188.121])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D6656E825
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 10:12:06 +0000 (UTC)
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id 1CE96411EF
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 10:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1629367925;
 bh=uQVhpvDvpjI0P3FxejG6bkElaqc3lP0DEFRi/YWQ1og=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
 b=pu1QqXgr593FV6knckHIyzylDcUJBA9dYbev9jnRKZ2z89EKex6/rKlwsSwCOsOaN
 QLYWL3rpL5L5Ce8wI1Yl0YzwVZFQtfRqsQ258Yw0aDp+BPhN8lCvabO/4dXQKIdgBX
 oGdS/7GDZB0IEkxiMsyVdqTVHaTi57yNOMczcFSTH4P0caHtUNL/zm58nTjRxlHUVe
 MPsKZCof6R5dBr5W5JgyjJJUFbY+V5xmUUdjslSMwMtzyWrCVafREABC8HzHQ318IC
 JxCEt125W6DbefrPuqriS4VrFot4usY+cKsDfYxtUF/dOKA8WW3fT+lqsAKoTdLbGC
 nCcMLWTJ91c+A==
Received: by mail-ed1-f72.google.com with SMTP id
 m16-20020a056402511000b003bead176527so2570895edd.10
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 03:12:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uQVhpvDvpjI0P3FxejG6bkElaqc3lP0DEFRi/YWQ1og=;
 b=phJl+RmrA73DIi0YoBQjb0++UFfvPBaaHWbqWFkrLQAUOhE2Ilzzs36YXqFFjJkphC
 19FCg0UJ9VcaiqSCAj7mEMFJ0e0EoNGkmwcqeXtcnTqq5dA/t+Oyo+t3lvi5ZvNQG9NQ
 +O3/N+5iJALsv3HxehRhCMnDnMpEc75+7pQ4QMRWSOzXnItK9Pmk3/10r1q+G/e2z4JR
 lYHLo2woT14mw+mFYgX3cdW/ve1lzjvTpuJaBpeCbso74UTJSRYyeH1JmqvBXA7Bey7t
 6nG0g7etTyZAidzGoHcPxRFHrsAqfRj9x0RXqi6gN1CY+NUBwBuqLR9e5Bj/k6myuM3U
 aiHQ==
X-Gm-Message-State: AOAM532NQN4zEpoDf9FxrJkxwNAkqjq0qCoRkMtjm6qC8yCU4ZNCwkpY
 Hsa1CuH4MecEBE65bFr9WOko4lP0w45Q05Vyyis+Bx9wSQeHFyAhJR3z+0/ZjEzDtojRN+Yidx9
 tuXC0jK7RhXT3aTsjD3WRIu3SMAWez7Fnr5BxWVO8f9mYjA==
X-Received: by 2002:aa7:de05:: with SMTP id h5mr15692582edv.174.1629367924826; 
 Thu, 19 Aug 2021 03:12:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzbx+5karGwHCd0154GL4o1bMhwTey/MCqUQCq8AL/d5JkQfHYSeV0sYRenyhjeIm/i7JNcfw==
X-Received: by 2002:aa7:de05:: with SMTP id h5mr15692564edv.174.1629367924684; 
 Thu, 19 Aug 2021 03:12:04 -0700 (PDT)
Received: from localhost.localdomain ([86.32.42.198])
 by smtp.gmail.com with ESMTPSA id bs13sm1031774ejb.98.2021.08.19.03.12.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 03:12:04 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Dillon Min <dillon.minfei@gmail.com>,
 Tzung-Bi Shih <tzungbi@google.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [PATCH 1/2] dt-bindings: panel: ili9341: correct indentation
Date: Thu, 19 Aug 2021 12:10:19 +0200
Message-Id: <20210819101020.26368-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
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

Correct indentation warning:
  ilitek,ili9341.yaml:25:9: [warning] wrong indentation: expected 10 but found 8 (indentation)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../devicetree/bindings/display/panel/ilitek,ili9341.yaml       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml
index 2ed010f91e2d..20ce88ab4b3a 100644
--- a/Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml
+++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml
@@ -22,7 +22,7 @@ properties:
     items:
       - enum:
           # ili9341 240*320 Color on stm32f429-disco board
-        - st,sf-tc240t-9370-t
+          - st,sf-tc240t-9370-t
       - const: ilitek,ili9341
 
   reg: true
-- 
2.30.2

