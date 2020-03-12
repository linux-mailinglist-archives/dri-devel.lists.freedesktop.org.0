Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5761B182ADE
	for <lists+dri-devel@lfdr.de>; Thu, 12 Mar 2020 09:11:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96E6B6EA77;
	Thu, 12 Mar 2020 08:09:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x949.google.com (mail-ua1-x949.google.com
 [IPv6:2607:f8b0:4864:20::949])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1A206E9F2
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Mar 2020 00:57:31 +0000 (UTC)
Received: by mail-ua1-x949.google.com with SMTP id m16so610459uao.19
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Mar 2020 17:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=zfQL1NufXJXKszWu72jE1H3reXD9X3Cw+0IUbEiABbs=;
 b=bT1CrWbV4OeJpGXX03s+OUjA04G+CjGZX2Tf3a3Uc+hxyENfPUI+C5i/B3FF5a9Cwc
 KUXD8rZSh+N82h8RwgutzToHhe2EW0u3Cl24Fy4uDwxSGZn5xQ1ffJ7Wf83wi1GHWAQk
 Wrseo8utA4nuxC0luM2akfn665xHAB9f10uuUc9f7Mzsi0Hc+vT8w8fp1ecaKUJBCDae
 ZgyNCq8WxyiiD8e/bmHFSWLCmqyUhdJRXe6xAvu5mxI2vSCcPQDZ7aUevFVjhRvBdStg
 1tGQSxOewrQmYz+mdiT4w5beVHsK3h1XiLqXRCXLA4T1xx0UU0wYqzjL/BUx3oudUkWz
 bQNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=zfQL1NufXJXKszWu72jE1H3reXD9X3Cw+0IUbEiABbs=;
 b=TBbPtCZpjfrjmbnqJ3+xHcrfeBCoSmR5UrV2RXlsNLkLOpZCurCQVdFepzJ8YAFa25
 W5UYEYbbGaaXteVrBQO3Q1CBRjjivk5yFI+w3jQEY/Y4+C3s+0fkCBRBASxR+/clbrjd
 9vrA53JjCKae0nqvBeE2G+4BU0hPHa/TMRR9TP6iosSRprZ1iTgGtOeuUvYVpPIjYYbS
 Cx/puDztDNwKU9OzVxVHfbrYG5Qvt7eLqH+UnAVln2gLaoHH1qhCis41KNAZ7c1kpFbR
 oj7oviS4wsoBDoGgjWyJUXNidaJwo1D3VLjcAOYBDjgQ1F0h0496/LVjqOZ9uYyYb0cs
 uG1Q==
X-Gm-Message-State: ANhLgQ3YIsZjaq+FLQnhm4gWDnYU+OgawpN0G9tye17/YeiKGb0T/7sM
 jaVo6l3QwMNFyOf7AfHFDLblt9QC2yRs
X-Google-Smtp-Source: ADFU+vudXPpltJWf5kCHaXEyXnesLFR5gJzoEWgqDEP7sXpXeSYgwHh/qrrl5VAWvaMLl86pkFonQ4bkM/3U
X-Received: by 2002:a67:7dd0:: with SMTP id y199mr3632675vsc.158.1583974650664; 
 Wed, 11 Mar 2020 17:57:30 -0700 (PDT)
Date: Wed, 11 Mar 2020 17:57:18 -0700
In-Reply-To: <20200312005722.48803-1-rajatja@google.com>
Message-Id: <20200312005722.48803-2-rajatja@google.com>
Mime-Version: 1.0
References: <20200312005722.48803-1-rajatja@google.com>
X-Mailer: git-send-email 2.25.1.481.gfbce0eb801-goog
Subject: [PATCH v8 1/5] intel_acpi: Rename drm_dev local variable to dev
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
X-Mailman-Approved-At: Thu, 12 Mar 2020 08:08:13 +0000
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
