Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B1F39E4BF
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jun 2021 19:06:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E8F16E932;
	Mon,  7 Jun 2021 17:06:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B512E6E932
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jun 2021 17:06:17 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id t9so14314027pgn.4
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Jun 2021 10:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VRXNe2oDJn4wT5OJBJOLyBxBuxZlGLcl9ENnPPgLKPk=;
 b=OkmdLJvhXIXLKJoCVrXVxc5RYkvyMAg6zmrUupVVH9E3Nk2c1btyz7zDhEXOdXdRXT
 UWGdAmIejGafSF/IyTVHP4NNEnLRLkS1+Mkba2wv94LbN54WPOfdwsUq2NNaVa0R6NL6
 zt2SCUbiHtjBTafVOoGoA96E1mIxBsLpWZq74=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VRXNe2oDJn4wT5OJBJOLyBxBuxZlGLcl9ENnPPgLKPk=;
 b=UbEEBnDLBlN0/jcD3UI+tPGZw84LxnjQSHN3dVrkx4811a9wF2DMRYF373crgnFTPF
 5OGXsHxXSytdpEpgqSWHe8m6nKogCwvR9vrpuwUeUyCbaHFtikoDCOCb4/XrhT0/bcKM
 IUdhJk65F7CrzD5HrogHv/1F4nd8TOS2WS+2lQgJnLbg+iiT8ZnHP86vlu44vxk+bVCv
 NkLnxp1ip/ECSYLyyByzMgZ1Vw862TuNU8b5EqQtRbN37QiLNdnnsEXaN/43Y0XREzs+
 DNp5g0AChaOA2mDqPqXtX2NxYCd7h2EPSr5BIeFGa44698uWbKA0Uga3tFj3y+IcmSyA
 KA3A==
X-Gm-Message-State: AOAM533Or/5GJeJGbNfj126zd8dkBe1ogcVI7dt/FSpkJY3krGGywMV3
 +DsW2VIcdz4CC9k/NZGf5EYEOQ==
X-Google-Smtp-Source: ABdhPJxpq6X9P7SHMiEyqIpwGb/2S/gW3Uc2YoygXu+i/ugFbz64zcZ/cRusfBngEATD2ksy5s1VKA==
X-Received: by 2002:a65:6a07:: with SMTP id m7mr18475877pgu.294.1623085577248; 
 Mon, 07 Jun 2021 10:06:17 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:f656:ffce:6348:a42a])
 by smtp.gmail.com with ESMTPSA id fs24sm12897639pjb.6.2021.06.07.10.06.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 10:06:16 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v9 01/11] dt-bindings: display: simple: List hpd properties in
 panel-simple
Date: Mon,  7 Jun 2021 10:05:45 -0700
Message-Id: <20210607100234.v9.1.Ieb731d23680db4700cc41fe51ccc73ba0b785fb7@changeid>
X-Mailer: git-send-email 2.32.0.rc1.229.g3e70b5a671-goog
In-Reply-To: <20210607170555.4006050-1-dianders@chromium.org>
References: <20210607170555.4006050-1-dianders@chromium.org>
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
2.32.0.rc1.229.g3e70b5a671-goog

