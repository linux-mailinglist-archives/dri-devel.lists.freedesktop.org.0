Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3BB41D10F
	for <lists+dri-devel@lfdr.de>; Thu, 30 Sep 2021 03:44:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ED386EB1B;
	Thu, 30 Sep 2021 01:44:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57BC76EB18;
 Thu, 30 Sep 2021 01:44:40 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id e144so5578313iof.3;
 Wed, 29 Sep 2021 18:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ag+4yNg3t4lDobvnoXDI3lx/G6JRcztPX349EfTrvys=;
 b=XA15C3MS+Ru70z9K5PsYOaBwzptA+i62Y+vQntpRsUlukIjSnmeJDdPy2atqjE4DQR
 upfKCZTzoypEmAcTBoDbVGcEycJBD/EsN9lwpZmGmbVzEshIauR/Th4Sg6ZyVkxKuGZx
 oOq8Vk6++/nCq19t1N0DSSwrCudU9Ekp9hio0+CM4o9vwyxXn2HufWdP0VBIhzTJJja/
 HjfYjviablg2wJeVWudVV0StGkDHDeAq7qRuWywrOcOcgaAEViNTpRhJTx7bj85adxQo
 Flq1RK8Idpuec8A5BjLGPihMJ1cq2L31ryzrAtm+4gvFYUJsmSSshaOW4A778StHdkWL
 1toQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ag+4yNg3t4lDobvnoXDI3lx/G6JRcztPX349EfTrvys=;
 b=CTIhZuRgUX4D3ZyWel3BQ5TSUcoSyf6bg/TX1VGRp0x5nNeuFJ41c9OiL6beM+i9NC
 r6ziTysjqZpovbMHZza7pF6TgEQleGXR7NJb0rLBLeLp7ZBQZy++rS16WCrEMqQHQ2cR
 EooARV8eLzOm7I2AY9C3q4UNbwhF3K6hRaIQwmFHdpdnI3o+bCtuv/Dfyc9dWljDpGcQ
 IuxeXs3i+0dJNfg0q3mssbkcBTSS03VVA7+GPuR7bgr5Apxtp++eotMxPa/Wde11Wk0p
 OWuyy+6AIYKEeeXVn2uPq+2bEaU2m6kQxLFxSNLluYLoW0KKoN5IbbiHo6GBNAO0Qu7/
 +pGg==
X-Gm-Message-State: AOAM531WqCkismmFgFbem1JG1IuKenCTunxFo3i5ktouPTeckpkxS7pO
 xd0nkkVCDNO7rHuwJdKHr0FxVb3rPLQ=
X-Google-Smtp-Source: ABdhPJw9+lHlgC4C0Iib/UIs9kg4hYI1KRlIi8BBpwfD2Erth25p4XAh09jmFmHvTdGWPRLhCLs9Aw==
X-Received: by 2002:a5d:9145:: with SMTP id y5mr2010979ioq.200.1632966279194; 
 Wed, 29 Sep 2021 18:44:39 -0700 (PDT)
Received: from samwise.. (c-24-9-77-57.hsd1.co.comcast.net. [24.9.77.57])
 by smtp.googlemail.com with ESMTPSA id h23sm1155414ila.32.2021.09.29.18.44.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Sep 2021 18:44:38 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH 0/4] drm: maintenance patches for 5.15-rcX
Date: Wed, 29 Sep 2021 19:44:23 -0600
Message-Id: <20210930014427.14239-1-jim.cromie@gmail.com>
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

hi drm folks,

Heres a small set of assorted patches which are IMO suitable for rcX;
one doc fix, 2 patches folding multiple DBGs together, and a format
string modification.

Jim Cromie (4):
  drm: fix doc grammar error
  amdgpu_ucode: reduce number of pr_debug calls
  nouveau: fold multiple DRM_DEBUG_DRIVERs together
  i915/gvt: remove spaces in pr_debug "gvt: core:" etc prefixes

 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c | 293 ++++++++++++----------
 drivers/gpu/drm/i915/gvt/debug.h          |  18 +-
 drivers/gpu/drm/nouveau/nouveau_drm.c     |  36 ++-
 include/drm/drm_drv.h                     |   2 +-
 4 files changed, 191 insertions(+), 158 deletions(-)

-- 
2.31.1

