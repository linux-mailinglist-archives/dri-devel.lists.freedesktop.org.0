Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wAH3Cjc1oGkqgwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 12:57:43 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B414A1A5714
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 12:57:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE59310E90B;
	Thu, 26 Feb 2026 11:57:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="M/71ERMT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B478910E8EB
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 11:57:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id E5F18600AD;
 Thu, 26 Feb 2026 11:57:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 919A8C116C6;
 Thu, 26 Feb 2026 11:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772107058;
 bh=ylQzySUo9bDhSqmkcXiDS7XuuRz2rDXvl6KfxBGmTsY=;
 h=From:Subject:Date:To:Cc:Reply-To:From;
 b=M/71ERMTpIqfJfoO03E+38TRt0SLKF77gb5R2fC2MCD0W8nhWNO018s3Cnqsk/4s/
 jxMEPqrBWaFZt9+97zM4l9Uvjfz3TgraF5kDcNghNmnAT928s+c2SZIj5kBAUdkT2k
 NtEm72D3EavPZ4Q32rzhMC+o+QUPHMTKDwHKTQhpa8bYzOdQCfzNW5IDSHWvC4iA/8
 hQyrDBFTauIaxQDqUSWr6pC0WHrQ240j/TL53uyimLT7DT+CmDM6Rsdj/2ZA9cBwvj
 ycgc7cNKg8YeaCxdToSGkzBFzkiFim+fwZkaPgdyzrSnOwy0nSH+SsH/wAyiYT59cK
 gZqumJveUWcVQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 85A5AFC5915;
 Thu, 26 Feb 2026 11:57:38 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Subject: [PATCH 0/4] drm/panel: Small Kconfig cleanup
Date: Thu, 26 Feb 2026 12:57:35 +0100
Message-Id: <20260226-panel-clean-up-kconfig-dep-v1-0-bb28a2355b4c@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAC81oGkC/x3MTQqDMBAG0KvIrDugsT/aq0gXYfLFDpUxJCgF8
 e4NXb7NO6ggKwo9m4Mydi26WkV3aUje3mawhmpyrbu3zl05ecPCssAbb4k/slrUmQMSP4L0o/S
 3DnGgGqSMqN9/Pr3O8wcd0rKRbAAAAA==
X-Change-ID: 20260224-panel-clean-up-kconfig-dep-7dc39c351ef8
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Dzmitry Sankouski <dsankouski@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: Casey Connolly <casey.connolly@linaro.org>, 
 marijn.suijten@somainline.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=763; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=ylQzySUo9bDhSqmkcXiDS7XuuRz2rDXvl6KfxBGmTsY=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpoDUwYExGExah3C/W0nE2mYNqta7UJi7PPxWWV
 7dpZCJJvsKJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaaA1MAAKCRBgAj/E00kg
 cg7/EACFnfUmEKMHILGQCvLLJnQXoHPaFoow9YjXFv1gCJ3jeKLxQCyzhGjI6FoWXx0iz6eRtI+
 Gz3Bf3UlC36fCapfRk1ihlBOjGjHp/DqbhWRjEP+xmAWqrUOn7EHZ1Mtbh8mFEU4D9r9Mqa9YPq
 VidJjpTLDYOMTF0qSBsAuH2Ct9vG+UkGz0rWHo6kdqglCO6CRvDOOMqcdGld7r7jY20EIQdkxhL
 R/oEiQPPSUkMVcuF0lA9dVN62C+PEg5vaDvj1QpmTOwoqDMStYKz6wtyO1KoT6IIUiCn49JV3oy
 bnUZ9H4x5t1j7aNOKtK7uqw0K8GR/kkdrUkTqOiFxVSAG9DT6curjvNHBAVKpcQssfWa1Fu93oL
 XjgMXyCzRcGA0Gj64KDW70xr9rAHF+3T3qNpyDGpO+Dhaa7PwT1+NzpIP7/F0ygoG2KorzO8f0C
 FBcAjiAh95M2GmA0gstI5dqPihDoeKcMmr8OmNTzr2p4pI9IP7zPDPc0m5ZgJa55j+/37lF+LxI
 LRFijk2Hn38Ilqvk70ZxejSLVIUHiV3ZuK8xAA8pZQXm3lzIEaciwgCAT1LpH/po/tWh+gQxqK+
 FwYMspogro4PbgzMpaPgc2qBRW9lEKoGA6BFzgAkB/wI5D5SVWg8dcXb/r8AzxLEnW9A8TmJyDY
 aRHze1IvtMJzsiA==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
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
Reply-To: david@ixit.cz
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:dmitry.baryshkov@oss.qualcomm.com,m:dsankouski@gmail.com,m:sam@ravnborg.org,m:casey.connolly@linaro.org,m:marijn.suijten@somainline.org,m:linux-kernel@vger.kernel.org,m:phone-devel@vger.kernel.org,m:david@ixit.cz,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,oss.qualcomm.com,ravnborg.org];
	FORGED_SENDER(0.00)[devnull@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TAGGED_FROM(0.00)[david.ixit.cz];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	HAS_REPLYTO(0.00)[david@ixit.cz];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,ixit.cz:mid,ixit.cz:email,ixit.cz:replyto]
X-Rspamd-Queue-Id: B414A1A5714
X-Rspamd-Action: no action

Inspired by looking at Marijn patch. Since Marijn patch is not merged yet,
appending patch to my series.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
David Heidelberg (3):
      drm/panel: Clean up S6E3FC2X01 config dependencies
      drm/panel: Clean up S6E3HA2 config dependencies and fill help text
      drm/panel: Enable GPIOLIB for panels which uses functions from it

Marijn Suijten (1):
      drm/panel: Clean up SOFEF00 config dependencies

 drivers/gpu/drm/panel/Kconfig | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)
---
base-commit: 877552aa875839314afad7154b5a561889e87ea9
change-id: 20260224-panel-clean-up-kconfig-dep-7dc39c351ef8

Best regards,
-- 
David Heidelberg <david@ixit.cz>


