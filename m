Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9529377DA4
	for <lists+dri-devel@lfdr.de>; Mon, 10 May 2021 10:04:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B175089FF7;
	Mon, 10 May 2021 08:04:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 980216E1F6;
 Sun,  9 May 2021 14:50:40 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id b15so11890058pfl.4;
 Sun, 09 May 2021 07:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bz8P1nZoUMT1v+PZjFbkPen/qOCExDvSHfDWKtBldgY=;
 b=k/Efj0VxOLnEitzgW/jLeQUTvNCDM1rnJkA1jWgkvJx+ic7PPM1mFNamQy/29LQiBb
 6S0WQjY5cEvp0fgqqFNO5Xpj30M0Sl1MQL2do3pekttEaR62JYdXpxCYiS/ZjZSl0gnC
 Wa+Ykz/2O1A1wedeTI5ql780tHgdegHObqerCSdMkFh8PN4VyLpz4dZ/IbfuM72YXrl+
 1KVSnSURz8NGBy/sbZYFxbXm7/99Yl37EjYrPpFEcgjzbZpup8acOatrRmVBeq2D7odX
 mmBt6WjjHOQI9Yl1wKYRwGDZYOHPOUnIBp1rp3EzW1ydhKw+5QrQ82y20XDBh3/ZB1V8
 WldQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bz8P1nZoUMT1v+PZjFbkPen/qOCExDvSHfDWKtBldgY=;
 b=W0ejrq3/kEaRTyfjWDGmcDBt0UUPtwAzd2fVMuUy0pL4G+JLvPk0LSAJ7SbHPy4Kir
 BJDu2LIbuRkPCQATp/FXqnICX83plrXIz3KdpApyZKdc7uQHRoMlzA2XIB2PSbu1r201
 +Hk9ghtskSZPssja75s47EeA8Im8UFulxC505/R5XhzfHoiTELRN/F8/sBkRLEnX2Bnd
 3qtkXJ6C1dAu2JP85wLiPiz9B4LgUEpf7Iv7b6kPR420fvT/cfbrtSItn/d91sBOZME5
 OXVTw5nxM83i95fOZbOmHcTEl/Rl6oltqVVEgcWvCk/8YyyKpyfM+iDNa20+vtt8fJDj
 OYSQ==
X-Gm-Message-State: AOAM532erzVRQO2eW31PrnUFIGISgdKTE4JoEj0IwO8nrQpOT+hoM23R
 77BoP51v77AaGb/D8vj5KKFS4x6DKwFkvtu55VU=
X-Google-Smtp-Source: ABdhPJxtOy3inc148leudhozlWQYkcstye2E7St5sE+gvTakogQlfT5Ml/TJK5sfdIi/CscHWhigQg==
X-Received: by 2002:a63:9612:: with SMTP id c18mr1553295pge.29.1620571840169; 
 Sun, 09 May 2021 07:50:40 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:9004:6c18:2a60:b7b4:ea0e:f455])
 by smtp.gmail.com with ESMTPSA id r63sm17043720pjg.46.2021.05.09.07.50.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 May 2021 07:50:39 -0700 (PDT)
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@linux.ie,
 daniel@ffwll.ch
Subject: [PATCH] drm/amd/amdgpu: Fix errors in function documentation
Date: Sun,  9 May 2021 20:19:23 +0530
Message-Id: <20210509144923.6316-1-dwaipayanray1@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 10 May 2021 08:04:24 +0000
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
Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 lukas.bulwahn@gmail.com, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix a couple of syntax errors and removed one excess
parameter in the function documentations which lead
to kernel docs build warning.

Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c | 3 +++
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c  | 1 -
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
index ae9fb2025259..312f24004413 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
@@ -320,11 +320,14 @@ static int amdgpu_ras_debugfs_ctrl_parse_data(struct file *f,
  * "disable" requires only the block.
  * "enable" requires the block and error type.
  * "inject" requires the block, error type, address, and value.
+ *
  * The block is one of: umc, sdma, gfx, etc.
  *	see ras_block_string[] for details
+ *
  * The error type is one of: ue, ce, where,
  *	ue is multi-uncorrectable
  *	ce is single-correctable
+ *
  * The sub-block is a the sub-block index, pass 0 if there is no sub-block.
  * The address and value are hexadecimal numbers, leading 0x is optional.
  *
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index 16252d48e5a4..7e1a67295106 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -2796,7 +2796,6 @@ long amdgpu_vm_wait_idle(struct amdgpu_vm *vm, long timeout)
  *
  * @adev: amdgpu_device pointer
  * @vm: requested vm
- * @vm_context: Indicates if it GFX or Compute context
  * @pasid: Process address space identifier
  *
  * Init @vm fields.
-- 
2.30.2

