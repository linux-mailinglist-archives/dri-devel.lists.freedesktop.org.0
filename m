Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38FC19A1966
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2024 05:42:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57CBA10E792;
	Thu, 17 Oct 2024 03:41:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=uniontech.com header.i=@uniontech.com header.b="B8AsVGSx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bg5.exmail.qq.com (bg5.exmail.qq.com [43.154.209.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8544510E790
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2024 03:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
 s=onoh2408; t=1729136461;
 bh=78SgngBKZBmCahApQZmS491yViuhV7ff/MsyOqzu+jA=;
 h=From:To:Subject:Date:Message-ID:MIME-Version;
 b=B8AsVGSx0hVuCzU6Ipdz/4Qr9mmGNOKdnZsuYmfQPY21A94FpBmaSjPp5Ane4RUTB
 M8/sMwe8BPubqA5Zfi34+G3aMOJ7v6+eOa+blD0vjS6JczUT5buKyBlYO6LMKHJWEO
 AAXzW/jz2Xm4Qm6zH0DLnEqLxZ2QDkibWEOGE+OU=
X-QQ-mid: bizesmtpsz5t1729136421t6cqswj
X-QQ-Originating-IP: rXPvY4BJUX6p6wMFauN6Wjp5w10TLU8HpMXjjfqb9Ow=
Received: from localhost.localdomain ( [113.57.152.160])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Thu, 17 Oct 2024 11:40:20 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 727155235365520417
From: WangYuli <wangyuli@uniontech.com>
To: helen.koike@collabora.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, wangyuli@uniontech.com, david.heidelberg@collabora.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 guanwentao@uniontech.com, zhanjun@uniontech.com
Subject: [RESEND. PATCH 4/5] drm/ci: Upgrade idna requirement to 3.7
Date: Thu, 17 Oct 2024 11:39:51 +0800
Message-ID: <B855B90C2EECA04E+20241017034004.113456-4-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241017034004.113456-1-wangyuli@uniontech.com>
References: <20241017034004.113456-1-wangyuli@uniontech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpsz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: NkHKfw09D6j8P0bEV2lHjYpHUuReeqTD6h7WCZKxWeA7jlCNqduC7pb0
 m1JktPzZh7x7sEu6Kb3PVoAgp9WPH9Ksh3EMHurv6MCgoli21ggvcYRD3dP+yS+2FuW/he/
 uB8xdl7Dx3EcIWS3j6cbl/Fb1QovaoRwPxM3I2hID8bMa6O/xkY76lsrR+e02KbaYpcq3Zd
 LDIgRKxf+QC7AH3CNoPcGMHWMBJP4Pymwk8Bt4qwKLUfIv3xZYWBQOgm4q5mYfSr5UK3Kzm
 HkLe/6khqVprDVHIGyzd488/sMGWtOIipIDRNZ2wSk+HgveJTF4C9zFKTc+uQdypst4MIRx
 xU4D1LckbCQFZ93Mj5rU/SSxdaD3MVGVC7tuEtCaJ1X2yGmllNBln6F2SZ8jRh8vz7T3GaZ
 UATA+AZ3TFGTrrE0/1Fs7MfeSH7juMDKoR4/QZ21CjotAt8Em2NbZUmbQ47wLFrmXE8tF0W
 2Fj8yz3NfyUU/2ys2r+p4lR4NMUvQ8u6mDIg5zuMcXBcbWHHDnPWGSJtlacHhFM8r43mBWP
 6HdLd4nWbByRIqnRbsdv8u5blf8KLJhsd+BECcm8jjq2ugp7vw1T9yWEIYqU59nnTdpbV1r
 W2aABAuycjmu2qujgVz2kDA0dNqPabG41k33u7oneHWqk5pWsFdnxvEZA/w4ALXeRltGQhz
 34UmmHfomHjA5UaUO666ouLqDG57SMyY0LayVxnNjPM3duyqI7hlE+bwxI4V/VxMuCUVjDF
 3kZEmsLS1QxBwHFgD+bpIvbQzUE1oiH5wPjSDJ1Om9RZ8pq90+xGflVHtjtL11/LC+mDYsp
 sHSeVXPfjPepDwmlmDualAnsmWpxButjJ+wXdXssyWB21QJUsZlGLGRXdLux149eo1DFRdH
 f/Tp8LEQJlBPrNu68rztEOfs+p+U+jrwvaJqeB7oZGabObay8kMPITo5vsT1UNtzaI2Xk2t
 GO24EjmkqD8qSk11Um9s7HcNzubgT9PJ/p3bwjteTkSHqN3Ti9dIvkslsp7aBsBaJ/yZLmC
 GbNJVTcr9lhivIlDS6UCuLuOnAJx+dwLTmurrUPJwBEFYpRkdy
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

