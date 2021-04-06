Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B41E5355C32
	for <lists+dri-devel@lfdr.de>; Tue,  6 Apr 2021 21:33:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D35F89167;
	Tue,  6 Apr 2021 19:33:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B16DD6E030
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Apr 2021 19:21:38 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2804:431:e7dc:9ef6:7b41:f88b:5bc5:8ea5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: leandrohrb)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id B2E411F44BA6;
 Tue,  6 Apr 2021 20:21:35 +0100 (BST)
From: Leandro Ribeiro <leandro.ribeiro@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/2] Document how userspace should use plane format list and
 IN_FORMATS
Date: Tue,  6 Apr 2021 16:21:16 -0300
Message-Id: <20210406192118.12313-1-leandro.ribeiro@collabora.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 06 Apr 2021 19:33:23 +0000
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
Cc: airlied@linux.ie, pekka.paalanen@collabora.co.uk, kernel@collabora.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch is to emphasize how userspace should use the plane format list and
the IN_FORMATS blob. The plane format list contains the formats that do not
require modifiers, and the blob property has the formats that support
modifiers.

Note that these are not disjoint sets. If a format supports modifiers but the
driver can also handle it without a modifier, it should be present in both the
IN_FORMATS blob property and the plane format list.

This is important for userspace, as there are situations in which we need to
find out if the KMS driver can handle a certain format without any modifiers.

Leandro Ribeiro (2):
  drm/doc: document drm_mode_get_plane
  drm/doc: emphasize difference between plane formats and IN_FORMATS
    blob

 drivers/gpu/drm/drm_plane.c |  4 ++++
 include/uapi/drm/drm_mode.h | 22 ++++++++++++++++++++++
 2 files changed, 26 insertions(+)

-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
