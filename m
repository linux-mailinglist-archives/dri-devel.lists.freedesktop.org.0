Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C86199A1964
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2024 05:41:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48B6E10E791;
	Thu, 17 Oct 2024 03:41:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=uniontech.com header.i=@uniontech.com header.b="WKRco6As";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bg5.exmail.qq.com (bg5.exmail.qq.com [43.154.209.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACC2610E791
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2024 03:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
 s=onoh2408; t=1729136456;
 bh=+/DdLbFCN3x83oxAHHqnPnAEM1hgWNumW7T/6E5yt74=;
 h=From:To:Subject:Date:Message-ID:MIME-Version;
 b=WKRco6AsmfxtEMP9CkPU7erStzwBvOrE0s2tcGLdGamLgj1bl3Tz2NfClzs+kSrJR
 Ltfukwa1TQxH3MUOM+3/Y9rVFbJcL/hvhWvW2He6G1UkrTMYTIIxFVJ9Q50vj6MM/k
 WX5JQeGt5pAZxK3G/8PzwPn/yMy8RAT0CjicfFLo=
X-QQ-mid: bizesmtpsz5t1729136418tu84pku
X-QQ-Originating-IP: MYne5dTKV5TL2KIkHVQVbuEnwE0v/dd4ms9SyKz2d5Y=
Received: from localhost.localdomain ( [113.57.152.160])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Thu, 17 Oct 2024 11:40:16 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 5065782363297022121
From: WangYuli <wangyuli@uniontech.com>
To: helen.koike@collabora.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, wangyuli@uniontech.com, david.heidelberg@collabora.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 guanwentao@uniontech.com, zhanjun@uniontech.com
Subject: [RESEND. PATCH 3/5] drm/ci: Upgrade requests requirement to 2.32.0
Date: Thu, 17 Oct 2024 11:39:50 +0800
Message-ID: <0984066064003022+20241017034004.113456-3-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241017034004.113456-1-wangyuli@uniontech.com>
References: <20241017034004.113456-1-wangyuli@uniontech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpsz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: MbSuBwOrED9vvWtKS77uCvoDSQ0z3MT2NGBfyfpRwX0hGDGKP2V5VBoV
 WWDImpLaFTOmvNgGnnpGuMlqx1J8RFmxCs54LUwBvrneRFvl+wYkGtqJdB5h2Bb33dHZE0c
 IkTgJXKijETjY6QH6OwKgJgej5/5nW7MrwbvqtlW3dfiUgKetWmZDLNZAK9RIcyAHI4tdd5
 Q7uPTaMmqy+rPwnO2EDgOS/EA4wEsWUFZCIRotw6lyWxHpEnl0i7PJmIl+2J+ZIybigUVhS
 M14dTYorZsrsWiGPPk8b3E6HY9qys3DzKdZ6iFmtt4SGSFrJieADtFtYp1d9x0Gt/7zqxOv
 GZbXla4cU3s3MIAyK3zrC4xYQeioWm/XnoUyCUldxkQYBfKWjjH68pdGo4i0nVYxQrAnRYl
 UgOmNTGa04BBDs4uevX3PAX+LChzBI58lBN05ZTzxGo4n5hJ9FPwYktSN8fP8yz7iKsOKnw
 MLJID96IDL9wFLXzmaLR4RtRBS/Ar0lZtZ9swy/0Ja8ncezf/MpQwqgJX5P71K0qsmsTnXp
 s4JAM5m8IJmNqXSMNdTMVMUA4o7H3N8W4nfC15yZjXTQOogzWm8esGTtoTNzs1YD6OWVqF/
 BEQCAZkgzDcGZ/El20zRhd3iymSkjAheB449rtKv6bM3mQyQqGK6oWWlIEIJpKe276tE8Uy
 CR9b1fcLRBlxDw0rw1Vo+1Iskb110dRPCzrhKkWsadgBRKpdGNxlKwVQzg8Od4YxLen27Oc
 DebbB0rW5JLNa8bZEOkv0U1aHudV6Yb5ZDSkvLNY3OQfVm6xI70WHXYcqnah+4YLBfqq2oU
 xfhE5YH/Joar/514+hqxC5vCVihmIZG9Y0/apSz7ozbv617gUUW5hqV6K0B11jCwY6L1SKD
 Y5zg/HhlVsmf6wYVuofwD5ZSjMUWJyDnMOvGq9uh51Xue8AUZifwdHqm3MKMv156WRBT5BO
 X6kgluQ6ZExm0bOQhBLk+45PY3Y5fkr3OQum9JXAqkqdYRl+chF6YreSkj/9lbBZojsZzwu
 oHQciMPKSuFeUJElWGBXR5gbrTBck=
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
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

