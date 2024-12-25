Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32AD19FC4C9
	for <lists+dri-devel@lfdr.de>; Wed, 25 Dec 2024 11:38:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28D8210E14D;
	Wed, 25 Dec 2024 10:38:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="Ygryc+bE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
 by gabe.freedesktop.org (Postfix) with ESMTP id 381AA10E149
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Dec 2024 10:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=bpcK5
 Qjhe/tAh2DN8xdikTX3IMR0Jsw2fHaDKM8SIj4=; b=Ygryc+bElwnp9afz2vtH+
 K/rojF15MCT8NvJP23Esa1af7s5AsNf0MpJ0rCL64g1vaRHzFV0vWKgypgIRzJKk
 VIbswHTwIz++ACYkXyRYqRu94786OMUt4CH/3sAMY2ABqXdIcXvgrWkjC3R/ghjY
 /dVf/wXX3cgWRVSDx31RM8=
Received: from ProDesk.. (unknown [])
 by gzsmtp4 (Coremail) with SMTP id PygvCgCnfIF24GtnkqkWCg--.3201S2;
 Wed, 25 Dec 2024 18:37:46 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: cristian.ciocaltea@collabora.com, krzk+dt@kernel.org, mripard@kernel.org,
 hjc@rock-chips.com, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH 0/3] Add HDMI support for rk3576
Date: Wed, 25 Dec 2024 18:37:28 +0800
Message-ID: <20241225103741.364597-1-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PygvCgCnfIF24GtnkqkWCg--.3201S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7XFW3Kr4UZr1UWF4UKr13twb_yoWxKFX_Ka
 4fW345uw18u3WYyasrtw4Iga93Jay2gFWrGF4jgFnrXFWkJr48Xrn3C3yYqa4UZF1Yyrnr
 JF4FqFy8CFZxZjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU1ZYFtUUUUU==
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiMw7AXmdr1DmOeAADs3
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

From: Andy Yan <andy.yan@rock-chips.com>


RK3576 HDMI TX Controller is very similar to that of RK3588, but with
some control bits for IO and interrupts status scattered across different
GRF.

PATCH 1/3 is add platform ctrl callback for IO setting and interrupts
status handing.
PATCH 2/3 ~ 3/3 are add support for rk3576


Andy Yan (3):
  drm/rockchip: dw_hdmi_qp: Add platform ctrl callback
  dt-bindings: display: rockchip: Add support for RK3576 HDMI TX
    Controller
  drm/rockchip: Add basic RK3576 HDMI output support

 .../rockchip/rockchip,rk3588-dw-hdmi-qp.yaml  |   1 +
 .../gpu/drm/rockchip/dw_hdmi_qp-rockchip.c    | 224 +++++++++++++++---
 2 files changed, 196 insertions(+), 29 deletions(-)

-- 
2.34.1

