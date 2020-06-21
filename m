Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB65C203025
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jun 2020 09:08:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D56E46E16B;
	Mon, 22 Jun 2020 07:07:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B313889E8C
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Jun 2020 22:28:04 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id y11so17158992ljm.9
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Jun 2020 15:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ajumZEuWGqqfpvz5AIi0K5R6F27nfu1zPZ2heqoGEwU=;
 b=Jp/pG79Pnk2/NRLy8xIPgPY3fJK5fxhfma2voYkdeSszDzSDocMuYBJ/A4KFtrkN1X
 Miw++FXOgfk7NKwF0ZhhF7T8GWeiUlOzHlanZ/eruJ0ZIRZTBHrgOvwqhtFmlRzpQG6O
 TiSDrbiPbfQ44M/bqqnVYox+pLZui0AJPMTLfxkIrUKFbYw6mUHP9uDfO8S5youbVe3Q
 qbOxpEfnFC93wLtuYmL85SxLPREK7wEEf5aRwdwY3BfeGKuDW/lTu68hf0s5N7dD+dlW
 ZcoVtn1Xbk+zoXUoaLQaBhdsfgSfwUIe4DYqmt/B+rrI2cLJt5MFAVVuVUt/04H8ZEQV
 SknQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ajumZEuWGqqfpvz5AIi0K5R6F27nfu1zPZ2heqoGEwU=;
 b=jNWaxjXPNcqBWUNhWqmMybjcKZF8bohxcmB425N/na2PqRdzDL8HVi0kSS8Fh9Q1Ox
 mspFSGd9pNAxNjQLt3Dnm8kVcX45kkBe2GgR1UmNPxS1vL0KpuAP0X2UVXk5RE30byJ6
 rhk/97Ts9gdMPzOj6Xd0FMM6+r/vem1VfjtmdaXS2BFKMA+fpdzNYUBcDz2os04WLnwy
 Osi4s8yoqOwOo5yRKS1i+uCMnX1zexQBNut7y4gpICMevQuk4EZKUOAWqp+AdXS93mDo
 zDaO5B5icBtcDnQSpMULbr/fXSCx8poi7cVmk3OJNZzdtyP5Je9nhri8966huPD6UaVV
 +CDQ==
X-Gm-Message-State: AOAM5309DQY9+Nmh0JU8jGe9cs8+rlPjvCqV9bf1RBLVjbo2vtjvxjlG
 DTeG99csJG6d1sSqd5a3UKexIbzn
X-Google-Smtp-Source: ABdhPJzfiAaD32dKdmMh4jARJjfOqTgw+ry8KlCcvWUtzi4c7FUARN+iWGm9seMlIWMWZ/W1ofixwg==
X-Received: by 2002:a2e:910c:: with SMTP id m12mr7391997ljg.332.1592778483168; 
 Sun, 21 Jun 2020 15:28:03 -0700 (PDT)
Received: from localhost.localdomain (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.gmail.com with ESMTPSA id 11sm2361295lju.118.2020.06.21.15.28.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Jun 2020 15:28:02 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v1 0/2] Improve descriptions of a few simple-panels
Date: Mon, 22 Jun 2020 01:27:40 +0300
Message-Id: <20200621222742.25695-1-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 22 Jun 2020 07:07:47 +0000
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
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

This is a follow up to [1], which was already applied to drm-misc and then
Laurent Pinchart spotted some problems. This series addresses those problems.

[1] https://patchwork.ozlabs.org/project/linux-tegra/patch/20200617222703.17080-8-digetx@gmail.com/

Dmitry Osipenko (2):
  drm/panel-simple: Correct EDT ET057090DHU connector type
  drm/panel-simple: Add missing BUS descriptions for some panels

 drivers/gpu/drm/panel/panel-simple.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
