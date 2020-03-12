Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2380318421A
	for <lists+dri-devel@lfdr.de>; Fri, 13 Mar 2020 09:01:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E39F6EB83;
	Fri, 13 Mar 2020 08:00:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com
 [IPv6:2607:f8b0:4864:20::1049])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F29D06EB22
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Mar 2020 18:56:36 +0000 (UTC)
Received: by mail-pj1-x1049.google.com with SMTP id z5so3786668pjq.9
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Mar 2020 11:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=JBus33rcs/bxtojDIFRczNVDzpMKB2gTKUUCnsJQjXM=;
 b=qNG+O3OaXtIR4EVLDkbXpJmCGwwH0i2/ujAzXea7h4V0j0DYPohIv61RB487KHkCF5
 soMKjDyWkM6rpKnel1JMoInJARXQ9xPiB5ckgSz6n/ZSbU2JLMfQe2GBEH1wOhBBKg2t
 C5qNDZfF7C7NNXyPOXd5ufRRGRHjwDmZV/JOrca+KRLv/basJSprM0PSKzrpoAHCdlP3
 qxqqEVxvdFJTXvM4GUgy3UZbpZgnJbjSmY15voSyDf/HDerQtYvdABe/tXCp1aJgdKW5
 WFuFLdrMtNRlejjbvskrqkSQQh4IIJOR/Mdn/8st8BHwMe7kKUS+1JTG3MVVCRqSyoBf
 PfzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=JBus33rcs/bxtojDIFRczNVDzpMKB2gTKUUCnsJQjXM=;
 b=Fy+kw87pqjKYaGs9R3b16qxOrgHkjt5CBSXob1IX12dbNohpjPOOpSuj/AN5U/B9AY
 4rZynB62qxhF/i0XbcS3GFypsHE3OfK6kR8R//y1+zodrKEDXKfF6Ba0HhqGSZp6br8M
 sPkKvdkGcF62s8L96IG7Oimr/+yo06x1uAyMSrfvDAzUN+Mer+YYk06ZxfmsqyDrextJ
 AU4I9+D2AqdJ6FzuygVg4NllmlLqKtREUZ5N1fgAR4oHpF+PlbFEtM1IH+FvZNJ4Jp/i
 dl8I3Qu8oT4W5eZLybtsad6dxuxXXua4FTBnzv6Y8JzZmASycY5y3zmn+ft87A0ZS3d9
 hShg==
X-Gm-Message-State: ANhLgQ2Os40CDxMGePTNezSdwaRuSTBQQupRMnEqP5+VW73qiH4sNilY
 LrM5kl8J0CwgNI90aLbVyRsh4M2uiAwz
X-Google-Smtp-Source: ADFU+vsFXW6TpnOJQxY5oJqxDW7a5dbVCvhzOlHQriPAMggKhWGdyFqIyMpSFvpC0A9aqAn7xRDRUwKwl9Qy
X-Received: by 2002:a17:90a:1c01:: with SMTP id
 s1mr5671706pjs.84.1584039396514; 
 Thu, 12 Mar 2020 11:56:36 -0700 (PDT)
Date: Thu, 12 Mar 2020 11:56:25 -0700
In-Reply-To: <20200312185629.141280-1-rajatja@google.com>
Message-Id: <20200312185629.141280-2-rajatja@google.com>
Mime-Version: 1.0
References: <20200312185629.141280-1-rajatja@google.com>
X-Mailer: git-send-email 2.25.1.481.gfbce0eb801-goog
Subject: [PATCH v9 1/5] intel_acpi: Rename drm_dev local variable to dev
From: Rajat Jain <rajatja@google.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 "=?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?=" <ville.syrjala@linux.intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>, Imre Deak <imre.deak@intel.com>, 
 "=?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?=" <jose.souza@intel.com>,
 linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 gregkh@linuxfoundation.org, mathewk@google.com, 
 Daniel Thompson <daniel.thompson@linaro.org>, Jonathan Corbet <corbet@lwn.net>,
 Pavel Machek <pavel@denx.de>, seanpaul@google.com,
 Duncan Laurie <dlaurie@google.com>, 
 jsbarnes@google.com, Thierry Reding <thierry.reding@gmail.com>,
 mpearson@lenovo.com, Nitin Joshi1 <njoshi1@lenovo.com>,
 Sugumaran Lacshiminarayanan <slacshiminar@lenovo.com>, 
 Tomoki Maruichi <maruichit@lenovo.com>
X-Mailman-Approved-At: Fri, 13 Mar 2020 08:00:36 +0000
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
Cc: Jani Nikula <jani.nikula@intel.com>, Rajat Jain <rajatja@google.com>,
 rajatxjain@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Change the struct drm_device * local variable from drm_dev to dev
per the feedback received here:
https://lkml.org/lkml/2020/1/24/1143

Signed-off-by: Rajat Jain <rajatja@google.com>
Reviewed-by: Jani Nikula <jani.nikula@intel.com>
---
v9: Same as v8
v8: same as v7
v7: same as v6
v6: Initial patch (v6 to match other patches in the set)

 drivers/gpu/drm/i915/display/intel_acpi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_acpi.c b/drivers/gpu/drm/i915/display/intel_acpi.c
index e21fb14d5e07b..3e6831cca4ac1 100644
--- a/drivers/gpu/drm/i915/display/intel_acpi.c
+++ b/drivers/gpu/drm/i915/display/intel_acpi.c
@@ -224,13 +224,13 @@ static u32 acpi_display_type(struct intel_connector *connector)
 
 void intel_acpi_device_id_update(struct drm_i915_private *dev_priv)
 {
-	struct drm_device *drm_dev = &dev_priv->drm;
+	struct drm_device *dev = &dev_priv->drm;
 	struct intel_connector *connector;
 	struct drm_connector_list_iter conn_iter;
 	u8 display_index[16] = {};
 
 	/* Populate the ACPI IDs for all connectors for a given drm_device */
-	drm_connector_list_iter_begin(drm_dev, &conn_iter);
+	drm_connector_list_iter_begin(dev, &conn_iter);
 	for_each_intel_connector_iter(connector, &conn_iter) {
 		u32 device_id, type;
 
-- 
2.25.1.481.gfbce0eb801-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
