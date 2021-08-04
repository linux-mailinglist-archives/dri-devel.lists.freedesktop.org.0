Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB6293E0823
	for <lists+dri-devel@lfdr.de>; Wed,  4 Aug 2021 20:48:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E8636E11F;
	Wed,  4 Aug 2021 18:48:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F1DD6E11F
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Aug 2021 18:48:21 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 j18-20020a17090aeb12b029017737e6c349so6480903pjz.0
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Aug 2021 11:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CzG2FRpQq4GQGHqHEFpqswVyF/E6iIZT1I4e0pVCjrs=;
 b=z1V1AlsXLpzTdRc8PHs4TyChd/8FJo1XFk/J2zB1DdxzoGe2weHUR7mKLtY0a+vDFG
 EyeH8XRGCdkxmHI5tHr0edh0fUHr5HVhQzPvoeqX+wo5/F3Qo4iaDmdFsooGd9ruKPYy
 2JjGcQtengX4nD8apulzOwhlx19zbo4vS320dfJgM7JjS/djQWNLugNNPRyDMAD1XmQZ
 lYw4aDvm24VMzQEDmFUoxagDNb1d5hSZ8lBGdZFlYByb+dw1QOuYIhuN12pXD74xGz1v
 z2tXXkdiJv7rOeSXjkMptDzvYlSu4ViIITwPpqBHbH+lJOr0aHGu4QizFEH1zFqjadW3
 CVlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CzG2FRpQq4GQGHqHEFpqswVyF/E6iIZT1I4e0pVCjrs=;
 b=JmEXVs0FlRCU93CHIzmImxn+m7M1gK74K6DsAA5JD9Te8bl0bSHBIWUf7smKQLElS4
 v6IJttaeUVTxNoqcxLPss3tlFRzog59N0BvVwazjJZSHCP4avC/mGpLhfyz9aQqh5UTo
 eUmirYDZAJL1RLY9q/AnMcQkFNW1XZIsG4uC+T7Sw9Go+Si3w8aZTiOCic1WD9IHfKhP
 pbmzPOiFwsEemrH5TH76Cq2w207Q+onnB63dVtclsp5h7t0Vm639WB7o5jmb8fWtrrJh
 6Wyy3rF+rWjVndl1nzqbZObtbaS5tW/Vnh1wbGYx3p5RupGfTBLaFuWw/cPkUa0OOW4b
 Jycw==
X-Gm-Message-State: AOAM5326v0xkF83dGMqSjEhROZkF4wCU03kZfZS4GnL55ofmuzTADPnF
 7IY3gbePmE7cEKAXzSEVZB1Iw+np3Ldu2VSc
X-Google-Smtp-Source: ABdhPJxcqa7wdIBOqnzmHkXV2lApX+tDbn3/yS7HsXZZ54THd7GgBR5wRkM+waRxxNAL5mDhrM1RgQ==
X-Received: by 2002:a62:1609:0:b029:3ab:afdb:acf3 with SMTP id
 9-20020a6216090000b02903abafdbacf3mr1074565pfw.43.1628102900434; 
 Wed, 04 Aug 2021 11:48:20 -0700 (PDT)
Received: from omlet.lan ([134.134.139.85])
 by smtp.gmail.com with ESMTPSA id h5sm3693004pfv.145.2021.08.04.11.48.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 11:48:20 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: dri-devel@lists.freedesktop.org
Cc: Jason Ekstrand <jason@jlekstrand.net>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Dave Airlie <airlied@redhat.com>
Subject: [PATCH] docs/drm: Add a new bullet to the uAPI requirements
Date: Wed,  4 Aug 2021 13:48:16 -0500
Message-Id: <20210804184816.623950-1-jason@jlekstrand.net>
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

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Dave Airlie <airlied@redhat.com>
---
 Documentation/gpu/drm-uapi.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
index 199afb503ab1..82f780bc3fce 100644
--- a/Documentation/gpu/drm-uapi.rst
+++ b/Documentation/gpu/drm-uapi.rst
@@ -109,6 +109,11 @@ leads to a few additional requirements:
   userspace patches land. uAPI always flows from the kernel, doing things the
   other way round risks divergence of the uAPI definitions and header files.
 
+- The kernel patch which adds the new uAPI **must** reference the patch series
+  or merge requests in the userspaces project which use the new uAPI and
+  against which the review was done so that future developers can find all of
+  the pieces which tie together.
+
 These are fairly steep requirements, but have grown out from years of shared
 pain and experience with uAPI added hastily, and almost always regretted about
 just as fast. GFX devices change really fast, requiring a paradigm shift and
-- 
2.31.1

