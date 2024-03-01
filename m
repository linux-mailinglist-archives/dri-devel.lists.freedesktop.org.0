Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 235F686E294
	for <lists+dri-devel@lfdr.de>; Fri,  1 Mar 2024 14:45:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F228B10EE51;
	Fri,  1 Mar 2024 13:44:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="VY/Pplys";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vgSaZiJ0";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VY/Pplys";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vgSaZiJ0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B109C10EE3A;
 Fri,  1 Mar 2024 13:44:53 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id BB47133A4D;
 Fri,  1 Mar 2024 13:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1709300691; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ARP4jrw5MkIbGLx1+GgSw29w79TSPir+uBp+ooHQv50=;
 b=VY/PplyshXTLdbzuwH3x3uLZA4nDDvWG1WfT2QzKR9nlj0IcQNCvqID2uftqO34N5C3KZ0
 Sp1EY/sxVeGvMI2FfPK/X45KRDCQW8suTbWF+5DUhqtFZD2EzAg3xenUg8LAQxXt8wJhDN
 lQpWnTubjNOGEkx/u/2naeUWCZLqIo0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1709300691;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ARP4jrw5MkIbGLx1+GgSw29w79TSPir+uBp+ooHQv50=;
 b=vgSaZiJ0C/eF9VAeDf7GcxJA5Ozo/nnvc1GvNkMOC6fGnaB1JDgOnQFq9dxfYXL/UxPAaL
 RWBzBGkikp0ka5Aw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1709300691; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ARP4jrw5MkIbGLx1+GgSw29w79TSPir+uBp+ooHQv50=;
 b=VY/PplyshXTLdbzuwH3x3uLZA4nDDvWG1WfT2QzKR9nlj0IcQNCvqID2uftqO34N5C3KZ0
 Sp1EY/sxVeGvMI2FfPK/X45KRDCQW8suTbWF+5DUhqtFZD2EzAg3xenUg8LAQxXt8wJhDN
 lQpWnTubjNOGEkx/u/2naeUWCZLqIo0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1709300691;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ARP4jrw5MkIbGLx1+GgSw29w79TSPir+uBp+ooHQv50=;
 b=vgSaZiJ0C/eF9VAeDf7GcxJA5Ozo/nnvc1GvNkMOC6fGnaB1JDgOnQFq9dxfYXL/UxPAaL
 RWBzBGkikp0ka5Aw==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 37B8413581;
 Fri,  1 Mar 2024 13:44:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap2.dmz-prg2.suse.org with ESMTPSA id FOATDNPb4WU2WAAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Fri, 01 Mar 2024 13:44:51 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tvrtko.ursulin@linux.intel.com,
 ville.syrjala@linux.intel.com, imre.deak@intel.com,
 tejas.upadhyay@intel.com, jouni.hogander@intel.com, javierm@redhat.com,
 airlied@gmail.com, daniel@ffwll.ch, lucas.demarchi@intel.com,
 ogabbay@kernel.org, thomas.hellstrom@linux.intel.com
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v7 0/6] drm/i915: Convert fbdev to DRM client
Date: Fri,  1 Mar 2024 14:42:53 +0100
Message-ID: <20240301134448.31289-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b="VY/Pplys";
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=vgSaZiJ0
X-Spamd-Result: default: False [-3.81 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:98:from];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 RCVD_DKIM_ARC_DNSWL_HI(-1.00)[]; RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DKIM_TRACE(0.00)[suse.de:+]; MX_GOOD(-0.01)[];
 RCPT_COUNT_TWELVE(0.00)[18]; MID_CONTAINS_FROM(1.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
 FREEMAIL_TO(0.00)[linux.intel.com,intel.com,redhat.com,gmail.com,ffwll.ch,kernel.org];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+];
 RCVD_IN_DNSWL_HI(-0.50)[2a07:de40:b281:104:10:150:64:98:from];
 RCVD_TLS_ALL(0.00)[]; BAYES_HAM(-3.00)[100.00%]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: BB47133A4D
X-Spam-Level: 
X-Spam-Score: -3.81
X-Spam-Flag: NO
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

Convert i915's fbdev code to struct drm_client. Replaces the current
ad-hoc integration. The conversion includes a number of cleanups. The
patchset also enables unloading of driver modules with in-kernel DRM
clients; a feature required by i915. Also update the xe driver where
necessary.

As with the other drivers' fbdev emulation, fbdev in i915 is now
an in-kernel DRM client that runs after the DRM device has been
registered. This allows to remove the asynchronous initialization.

i915 is the last driver with an fbdev emulation that is not build
upon struct drm_client. Once reviewed, the patches would ideally go
into drm-misc-next, so that the old fbdev helper code can be removed.
We can also attempt to add additional in-kernel clients. A DRM-based
dmesg log or a bootsplash are commonly mentioned. DRM can then switch
easily among the existing clients if/when required.

v7:
	* update xe driver
v6:
	* reorder patches to fix build (Jouni)
	* remove unnecessary handling of non-atomic commits (Jouni, Ville)
	* return errors from callbacks (Jouni)
	* various minor fixes
v5:
	* style fixes (checkpatch)
v4:
	<no changes>
v3:
	* support module unloading (Jani, CI bot)
	* as before, silently ignore devices without displays (CI  bot)
v2:
	* fix error handling (Jani)
	* fix non-fbdev builds
	* various minor fixes and cleanups

Thomas Zimmermann (6):
  drm/client: Export drm_client_dev_unregister()
  drm/i915: Unregister in-kernel clients
  drm/i915: Move fbdev functions
  drm/i915: Initialize fbdev DRM client with callback functions
  drm/i915: Implement fbdev client callbacks
  drm/i915: Implement fbdev emulation as in-kernel client

 drivers/gpu/drm/drm_client.c                  |  13 +
 drivers/gpu/drm/i915/display/intel_display.c  |   1 -
 .../drm/i915/display/intel_display_driver.c   |  19 --
 drivers/gpu/drm/i915/display/intel_fbdev.c    | 265 ++++++++++--------
 drivers/gpu/drm/i915/display/intel_fbdev.h    |  29 +-
 drivers/gpu/drm/i915/i915_driver.c            |  27 +-
 drivers/gpu/drm/xe/display/xe_display.c       |  11 -
 drivers/gpu/drm/xe/xe_device.c                |   3 +
 8 files changed, 169 insertions(+), 199 deletions(-)

-- 
2.43.2

