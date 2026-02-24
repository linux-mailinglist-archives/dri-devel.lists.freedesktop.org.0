Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OE5cNoXonWlDSgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 19:05:57 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5894218AF1D
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 19:05:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A08110E162;
	Tue, 24 Feb 2026 18:05:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Are0fmoV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F208410E162
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 18:05:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 9DEB5408FF;
 Tue, 24 Feb 2026 18:05:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72029C116D0;
 Tue, 24 Feb 2026 18:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771956352;
 bh=oDA6UJNQcyFpalFPlNTdTB6nBaNvITv3rMdDCBmeZT4=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Are0fmoVRYQ/dX/iYZMCs437W5x1/OPW6XfOpHTZ1rS700kv5dBVpZqFYFf5RH6CF
 V2a19cvi+jHmuriX2gxHcDJ+G7cgVmyjBSqTx83LjdSaF23mWk9VFXBamFy7lfogFO
 ao3ifCXPhN/UJGVneJ0CPKg15X//bg9lSBCGL1jSfjYqE6ZJT5hWfpc5wFNJPwbJQm
 9u+yDrEIbP9yB68F1+hWzDo5kTfPMuhK1qmdwSWMHoskltWXJgDT3IaxZf9Xf/oKhg
 J9gsYLJBhEXVKsthXe4W/3QW2NGeF2Wve1ZjmNwx6BXEkevARe8pADxXFogQ6NUxbv
 lYBJfEMZRdfyg==
From: Chen-Yu Tsai <wens@kernel.org>
To: dri-devel@lists.freedesktop.org, Randy Dunlap <rdunlap@infradead.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev
In-Reply-To: <20260219215524.468142-1-rdunlap@infradead.org>
References: <20260219215524.468142-1-rdunlap@infradead.org>
Subject: Re: [PATCH v2] drm/sun4i: fix kernel-doc warnings in
 sunxi_engine.h
Message-Id: <177195635023.133983.103201374012158795.b4-ty@kernel.org>
Date: Wed, 25 Feb 2026 02:05:50 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
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
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,sholland.org,lists.infradead.org,lists.linux.dev];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[wens@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 5894218AF1D
X-Rspamd-Action: no action

On Thu, 19 Feb 2026 13:55:24 -0800, Randy Dunlap wrote:
> Correct the kernel-doc notation, add a missing struct member comment,
> and add a missing "Returns:" function comment to eliminate kernel-doc
> warnings:
> 
> Warning: drivers/gpu/drm/sun4i/sunxi_engine.h:116 Incorrect use of
>  kernel-doc format: * @mode_set
> Warning: drivers/gpu/drm/sun4i/sunxi_engine.h:125 struct member 'mode_set'
>  not described in 'sunxi_engine_ops'
> Warning: drivers/gpu/drm/sun4i/sunxi_engine.h:144 struct member 'list'
>  not described in 'sunxi_engine'
> Warning: drivers/gpu/drm/sun4i/sunxi_engine.h:168 No description found
>  for return value of 'sunxi_engine_layers_init'
> 
> [...]

Applied to drm-misc-next in drm-misc, thanks!

[1/1] drm/sun4i: fix kernel-doc warnings in sunxi_engine.h
      commit: 645186bf86932c6b9deed2e564cffd09576ba9a4

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>

