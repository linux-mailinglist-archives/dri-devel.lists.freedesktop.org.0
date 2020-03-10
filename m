Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7BAA17F193
	for <lists+dri-devel@lfdr.de>; Tue, 10 Mar 2020 09:19:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79A016E7FE;
	Tue, 10 Mar 2020 08:19:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x549.google.com (mail-pg1-x549.google.com
 [IPv6:2607:f8b0:4864:20::549])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6388A6E5C5
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Mar 2020 00:06:25 +0000 (UTC)
Received: by mail-pg1-x549.google.com with SMTP id b10so7532275pgi.16
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Mar 2020 17:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=VDuOhbt4EtVAr5HqP/z/JEAhJ6aufU2qBAQhX8Irrmg=;
 b=GrS+pcj6aRCeWKMOofPnAlbvuD551qH8x0F3XmDw6A3bEjIm8CdBeBzk8YPDrzjD0s
 60fz0+NNvEPN2e7OgoN2O2oCMh1+e5iR69wFFjYkM6zemzHcqwkv+D2dzcZWd0jmrdU8
 FwN2gT7wobMh9LXMaGkMXQPdSH9aPWM0g2IlCrnkoxLhviqrDSgx9IpKpJjsmqhh/OWE
 FZZfsWusbJK822c6Q0OnyDbwFnhz6kNpYj4Oc0zwCnFA+4P522se/fLtdHlxMYMIFesB
 iHjIZi+7gKh3BW/TbfRZeBMzlJDiWzv8tz9LQLK+2+I9aRCoMWYh9EVKdMPm06/FkVK9
 2PvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=VDuOhbt4EtVAr5HqP/z/JEAhJ6aufU2qBAQhX8Irrmg=;
 b=OKZpS3VDigY3TowmfiEdpKDuZyckWTEMtpU4K5LkMRLPCZjahtBElgKwSeEqC66xK8
 yICPhdtn04eXYsGbqUYAwWX61ymGKufrmVCFO5vR4DOrx2+3LeOLNsk+kXueuRcqUcDL
 aAT6vdAElFQhEvib5eAoctgpb6t+B5DWq9x+okw9CggdTFJ1PIyU4eOwOl5pxbyMCaCs
 ihy05O/fkTh8SiIM44cz2qPqaa6SZp08sdTijVGsFMgDKooqogQD+hziFejKWHBI7Bmo
 8eSv0t5Gr3EAYMDDvlrZLSsxMXiKgqszYYT4JwK46ULoXOk8djb2+wl4vM+TYwUhc3Jd
 0W+w==
X-Gm-Message-State: ANhLgQ03IuiIXRsP7Vlkt9Q9rgYa/JytRaqqE3ktAfxkn3Bcm9dhIMuf
 iy72HOXdYtW1GwKLxWmxrZHfE1FNQ3lH
X-Google-Smtp-Source: ADFU+vtIdSBAQ/U0X6peaC3aYMgqWZSFYK7uWpMZKYsfO/SGNw2kHtAhYM7t3936cdiRunMRrME0efqVEQLM
X-Received: by 2002:a17:90b:4010:: with SMTP id
 ie16mr190054pjb.185.1583798784825; 
 Mon, 09 Mar 2020 17:06:24 -0700 (PDT)
Date: Mon,  9 Mar 2020 17:06:14 -0700
In-Reply-To: <20200310000617.20662-1-rajatja@google.com>
Message-Id: <20200310000617.20662-2-rajatja@google.com>
Mime-Version: 1.0
References: <20200310000617.20662-1-rajatja@google.com>
X-Mailer: git-send-email 2.25.1.481.gfbce0eb801-goog
Subject: [PATCH v7 1/4] intel_acpi: Rename drm_dev local variable to dev
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
X-Mailman-Approved-At: Tue, 10 Mar 2020 08:19:05 +0000
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
