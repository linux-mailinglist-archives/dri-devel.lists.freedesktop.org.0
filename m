Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C81F38F697
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 02:02:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FE706E44E;
	Tue, 25 May 2021 00:02:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 374916E44E
 for <dri-devel@lists.freedesktop.org>; Tue, 25 May 2021 00:02:38 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id q25so4126985pfn.1
 for <dri-devel@lists.freedesktop.org>; Mon, 24 May 2021 17:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=W6ypAeNUyTw13+ot10ZJQCb7zwm92rirhMuMnGlmdIU=;
 b=FFPgxCLKPIvWnLs03iIgcyr6GE8zQUZQ8sRvcNzu/YD7cj4TPN4zWLQ3tH6so65zkb
 vJQaqSDWEWJD9nuU1vz0F+NdT65YWQM54V+JBtu3Ft2hIkfFeseFYai001oLOoRBfQ1F
 yreunhpuNrtcArkMUGoQaiZc8CD5Gi/QCl/ko=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=W6ypAeNUyTw13+ot10ZJQCb7zwm92rirhMuMnGlmdIU=;
 b=EsC/sc/wLdXbNjQfhDO2FXYn3woKWKAwtB66N6Mg/yI+1tgNWBU9kljc4e7Y5rfqUr
 oX8l96IeVlrF3+tMxiPRYWEWfB/RWOSxftgvTZVv5esYhFTfQca7cNgxJCpZAzMntBly
 Hkjc0Mi0VkbP3xLn8RIYtBTAtvcT9xssOFTS/ob+6ZY5KQB8WlNNTFGIK/t/69V/i6+L
 4sun0JMKmfRuXauikcdGoJB6vTXOQGAF0fwSxWN4Z3YCUKissSoE0cE8a6ObLxlz0axM
 L+0es57v9lophiCCxuQpWyyMUR84qjy9fZc9Pj2977OJICG9LrAzPesonFqE7rDEj30N
 HRrQ==
X-Gm-Message-State: AOAM533CJmLsDex3oopDE5754z47h7NbwgHVEGlIQfs3vRBPMe0tkDHs
 qaK3inrhl/zMAV1wwTCcwAfJCQ==
X-Google-Smtp-Source: ABdhPJz+LC13pDsPvIBJY/vfn0G6QTA8D2JN1gmx11Mo7iFbBxGuzCfte4L/NJ0jWk9GQJjvTVI8vw==
X-Received: by 2002:aa7:8556:0:b029:2e2:45aa:d01e with SMTP id
 y22-20020aa785560000b02902e245aad01emr25395634pfn.14.1621900957855; 
 Mon, 24 May 2021 17:02:37 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:26d1:4df0:7cdf:ce13])
 by smtp.gmail.com with ESMTPSA id f18sm10696741pjh.55.2021.05.24.17.02.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 17:02:37 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v8 01/11] dt-bindings: display: simple: List hpd properties in
 panel-simple
Date: Mon, 24 May 2021 17:01:49 -0700
Message-Id: <20210524165920.v8.1.Ieb731d23680db4700cc41fe51ccc73ba0b785fb7@changeid>
X-Mailer: git-send-email 2.31.1.818.g46aad6cb9e-goog
In-Reply-To: <20210525000159.3384921-1-dianders@chromium.org>
References: <20210525000159.3384921-1-dianders@chromium.org>
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
 Douglas Anderson <dianders@chromium.org>, Steev Klimaszewski <steev@kali.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Thierry Reding <treding@nvidia.com>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The HPD (Hot Plug Detect) signal is present in many (probably even
"most") eDP panels. For eDP, this signal isn't actually used for
detecting hot-plugs of the panel but is more akin to a "panel ready"
signal. After you provide power to the panel, panel timing diagrams
typically say that you should wait for HPD to be asserted (or wait a
fixed amount of time) before talking to the panel.

The panel-simple bindings describes many eDP panels and many of these
panels provide the HPD signal. We should add the HPD-related
properties to the panel-simple bindings. The HPD properties are
actually defined in panel-common.yaml, so adding them here just
documents that they are OK for panels handled by the panel-simple
bindings.

NOTE: whether or not we'd include HPD properties in the panel node is
more a property of the board design than the panel itself. For most
boards using these eDP panels everything "magically" works without
specifying any HPD properties and that's been why we haven't needed to
allow the HPD properties earlier. On these boards the HPD signal goes
directly to a dedicated "HPD" input to the eDP controller and this
connection doesn't need to be described in the device tree. The only
time the HPD properties are needed in the device tree are if HPD is
hooked up to a GPIO or if HPD is normally on the panel but isn't used
on a given board. That means that if we don't allow the HPD properties
in panel-simple then one could argue that we've got to boot all eDP
panels (or at least all those that someone could conceivably put on a
system where HPD goes to a GPIO or isn't hooked up) from panel-simple.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v8:
- Explain better why HPD needs to be in panel-simple in commit msg.

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
2.31.1.818.g46aad6cb9e-goog

