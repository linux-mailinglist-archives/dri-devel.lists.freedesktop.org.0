Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6FE7BB0AF
	for <lists+dri-devel@lfdr.de>; Fri,  6 Oct 2023 06:10:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D80C210E1CE;
	Fri,  6 Oct 2023 04:09:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5798410E1CE
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Oct 2023 04:09:56 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id
 46e09a7af769-6c49f781855so1104229a34.3
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Oct 2023 21:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696565395; x=1697170195; darn=lists.freedesktop.org;
 h=message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3WsyJr/JfGO9ZomYRC8lC2LpPAdcpUdaon1QvBmnp74=;
 b=b2pKHQ4JUuMKR0ZMl60h95iwtLiKRzOx1V9JOCzo9D1RB9qdwQt8g7qkq8+RwUGsyq
 li7RX0KGmzvFt1hR8ujAZfBgNMSyZnnwks45qdcqcSMfdMyeHx0+pw44+H5su8SIpD6L
 idnAvKaYWEtIpfYcpmXHVuIwglq5q01z4l8VtGQuzQHLcA3aT0DyqnmCydlZxocLU1Q4
 ndV7xfEdqZU7zHF9nnBvfcWO14GrzcIikhAFP0joIYnohcD3eX+kCbVZHNJFoAC5Z9cU
 3cBzjkcD25QKRibby9GREr7fv7zzZgDL4eWnvhismUSSTwFLlM994jY3v5ZmP2Epk35v
 oUmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696565395; x=1697170195;
 h=message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=3WsyJr/JfGO9ZomYRC8lC2LpPAdcpUdaon1QvBmnp74=;
 b=YHNkH8k2qurmsghhhNYnnB2xnaLCEvO6CwLBtkF3cKyVEGcsyRV0HUQ8eoyuQT1qsY
 Ytc8Qxt3JVKE+Iv+WeN20QzsSnXmrXy0VPlab6z8QSgOcV70oAwkypFcXrDv2CXf+jGf
 ehbl176ykcq6221H8dqwsBDl1J+29yv+Js3NsGloKjavrIyuc07CAu5qng/fdHhpeFEy
 H5eOHGooG2biTGGs2GksK0Dv+IxFFvSzJnwXUzJ4hh94iq6pBZi9xyQdP0deW98KrATn
 ywicFHgd4RhWbqAIKYlia7WXSsy0IlnDNgK/1AOoagOTwM/oGnTEQHMx/lJYzOUqkVRi
 VCLQ==
X-Gm-Message-State: AOJu0YyZs/MFqCSg14arJ/KS/4ZPySzD2Pj4qhd7C3dgo9KUkgyfWsBy
 9KbZEWIQixC3EF4gEPtlnkR0kmL7wZG26w==
X-Google-Smtp-Source: AGHT+IFCd0i4QvBKYK+f8dhJ5cI0/kA3DGkHoagfKKeFHK1BPBs24cJNRsGhsisXeu/pFhEPdsv3Fg==
X-Received: by 2002:a05:6870:ac26:b0:1b3:9e41:de07 with SMTP id
 kw38-20020a056870ac2600b001b39e41de07mr8591032oab.36.1696565395120; 
 Thu, 05 Oct 2023 21:09:55 -0700 (PDT)
Received: from daeinki-virtual-machine.localdomain ([58.124.60.88])
 by smtp.gmail.com with ESMTPSA id
 h19-20020aa786d3000000b0068ff267f092sm391590pfo.216.2023.10.05.21.09.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Oct 2023 21:09:53 -0700 (PDT)
From: Inki Dae <inki.dae@samsung.com>
To: airlied@linux.ie,
	daniel@ffwll.ch
Subject: [GIT PULL] exynos-drm-fixes
Date: Fri,  6 Oct 2023 13:09:50 +0900
Message-Id: <20231006040950.4397-1-inki.dae@samsung.com>
X-Mailer: git-send-email 2.17.1
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
Cc: linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave and Daniel,

   Just one fixup to a potential error pointer dereference.

   Please kindly let me know if there is any problem.

Thanks,
Inki Dae


The following changes since commit 8a749fd1a8720d4619c91c8b6e7528c0a355c0aa:

  Linux 6.6-rc4 (2023-10-01 14:15:13 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos tags/exynos-drm-fixes-for-v6.6-rc5

for you to fetch changes up to e49c384dc1c62fb5bf57c7bf6598957197e57919:

  drm/exynos: fix a potential error pointer dereference (2023-10-06 12:30:23 +0900)

----------------------------------------------------------------
One fixup
- Fix a potential error pointer dereference by checking the return value
  of exynos_drm_crtc_get_by_type() function before accessing to crtc
  object.

----------------------------------------------------------------
Xiang Yang (1):
      drm/exynos: fix a potential error pointer dereference

 drivers/gpu/drm/exynos/exynos_hdmi.c | 2 ++
 1 file changed, 2 insertions(+)
