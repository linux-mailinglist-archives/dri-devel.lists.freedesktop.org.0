Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9370E2DC7CB
	for <lists+dri-devel@lfdr.de>; Wed, 16 Dec 2020 21:34:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4CE789A86;
	Wed, 16 Dec 2020 20:33:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow2.mail.gandi.net (mslow2.mail.gandi.net [217.70.178.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAE1189A7A
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Dec 2020 20:33:46 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (unknown [217.70.183.193])
 by mslow2.mail.gandi.net (Postfix) with ESMTP id 3306A3A91DA
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Dec 2020 20:22:46 +0000 (UTC)
X-Originating-IP: 86.247.11.12
Received: from haruko.lan (lfbn-idf2-1-654-12.w86-247.abo.wanadoo.fr
 [86.247.11.12]) (Authenticated sender: schroder@emersion.fr)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 5CBB6240005;
 Wed, 16 Dec 2020 20:22:23 +0000 (UTC)
From: Simon Ser <contact@emersion.fr>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/8] drm/doc: improve plane property docs
Date: Wed, 16 Dec 2020 21:22:14 +0100
Message-Id: <20201216202222.48146-1-contact@emersion.fr>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Re-organize and improve plane property docs.

Simon Ser (8):
  drm/doc: rename FB_DAMAGE_CLIPS section
  drm/doc: move composition function docs to new section
  drm/doc: move damage tracking functions to new section
  drm/doc: move color management functions under CRTC section
  drm/doc: the KMS properties section is for user-space devs
  drm/doc: introduce new section for standard plane properties
  drm/doc: fix drm_plane_type docs
  drm/doc: document the type plane property

 Documentation/gpu/drm-kms.rst | 52 +++++++++++++++++++++++------------
 drivers/gpu/drm/drm_blend.c   |  6 ----
 drivers/gpu/drm/drm_plane.c   | 51 +++++++++++++++++++++++++++++++---
 include/drm/drm_plane.h       | 21 ++++++++------
 4 files changed, 95 insertions(+), 35 deletions(-)

-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
