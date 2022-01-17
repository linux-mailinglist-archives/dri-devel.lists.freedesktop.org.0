Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE814903FF
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jan 2022 09:38:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EDF510E136;
	Mon, 17 Jan 2022 08:38:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8759A10E136
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 08:38:31 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id 128so9602314pfe.12
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 00:38:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/T33RHWOQc5pzbPE0ffvrM3mXshEH5+43Yne4cdEAaE=;
 b=qK4qFlrU11uCBM7/cT9juSnIpKrxZB16E9Pb85F473qDlnIP/oqadcjQbeugZnuCcq
 5GiHBmxFu7HhwrkEg6dJOeOuN0elj/wo21Ep2a4k5uDyIYdhoIymvUsIfxYHq28lHBMA
 5xAcGfALj8p0WY52FiC67n9jNQ3+1LB8cuhz9MOcRqTZ2UaOPIBAHCG1ZUDAuZ4OdEJW
 TmzJpFqkQ8DgBAwqMaQXdDK5vG2QSK3uNy0Zihf8Y20mVszZBGPMH4oATVzh63ZEA6+W
 9VHJc6soo90e76Imv/OBX0pP2REIIPOqU8wYBibjU4adaA+nDJeopMw4HbchDHoES61L
 q11g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/T33RHWOQc5pzbPE0ffvrM3mXshEH5+43Yne4cdEAaE=;
 b=vbTFrnEHHExFUGWtxz0xIZcFyZk6jXhjb9r9hr/KMhfWRP2bk3fa2zt3aOX7iVnLcR
 +3FeX2eg+6zJP+qMvvupEhldvmwQFGp6nYCfT4C5Nxnea2wKGeW2NcMRM4yia2mGqvK3
 sOGzXyg9yD6kjotNoDB7slt/SeKynKPN8jTH2yBgpkXDWqaNweA1iTjMSlVNXwcLhZ05
 rjKl7E1A6gx8rA2yzDb6ltuggviwzDABl/57qTO64tx2PH8AIYk/1tXiYjDj7CdW6HAA
 5UuRakh52JKZbcPKx+gLXyw5bRyoeOfpU41rYXow3OdIiXLw6AXsY795FzC585+ep6Uf
 3y3w==
X-Gm-Message-State: AOAM533AlOwREnPM51K5H8qFXbiBCgSIv+iFrVM3jGAMYOY/le3rRqg+
 yC9OWwSj/WwpRW8NDTpj6eA=
X-Google-Smtp-Source: ABdhPJxLpvslHwTJ0OknxPpRG7dW67M4XmqAj4vIfiB7do+vHK9KfGfw6xQpiJxoD2v44WiCSHT4Pg==
X-Received: by 2002:a63:350c:: with SMTP id c12mr18258702pga.568.1642408711173; 
 Mon, 17 Jan 2022 00:38:31 -0800 (PST)
Received: from nj08008nbu.spreadtrum.com ([103.6.5.6])
 by smtp.gmail.com with ESMTPSA id pg9sm7260181pjb.44.2022.01.17.00.38.24
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 17 Jan 2022 00:38:30 -0800 (PST)
From: Kevin Tang <kevin3.tang@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, mark.rutland@arm.com, javierm@redhat.com,
 tzimmermann@suse.de, lukas.bulwahn@gmail.com
Subject: [PATCH v2 0/3] sprd drm cover letter
Date: Mon, 17 Jan 2022 16:38:17 +0800
Message-Id: <20220117083820.6893-1-kevin3.tang@gmail.com>
X-Mailer: git-send-email 2.29.0
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
Cc: devicetree@vger.kernel.org, kevin3.tang@gmail.com, zhang.lyra@gmail.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 orsonzhai@gmail.com, zou_wei@huawei.com, pony1.wu@gmail.com,
 dan.carpenter@oracle.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

v1:
  remove the selected DRM_KMS_CMA_HELPER in kconfig
  drm-sprd-fix-potential-NULL-dereference

v2:
  fix commit comments long lines issue and drop "On linux-next" comments
  Split checking platform_get_resource() return value to a separate patch
  Use dev_warn() instead of removing the warning log

Kevin Tang (3):
  drm/sprd: remove the selected DRM_KMS_CMA_HELPER in kconfig
  drm/sprd: fix potential NULL dereference
  drm/sprd: check the platform_get_resource() return value

 drivers/gpu/drm/sprd/Kconfig    | 1 -
 drivers/gpu/drm/sprd/sprd_dpu.c | 5 +++++
 drivers/gpu/drm/sprd/sprd_drm.c | 2 +-
 drivers/gpu/drm/sprd/sprd_dsi.c | 5 +++++
 4 files changed, 11 insertions(+), 2 deletions(-)

-- 
2.29.0

