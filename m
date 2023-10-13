Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7948F7C858A
	for <lists+dri-devel@lfdr.de>; Fri, 13 Oct 2023 14:20:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 003A810E0DF;
	Fri, 13 Oct 2023 12:20:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m12.mail.163.com (m12.mail.163.com [220.181.12.217])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7BFA410E0DF
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Oct 2023 12:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=hc+VD
 MLPcl8X3A880iKJyilzCt2EHxp8bidRUHPGSmY=; b=pjnjaazWhEmZd/vmbsO10
 sFHqIA2gvI3ibNtbrLOoa3NFn1cQtlw5Zuh4bj7pISXQ0inVS3PN7peo5BAv/mnU
 scVlI2CGD7NgyihrBitTAgfwmairYXfvPYJWU/SsMNwy5b+MuZSZnXzNQQaZdB3b
 WlxcqV93E6nj/K3JB8/ikk=
Received: from ProDesk.. (unknown [58.22.7.114])
 by zwqz-smtp-mta-g4-1 (Coremail) with SMTP id _____wCX3iv0NSllozPHAQ--.18537S2;
 Fri, 13 Oct 2023 20:20:08 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org,
 heiko@sntech.de
Subject: [PATCH v2 0/4] Some cleanup of vop2 driver
Date: Fri, 13 Oct 2023 20:20:01 +0800
Message-Id: <20231013122001.1594009-1-andyshrk@163.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wCX3iv0NSllozPHAQ--.18537S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Gry5urW7tr4DCr45ZFyxZrb_yoW3ArbE9F
 y7X345WFs7WF98J3ZrGw4xGa9FyayI9Fn5KF4vyF4DAr9Iqw1kJa4fA3yxXa4FyF4a9r1k
 Gayjgry0kFnxCjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUnxgA7UUUUU==
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiEBoIXl8YLt035gAAs5
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
Patch 3 are plane format fix
Patch 4 is a format rename

Changes in v2:
- split rename to another patch

Andy Yan (4):
  drm/rockchip: remove unused struct in vop2
  drm/rockchip: remove NR_LAYERS macro on vop2
  drm/rockchip: fix the plane format defination of rk3568/6
  drm/rockchip: rename windows format for vop2

 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c |  6 +--
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.h |  3 --
 drivers/gpu/drm/rockchip/rockchip_vop2_reg.c | 52 +++++++++++---------
 3 files changed, 30 insertions(+), 31 deletions(-)

-- 
2.34.1

