Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 202F39A1962
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2024 05:41:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F15F10E2F5;
	Thu, 17 Oct 2024 03:41:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=uniontech.com header.i=@uniontech.com header.b="SvD6ex0M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bg1.exmail.qq.com (bg1.exmail.qq.com [114.132.74.132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17AA410E2F5
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2024 03:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
 s=onoh2408; t=1729136455;
 bh=/TNrOWNbUPEthzfhqHJKmziu43+uHykeH5RpYdRgBZo=;
 h=From:To:Subject:Date:Message-ID:MIME-Version;
 b=SvD6ex0M5IW+A6r0nw4pLv3eVYxYj3WHgK80/DozgCKDEUNb+8XP7lYW4nX6JF90w
 2Q6bqhtCIwLAf+Bh6aVLdMVfk6t+4wbtdxqSkBpKqL0MIaiO08laLRNS+nJrEHH5Qq
 BSFrgYVeYYKYuZBvvf3pS5HQQ/L+SWLyBQUcW0a4=
X-QQ-mid: bizesmtpsz5t1729136414tml4pwk
X-QQ-Originating-IP: KK23v6DESCX+/i0Va+sOnkKrvO+uca82q25Wknc1Hzc=
Received: from localhost.localdomain ( [113.57.152.160])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Thu, 17 Oct 2024 11:40:12 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 17913914486552868709
From: WangYuli <wangyuli@uniontech.com>
To: helen.koike@collabora.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, wangyuli@uniontech.com, david.heidelberg@collabora.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 guanwentao@uniontech.com, zhanjun@uniontech.com
Subject: [RESEND. PATCH 2/5] drm/ci: Upgrade urllib3 requirement to 2.2.2
Date: Thu, 17 Oct 2024 11:39:49 +0800
Message-ID: <BF18622263EEE575+20241017034004.113456-2-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241017034004.113456-1-wangyuli@uniontech.com>
References: <20241017034004.113456-1-wangyuli@uniontech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpsz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: NWTQ68Yg3gczqLNk2+yhNuroKrMwGQaRQm6e+oQJcts6cnXT3TgT2Wtq
 1483Oez39KAaGpvx28VKP2HZLugRXizyP28MtKSvqkSskWMR6ABxY3wCcZPpaHVDHg+AxAU
 VmbElLkvOe1Uq4GPQ6rpCc6XxH2wo5eC9R/QIylDGnspwxQUsJz6lQb9Rqj3p2AikEkOMSm
 nfPStfSSq4ghBGWoaJMah2BJF8NDqRf5KkJEOSIPbfb2f6L17oTo8uPDKNoJ6rG+6aS8w5a
 u+AYCL1as833qsmijDyZst7rmB1ljis03h3zJy36kxkfRde9VIKyYqxPIcp7YBDNpt6en4Z
 tBgAB/O1xeR1k2Iabm6/vE28pSYOIoBaT+fKWRRofmcVfipT+7AN2PPgDd8krPRuWNhia8T
 n+sDELrEU07lZpoNk0QHXlGKCTFKalafalT4IGmTwQ+GPDA9598MrjxqQBhbkhPQzqS++ej
 s97ORI5gwt/CTaqazPFJ43ZeUdKSRc2uYk4glTvEE00GYqtkWV38XXZlWXQmBIiMWv3agA1
 hyfVAB8GjzWLa0uDD73dtzZqWvVAq8IXoMZl6unxvRYoKlXzSzeegulG9ku2zxN992n5vca
 ZCYJAh5F/Kwu983gkSd1Ec4zNoEZnbeDwZA5KSV2ub45AOb85zBHcLYazWlvHhsH6iZFBfx
 +Hk5lzFFB9AiudobvyIS3zl8ic82T5Zl/750bhJhxS93AYef91DPZSXrW56G2Ty/EnNjcbg
 lSC8WMxqza+gKTplABYIvnt7DFzE+bHjD8re0KJIs3xyU1TeFhBnE6BC62zQbD11fOruook
 nnFHHUWfpgl3VQaPluAZrM7jDHqUJTVLh2QOkxE1hwA90u60JkHKIaunT4cUUJpv2ZSEz2d
 9v86PbNebUk+tpOQE0Z1pZWJBqOrrS1Kgz5L8O1iulzSFy7cOpV+VpDFoPseAIkGFvBMaoO
 0k8gri0ayo1Y/Kz7jSFOzGnrvBhYQMdq80aXL9tMTYDUVhhiPhcQBLrGvsLWsuLtL2+pM3j
 CK2X8O1rb8jdFUOyDeP5t541e6A1o=
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
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

