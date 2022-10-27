Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5D960F698
	for <lists+dri-devel@lfdr.de>; Thu, 27 Oct 2022 13:57:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74D8E10E2DB;
	Thu, 27 Oct 2022 11:57:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BF1310E0CE
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Oct 2022 11:57:13 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 008011F8BA;
 Thu, 27 Oct 2022 11:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1666871832; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=j1Wx1Nb+v2NH4og2W7b5QOT9FPnLsMfL5Zyv1xSNqo4=;
 b=Fcze0ltkDdszM1yALpEZZXqMtK2KE0GYfTOXxj+HL/JSbL+N5Dg5dWW7V05UCK+NjyAPCb
 8ERFtYevyKijwvBfWsrwQ9gRhtsVgCSMDq3FwC7ZmuNb5UDZguWBOVdyPL5bTvhYnhThuN
 NzaFv/lPZ9+V10+qr31Tj/mzZNszJpE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1666871832;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=j1Wx1Nb+v2NH4og2W7b5QOT9FPnLsMfL5Zyv1xSNqo4=;
 b=Y7f50XXZWotByYbyLGoa17ZkSaBggG8KjDBTbU55y3K7z/AeegngORUoP/YvyCjSAOb+lG
 F20qZGzuxj0rF8CA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C95C413357;
 Thu, 27 Oct 2022 11:57:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id j/cyMBdyWmOFNQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 27 Oct 2022 11:57:11 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com,
	airlied@gmail.com,
	daniel@ffwll.ch
Subject: [PATCH 0/2] drm/ofdrm: Fix sparse warnings
Date: Thu, 27 Oct 2022 13:57:05 +0200
Message-Id: <20221027115707.17980-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.38.0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix two types of sparse warnings in ofdrm. Reported by the LKP bot.

Thomas Zimmermann (2):
  drm/ofdrm: Cast PCI IDs to u32 for comparing
  drm/ofdrm: Cast error pointers to void __iomem *

 drivers/gpu/drm/tiny/ofdrm.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)


base-commit: 746559738f1335241ea686566cb654847c20d7a4
-- 
2.38.0

