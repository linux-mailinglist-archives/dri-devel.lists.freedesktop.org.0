Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1708180C6E
	for <lists+dri-devel@lfdr.de>; Wed, 11 Mar 2020 00:36:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4D946E8EA;
	Tue, 10 Mar 2020 23:36:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from web0081.zxcs.nl (web0081.zxcs.nl [IPv6:2a06:2ec0:1::81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01B7E6E08A
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Mar 2020 11:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=pascalroeleven.nl; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id
 :Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HoDOAAuu5g+qc/P5aShbUEJfbz/Uo1silh5yOmrLmWo=; b=w4bjR2mY+UHNrDlRWT8xDR2nu+
 D+QFN+mnGv0mFAAfW2MuFLUOZOwQeaEw0esSVw+YM/7upIRHet2+DCK/pl3y/2EWxVE8og2KBsUCN
 Ngy2aJoTuuoHROOH7z8/h6Bay3E0QEQPaHl6j9qHcbvbjCpdI30OQ4zEKJV0Tcj7j+r2jnh8T6fll
 fNzDsREBfhNwtMMx8l2cKUtPXkswCIpb7uJjj1GcUhMStho2+9n3bo6QjN2yf2plcEBb2TxlrLrD6
 kBD0Lad7/4Yl9VKdSq9YUzmWbs9VWZIL59KwGPCenUWBrlHW2Wy229oBnQ5UghiyBxUfxurM1MIoI
 I2HJqqyQ==;
Received: from ip565b1bc7.direct-adsl.nl ([86.91.27.199]:35430
 helo=localhost.localdomain)
 by web0081.zxcs.nl with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.92.3) (envelope-from <dev@pascalroeleven.nl>)
 id 1jBc7U-0017It-N1; Tue, 10 Mar 2020 11:28:16 +0100
From: Pascal Roeleven <dev@pascalroeleven.nl>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/2] Add support for Topwise A721 tablet
Date: Tue, 10 Mar 2020 11:27:22 +0100
Message-Id: <20200310102725.14591-1-dev@pascalroeleven.nl>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Authenticated-Id: dev@pascalroeleven.nl
X-Mailman-Approved-At: Tue, 10 Mar 2020 23:36:13 +0000
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
Cc: linux-sunxi@googlegroups.com, Pascal Roeleven <dev@pascalroeleven.nl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series add support for the Topwise A721 tablet and it's display.
It is an old tablet (around 2012) but it might be useful as reference
as the devicetree is pretty complete.

Pascal Roeleven (2):
  drm/panel: Add Starry KR070PE2T
  ARM: dts: sun4i: Add support for Topwise A721 tablet

 .../display/panel/starry,kr070pe2t.txt        |   7 +
 arch/arm/boot/dts/Makefile                    |   3 +-
 arch/arm/boot/dts/sun4i-a10-topwise-a721.dts  | 302 ++++++++++++++++++
 drivers/gpu/drm/panel/panel-simple.c          |  26 ++
 4 files changed, 337 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/starry,kr070pe2t.txt
 create mode 100644 arch/arm/boot/dts/sun4i-a10-topwise-a721.dts

-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
