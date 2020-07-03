Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA78221530F
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jul 2020 09:19:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEF086E2B1;
	Mon,  6 Jul 2020 07:19:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A83B16E373
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jul 2020 11:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megous.com; s=mail;
 t=1593776842; bh=qqqmBER67TiL8jtm7bhHtg++KZK59EXYjjn1FFY2Hhw=;
 h=From:To:Cc:Subject:Date:From;
 b=DbJowuWfMruGil3/tF0lPmG3d0y4hFQRLw+XYenolmZ/mzEj51epdT99Ct62ZSdde
 Zn/toun/nuoisgRPpQPNppJZ4Zq1FtJUSEBIYfe8AeVmbCvM7nCicxuKAoQ6sCYPt6
 ecnmG4VeSr+xvqt5hOH2L9eA71MRPZeQchnhipWc=
From: Ondrej Jirman <megous@megous.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Ondrej Jirman <megous@megous.com>, Fabio Estevam <festevam@gmail.com>,
 =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
 Robert Chiras <robert.chiras@nxp.com>
Subject: [PATCH 0/2] Fix warnings in display/bridge/nwl-dsi.yaml DT example
Date: Fri,  3 Jul 2020 13:47:15 +0200
Message-Id: <20200703114717.2140832-1-megous@megous.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 06 Jul 2020 07:19:17 +0000
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patchset fixes warnings in the example in display/bridge/nwl-dsi.yaml
revealed during port of display/panel/rocktech,jh057n00900.yaml to
yaml.

Please take a look.

thank you and regards,
  Ondrej Jirman

Ondrej Jirman (2):
  dt-bindings: display: Fix example in nwl-dsi.yaml
  dt-binding: display: Allow a single port node on rocktech,jh057n00900

 .../devicetree/bindings/display/bridge/nwl-dsi.yaml      | 9 +++++----
 .../bindings/display/panel/rocktech,jh057n00900.yaml     | 1 +
 2 files changed, 6 insertions(+), 4 deletions(-)

-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
