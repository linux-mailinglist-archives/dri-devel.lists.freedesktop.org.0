Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF3D6894A0
	for <lists+dri-devel@lfdr.de>; Fri,  3 Feb 2023 11:03:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AA8410E749;
	Fri,  3 Feb 2023 10:02:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C34610E733;
 Fri,  3 Feb 2023 10:02:48 +0000 (UTC)
Received: by mail-pg1-x529.google.com with SMTP id n2so701929pgb.2;
 Fri, 03 Feb 2023 02:02:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qZM2kRnUMq/5JxUqAj92h8CE9Ys20GpS+bcD8sHbxGY=;
 b=MoBwsiFh+PQwRc+ml6iuRDqdl5/NFddPFYIwdi7shrfKdxQojJlglETNVcoxcFbeq7
 UQJl43hvF2JW+oxHrqZ+PYm/8YFRae3V0NrPaa5mTWI15gXYGncVGae9cCjpG4CRqMiA
 9Pj/x71a+1UhhPgRzHSlzVh6c2OeFmzl6woB/kPM1ATos4UIxHPHaPyDOJtH8wzgGaPO
 DkOEa4bmsfqANA9W0VKMMobCnKbwjAegUkH6avPb67JGriW6ySxlSlYNDw8esdDqQ5tq
 zt+gRScqxTBmdYI7AEl0bwX4sIa2Wv8t0T5OYVEzI8GAeVcWMrOHsv8qoHjy703uRwYJ
 T6rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qZM2kRnUMq/5JxUqAj92h8CE9Ys20GpS+bcD8sHbxGY=;
 b=sLMmkhiwlUgtXFokP/sVukDuPieTY+Qdm4KYX4yE9WE9PbVNsTXmVfeMKPL+gbFUq4
 lWV/grgiGHtclbdlSNPD1nd8flDLOVxnrk1S0qol6auirKiB8XRpNix4r1O77C1beru2
 RYmWPaxOQKjd2+WAQqDVwaL6AQRfIJMB8VUZLobEo5oGql6dTZkJ9D6DuhLb7Q+ANh+R
 5Px16Bgnx4PPHbvup7PaJJQyW+UdNJpxf5N5Enoo8wpZvrohbl3uek7LnOu3pBy5naaW
 miULOzB467lg1KTx2x9d/jv5/BQaOF4j5aWPC+8fhtGuCn44C0AxuKDKLOD5c4R2DYjT
 GzbQ==
X-Gm-Message-State: AO0yUKVN6jHwr6OYC4kEMNkvSX9nxUWNXrF64aNmy5+16oz1sDAqWlLR
 OnqScDpCsmfDcXQzgDgZw7U=
X-Google-Smtp-Source: AK7set90g3y3uA58nDdc57a7ikxwpTnV8UfDIaEQROixtGcb1zi0SwtESdeyB1ms4FZFJ3dF2+AdIg==
X-Received: by 2002:a05:6a00:1d85:b0:593:a3f1:7c04 with SMTP id
 z5-20020a056a001d8500b00593a3f17c04mr8761934pfw.8.1675418567508; 
 Fri, 03 Feb 2023 02:02:47 -0800 (PST)
Received: from debian.me (subs10b-223-255-225-232.three.co.id.
 [223.255.225.232]) by smtp.gmail.com with ESMTPSA id
 h2-20020a056a00230200b005898fcb7c1bsm1322187pfh.177.2023.02.03.02.02.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Feb 2023 02:02:46 -0800 (PST)
Received: by debian.me (Postfix, from userid 1000)
 id 01B981055BB; Fri,  3 Feb 2023 17:02:41 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Intel Graphics Development List <intel-gfx@lists.freedesktop.org>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: [PATCH 0/3] htmldocs fixes for next-20230203
Date: Fri,  3 Feb 2023 17:02:12 +0700
Message-Id: <20230203100215.31852-1-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=683; i=bagasdotme@gmail.com;
 h=from:subject; bh=nAqFypAiZuomaGsgK+qGsO/TWXGkM+TOboIWhpu6fPE=;
 b=owGbwMvMwCX2bWenZ2ig32LG02pJDMl3bs/Zx6DeNWPyHO/4uWqzTIRO5L1fe3PivJY695cfLve9
 2OpQ2lHKwiDGxSArpsgyKZGv6fQuI5EL7WsdYeawMoEMYeDiFICJ9C1h+B84Z3HYYaODyTlujAbnnS
 eXeDVt2p+5bN2Vxf9OeC6IOjyBkWHPo5c2AmbLPigoTbEp/KQVInNX7vySwz7vK2fMMn66dg8fAA==
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 Srinivasan Shanmugam <srinivasan.s@intel.com>,
 Matt Atwood <matthew.s.atwood@intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>, Hans de Goede <hdegoede@redhat.com>,
 Luben Tuikov <luben.tuikov@amd.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Bagas Sanjaya <bagasdotme@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Here are small htmldocs fixes for htmldocs warnings that are recently
reported for next-20230203. Each patch can be applied separately by
respective maintainers.

Bagas Sanjaya (3):
  drm/i915/doc: Escape wildcard in method names
  drm/scheduler: Fix elapsed_ns kernel-doc error
  media: v4l2-core: Describe privacy_led field of v4l2_subdev

 drivers/gpu/drm/i915/gt/intel_workarounds.c | 6 +++---
 include/drm/gpu_scheduler.h                 | 2 +-
 include/media/v4l2-subdev.h                 | 1 +
 3 files changed, 5 insertions(+), 4 deletions(-)


base-commit: 4fafd96910add124586b549ad005dcd179de8a18
-- 
An old man doll... just what I always wanted! - Clara

