Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8188E97BCC9
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2024 15:08:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AB5810E58B;
	Wed, 18 Sep 2024 13:08:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=uniontech.com header.i=@uniontech.com header.b="Z3SW64OM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bg5.exmail.qq.com (bg5.exmail.qq.com [43.154.209.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C564310E58B
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Sep 2024 13:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
 s=onoh2408; t=1726664862;
 bh=/TNrOWNbUPEthzfhqHJKmziu43+uHykeH5RpYdRgBZo=;
 h=From:To:Subject:Date:Message-ID:MIME-Version;
 b=Z3SW64OMOBtGfqzLUy6I5lTreJeqQ0EsebeegI39D5OuC7FgVtgcM6gfLPynlcbiC
 Y0CrGsEuIWojJ5hNCwK3udoHUv2jSBn2NNXoqzK3TAtvnLjxfGIrLC9PxNRRG6eLbT
 btq08wtlqulH7pDoFxZfKX+LBgvQlIq8i+rlyx74=
X-QQ-mid: bizesmtp89t1726664856tpxoq0ub
X-QQ-Originating-IP: TcS6ew3UVzNulMyjCAog1ndwGNkkrzCS8uXs46wt2io=
Received: from localhost.localdomain ( [113.57.152.160])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Wed, 18 Sep 2024 21:07:35 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 13190950233677462238
From: WangYuli <wangyuli@uniontech.com>
To: helen.koike@collabora.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, wangyuli@uniontech.com, david.heidelberg@collabora.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 guanwentao@uniontech.com, zhanjun@uniontech.com
Subject: [PATCH 1/4] drm/ci: Upgrade urllib3 requirement to 2.2.2
Date: Wed, 18 Sep 2024 21:06:40 +0800
Message-ID: <AE44DC1999A1FDF9+20240918130725.448656-2-wangyuli@uniontech.com>
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

"build(deps): bump urllib3 from 2.0.7 to 2.2.2 in
 /drivers/gpu/drm/ci/xfails.

 When using urllib3's proxy support with, the header is only sent
 to the configured proxy, as expected.

 However, when sending HTTP requests without using urllib3's proxy
 support, it's possible to accidentally configure the header even
 though it won't have any effect as the request is not using a
 forwarding proxy or a tunneling proxy. In those cases, urllib3
 doesn't treat the HTTP header as one carrying authentication
 material and thus doesn't strip the header on cross-origin redirects.

 Because this is a highly unlikely scenario, we believe the severity
 of this vulnerability is low for almost all users. Out of an
 abundance of caution urllib3 will automatically strip the header
 during cross-origin redirects to avoid the small chance that users
 are doing this on accident.

 Users should use urllib3's proxy support or disable automatic
 redirects to achieve safe processing of the header, but we still
 decided to strip the header by default in order to further protect
 users who aren't using the correct approach.

 Severity: 4.4 / 10 (Moderate)
 Attack vector:        Network
 Attack complexity:       High
 Privileges required:     High
 User interaction:        None
 Scope:              Unchanged
 Confidentiality:         High
 Integrity:               None
 Availability:            None
 CVE ID:        CVE-2024-37891"

To avoid disturbing everyone with the kernel repo hosted on GitHub,
I suggest we upgrade our python dependencies once again to appease
GitHub Dependabot.

Link: https://github.com/dependabot
Signed-off-by: WangYuli <wangyuli@uniontech.com>
---
 drivers/gpu/drm/ci/xfails/requirements.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ci/xfails/requirements.txt b/drivers/gpu/drm/ci/xfails/requirements.txt
index 5e6d48d98e4e..2fae1299e07b 100644
--- a/drivers/gpu/drm/ci/xfails/requirements.txt
+++ b/drivers/gpu/drm/ci/xfails/requirements.txt
@@ -13,5 +13,5 @@ ruamel.yaml==0.17.32
 ruamel.yaml.clib==0.2.7
 setuptools==70.0.0
 tenacity==8.2.3
-urllib3==2.0.7
+urllib3==2.2.2
 wheel==0.41.1
-- 
2.45.2

