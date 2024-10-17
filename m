Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA429A1965
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2024 05:42:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACC8310E790;
	Thu, 17 Oct 2024 03:41:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=uniontech.com header.i=@uniontech.com header.b="e/OX4j3l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpbgbr1.qq.com (smtpbgbr1.qq.com [54.207.19.206])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93AFB10E790
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2024 03:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
 s=onoh2408; t=1729136462;
 bh=RC2PbTe+FDm7zLc+8APOYm4+AzjmOpO3efPzB4XXvWM=;
 h=From:To:Subject:Date:Message-ID:MIME-Version;
 b=e/OX4j3lb122VzmkBRoA4OfJOBK1O2/aYUBoBuIFwiCehFduumxPQoY0qzRiP8Mrx
 cGCiCDqqf5pKsnWGXp0RnyvkU+4PmEqqEgVolJlXxlJO7ubVluv8bH7WAUP0JKYdyV
 QebD3XsLrobX1mwHzl6IVhULHuGhUaFa6oBFVkao=
X-QQ-mid: bizesmtpsz5t1729136426txbi37g
X-QQ-Originating-IP: 7TxsSelKf0dMgeMEChKRtZqHq7GfN6ly+pDP2DMneNw=
Received: from localhost.localdomain ( [113.57.152.160])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Thu, 17 Oct 2024 11:40:25 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 4008574617543499355
From: WangYuli <wangyuli@uniontech.com>
To: helen.koike@collabora.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, wangyuli@uniontech.com, david.heidelberg@collabora.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 guanwentao@uniontech.com, zhanjun@uniontech.com
Subject: [RESEND. PATCH 5/5] drm/ci: Upgrade certifi requirement to 2024.07.04
Date: Thu, 17 Oct 2024 11:39:52 +0800
Message-ID: <DDEA395AF9015F5F+20241017034004.113456-5-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241017034004.113456-1-wangyuli@uniontech.com>
References: <20241017034004.113456-1-wangyuli@uniontech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpsz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: Nwz8Cs33/Lpr8t5cDPma9YzNfP0jHpxsqyP3CJmidkZkevrV5JdfSJIj
 V6GQxc4uN0bqtGzZqaCXoj6esyUm4I6OVAxCnvLIHQxkqF40uvMyXluGBtrnJZXiMhNL858
 mEQN4ABmz73KnOOw8it8buUYBSU9cAq3fXP3NQbA7FdKoqBg1pcx7t7DicK0AUBdz+rJmaw
 sJurKDxljBfHWQwCQi+zCOhypzW9XBsZ5vlM2/D24VIA+lsQRFfZPABN5V8Z5j6LnY72eMF
 hgqmqJa+YkUU/JZBCEg16WcA8q3DmDYCtCCKljmlp3B5lEjgghsTrTiaa5jzlCemgK92nc6
 YUbdnoIcDQE3cFMDkU/ZRYe0oDSVADZt5kEnJQ9YIurhiJ1EETpdWLNC7VwMmzb//dQ8vgt
 zPacKmxPbyFg604ZIdVUUB3c1ZK4qOv4MT475ujA2gjcKMhswjG9W4qoqijHryqFUCrCLmq
 M1n0lJi9k22KxstA0waXdA5Bts8TVihdD0eFf72Hm+IfAgXaaNtgZq4555d642rIkssvxk5
 3cTfgCxiZPptoMArNCYuYZCK0j8rue2llg9+EDF0ay0moLuZDz/2dFCf6miwR4tIQFvOkwS
 VrEZEuZWcX9feYr/ilX74fOkxW0zWS8Ff2epuWQyHhzmhY+6c+K0zBRb7SLDxodU7L/26pt
 hbBE7dFc1RldUrVunTnSsWFfaOFWf6olSz83XLIxaQx5NtRjjhuLlpNRHLhyy0joy08dkje
 Ql+/RcVmhl/rnseeBUdmfPjrAes8O2veCPuCH2l223INV9UUxKvfmiWb97+B1QA9eRwCkCl
 HEyZVxNObUoUHZqLSW7JXoj2dWbxFO7OPjgm323FHyvzAQgWl8iQVV62cGkeZzOQ7cJ6NUA
 HiOz+4BiKE0rbBhXuto4nyLpm1qkwFJL/VX/MyI0OIN2E9MM1sVupENJFwpVPzAeLvjypEt
 4tLQITgwQ2AooK9OPGufnA5a9G/6iQ4R4D35duWV0NyRglrMVDzPCJMZ+EWxXTnTWOElwlC
 TwKHT9wilZboep3ghJIOjesObbuO8=
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
X-QQ-RECHKSPAM: 0
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

