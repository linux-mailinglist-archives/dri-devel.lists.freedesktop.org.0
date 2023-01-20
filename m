Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35976675114
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 10:28:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0FD410E93F;
	Fri, 20 Jan 2023 09:28:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B57910E93F
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 09:28:45 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 f12-20020a7bc8cc000000b003daf6b2f9b9so5379272wml.3
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 01:28:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=csxV7SBcRMOtyGwXXr6VYNEIrNsBq0mzq7uR5oLy8sw=;
 b=VYpnC/cOlpiHsNoVzbSFm5Pp66EorTVLht/M0vNOywX6Jw6WZGYBYlLa4V+WQGI2TX
 3lhve4nIMd91sJcMEMKN+7W0JPNrdfo1qYfCUktVTqjJuopusR3wrPB2pA4/HLpIIrEw
 FmFzPYhL7p23K2XPFxqOL8mgkV6g9jASqSe1WYwSguYIOnyYjoLDbytDLibSkJ+E1ahV
 CKYRL7mJ+4OTnR9e8cCaq4r60zv0UvR/ShCGhiTxmUC0Z3L1xmLCcNi3RnZyNqIeADHN
 EKVQYhkbOVNCm8kSkDfb5KLFu7dlM3yW4mu3jrcZ2D/mFR/HqAtrVUPfw2kksem9BmjX
 rIoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=csxV7SBcRMOtyGwXXr6VYNEIrNsBq0mzq7uR5oLy8sw=;
 b=pcvSugAua+CeXMKR5sf/CnSqPQSdzY5BK5za2FF0Be/nGz1LJpPlTNQDKiv+l8LrIC
 dA7CnjiGaud612TphYdnuB03jfHgvi8jI6HkeTkMU2yo3lNfuaSUXjv2BFfEOdImGBiO
 VJquH6bUnaqfDGBcIGnKAcU53Feb7sjKtLcplUCyqxCWHwP0OuX0GXm9OUnxtEuIAz8k
 /qH3uU2+MweG4bQu7BWqFs2j/TOXHBa6j+TGNRieqq2+5AvsVCbISkRfnJ1bz2jnrJaO
 nqmJV8fzabiSymTrL9uGmvap/MCebvs227nGNseWpzeHKKeJWjlU26L1tMItt7wXp7mJ
 gpCA==
X-Gm-Message-State: AFqh2krTcGh8/VgcMsCsG6yhBS0LM+qxfyyW1AIGoKbC8i8qfCQcRtd/
 VTB5ycxqX5o6m4KJudENsZc=
X-Google-Smtp-Source: AMrXdXtAnv1VnjoW886QL9Vu3rdysDqbLp9waCd/Qgh+W86DERrCHcfZk/wkz5cU7w1CwOKs5L0/Vw==
X-Received: by 2002:a05:600c:54eb:b0:3da:2090:d404 with SMTP id
 jb11-20020a05600c54eb00b003da2090d404mr13381883wmb.18.1674206923943; 
 Fri, 20 Jan 2023 01:28:43 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194]) by smtp.gmail.com with ESMTPSA id
 d19-20020a05600c34d300b003a6125562e1sm1675318wmq.46.2023.01.20.01.28.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jan 2023 01:28:43 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, dri-devel@lists.freedesktop.org
Subject: [PATCH][next] accel/ivpu: Fix spelling mistake "tansition" ->
 "transition"
Date: Fri, 20 Jan 2023 09:28:42 +0000
Message-Id: <20230120092842.79238-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There are spelling mistakes in two ivpu_err error messages. Fix them.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/accel/ivpu/ivpu_hw_mtl.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_hw_mtl.c b/drivers/accel/ivpu/ivpu_hw_mtl.c
index b59b1f472b40..62bfaa9081c4 100644
--- a/drivers/accel/ivpu/ivpu_hw_mtl.c
+++ b/drivers/accel/ivpu/ivpu_hw_mtl.c
@@ -608,7 +608,7 @@ static int ivpu_boot_d0i3_drive(struct ivpu_device *vdev, bool enable)
 
 	ret = REGB_POLL_FLD(MTL_BUTTRESS_VPU_D0I3_CONTROL, INPROGRESS, 0, TIMEOUT_US);
 	if (ret) {
-		ivpu_err(vdev, "Failed to sync before D0i3 tansition: %d\n", ret);
+		ivpu_err(vdev, "Failed to sync before D0i3 transition: %d\n", ret);
 		return ret;
 	}
 
@@ -621,7 +621,7 @@ static int ivpu_boot_d0i3_drive(struct ivpu_device *vdev, bool enable)
 
 	ret = REGB_POLL_FLD(MTL_BUTTRESS_VPU_D0I3_CONTROL, INPROGRESS, 0, TIMEOUT_US);
 	if (ret)
-		ivpu_err(vdev, "Failed to sync after D0i3 tansition: %d\n", ret);
+		ivpu_err(vdev, "Failed to sync after D0i3 transition: %d\n", ret);
 
 	return ret;
 }
-- 
2.30.2

