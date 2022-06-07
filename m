Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A41B540F40
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jun 2022 21:05:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5999110ED3A;
	Tue,  7 Jun 2022 19:05:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38DD210EBC7
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jun 2022 19:05:33 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id y187so16764156pgd.3
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jun 2022 12:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zrwToAbRm/8o4mYKXHsvwuZsdzi56cDWjWGCsMFQCq4=;
 b=IJmEKjbu0NsIQ2TIKKHgQBPdu95rE+fxg/uNfUr8lhMeiyM3S3ZNsC45sqxk/R9FaT
 /r8eY4OIvLSDUSY2xX5aGB0rM79qaZ0k5s1ANX+OWkeNYD2rYOnI8ALWyLGqAVuXsJB6
 i/HNUOWDOs5Bk+bD/8AV47NIeWcKF4/IUypi8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zrwToAbRm/8o4mYKXHsvwuZsdzi56cDWjWGCsMFQCq4=;
 b=kcg1i5DU3ZzQ6xh+2FYsLbZRgQg0YNFYA0eaQJWwEGt+kzqbSFstou/haD14o/Kyhd
 9JG9n7nWCtndnzibL6lhfeWNN/Iwz4P9Kp5A/jhY+Gm/rGV2oB4vJ3f1ZCtot0gp7x9C
 931ydayezb7+oXNflfCnFKFizeK2/LUsoVEEyFgJKleeCD06Tf71O3YXHuGuajesMOFV
 luCRzR6U1JnGCL7kMrIyxr44mkgcXXRZBL49JiICLNKVWkvlqtgw9AqWe8PIuYg3b6Iw
 GVDREI9etWGFNxQqquwS9aWY01ebSjG6T2t6RCx1nP57YhEQHN1bs4eSV1h0dqt4BHsX
 CvEg==
X-Gm-Message-State: AOAM533S2UeTRQ2FbNt50E3vjineFWIfG2W0HoiGSat6EKD0IM5Hdjp0
 ij0Egwmwbp+F6rBxb7Zl5pVwsA==
X-Google-Smtp-Source: ABdhPJyUhy7+cJfaDKfU+dlJllV7FTT99DCfwfNrat7f5aIWF9lfM1q5wj8dxgFa13yBRD3PkrsPDQ==
X-Received: by 2002:a63:8841:0:b0:3fc:704c:24ff with SMTP id
 l62-20020a638841000000b003fc704c24ffmr26783832pgd.116.1654628732819; 
 Tue, 07 Jun 2022 12:05:32 -0700 (PDT)
Received: from pmalani.c.googlers.com.com
 (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
 by smtp.gmail.com with ESMTPSA id
 g29-20020aa79ddd000000b0050dc762819esm13236084pfq.120.2022.06.07.12.05.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 12:05:32 -0700 (PDT)
From: Prashant Malani <pmalani@chromium.org>
To: linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH 2/7] usb: typec: mux: Add CONFIG guards for functions
Date: Tue,  7 Jun 2022 19:00:20 +0000
Message-Id: <20220607190131.1647511-3-pmalani@chromium.org>
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
In-Reply-To: <20220607190131.1647511-1-pmalani@chromium.org>
References: <20220607190131.1647511-1-pmalani@chromium.org>
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
Cc: heikki.krogerus@linux.intel.com, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Tzung-Bi Shih <tzungbi@google.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>, Jonas Karlman <jonas@kwiboo.se>,
 swboyd@chromium.org, Pin-Yen Lin <treapking@chromium.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Ripard <maxime@cerno.tech>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
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

Signed-off-by: Prashant Malani <pmalani@chromium.org>
---
 include/linux/usb/typec_mux.h | 38 +++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/include/linux/usb/typec_mux.h b/include/linux/usb/typec_mux.h
index ee57781dcf28..758d34ced1f8 100644
--- a/include/linux/usb/typec_mux.h
+++ b/include/linux/usb/typec_mux.h
@@ -58,6 +58,8 @@ struct typec_mux_desc {
 	void *drvdata;
 };
 
+#if IS_ENABLED(CONFIG_TYPEC) || IS_MODULE(CONFIG_TYPEC)
+
 struct typec_mux *fwnode_typec_mux_get(struct fwnode_handle *fwnode,
 				       const struct typec_altmode_desc *desc);
 void typec_mux_put(struct typec_mux *mux);
@@ -76,4 +78,40 @@ void typec_mux_unregister(struct typec_mux_dev *mux);
 void typec_mux_set_drvdata(struct typec_mux_dev *mux, void *data);
 void *typec_mux_get_drvdata(struct typec_mux_dev *mux);
 
+#else
+
+struct typec_mux *fwnode_typec_mux_get(struct fwnode_handle *fwnode,
+				       const struct typec_altmode_desc *desc)
+{
+	return ERR_PTR(-EOPNOTSUPP);
+}
+
+void typec_mux_put(struct typec_mux *mux) {}
+
+int typec_mux_set(struct typec_mux *mux, struct typec_mux_state *state)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline struct typec_mux *
+typec_mux_get(struct device *dev, const struct typec_altmode_desc *desc)
+{
+	return ERR_PTR(-EOPNOTSUPP);
+}
+
+struct typec_mux *
+typec_mux_register(struct device *parent, const struct typec_mux_desc *desc)
+{
+	return ERR_PTR(-EOPNOTSUPP);
+}
+void typec_mux_unregister(struct typec_mux *mux) {}
+
+void typec_mux_set_drvdata(struct typec_mux *mux, void *data) {}
+void *typec_mux_get_drvdata(struct typec_mux *mux)
+{
+	return ERR_PTR(-EOPNOTSUPP);
+}
+
+#endif /* CONFIG_TYPEC */
+
 #endif /* __USB_TYPEC_MUX */
-- 
2.36.1.255.ge46751e96f-goog

