Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BEB13A47A6
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jun 2021 19:18:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48D366F399;
	Fri, 11 Jun 2021 17:18:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 547626F390
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jun 2021 17:18:04 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id x73so4976708pfc.8
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jun 2021 10:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yhIM3K9t3aCmDjyuEtkm9XV8CNs0MnLwT1gqOC9S4Pc=;
 b=kBdF8xEiFZkkVF965RG425eBZxVacJWM+uAMeKtVcSKL9+nLMfH8fq9kBYZuRGITnK
 GmQwqLCOH00EkrETIv1q2eQkpagxbrQ3Jp304q2ommAaqIKXVuFDCe+2AiKENT0c0qrL
 OeNaS1qePgCXwVw54rrqlveJ5IkoTwXG++674=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yhIM3K9t3aCmDjyuEtkm9XV8CNs0MnLwT1gqOC9S4Pc=;
 b=CsTGtTvNMiCESCLBBGuTUrcCTtZ5rVITTElWVplkJE4ZhSMWEphZ/4mGB0ffa+gYRv
 RVL0z/7InggqXKNXZiSgAtnVZyUdpm50bPMhMOE4spv3e0ImiahUCxALs/A2PY/gD2Ur
 4lBAMUoeTcGv1YapJ3C2QpsenggzxItDpkpQ7ABKqYx/T3pkAqC3Trl+3mDGE05CwWPf
 INiJxe7BraoCi6/2ro89T24tORw5utBHoWSkHAoMHTn7yivgJyRNbByONL477uSMe8qE
 vcvuxoI/sEAdScPpMbUgVQb/o3FcUTOZTb4DW0omB/dZTm9t4FQFbOMgGYMdEfEGTRmV
 lU2g==
X-Gm-Message-State: AOAM533EDfAt6lnWSqKi/W2D9RShHvf0YrjX09FAu2ZWwDTMxBjDnELt
 A7gKSGzUUtFw43i0Ic/yfs8Awg==
X-Google-Smtp-Source: ABdhPJwmXDyDPT+adcqG/FAHC90hNwwuXYd3fX/m/Wj5dnvEb98F6gECmiu9wkkrujxVfbkMyhYsMQ==
X-Received: by 2002:a63:3e4e:: with SMTP id l75mr4730182pga.10.1623431883964; 
 Fri, 11 Jun 2021 10:18:03 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:4128:5428:5cd0:cfa5])
 by smtp.gmail.com with ESMTPSA id f17sm5837850pgm.37.2021.06.11.10.18.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 10:18:03 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v10 01/11] dt-bindings: display: simple: List hpd properties
 in panel-simple
Date: Fri, 11 Jun 2021 10:17:37 -0700
Message-Id: <20210611101711.v10.1.Ieb731d23680db4700cc41fe51ccc73ba0b785fb7@changeid>
X-Mailer: git-send-email 2.32.0.272.g935e593368-goog
In-Reply-To: <20210611171747.1263039-1-dianders@chromium.org>
References: <20210611171747.1263039-1-dianders@chromium.org>
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
 Steev Klimaszewski <steev@kali.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 dri-devel@lists.freedesktop.org, Thierry Reding <treding@nvidia.com>,
 linux-kernel@vger.kernel.org
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
Reviewed-by: Rob Herring <robh@kernel.org>
---

(no changes since v8)

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
2.32.0.272.g935e593368-goog

