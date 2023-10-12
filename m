Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE2D7C6315
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 04:50:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6330310E3E6;
	Thu, 12 Oct 2023 02:50:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 929 seconds by postgrey-1.36 at gabe;
 Thu, 12 Oct 2023 02:50:29 UTC
Received: from m15.mail.163.com (m15.mail.163.com [45.254.50.219])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4A87A10E3E6
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Oct 2023 02:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=FM/51
 lprc62FftfFgEkfdi8Uf1+NtYbM/Ep3GchyGRA=; b=EzS2j/Csc1e/WcDfNZDpK
 1LIgRBTZflP5fyaI+5IaYheCKp0SNNNqKsEOgv7wo4ScrlUns+mQvz4I423ffBrK
 XlZ0I4/ERL73hJ5ylOUjWdDtPx+yjteBCEkREvdESpohLj6RxiR+RQaqOcChHq9U
 Qx8Ul2VPLK4YVJH9uKGFLA=
Received: from ProDesk.. (unknown [58.22.7.114])
 by zwqz-smtp-mta-g0-4 (Coremail) with SMTP id _____wD3PyRBWydlz+ZEAQ--.58711S2;
 Thu, 12 Oct 2023 10:34:45 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org,
 heiko@sntech.de
Subject: [PATCH 0/3] Some cleanup of vop2 driver
Date: Thu, 12 Oct 2023 10:34:39 +0800
Message-Id: <20231012023439.1497304-1-andyshrk@163.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3PyRBWydlz+ZEAQ--.58711S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Gry5urW7tr4DCr45ZFyxZrb_yoWxuwbEvF
 y2q345WFs7WF98J3WkGw4xGFZrtay29Fn5Kay0yF4kAr92ywn7X3WSy3yxWa4YvF129r1D
 GayUXFy0kFnxCjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUn7PEDUUUUU==
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiMw0HXlXmHAJABAABsP
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
Cc: Andy Yan <andy.yan@rock-chips.com>, s.hauer@pengutronix.de,
 sjoerd.simons@collabora.com, hjc@rock-chips.com,
 sebastian.reichel@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Andy Yan <andy.yan@rock-chips.com>

This is a preparation for the upcoming support for rk3588 vop.

Patch 1 remove unused struct
Patch 2 remove NR_LAYERS macro to support more layers on rk3588
Patch 3 are plane format fix and rename to support more format on rk3588


Andy Yan (3):
  drm/rockchip: remove unused struct in vop2
  drm/rockchip: remove NR_LAYERS macro on vop2
  drm/rockchip: fix the plane format defination of rk3568/6

 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c |  6 +--
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.h |  3 --
 drivers/gpu/drm/rockchip/rockchip_vop2_reg.c | 53 +++++++++++---------
 3 files changed, 31 insertions(+), 31 deletions(-)

-- 
2.34.1

