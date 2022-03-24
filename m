Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF5E94E5FCE
	for <lists+dri-devel@lfdr.de>; Thu, 24 Mar 2022 08:59:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9566210E88A;
	Thu, 24 Mar 2022 07:59:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C058310E87A;
 Thu, 24 Mar 2022 07:59:00 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 08A711F38D;
 Thu, 24 Mar 2022 07:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1648108739; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=/49t7WeZD4iv/mpcuL1JkkoQVlR7VSW12oUY/aBHH6c=;
 b=y2JnhIbB33UtHDxPIVWZXDDK3aCI+q2ueVTu2MJFUqwKffqcm3q4zeq3kyjRgUnWiaY9Ks
 W/9hdeSg044LJq//aEtelwSlIGm0vcuEP4FmPXmGCAD2pHjribCMLUtmi/9JpvGTfqIeFk
 6NRuXO4y92AYetZK6eapa8tAf6rkUNM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1648108739;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=/49t7WeZD4iv/mpcuL1JkkoQVlR7VSW12oUY/aBHH6c=;
 b=Z6e1y89rRvwWYuLB/NuaBAb1KtzrYUorIbnL5ryWnxNwsWdQfWc5xEqwjCk1UNd6WYyefz
 NpY31ihMRYAEGSCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B4B8613B98;
 Thu, 24 Mar 2022 07:58:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id GKYKK8IkPGIdCwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 24 Mar 2022 07:58:58 +0000
Date: Thu, 24 Mar 2022 08:58:52 +0100
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-fixes
Message-ID: <YjwkvPp6UnePy4Q8@linux-uq9g.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave and Daniel,

here's the weekly PR for drm-misc-fixes.

Best regards
Thomas

drm-misc-fixes-2022-03-24:
 * drm/panel/ili9341: Fix optional regulator handling
The following changes since commit 3c3384050d68570f9de0fec9e58824decfefba7a:

  drm: Don't make DRM_PANEL_BRIDGE dependent on DRM_KMS_HELPERS (2022-03-17 11:07:57 +0100)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2022-03-24

for you to fetch changes up to d14eb80e27795b7b20060f7b151cdfe39722a813:

  drm/panel: ili9341: fix optional regulator handling (2022-03-18 11:08:42 +0100)

----------------------------------------------------------------
 * drm/panel/ili9341: Fix optional regulator handling

----------------------------------------------------------------
Daniel Mack (1):
      drm/panel: ili9341: fix optional regulator handling

 drivers/gpu/drm/panel/panel-ilitek-ili9341.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 Nürnberg, Germany
(HRB 36809, AG Nürnberg)
Geschäftsführer: Felix Imendörffer
