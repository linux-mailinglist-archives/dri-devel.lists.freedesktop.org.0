Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B16A707F8
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 18:20:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C1B010E0CA;
	Tue, 25 Mar 2025 17:20:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="jdmkyXCx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Jt6EU4D/";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jdmkyXCx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Jt6EU4D/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 449A310E0CA
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 17:20:43 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E563121195;
 Tue, 25 Mar 2025 17:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1742923241; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=rudoO8lfBn2V1JUU70Ki+4BZSr8XRXPG+thl4/yNQa4=;
 b=jdmkyXCxLGZPeTzW4MDS86sGlxmiP1AZaL961yPscPUzW6Dtl1l9cuk0aqyXyEy+jrxNl4
 3+C0Lq9SM81JoiuUlOAE1NFLTRiILCrHKIZj9gJi2GfS1t3CwzFT0BaSq9wIAxHcrcuX0a
 QnF2QqJC2Z3KZpUi57PLxIPpao3XmLI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1742923241;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=rudoO8lfBn2V1JUU70Ki+4BZSr8XRXPG+thl4/yNQa4=;
 b=Jt6EU4D/44UrMvgJNGa1r9ZA6W0Wug++US5VoO4CylZje6j7HN4jnY/h5Gp14eFH/kaT9/
 8QCWBIFNm5TmXgBQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1742923241; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=rudoO8lfBn2V1JUU70Ki+4BZSr8XRXPG+thl4/yNQa4=;
 b=jdmkyXCxLGZPeTzW4MDS86sGlxmiP1AZaL961yPscPUzW6Dtl1l9cuk0aqyXyEy+jrxNl4
 3+C0Lq9SM81JoiuUlOAE1NFLTRiILCrHKIZj9gJi2GfS1t3CwzFT0BaSq9wIAxHcrcuX0a
 QnF2QqJC2Z3KZpUi57PLxIPpao3XmLI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1742923241;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=rudoO8lfBn2V1JUU70Ki+4BZSr8XRXPG+thl4/yNQa4=;
 b=Jt6EU4D/44UrMvgJNGa1r9ZA6W0Wug++US5VoO4CylZje6j7HN4jnY/h5Gp14eFH/kaT9/
 8QCWBIFNm5TmXgBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AFBAF13957;
 Tue, 25 Mar 2025 17:20:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id z9aQKenl4mfzWAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 25 Mar 2025 17:20:41 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: kraxel@redhat.com,
	airlied@redhat.com
Cc: virtualization@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 0/4] drm/cirrus-qemu: Various fixes 
Date: Tue, 25 Mar 2025 18:12:48 +0100
Message-ID: <20250325171716.154097-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.30 / 50.00]; BAYES_HAM(-3.00)[99.99%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 SUBJECT_ENDS_SPACES(0.50)[]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MIME_TRACE(0.00)[0:+]; RCVD_VIA_SMTP_AUTH(0.00)[];
 TO_DN_SOME(0.00)[]; ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_FIVE(0.00)[5];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid];
 RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -2.30
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

Fix various issues in cirrus-qemu and clean up.

Patch 1 fixes a long-standing, but apparently harmless, bug. Patches
2 and 3 make mode programming more reliable. Patch 4 cleans up after
patch 3.

This series makes cirrus-qemu more reliable at the cost of some higher
resolutions.

Testeded on qemu-i368.

Thomas Zimmermann (4):
  drm/cirrus-qemu: Fix pitch programming
  drm/cirrus-qemu: Stricter mode validation
  drm/cirrus-qemu: Use framebuffer format as-is, drop adjustments
  drm/cirrus-qemu: Remove custom plane state

 drivers/gpu/drm/tiny/cirrus-qemu.c | 143 ++++-------------------------
 1 file changed, 20 insertions(+), 123 deletions(-)

-- 
2.48.1

