Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 780797252DA
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 06:31:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8602510E41E;
	Wed,  7 Jun 2023 04:31:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com
 [IPv6:2607:f8b0:4864:20::1134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13B6610E41E
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jun 2023 04:31:54 +0000 (UTC)
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-568ba7abc11so89356517b3.3
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Jun 2023 21:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686112314; x=1688704314;
 h=message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a0XEsmkTiRF7T/aRsUjJi5Wnk1cEUWrKyChE6k+45qQ=;
 b=WWzorukRvZslY64PBtaiQHvDqs4c4C2vZAFCNzrcbzPjLDmiRHYod/gSLV5SyMWHOv
 b5rYyFy42rag5Z3hoAXz2Y926cblXpWzwoHl912koEpZ2vhkyjIAtawEQ3osASwEsGj0
 vKkFM0CB2/RAtFa6F3P4JSxn+piQKX0MQTOo6DqCHi46nVWpmNYKqEUr9r8x//szq/SM
 COd1tK8qhgr9dorDNkYmdk9OdT4QDUTyNsLT+aGEjlot0ciIlXAlfH+7oFIDJANHHzVy
 yMD/agxWUhfYM0zJTNRlk6D7Sv9Y4ckAS6hwikdgE36CvZEcg6MFRBgP53sh45kXjQ7Y
 HMpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686112314; x=1688704314;
 h=message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=a0XEsmkTiRF7T/aRsUjJi5Wnk1cEUWrKyChE6k+45qQ=;
 b=Zu5k5V/NQuyA+NxF8O/8h2Kca6NPvvwY7Sj7+ZeLmOONt4CU/4ADDz3hCLsznZqdk0
 IX4nn6aGMueBMwJY6H0xB7oA5S8WxNp7TXIvZ0JxpHMNdNVXRVE5SEl61WwO+AlMp6NO
 mu/7zHne4VDKYuug+A5WRMzDe4saollMYxwYMqM5kDcz1sSTedaVcgaQuKp1kcFN9KHK
 RFDDYRmJ7QfaR641l6ZoNqTxVLnywjbpjSZ/xOvskuAKh+1EUajyRFt+xRoQ8d9/T9pL
 WPeSRXqKlnnjHvIDFCEqe70sxHDSvvzjzn49ffTwT0OjHsGaYNLfYGbgV8Cwq1tWRueQ
 Twnw==
X-Gm-Message-State: AC+VfDydFLf8YNab8M+I5W4D/uI5LDTy6L3CRV+R8MsJjIRFJYwrY2V2
 smH/4MzLOZ+u+rChVZHMlgKK6i7ZT6k=
X-Google-Smtp-Source: ACHHUZ4Di2rkIBnQHjt0et0CqQeEbFrSiBddY78nKVUbp6oclEBxaPexo3Apzjo/sFZy4pmDwe8Uug==
X-Received: by 2002:a81:7156:0:b0:568:d586:77bd with SMTP id
 m83-20020a817156000000b00568d58677bdmr6003543ywc.1.1686112313739; 
 Tue, 06 Jun 2023 21:31:53 -0700 (PDT)
Received: from daeinki-virtual-machine.localdomain ([58.124.60.88])
 by smtp.gmail.com with ESMTPSA id
 e4-20020aa78244000000b0064f76992905sm7508646pfn.202.2023.06.06.21.31.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jun 2023 21:31:53 -0700 (PDT)
From: Inki Dae <inki.dae@samsung.com>
To: airlied@linux.ie,
	daniel@ffwll.ch
Subject: [GIT PULL] exynos-drm-fixes
Date: Wed,  7 Jun 2023 13:31:48 +0900
Message-Id: <20230607043148.43303-1-inki.dae@samsung.com>
X-Mailer: git-send-email 2.17.1
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
Cc: linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave and Daniel,

   Just two fixups to Exynos vidi and g2d drivers.

   Please kindly let me know if there is any problem.

Thanks,
Inki Dae

The following changes since commit 9561de3a55bed6bdd44a12820ba81ec416e705a7:

  Linux 6.4-rc5 (2023-06-04 14:04:27 -0400)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos tags/exynos-drm-fixes-for-v6.4-rc6

for you to fetch changes up to 48bfd02569f5db49cc033f259e66d57aa6efc9a3:

  drm/exynos: fix race condition UAF in exynos_g2d_exec_ioctl (2023-06-07 13:03:16 +0900)

----------------------------------------------------------------
Two fixups
- Fix wrong return in Exynos vidi driver.
- Fix use-after-free issue to Exynos g2d driver.

----------------------------------------------------------------
Inki Dae (1):
      drm/exynos: vidi: fix a wrong error return

Min Li (1):
      drm/exynos: fix race condition UAF in exynos_g2d_exec_ioctl

 drivers/gpu/drm/exynos/exynos_drm_g2d.c  | 2 +-
 drivers/gpu/drm/exynos/exynos_drm_vidi.c | 2 --
 2 files changed, 1 insertion(+), 3 deletions(-)
