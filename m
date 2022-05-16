Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED607529442
	for <lists+dri-devel@lfdr.de>; Tue, 17 May 2022 00:58:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4490A10F003;
	Mon, 16 May 2022 22:57:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CBB510EAE3;
 Mon, 16 May 2022 22:57:12 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id a10so17586673ioe.9;
 Mon, 16 May 2022 15:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MiJjjZdxaha67CSMTI1r0BLom3ol2jA6WSWjlEZ1BTo=;
 b=j1OPvP3C9jzXimCIyP8PoqRmxw+BRCMFtN3Kc98fXUqazTR8W99pYA0kCZDMXLOLJp
 +oKyHJsCC6GTmZKC8UHw5tKkI2nbsmIVzY7pic2mn4wdDsjnCh6KCE5yKjVzDgizKEXb
 V3v9TU4a1CZ0xaEdkmhZV9JCIy/2uJtBGE4KztwXV0xXvP00wJo6EJgx3XrgcmCEjvDB
 mHakjZoZWxRSjEBcGXCCfFXU5ecCp+sOoXTR/H9XJxden/M+lBntak5Xol5WL17PMKh5
 fn6faaYJtp/pPNfh6627Fd/dGtn8PSYKoRU5O5s3eXW0TPxxlmwJGHlpmuBKvnl2hB8Q
 tu7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MiJjjZdxaha67CSMTI1r0BLom3ol2jA6WSWjlEZ1BTo=;
 b=KrW30m0kc5nmMlW+SxJNsL2O7gRD7Jr8AcckhWEVjBKYXqq1MVuzxKD4ebjBcTKJdi
 BOxmvI17tUCF6Al9lL0yxAKFgCEVjqbL8sRWJVtU1OC8D0MeNK3KeJIehgCX9cKMi1+y
 8bET0ZgfQIEc+ihjcNV7umNjQqXv9kxUlpIG+cuSRAuT+ipkuMJtWgbDcJFuvcRugs05
 tet4P/GR4hQcOiBEjKMd/WK23rcr1jwzVuHC2qHEib724ZVjeRNOFCIXCzN4g+hWpgH8
 MJebwpkn1imbv4sfvVhfW1SOrUBufVtS8hcNmOKOSWH3uLp9o8u4E4PUvrFlZtyC7l7r
 rd7A==
X-Gm-Message-State: AOAM531vKeA9Ta0x32MqHyxxdFPVvnjo9pFDmEs8e20R9cteCU/6B+sh
 IrxQMkdWj1MlJM0hnCLF9Xo=
X-Google-Smtp-Source: ABdhPJzg3E6Dvu2xvvEgwlGLUhvaUBtxTTam4Jtwh7ic+r/MBjnynyLt4vZbjaxcZ8EUCArbYeUCRw==
X-Received: by 2002:a05:6638:616:b0:32e:614:9c4b with SMTP id
 g22-20020a056638061600b0032e06149c4bmr8948820jar.203.1652741831372; 
 Mon, 16 May 2022 15:57:11 -0700 (PDT)
Received: from frodo.hsd1.co.comcast.net ([2601:284:8204:2010::dd9f])
 by smtp.googlemail.com with ESMTPSA id
 k26-20020a02661a000000b0032b74686763sm3133949jac.76.2022.05.16.15.57.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 15:57:11 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 09/27] Doc/dyndbg: document new class class_name query
 support
Date: Mon, 16 May 2022 16:56:22 -0600
Message-Id: <20220516225640.3102269-10-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220516225640.3102269-1-jim.cromie@gmail.com>
References: <20220516225640.3102269-1-jim.cromie@gmail.com>
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
Cc: maz@kernel.org, quic_saipraka@quicinc.com, catalin.marinas@arm.com,
 arnd@arndb.de, gregkh@linuxfoundation.org, linux-arm-msm@vger.kernel.org,
 rostedt@goodmis.org, mingo@redhat.com, mathieu.desnoyers@efficios.com,
 quic_psodagud@quicinc.com, daniel.vetter@ffwll.ch, seanpaul@chromium.org,
 will@kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The added paragraph is slightly process oriented, rather than in
language of guarantees; I thought the implications were clear enough.

It does perhaps undersell the selectivity gained with string
class_names; only drm/* would sanely register DRM_UT_CORE etc, so
doing multiple "module {drm*,amdgpu,i915}" queries is unnecessary.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 Documentation/admin-guide/dynamic-debug-howto.rst | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Documentation/admin-guide/dynamic-debug-howto.rst
index a89cfa083155..01ca6f635dcc 100644
--- a/Documentation/admin-guide/dynamic-debug-howto.rst
+++ b/Documentation/admin-guide/dynamic-debug-howto.rst
@@ -35,6 +35,7 @@ Dynamic debug has even more useful features:
    - line number (including ranges of line numbers)
    - module name
    - format string
+   - class string (as known by each module)
 
  * Provides a debugfs control file: ``<debugfs>/dynamic_debug/control``
    which can be read to display the complete list of known debug
@@ -142,6 +143,7 @@ against.  Possible keywords are:::
 		 'file' string |
 		 'module' string |
 		 'format' string |
+		 'class' string |
 		 'line' line-range
 
   line-range ::= lineno |
@@ -203,6 +205,15 @@ format
 	format "nfsd: SETATTR"  // a neater way to match a format with whitespace
 	format 'nfsd: SETATTR'  // yet another way to match a format with whitespace
 
+class
+    The given class_name is validated against each module, which may
+    have registered a list of known class_names.  If the class_name is
+    found for a module, callsite matching and adjustment proceeds.
+    Examples::
+
+	class DRM_UT_KMS	# unless DRM wants different
+	class JUNK		# silent non-match
+
 line
     The given line number or range of line numbers is compared
     against the line number of each ``pr_debug()`` callsite.  A single
-- 
2.35.3

