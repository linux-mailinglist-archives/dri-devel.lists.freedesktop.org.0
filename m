Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AED069337B6
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2024 09:19:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCDAE10E985;
	Wed, 17 Jul 2024 07:19:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bg5.exmail.qq.com (bg5.exmail.qq.com [43.154.209.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EBCE10E5CF
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2024 08:40:34 +0000 (UTC)
X-QQ-mid: bizesmtpsz6t1721119067t1j4fc5
X-QQ-Originating-IP: BT+kcmN9uYv2QkdoMKC/3l/74MbZXXmtA9kVUJ2qgqI=
Received: from localhost.localdomain ( [113.57.152.160])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Tue, 16 Jul 2024 16:37:45 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 1197825335289385382
From: WangYuli <wangyuli@uniontech.com>
To: helen.koike@collabora.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, david.heidelberg@collabora.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 vignesh.raman@collabora.com, torvalds@linux-foundation.org,
 guanwentao@uniontech.com, WangYuli <wangyuli@uniontech.com>
Subject: [PATCH] drm/ci: Upgrade setuptools requirement to 70.0.0
Date: Tue, 16 Jul 2024 16:37:43 +0800
Message-ID: <0237854884D6DB3C+20240716083743.33415-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.43.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpsz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-Mailman-Approved-At: Wed, 17 Jul 2024 07:19:25 +0000
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

"Upgrade setuptools to version 70.0.0 or later.

 A vulnerability in the package_index module of pypa/setuptools
 versions up to 69.1.1 allows for remote code execution via its
 download functions. These functions, which are used to download
 packages from URLs provided by users or retrieved from package
 index servers, are susceptible to code injection. If these
 functions are exposed to user-controlled inputs, such as package
 URLs, they can execute arbitrary commands on the system. The
 issue is fixed in version 70.0.

 Severity: 8.8 / 10 (High)
 Attack vector:        Network
 Attack complexity:        Low
 Privileges required:     None
 User interaction:    Required
 Scope:              Unchanged
 Confidentiality:         High
 Integrity:               High
 Availability:            High
 CVE ID:         CVE-2024-6345"

To avoid disturbing everyone with the kernel repo hosted on GitHub,
I suggest we upgrade our python dependencies once again to appease
GitHub Dependabot.

Link: https://github.com/dependabot
Signed-off-by: WangYuli <wangyuli@uniontech.com>
---
 drivers/gpu/drm/ci/xfails/requirements.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ci/xfails/requirements.txt b/drivers/gpu/drm/ci/xfails/requirements.txt
index e9994c9db799..5e6d48d98e4e 100644
--- a/drivers/gpu/drm/ci/xfails/requirements.txt
+++ b/drivers/gpu/drm/ci/xfails/requirements.txt
@@ -11,7 +11,7 @@ requests==2.31.0
 requests-toolbelt==1.0.0
 ruamel.yaml==0.17.32
 ruamel.yaml.clib==0.2.7
-setuptools==68.0.0
+setuptools==70.0.0
 tenacity==8.2.3
 urllib3==2.0.7
 wheel==0.41.1
-- 
2.43.4


