Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8893A82D877
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jan 2024 12:39:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB13010E25C;
	Mon, 15 Jan 2024 11:39:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAAA010E25C
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jan 2024 11:39:11 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7ABB921EC1;
 Mon, 15 Jan 2024 11:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1705318750; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=reKi60GeV2cDg85KFEbh5WtqFVNyQEjqCjmIiyDbrms=;
 b=kUkQAJWqAcnbYXSSQx6gtRn9kyfmkfL5bYzNE79J2BWmGyi9TdB2O8pH9Y/23Ht7BQ7cak
 rsR5D0TSPSW/6dlck38WRUxJFawqCQtiNdLij8s8gp1y60JeZWGAyE9KU8jHkvPaxrqcH7
 M4tQoF0VTlTAHii/eml0cqQE+ABeDxk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1705318750;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=reKi60GeV2cDg85KFEbh5WtqFVNyQEjqCjmIiyDbrms=;
 b=9e48tRs7uPKGm0/ku/RTN6O+C8R8vcMNBBAoqx5y73a6hom01RhivqHxS+rycggAEMd+jz
 viDfAV+4Gf4QHuCg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1705318750; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=reKi60GeV2cDg85KFEbh5WtqFVNyQEjqCjmIiyDbrms=;
 b=kUkQAJWqAcnbYXSSQx6gtRn9kyfmkfL5bYzNE79J2BWmGyi9TdB2O8pH9Y/23Ht7BQ7cak
 rsR5D0TSPSW/6dlck38WRUxJFawqCQtiNdLij8s8gp1y60JeZWGAyE9KU8jHkvPaxrqcH7
 M4tQoF0VTlTAHii/eml0cqQE+ABeDxk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1705318750;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=reKi60GeV2cDg85KFEbh5WtqFVNyQEjqCjmIiyDbrms=;
 b=9e48tRs7uPKGm0/ku/RTN6O+C8R8vcMNBBAoqx5y73a6hom01RhivqHxS+rycggAEMd+jz
 viDfAV+4Gf4QHuCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4F39213712;
 Mon, 15 Jan 2024 11:39:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id WQlSEl4ZpWWYPwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 15 Jan 2024 11:39:10 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch,
	airlied@gmail.com,
	corbet@lwn.net
Subject: [PATCH] Documentation/gpu: Reference articles on Linux graphics stack
Date: Mon, 15 Jan 2024 12:38:56 +0100
Message-ID: <20240115113908.25897-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -0.35
X-Spamd-Result: default: False [-0.35 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 NEURAL_HAM_LONG(-1.00)[-1.000]; RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; RCPT_COUNT_SEVEN(0.00)[7];
 MID_CONTAINS_FROM(1.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:url,suse.de:email];
 FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,lwn.net];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_TLS_ALL(0.00)[];
 BAYES_HAM(-0.05)[59.58%]
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add two articles on LWN about the Linux graphics stack to DRM's
list of external references. The articles document the graphics
output as a whole, including the kernel side.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 Documentation/gpu/introduction.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/gpu/introduction.rst b/Documentation/gpu/introduction.rst
index f05eccd2c07c..b7c0baf97dbe 100644
--- a/Documentation/gpu/introduction.rst
+++ b/Documentation/gpu/introduction.rst
@@ -164,6 +164,8 @@ Conference talks
 Slides and articles
 -------------------
 
+* `The Linux graphics stack in a nutshell, part 1 <https://lwn.net/Articles/955376/>`_ - Thomas Zimmermann (2023)
+* `The Linux graphics stack in a nutshell, part 2 <https://lwn.net/Articles/955708/>`_ - Thomas Zimmermann (2023)
 * `Understanding the Linux Graphics Stack <https://bootlin.com/doc/training/graphics/graphics-slides.pdf>`_ - Bootlin (2022)
 * `DRM KMS overview <https://wiki.st.com/stm32mpu/wiki/DRM_KMS_overview>`_ - STMicroelectronics (2021)
 * `Linux graphic stack <https://studiopixl.com/2017-05-13/linux-graphic-stack-an-overview>`_ - Nathan Gauër (2017)
-- 
2.43.0

