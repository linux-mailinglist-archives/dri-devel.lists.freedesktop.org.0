Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5521A17A0E8
	for <lists+dri-devel@lfdr.de>; Thu,  5 Mar 2020 09:14:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D78146EB88;
	Thu,  5 Mar 2020 08:14:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com
 [IPv6:2607:f8b0:4864:20::1049])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 051336E144
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2020 01:19:49 +0000 (UTC)
Received: by mail-pj1-x1049.google.com with SMTP id j21so3867690pjz.0
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Mar 2020 17:19:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=C9EkwJ1gUg61QN8k194CxCHcCIG0/y+uw6Hl1AyDtGU=;
 b=GsDLhkZMIEv9Ej06Re07oGqTUeN2KIqnyE1PyJebG3AiwxrNMzy6cA7FbNZIlcPZ62
 eajxd2DGNBSvUlm0m74/gSau0MwgbU9Ue7JfA58M0/f/tYZNvV8isvsg5q/Bxy5F62Hu
 C1bH7nfhem8ohlZ7trw3kEyFpCS94UQ6n5YXi72iUNj2UQrtOkb61BI//u12W4r+ZeIu
 O5RpEvgOVC+crxEXEpV1OYIYyf9B22fFpLTM7L3ReU+MzdmTlAdbxgHnOuD9QyANIfCk
 y2TNvYBfsu7Si2FCxBBPbHPwT37pOg8Qc5EJEkliy4FWFlmaiUqqqL0XuapXx5qKY/Gy
 amXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=C9EkwJ1gUg61QN8k194CxCHcCIG0/y+uw6Hl1AyDtGU=;
 b=nissJrEVr/nc01lCVGvDrsALtdwUBDWqHH7Bvuj9s+po6yYwuURG9VnT76IiUzvnjl
 wBc2bSgx/MKDvXeGFr4r2JcOKzNEhvpgH5a8Llx560TGD9XZFz5P82Jw1ko4nxq1VJ0F
 xLVlemHdFrlN1W60yuuIFJAO2KCziuN2fRt214eRWtAb45Gkur8+zkymoIRYeGv5aiPg
 YhZwGNRpXAv+2a+IXI7w+yUGwQTzLt8trF8Bjiv55f3VEo/am5+jgwikTj8P8TZhGCfs
 5VPiIGlPLcDS7cr+QNITQUX9vfd/+svdkAbJY5pZSWEpGjuRfybzv3Us4gAHF1wdZGIx
 vFNg==
X-Gm-Message-State: ANhLgQ10mQzH7IvRQjYRn0Tuvl7OPxLnm+RTa7eLQysk3fGvwmWtIjuS
 2E6HIXRTz+RFpVt3mD2dWiF6FSspJvnN
X-Google-Smtp-Source: ADFU+vtK9ayimG+QWi91+mM6FMKWb3R87v0c84ZF0OEt7KbKfhUlWJrA5oGjJks6ePvEpIzXnBMKqRiQwMwF
X-Received: by 2002:a63:5713:: with SMTP id l19mr5168665pgb.216.1583371189438; 
 Wed, 04 Mar 2020 17:19:49 -0800 (PST)
Date: Wed,  4 Mar 2020 17:19:41 -0800
Message-Id: <20200305011943.214146-1-rajatja@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
Subject: [PATCH v6 1/3] intel_acpi: Rename drm_dev local variable to dev
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
X-Mailman-Approved-At: Thu, 05 Mar 2020 08:14:30 +0000
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
Cc: Rajat Jain <rajatja@google.com>, rajatxjain@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Change the struct drm_device * local variable from drm_dev to dev
per the feedback received here:
https://lkml.org/lkml/2020/1/24/1143

Signed-off-by: Rajat Jain <rajatja@google.com>
---
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
2.25.0.265.gbab2e86ba0-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
