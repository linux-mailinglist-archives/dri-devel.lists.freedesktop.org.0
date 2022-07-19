Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B56E357A859
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jul 2022 22:39:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B90114BBB4;
	Tue, 19 Jul 2022 20:39:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C4E914BB3A
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jul 2022 20:39:02 +0000 (UTC)
Received: from notapiano.myfiosgateway.com
 (pool-98-113-53-228.nycmny.fios.verizon.net [98.113.53.228])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: nfraprado)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id D78B566019F4;
 Tue, 19 Jul 2022 21:38:59 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1658263141;
 bh=D1EWl395kCS6h9fC4licHdb775gvbaCYO+elJhLtDmA=;
 h=From:To:Cc:Subject:Date:From;
 b=KRnBrc6/9DRdIeYev/BAVNY520rNMChpUdoTiasS8vIVBIMGrjCzdT0i9uW2AANbw
 xGHvCKiIjhRg7aKk3vT973p2Ppq6m0F7bDzyXPMbJ5fj/JBUchc/CwYEVDRgo3def3
 2ECRnE5npZeSAqT4Hu3lSN8f3QN7UvaPgLDwzqoSNQjBBQMnnPK3/0GHEzUI/MaUXt
 2Par5Ttoy6cM7JiyPlYBqVIXZYyPI4oi7Mgc2Miec0l3HwtnNMdap+Qsae0XDeFAwW
 TBEyHKA/LtQ0gdfppCJKe3K/NOFHwdpuNKAzvcsoXYTVhkTIDlw+UAFH2H3LkCHWGJ
 9HyZC+Jhgn58Q==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>
To: Douglas Anderson <dianders@chromium.org>
Subject: [PATCH 0/3] New eDP panels and a bugfix
Date: Tue, 19 Jul 2022 16:38:53 -0400
Message-Id: <20220719203857.1488831-1-nfraprado@collabora.com>
X-Mailer: git-send-email 2.37.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>, kernel@collabora.com,
 Sam Ravnborg <sam@ravnborg.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


This series adds two new eDP panel entries in the first two patches, and
fixes a typo in the third one that prevented usage of the DT properties.

Please see the note in patch 1 for a question on hpd_reliable vs.
hpd_absent.


Nícolas F. R. A. Prado (3):
  drm/panel-edp: Add panel entry for R140NWF5 RH
  drm/panel-edp: Add panel entry for B120XAN01.0
  drm/panel-edp: Fix variable typo when saving hpd absent delay from DT

 drivers/gpu/drm/panel/panel-edp.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

-- 
2.37.0

