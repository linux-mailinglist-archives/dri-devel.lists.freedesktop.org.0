Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ACD61F62FE
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jun 2020 09:54:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E9676E8A2;
	Thu, 11 Jun 2020 07:54:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 430 seconds by postgrey-1.36 at gabe;
 Wed, 10 Jun 2020 12:08:53 UTC
Received: from mx1.tq-group.com (mx1.tq-group.com [62.157.118.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DBC86E0F1
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jun 2020 12:08:52 +0000 (UTC)
IronPort-SDR: 1Rp13Orzu9AkysPtmbTcoOYtVN7x3s/0GS/3ljm5zTIhfgmbW39D9yxCeohrmPVI30aiWJ2PgR
 AL9oiNmXSPQr/QlA/Z1GfizXWmcIZfhBJ6vqco9DXs4NSrbTIGkRE2YmVb04TtjXuhOMMPcj/V
 SEq+I54YSK32T7nsGEzJonwhmqY7kOIY6uhrFjEwrgET7Nd8bzDy0nPcm9VFei6esRnH1nrdbv
 77RnFMrCp1zKFA8z++njbXBKV7ikvdhu79JIGsHlz2mVCQrUTRbvWA0GREBtclrSbNqUQAjlhn
 8hA=
X-IronPort-AV: E=Sophos;i="5.73,495,1583190000"; d="scan'208";a="12636785"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 10 Jun 2020 14:01:39 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Wed, 10 Jun 2020 14:01:39 +0200
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Wed, 10 Jun 2020 14:01:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1591790499; x=1623326499;
 h=from:to:cc:subject:date:message-id;
 bh=7AcpqJKc86SppmzVr64WnlcpnqLCocCqsJRXvSyZdzg=;
 b=XIHket2DlrfM8Mzw7OkCY8y4ntRp7UL5JR9dncAZzvwWeMUkC1PQCk4V
 nyjtQE8bQ7Yvs8ziXh02y2NC6IiHNqp2WWx7O/JFv1AWrui6mxsHuL7Cn
 Kjh9jAQsVZGq+LJLGsxbiV/f0th63CCUIK1IkNANibacSMc8/tpzoIqae
 vilR1Yjs70N278jJ+lCQN/DtppgVm9vKVjmt5i8N5P6BwJDuBlO3ulxtf
 LBqGO5Rhy2m9xKMfvCP95umTQdI+CKd8EpFEEEWiwFEO9b0Gk6AEKouGN
 n0Xc5cLE8wwirc0yAgliJDR++YRuyspM5/JPHBayOBfKtLMw8+KUNSD0u A==;
IronPort-SDR: Vli/mF82dxPHyOLH3/SUfKgCRCOxw5Ac369gCfB7TSkLIf/QqsFM9hdd1jiOUFY1dEu4ZAswFh
 H/8IEl5X1haTt+cGP0pSxqeKyWKwTHer/Qv5VwwJz7b7h0SE9U8J5N6C7ZvJFvzReA2yAwMW5v
 ZHyAY9YJQRc27iMsLCXKKu27cXtL8pyFiTjtOGjlqiuCupgLSU3mY9CnX74MgrgZHall2XS2BQ
 5otTSF8B/eNPy4VFQi0yfHi9L3IC2whcJELEqf1pn6cr3cNyaqa38F+EkLOppsl4nUB7s0YHNN
 jOQ=
X-IronPort-AV: E=Sophos;i="5.73,495,1583190000"; d="scan'208";a="12636784"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 10 Jun 2020 14:01:39 +0200
Received: from schifferm-ubuntu4.tq-net.de (schifferm-ubuntu4.tq-net.de
 [10.117.49.26])
 by vtuxmail01.tq-net.de (Postfix) with ESMTPA id 308B7280065;
 Wed, 10 Jun 2020 14:01:39 +0200 (CEST)
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 0/4] panel-simple: CDTech S070PWS19HP-FC21 and
 S070SWV29HG-DC44, Tianma TM070JVHG33
Date: Wed, 10 Jun 2020 14:01:27 +0200
Message-Id: <20200610120131.3069-1-matthias.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Thu, 11 Jun 2020 07:54:02 +0000
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
Cc: devicetree@vger.kernel.org,
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Matthias Schiffer <matthias.schiffer@tq-group.com>

This adds a few panels TQ-Systems uses with various starterkit
mainboards. Device trees actually using these panels will be added with
a later submission.


Matthias Schiffer (2):
  dt-bindings: display: simple: add CDTech S070PWS19HP-FC21 and
    S070SWV29HG-DC44
  dt-bindings: display: simple: add Tianma TM070JVHG33

Max Merchel (1):
  drm/panel: simple: add Tianma TM070JVHG33

Michael Krummsdorf (1):
  drm/panel: simple: add CDTech S070PWS19HP-FC21 and S070SWV29HG-DC44

 .../bindings/display/panel/panel-simple.yaml  |  6 ++
 drivers/gpu/drm/panel/panel-simple.c          | 74 +++++++++++++++++++
 2 files changed, 80 insertions(+)

-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
