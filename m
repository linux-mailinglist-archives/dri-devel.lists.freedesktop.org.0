Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E306F350BD1
	for <lists+dri-devel@lfdr.de>; Thu,  1 Apr 2021 03:24:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DAED6EBFD;
	Thu,  1 Apr 2021 01:23:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C76D76EBFD;
 Thu,  1 Apr 2021 01:23:56 +0000 (UTC)
Received: by mail-pg1-x52c.google.com with SMTP id l76so527119pga.6;
 Wed, 31 Mar 2021 18:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2OZG+O20zktXv8NsZQbXT4tTLbC2WfocmfwxuY758Yw=;
 b=W0nlURh/fdJ2uFh2SqFnYzWDiwK43B+uGadvn8W5L1ci6rFaDy+NdxT6/vKI7dxpY3
 QmKbODoln6safTTbvOf1W/Gtp/k8Qso+Bdrgvzc0LJQJEeI1W5AyywQCcvi2D7Q/lTY5
 0QRzjCapxDm4y2FroNsb49ga+WvyBhRKOrVnFarBIj6ug+ZQLxLp2BKMK7yjh2MhzKOq
 89yjiVvxwn7Dh7fU9hl/tUI5Ytl8+A/TD/KHXZm6WM+SofNF1g5R0B/btRz1TxvcWH+F
 wr9aMEtI12vmZaPzCyPWdgBNUJ5e2WXlsrHMHz85I7OsmwJJv/PI1qTVDmCej2pnw5Su
 QPJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2OZG+O20zktXv8NsZQbXT4tTLbC2WfocmfwxuY758Yw=;
 b=N9vAzFAJ6ozWHShvTHFl/vaFKQnYEFEmJ1PuioS3EKUlzk4SLWk7/6A2jmNyinZL/2
 g8sVFioL6UoU6M6yg5XfY7FDGU07bP4KIjxMCBXfnDKytveXFxWvm73pB+wgnkRorDyw
 zezu4eyk7DtX4dW7EljKEj5+SEcvtAciOZ/OVpBZzCm0Is5OwW8Mlg6tjMrePKGiAgCH
 pyT895WttYFeKg2WMVYotcPUf8h6wKRuXFWp8AzOS+ZH4sID8WITUlzE6ci9/cQ3X2Lb
 z9m/ifshXiPBY3gmFdeEkN6pdkHX26czReAy9oNNjyC/M9frH85+U2uOpIJSTDisDpjf
 mqCg==
X-Gm-Message-State: AOAM530sxXrw21kTkIxkBkOky1nmjujWE5wt858bPfig50FKsEP/r/9+
 DZUvNCi46YG2Irn4o+S5fjqQNAhFyfBK9g==
X-Google-Smtp-Source: ABdhPJxWNVCU8igKasbpVovJ1j4gGoVwVRMetgYIVXl1Uz4inRuJNKzWf3MODUk2A7/R07p/mphVSQ==
X-Received: by 2002:a65:4046:: with SMTP id h6mr5408383pgp.345.1617240235769; 
 Wed, 31 Mar 2021 18:23:55 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id m7sm3351081pjc.54.2021.03.31.18.23.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Mar 2021 18:23:54 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/4] drm/msm: Remove unused freed llist node
Date: Wed, 31 Mar 2021 18:27:18 -0700
Message-Id: <20210401012722.527712-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210401012722.527712-1-robdclark@gmail.com>
References: <20210331221630.488498-1-robdclark@gmail.com>
 <20210401012722.527712-1-robdclark@gmail.com>
MIME-Version: 1.0
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Douglas Anderson <dianders@chromium.org>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Unused since commit c951a9b284b9 ("drm/msm: Remove msm_gem_free_work")

Signed-off-by: Rob Clark <robdclark@chromium.org>
Tested-by: Douglas Anderson <dianders@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index b3a0a880cbab..7a9107cf1818 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -78,8 +78,6 @@ struct msm_gem_object {
 
 	struct list_head vmas;    /* list of msm_gem_vma */
 
-	struct llist_node freed;
-
 	/* For physically contiguous buffers.  Used when we don't have
 	 * an IOMMU.  Also used for stolen/splashscreen buffer.
 	 */
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
