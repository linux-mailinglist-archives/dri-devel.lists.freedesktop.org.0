Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4109354CFAB
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jun 2022 19:24:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4340910E2EB;
	Wed, 15 Jun 2022 17:24:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8436A10E2EB
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 17:24:11 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 q12-20020a17090a304c00b001e2d4fb0eb4so2748276pjl.4
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 10:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fd+38h/ZuXO4QEJ1wGS9J1AZQKshnBpf5+thNgq+mvo=;
 b=fOBgTZqs3hQWvC0l3F/p+i0TivYNq1gtt4eW8E5d/3EHeKhewOjTxbqwIFFM0Lbu/+
 GerPeMoFwy6Z4NemLuydPC6RvG7vpFvFGMyg+AVSadlJ5a+5TyQ5+Fa6xMfwhJ89GRj5
 61ppCfkk/HUEn6FzNFZYKJ5NkQdUVDIEWg3jE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fd+38h/ZuXO4QEJ1wGS9J1AZQKshnBpf5+thNgq+mvo=;
 b=N1ENHfzziZSv5M4GcqJ++13ldHwUIc3lgoZDjMrG6+95Xyb+j/dewgCi+nhgK0HG8g
 59t98WA5g9wA9Glzns5/Td79Dc9eXk0BBV9NaP82SjBQ7wKfLIXN8ouTZdzxE61l4Dhf
 UvsetZLpxm2FUeQ1wVhlnBNXN4dnjp+XXfhOsWcfVd8XJOcjwrOhNPAIaiyYfpbDrNrr
 IFboOk4oCZXJ2pS6Xo35WAzLTZ7z2dYMjTQfjV2+tPHpNPt2qhNpteQv7KX9u22UGn1D
 OIT3BEbU9QPrE8lvMZUlMehS+kO2g4OPj5aPZrEGUYPz5OdVDMRjJmFkBVj0Pm+wjAJa
 Qevg==
X-Gm-Message-State: AJIora9Q3YRHl2l/IJK/1J0eQIZVpw2MPlJqESrBIhompvyqJoZpb3/z
 VxKJtu2a0UAdWvPDJqNMs6qVyA==
X-Google-Smtp-Source: AGRyM1u814zjEMHfZtf5sU7v86toFZpanB4vAxQLXrCLt1xth/wAXbRon/BiyEIZtPgjcFL0ZTmeDw==
X-Received: by 2002:a17:902:ca0b:b0:167:4c4d:7320 with SMTP id
 w11-20020a170902ca0b00b001674c4d7320mr390478pld.113.1655313851115; 
 Wed, 15 Jun 2022 10:24:11 -0700 (PDT)
Received: from pmalani.c.googlers.com.com
 (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
 by smtp.gmail.com with ESMTPSA id
 d10-20020aa7814a000000b005103abd2fdbsm10147433pfn.206.2022.06.15.10.24.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jun 2022 10:24:10 -0700 (PDT)
From: Prashant Malani <pmalani@chromium.org>
To: linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v4 2/7] usb: typec: mux: Add CONFIG guards for functions
Date: Wed, 15 Jun 2022 17:20:18 +0000
Message-Id: <20220615172129.1314056-3-pmalani@chromium.org>
X-Mailer: git-send-email 2.36.1.476.g0c4daa206d-goog
In-Reply-To: <20220615172129.1314056-1-pmalani@chromium.org>
References: <20220615172129.1314056-1-pmalani@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: heikki.krogerus@linux.intel.com, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, kernel test robot <lkp@intel.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
 <nfraprado@collabora.com>, Jonas Karlman <jonas@kwiboo.se>,
 swboyd@chromium.org, Pin-Yen Lin <treapking@chromium.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Ripard <maxime@cerno.tech>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Xin Ji <xji@analogixsemi.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Robert Foss <robert.foss@linaro.org>, Prashant Malani <pmalani@chromium.org>,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There are some drivers that can use the Type C mux API, but don't have
to. Introduce CONFIG guards for the mux functions so that drivers can
include the header file and not run into compilation errors on systems
which don't have CONFIG_TYPEC enabled. When CONFIG_TYPEC is not enabled,
the Type C mux functions will be stub versions of the original calls.

Reported-by: kernel test robot <lkp@intel.com>
Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Tested-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Signed-off-by: Prashant Malani <pmalani@chromium.org>
---

Changes since v3:
- No changes.

Changes since v2:
- Fix up return types for some of the stubs. Remove 1 unnecessary stub
  in the else condition.
- Remove unnecessary IS_MODULE config guard.
- Added Reviewed-by and Tested-by tags.

Changes since v1:
- Added static inline to stub functions.
- Updated function signature of stub functions from "struct typec_mux"
  to "struct typec_mux_dev" in accordance with updates from commit
  713fd49b430c ("usb: typec: mux: Introduce indirection")

 include/linux/usb/typec_mux.h | 44 ++++++++++++++++++++++++++++++-----
 1 file changed, 38 insertions(+), 6 deletions(-)

diff --git a/include/linux/usb/typec_mux.h b/include/linux/usb/typec_mux.h
index ee57781dcf28..9292f0e07846 100644
--- a/include/linux/usb/typec_mux.h
+++ b/include/linux/usb/typec_mux.h
@@ -58,17 +58,13 @@ struct typec_mux_desc {
 	void *drvdata;
 };
 
+#if IS_ENABLED(CONFIG_TYPEC)
+
 struct typec_mux *fwnode_typec_mux_get(struct fwnode_handle *fwnode,
 				       const struct typec_altmode_desc *desc);
 void typec_mux_put(struct typec_mux *mux);
 int typec_mux_set(struct typec_mux *mux, struct typec_mux_state *state);
 
-static inline struct typec_mux *
-typec_mux_get(struct device *dev, const struct typec_altmode_desc *desc)
-{
-	return fwnode_typec_mux_get(dev_fwnode(dev), desc);
-}
-
 struct typec_mux_dev *
 typec_mux_register(struct device *parent, const struct typec_mux_desc *desc);
 void typec_mux_unregister(struct typec_mux_dev *mux);
@@ -76,4 +72,40 @@ void typec_mux_unregister(struct typec_mux_dev *mux);
 void typec_mux_set_drvdata(struct typec_mux_dev *mux, void *data);
 void *typec_mux_get_drvdata(struct typec_mux_dev *mux);
 
+#else
+
+static inline struct typec_mux *fwnode_typec_mux_get(struct fwnode_handle *fwnode,
+				       const struct typec_altmode_desc *desc)
+{
+	return NULL;
+}
+
+static inline void typec_mux_put(struct typec_mux *mux) {}
+
+static inline int typec_mux_set(struct typec_mux *mux, struct typec_mux_state *state)
+{
+	return 0;
+}
+
+static inline struct typec_mux_dev *
+typec_mux_register(struct device *parent, const struct typec_mux_desc *desc)
+{
+	return ERR_PTR(-EOPNOTSUPP);
+}
+static inline void typec_mux_unregister(struct typec_mux_dev *mux) {}
+
+static inline void typec_mux_set_drvdata(struct typec_mux_dev *mux, void *data) {}
+static inline void *typec_mux_get_drvdata(struct typec_mux_dev *mux)
+{
+	return ERR_PTR(-EOPNOTSUPP);
+}
+
+#endif /* CONFIG_TYPEC */
+
+static inline struct typec_mux *
+typec_mux_get(struct device *dev, const struct typec_altmode_desc *desc)
+{
+	return fwnode_typec_mux_get(dev_fwnode(dev), desc);
+}
+
 #endif /* __USB_TYPEC_MUX */
-- 
2.36.1.476.g0c4daa206d-goog

