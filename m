Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C7673865E1
	for <lists+dri-devel@lfdr.de>; Mon, 17 May 2021 22:10:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 995196E2E6;
	Mon, 17 May 2021 20:09:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A3116E2E6
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 20:09:49 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id h7so3811374plt.1
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 13:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+urYn/auWJUjc3W4sdmPucnZoewzDoUKh0jwgsir+nQ=;
 b=RJIYA2O4giqjYO66q0SQpXcr1odgBXvF0aQ7MZWxCqHVao92mTCpdHiAQvvuOvnWb0
 VZxZOmXubCqnouWsB4I/kkQdT1Im1eoL3aSwrMtqJyVTC9wk2bixTA8YpNXujs3ebJNq
 UgdlMPwUrXlBTiOUWlGJKj96af58fxXxVUckM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+urYn/auWJUjc3W4sdmPucnZoewzDoUKh0jwgsir+nQ=;
 b=oATlMIXf5TJZmpPGmWMnaPw0iHwq2DNJwIklGcmPtODDmg8pnetM43O2okSH7FrIQs
 +3ZPl81W4uAPnPusvVbkNBkrVpHPMHpnLIk1jWO4UlknPjwcxMIea/jzWUG2Mt3dXwLJ
 4DMUiVdtKlU5EH4ArV4yWfPCnzZ0RaYgWjA5jXGkvNEnaWgv9AVseJW3ZM485D6sPhXK
 /tmEEigfXZLJr7D3+wKGauqNVfUOmv9V6D9fCSL5bBAdNpowycjodhKQrI36mQ4jyby5
 X5rG/NJOz0GlwR6dunpCt4UdEz2kKcPUw8PzyXs7nfot3rpiuqXD8veWvdodibp3z6U+
 dnpQ==
X-Gm-Message-State: AOAM530Tk5MGXKSTOYbbxYonE/Cf/zPhViVbjKz01A7ZRbjuHUBFfdPG
 Feapjjf3PShDy2YLhJIeFOEMrw==
X-Google-Smtp-Source: ABdhPJzqYY2WqAKQmfMbYwBASkiXd/jkLCuXy99v9JmQQ8Cmyq311d8LnPThMxqgk98rM3Md4cOG2w==
X-Received: by 2002:a17:90b:188f:: with SMTP id
 mn15mr1153919pjb.219.1621282189154; 
 Mon, 17 May 2021 13:09:49 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:bc91:c597:ded0:7930])
 by smtp.gmail.com with ESMTPSA id x19sm9078941pgj.66.2021.05.17.13.09.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 13:09:48 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v7 02/10] dt-bindings: display: simple: List hpd properties in
 panel-simple
Date: Mon, 17 May 2021 13:08:59 -0700
Message-Id: <20210517130450.v7.2.Ieb731d23680db4700cc41fe51ccc73ba0b785fb7@changeid>
X-Mailer: git-send-email 2.31.1.751.gd2f1c929bd-goog
In-Reply-To: <20210517200907.1459182-1-dianders@chromium.org>
References: <20210517200907.1459182-1-dianders@chromium.org>
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
Cc: robdclark@chromium.org, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Stephen Boyd <swboyd@chromium.org>, Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Steev Klimaszewski <steev@kali.org>, Thierry Reding <treding@nvidia.com>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

These are described in panel-common.yaml but if I don't list them in
panel-simple then I get yells when running 'dt_binding_check' in a
future patch. List them along with other properties that seem to be
listed in panel-simple for similar reasons.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
I didn't spend tons of time digging to see if there was supposed to be
a better way of doing this. If there is, feel free to yell.

Changes in v7:
- List hpd properties bindings patch new for v7.

 .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index b3797ba2698b..4a0a5e1ee252 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -298,6 +298,8 @@ properties:
   enable-gpios: true
   port: true
   power-supply: true
+  no-hpd: true
+  hpd-gpios: true
 
 additionalProperties: false
 
-- 
2.31.1.751.gd2f1c929bd-goog

