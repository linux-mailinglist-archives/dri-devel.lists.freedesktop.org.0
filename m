Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A74DAA3B7
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2019 15:02:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A36B6E0C9;
	Thu,  5 Sep 2019 13:02:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa2.bahnhof.se (ste-pvt-msa2.bahnhof.se
 [213.80.101.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 870E96E0C9
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2019 13:02:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 7A5153FBDF;
 Thu,  5 Sep 2019 15:02:07 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.147
X-Spam-Level: 
X-Spam-Status: No, score=-1.147 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, PP_MIME_FAKE_ASCII_TEXT=0.952,
 URIBL_BLOCKED=0.001] autolearn=no autolearn_force=no
Received: from ste-pvt-msa2.bahnhof.se ([127.0.0.1])
 by localhost (ste-ftg-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rilwaOg461TV; Thu,  5 Sep 2019 15:02:05 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 5CAF53FABE;
 Thu,  5 Sep 2019 15:02:05 +0200 (CEST)
Received: from localhost.localdomain.localdomain
 (h-205-35.A357.priv.bahnhof.se [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id D05D4360160;
 Thu,  5 Sep 2019 15:02:04 +0200 (CEST)
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m=20=28VMware=29?=
 <thomas_os@shipmail.org>
To: airlied@gmail.com,
	daniel@ffwll.ch,
	dri-devel@lists.freedesktop.org
Subject: [git pull] vmwgfx-fixes-5.3
Date: Thu,  5 Sep 2019 15:00:55 +0200
Message-Id: <20190905130055.2647-1-thomas_os@shipmail.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=shipmail.org; s=mail; 
 t=1567688524; bh=Mn3N4880e2PvB4c5HZAUIwwfvcvhdaXMDrqmU6san1Y=;
 h=From:To:Cc:Subject:Date:From;
 b=M/Cr23xbYP1tuMPEpyl334CnTfPJ4IrPzAaRWydJNHQYROI7r94hmzv8GuXUPW2Fa
 RBAWinOGHDjOcGQkHI8FHxFJqZC2SRFcxFdtRltYIoF66BS+7sXOXUPkwfcf2gXrhT
 1Xjced0Tod9OySjfbzlzRKRCThhbI13QHHdAn634=
X-Mailman-Original-Authentication-Results: ste-pvt-msa2.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=M/Cr23xb; 
 dkim-atps=neutral
X-Mailman-Original-Authentication-Results: ste-ftg-msa2.bahnhof.se
 (amavisd-new); 
 dkim=pass (1024-bit key) header.d=shipmail.org
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: pv-drivers@vmware.com,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas_os@shipmail.org>,
 linux-graphics-maintainer@vmware.com
Content-Type: multipart/mixed; boundary="===============0669822030=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0669822030==
Content-Transfer-Encoding: 8bit

From: Thomas Hellström <thomas_os@shipmail.org>

Dave, Daniel

A single fix from Dan for a previous fix that generated a regression.

The following changes since commit 6b7c3b86f0b63134b2ab56508921a0853ffa687a:

  drm/vmwgfx: fix memory leak when too many retries have occurred (2019-08-08 11:22:54 +0200)

are available in the Git repository at:

  git://people.freedesktop.org/~thomash/linux vmwgfx-fixes-5.3

for you to fetch changes up to 08b0c891605acf727e43e3e03a25857d3e789b61:

  drm/vmwgfx: Fix double free in vmw_recv_msg() (2019-09-05 14:44:28 +0200)

----------------------------------------------------------------
Dan Carpenter (1):
      drm/vmwgfx: Fix double free in vmw_recv_msg()

 drivers/gpu/drm/vmwgfx/vmwgfx_msg.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

--===============0669822030==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0669822030==--
