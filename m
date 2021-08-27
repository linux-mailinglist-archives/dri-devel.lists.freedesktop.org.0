Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 420343F99A2
	for <lists+dri-devel@lfdr.de>; Fri, 27 Aug 2021 15:23:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7717F6E942;
	Fri, 27 Aug 2021 13:23:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEAB96E93F
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Aug 2021 13:23:27 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id t15so4178057wrg.7
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Aug 2021 06:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8YwLI+CQi4XoGtQP+jSI8Zav9RLk/yd1Ntp9TAc05U4=;
 b=Z+DC3oA9ukgoYpGazul+lzTz590lx5Kvo+cNG0jbmiigS9B5j33k9SpTE2hPVDsATF
 kzDHwUb9bWklRjF2IKXjb9XTCGgyk/eSsDVlOb0DfHQgaQuftyZ7E6qtc9vPOQSd4m/d
 C0NthKVLYRxt1AJstI2ye2tMdmpOLBc1z1D/jilnCHC7BexKow55lXVYSM6ZmNmdO32P
 TaT9gHP2eGe8rbyZtRziAkOZCs+JndbBo1tUROX21P1aG6zxrLcKCVpCQD9iuuK/2CHK
 dH+z7y/Fbj+ZYnENyMnQxZF2YOe5sZKijWmFMMHhkWJyFFClPB742TrJI0WU7ot32sqI
 5u+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8YwLI+CQi4XoGtQP+jSI8Zav9RLk/yd1Ntp9TAc05U4=;
 b=C80QXTIlo4TS1KZg7bn6KuwI7uF2UJtz/nGYoLdjNHk5aiTwTPDbRPXEJLH7veqmGI
 zE6KnwdLmE4tZ56b43TT6ou0CMYlyIVpX91JDywvkUwbJE0ZFV6E/bUlZ9i/meM221cV
 DSADWPXa3kOobQZ/VLosxXMt6l/TSJGYaXTNcBdZxyoDHb29FdiY36MYuQNK0owhLL3Y
 zb1ItU1LOdFwHWkNh2BxFnruFmf9RAjbJP0pxvsJpD7NyCQv9ee1jqnq5HJ8iBhYxPVH
 wrhnuE5wkkdCdBHJ0o+cE2YLyW2VNG8B8lEP2tKiTHNvLccnXmk1I8LqPcxDGpYTUdYs
 S9Xg==
X-Gm-Message-State: AOAM532OzLjYz9FQG+Cdejdmm7esBWcFUoCBP0wJ3D9BBabYG1stJPkH
 vjfVbNCUL/6tODEzzzpkfXa/PXipwIw=
X-Google-Smtp-Source: ABdhPJyVhIgPY7KUHXU2mM2rHcB/ojog7zoCTI4bFyC26YpvzUSxWh5zQZBEYD03gV5kxu482iPSTg==
X-Received: by 2002:a5d:4410:: with SMTP id z16mr10385083wrq.110.1630070606427; 
 Fri, 27 Aug 2021 06:23:26 -0700 (PDT)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id d145sm11134339wmd.3.2021.08.27.06.23.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Aug 2021 06:23:25 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH libdrm 08/25] tegra: Install tegra-openclose test
Date: Fri, 27 Aug 2021 15:22:48 +0200
Message-Id: <20210827132305.3572077-9-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210827132305.3572077-1-thierry.reding@gmail.com>
References: <20210827132305.3572077-1-thierry.reding@gmail.com>
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
2.32.0

