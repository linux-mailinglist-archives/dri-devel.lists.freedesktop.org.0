Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GPsSKvjJf2l3xgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 01 Feb 2026 22:47:36 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 100EEC74B8
	for <lists+dri-devel@lfdr.de>; Sun, 01 Feb 2026 22:47:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE74910E09A;
	Sun,  1 Feb 2026 21:47:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="rSSQ1vvB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEA6710E09A;
 Sun,  1 Feb 2026 21:47:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A5CF54381A;
 Sun,  1 Feb 2026 21:47:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68A38C4CEF7;
 Sun,  1 Feb 2026 21:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769982450;
 bh=UUJi09olw3z2alBOMu1Tzu+FggHp8iosUalWgPJFN/I=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=rSSQ1vvB9dkWUjAJ3FRKZ5I1CInEoEmQpvhHB1yQgkKMY9A5uorAcxj6fB8ytGKh1
 qT26KzMBy8zYnI/CiJ6PC59GGuEW5p6liU917BsqSxtoLL5skP+JtJdcrKsFP9QHci
 T77vLP6BbWMgok5mdjdPQnq+kSNe9L4QTWx2iTKZ9EIeeBrSLIMiln/fgc9n5V1Bom
 5i8ZMSkjT/oFApnIsu3lCAHj7EdH20Dj59bmDHXWf71w2DL287MlB1fZXnyZSG+fHI
 Xl/LD9RcxMrCopXJPSwEC7MQqdkh3D6iLRVmypNmQLdzUbcxx+iHppF7gElD5CjvwI
 Bbti8kDaSuokA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 01 Feb 2026 22:47:26 +0100
Message-Id: <DG3YEUPVF4KS.2VA7NB95JEQ2U@kernel.org>
Subject: Re: [PATCH drm] Revert "drm/nouveau/disp: Set
 drm_mode_config_funcs.atomic_(check|commit)"
Cc: "Lyude Paul" <lyude@redhat.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 <linux-kernel@vger.kernel.org>, "Dave Airlie" <airlied@redhat.com>,
 <dri-devel@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>
To: "John Ogness" <john.ogness@linutronix.de>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260130113230.2311221-1-john.ogness@linutronix.de>
In-Reply-To: <20260130113230.2311221-1-john.ogness@linutronix.de>
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[redhat.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linutronix.de:email]
X-Rspamd-Queue-Id: 100EEC74B8
X-Rspamd-Action: no action

On Fri Jan 30, 2026 at 12:32 PM CET, John Ogness wrote:
> This reverts commit 604826acb3f53c6648a7ee99a3914ead680ab7fb.
>
> Apparently there is more to supporting atomic modesetting than
> providing atomic_(check|commit) callbacks. Before this revert:
>
> WARNING: [] drivers/gpu/drm/drm_plane.c:389 at .__drm_universal_plane_ini=
t+0x13c/0x794 [drm], CPU#1: modprobe/1790
> BUG: Kernel NULL pointer dereference on read at 0x00000000
> .drm_atomic_get_plane_state+0xd4/0x210 [drm] (unreliable)
> .drm_client_modeset_commit_atomic+0xf8/0x338 [drm]
> .drm_client_modeset_commit_locked+0x80/0x260 [drm]
> .drm_client_modeset_commit+0x40/0x7c [drm]
> .__drm_fb_helper_restore_fbdev_mode_unlocked.part.0+0xfc/0x108 [drm_kms_h=
elper]
> .drm_fb_helper_set_par+0x8c/0xb8 [drm_kms_helper]
> .fbcon_init+0x31c/0x618
> [...]
> .__drm_fb_helper_initial_config_and_unlock+0x474/0x7f4 [drm_kms_helper]
> .drm_fbdev_client_hotplug+0xb0/0x120 [drm_client_lib]
> .drm_client_register+0x88/0xe4 [drm]
> .drm_fbdev_client_setup+0x12c/0x19b4 [drm_client_lib]
> .drm_client_setup+0x15c/0x18c [drm_client_lib]
> .nouveau_drm_probe+0x19c/0x268 [nouveau]
>
> Fixes: 604826acb3f5 ("drm/nouveau/disp: Set drm_mode_config_funcs.atomic_=
(check|commit)")
> Reported-by: John Ogness <john.ogness@linutronix.de>
> Closes: https://lore.kernel.org/lkml/87ldhf1prw.fsf@jogness.linutronix.de
> Signed-off-by: John Ogness <john.ogness@linutronix.de>

Applied to drm-misc-fixes, thanks!
