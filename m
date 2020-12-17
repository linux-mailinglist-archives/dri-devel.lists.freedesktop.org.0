Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 407442DD062
	for <lists+dri-devel@lfdr.de>; Thu, 17 Dec 2020 12:32:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E18B36E233;
	Thu, 17 Dec 2020 11:32:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 54598 seconds by postgrey-1.36 at gabe;
 Thu, 17 Dec 2020 11:32:23 UTC
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A55DB6E233
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 11:32:23 +0000 (UTC)
X-Originating-IP: 86.247.11.12
Received: from haruko.lan (lfbn-idf2-1-654-12.w86-247.abo.wanadoo.fr
 [86.247.11.12]) (Authenticated sender: schroder@emersion.fr)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id CBCB0C000A;
 Thu, 17 Dec 2020 11:32:20 +0000 (UTC)
From: Simon Ser <contact@emersion.fr>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/9] drm/doc: misc documentation improvements
Date: Thu, 17 Dec 2020 12:32:11 +0100
Message-Id: <20201217113220.102271-1-contact@emersion.fr>
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

This is v2 for the series "drm/doc: improve plane property docs" [1].

The first 4 commits of v1 aren't re-sent. The last 4 commits of v2 are
new.

[1]: https://patchwork.freedesktop.org/series/85016/

Simon Ser (9):
  drm/doc: the KMS properties section is for user-space devs
  drm/doc: introduce new section for standard plane properties
  drm/doc: fix reference to drm_format_modifier_blob
  drm/doc: fix drm_plane_type docs
  drm/doc: document the type plane property
  drm/doc: atomic implicitly enables other caps
  drm/doc: remove drm.h file comment
  drm/doc: demote old doc-comments in drm.h
  drm/doc: render drm.h uapi docs

 Documentation/gpu/drm-kms.rst  |  9 ++++
 Documentation/gpu/drm-uapi.rst |  3 ++
 drivers/gpu/drm/drm_blend.c    |  6 ---
 drivers/gpu/drm/drm_plane.c    | 64 ++++++++++++++++++++--
 include/drm/drm_plane.h        | 29 +++++++---
 include/uapi/drm/drm.h         | 98 ++++++++++++++++------------------
 6 files changed, 138 insertions(+), 71 deletions(-)

-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
