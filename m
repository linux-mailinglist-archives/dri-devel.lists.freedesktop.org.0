Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BEFF296A3D
	for <lists+dri-devel@lfdr.de>; Fri, 23 Oct 2020 09:23:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC62D6E4AF;
	Fri, 23 Oct 2020 07:22:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1DB76E0B7
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Oct 2020 13:17:06 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id 77so2234097lfl.2
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Oct 2020 06:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4cZy/AjqiPLBBzbbE7V3tBG3u2sp2EHfPGRBFkrlTaM=;
 b=FsGguWzrpplV4xHNmKGYDfgZPhItHJckO1QODklJHOpKes8Qos3h4xh8ChFRcgSbcK
 D62cd+ruCBaXJu/t4VPJW56lHd9b8fsF3Ni4RGyX41Tg/MHdW79SACyy4K1/R+3rK53k
 JIix5Fuc3w4+sRD1Obz4eFTCdrmRY19ui/V8mJYYvLPwSli8JxTy9a27UBur5oZObppO
 pcjP29jvMZCRma9p+wKLhVeEcZm7NYmgu65ixISNUPLu2CZ1YFMX6xiEpRrrUhGpRIML
 MPK6J98Ic8kZzu379ElWtOgfeqVfb/Q1Gqshrhd/85cH2Aw0CMyfDhQONMWplMiVIPdo
 jYAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4cZy/AjqiPLBBzbbE7V3tBG3u2sp2EHfPGRBFkrlTaM=;
 b=Fp6og9cLCHKM3ykkokd9IlZCfRe4EFN40Z3uINaBvvcaXUB5j8x6UdUHglDozJx3St
 aKCjDvT3h4X2QK9yC2dhTKc5MuOvEgsPuy12Q3psRU8wJuxc95ZW/90KfPuuu6Auq1cV
 E+7hqPaGAyAlcR0GSud7ti2d0YV/fjK1Aw6ZaGDUf7QafPuh0TdvRBWSMpMD7M6OZ/qq
 QeD1fF2+0Qu/cC/VIHvg7F28WLf903dMAjYxVDXWfVf7Rj+YhPUyw1VK+iQsD1aFQewi
 hdPY/tCyKNk2+ubki+NhHyGI6XcoKUXB175ton6wI9c7rZJe4eVgCLo/lKf7YborOPWj
 8Law==
X-Gm-Message-State: AOAM530q7vfIb2SkyG4w49WukByYE2naylUOuz4ozB13uCAVCTbrDd8C
 8Wn+HCrS7m+ixMeb4quI+iKNvA==
X-Google-Smtp-Source: ABdhPJyEIkAP9fTCR/BTts4yu+rqPpOxob4rKB3tnkdtba+DmfmCYVJQNBt/OsFlnhXj0KdLdkH7qw==
X-Received: by 2002:ac2:4ec8:: with SMTP id p8mr806198lfr.433.1603372625381;
 Thu, 22 Oct 2020 06:17:05 -0700 (PDT)
Received: from eriador.lan ([188.162.64.195])
 by smtp.gmail.com with ESMTPSA id j10sm308514ljb.93.2020.10.22.06.17.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Oct 2020 06:17:04 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 0/5] drm/msm/dpu: implement merge3D support for new platforms
Date: Thu, 22 Oct 2020 16:16:53 +0300
Message-Id: <20201022131658.181363-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 23 Oct 2020 07:22:29 +0000
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
Cc: David Airlie <airlied@linux.ie>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Compared to SDM8450 DPU devices with active CTL support (SC7180, SM8x50)
have merge support implemented in a separate hardware block, which is
not supported at this point. Add support for dualpipe configuration on
these platforms. Tested on Qualcomm RB5 (SM8250) platform.


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
