Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A80791AB910
	for <lists+dri-devel@lfdr.de>; Thu, 16 Apr 2020 09:00:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 900266EAF0;
	Thu, 16 Apr 2020 06:59:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 612506E0F4
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 17:27:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) (Authenticated sender: sre)
 with ESMTPSA id C88332A0733
Received: by jupiter.universe (Postfix, from userid 1000)
 id 1762F4800F7; Wed, 15 Apr 2020 19:27:34 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCHv2 0/3] Add multiple AUO panels
Date: Wed, 15 Apr 2020 19:27:22 +0200
Message-Id: <20200415172725.84257-1-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 16 Apr 2020 06:59:07 +0000
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
 dri-devel@lists.freedesktop.org,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Rob Herring <robh+dt@kernel.org>, kernel@collabora.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Patches are more or less independent of each other. There
was a previous version for the 12" and 15" panels, which
was missing the DT binding update. The 19" patch is new,
for the previous 10" panel a different patch has been merged
in the meantime.

-- Sebastian

Sebastian Reichel (3):
  drm/panel: simple: Add support for AUO G190EAN01 panel
  drm/panel: simple: Add support for AUO G156XTN01.0 panel
  drm/panel: simple: Add support for AUO G121EAN01.4 panel

 .../bindings/display/panel/panel-simple.yaml  |  6 ++
 drivers/gpu/drm/panel/panel-simple.c          | 89 +++++++++++++++++++
 2 files changed, 95 insertions(+)

-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
