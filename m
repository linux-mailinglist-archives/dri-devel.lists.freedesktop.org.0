Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1260437F07F
	for <lists+dri-devel@lfdr.de>; Thu, 13 May 2021 02:39:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 196AB6E5B9;
	Thu, 13 May 2021 00:39:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDC606E5B9
 for <dri-devel@lists.freedesktop.org>; Thu, 13 May 2021 00:39:00 +0000 (UTC)
Received: by mail-qk1-x72d.google.com with SMTP id a2so24116171qkh.11
 for <dri-devel@lists.freedesktop.org>; Wed, 12 May 2021 17:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fpaQ5hUDMlQfsG0EH4pHt8PmhSpDBypKIHC4jY8sAL4=;
 b=Ci6WPM/MI3tUHmjkH6us9JM9QQH7+l+yVKYUjvM5yh+Fsiu0cHplcKlKtlLI5kSzzj
 JLwVDzmLTjYIUaShhM24HBfC1wK11jY2D8Mn/eKJo4g6osW5Zp984Jio1l0sbcFPla+o
 z/DKJ6APH7/LGvoIGeBIisEpfd11G6AHh5v/6U7pwzQnBPpjxTI8z1i3X52SZqhsXlmF
 FC31gNnZxxCk+XEq5/5/1RbIaaJAQyy0wc/lClwizGDXyrdizdZh3JkCrwjg2bOpR7E+
 II3+8MC+J460JA8lW9IqNuVVEf5C17iZjSgoxRvfUSaFTSNIRy95Y1AAyBHtJK/IXaVa
 BKjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fpaQ5hUDMlQfsG0EH4pHt8PmhSpDBypKIHC4jY8sAL4=;
 b=OJyYF4F7Z6bbCBvUT5akNl4IqYOaWN5BHf/Bmh4ZuHudAeqTiXAxuisdfOb/tu1VzQ
 9mQOasfP6SEUQWBvBgr1yNens7ri4myvtT2irzMQKEnYWbUwctlHBSIf3vjt5BpI4Fey
 Mza5SWvYjDDdSSF7w51C8QluGcNTjdYRb+y7Pju77loby9FaqPey//sx9jm8uGm43una
 qGRt1Con2UKFNNytDACqFyy+lrwo6PsBOIUV+MPgewnRDP14UNYzRQLLR0K6XbfCGoJu
 36Jj0Y1TWTL2DXwfVP5A6RXsQf5LJ46BRwJnW+uyJRpOdaRYOQlZWOFgMVn13EDSUDC3
 FagA==
X-Gm-Message-State: AOAM531WBvjlwGKqrEPUMFJ/Hpl3WirgIexE7dBR+/bW3R99wrtCwCc+
 OSllCw53GpT7+DErCr5XeURY6w==
X-Google-Smtp-Source: ABdhPJzeXxYFHXADz5y/uwXcsiFsr488IEe98cMBVvUCBZ7+DFPHBQDjnQf20QToRZ3i6CYBm4JQRw==
X-Received: by 2002:a37:c0e:: with SMTP id 14mr3526092qkm.255.1620866340036;
 Wed, 12 May 2021 17:39:00 -0700 (PDT)
Received: from localhost.localdomain
 (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
 by smtp.gmail.com with ESMTPSA id w16sm1204201qts.70.2021.05.12.17.38.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 May 2021 17:38:59 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Subject: [PATCH 0/5] drm/msm/a6xx: add support for Adreno 660 GPU
Date: Wed, 12 May 2021 20:37:44 -0400
Message-Id: <20210513003811.29578-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
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
Cc: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Douglas Anderson <dianders@chromium.org>, kbuild test robot <lkp@intel.com>,
 David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Iskren Chernev <iskren.chernev@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Dave Airlie <airlied@redhat.com>, Jordan Crouse <jordan@cosmicpenguin.net>,
 Sean Paul <sean@poorly.run>, open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for Adreno 660 to the drm/msm driver. Very similar to A650
on the kernel side.

Jonathan Marek (5):
  drm/msm: remove unused icc_path/ocmem_icc_path
  drm/msm/a6xx: avoid shadow NULL reference in failure path
  drm/msm/a6xx: add support for Adreno 660 GPU
  drm/msm/a6xx: update a6xx_ucode_check_version for a660
  drm/msm/a6xx: add a660 hwcg table

 drivers/gpu/drm/msm/adreno/a6xx.xml.h      |   4 +
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c      |  32 ++++--
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c      | 115 ++++++++++++++++-----
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c      |  33 ++++++
 drivers/gpu/drm/msm/adreno/adreno_device.c |  13 +++
 drivers/gpu/drm/msm/adreno/adreno_gpu.c    |   5 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  14 ++-
 drivers/gpu/drm/msm/msm_gpu.h              |   9 --
 8 files changed, 176 insertions(+), 49 deletions(-)

-- 
2.26.1

