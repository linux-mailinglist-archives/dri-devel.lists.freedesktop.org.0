Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B08DE5444A9
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jun 2022 09:22:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06A0E113F49;
	Thu,  9 Jun 2022 07:22:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DFE4113DB5
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jun 2022 07:22:46 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2A27A1FD80;
 Thu,  9 Jun 2022 07:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1654759365; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=QsIOHpvbIhIWIOwUiUmFpgIeGL3aVFpY5f3iHNjsB7Y=;
 b=PrG6DVPQUQO1gIYEUAMrkpsa0ROaF4pet5EKXFPiNp29gvdzdHXAmCp2eNM12b3ebGyx7f
 oFWNIImorTr0E62TSdIGyJ7aE7pkV1jF0hV2dcD8lqN0lPwbxE9JpEGc/7OFUNgQJh7w18
 EwujAd4CrijbHyuYeRY6Z6aFA7WtSGo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1654759365;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=QsIOHpvbIhIWIOwUiUmFpgIeGL3aVFpY5f3iHNjsB7Y=;
 b=PXqovXV0/34KTYyQg1avgQSimQpgv2xbGc+SHI8i6DZgWPScbvYefOmtZjgnntvFWq6loE
 Emg6dzt6xr/Le9Cw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EBDA513456;
 Thu,  9 Jun 2022 07:22:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 9yTnOMSfoWLYMAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 09 Jun 2022 07:22:44 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com,
	kuohsiang_chou@aspeedtech.com,
	jfalempe@redhat.com
Subject: [PATCH 0/1] For stable: "drm/ast: Create threshold values for AST2600"
Date: Thu,  9 Jun 2022 09:22:41 +0200
Message-Id: <20220609072242.11721-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.36.1
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 stable@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Mainline commit bcc77411e8a6 ("drm/ast: Create threshold values for
AST2600") needs backporting into older Linux kernels. The earliest
affected version is v5.11.

KuoHsiang Chou (1):
  drm/ast: Create threshold values for AST2600

 drivers/gpu/drm/ast/ast_mode.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

-- 
2.36.1

