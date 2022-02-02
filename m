Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21BDA4A748A
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 16:24:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D15358977A;
	Wed,  2 Feb 2022 15:24:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5122C8977A
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Feb 2022 15:24:29 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1C2D7B83063;
 Wed,  2 Feb 2022 15:24:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83FDBC004E1;
 Wed,  2 Feb 2022 15:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643815466;
 bh=+TusgwJZ0TMGf6vEoGvddWy8ABuvMOEiteKQoWBh/6Y=;
 h=From:To:Cc:Subject:Date:From;
 b=AKVxyTcPbH7e92HM5nhtvxB3KOARTyGSzfY71/Y1wWQwBDZ5MehA9XJDX9DUB4Tys
 7B4DVtrsw3PLB9ac8eJejRYiqkyqymAqsXHu3bXIX1R+aMexbwaXvHA1TKSex9pge7
 GPh28L59y1FQMj3qeD9hoFHdPKD5gxBXdGjr1alGSQKx4l+m+FkT6t2BHcUCMlDFOO
 9hfI0obnWV4LTjiXfqLTBXuPWwBR/QtuIKWGiNM7+CgdFACTuRmKb5VmwqcRFj5GYs
 kGctYvkCqh3H7H9U9eOC2k+qCa7jQYq7wspeiUF4BiRQ1x93vBtt2YSK10mmpt6Atk
 E4UKtk269cjdQ==
From: Mark Brown <broonie@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 0/3] drm/panel: Ensure DT compatibles have SPI device IDs
Date: Wed,  2 Feb 2022 15:23:49 +0000
Message-Id: <20220202152352.20342-1-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=758; h=from:subject;
 bh=+TusgwJZ0TMGf6vEoGvddWy8ABuvMOEiteKQoWBh/6Y=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBh+qIETeCb+gVR4VqrEeXyTBNgzczO1Fs6F9AbsIaL
 zY+P0zWJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYfqiBAAKCRAk1otyXVSH0CmFB/
 0bRYhzLuA6yMeIAvkIa1K0SwEzp8uifS63/0lP2rfY0Tgih/rhwvEfMi2wOnOry5+Lj+m5JbiJlWOF
 YLQEpVk+n7G/cNOUcuB0ezcvnvIzenmFGIz/s+7lJp+P0YAePJgQztEhbWWzJ0NY+QuE/Uaxh8YOas
 KLD3yN6xohGABD9Q1uHAO+dSWWYadevjQPBb7rUVnYGI5raSOXdZEL/VVfe9sxODnVJH3Di7VN1blT
 LlthQyw9oeOPtMFo4mq4fNPAEaFHBMXypKtKdQmI5TMhyI7UZkbQ/Yvv3EtBHTrHdLb+1xakjb+6zL
 RPh6dtmtuY6ElRKxqoFur0A30hUosN
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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
Cc: Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently autoloading for SPI devices does not use the DT ID table, it uses
SPI modalises. Supporting OF modalises is going to be difficult if not
impractical, an attempt was made but has been reverted, so this series
adds SPI IDs where they aren't provided for a given modalias.

v2:
 - Rebase onto v5.17-rc1.

Mark Brown (3):
  drm/panel-ilitek-il9322: Add SPI ID table
  drm/panel-novotek-nt39016: Add SPI ID table
  drm/ili9486: Add SPI ID table

 drivers/gpu/drm/panel/panel-ilitek-ili9322.c  | 14 ++++++++++++++
 drivers/gpu/drm/panel/panel-novatek-nt39016.c |  8 ++++++++
 drivers/gpu/drm/tiny/ili9486.c                |  2 ++
 3 files changed, 24 insertions(+)


base-commit: e783362eb54cd99b2cac8b3a9aeac942e6f6ac07
-- 
2.30.2

