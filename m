Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97FFC38F69A
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 02:02:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F6DB6E995;
	Tue, 25 May 2021 00:02:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEBFD6E44E
 for <dri-devel@lists.freedesktop.org>; Tue, 25 May 2021 00:02:39 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id 22so21777570pfv.11
 for <dri-devel@lists.freedesktop.org>; Mon, 24 May 2021 17:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aS2FXtbqE5xTeUczZX5p4dHrNjJBACW91SRGxxJRtNE=;
 b=lzpSd5rWPmHUsOwDcrWP2v3NS9aQ3jxCxECSbeE1gdkyj2kgaPc82gmiEoUIdAaTu6
 nasPFE6JUYsDPQ5FrdRV93gW8cbba2QWfhYx+ybG6BPxXhPx2by4izujhsspt1vHyG1W
 hV4w2me2ESliNawtPsnpHKdEfJzfv1zLp1Xnk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aS2FXtbqE5xTeUczZX5p4dHrNjJBACW91SRGxxJRtNE=;
 b=t/5SVAYgGNZpx0O6lXGeTfZ1zljc4u9O7WMAqjHCgZUJPgjkUurG9UNCAd050sJd9s
 rmJ5yhBFfmIYz6mZtMLI2xrXiYSJXFNttUkGltesvxqDYel5sZlFuDlhhmE3t2fqavcQ
 j83tu/CZvLMCQkhIMpWmNKQEM7FlPOJ2Us5+RnP2XEdgEqmIEmlZ0Kqbr9fDtwTgkcGK
 x/iVgfH93qR8GFRdww0aS2SkKpZc50CoazR08XJXrN15dAVDYwxq53+AjquixH7PiuqB
 tzRMzJRU+A0JA9j2m1/jgULZs/r862JGbPQAWMgV1HZUfHyBpkNCcO8WgQ2pOChnBKHZ
 bxlw==
X-Gm-Message-State: AOAM531HKP+ju3K3s3vcox6wi7fe9BR6WvxLtPen+4b6pcSKIAKQIXzk
 5JuEEyNgiBEHk0xPUEzwyxeYDw==
X-Google-Smtp-Source: ABdhPJw/K4Ffsq5mJ1xUQPdTUkUfGUtNdW7pXLVPCAvIecDthB8kfmRjrEffJtTweMb5rHEKnvwxZg==
X-Received: by 2002:a62:7f51:0:b029:2dc:e1c9:ef71 with SMTP id
 a78-20020a627f510000b02902dce1c9ef71mr27204538pfd.33.1621900959554; 
 Mon, 24 May 2021 17:02:39 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:26d1:4df0:7cdf:ce13])
 by smtp.gmail.com with ESMTPSA id f18sm10696741pjh.55.2021.05.24.17.02.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 17:02:39 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v8 02/11] dt-bindings: drm: Introduce the DP AUX bus
Date: Mon, 24 May 2021 17:01:50 -0700
Message-Id: <20210524165920.v8.2.Id3c048d22e72a9f90084a543b5b4e3f43bc9ab62@changeid>
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

The idea for this bus's design was hashed out over IRC [1].

[1] https://people.freedesktop.org/~cbrill/dri-log/?channel=dri-devel&date=2021-05-11

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
My DT yaml-fu is still weak. If I did something stupid, please help me
learn how to do this better!

NOTE: there is no "Example" in this bindings file. Yikes! This is
because I wanted to keep this patch separate from the one that enables
the first eDP controller. See the patch ("dt-bindings: drm/aux-bus:
Add an example") for the example.

ALSO: if anyone else would like to be listed as a "Maintainer" in this
file then please shout!

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
2.31.1.818.g46aad6cb9e-goog

