Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA4AC97BCC8
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2024 15:08:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 238C710E08E;
	Wed, 18 Sep 2024 13:08:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=uniontech.com header.i=@uniontech.com header.b="FzBdbOii";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpbgbr2.qq.com (smtpbgbr2.qq.com [54.207.22.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C120910E08E
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Sep 2024 13:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
 s=onoh2408; t=1726664874;
 bh=RC2PbTe+FDm7zLc+8APOYm4+AzjmOpO3efPzB4XXvWM=;
 h=From:To:Subject:Date:Message-ID:MIME-Version;
 b=FzBdbOiilkJwj0ApJOLj95MVze6c/rgUs3RyXYHpBsKE79oFMU0d1adYkLSrQQYfv
 abDrsXeyn1cs52N2zpOfNLvJg1wQIXQgmhJ6GvevdzsQtvvBkVnMUdsv+25+1aT3hB
 rZMdXtQ8v72xs2FqrIfaaQPidpdaovPVY5SbkMbo=
X-QQ-mid: bizesmtp89t1726664868tv5pwabb
X-QQ-Originating-IP: 9lq6EIop9cgRFN5fQlSY/DQxz5cESd8ppts3gi20zuk=
Received: from localhost.localdomain ( [113.57.152.160])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Wed, 18 Sep 2024 21:07:47 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 5552265885235446597
From: WangYuli <wangyuli@uniontech.com>
To: helen.koike@collabora.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, wangyuli@uniontech.com, david.heidelberg@collabora.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 guanwentao@uniontech.com, zhanjun@uniontech.com
Subject: [PATCH 4/4] drm/ci: Upgrade certifi requirement to 2024.07.04
Date: Wed, 18 Sep 2024 21:06:43 +0800
Message-ID: <EE4F19CBA2D3EB87+20240918130725.448656-5-wangyuli@uniontech.com>
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

"build(deps): bump certifi from 2023.7.22 to 2024.7.4 in
 /drivers/gpu/drm/ci/xfails.

 Certifi 2024.07.04 removes root certificates from "GLOBALTRUST"
 from the root store. These are in the process of being removed from
 Mozilla's trust store.

 GLOBALTRUST's root certificates are being removed pursuant to an
 investigation which identified "long-running and unresolved compliance
 issues".

 Severity:          Low
 CVE ID: CVE-2024-39689"

To avoid disturbing everyone with the kernel repo hosted on GitHub,
I suggest we upgrade our python dependencies once again to appease
GitHub Dependabot.

Link: https://github.com/dependabot
Link: https://groups.google.com/a/mozilla.org/g/dev-security-policy/c/XpknYMPO8dI
Signed-off-by: WangYuli <wangyuli@uniontech.com>
---
 drivers/gpu/drm/ci/xfails/requirements.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ci/xfails/requirements.txt b/drivers/gpu/drm/ci/xfails/requirements.txt
index 8b2b1fa16614..4f7ac688d448 100644
--- a/drivers/gpu/drm/ci/xfails/requirements.txt
+++ b/drivers/gpu/drm/ci/xfails/requirements.txt
@@ -2,7 +2,7 @@ git+https://gitlab.freedesktop.org/gfx-ci/ci-collate@09e7142715c16f54344ddf97013
 termcolor==2.3.0
 
 # ci-collate dependencies
-certifi==2023.7.22
+certifi==2024.07.04
 charset-normalizer==3.2.0
 idna==3.7
 pip==23.3
-- 
2.45.2

