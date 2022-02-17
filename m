Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F034BA98F
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 20:19:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66D4E10E473;
	Thu, 17 Feb 2022 19:19:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5B1E10E48E
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 19:19:51 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id x5so11409477edd.11
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 11:19:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=t5OLgdyOSq3C2fbZ8BWOVpf929s2MamuZQdu8kKbMxg=;
 b=f8KUMQGV24drQ1oxFQa5nPSCJcH34qLfFw5igILtKu+i6C0VLRRvDxH8sHhNU33ABR
 P9lRsIyI8OKEwZTkVrI1Mx7BPLxF3uPuyQ/rSvodAGTDgviKR/pgoJiqRFjKQOIBDuKZ
 cjq4eqLHp0x9bHxawZnLLVKSeFoMZOeWBLl1WEB1xjb3bPhrdRujBMt+VzFpKNh92VxY
 jptELefHv+MesVo60sjzrsFPKG1lX2aICmVbdyIGWHE8wOSIXKcxIUkUKzvebiZIO5TJ
 tES6bZNqw2CGcjksaJIjnhcQD/CI5UyW6YJcSHH4iwuz6enrzBdLwztRpkkZY6IFt2fT
 hR3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=t5OLgdyOSq3C2fbZ8BWOVpf929s2MamuZQdu8kKbMxg=;
 b=qcY+4CeIVVk4b/+kMb4jjiRmvbhB2DW6Fq7xM8M8rYP+aFH2b4pwAM3rzhmZqoTnKA
 Q2EeV+sC9btZvaSllQ5e4U8TQZNMYoajXRU3HORbjuqPxh76apDyikTSoPF2AceLhb4H
 dR3OayXL8CdSr1UfMtcs4uXvoqGrmRwU5a+FcZWzo7FsAgIeKgqvm7mXzlSAmE0vvS8P
 JFehUgHrD3C8CDTlWeBYgqS/JldFpq41zTV/nSy4UDzKPPHFjdRLHBRj+NkfXQ/vQ071
 IPY5bk9bCZ4fypNtjNuUwJMfYTaDJt67v8YM9Zi+ZG8U/6WvVyoNYB6vErh2mf0e0F06
 wmng==
X-Gm-Message-State: AOAM532wIg5mJLzS6TefQcem6u2X/SQTerg6NUVIOOLFpducF2YSXXoZ
 GCpXO5U10aX4CqrJjY0wpTE=
X-Google-Smtp-Source: ABdhPJwWPf7A+Dmp/CGUx+j98fHxTt5HIW2mth0V+/ZUKMrSSK/8cyNtQLeBE3EwOgN5T02GyPemcQ==
X-Received: by 2002:aa7:d7d3:0:b0:410:d23b:6746 with SMTP id
 e19-20020aa7d7d3000000b00410d23b6746mr4312144eds.453.1645125590285; 
 Thu, 17 Feb 2022 11:19:50 -0800 (PST)
Received: from localhost (p2e5bec5d.dip0.t-ipconnect.de. [46.91.236.93])
 by smtp.gmail.com with ESMTPSA id u3sm1510856ejz.99.2022.02.17.11.19.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Feb 2022 11:19:49 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH libdrm v2 08/25] tegra: Install tegra-openclose test
Date: Thu, 17 Feb 2022 20:19:14 +0100
Message-Id: <20220217191931.2534836-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220217191931.2534836-1-thierry.reding@gmail.com>
References: <20220217191931.2534836-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>

Allow this simple test to be installed so that it can easily be run on a
target device.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 tests/tegra/.gitignore  | 2 +-
 tests/tegra/meson.build | 7 +++++--
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/tests/tegra/.gitignore b/tests/tegra/.gitignore
index 5c5216c5c5e6..56cfb62b785f 100644
--- a/tests/tegra/.gitignore
+++ b/tests/tegra/.gitignore
@@ -1 +1 @@
-openclose
+tegra-openclose
diff --git a/tests/tegra/meson.build b/tests/tegra/meson.build
index 4f8c54f41553..fbf4e6d8d4a3 100644
--- a/tests/tegra/meson.build
+++ b/tests/tegra/meson.build
@@ -18,10 +18,13 @@
 # OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 # SOFTWARE.
 
+inc_tegra = include_directories('../../tegra')
+
 openclose = executable(
-  'openclose',
+  'tegra-openclose',
   files('openclose.c'),
-  include_directories : [inc_root, inc_drm, include_directories('../../tegra')],
+  include_directories : [inc_root, inc_drm, inc_tegra],
   c_args : libdrm_c_args,
   link_with : [libdrm, libdrm_tegra],
+  install : with_install_tests,
 )
-- 
2.35.1

