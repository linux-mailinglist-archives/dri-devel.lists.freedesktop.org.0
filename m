Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 887B769F691
	for <lists+dri-devel@lfdr.de>; Wed, 22 Feb 2023 15:25:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D68110E9D5;
	Wed, 22 Feb 2023 14:25:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 437 seconds by postgrey-1.36 at gabe;
 Wed, 22 Feb 2023 14:25:19 UTC
Received: from srv6.fidu.org (srv6.fidu.org [IPv6:2a01:4f8:231:de0::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C97ED10E9BD;
 Wed, 22 Feb 2023 14:25:19 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by srv6.fidu.org (Postfix) with ESMTP id 84F9DC800A7;
 Wed, 22 Feb 2023 15:18:00 +0100 (CET)
Authentication-Results: srv6.fidu.org (amavisd-new); dkim=pass (1024-bit key)
 reason="pass (just generated, assumed good)"
 header.d=tuxedocomputers.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 tuxedocomputers.com; h=content-transfer-encoding:mime-version
 :x-mailer:message-id:date:date:subject:subject:from:from; s=
 default; t=1677075480; x=1678889881; bh=ujp8UtH/HkS7PA/cnHZUF8LF
 g6XQmk9qH7vri3P5DdQ=; b=fHH/Yxcvf63Bcaq6ys0nw4zUtAqBHpYn6uB541qX
 nGalq1BNBLlvNU5mtpuSdqwYdHfuPcsT27B22JjVwCituLLBHO5VWsMnmfNYM6uF
 fQtO9hXG8IP9dP3+5//M5XAMSR+n+GxV42Cpv2CKIm+7XohWiEhHyByi4HCpknqe
 h3o=
X-Virus-Scanned: Debian amavisd-new at srv6.fidu.org
Received: from srv6.fidu.org ([127.0.0.1])
 by localhost (srv6.fidu.org [127.0.0.1]) (amavisd-new, port 10026)
 with LMTP id YHOPEZUT_uB0; Wed, 22 Feb 2023 15:18:00 +0100 (CET)
Received: from wsembach-tuxedo.fritz.box
 (host-88-217-226-44.customer.m-online.net [88.217.226.44])
 (Authenticated sender: wse@tuxedocomputers.com)
 by srv6.fidu.org (Postfix) with ESMTPA id 164F1C800A2;
 Wed, 22 Feb 2023 15:17:59 +0100 (CET)
From: Werner Sembach <wse@tuxedocomputers.com>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tvrtko.ursulin@linux.intel.com, airlied@gmail.com,
 daniel@ffwll.ch, jose.souza@intel.com, jouni.hogander@intel.com,
 mika.kahola@intel.com, ville.syrjala@linux.intel.com,
 lucas.demarchi@intel.com, Diego.SantaCruz@spinetix.com,
 wse@tuxedocomputers.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] Add quirk to disable PSR 2 on Tongfang PHxTxX1 and PHxTQx1
Date: Wed, 22 Feb 2023 15:17:53 +0100
Message-Id: <20230222141755.1060162-1-wse@tuxedocomputers.com>
X-Mailer: git-send-email 2.34.1
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

On these Barebones PSR 2 is recognized as supported but is very buggy:
- Upper third of screen does sometimes not updated, resulting in
disappearing cursors or ghosts of already closed Windows saying behind.
- Approximately 40 px from the bottom edge a 3 pixel wide strip of randomly
colored pixels is flickering.

PSR 1 is working fine however.

This patchset introduces a new quirk to disable PSR 2 specifically on known
buggy devices and applies it to the Tongfang PHxTxX1 and PHxTQx1 barebones.

Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
Cc: <stable@vger.kernel.org>


