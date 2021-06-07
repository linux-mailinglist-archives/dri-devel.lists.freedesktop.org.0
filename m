Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A9939E4C0
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jun 2021 19:06:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A75936E941;
	Mon,  7 Jun 2021 17:06:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4D7A6E941
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jun 2021 17:06:18 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id 69so9050370plc.5
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Jun 2021 10:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dQE2oc4ck1yBx8OjbWi1jB5697iDZ6Jcz+Jq90YnWDE=;
 b=BRHM24dXb9WdBH3AF7IEEdq5qZGZPbGeXoUVu78XEfchuxuyufLLfG7W4v0ZiQA8Dy
 i7nO9xhzjYiBMja5Zr43QEFJeeeqyYZErxY2sVXgFe8yqkhc4x4+r662ossOOHA56BS1
 pRzPqoE6FFJ22C3liFwTJKwnKLckezI1tsHck=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dQE2oc4ck1yBx8OjbWi1jB5697iDZ6Jcz+Jq90YnWDE=;
 b=TxXmYMKb8ToywnIAIxFNBI2npBUGRu9VadgkTXkQwtaOCZ+BtFS1RH1jID7p3g37QZ
 TkGQ353d4mrGGh9iBpPXFYeMugrXnqMmz8Cgu6ifIjOhuLB1iZlbnuvEXZUcODXouRBf
 1v5eWfhGhfvEttTH96MXMzVXCmnIInfNVrR+VqR3XdwmVVD8hdEWbrSK8GZBASlM0iaI
 bJOu5gNderh2XDiCipU709WjYf2YNqsy42JdYnlHOedbMWSK+dlLNvBXmHXEwhhCY0Xn
 1LebxSziwhqtMULsxG97bAo4VYv09S+iRpmCtm88NEwWIKQxZm16l6eng2Y4Z8Eqyk5P
 C6rg==
X-Gm-Message-State: AOAM530sck+NnEiNzMltkkAp/drtZ8zdc0RKHKfdnpnPwfc0qF0ZOaRv
 uiU02OA1SGePdV8AGv5TIBDK1A==
X-Google-Smtp-Source: ABdhPJyWrV1oYCT31s6fWz03UksAA2NhnlHdmI7OV5MP8ziAx7Ta1SgfnVY80ymWu7sQMnlDsAomtQ==
X-Received: by 2002:a17:90a:1641:: with SMTP id
 x1mr139302pje.114.1623085578464; 
 Mon, 07 Jun 2021 10:06:18 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:f656:ffce:6348:a42a])
 by smtp.gmail.com with ESMTPSA id fs24sm12897639pjb.6.2021.06.07.10.06.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 10:06:18 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v9 02/11] dt-bindings: drm: Introduce the DP AUX bus
Date: Mon,  7 Jun 2021 10:05:46 -0700
Message-Id: <20210607100234.v9.2.Id3c048d22e72a9f90084a543b5b4e3f43bc9ab62@changeid>
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
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Thierry Reding <treding@nvidia.com>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We want to be able to list an eDP panel as a child of an eDP
controller node to represent the fact that the panel is connected to
the controller's DP AUX bus. Though the panel and the controller are
connected in several ways, the DP AUX bus is the primary control
interface between the two and thus makes the most sense to model in
device tree hierarchy.

Listing a panel in this way makes it possible for the panel driver to
easily get access to the DP AUX bus that it resides on, which can be
useful to help in auto-detecting the panel and for turning on various
bits.

NOTE: historically eDP panels were _not_ listed under their controller
but were listed at the top level of the device tree. This will still
be supported for backward compatibility (and while DP controller
drivers are adapted to support the new DT syntax) but should be
considered deprecated since there is no downside to listing the panel
under the controller.

For now, the DP AUX bus bindings will only support an eDP panel
underneath. It's possible it could be extended to allow having a DP
connector under it in the future.

NOTE: there is no "Example" in this bindings file. Yikes! This avoids
duplicating the same example lots of places. See users of the aux bus
(like ti-sn65dsi86) for examples.

The idea for this bus's design was hashed out over IRC [1].

[1] https://people.freedesktop.org/~cbrill/dri-log/?channel=dri-devel&date=2021-05-11

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---

Changes in v9:
- Commit message now notes aux-bus yaml won't have an "Example".

Changes in v8:
- Separate DP AUX bus binding is new for v8.

 .../bindings/display/dp-aux-bus.yaml          | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/dp-aux-bus.yaml

diff --git a/Documentation/devicetree/bindings/display/dp-aux-bus.yaml b/Documentation/devicetree/bindings/display/dp-aux-bus.yaml
new file mode 100644
index 000000000000..5e4afe9f98fb
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/dp-aux-bus.yaml
@@ -0,0 +1,37 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/dp-aux-bus.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: DisplayPort AUX bus
+
+maintainers:
+  - Douglas Anderson <dianders@chromium.org>
+
+description:
+  DisplayPort controllers provide a control channel to the sinks that
+  are hooked up to them. This is the DP AUX bus. Over the DP AUX bus
+  we can query properties about a sink and also configure it. In
+  particular, DP sinks support DDC over DP AUX which allows tunneling
+  a standard I2C DDC connection over the AUX channel.
+
+  To model this relationship, DP sinks should be placed as children
+  of the DP controller under the "aux-bus" node.
+
+  At the moment, this binding only handles the eDP case. It is
+  possible it will be extended in the future to handle the DP case.
+  For DP, presumably a connector would be listed under the DP AUX
+  bus instead of a panel.
+
+properties:
+  $nodename:
+    const: "aux-bus"
+
+  panel:
+    $ref: panel/panel-common.yaml#
+
+additionalProperties: false
+
+required:
+  - panel
-- 
2.32.0.rc1.229.g3e70b5a671-goog

