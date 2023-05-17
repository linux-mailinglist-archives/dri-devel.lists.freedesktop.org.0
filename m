Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD366706388
	for <lists+dri-devel@lfdr.de>; Wed, 17 May 2023 11:04:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E70810E142;
	Wed, 17 May 2023 09:04:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCB1710E3CB
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 09:04:26 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-643b7b8f8ceso333221b3a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 02:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684314266; x=1686906266;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=91yi06xLF2ixkxLxpr3QLIL+JikkiNbbtse+nlfJyhw=;
 b=d47ANN5H80Z/g3BetX2abUlwhLfzTybONIQJbkRW6yAFaEGjec1AvbEHgyfCWumW3H
 kI/du1DtP8FkmU91gllj0D3qzgrHGo7LlyNkLzopBXuUibmSXJN7CvbN7QwefEbJsj/u
 ZoG5OADzD+DJDk6nCDLDfuHIN3zKk4jOFIqyoSJxj3GtkikpYpokjDP0gPN7WN+iWtsy
 +3ty7jLsPhD5qMXFVusqkheG1QylzgBAmOCv5tr6d6hOrga8ztnjivSRR9K1wZl13Cpc
 b/GR7BEMoO2ylHKzTHEN1XX8+4AAOO7BzZA/a7V02y2SG3Vq5T19KiGuQnJ+Jj+0iRav
 1zqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684314266; x=1686906266;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=91yi06xLF2ixkxLxpr3QLIL+JikkiNbbtse+nlfJyhw=;
 b=YzJo4sQTFBoO+J7ZTeh7ZH8BFamGwMrykIRAIl1Vkhd1YiWqxuHqA2KTPtwXh40vcz
 TWm2Wro+3KX5eWeC5lGPI8xtWj39anRWp6Y2eE3w8Xvfi7rMZe+4jiiQTE60vYybDA6t
 OZDrlincYR6vABH1sdAEuinzXAfXBipWspn8XnyKhR08t+BW5H81sLPUS3GSkHulS8M6
 ZLLVS2+GNkSO2WnnIuQ2xuElyc3UbM9yFDHvUyVNg61ZjfHweOY8O7DJ1MFqnykG48BG
 1lYD7tUq+UjovEL7Hydf+be7GEUBjT7v6q/ACpzqW7C3y7Yac1bjBMH6HrpzduNtLOUf
 qRWA==
X-Gm-Message-State: AC+VfDybO5w42H2lQ334zRtKG/3wgTNY/cSngCAwjDc0uqSj96he1LkA
 vblEt8bg+vYAbp7qCj4gMTU=
X-Google-Smtp-Source: ACHHUZ65TMd/WbFhrTaBdgrI8Jp9mEZXmVg2CKDwTz/9JbKqzuAgYiKru0sQEkEHzDr8BIdtFV8tLw==
X-Received: by 2002:a05:6a00:198e:b0:64a:f8c9:a421 with SMTP id
 d14-20020a056a00198e00b0064af8c9a421mr1734pfl.32.1684314265601; 
 Wed, 17 May 2023 02:04:25 -0700 (PDT)
Received: from debian.me (subs03-180-214-233-22.three.co.id. [180.214.233.22])
 by smtp.gmail.com with ESMTPSA id
 c18-20020aa781d2000000b0063b73e69ea2sm4645732pfn.42.2023.05.17.02.04.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 May 2023 02:04:25 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
 id 164EB106276; Wed, 17 May 2023 16:04:20 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Networking <netdev@vger.kernel.org>,
 Linux Staging Drivers <linux-staging@lists.linux.dev>
Subject: [PATCH v3 3/4] drivers: staging: wlan-ng: Remove GPL/MPL boilerplate
Date: Wed, 17 May 2023 16:04:17 +0700
Message-Id: <20230517090418.1093091-4-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230517090418.1093091-1-bagasdotme@gmail.com>
References: <20230517090418.1093091-1-bagasdotme@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=36222; i=bagasdotme@gmail.com;
 h=from:subject; bh=pDKND6kxrMZMIgikM89EZnWyHuNOrHokIVM19TuzgCU=;
 b=owGbwMvMwCX2bWenZ2ig32LG02pJDCkpMybNyZXTldgq7/zlc0pSTnVA/a3aZCaeJUuObbVfv
 erG6g8nOkpZGMS4GGTFFFkmJfI1nd5lJHKhfa0jzBxWJpAhDFycAjARIR6GfxrOIcHySwPeKxz1
 0LBRUlkucc5w+y/zKx3xP86mHgtk+szI8P3raVvtmZF9xopS9Qsfcumvlvh/1S/Zb1prea/qxTN
 FTAA=
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp;
 fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 Karsten Keil <isdn@linux-pingi.de>, Davidlohr Bueso <dave@stgolabs.net>,
 Dan Carpenter <error27@gmail.com>, Deepak R Varma <drv@mailo.com>,
 Simon Horman <simon.horman@corigine.com>,
 Philippe Ombredanne <pombredanne@nexb.com>,
 Bagas Sanjaya <bagasdotme@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jacob Keller <jacob.e.keller@intel.com>, David Airlie <airlied@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Anna-Maria Behnsen <anna-maria@linutronix.de>,
 Gaosheng Cui <cuigaosheng1@huawei.com>, Archana <craechal@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove the license boilerplate as there is already SPDX license
identifier added in b24413180f5600 ("License cleanup: add SPDX GPL-2.0
license identifier to files with no license") which fulfills the same
intention as the boilerplate.

Cc: Dan Carpenter <error27@gmail.com>
Cc: Kate Stewart <kstewart@linuxfoundation.org>
Cc: Philippe Ombredanne <pombredanne@nexb.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Reviewed-by: Simon Horman <simon.horman@corigine.com>
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 drivers/staging/wlan-ng/hfa384x.h          | 21 ---------------------
 drivers/staging/wlan-ng/hfa384x_usb.c      | 21 ---------------------
 drivers/staging/wlan-ng/p80211conv.c       | 21 ---------------------
 drivers/staging/wlan-ng/p80211conv.h       | 21 ---------------------
 drivers/staging/wlan-ng/p80211hdr.h        | 21 ---------------------
 drivers/staging/wlan-ng/p80211ioctl.h      | 21 ---------------------
 drivers/staging/wlan-ng/p80211metadef.h    | 21 ---------------------
 drivers/staging/wlan-ng/p80211metastruct.h | 21 ---------------------
 drivers/staging/wlan-ng/p80211mgmt.h       | 21 ---------------------
 drivers/staging/wlan-ng/p80211msg.h        | 21 ---------------------
 drivers/staging/wlan-ng/p80211netdev.c     | 21 ---------------------
 drivers/staging/wlan-ng/p80211netdev.h     | 21 ---------------------
 drivers/staging/wlan-ng/p80211req.c        | 21 ---------------------
 drivers/staging/wlan-ng/p80211req.h        | 21 ---------------------
 drivers/staging/wlan-ng/p80211types.h      | 21 ---------------------
 drivers/staging/wlan-ng/p80211wep.c        | 21 ---------------------
 drivers/staging/wlan-ng/prism2fw.c         | 21 ---------------------
 drivers/staging/wlan-ng/prism2mgmt.c       | 21 ---------------------
 drivers/staging/wlan-ng/prism2mgmt.h       | 21 ---------------------
 drivers/staging/wlan-ng/prism2mib.c        | 21 ---------------------
 drivers/staging/wlan-ng/prism2sta.c        | 21 ---------------------
 21 files changed, 441 deletions(-)

diff --git a/drivers/staging/wlan-ng/hfa384x.h b/drivers/staging/wlan-ng/hfa384x.h
index e33dd1b9c40e58..a4799589e46945 100644
--- a/drivers/staging/wlan-ng/hfa384x.h
+++ b/drivers/staging/wlan-ng/hfa384x.h
@@ -8,27 +8,6 @@
  *
  * linux-wlan
  *
- *   The contents of this file are subject to the Mozilla Public
- *   License Version 1.1 (the "License"); you may not use this file
- *   except in compliance with the License. You may obtain a copy of
- *   the License at http://www.mozilla.org/MPL/
- *
- *   Software distributed under the License is distributed on an "AS
- *   IS" basis, WITHOUT WARRANTY OF ANY KIND, either express or
- *    implied. See the License for the specific language governing
- *   rights and limitations under the License.
- *
- *   Alternatively, the contents of this file may be used under the
- *   terms of the GNU Public License version 2 (the "GPL"), in which
- *   case the provisions of the GPL are applicable instead of the
- *   above.  If you wish to allow the use of your version of this file
- *   only under the terms of the GPL and not to allow others to use
- *   your version of this file under the MPL, indicate your decision
- *   by deleting the provisions above and replace them with the notice
- *   and other provisions required by the GPL.  If you do not delete
- *   the provisions above, a recipient may use your version of this
- *   file under either the MPL or the GPL.
- *
  * --------------------------------------------------------------------
  *
  * Inquiries regarding the linux-wlan Open Source project can be
diff --git a/drivers/staging/wlan-ng/hfa384x_usb.c b/drivers/staging/wlan-ng/hfa384x_usb.c
index c7cd54171d9943..3e8c92675c8234 100644
--- a/drivers/staging/wlan-ng/hfa384x_usb.c
+++ b/drivers/staging/wlan-ng/hfa384x_usb.c
@@ -8,27 +8,6 @@
  *
  * linux-wlan
  *
- *   The contents of this file are subject to the Mozilla Public
- *   License Version 1.1 (the "License"); you may not use this file
- *   except in compliance with the License. You may obtain a copy of
- *   the License at http://www.mozilla.org/MPL/
- *
- *   Software distributed under the License is distributed on an "AS
- *   IS" basis, WITHOUT WARRANTY OF ANY KIND, either express or
- *   implied. See the License for the specific language governing
- *   rights and limitations under the License.
- *
- *   Alternatively, the contents of this file may be used under the
- *   terms of the GNU Public License version 2 (the "GPL"), in which
- *   case the provisions of the GPL are applicable instead of the
- *   above.  If you wish to allow the use of your version of this file
- *   only under the terms of the GPL and not to allow others to use
- *   your version of this file under the MPL, indicate your decision
- *   by deleting the provisions above and replace them with the notice
- *   and other provisions required by the GPL.  If you do not delete
- *   the provisions above, a recipient may use your version of this
- *   file under either the MPL or the GPL.
- *
  * --------------------------------------------------------------------
  *
  * Inquiries regarding the linux-wlan Open Source project can be
diff --git a/drivers/staging/wlan-ng/p80211conv.c b/drivers/staging/wlan-ng/p80211conv.c
index cd271b1da69f64..048e1c3fe19b32 100644
--- a/drivers/staging/wlan-ng/p80211conv.c
+++ b/drivers/staging/wlan-ng/p80211conv.c
@@ -8,27 +8,6 @@
  *
  * linux-wlan
  *
- *   The contents of this file are subject to the Mozilla Public
- *   License Version 1.1 (the "License"); you may not use this file
- *   except in compliance with the License. You may obtain a copy of
- *   the License at http://www.mozilla.org/MPL/
- *
- *   Software distributed under the License is distributed on an "AS
- *   IS" basis, WITHOUT WARRANTY OF ANY KIND, either express or
- *   implied. See the License for the specific language governing
- *   rights and limitations under the License.
- *
- *   Alternatively, the contents of this file may be used under the
- *   terms of the GNU Public License version 2 (the "GPL"), in which
- *   case the provisions of the GPL are applicable instead of the
- *   above.  If you wish to allow the use of your version of this file
- *   only under the terms of the GPL and not to allow others to use
- *   your version of this file under the MPL, indicate your decision
- *   by deleting the provisions above and replace them with the notice
- *   and other provisions required by the GPL.  If you do not delete
- *   the provisions above, a recipient may use your version of this
- *   file under either the MPL or the GPL.
- *
  * --------------------------------------------------------------------
  *
  * Inquiries regarding the linux-wlan Open Source project can be
diff --git a/drivers/staging/wlan-ng/p80211conv.h b/drivers/staging/wlan-ng/p80211conv.h
index dfb762bce84d07..45234769f45d6e 100644
--- a/drivers/staging/wlan-ng/p80211conv.h
+++ b/drivers/staging/wlan-ng/p80211conv.h
@@ -8,27 +8,6 @@
  *
  * linux-wlan
  *
- *   The contents of this file are subject to the Mozilla Public
- *   License Version 1.1 (the "License"); you may not use this file
- *   except in compliance with the License. You may obtain a copy of
- *   the License at http://www.mozilla.org/MPL/
- *
- *   Software distributed under the License is distributed on an "AS
- *   IS" basis, WITHOUT WARRANTY OF ANY KIND, either express or
- *   implied. See the License for the specific language governing
- *   rights and limitations under the License.
- *
- *   Alternatively, the contents of this file may be used under the
- *   terms of the GNU Public License version 2 (the "GPL"), in which
- *   case the provisions of the GPL are applicable instead of the
- *   above.  If you wish to allow the use of your version of this file
- *   only under the terms of the GPL and not to allow others to use
- *   your version of this file under the MPL, indicate your decision
- *   by deleting the provisions above and replace them with the notice
- *   and other provisions required by the GPL.  If you do not delete
- *   the provisions above, a recipient may use your version of this
- *   file under either the MPL or the GPL.
- *
  * --------------------------------------------------------------------
  *
  * Inquiries regarding the linux-wlan Open Source project can be
diff --git a/drivers/staging/wlan-ng/p80211hdr.h b/drivers/staging/wlan-ng/p80211hdr.h
index 93195a4c5b014a..7ea1c8ec05ed05 100644
--- a/drivers/staging/wlan-ng/p80211hdr.h
+++ b/drivers/staging/wlan-ng/p80211hdr.h
@@ -8,27 +8,6 @@
  *
  * linux-wlan
  *
- *   The contents of this file are subject to the Mozilla Public
- *   License Version 1.1 (the "License"); you may not use this file
- *   except in compliance with the License. You may obtain a copy of
- *   the License at http://www.mozilla.org/MPL/
- *
- *   Software distributed under the License is distributed on an "AS
- *   IS" basis, WITHOUT WARRANTY OF ANY KIND, either express or
- *   implied. See the License for the specific language governing
- *   rights and limitations under the License.
- *
- *   Alternatively, the contents of this file may be used under the
- *   terms of the GNU Public License version 2 (the "GPL"), in which
- *   case the provisions of the GPL are applicable instead of the
- *   above.  If you wish to allow the use of your version of this file
- *   only under the terms of the GPL and not to allow others to use
- *   your version of this file under the MPL, indicate your decision
- *   by deleting the provisions above and replace them with the notice
- *   and other provisions required by the GPL.  If you do not delete
- *   the provisions above, a recipient may use your version of this
- *   file under either the MPL or the GPL.
- *
  * --------------------------------------------------------------------
  *
  * Inquiries regarding the linux-wlan Open Source project can be
diff --git a/drivers/staging/wlan-ng/p80211ioctl.h b/drivers/staging/wlan-ng/p80211ioctl.h
index b50ce11147dd78..176e327a45bc4b 100644
--- a/drivers/staging/wlan-ng/p80211ioctl.h
+++ b/drivers/staging/wlan-ng/p80211ioctl.h
@@ -8,27 +8,6 @@
  *
  * linux-wlan
  *
- *   The contents of this file are subject to the Mozilla Public
- *   License Version 1.1 (the "License"); you may not use this file
- *   except in compliance with the License. You may obtain a copy of
- *   the License at http://www.mozilla.org/MPL/
- *
- *   Software distributed under the License is distributed on an "AS
- *   IS" basis, WITHOUT WARRANTY OF ANY KIND, either express or
- *   implied. See the License for the specific language governing
- *   rights and limitations under the License.
- *
- *   Alternatively, the contents of this file may be used under the
- *   terms of the GNU Public License version 2 (the "GPL"), in which
- *   case the provisions of the GPL are applicable instead of the
- *   above.  If you wish to allow the use of your version of this file
- *   only under the terms of the GPL and not to allow others to use
- *   your version of this file under the MPL, indicate your decision
- *   by deleting the provisions above and replace them with the notice
- *   and other provisions required by the GPL.  If you do not delete
- *   the provisions above, a recipient may use your version of this
- *   file under either the MPL or the GPL.
- *
  * --------------------------------------------------------------------
  *
  * Inquiries regarding the linux-wlan Open Source project can be
diff --git a/drivers/staging/wlan-ng/p80211metadef.h b/drivers/staging/wlan-ng/p80211metadef.h
index 1b91b64c12ed1a..1cbb4b67a9a6a6 100644
--- a/drivers/staging/wlan-ng/p80211metadef.h
+++ b/drivers/staging/wlan-ng/p80211metadef.h
@@ -6,27 +6,6 @@
  *
  * linux-wlan
  *
- *   The contents of this file are subject to the Mozilla Public
- *   License Version 1.1 (the "License"); you may not use this file
- *   except in compliance with the License. You may obtain a copy of
- *   the License at http://www.mozilla.org/MPL/
- *
- *   Software distributed under the License is distributed on an "AS
- *   IS" basis, WITHOUT WARRANTY OF ANY KIND, either express or
- *   implied. See the License for the specific language governing
- *   rights and limitations under the License.
- *
- *   Alternatively, the contents of this file may be used under the
- *   terms of the GNU Public License version 2 (the "GPL"), in which
- *   case the provisions of the GPL are applicable instead of the
- *   above.  If you wish to allow the use of your version of this file
- *   only under the terms of the GPL and not to allow others to use
- *   your version of this file under the MPL, indicate your decision
- *   by deleting the provisions above and replace them with the notice
- *   and other provisions required by the GPL.  If you do not delete
- *   the provisions above, a recipient may use your version of this
- *   file under either the MPL or the GPL.
- *
  * --------------------------------------------------------------------
  *
  * Inquiries regarding the linux-wlan Open Source project can be
diff --git a/drivers/staging/wlan-ng/p80211metastruct.h b/drivers/staging/wlan-ng/p80211metastruct.h
index 4adc64580185a1..ea8b7ee108171f 100644
--- a/drivers/staging/wlan-ng/p80211metastruct.h
+++ b/drivers/staging/wlan-ng/p80211metastruct.h
@@ -6,27 +6,6 @@
  *
  * linux-wlan
  *
- *   The contents of this file are subject to the Mozilla Public
- *   License Version 1.1 (the "License"); you may not use this file
- *   except in compliance with the License. You may obtain a copy of
- *   the License at http://www.mozilla.org/MPL/
- *
- *   Software distributed under the License is distributed on an "AS
- *   IS" basis, WITHOUT WARRANTY OF ANY KIND, either express or
- *   implied. See the License for the specific language governing
- *   rights and limitations under the License.
- *
- *   Alternatively, the contents of this file may be used under the
- *   terms of the GNU Public License version 2 (the "GPL"), in which
- *   case the provisions of the GPL are applicable instead of the
- *   above.  If you wish to allow the use of your version of this file
- *   only under the terms of the GPL and not to allow others to use
- *   your version of this file under the MPL, indicate your decision
- *   by deleting the provisions above and replace them with the notice
- *   and other provisions required by the GPL.  If you do not delete
- *   the provisions above, a recipient may use your version of this
- *   file under either the MPL or the GPL.
- *
  * --------------------------------------------------------------------
  *
  * Inquiries regarding the linux-wlan Open Source project can be
diff --git a/drivers/staging/wlan-ng/p80211mgmt.h b/drivers/staging/wlan-ng/p80211mgmt.h
index fc23fae5651b9e..7ffc202d90074b 100644
--- a/drivers/staging/wlan-ng/p80211mgmt.h
+++ b/drivers/staging/wlan-ng/p80211mgmt.h
@@ -8,27 +8,6 @@
  *
  * linux-wlan
  *
- *   The contents of this file are subject to the Mozilla Public
- *   License Version 1.1 (the "License"); you may not use this file
- *   except in compliance with the License. You may obtain a copy of
- *   the License at http://www.mozilla.org/MPL/
- *
- *   Software distributed under the License is distributed on an "AS
- *   IS" basis, WITHOUT WARRANTY OF ANY KIND, either express or
- *   implied. See the License for the specific language governing
- *   rights and limitations under the License.
- *
- *   Alternatively, the contents of this file may be used under the
- *   terms of the GNU Public License version 2 (the "GPL"), in which
- *   case the provisions of the GPL are applicable instead of the
- *   above.  If you wish to allow the use of your version of this file
- *   only under the terms of the GPL and not to allow others to use
- *   your version of this file under the MPL, indicate your decision
- *   by deleting the provisions above and replace them with the notice
- *   and other provisions required by the GPL.  If you do not delete
- *   the provisions above, a recipient may use your version of this
- *   file under either the MPL or the GPL.
- *
  * --------------------------------------------------------------------
  *
  * Inquiries regarding the linux-wlan Open Source project can be
diff --git a/drivers/staging/wlan-ng/p80211msg.h b/drivers/staging/wlan-ng/p80211msg.h
index f68d8b7d5ad883..d56bc6079ed4f8 100644
--- a/drivers/staging/wlan-ng/p80211msg.h
+++ b/drivers/staging/wlan-ng/p80211msg.h
@@ -8,27 +8,6 @@
  *
  * linux-wlan
  *
- *   The contents of this file are subject to the Mozilla Public
- *   License Version 1.1 (the "License"); you may not use this file
- *   except in compliance with the License. You may obtain a copy of
- *   the License at http://www.mozilla.org/MPL/
- *
- *   Software distributed under the License is distributed on an "AS
- *   IS" basis, WITHOUT WARRANTY OF ANY KIND, either express or
- *   implied. See the License for the specific language governing
- *   rights and limitations under the License.
- *
- *   Alternatively, the contents of this file may be used under the
- *   terms of the GNU Public License version 2 (the "GPL"), in which
- *   case the provisions of the GPL are applicable instead of the
- *   above.  If you wish to allow the use of your version of this file
- *   only under the terms of the GPL and not to allow others to use
- *   your version of this file under the MPL, indicate your decision
- *   by deleting the provisions above and replace them with the notice
- *   and other provisions required by the GPL.  If you do not delete
- *   the provisions above, a recipient may use your version of this
- *   file under either the MPL or the GPL.
- *
  * --------------------------------------------------------------------
  *
  * Inquiries regarding the linux-wlan Open Source project can be
diff --git a/drivers/staging/wlan-ng/p80211netdev.c b/drivers/staging/wlan-ng/p80211netdev.c
index 6bef419e8ad0c8..8634fc89a6c22f 100644
--- a/drivers/staging/wlan-ng/p80211netdev.c
+++ b/drivers/staging/wlan-ng/p80211netdev.c
@@ -8,27 +8,6 @@
  *
  * linux-wlan
  *
- *   The contents of this file are subject to the Mozilla Public
- *   License Version 1.1 (the "License"); you may not use this file
- *   except in compliance with the License. You may obtain a copy of
- *   the License at http://www.mozilla.org/MPL/
- *
- *   Software distributed under the License is distributed on an "AS
- *   IS" basis, WITHOUT WARRANTY OF ANY KIND, either express or
- *   implied. See the License for the specific language governing
- *   rights and limitations under the License.
- *
- *   Alternatively, the contents of this file may be used under the
- *   terms of the GNU Public License version 2 (the "GPL"), in which
- *   case the provisions of the GPL are applicable instead of the
- *   above.  If you wish to allow the use of your version of this file
- *   only under the terms of the GPL and not to allow others to use
- *   your version of this file under the MPL, indicate your decision
- *   by deleting the provisions above and replace them with the notice
- *   and other provisions required by the GPL.  If you do not delete
- *   the provisions above, a recipient may use your version of this
- *   file under either the MPL or the GPL.
- *
  * --------------------------------------------------------------------
  *
  * Inquiries regarding the linux-wlan Open Source project can be
diff --git a/drivers/staging/wlan-ng/p80211netdev.h b/drivers/staging/wlan-ng/p80211netdev.h
index 1cee51a1075ed6..f5186380b6290a 100644
--- a/drivers/staging/wlan-ng/p80211netdev.h
+++ b/drivers/staging/wlan-ng/p80211netdev.h
@@ -8,27 +8,6 @@
  *
  * linux-wlan
  *
- *   The contents of this file are subject to the Mozilla Public
- *   License Version 1.1 (the "License"); you may not use this file
- *   except in compliance with the License. You may obtain a copy of
- *   the License at http://www.mozilla.org/MPL/
- *
- *   Software distributed under the License is distributed on an "AS
- *   IS" basis, WITHOUT WARRANTY OF ANY KIND, either express or
- *   implied. See the License for the specific language governing
- *   rights and limitations under the License.
- *
- *   Alternatively, the contents of this file may be used under the
- *   terms of the GNU Public License version 2 (the "GPL"), in which
- *   case the provisions of the GPL are applicable instead of the
- *   above.  If you wish to allow the use of your version of this file
- *   only under the terms of the GPL and not to allow others to use
- *   your version of this file under the MPL, indicate your decision
- *   by deleting the provisions above and replace them with the notice
- *   and other provisions required by the GPL.  If you do not delete
- *   the provisions above, a recipient may use your version of this
- *   file under either the MPL or the GPL.
- *
  * --------------------------------------------------------------------
  *
  * Inquiries regarding the linux-wlan Open Source project can be
diff --git a/drivers/staging/wlan-ng/p80211req.c b/drivers/staging/wlan-ng/p80211req.c
index 809cf3d480e952..6ec559ffd2f991 100644
--- a/drivers/staging/wlan-ng/p80211req.c
+++ b/drivers/staging/wlan-ng/p80211req.c
@@ -8,27 +8,6 @@
  *
  * linux-wlan
  *
- *   The contents of this file are subject to the Mozilla Public
- *   License Version 1.1 (the "License"); you may not use this file
- *   except in compliance with the License. You may obtain a copy of
- *   the License at http://www.mozilla.org/MPL/
- *
- *   Software distributed under the License is distributed on an "AS
- *   IS" basis, WITHOUT WARRANTY OF ANY KIND, either express or
- *   implied. See the License for the specific language governing
- *   rights and limitations under the License.
- *
- *   Alternatively, the contents of this file may be used under the
- *   terms of the GNU Public License version 2 (the "GPL"), in which
- *   case the provisions of the GPL are applicable instead of the
- *   above.  If you wish to allow the use of your version of this file
- *   only under the terms of the GPL and not to allow others to use
- *   your version of this file under the MPL, indicate your decision
- *   by deleting the provisions above and replace them with the notice
- *   and other provisions required by the GPL.  If you do not delete
- *   the provisions above, a recipient may use your version of this
- *   file under either the MPL or the GPL.
- *
  * --------------------------------------------------------------------
  *
  * Inquiries regarding the linux-wlan Open Source project can be
diff --git a/drivers/staging/wlan-ng/p80211req.h b/drivers/staging/wlan-ng/p80211req.h
index bc45cd5f91e464..39213f73913c56 100644
--- a/drivers/staging/wlan-ng/p80211req.h
+++ b/drivers/staging/wlan-ng/p80211req.h
@@ -8,27 +8,6 @@
  *
  * linux-wlan
  *
- *   The contents of this file are subject to the Mozilla Public
- *   License Version 1.1 (the "License"); you may not use this file
- *   except in compliance with the License. You may obtain a copy of
- *   the License at http://www.mozilla.org/MPL/
- *
- *   Software distributed under the License is distributed on an "AS
- *   IS" basis, WITHOUT WARRANTY OF ANY KIND, either express or
- *   implied. See the License for the specific language governing
- *   rights and limitations under the License.
- *
- *   Alternatively, the contents of this file may be used under the
- *   terms of the GNU Public License version 2 (the "GPL"), in which
- *   case the provisions of the GPL are applicable instead of the
- *   above.  If you wish to allow the use of your version of this file
- *   only under the terms of the GPL and not to allow others to use
- *   your version of this file under the MPL, indicate your decision
- *   by deleting the provisions above and replace them with the notice
- *   and other provisions required by the GPL.  If you do not delete
- *   the provisions above, a recipient may use your version of this
- *   file under either the MPL or the GPL.
- *
  * --------------------------------------------------------------------
  *
  * Inquiries regarding the linux-wlan Open Source project can be
diff --git a/drivers/staging/wlan-ng/p80211types.h b/drivers/staging/wlan-ng/p80211types.h
index b2ed969604133e..5e4ea5f92058e5 100644
--- a/drivers/staging/wlan-ng/p80211types.h
+++ b/drivers/staging/wlan-ng/p80211types.h
@@ -9,27 +9,6 @@
  *
  * linux-wlan
  *
- *   The contents of this file are subject to the Mozilla Public
- *   License Version 1.1 (the "License"); you may not use this file
- *   except in compliance with the License. You may obtain a copy of
- *   the License at http://www.mozilla.org/MPL/
- *
- *   Software distributed under the License is distributed on an "AS
- *   IS" basis, WITHOUT WARRANTY OF ANY KIND, either express or
- *   implied. See the License for the specific language governing
- *   rights and limitations under the License.
- *
- *   Alternatively, the contents of this file may be used under the
- *   terms of the GNU Public License version 2 (the "GPL"), in which
- *   case the provisions of the GPL are applicable instead of the
- *   above.  If you wish to allow the use of your version of this file
- *   only under the terms of the GPL and not to allow others to use
- *   your version of this file under the MPL, indicate your decision
- *   by deleting the provisions above and replace them with the notice
- *   and other provisions required by the GPL.  If you do not delete
- *   the provisions above, a recipient may use your version of this
- *   file under either the MPL or the GPL.
- *
  * --------------------------------------------------------------------
  *
  * Inquiries regarding the linux-wlan Open Source project can be
diff --git a/drivers/staging/wlan-ng/p80211wep.c b/drivers/staging/wlan-ng/p80211wep.c
index 3ff7ee7011df35..e7b26b057124ab 100644
--- a/drivers/staging/wlan-ng/p80211wep.c
+++ b/drivers/staging/wlan-ng/p80211wep.c
@@ -8,27 +8,6 @@
  *
  * linux-wlan
  *
- *   The contents of this file are subject to the Mozilla Public
- *   License Version 1.1 (the "License"); you may not use this file
- *   except in compliance with the License. You may obtain a copy of
- *   the License at http://www.mozilla.org/MPL/
- *
- *   Software distributed under the License is distributed on an "AS
- *   IS" basis, WITHOUT WARRANTY OF ANY KIND, either express or
- *   implied. See the License for the specific language governing
- *   rights and limitations under the License.
- *
- *   Alternatively, the contents of this file may be used under the
- *   terms of the GNU Public License version 2 (the "GPL"), in which
- *   case the provisions of the GPL are applicable instead of the
- *   above.  If you wish to allow the use of your version of this file
- *   only under the terms of the GPL and not to allow others to use
- *   your version of this file under the MPL, indicate your decision
- *   by deleting the provisions above and replace them with the notice
- *   and other provisions required by the GPL.  If you do not delete
- *   the provisions above, a recipient may use your version of this
- *   file under either the MPL or the GPL.
- *
  * --------------------------------------------------------------------
  *
  * Inquiries regarding the linux-wlan Open Source project can be
diff --git a/drivers/staging/wlan-ng/prism2fw.c b/drivers/staging/wlan-ng/prism2fw.c
index 11658865ca5050..5d03b2b9aab40a 100644
--- a/drivers/staging/wlan-ng/prism2fw.c
+++ b/drivers/staging/wlan-ng/prism2fw.c
@@ -8,27 +8,6 @@
  *
  * linux-wlan
  *
- *   The contents of this file are subject to the Mozilla Public
- *   License Version 1.1 (the "License"); you may not use this file
- *   except in compliance with the License. You may obtain a copy of
- *   the License at http://www.mozilla.org/MPL/
- *
- *   Software distributed under the License is distributed on an "AS
- *   IS" basis, WITHOUT WARRANTY OF ANY KIND, either express or
- *   implied. See the License for the specific language governing
- *   rights and limitations under the License.
- *
- *   Alternatively, the contents of this file may be used under the
- *   terms of the GNU Public License version 2 (the "GPL"), in which
- *   case the provisions of the GPL are applicable instead of the
- *   above.  If you wish to allow the use of your version of this file
- *   only under the terms of the GPL and not to allow others to use
- *   your version of this file under the MPL, indicate your decision
- *   by deleting the provisions above and replace them with the notice
- *   and other provisions required by the GPL.  If you do not delete
- *   the provisions above, a recipient may use your version of this
- *   file under either the MPL or the GPL.
- *
  * --------------------------------------------------------------------
  *
  * Inquiries regarding the linux-wlan Open Source project can be
diff --git a/drivers/staging/wlan-ng/prism2mgmt.c b/drivers/staging/wlan-ng/prism2mgmt.c
index 9030a8939a9bf3..e7820b212b4fa1 100644
--- a/drivers/staging/wlan-ng/prism2mgmt.c
+++ b/drivers/staging/wlan-ng/prism2mgmt.c
@@ -8,27 +8,6 @@
  *
  * linux-wlan
  *
- *   The contents of this file are subject to the Mozilla Public
- *   License Version 1.1 (the "License"); you may not use this file
- *   except in compliance with the License. You may obtain a copy of
- *   the License at http://www.mozilla.org/MPL/
- *
- *   Software distributed under the License is distributed on an "AS
- *   IS" basis, WITHOUT WARRANTY OF ANY KIND, either express or
- *   implied. See the License for the specific language governing
- *   rights and limitations under the License.
- *
- *   Alternatively, the contents of this file may be used under the
- *   terms of the GNU Public License version 2 (the "GPL"), in which
- *   case the provisions of the GPL are applicable instead of the
- *   above.  If you wish to allow the use of your version of this file
- *   only under the terms of the GPL and not to allow others to use
- *   your version of this file under the MPL, indicate your decision
- *   by deleting the provisions above and replace them with the notice
- *   and other provisions required by the GPL.  If you do not delete
- *   the provisions above, a recipient may use your version of this
- *   file under either the MPL or the GPL.
- *
  * --------------------------------------------------------------------
  *
  * Inquiries regarding the linux-wlan Open Source project can be
diff --git a/drivers/staging/wlan-ng/prism2mgmt.h b/drivers/staging/wlan-ng/prism2mgmt.h
index 7132cec2d7eb80..083a055ee98662 100644
--- a/drivers/staging/wlan-ng/prism2mgmt.h
+++ b/drivers/staging/wlan-ng/prism2mgmt.h
@@ -8,27 +8,6 @@
  *
  * linux-wlan
  *
- *   The contents of this file are subject to the Mozilla Public
- *   License Version 1.1 (the "License"); you may not use this file
- *   except in compliance with the License. You may obtain a copy of
- *   the License at http://www.mozilla.org/MPL/
- *
- *   Software distributed under the License is distributed on an "AS
- *   IS" basis, WITHOUT WARRANTY OF ANY KIND, either express or
- *   implied. See the License for the specific language governing
- *   rights and limitations under the License.
- *
- *   Alternatively, the contents of this file may be used under the
- *   terms of the GNU Public License version 2 (the "GPL"), in which
- *   case the provisions of the GPL are applicable instead of the
- *   above.  If you wish to allow the use of your version of this file
- *   only under the terms of the GPL and not to allow others to use
- *   your version of this file under the MPL, indicate your decision
- *   by deleting the provisions above and replace them with the notice
- *   and other provisions required by the GPL.  If you do not delete
- *   the provisions above, a recipient may use your version of this
- *   file under either the MPL or the GPL.
- *
  * --------------------------------------------------------------------
  *
  * Inquiries regarding the linux-wlan Open Source project can be
diff --git a/drivers/staging/wlan-ng/prism2mib.c b/drivers/staging/wlan-ng/prism2mib.c
index fcf8313870af48..4346b90c1a770e 100644
--- a/drivers/staging/wlan-ng/prism2mib.c
+++ b/drivers/staging/wlan-ng/prism2mib.c
@@ -8,27 +8,6 @@
  *
  * linux-wlan
  *
- *   The contents of this file are subject to the Mozilla Public
- *   License Version 1.1 (the "License"); you may not use this file
- *   except in compliance with the License. You may obtain a copy of
- *   the License at http://www.mozilla.org/MPL/
- *
- *   Software distributed under the License is distributed on an "AS
- *   IS" basis, WITHOUT WARRANTY OF ANY KIND, either express or
- *   implied. See the License for the specific language governing
- *   rights and limitations under the License.
- *
- *   Alternatively, the contents of this file may be used under the
- *   terms of the GNU Public License version 2 (the "GPL"), in which
- *   case the provisions of the GPL are applicable instead of the
- *   above.  If you wish to allow the use of your version of this file
- *   only under the terms of the GPL and not to allow others to use
- *   your version of this file under the MPL, indicate your decision
- *   by deleting the provisions above and replace them with the notice
- *   and other provisions required by the GPL.  If you do not delete
- *   the provisions above, a recipient may use your version of this
- *   file under either the MPL or the GPL.
- *
  * --------------------------------------------------------------------
  *
  * Inquiries regarding the linux-wlan Open Source project can be
diff --git a/drivers/staging/wlan-ng/prism2sta.c b/drivers/staging/wlan-ng/prism2sta.c
index daa7cc4e897c91..57180bb71699f7 100644
--- a/drivers/staging/wlan-ng/prism2sta.c
+++ b/drivers/staging/wlan-ng/prism2sta.c
@@ -8,27 +8,6 @@
  *
  * linux-wlan
  *
- *   The contents of this file are subject to the Mozilla Public
- *   License Version 1.1 (the "License"); you may not use this file
- *   except in compliance with the License. You may obtain a copy of
- *   the License at http://www.mozilla.org/MPL/
- *
- *   Software distributed under the License is distributed on an "AS
- *   IS" basis, WITHOUT WARRANTY OF ANY KIND, either express or
- *   implied. See the License for the specific language governing
- *   rights and limitations under the License.
- *
- *   Alternatively, the contents of this file may be used under the
- *   terms of the GNU Public License version 2 (the "GPL"), in which
- *   case the provisions of the GPL are applicable instead of the
- *   above.  If you wish to allow the use of your version of this file
- *   only under the terms of the GPL and not to allow others to use
- *   your version of this file under the MPL, indicate your decision
- *   by deleting the provisions above and replace them with the notice
- *   and other provisions required by the GPL.  If you do not delete
- *   the provisions above, a recipient may use your version of this
- *   file under either the MPL or the GPL.
- *
  * --------------------------------------------------------------------
  *
  * Inquiries regarding the linux-wlan Open Source project can be
-- 
An old man doll... just what I always wanted! - Clara

