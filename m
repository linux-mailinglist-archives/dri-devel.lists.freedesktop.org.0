Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 029E727EA0A
	for <lists+dri-devel@lfdr.de>; Wed, 30 Sep 2020 15:35:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0253089CB8;
	Wed, 30 Sep 2020 13:35:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4335689B65
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Sep 2020 13:35:31 +0000 (UTC)
Received: from mail.kernel.org (unknown [95.90.213.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 85AD0221EC;
 Wed, 30 Sep 2020 13:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601472320;
 bh=pYfN+ieQDEUX+k8Yfc6bcFKKurTB/rbuEY6mHTD/h2g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CMuLT/JDOHCnRn6h9cTT+zryRTbRTftIjSwvS6kkH7Fr3ZpdrM69pE8T6P6qMZfpO
 p7mB49kXxyVtfLjx9e0xryn7JdPUU8xjPnJlJF5Mhjt/K10hLHjCbZkuaAFHaZVrpx
 Vy42sPJvQzXxM4QdaxNi6DYwjyo/+E5699PnLNro=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
 (envelope-from <mchehab@kernel.org>)
 id 1kNc6g-001XJh-Jv; Wed, 30 Sep 2020 15:25:18 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH v4 20/52] drm: drm_dsc.h: fix a kernel-doc markup
Date: Wed, 30 Sep 2020 15:24:43 +0200
Message-Id: <3d467022325e15bba8dcb13da8fb730099303266.1601467849.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601467849.git.mchehab+huawei@kernel.org>
References: <cover.1601467849.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-kernel@vger.kernel.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As warned by Sphinx:

	./Documentation/gpu/drm-kms-helpers:305: ./include/drm/drm_dsc.h:587: WARNING: Unparseable C cross-reference: 'struct'
	Invalid C declaration: Expected identifier in nested name, got keyword: struct [error at 6]
	  struct
	  ------^

The markup for one struct is wrong, as struct is used twice.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 include/drm/drm_dsc.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/drm/drm_dsc.h b/include/drm/drm_dsc.h
index 887954cbfc60..732f32740c86 100644
--- a/include/drm/drm_dsc.h
+++ b/include/drm/drm_dsc.h
@@ -588,7 +588,7 @@ struct drm_dsc_picture_parameter_set {
  * This structure represents the DSC PPS infoframe required to send the Picture
  * Parameter Set metadata required before enabling VESA Display Stream
  * Compression. This is based on the DP Secondary Data Packet structure and
- * comprises of SDP Header as defined &struct struct dp_sdp_header in drm_dp_helper.h
+ * comprises of SDP Header as defined &struct dp_sdp_header in drm_dp_helper.h
  * and PPS payload defined in &struct drm_dsc_picture_parameter_set.
  *
  * @pps_header: Header for PPS as per DP SDP header format of type
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
