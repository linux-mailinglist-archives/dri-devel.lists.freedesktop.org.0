Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cGc+K003oWk1rQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 07:18:53 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 831221B3258
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 07:18:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0F2510EA48;
	Fri, 27 Feb 2026 06:18:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eY+qgWIp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 529FB10E615;
 Fri, 27 Feb 2026 06:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772173128; x=1803709128;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6xBZVPFWrv01goLZ1NfgcZWlZtpM5E6VbjHAUDIHts0=;
 b=eY+qgWIpqJMIeRQb4c+mZ8KS6CjD5v9XKD2jKVsobW3A+pEch3oltcLL
 WA60Sv/380D8Pv8DX9DS2tkhKTjvripZzbYDTL5AT2CvhNKTEHJfW4X88
 th+14cBLIYlt0EVtkM+KwGLlo3NPIFvnBCicgoAlVAoGNpuCs8uYqg+fp
 PTkp3+8zi7MVe8Kx1NR2tQ6wpcNiAyxK6OWvNXDunjiTPdAbJtfwUGvH6
 354zBbB4LHGIEod3xRAAbZRFd0Yp03HJX/xZj2F9vNBrYpOBPkRim/J1t
 rukStfH6jVZDROXlhgA2NvAGSEdMLzCNkXnSjQSffAIU86lqfoLaers/e g==;
X-CSE-ConnectionGUID: of7tOS/nTkKINN7+Cj931g==
X-CSE-MsgGUID: NosG3T/mTkahmTJwY93olA==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="90829839"
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; d="scan'208";a="90829839"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 22:18:48 -0800
X-CSE-ConnectionGUID: y+CPbaCrTeSCCSeja446Hg==
X-CSE-MsgGUID: htbih3DdTk60PYebMczmQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; d="scan'208";a="247325811"
Received: from x299.sh.intel.com ([10.239.159.77])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 22:18:46 -0800
From: Yujie Liu <yujie.liu@intel.com>
To: =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Cc: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/gma500: fix kernel-doc warning for framebuffer
 init/create functions
Date: Fri, 27 Feb 2026 14:18:06 +0800
Message-ID: <20260227061807.1755150-1-yujie.liu@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,suse.de,lists.freedesktop.org,vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yujie.liu@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.909];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:dkim,intel.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 831221B3258
X-Rspamd-Action: no action

Warning: drivers/gpu/drm/gma500/framebuffer.c:34 function parameter 'info' not described in 'psb_framebuffer_init'
Warning: drivers/gpu/drm/gma500/framebuffer.c:101 function parameter 'info' not described in 'psb_user_framebuffer_create'

Fixes: 4a792c59203b ("drm/gma500: Pass along the format info from .fb_create() to drm_helper_mode_fill_fb_struct()")
Signed-off-by: Yujie Liu <yujie.liu@intel.com>
---
Changes in v2:
- Split from the original patch set
  https://lore.kernel.org/all/20260226030038.1182961-1-yujie.liu@intel.com/
- Rebase onto latest drm-tip

 drivers/gpu/drm/gma500/framebuffer.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/gma500/framebuffer.c b/drivers/gpu/drm/gma500/framebuffer.c
index fe1f43f0abff..5263eff6e462 100644
--- a/drivers/gpu/drm/gma500/framebuffer.c
+++ b/drivers/gpu/drm/gma500/framebuffer.c
@@ -21,6 +21,7 @@ static const struct drm_framebuffer_funcs psb_fb_funcs = {
  *	psb_framebuffer_init	-	initialize a framebuffer
  *	@dev: our DRM device
  *	@fb: framebuffer to set up
+ *	@info: pixel format information
  *	@mode_cmd: mode description
  *	@obj: backing object
  *
@@ -91,6 +92,7 @@ struct drm_framebuffer *psb_framebuffer_create(struct drm_device *dev,
  *	psb_user_framebuffer_create	-	create framebuffer
  *	@dev: our DRM device
  *	@filp: client file
+ *	@info: pixel format information
  *	@cmd: mode request
  *
  *	Create a new framebuffer backed by a userspace GEM object

base-commit: 1abdcb654ffbb08bbc96a9806fee60ef65fdad77
-- 
2.43.0

