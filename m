Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0055C97BCCA
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2024 15:08:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D2CC10E595;
	Wed, 18 Sep 2024 13:08:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=uniontech.com header.i=@uniontech.com header.b="dt4o1wiU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bg5.exmail.qq.com (bg5.exmail.qq.com [43.154.155.102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC7F010E589
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Sep 2024 13:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
 s=onoh2408; t=1726664867;
 bh=+/DdLbFCN3x83oxAHHqnPnAEM1hgWNumW7T/6E5yt74=;
 h=From:To:Subject:Date:Message-ID:MIME-Version;
 b=dt4o1wiUhZ3tWMnpE72tXyCgQjdO3z+Yl4QkqXCPMDEtbk9olTy1zbCbe3teOkefV
 LreOeOEwqCTHyDS/yZvDqr2tQA3PE/Jc/Y2UQi2+48NOd/xEYV2cv+f3qJJf2TAi7d
 u8vNliUuDq+vk9S7ViH1nacWgtger01oREJi7b7Q=
X-QQ-mid: bizesmtp89t1726664860t19rzamf
X-QQ-Originating-IP: 2zu9pDuYwD3Ysa5lHmxqXSm3b9oArIDcCu9nUlMvo/o=
Received: from localhost.localdomain ( [113.57.152.160])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Wed, 18 Sep 2024 21:07:39 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 14238727235013610136
From: WangYuli <wangyuli@uniontech.com>
To: helen.koike@collabora.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, wangyuli@uniontech.com, david.heidelberg@collabora.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 guanwentao@uniontech.com, zhanjun@uniontech.com
Subject: [PATCH 2/4] drm/ci: Upgrade requests requirement to 2.32.0
Date: Wed, 18 Sep 2024 21:06:41 +0800
Message-ID: <DDD9CA844EBE782F+20240918130725.448656-3-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240918130725.448656-1-wangyuli@uniontech.com>
References: <20240918130725.448656-1-wangyuli@uniontech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
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

GitHub Dependabot has issued the following alert:

"build(deps): bump requests from 2.31.0 to 2.32.2 in
 /drivers/gpu/drm/ci/xfails.

 When making requests through a Requests Session, if the first
 request is made with verify=False to disable cert verification,
 all subsequent requests to the same origin will continue to ignore
 cert verification regardless of changes to the value of verify.
 This behavior will continue for the lifecycle of the connection in
 the connection pool.

 Severity: 5.6 / 10 (Moderate)
 Attack vector:          Local
 Attack complexity:       High
 Privileges required:     High
 User interaction:    Required
 Scope:              Unchanged
 Confidentiality:         High
 Integrity:               High
 Availability:            None
 CVE ID:        CVE-2024-35195"

To avoid disturbing everyone with the kernel repo hosted on GitHub,
I suggest we upgrade our python dependencies once again to appease
GitHub Dependabot.

Link: https://github.com/dependabot
Link: https://github.com/psf/requests/pull/6655
Signed-off-by: WangYuli <wangyuli@uniontech.com>
---
 drivers/gpu/drm/ci/xfails/requirements.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ci/xfails/requirements.txt b/drivers/gpu/drm/ci/xfails/requirements.txt
index 2fae1299e07b..f69b58356a37 100644
--- a/drivers/gpu/drm/ci/xfails/requirements.txt
+++ b/drivers/gpu/drm/ci/xfails/requirements.txt
@@ -7,7 +7,7 @@ charset-normalizer==3.2.0
 idna==3.4
 pip==23.3
 python-gitlab==3.15.0
-requests==2.31.0
+requests==2.32.0
 requests-toolbelt==1.0.0
 ruamel.yaml==0.17.32
 ruamel.yaml.clib==0.2.7
-- 
2.45.2

