Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3EA5B2AF4
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 02:17:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2B5610E879;
	Fri,  9 Sep 2022 00:16:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 289E410E878;
 Fri,  9 Sep 2022 00:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662682605; x=1694218605;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Nq8dGQZHfPMbQB28MSle//+e806u/pQtkzpwR0PP57w=;
 b=HJmPKjVXv1fyUdTxeku+stqw5Y2/HHyKIljHJFDJBJf+pUDi11EnU0Z6
 5dXr45vnN0pHlmFhEOGYkHFhIXQMVpvU5f5zsStz7kxrtJ6FhzDK6QN1h
 wNssCZrEQKzMcRqBbSxvODI7fAw7stZARwy0J+WBsDVzneF8/jJex0m2Y
 fGBe+1VoD88wxJYtZDZmwRKdZYFjR2zoly0/Vx+ouhj6aq0c0x/Fhngyz
 NG6SjO4hM99kgCVTRJXVjS61dUaW5RcynNIloPNW4+C9RiKdZIzgYZssW
 /ehAns4RvAMFG7mEAOUglCkJL9QPnVJrIgIQiOC4hmxxSO82T6z4t60jv Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10464"; a="294938831"
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; d="scan'208";a="294938831"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2022 17:16:37 -0700
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; d="scan'208";a="676933182"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2022 17:16:37 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v4 03/15] mei: adjust extended header kdocs
Date: Thu,  8 Sep 2022 17:16:00 -0700
Message-Id: <20220909001612.728451-4-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220909001612.728451-1-daniele.ceraolospurio@intel.com>
References: <20220909001612.728451-1-daniele.ceraolospurio@intel.com>
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

V4: New in the series

Signed-off-by: Tomas Winkler <tomas.winkler@intel.com>
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/misc/mei/hw.h | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/misc/mei/hw.h b/drivers/misc/mei/hw.h
index 14f89d96216b..25bfdd28cf3f 100644
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

