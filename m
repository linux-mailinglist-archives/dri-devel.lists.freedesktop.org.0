Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B16741290F
	for <lists+dri-devel@lfdr.de>; Tue, 21 Sep 2021 00:53:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B4236E899;
	Mon, 20 Sep 2021 22:53:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F6D56E898;
 Mon, 20 Sep 2021 22:53:27 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 me5-20020a17090b17c500b0019af76b7bb4so574324pjb.2; 
 Mon, 20 Sep 2021 15:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SVS+ocUKu9OsVC90CLv74eixl2aJmx8d2sPxrzZwEjQ=;
 b=NPywaaPdEPnB5ULpVEMSkN7lBLfW6U/xsPr4Punnrmt4p15v3pDblNFSWYCl+L2B0C
 TmqLUxUpmswDb2kSEKUxd+0YMRzI14+l6Kihcy1kwng4LYG5cvKTR09y4B5aLCIC6Eqm
 HeVvU/ODqHMae+XapUoypIVGkdSGXtgc5By+xTzub9/mV9D7yGlZS8i+5nzJP6PfrIaD
 D1lzL8eeFda9N+GG7A9lQruYkJTynIs1dLy0iC/IxGa0GNeUIjY85u4diQ1cH3na+2cM
 9jDhXg0W62iaY8lOhEZeuERbwW7/VYmUfYBFzXzaSJwO3emF4Nd2naN4OVQPN7Nw0Wkx
 bIhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SVS+ocUKu9OsVC90CLv74eixl2aJmx8d2sPxrzZwEjQ=;
 b=ojPuVV3JN5jjr2oCBdrdVEHKN2wUppnsRZ58XlOwti1H6ywelnFYYa2Vh9b57eQvI3
 VcRCwMxWrL8SpPVn6aHRkHU1fJro6wVmbcMPxhqMtgc+nTHWJdnbliOEPQXAmLyG/WFx
 cj6vh2MtgdG+Bs0Prog176hvZN45zrMeWtd4fWA7hzeY2WDwK3IMgPGI+617GBX4U5ii
 0kvY52nwpPbxfvd4I3W0p7+jEo5ZuSQdVb/uFs/30L6V7MJTWepm/ainY9R0ECfGBgAg
 eGtXYvaAgUviA/D2xn7wSIh5qjppNN6FY+FDQpgzxg8GtX575/+X1NuTY+bLg1+AfN/w
 CJ7A==
X-Gm-Message-State: AOAM532NySg8ETqP6ygvfvBdNagW8FnmoFknPTvJg5iAHAn1nlYIxAgX
 OR+C1Rbq6yojh9OHDm3iKvSHJ0uvwDk=
X-Google-Smtp-Source: ABdhPJyMUNo7bWL0o9QPli2Tnmp31Rrp8tpUQiK3z6pqgigCKp+UtgjZf0Qqn7KKfYsacV9F1ws2fA==
X-Received: by 2002:a17:90a:4d4e:: with SMTP id
 l14mr1582077pjh.4.1632178406178; 
 Mon, 20 Sep 2021 15:53:26 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 w22sm11535607pgc.56.2021.09.20.15.53.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 15:53:25 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Rob Clark <robdclark@chromium.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 0/3] drm: msm+ti-sn65dsi86 support for NO_CONNECTOR
Date: Mon, 20 Sep 2021 15:57:57 -0700
Message-Id: <20210920225801.227211-1-robdclark@gmail.com>
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

From: Rob Clark <robdclark@chromium.org>

Respin of https://www.spinics.net/lists/linux-arm-msm/msg92182.html with
the remaining 3 patches that are not yet merged.

At the end of this series, but drm/msm and ti-sn65dsi86 work in both
combinations, so the two bridge patches can be merged indepdendently of
the msm/dsi patch.

The last patch has some conficts with https://www.spinics.net/lists/linux-arm-msm/msg93731.html
but I already have a rebased variant of it depending on which order
patches land.

Rob Clark (3):
  drm/msm/dsi: Support NO_CONNECTOR bridges
  drm/bridge: ti-sn65dsi86: Implement bridge->mode_valid()
  drm/bridge: ti-sn65dsi86: Add NO_CONNECTOR support

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 64 ++++++++++++++++++---------
 drivers/gpu/drm/msm/Kconfig           |  2 +
 drivers/gpu/drm/msm/dsi/dsi_manager.c | 50 +++++++++++++++------
 3 files changed, 81 insertions(+), 35 deletions(-)

-- 
2.31.1

