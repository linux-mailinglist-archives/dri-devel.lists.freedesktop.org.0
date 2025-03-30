Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C65A75992
	for <lists+dri-devel@lfdr.de>; Sun, 30 Mar 2025 12:29:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C87B10E039;
	Sun, 30 Mar 2025 10:29:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 302 seconds by postgrey-1.36 at gabe;
 Sun, 30 Mar 2025 10:29:10 UTC
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4936710E039
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 10:29:10 +0000 (UTC)
X-CSE-ConnectionGUID: B5r/05UgQySkbdTFbpsU5w==
X-CSE-MsgGUID: M4xtPMwKTyCbtdmMMg94bg==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie5.idc.renesas.com with ESMTP; 30 Mar 2025 19:24:03 +0900
Received: from localhost.localdomain (unknown [10.226.92.49])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id E36B840078A5;
 Sun, 30 Mar 2025 19:23:59 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 0/2] drm: renesas: Extend RZ/G2L KMS formats
Date: Sun, 30 Mar 2025 11:23:51 +0100
Message-ID: <20250330102357.56010-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
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

The RPF module on VSDP supports various format conversion and send the
image data to BRS(Blend ROP Sub Unit) for further processing.

The rzg2l_du_kms component lists a restricted subset of the capabilities
of the VSPD which prevents additional formats from being used for
display planes.

Extend RZ/G2L supported KMS formats. Also drop the unused bpp variable
from struct rzg2l_du_format_info.

Sending v2 as per the agreement with Kieran on #renesas-soc irc.

v1->v2:
 * Dropped the unused variable bpp from struct rzg2l_du_format_info.
 * Updated the commit description.
 * Collected tags
 * Dropped bpp entries.

Biju Das (1):
  drm: renesas: rz-du: Drop bpp variable from struct
    rzg2l_du_format_info

Kieran Bingham (1):
  drm: renesas: Extend RZ/G2L supported KMS formats

 drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c | 120 +++++++++++++++++--
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.h |   1 -
 2 files changed, 113 insertions(+), 8 deletions(-)

-- 
2.43.0

