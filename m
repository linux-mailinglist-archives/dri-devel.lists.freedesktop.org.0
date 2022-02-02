Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9529E4A7495
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 16:28:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 192EA10E2ED;
	Wed,  2 Feb 2022 15:28:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 899EA10E2CF
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Feb 2022 15:28:23 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2C130B8311F;
 Wed,  2 Feb 2022 15:28:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E8B8C004E1;
 Wed,  2 Feb 2022 15:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643815700;
 bh=eLdsW1iy28myXVvx1haHqeeyItQVCIwS22aJw3sKNyc=;
 h=From:To:Cc:Subject:Date:From;
 b=EEKdeI7UsvuTrPenRDGB5PnC6lgrORoKul8Pmr5nLeJP3J9MxHGeJojYkGBv9ho61
 4IjP1ppL08qgcTMYJLjpz1keAiune4HY1xQ1aBu9cEmS9tCtlm3y5jcA1eqEianNA3
 0LBA06sk1avUH0OPHkrXtFWHpcNceBKIzPmcxyne0Q9/oi5t8zQJyhbJbAzFCPoh3K
 qLKDeFJgU4Kda9bVv9wqtWkGyUZLtzOq2sab0rscjQSEK57r6JInsvTZG0a2EFeCOW
 Euj1K2RQgF/LxNHoa2HzUqIIFcufB0e1hzd7n2wOIg+P7lcpebbttZmx7lGea3Dv0a
 m+5snCjnmTNMQ==
From: Mark Brown <broonie@kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 0/2] drm/tiny: Ensure DT compatibles have SPI device IDs
Date: Wed,  2 Feb 2022 15:26:29 +0000
Message-Id: <20220202152631.20704-1-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=591; h=from:subject;
 bh=eLdsW1iy28myXVvx1haHqeeyItQVCIwS22aJw3sKNyc=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBh+qKk45GXATsjCitEPQxhGsahJIc+M6weYzrP5xxl
 t4HJA7KJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYfqipAAKCRAk1otyXVSH0GrWB/
 0ZvMKf7VAvm9esqxOvs1XY2lckMlglgqlaHUyYKSwT9beBl/BauDcLOF7nXARddj6+8r7OTgsMcIm1
 2K4aN6J9tD5wX0y7o74Y5LL7Q1/hmfUpZWCTNi1Qo1i/s4iYcSiHSDgpP4Pei1Ithlrwv5+g/f5JGi
 IKaeQWo4avyLbnvkt2STpur+JP7D9hKc6TLexcvHTBw+USq2eJDG8ms1wNaPBHyl7Xesn7/aaO7s5Z
 PQ3hRYivC/zGJrr6uge4blAsE8xD/WAc8XtkvPz+ffcSretaiM8mWUCHqf77nz2JXdynTOOgjYenLW
 5ZDFSdPmAUo4y+z59ttdUxsxv+ZnvJ
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

Mark Brown (2):
  drm/ili9486: Add SPI ID table
  drm/st7735r: Add SPI ID table

 drivers/gpu/drm/tiny/ili9486.c | 2 ++
 drivers/gpu/drm/tiny/st7735r.c | 1 +
 2 files changed, 3 insertions(+)


base-commit: e783362eb54cd99b2cac8b3a9aeac942e6f6ac07
-- 
2.30.2

