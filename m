Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6346F74FFF9
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 09:16:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6156610E49D;
	Wed, 12 Jul 2023 07:16:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.208.org (unknown [183.242.55.162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8500510E4A0
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 07:16:36 +0000 (UTC)
Received: from mail.208.org (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTP id 4R18Dc4kr8zBR5lW
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 15:16:32 +0800 (CST)
Authentication-Results: mail.208.org (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)" header.d=208.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=208.org; h=
 content-transfer-encoding:content-type:message-id:user-agent
 :references:in-reply-to:subject:to:from:date:mime-version; s=
 dkim; t=1689146192; x=1691738193; bh=hW1NHKFAT/aNLxN4cBLKVxdssNR
 L3aNh0S7mH6TQvGM=; b=ilOJ4FeRCW8RdigUHkQKR66nf/FihTXkuSSH5qD6CRr
 2UUDYvF1jLyNpv/CFWZvdVPUyCwN8CsjGAElMjLgqkHpCJn5ZAF+YcBRzAdMpU5+
 3AZYwFrnqCE2beXiIf5qixbIXCpdJZshgApn73SKWeHpKGJ2L1AB1pGHb9uFZxkT
 7TItLrVNlXb4oLQW6ZbOtX7pc11JAhn7GkBgg9iSVmSIXiPW37GSAQxTf2NmB0OI
 r7yDX0O3qoQ4INsXMi7jR/6K2QTgkBfqyodkjUH3OazdDIkR0hY2WBp1OTH5jauR
 yiwiQk0E5hrNnVVzvROQxA9I4oZOnraeupcs64bkkxg==
X-Virus-Scanned: amavisd-new at mail.208.org
Received: from mail.208.org ([127.0.0.1])
 by mail.208.org (mail.208.org [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 0PVPUuWFQHLz for <dri-devel@lists.freedesktop.org>;
 Wed, 12 Jul 2023 15:16:32 +0800 (CST)
Received: from localhost (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTPSA id 4R18Db6hX0zBR5CX;
 Wed, 12 Jul 2023 15:16:31 +0800 (CST)
MIME-Version: 1.0
Date: Wed, 12 Jul 2023 15:16:31 +0800
From: sunran001@208suo.com
To: airlied@gmail.com, daniel@ffwll.ch
Subject: [PATCH] drm/nouveau: remove spaces after '*'
In-Reply-To: <20230712071449.12326-1-xujianghui@cdjrlc.com>
References: <20230712071449.12326-1-xujianghui@cdjrlc.com>
User-Agent: Roundcube Webmail
Message-ID: <1fe8c2c240beb55f655814d725070e8b@208suo.com>
X-Sender: sunran001@208suo.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix four occurrences of the checkpatch.pl error:

ERROR: "foo * bar" should be "foo *bar"

Signed-off-by: Ran Sun <sunran001@208suo.com>
---
  drivers/gpu/drm/nouveau/dispnv04/crtc.c | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv04/crtc.c 
b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
index a6f2e681bde9..5ef84f4749e1 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/crtc.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
@@ -114,7 +114,7 @@ static void nv_crtc_set_image_sharpening(struct 
drm_crtc *crtc, int level)
   * bits 28-31: related to single stage mode? (bit 8/12)
   */

-static void nv_crtc_calc_state_ext(struct drm_crtc *crtc, struct 
drm_display_mode * mode, int dot_clock)
+static void nv_crtc_calc_state_ext(struct drm_crtc *crtc, struct 
drm_display_mode *mode, int dot_clock)
  {
      struct drm_device *dev = crtc->dev;
      struct nouveau_drm *drm = nouveau_drm(dev);
@@ -458,7 +458,7 @@ nv_crtc_mode_set_vga(struct drm_crtc *crtc, struct 
drm_display_mode *mode)
   * be easily turned on/off after this.
   */
  static void
-nv_crtc_mode_set_regs(struct drm_crtc *crtc, struct drm_display_mode * 
mode)
+nv_crtc_mode_set_regs(struct drm_crtc *crtc, struct drm_display_mode 
*mode)
  {
      struct drm_device *dev = crtc->dev;
      struct nouveau_drm *drm = nouveau_drm(dev);
