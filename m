Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E115A42D6E5
	for <lists+dri-devel@lfdr.de>; Thu, 14 Oct 2021 12:24:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 311E16EC63;
	Thu, 14 Oct 2021 10:24:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76C706EC1C;
 Thu, 14 Oct 2021 08:51:51 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 pf6-20020a17090b1d8600b0019fa884ab85so6395388pjb.5; 
 Thu, 14 Oct 2021 01:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FgQE+ym8i4wvHWS0EZRm4kYtX72BhEPEpt+mmgJQWzU=;
 b=Xs81szH6fvLJX08xpQvV2HVvRNkf8u3FuPzmn2p0CBDrrCQroTNy8XhTl9hVDXGQy5
 IAHOUEoId4sejVliRXRIhdhcmZHsQ8teSZflYqrXY/swUAu3xULh7EagfkRZI+hArOJc
 XAB3RQnemN2oZBhgos3tuwpgF5wKItJjBVriyG5V3OvystJ1kR0RbRk9JSzhgN0Aj/2M
 WZMV3WW7Q7PgoS8jL9QLd8kxv9FIAUrE1zVzjCNCzblqujSs02jVGBb8ekfnCpYAS4Ax
 frLMHrv0i5Tb1suOsGY7Qe4F4iX6C1kSLBRPVDA+zwrhzfmfG2oLf8uaC4XbPrzui0hP
 w66A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FgQE+ym8i4wvHWS0EZRm4kYtX72BhEPEpt+mmgJQWzU=;
 b=gD/oGWfM88JxS61UvSDhZcVkjhX4ygju1QP3xoxTzaWbAEc18UAuxbGKRf2mxmh339
 D3gs6/GCOPOm4eHgyZy1YgB/LiFJVqp7t2kx3LbOMoTHgve4/DVDWfkvzqzlcCzXm+aC
 WDaU1j/cM2gPKs8ssQEY8s3YfEWvwnO5PV3FUWbrwoZcOJhKDp26hs4Ci7frKkte1dru
 E93QxarX3S2kLAMc0DfJLCNP/Xv6qamq2HPZK+Q+Bum3Dl12PScfMBP4VE3qjjayLk42
 XtMCBmsqPo5aZSAJL32mQC0Yg+dTEC7ftTVHAbwSxbYg6OH8skwPk4kVcVr+6GiFQ2wa
 DxUA==
X-Gm-Message-State: AOAM530cDGviu1kaQnkqWF3aYVi2Xt3Wweh4DuVtAdrDGCBm3+CELzMZ
 NjV9Q0qxguy+0h2isqmK8N8=
X-Google-Smtp-Source: ABdhPJwxkwYvjtbetBrfk3EiM9oyFNUKrizOjVUXebdeDgAtZiGtoNhstxuwbMKuXEBYpxETOypi9w==
X-Received: by 2002:a17:90b:4c0d:: with SMTP id
 na13mr4851292pjb.232.1634201510946; 
 Thu, 14 Oct 2021 01:51:50 -0700 (PDT)
Received: from localhost.localdomain ([8.47.15.154])
 by smtp.gmail.com with ESMTPSA id i2sm7968082pjt.19.2021.10.14.01.51.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 01:51:50 -0700 (PDT)
From: Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To: robdclark@gmail.com, sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch
Cc: Yanteng Si <siyanteng@loongson.cn>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 0/2] drm/msm: fix build error
Date: Thu, 14 Oct 2021 16:51:32 +0800
Message-Id: <cover.1634200323.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 14 Oct 2021 10:24:16 +0000
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

Include linux/vmalloc.h to fix below errors:

error: implicit declaration of function 'vmap';
error: implicit declaration of function 'register_vmap_purge_notifier'
error: implicit declaration of function 'unregister_vmap_purge_notifier'

Yanteng Si (2):
  drm/msm: Fix missing include files in msm_gem.c
  drm/msm: Fix missing include files in msm_gem_shrinker.c

 drivers/gpu/drm/msm/msm_gem.c          | 1 +
 drivers/gpu/drm/msm/msm_gem_shrinker.c | 2 ++
 2 files changed, 3 insertions(+)

-- 
2.27.0

