Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC5397BCCE
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2024 15:08:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D61310E23F;
	Wed, 18 Sep 2024 13:08:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=uniontech.com header.i=@uniontech.com header.b="SHSCL48I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bg5.exmail.qq.com (bg5.exmail.qq.com [43.154.209.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF88A10E23F
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Sep 2024 13:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
 s=onoh2408; t=1726664871;
 bh=78SgngBKZBmCahApQZmS491yViuhV7ff/MsyOqzu+jA=;
 h=From:To:Subject:Date:Message-ID:MIME-Version;
 b=SHSCL48I4fry0KXYLwQ6IBGUMO4NOYcvtMj6nuhsaxANm7vWlD13HyUIOXILaiNSE
 0to+8+BDaTeCkQ6BZv/7sKFIQJBM+RH134Xhg6eF/518eY+Whw/36p5BqWsc0raeLK
 ExJ4Jg90+QjGrgxT1ApYD6XkZHIDpTsj7U33d4YE=
X-QQ-mid: bizesmtp89t1726664864tqxrduuz
X-QQ-Originating-IP: iStDSal+XfZLIbLXnFqWfb3b+vIvkE4Fj6sizXbwNow=
Received: from localhost.localdomain ( [113.57.152.160])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Wed, 18 Sep 2024 21:07:43 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 880936769017630702
From: WangYuli <wangyuli@uniontech.com>
To: helen.koike@collabora.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, wangyuli@uniontech.com, david.heidelberg@collabora.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 guanwentao@uniontech.com, zhanjun@uniontech.com
Subject: [PATCH 3/4] drm/ci: Upgrade idna requirement to 3.7
Date: Wed, 18 Sep 2024 21:06:42 +0800
Message-ID: <72EEE7B8B5E98035+20240918130725.448656-4-wangyuli@uniontech.com>
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

"build(deps): bump idna from 3.4 to 3.7 in /drivers/gpu/drm/ci/xfails.

 A specially crafted argument to the function could consume
 significant resources. This may lead to a denial-of-service.

 The function has been refined to reject such strings without the
 associated resource consumption in version 3.7.

 Severity: 6.9 / 10 (Moderate)
 Attack vector:          Local
 Attack complexity:        Low
 Attack Requirements:     None
 Privileges required:     None
 User interaction:        None
 Confidentiality:         None
 Integrity:               None
 Availability:            High
 CVE ID:         CVE-2024-3651"

To avoid disturbing everyone with the kernel repo hosted on GitHub,
I suggest we upgrade our python dependencies once again to appease
GitHub Dependabot.

Link: https://github.com/dependabot
Link: https://huntr.com/bounties/93d78d07-d791-4b39-a845-cbfabc44aadb
Signed-off-by: WangYuli <wangyuli@uniontech.com>
---
 drivers/gpu/drm/ci/xfails/requirements.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ci/xfails/requirements.txt b/drivers/gpu/drm/ci/xfails/requirements.txt
index f69b58356a37..8b2b1fa16614 100644
--- a/drivers/gpu/drm/ci/xfails/requirements.txt
+++ b/drivers/gpu/drm/ci/xfails/requirements.txt
@@ -4,7 +4,7 @@ termcolor==2.3.0
 # ci-collate dependencies
 certifi==2023.7.22
 charset-normalizer==3.2.0
-idna==3.4
+idna==3.7
 pip==23.3
 python-gitlab==3.15.0
 requests==2.32.0
-- 
2.45.2

