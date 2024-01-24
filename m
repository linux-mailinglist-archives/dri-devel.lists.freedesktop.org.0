Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9411683A795
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jan 2024 12:19:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D7A910E9C0;
	Wed, 24 Jan 2024 11:19:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FDC110E9C0
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jan 2024 11:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1706095179;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=5Tdg6Pxwo5yb88aEPcd5SX3GxtpgWjx+EchJ6YmUkm4=;
 b=VlmhM4YzPNTrzRwA9dZAR+sTGxsOWz4nnwUIMN3vb7qbawzx6MAa09EqzBgKyVZyZ4A1F9
 TyniG307np35UB1ooH60hAhtiTsMZMBnijpth1wDQsIsrmRbn6BITOEsCSRTKNZcxJy0Zl
 gBc4acreRRdqXciaBSUqbk817qeOQcM=
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-684-eEVZZIFPNn2UR7hJK9w6kQ-1; Wed, 24 Jan 2024 06:19:38 -0500
X-MC-Unique: eEVZZIFPNn2UR7hJK9w6kQ-1
Received: by mail-vs1-f71.google.com with SMTP id
 ada2fe7eead31-46976c07c39so683406137.0
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jan 2024 03:19:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706095177; x=1706699977;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5Tdg6Pxwo5yb88aEPcd5SX3GxtpgWjx+EchJ6YmUkm4=;
 b=M/OPb1bWBGNg0DdNsqJO69x0O2ulg55mfGNEQnWH+E9tk32motkB7mkYM2ylhyLsP1
 M4svWbMMc+43EOyS5VHiiglKq52v+HW1HMT1rYNQJwnFcnUz56vhNyeP/WuZnFujCNTn
 8532yqfB35qq/e4z4hm+eanl1iajVWDV/0aCmVgDHm/yiBlcqXM0nPXZlZzYZivKsSen
 LiXr7iFZuYAr6f1iED2vNCAg3xJMDZryk5kg0sd78UpQS0SIhUrcD+vOXuBSaJO9Zq4x
 h2AjNb9wo12KL4HJTCCTT3qZGPjK+86L6eAMsGbfaX+VD05KbtJfIoJ7yb+jEt59itYs
 r2pg==
X-Gm-Message-State: AOJu0YzCScBMWc4cTVEg+mqIY/XqW9n6Hx6TPJC2hUwm5AtmbfN+VCko
 Rpg6970uHB8VZm1C8ks1Ut9t2HLK9lRrQR2+6oYi849ojBN3Q0Q3GqP9uhygFdf/kYbhrOG5KMc
 Dp8RW8YjCEW6gps3/skBfGjErM7E+pLHAbP03DUz32XfFpLLiCNZffQ2Y/5DVzHejvc0+kyI3hw
 ==
X-Received: by 2002:a67:cf4d:0:b0:469:aec1:b425 with SMTP id
 f13-20020a67cf4d000000b00469aec1b425mr1668117vsm.3.1706095176874; 
 Wed, 24 Jan 2024 03:19:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFfq/53hwK5W6EYfpAy/CIrTd6ajQQRINtlI/Tva0zppHFqHuvfSChD8fb6zOGYnC6pXS//nA==
X-Received: by 2002:a67:cf4d:0:b0:469:aec1:b425 with SMTP id
 f13-20020a67cf4d000000b00469aec1b425mr1668087vsm.3.1706095176567; 
 Wed, 24 Jan 2024 03:19:36 -0800 (PST)
Received: from pstanner-thinkpadt14sgen1.muc.redhat.com
 (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 ql3-20020a056214540300b00686aa6dbcbfsm1027016qvb.81.2024.01.24.03.19.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jan 2024 03:19:36 -0800 (PST)
From: Philipp Stanner <pstanner@redhat.com>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v4 0/2] drm/imx/dcss: implement region request and devres
Date: Wed, 24 Jan 2024 12:19:03 +0100
Message-ID: <20240124111904.18261-2-pstanner@redhat.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: linux-arm-kernel@lists.infradead.org, Philipp Stanner <pstanner@redhat.com>,
 NXP Linux Team <linux-imx@nxp.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

@Laurentiu:
Thank you very much for the review. I was indeed on an older branch. As
Linus's master is currently broken for ARM64 [1], unfortunately, I built
it instead against:
60096f0a77600ac2cc92b82fee279d1905576950

Hope that's fine.


Changes in v4:
- Add Laurentiu's Reviewed-by to patch #1
- Remove unnecsseray struct device pointers from all touched files
- Rebase against newer kernel due to changes in dcss_drv_platform_remove()

Changes in v3:
- Fix build errors (missing variable, forgotten remove to call of deleted
  function)

Changes in v2:
- Add the region-request to this patch-series. That was previously a
  separate patch.

dcss currently does not request its memory resource. This series adds
that request with devres. As we're at it, it also ports all the ioremaps
and associated allocations to devres.

I can build this, but I don't have the hardware available to test it. So
you might want to have a closer look.

P.

[1] https://lore.kernel.org/lkml/45ad1d0f-a10f-483e-848a-76a30252edbe@paulmck-laptop/


Philipp Stanner (2):
  drm/imx/dcss: request memory region
  drm/imx/dcss: have all init functions use devres

 drivers/gpu/drm/imx/dcss/dcss-blkctl.c | 13 ++-----------
 drivers/gpu/drm/imx/dcss/dcss-ctxld.c  | 14 +++-----------
 drivers/gpu/drm/imx/dcss/dcss-dev.c    | 19 +++++++++----------
 drivers/gpu/drm/imx/dcss/dcss-dev.h    |  1 -
 drivers/gpu/drm/imx/dcss/dcss-dpr.c    | 21 +++------------------
 drivers/gpu/drm/imx/dcss/dcss-drv.c    | 12 +++---------
 drivers/gpu/drm/imx/dcss/dcss-dtg.c    | 26 +++++---------------------
 drivers/gpu/drm/imx/dcss/dcss-scaler.c | 21 +++------------------
 drivers/gpu/drm/imx/dcss/dcss-ss.c     | 12 +++---------
 9 files changed, 31 insertions(+), 108 deletions(-)

-- 
2.43.0

