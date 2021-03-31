Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8750934FFB2
	for <lists+dri-devel@lfdr.de>; Wed, 31 Mar 2021 13:49:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 929CF6EA6A;
	Wed, 31 Mar 2021 11:49:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0841B6EA6A
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 11:49:23 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id o16so19416476wrn.0
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 04:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MxJTD5mQDwNagQLECc0eo1ZB/OdesKUiap5HG3t0c0w=;
 b=aFRvUOJQXiZNkOwVZDJf7Rfv+v4MCVlV6VzzxdgzVO9Kk59Z7LZqsIITcweLjKB8jy
 ksAoaMPN4S18qCBQ13453x89rMeKw2HhTUfKQKvK3J0e6OVyqP2o03oNQlmpFS56Zapn
 Og+1dS76e8+m3GIAbP00ddTMZaGp3NPkxq1cV5MOOI9vr86pDIq/5HQv6HgDnXOkLf07
 d5BdmDgiVzcMBrDLVzqPEEYvb/VzEflAOJCUmKuRsIkqjx55M+11pcD41TTapPsIaZWp
 oaONmf/681vSNaof2DOALa1SoUpK7zYnX5gIuatG3rX0zetrk/kQzb7UrfzFQPWoGnT2
 GEbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MxJTD5mQDwNagQLECc0eo1ZB/OdesKUiap5HG3t0c0w=;
 b=XV4QvW3S/1DpmotnFNnwZBHd3LMsQrE+Cz0TVh9q8fJotkNmoc0d3io5wWAa3ghBud
 L5+6HW+UWT9l6u9G62fEikCVetIXlGjFonNHzU6WfvxZfK3JqMDB+RXXliXU8eP1PSNK
 nVaeq37TG9z1xtPuehwtqqy14Rw3+5Vm85jdOl+U4zwCG89t+xJdO0FRhnRhLrBly0ui
 qo0evkGu6e8+RztK/D/lQNtV7GzapMdrqejO95QFb0jhhcKPYn4tcSaPtM2TWnvZVGx1
 DOlkFecKnnKbnjLcjc6sX4Pn2KbC9EuLP6BWbJtPXne2bcnDJcOr9n7zPHgH7GLvDhG9
 pDqw==
X-Gm-Message-State: AOAM530PpHb5DJHp4hFiwaEL5TZOIEjRIMSWtoGFwrkJi/EEbZa+pdfF
 +MaVw0cNEaglab9kugOFfm0=
X-Google-Smtp-Source: ABdhPJxeEsvvQJA7PZQi1GkPR1zdriu1jAqF8pNt5Agun39lOC7QrTU1wewmr2H5V+MTiFUcCF1OSA==
X-Received: by 2002:a5d:6443:: with SMTP id d3mr3243878wrw.292.1617191362697; 
 Wed, 31 Mar 2021 04:49:22 -0700 (PDT)
Received: from localhost.localdomain
 (2a01cb0008bd27007d57ea0d08d946c1.ipv6.abo.wanadoo.fr.
 [2a01:cb00:8bd:2700:7d57:ea0d:8d9:46c1])
 by smtp.gmail.com with ESMTPSA id o8sm3622299wmr.28.2021.03.31.04.49.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Mar 2021 04:49:22 -0700 (PDT)
From: Adrien Grassein <adrien.grassein@gmail.com>
To: 
Subject: [PATCH v4 0/1] Fixes 30e2ae943c26 "drm/bridge: Introduce LT8912B DSI
 to HDMI"
Date: Wed, 31 Mar 2021 13:49:18 +0200
Message-Id: <20210331114919.370053-1-adrien.grassein@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Cc: dri-devel@lists.freedesktop.org, dan.carpenter@oracle.com,
 Adrien Grassein <adrien.grassein@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

This patch fixes issues found by a static checker.

Thanks,

Adrien Grassein (1):
  drm/bridge: lt8912b: Fix issues found during static analysis

 drivers/gpu/drm/bridge/lontium-lt8912b.c | 27 +++++++++++++++---------
 1 file changed, 17 insertions(+), 10 deletions(-)

-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
