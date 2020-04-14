Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 919951A93F7
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 09:18:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DEBB6E834;
	Wed, 15 Apr 2020 07:17:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DB9A6E176
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 22:20:21 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id r7so1489648ljg.13
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 15:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IanTGT4JLaUYeExjen0ircYk6KbuC8FRlHbdSRhOCtM=;
 b=bl100jKADWQVlbJ36fXor3/uCvG6QAoIn6KCILYVOcyY9XsPnwpPlp1C6n32vQ8bU9
 2NrfHrRP5/or7tN+YesuiGzFouJX/S7AhalbsIKuEiWM/YfAiT7P9Uv8Q1URoz22p10q
 7Hy204dq0gYQRqO9S9llwnk5bC/D4bKaxXwixXHnhOihnRdg7lnzn7kQwTjAThJlJ0aM
 huON2WP3ZhR/CJ7xDWAvCcQtzKpilcbdYox29IAD6qxUyyGxK0hLGPLG3CYx55HUFbD+
 2GX08lMVRBy7xyjwVyhRQZqOy7k+oMmwgtbp7g/zjYMtOWfyZzDQnnazm6rWOBi0ya3i
 /iJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IanTGT4JLaUYeExjen0ircYk6KbuC8FRlHbdSRhOCtM=;
 b=fQijzOYkt40YLaSAEJ9EO2aV5MncstHpQE2M2YM6zpxNiXDCvWDQjNMv4wcmc4MZsU
 8MDfZgWAv7rWScwzdP24EkA8aoFoIsaVZ+1lY4W34/gjMAaD+KQhPkjPN82CuuoqJNoi
 A+9pA5T/u5EDuekkwmNNdKvsr3C/J2ogU6mwt0Ul2aONiduUohOlvq0GN49/QJkcaDcc
 cFRWXpK+/pM8RktWCtSqlr/B6t34P245CkteOyluzfCLMi6/IGbEQI/UuBBlHkivoTR4
 0JXCMroYfYYUpWqsIocHxnqjVGGeCoJefPFuf/sIvDBIJFrO5UgMIz2rgjMBCyP+L2w3
 uXZQ==
X-Gm-Message-State: AGi0PubyzmHSPzuBy+mO6Nv8IF0Vo4o6NMIysAX+zr2Xdy/AlgjG/QlK
 Jwa8MPc6mu65OZ+58FNk7AZJiQ8D
X-Google-Smtp-Source: APiQypLSmKGG5TvglpjNBeivgLej9mXati8qD/R5WH8zFHo8ltg4UY2cJsms4/ZLmye6r+D2NyzNvA==
X-Received: by 2002:a2e:b446:: with SMTP id o6mr1396694ljm.80.1586902819268;
 Tue, 14 Apr 2020 15:20:19 -0700 (PDT)
Received: from localhost.localdomain (ppp91-78-208-152.pppoe.mtu-net.ru.
 [91.78.208.152])
 by smtp.gmail.com with ESMTPSA id k11sm11120064lfe.44.2020.04.14.15.20.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 15:20:18 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v2 0/2] Support DRM bridges on NVIDIA Tegra
Date: Wed, 15 Apr 2020 01:20:05 +0300
Message-Id: <20200414222007.31306-1-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 15 Apr 2020 07:17:53 +0000
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

This small series adds initial support for the DRM bridges to NVIDIA Tegra
DRM driver. This is required by newer device-trees where we model the LVDS
encoder bridge properly.

Please note that the first "Support DRM bridges" patch was previously sent
out as a standalone v1 change.

Changelog:

v2: - Added the new "rgb: Don't register connector if bridge is used"
      patch, which hides the unused connector provided by the Tegra DRM
      driver when bridge is used, since bridge provides its own connector
      to us.

Dmitry Osipenko (2):
  drm/tegra: output: Support DRM bridges
  drm/tegra: output: rgb: Don't register connector if bridge is used

 drivers/gpu/drm/tegra/drm.h    |  2 ++
 drivers/gpu/drm/tegra/output.c | 25 ++++++++++++++++++++++++-
 drivers/gpu/drm/tegra/rgb.c    | 21 ++++++++++++++++-----
 3 files changed, 42 insertions(+), 6 deletions(-)

-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
