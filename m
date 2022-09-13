Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7E15B64BA
	for <lists+dri-devel@lfdr.de>; Tue, 13 Sep 2022 02:58:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB6D610E4AC;
	Tue, 13 Sep 2022 00:58:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CBDF10E3A0;
 Tue, 13 Sep 2022 00:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663030679; x=1694566679;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=O/Bqo0dDXwIrDqTzmNoW54NOn8kIhC/lbYb7+ZtzTSU=;
 b=V2FiYbxawBgn0Uvd7a8lteRVv/xwAHBVUdq2Wb7m0I2Rb0vFPwiyb0ev
 bOomr0ZRggrN4gdwsBwADsFE/mphv3H8Y1WXD168uCtndWk8XmW9ylw+8
 RO6cIIIQ9gyC6MmAL8oJhXyHJnMB5CeIkfkpOFBWFu6WVVKneyYUrdxSS
 ++yRIuytr8UJ9fruK1T4z7hISxOjnDyHwtV8n8N1ESJN7katUo6X7Fv31
 XPmUCysnPX5/DApCSB9r3INsAPoILyi+hI0buF9H8o5QaLU7IuYZyLENl
 fgwUIWAbPyUIWzMOT/rQGrWfPPAvkmgp5V3GZKiaL7noiCasCTPS2GR4V Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10468"; a="281024401"
X-IronPort-AV: E=Sophos;i="5.93,311,1654585200"; d="scan'208";a="281024401"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2022 17:57:58 -0700
X-IronPort-AV: E=Sophos;i="5.93,311,1654585200"; d="scan'208";a="758593524"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2022 17:57:58 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v5 03/15] mei: adjust extended header kdocs
Date: Mon, 12 Sep 2022 17:57:27 -0700
Message-Id: <20220913005739.798337-4-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220913005739.798337-1-daniele.ceraolospurio@intel.com>
References: <20220913005739.798337-1-daniele.ceraolospurio@intel.com>
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Tomas Winkler <tomas.winkler@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tomas Winkler <tomas.winkler@intel.com>

Fix kdoc for struct mei_ext_hdr and mei_ext_begin().

Signed-off-by: Tomas Winkler <tomas.winkler@intel.com>
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
V4: New in the series
V5: Rebase

 drivers/misc/mei/hw.h | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/misc/mei/hw.h b/drivers/misc/mei/hw.h
index 70d405c67f0e..319418ddf4fb 100644
--- a/drivers/misc/mei/hw.h
+++ b/drivers/misc/mei/hw.h
@@ -247,8 +247,7 @@ enum mei_ext_hdr_type {
  * struct mei_ext_hdr - extend header descriptor (TLV)
  * @type: enum mei_ext_hdr_type
  * @length: length excluding descriptor
- * @ext_payload: payload of the specific extended header
- * @hdr: place holder for actual header
+ * @data: the extended header payload
  */
 struct mei_ext_hdr {
 	u8 type;
@@ -287,12 +286,11 @@ struct mei_ext_hdr_vtag {
  * Extended header iterator functions
  */
 /**
- * mei_ext_hdr - extended header iterator begin
+ * mei_ext_begin - extended header iterator begin
  *
  * @meta: meta header of the extended header list
  *
- * Return:
- *     The first extended header
+ * Return: The first extended header
  */
 static inline struct mei_ext_hdr *mei_ext_begin(struct mei_ext_meta_hdr *meta)
 {
-- 
2.37.2

