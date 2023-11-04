Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C237E116D
	for <lists+dri-devel@lfdr.de>; Sat,  4 Nov 2023 23:53:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F87410E103;
	Sat,  4 Nov 2023 22:53:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com
 [IPv6:2607:f8b0:4864:20::112a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5E4210E0A0
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Nov 2023 13:47:29 +0000 (UTC)
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-5a7af20c488so35535907b3.1
 for <dri-devel@lists.freedesktop.org>; Sat, 04 Nov 2023 06:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ncf.edu; s=google; t=1699105649; x=1699710449; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QRyo4uayRcD1OGB0/F9hU4wPpRqY3YBFvShQiftusTQ=;
 b=KVov+77c+cpT5W9FqBrrdPCognwwaRIIr6oAf6/SQU760K6dltkFrdrrvrKJmcVAoo
 4NuAVFTrAnKxAbG21CN1KEghTpsB7cC0HU7Pnzr3cK2h23y3+oPntq2NWPsCw32dWGKJ
 F30jZ2WRnRXg7iG+IyEsJt9bqzhOKegRs2iZhBKsuQqw/axMRcu07xbS4/oJV7eTgaw0
 zzfN4GhfvxgkVioiaocbss9dl+i+PFtKYjCrTIdfi5UZWBw4zkO3OPvdrdtd29iE0lOw
 pV0xspxjNlNEUzqxI/ixV27p+qKMSv6cqMgPIHyHAwDUzsZ7lPHgTNDKSOYxj0WVMlcy
 itMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699105649; x=1699710449;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QRyo4uayRcD1OGB0/F9hU4wPpRqY3YBFvShQiftusTQ=;
 b=oBvbHJsPcKUcalooQLgw2lvvB67dwdRxmxM6NWFrS2wY++c5XpQgQESw+BvhXD4dSa
 TxkCOpDQCcJxCVWRlqsSPFvl21BTcDQdxPGJ2qfOGiC3/8eG1pzs4xBqYUcFHpWHjhBQ
 Qa69Vt3STK7UumIXxyMfXQeduN7XBF9gC8z9N6irdc0JpzZD0pUrGtt7d0uCkbJrW8bk
 W1rpQ4KhWmlP4VmqRy4JqjByo8cLdDmvoG6OBtfWEq3Rp2wn7ms07py8pA660tOou/jc
 cOg5AvFw/rmCFl+9hSOnx0WQRhvpmLYA3IAxnbDwuArqJ1wy6JaUP3qVrMWTDR4lY41h
 amyw==
X-Gm-Message-State: AOJu0YyPMjtHBoyB8RLKOX3W7CPffeeUNONjDFHsV/pavjmjJTfDxFXM
 Q8lX7B7pk4gRJqNOBqOEk3B1Xw==
X-Google-Smtp-Source: AGHT+IExWjX7G6DBFF4kwLIBDEgMe2CCFTXHC3Hx30D8yPn2WKmrR6jLGq4sGRWw1jQ8lSDpAO2cAw==
X-Received: by 2002:a05:690c:ecf:b0:5a7:bc78:81e7 with SMTP id
 cs15-20020a05690c0ecf00b005a7bc7881e7mr6540808ywb.30.1699105648902; 
 Sat, 04 Nov 2023 06:47:28 -0700 (PDT)
Received: from localhost.localdomain ([2601:580:8201:d0::c6a9])
 by smtp.gmail.com with ESMTPSA id
 p188-20020a815bc5000000b00559f1cb8444sm2088339ywb.70.2023.11.04.06.47.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Nov 2023 06:47:28 -0700 (PDT)
From: Hunter Chasens <hunter.chasens18@ncf.edu>
To: corbet@lwn.net
Subject: [PATCH v1] docs: gpu: rfc: i915_scheduler.rst remove unused
 directives for namespacing
Date: Sat,  4 Nov 2023 09:47:08 -0400
Message-Id: <20231104134708.69432-1-hunter.chasens18@ncf.edu>
X-Mailer: git-send-email 2.39.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 04 Nov 2023 22:53:43 +0000
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
Cc: tzimmermann@suse.de, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 mripard@kernel.org, Hunter Chasens <hunter.chasens18@ncf.edu>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Removed unused directives for namespacing I believe to have been
originally introduced as a workaround for a Sphinx warning.

Signed-off-by: Hunter Chasens <hunter.chasens18@ncf.edu>
---
 Documentation/gpu/rfc/i915_scheduler.rst | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/Documentation/gpu/rfc/i915_scheduler.rst b/Documentation/gpu/rfc/i915_scheduler.rst
index c237ebc024cd..23ba7006929b 100644
--- a/Documentation/gpu/rfc/i915_scheduler.rst
+++ b/Documentation/gpu/rfc/i915_scheduler.rst
@@ -135,13 +135,9 @@ Add I915_CONTEXT_ENGINES_EXT_PARALLEL_SUBMIT and
 drm_i915_context_engines_parallel_submit to the uAPI to implement this
 extension.
 
-.. c:namespace-push:: rfc
-
 .. kernel-doc:: include/uapi/drm/i915_drm.h
         :functions: i915_context_engines_parallel_submit
 
-.. c:namespace-pop::
-
 Extend execbuf2 IOCTL to support submitting N BBs in a single IOCTL
 -------------------------------------------------------------------
 Contexts that have been configured with the 'set_parallel' extension can only
-- 
2.39.3

