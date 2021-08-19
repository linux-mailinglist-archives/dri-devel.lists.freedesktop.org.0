Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 147733F276E
	for <lists+dri-devel@lfdr.de>; Fri, 20 Aug 2021 09:16:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21AF16EA1A;
	Fri, 20 Aug 2021 07:16:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 600016E895
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 09:31:10 +0000 (UTC)
Received: by mail-pg1-x52c.google.com with SMTP id c17so5341152pgc.0
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 02:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9pbcm30VIAQ9iEVPI1FIF1aW9JXXtwoO9LwunNGqeRE=;
 b=09wWrvfK30WNG/7F1VMP3BxxZS57XFx1OQJ3Z5tyEKf/2aGPGNK1ZUeoZ7V4747zjs
 YcElFnDz1sOUZ2OPk1l+/A8FQGuiTqJ6c+vJhkBaKF9Y6oVOXHteAmYZEFDx/RwmMNBQ
 27IKr2c5DcqXyC2xrcJ2Njg13TnEd5ZM16NBMTB4H5dNHSEKBWzh2Vkx613wPfGCHo8b
 4apARhzg2/el3xDydPwDRMLKQNRt5D+8RBL1Ig9UkiYmqN8XjQfBNtMz7kaUYoaTm89K
 TK0wI4PNuCHGGKM/TR8JN+t4jOXyQm3jp30lX44dbK6MDP2kfpLIsapqeqvNvtzJwWOQ
 EzRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9pbcm30VIAQ9iEVPI1FIF1aW9JXXtwoO9LwunNGqeRE=;
 b=tyMiZzZWZzBkcMtWcuZ493Get4WZJES222uH/w0140+R8fGWFeIV+U1OzyHQDlTguH
 a+pmh/vnByQhcEUstoaBJMcH4o/9xixYF4Cx3WPqBkuQza1q29763i59c3ecgp0fzCn6
 SIqsSdjUlacUedXuITCG4HhW5pHJk9ftkGXzHFrj8b+GiqaWzcVPbBDLOJi4ePnbRUal
 qc2UQ1EgFtNmkmmfK0bSYz4S5u7kZwhCgcBIw0ZPVOV0aSSsnhiqY4fzWgqNFoD5Gvdd
 ZZFuPVHJJtXeGXiVl5R6cwA9oQKkdJUBGm2hAjt9cLbGyrQCpUte5gIbmt2tr/10LJvz
 W3vw==
X-Gm-Message-State: AOAM530E/Y1biBWAr/SQnXCIM7xsqqxZIHOufZww9eZ2vCH0nOePop9a
 goAls8AIun2a92JiiRsr8heCJw==
X-Google-Smtp-Source: ABdhPJxvHLPZaCGYPXAAhDOgP3myf1MA4MpJ0X3o6vpff47Q/EKx61qtG7O67f06yUVso0qKhNbQ8g==
X-Received: by 2002:a63:b91d:: with SMTP id z29mr13182689pge.436.1629365470105; 
 Thu, 19 Aug 2021 02:31:10 -0700 (PDT)
Received: from yc.huaqin.com ([101.78.151.213])
 by smtp.gmail.com with ESMTPSA id 11sm2601031pfl.41.2021.08.19.02.31.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 02:31:09 -0700 (PDT)
From: yangcong <yangcong5@huaqin.corp-partner.google.com>
To: thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie,
 daniel@ffwll.ch, dianders@google.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 yangcong <yangcong5@huaqin.corp-partner.google.com>
Subject: [v1 2/2] dt-bindings: drm/panel: boe-tv101wum-nl6: Support enabling a
 3.3V rail
Date: Thu, 19 Aug 2021 17:29:43 +0800
Message-Id: <20210819092943.719433-3-yangcong5@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210819092943.719433-1-yangcong5@huaqin.corp-partner.google.com>
References: <20210819092943.719433-1-yangcong5@huaqin.corp-partner.google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 20 Aug 2021 07:16:30 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The auo,b101uan08.3 panel (already supported by this driver) has
a 3.3V rail that needs to be turned on. For previous users of
this panel this voltage was directly output by pmic. On a new
user (the not-yet-upstream sc7180-trogdor-mrbland board) we need
to turn the 3.3V rail on.

Signed-off-by: yangcong <yangcong5@huaqin.corp-partner.google.com>
---
 .../devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml   | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml b/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml
index 38bc1d1b511e..e45de7a4360e 100644
--- a/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml
+++ b/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml
@@ -36,6 +36,9 @@ properties:
   pp1800-supply:
     description: core voltage supply
 
+  pp3300-supply:
+    description: core voltage supply
+
   avdd-supply:
     description: phandle of the regulator that provides positive voltage
 
@@ -52,6 +55,7 @@ required:
   - reg
   - enable-gpios
   - pp1800-supply
+  - pp3300-supply
   - avdd-supply
   - avee-supply
 
-- 
2.25.1

