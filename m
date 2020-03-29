Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E4C4196DF5
	for <lists+dri-devel@lfdr.de>; Sun, 29 Mar 2020 16:45:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73BA289FCA;
	Sun, 29 Mar 2020 14:45:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail2.protonmail.ch (mail2.protonmail.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACDCE89FCA
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Mar 2020 14:45:14 +0000 (UTC)
Date: Sun, 29 Mar 2020 14:45:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1585493112;
 bh=htR6jj8Hf6UQurFBf4ckt4Pg2EhU6TcXmrGIvMyDg4g=;
 h=Date:To:From:Cc:Reply-To:Subject:From;
 b=FttCltarDloo6024OQY33i6pXytv5TxRWz0UJyXS7NK+HEg6BjE7QWsj8xNP/RpcM
 76IfP5lhH48icG1cP+PWHbGSuGaQvNjLopgKWw5nk9O/4vttl/Ib/UParq4hE8AkVU
 NvmZQRg292iecFvwoVUdFC5WFYQR6rhDwWBHlifY=
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH] drm: add docs about the IN_FORMATS plane property
Message-ID: <mHOtz80Wa-x3A5Lz5ETTM65VUMfW1j6b-iCuvIy1RzOM1EloHPqAb2MnbU8ygZi0ABaLrxuN6pzu0v3QRn83125C0bXuHoo-DQWWEd80fdw=@emersion.fr>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mail.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a standard property attached to planes in drm_universal_plane_init
when drm_mode_config.allow_fb_modifiers is true.

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Daniel Stone <daniel@fooishbar.org>
---
 drivers/gpu/drm/drm_blend.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/drm_blend.c b/drivers/gpu/drm/drm_blend.c
index 121481f6aa71..88eedee018d3 100644
--- a/drivers/gpu/drm/drm_blend.c
+++ b/drivers/gpu/drm/drm_blend.c
@@ -183,6 +183,12 @@
  *		 plane does not expose the "alpha" property, then this is
  *		 assumed to be 1.0
  *
+ * IN_FORMATS:
+ *	Blob property which contains the set of buffer format and modifier
+ *	pairs supported by this plane. The blob is a drm_format_modifier_blob
+ *	struct. Without this property the plane doesn't support buffers with
+ *	modifiers. Userspace cannot change this property.
+ *
  * Note that all the property extensions described here apply either to the
  * plane or the CRTC (e.g. for the background color, which currently is not
  * exposed and assumed to be black).
-- 
2.26.0


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
