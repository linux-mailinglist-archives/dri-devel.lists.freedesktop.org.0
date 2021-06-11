Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D129E3A4AA7
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jun 2021 23:35:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 118886E0E1;
	Fri, 11 Jun 2021 21:35:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 623E56E0E1
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jun 2021 21:35:36 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2804:431:e7dc:1201:ddd3:c6b:bb28:7501])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: leandrohrb)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 06D941F447B9;
 Fri, 11 Jun 2021 22:35:32 +0100 (BST)
From: Leandro Ribeiro <leandro.ribeiro@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v6 0/1] Document drm_mode_get_plane
Date: Fri, 11 Jun 2021 18:35:15 -0300
Message-Id: <20210611213516.77904-1-leandro.ribeiro@collabora.com>
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

v6: document that gamma_size field was never used. Suggested by Pekka Paalanen
<ppaalanen@gmail.com> and Daniel Vetter <daniel@ffwll.ch>

Leandro Ribeiro (1):
  drm/doc: document drm_mode_get_plane

 include/uapi/drm/drm_mode.h | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

--
2.31.1

