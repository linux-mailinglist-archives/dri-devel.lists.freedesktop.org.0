Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4BFC4B07CE
	for <lists+dri-devel@lfdr.de>; Thu, 10 Feb 2022 09:10:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85E6810E74A;
	Thu, 10 Feb 2022 08:10:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1DF310E468
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 18:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1644433072; x=1675969072;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=blQ5+6q/LUbVLtrZhxoQdICeLoyj5HXqRvqkBFLbaVU=;
 b=oiXmZMJ7f/M8OdiK57S1jkbQoWo/JukvsNIN20QOFN+KlNvsOriGiIA2
 7nc1hj8V+ZO8fseAVIKy/smmd9xAG1rzN5QUPtWrVRJ+OhnVhq8xNsx/9
 3o7d1bK2eZiZQM1PnwlOLX72T+gcWHQdY1Y5/6kN51oTYidTMHyr2c58s o=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 09 Feb 2022 10:57:52 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2022 10:57:52 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Wed, 9 Feb 2022 10:57:51 -0800
Received: from jhugo-lnx.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Wed, 9 Feb 2022 10:57:50 -0800
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
To: <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <corbet@lwn.net>
Subject: [PATCH] drm/doc: Clarify what ioctls can be used on render nodes
Date: Wed, 9 Feb 2022 11:57:27 -0700
Message-ID: <1644433047-20753-1-git-send-email-quic_jhugo@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-Mailman-Approved-At: Thu, 10 Feb 2022 08:10:20 +0000
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
Cc: Jeffrey Hugo <quic_jhugo@quicinc.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The documentation for render nodes indicates that only "PRIME-related"
ioctls are valid on render nodes, but the documentation does not clarify
what that means.  If the reader is not familiar with PRIME, they may
beleive this to be only the ioctls with "PRIME" in the name and not other
ioctls such as set of syncobj ioctls.  Clarify the situation for the
reader by referencing where the reader will find a current list of valid
ioctls.

Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
---

I was confused by this when reading the documentation.  Now that I have
figured out what the documentation means, I would like to add a clarification
for the next reader which would have helped me.

 Documentation/gpu/drm-uapi.rst | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
index 199afb5..ce47b42 100644
--- a/Documentation/gpu/drm-uapi.rst
+++ b/Documentation/gpu/drm-uapi.rst
@@ -148,7 +148,9 @@ clients together with the legacy drmAuth authentication procedure.
 If a driver advertises render node support, DRM core will create a
 separate render node called renderD<num>. There will be one render node
 per device. No ioctls except PRIME-related ioctls will be allowed on
-this node. Especially GEM_OPEN will be explicitly prohibited. Render
+this node. Especially GEM_OPEN will be explicitly prohibited. For a
+complete list of driver-independent ioctls that can be used on render
+nodes, see the ioctls marked DRM_RENDER_ALLOW in drm_ioctl.c  Render
 nodes are designed to avoid the buffer-leaks, which occur if clients
 guess the flink names or mmap offsets on the legacy interface.
 Additionally to this basic interface, drivers must mark their
-- 
2.7.4

