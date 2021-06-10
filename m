Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E623A34F5
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 22:38:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7A1488249;
	Thu, 10 Jun 2021 20:38:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C5B888249
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 20:38:42 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2804:431:e7dc:1201:ddd3:c6b:bb28:7501])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: leandrohrb)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 77CD41F442E6;
 Thu, 10 Jun 2021 21:38:39 +0100 (BST)
From: Leandro Ribeiro <leandro.ribeiro@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 0/1] Document drm_mode_get_plane
Date: Thu, 10 Jun 2021 17:38:23 -0300
Message-Id: <20210610203824.50965-1-leandro.ribeiro@collabora.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: airlied@linux.ie, pekka.paalanen@collabora.co.uk, kernel@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

v2: possible_crtcs field is a bitmask, not a pointer. Suggested by
Ville Syrjälä <ville.syrjala@linux.intel.com>

v3: document how userspace should find out CRTC index. Also,
document that field 'gamma_size' represents the number of
entries in the lookup table. Suggested by Pekka Paalanen
<ppaalanen@gmail.com> and Daniel Vetter <daniel@ffwll.ch>

v4: document IN and OUT fields and make the description more
concise. Suggested by Pekka Paalanen <ppaalanen@gmail.com>

v5: CRTC index patch already merged, only patch to document drm_mode_get_plane
now. Added that gamma LUT size is deprecated and dropped incorrect text
documenting that plane number of formats may change from one ioctl to the
other. Suggested by Ville Syrjälä <ville.syrjala@linux.intel.com>

Leandro Ribeiro (1):
  drm/doc: document drm_mode_get_plane

 include/uapi/drm/drm_mode.h | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

--
2.31.1

