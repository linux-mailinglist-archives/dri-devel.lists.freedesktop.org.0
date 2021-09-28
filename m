Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E6541AFE2
	for <lists+dri-devel@lfdr.de>; Tue, 28 Sep 2021 15:19:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C7E86E0D4;
	Tue, 28 Sep 2021 13:19:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DD266E084;
 Tue, 28 Sep 2021 13:19:49 +0000 (UTC)
Received: by mail-pg1-x534.google.com with SMTP id x191so14238715pgd.9;
 Tue, 28 Sep 2021 06:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mbGOZOb5Aj7io+E29ChYb6CsUDD7dFSCNT86GCOGyck=;
 b=R7bth3A5PT5PURiz5K18ZdI8YpdB/N/YEwZjer13k7Y2rT3iHQ54V7L/b9h7GZ8WC0
 geKEtD8C26cUfX1heBMp82a4JGKbon62qNGokbEkBCfJ394ZkJX6oa9A0+1i4MvOGkGc
 k6kGHIqUw7YekI8FsJ4tYJtu0BxY11Gh34GNMQZkhtmIpMv02SqZ/wIby4tT3JnObHg2
 KXQbJairfQfI0GajqHashVmAhgGtBPOXD5rlkPR1/8JY17q/tHe7kqTRsXyt50YH/RoF
 zkFn0IpysG5VGVeSTTn7K/XZ+vTUUnLCNixiB27h6z5UXRfjaiIb5AXbGyFcEEUI+5bR
 SXUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mbGOZOb5Aj7io+E29ChYb6CsUDD7dFSCNT86GCOGyck=;
 b=pesNWXGTpHOvIGypU+4wx/tYp3PmGu5MAUVD96VtcBTDEnMvQsrwJk2DTmjUMa+jBw
 OxDNrNy3G8N7/aIFdnsqKkKAGiTiqPZP1pTXb2Z6HHpEjs7CrecEmzeJ8Y5inmlbTFsf
 4t1QRtt/dea4cGFACc4fZ2jCp/G0IyI8G82q9du0LeNCLNdLeL4ZbboCsGI6OSPw/iRl
 jQfemExFtlZ7sVmASzwOgqlVFnFVFwI4ZTK85Ic2LYvJLi/r7DQ/ZEVAhYXzmAWL/R0L
 4DOwZJ+FHIhzoCWW4lcn0H7pHXYvYADHEi7N1ieZgeyzkqr220+cA46QCVY1/0CXlsvd
 Qn7g==
X-Gm-Message-State: AOAM533l4SojGPcHG8PYLUwKDcNM/eKUF+zWGLsBW+XZDinY6JzJUS0k
 1TIQOwF4qt8MtCCIcXAcNzwgsmpyVQiAnl2llks=
X-Google-Smtp-Source: ABdhPJwaObiI2BOknhU4lQ+z3pJBh4NFUuZcJXyQl1hfKKpwnY4tJs+iDCyZ149gdxsP9MGtH/9Acg==
X-Received: by 2002:a63:8c42:: with SMTP id q2mr4583519pgn.325.1632835188631; 
 Tue, 28 Sep 2021 06:19:48 -0700 (PDT)
Received: from skynet-linux.local ([122.162.197.175])
 by smtp.googlemail.com with ESMTPSA id h13sm22063964pgf.14.2021.09.28.06.19.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Sep 2021 06:19:48 -0700 (PDT)
From: Sireesh Kodali <sireeshkodali1@gmail.com>
To: phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Sireesh Kodali <sireeshkodali1@gmail.com>
Subject: [PATCH v3 0/3] MSM8953 MDP/DSI PHY enablement
Date: Tue, 28 Sep 2021 18:49:26 +0530
Message-Id: <20210928131929.18567-1-sireeshkodali1@gmail.com>
X-Mailer: git-send-email 2.33.0
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

This patch series adds support for the MDP and DSI PHY as found on the
MSM8953 platform (APQ8053, SDM450, SDA450, SDM625, SDM626). All the SoCs
on this platform use the adreno 506 GPU.

Changes since v2:
- Changed dt-bindings to use enum instead of oneOf

Changes since v1:
- Split the dsi phy doc changes into a separate commit
- Add Reviewed-by tag to patch 2

Sireesh Kodali (1):
  dt-bindings: msm: dsi: Add MSM8953 dsi phy

Vladimir Lypak (2):
  drm/msm/dsi: Add phy configuration for MSM8953
  drm/msm/mdp5: Add configuration for MDP v1.16

 .../bindings/display/msm/dsi-phy-14nm.yaml    |  1 +
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c      | 89 +++++++++++++++++++
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c         |  2 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h         |  1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c    | 21 +++++
 5 files changed, 114 insertions(+)

-- 
2.33.0

