Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 050AD5AC7A7
	for <lists+dri-devel@lfdr.de>; Sun,  4 Sep 2022 23:49:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0140B10E3E6;
	Sun,  4 Sep 2022 21:43:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C651E10E279;
 Sun,  4 Sep 2022 21:42:56 +0000 (UTC)
Received: by mail-il1-x132.google.com with SMTP id a9so3885645ilh.1;
 Sun, 04 Sep 2022 14:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=58gChvxjBedxDU/dSXgKq8f75Aq/PMP0VWOkECUeGr8=;
 b=J2tQsdq2kkHf85Z9ASRTiHs9OI3ZDVILIcK9yZOObu9+KlrqqjVNIjRz1rl5rphOwC
 2Qfnz0oI/RsX3V70MD8E8G/yZztrNm2ZfOZnCp9690q1IH4JJ+adDmarycETlY/12rhr
 Db+6+SqEctFD/7m0SrX4AuGqEeuaJOmohsGrTlCLPTPTc/eFNhQn9dKNl96NeOx5rxdC
 vum//49JpYe1Z4oGVnwyv1uBitMZ8t5aokHuE388ICOZLGyjaZC6ZUwl7qnvJ1ZVUgUl
 OCs0CimfeNixxoHVLc+cIByGyUxmeix8tj9SCyBEQkzsOFFYl2FMPL60Yd7P36fczO+9
 Pthw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=58gChvxjBedxDU/dSXgKq8f75Aq/PMP0VWOkECUeGr8=;
 b=40EF5BeWK2riML1AnsptLdQO1pAJ4GmMCO6f4hyXKhH5A1sfUXMGkN9Zk2v/tlrnED
 WhACTNdfVmmYswZ5PBpZOineVllPf57uN3yOPIApcP5VSvTh74SqtpLde4vc7c9QdeTv
 3I88cCiLbVJkwsXYAqUVzEvfR8JqQUJg9zyShyFUMAAPJ98sdfaShY+OFUAELebydSA9
 3sxe2b+7lGKjG80YZvWYDHEQW/kttlCDz9mHC7Wgz4gCEPU5z3gE7oBUcFqCXVHIecc5
 nU4ZIB+LQPkVVe4K+KtMPFfEybbtFg9y0pbIJcW+g2FF0wLwD0iT91tEc10F57EzRsEp
 ZEdA==
X-Gm-Message-State: ACgBeo2DxxsLqoT1UUh4A1gNYDI7M3njNEjEXApkVpkaKH4cMr02TnK/
 g8wMpsKEYlqXYkzceJuhXEA=
X-Google-Smtp-Source: AA6agR61bCYoBFhO606MrMj2e5JJ9ontZpH/7gcxtdHyPlYtKYvvYkTqL53A1Ak5xf1hQmk380rWDQ==
X-Received: by 2002:a05:6e02:16cd:b0:2ea:e75b:f357 with SMTP id
 13-20020a056e0216cd00b002eae75bf357mr19038138ilx.110.1662327776105; 
 Sun, 04 Sep 2022 14:42:56 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 e12-20020a056602044c00b006889ea7be7bsm3727688iov.29.2022.09.04.14.42.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Sep 2022 14:42:55 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v6 48/57] dyndbg: add .gnu.linkonce slot in vmlinux.lds.h KEEPs
Date: Sun,  4 Sep 2022 15:41:25 -0600
Message-Id: <20220904214134.408619-49-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220904214134.408619-1-jim.cromie@gmail.com>
References: <20220904214134.408619-1-jim.cromie@gmail.com>
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
Cc: daniel.vetter@ffwll.ch, linux@rasmusvillemoes.dk, seanpaul@chromium.org,
 joe@perches.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add linker symbols and KEEPs for .gnu.linkonce.dyndbg and
.gnu.linkonce.dyndbg_sites sections, placing them in front of their
respective dyndbg and dyndbg_sites sections.

This placement gives us a known relative offset (ie -1) from the start
of the vector to the header, letting us use container_of to get it.
The _index added previously allows determining &descs[0] from any
desc[N].

The .gnu.linkonce. collapses possible multiple declarations into a
single allocation, with a single address.

todo: will need similar for modules.lds.h

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/asm-generic/vmlinux.lds.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index 1e7ee65e8591..20fdea9efd78 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -348,9 +348,13 @@
 	__start___dyndbg_classes = .;					\
 	KEEP(*(__dyndbg_classes))					\
 	__stop___dyndbg_classes = .;					\
+	__dyndbg_header = .;						\
+	KEEP(*(.gnu.linkonce.dyndbg))					\
 	__start___dyndbg = .;						\
 	KEEP(*(__dyndbg))						\
 	__stop___dyndbg = .;						\
+	__dyndbg_site_header = .;					\
+	KEEP(*(.gnu.linkonce.dyndbg_sites))				\
 	__start___dyndbg_sites = .;					\
 	KEEP(*(__dyndbg_sites))						\
 	__stop___dyndbg_sites = .;					\
-- 
2.37.2

