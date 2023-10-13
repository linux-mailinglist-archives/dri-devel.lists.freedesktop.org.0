Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5807C90F9
	for <lists+dri-devel@lfdr.de>; Sat, 14 Oct 2023 00:49:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AC7110E67A;
	Fri, 13 Oct 2023 22:49:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D078510E64F;
 Fri, 13 Oct 2023 22:48:58 +0000 (UTC)
Received: by mail-il1-x133.google.com with SMTP id
 e9e14a558f8ab-351437112c1so9977835ab.3; 
 Fri, 13 Oct 2023 15:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697237338; x=1697842138; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5LQP5MFDhA+xfUDGLuGe24GCmwsysAw7CRqOtSg8az8=;
 b=gh1IywdElFUXwKPEUAUawVMRnjacgE2O632upVecKL8D7b9lN+Wsns50bN3KJGNK2p
 80fwODK/nSn0OWuA0eKWTTo2FDD+Kv2KKYEFbPz0kyfoyqDKLn254wbM2wepgvk7o3+d
 I5o4468fLjLsiuephUHm7EvX0xEWUvzyb2r9LL8b51UQN6bnKt3OKKtHy7Fp1xeL0uQm
 OVFgkzjemAKmBAnkdc+RRW++O0k4vpnwgL8XOb1ZzBdZx0w9U4gwQMPABMk3DnT8/f+j
 znETCgg2K5fmnhmKiSSe/GJrQI4MBEI97a4LTynFAFsVp2fdJIPg1Wb7aw6FtFm+P40+
 l4PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697237338; x=1697842138;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5LQP5MFDhA+xfUDGLuGe24GCmwsysAw7CRqOtSg8az8=;
 b=R/KZ2N0c+q3mEcwT2BzvBXEp1accVN7qyUgtBkyuu/l4HnDDKnzyfvZeujjSuw+u/q
 7x0bP4OTTZ2NevC3/qkVoNH00Mr7CvPWkFsO2V1f+rgGr/UWZUlJp+BnWKj4sZPw+k4X
 Yy1D7mlAAWU8aAiUeF3bbMtgt/ZwopwQN6JA0xGozpmx1GG6azIeCKdKYtAkDnoAvs4K
 OVboxKtsSeEwSK+5jPpeFyaP5OLrWyVnrTJAlCMnLQLZ4I4VXJaxnlwQ9AOSxD7D4i7U
 t6g0lYcVq2LJN3UuD3KcckFHM57aLtDs/wcbBelwTsbTlcYVdzANBbnhsetKG6Ttz5pF
 2PvA==
X-Gm-Message-State: AOJu0Ywuw+oJq5zi6THbjSA+QMvaIGDP3moWKZmGOzqpUzPJZsskH1fH
 8p3+DGlPa2KdCaONq5apPPY=
X-Google-Smtp-Source: AGHT+IEJ4ihDtxg4i0f+O3a1nP1WX/0PhyVsSYrOk6CkMFZeWPrAYYUPoiqiZdr7DHr2MyHDmzJNlQ==
X-Received: by 2002:a92:c269:0:b0:357:5234:802d with SMTP id
 h9-20020a92c269000000b003575234802dmr9521151ild.10.1697237338045; 
 Fri, 13 Oct 2023 15:48:58 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 t10-20020a92dc0a000000b003512c3e8809sm1683071iln.71.2023.10.13.15.48.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Oct 2023 15:48:57 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v7b 23/25] drm: use correct ccflags-y spelling
Date: Fri, 13 Oct 2023 16:48:15 -0600
Message-ID: <20231013224818.3456409-24-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231013224818.3456409-1-jim.cromie@gmail.com>
References: <20231013224818.3456409-1-jim.cromie@gmail.com>
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
Cc: lb@semihalf.com, groeck@google.com, linux-doc@vger.kernel.org,
 jani.nikula@intel.com, daniel.vetter@ffwll.ch, linux@rasmusvillemoes.dk,
 mcgrof@kernel.org, seanpaul@chromium.org, joe@perches.com, bleung@google.com,
 yanivt@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Incorrectly spelled CFLAGS- failed to add -DDYNAMIC_DEBUG_MODULE,
which broke builds with:

CONFIG_DRM_USE_DYNAMIC_DEBUG=y
CONFIG_DYNAMIC_DEBUG_CORE=y
CONFIG_DYNAMIC_DEBUG=n

Also add subdir-ccflags so that all drivers pick up the addition.

Fixes: 84ec67288c10 ("drm_print: wrap drm_*_dbg in dyndbg descriptor factory macro")
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 215e78e79125..22b1984cc982 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -3,7 +3,8 @@
 # Makefile for the drm device driver.  This driver provides support for the
 # Direct Rendering Infrastructure (DRI) in XFree86 4.1.0 and higher.
 
-CFLAGS-$(CONFIG_DRM_USE_DYNAMIC_DEBUG)	+= -DDYNAMIC_DEBUG_MODULE
+ccflags-$(CONFIG_DRM_USE_DYNAMIC_DEBUG)		+= -DDYNAMIC_DEBUG_MODULE
+subdir-ccflags-$(CONFIG_DRM_USE_DYNAMIC_DEBUG)	+= -DDYNAMIC_DEBUG_MODULE
 
 drm-y := \
 	drm_aperture.o \
-- 
2.41.0

