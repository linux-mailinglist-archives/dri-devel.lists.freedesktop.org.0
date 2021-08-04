Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88FAE3E0862
	for <lists+dri-devel@lfdr.de>; Wed,  4 Aug 2021 20:57:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB5146E436;
	Wed,  4 Aug 2021 18:57:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF2266E436
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Aug 2021 18:57:09 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 mz5-20020a17090b3785b0290176ecf64922so10117614pjb.3
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Aug 2021 11:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZHflD7ez33Y655W2pyErkoI42ri2rt1vKuccx591AVM=;
 b=JgQtfjKMOAwoO3L5UxagBr66RSVmG7LOu+wnko3dl12u3Gy9kh3/DQdtCOi8WOD9oO
 dMbUN7EfTCNJYhg93eSU+z7+cfGAayLoIAJeTONWUKFi11PpOlpkyTv84Hj6C8g27fT3
 EfIOOQ8cIyKKWvKENl6IMrqf5CbUgQbi/0l/COSdGDzWi7xpss152lZNYE89YE47gv/6
 Nv49g877VtUkEwESGKWr3zHQIBf20dRpdP0BfkLSwtKV9zmArOAy6H/9klJugdHKd1PF
 TVGQmlMoaJuCuGCwLTjdd6AmbwdR4irx/qjzBHjlrGE7vnjzOYVjvgocMrMX5d01BGgw
 kMsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZHflD7ez33Y655W2pyErkoI42ri2rt1vKuccx591AVM=;
 b=gYtHMBu7+qp6yKYNrycr4repFTzuPKCJ8mqUT69acu7V3ignHb4DXCdGro4H43V42n
 O0R6jB3Qul7skIcVc6eHvZNbn+ZxZyhc+4urMOmyLgFvBtvj3HTC3dTQNekPFWmsP56z
 U+CdZvt/NKytgF+EjT+OjO9F7harx6mWhfwjT+MR39tNAn/NW7KPDreT24jR2lvoycdo
 Tq1ifR5m6ipdPVkaPS/Xw+vGqwPAVfByu3ej2GfgpBcTomQqRiLGs0+XkP1EDndIbPeT
 5evqxo8etfkCmKiIBECIKyWOcGmk5tSkvBFMnJ4nHu3ZNP4caHx72f45wvpyqHw0ROlP
 yohw==
X-Gm-Message-State: AOAM533Q9Oh6ZlNSeE2Grc7xQMX0BwnGX9k/l9k3Zmsn00q/w5vfi7DS
 Ky2dIGlV0KEypVnrBV4YRww/U6qUSC6L8jIO
X-Google-Smtp-Source: ABdhPJyyj+z4NGba3txANF4BdvcmRZ5JE+Y3ccR3GOQY2CWAzxrkyJKn8otIjkOtPyxWnYLDt9aXkw==
X-Received: by 2002:a63:62c7:: with SMTP id w190mr18285pgb.55.1628103429125;
 Wed, 04 Aug 2021 11:57:09 -0700 (PDT)
Received: from omlet.lan ([134.134.139.85])
 by smtp.gmail.com with ESMTPSA id d17sm3694006pfn.110.2021.08.04.11.57.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 11:57:08 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: dri-devel@lists.freedesktop.org
Cc: Jason Ekstrand <jason@jlekstrand.net>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Dave Airlie <airlied@redhat.com>
Subject: [PATCH] docs/drm: Add a new bullet to the uAPI requirements (v2)
Date: Wed,  4 Aug 2021 13:57:04 -0500
Message-Id: <20210804185704.624883-1-jason@jlekstrand.net>
X-Mailer: git-send-email 2.31.1
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

While tracking down various bits of i915 uAPI, it's been difficult to
find the userspace much of the time because no one bothers to mention it
in commit messages.  Require the kernel patch to be a one-stop shop for
finding the various bits which were used to justify the new uAPI.

v2 (Daniel Vetter):
 - Minor wording tweaks

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Dave Airlie <airlied@redhat.com>
---
 Documentation/gpu/drm-uapi.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
index 199afb503ab1..7b398c6fadc6 100644
--- a/Documentation/gpu/drm-uapi.rst
+++ b/Documentation/gpu/drm-uapi.rst
@@ -109,6 +109,11 @@ leads to a few additional requirements:
   userspace patches land. uAPI always flows from the kernel, doing things the
   other way round risks divergence of the uAPI definitions and header files.
 
+- The kernel patch which adds the new uAPI **must** reference the patch series
+  or merge requests in the userspaces projects which demonstrate the use of the
+  new uAPI and against which the review was done so that future developers can
+  find all of the pieces which tie together.
+
 These are fairly steep requirements, but have grown out from years of shared
 pain and experience with uAPI added hastily, and almost always regretted about
 just as fast. GFX devices change really fast, requiring a paradigm shift and
-- 
2.31.1

