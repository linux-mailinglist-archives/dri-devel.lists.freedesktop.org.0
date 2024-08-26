Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ECCC95F145
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2024 14:25:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDF6110E1F2;
	Mon, 26 Aug 2024 12:25:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FRveN8z5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A02710E1EE
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2024 12:25:47 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-5bed72ff2f2so5218884a12.2
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2024 05:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724675145; x=1725279945; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Vhdgn8wDn5XDKZdaWj/YI4H1m4ky6MdIjePQT7kdXL4=;
 b=FRveN8z595hiN497jX3Fak2dXXgM84U7RySv2Rf+uZFzWvcusbkUhxo6CkXdh8jBG9
 Fk/JQpw7Hp3RRMTroK+BEk50V74FxsZjbqad0rYj1+7Dt+rLRHD9P9JUhaYuuP9DSTLw
 oeCZ6EQM0u6V++ifHCforZNZkN7peQ3YdpeMP7pp2xN8MAtEEvggaLS0t8O61uOCDor0
 W9vmle6mod8dsRqO6f9BalsIhEDjaZWt3jXa8/Rpcro/Pg/4Jb/NgC+KIoBLgd9LYKGw
 jfRyAySY4LrRnDcdJuAj4ml/C58S+z6W/1hGT0p8U6++KfgKSgjbWQuk5jhUph6y2qZQ
 AEFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724675145; x=1725279945;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Vhdgn8wDn5XDKZdaWj/YI4H1m4ky6MdIjePQT7kdXL4=;
 b=pssS+yYWiuhHGv+udTpwf9rGsIfEKRgBkkQ7SjnU4GrpRz/0/9zNp41/zLTlgsi6fg
 9PjpiuJFVj9oX3sBTaEow9Jz6fHwU0WLClQ4fEswexOK+M+txNBh4ocJGxgpuS+gcRwf
 hK3tA9DYJjts9RFNImn7IYOac4RByVT7ZQSMVj00ObrfDPa1jRMuOGQ80GkZchMu8bIz
 5ymd4JvF8Or2kkwFrnx7XcxGyMiUSwp6PsSgT2jK1xaZL5fkaNiliK+M9whcPxdrHXmU
 slMKnYi1iD9CWYpovBxdLPy62Ml3aZ2GFuFVOuQ4p2+rSH2NGj7a9vA7CK2QizvdHJXu
 aBSg==
X-Gm-Message-State: AOJu0YxNZf3aUNE0OwaUgGruh6kHQDBM6n6QF2fAEeVnTaw91OEM6BZz
 4yVd0MgJ2kJcWgvnvNxavHdRO+4qWXLG3IzEHD3jXimvBn0g5k0P
X-Google-Smtp-Source: AGHT+IFlLtVgaQhSgekEoMzGf3p4VRuZWMLJmZSLRiyX79GBPlBXhI2kzD9eZt/sBWOGpikZ8U/Juw==
X-Received: by 2002:a17:907:86a0:b0:a86:843e:b3dc with SMTP id
 a640c23a62f3a-a86a54ccefcmr603802066b.62.1724675145125; 
 Mon, 26 Aug 2024 05:25:45 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:1594:dd00:26ff:beb7:f040:ba50])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a868f28f122sm655073066b.49.2024.08.26.05.25.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Aug 2024 05:25:44 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel.vetter@ffwll.ch,
	vitaly.prosyak@amd.com
Cc: dri-devel@lists.freedesktop.org,
	ltuikov89@gmail.com
Subject: [PATCH 3/4] drm/doc: Document submission error signaling
Date: Mon, 26 Aug 2024 14:25:40 +0200
Message-Id: <20240826122541.85663-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240826122541.85663-1-christian.koenig@amd.com>
References: <20240826122541.85663-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Different approaches have been tried to signal resets and other errors in
vendor specific ways which not only resulted in a wide variety of
implementations but also repeating the same bugs and problems over different
drivers.

Document that drivers should use dma_fence based error signaling which is
vendor agnostic and allows userspace to query submission errors in generic
non-vendor specific code.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 Documentation/gpu/drm-uapi.rst | 27 ++++++++++++++++++++-------
 1 file changed, 20 insertions(+), 7 deletions(-)

diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
index 370d820be248..b75cc9a70d1f 100644
--- a/Documentation/gpu/drm-uapi.rst
+++ b/Documentation/gpu/drm-uapi.rst
@@ -305,13 +305,26 @@ Kernel Mode Driver
 ------------------
 
 The KMD is responsible for checking if the device needs a reset, and to perform
-it as needed. Usually a hang is detected when a job gets stuck executing. KMD
-should keep track of resets, because userspace can query any time about the
-reset status for a specific context. This is needed to propagate to the rest of
-the stack that a reset has happened. Currently, this is implemented by each
-driver separately, with no common DRM interface. Ideally this should be properly
-integrated at DRM scheduler to provide a common ground for all drivers. After a
-reset, KMD should reject new command submissions for affected contexts.
+it as needed. Usually a hang is detected when a job gets stuck executing.
+
+Propagation of errors to userspace has proven to be tricky since it goes in
+the opposite direction of the usual flow of commands. Because of this vendor
+independent error handling was added to the &dma_fence object, this way drivers
+can add an error code to their fences before signaling them. See function
+dma_fence_set_error() on how to do this and for examples of error codes to use.
+
+The DRM scheduler also allows setting error codes on all pending fences when
+hardware submissions are restarted after an reset. Error codes are also
+forwarded from the hardware fence to the scheduler fence to bubble up errors
+to the higher levels of the stack and eventually userspace.
+
+Fence errors can be queried by userspace through the generic SYNC_IOC_FILE_INFO
+IOCTL as well as through driver specific interfaces.
+
+Additional to setting fence errors drivers should also keep track of resets per
+context, the DRM scheduler provides the drm_sched_entity_error() function as
+helper for this use case. After a reset, KMD should reject new command
+submissions for affected contexts.
 
 User Mode Driver
 ----------------
-- 
2.34.1

