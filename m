Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +UyPFBlueGl2pwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 08:49:45 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D9590D67
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 08:49:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EECE10E295;
	Tue, 27 Jan 2026 07:49:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="H4We9BXl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB6F810E295
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 07:49:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0A3A960097;
 Tue, 27 Jan 2026 07:49:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2BEAC116C6;
 Tue, 27 Jan 2026 07:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769500180;
 bh=qrQ87QTrbaOrbHIVv8WS9zmzzginkYNK7xoiselLuZ0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=H4We9BXlHjcJEqo3Ujp+UHLo75poXn8hJg7br0K4cxXJCJy7yCF/haDDSuNRi2Yc8
 OmjUBPC+dB3S/iWMoNopK2h3ENprZFA86NrlgMNmDv8TnRiFmgYG+Pe50lKerFXKM9
 DM5mU41EOqd4sDxX2phrf3e7und166sdD0LpSMTClvKF7ogWN0yegIxU+XjRuhI3qW
 R2oDI941Y5fytgzVV9V1I7qvLwzsrhcM77F5WVdnQGJlPWQFf6JZYOPHbVn1/g0Owo
 IuLpbL75T08I/+Hba/I3Et7xnzg6Za7KuiUXkVSTlXkOmkllWe7BiwsCMZQp60ONAT
 QjMr/D3Y2wJFg==
Date: Tue, 27 Jan 2026 07:49:36 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: briannorris@chromium.org, jwerner@chromium.org, javierm@redhat.com,
 samuel@sholland.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch,
 chrome-platform@lists.linux.dev, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 11/12] drm/sysfb: corebootdrm: Add DRM driver for
 coreboot framebuffers
Message-ID: <aXhuENnpeevg7vpw@google.com>
References: <20260115082128.12460-1-tzimmermann@suse.de>
 <20260115082128.12460-12-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115082128.12460-12-tzimmermann@suse.de>
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:tzimmermann@suse.de,m:briannorris@chromium.org,m:jwerner@chromium.org,m:javierm@redhat.com,m:samuel@sholland.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:chrome-platform@lists.linux.dev,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[tzungbi@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[chromium.org,redhat.com,sholland.org,linux.intel.com,kernel.org,gmail.com,ffwll.ch,lists.linux.dev,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tzungbi@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: C7D9590D67
X-Rspamd-Action: no action

On Thu, Jan 15, 2026 at 08:57:21AM +0100, Thomas Zimmermann wrote:
> Add corebotdrm, a DRM driver for coreboot framebuffers. The driver
           ^ oo

> diff --git a/include/linux/coreboot.h b/include/linux/coreboot.h
> index 514c95f9d0e3..e81ee5746e2b 100644
> --- a/include/linux/coreboot.h
> +++ b/include/linux/coreboot.h
> @@ -14,6 +14,7 @@
>  
>  #include <linux/compiler_attributes.h>
>  #include <linux/types.h>
> +#include <linux/stddef.h>
>  
>  /* List of coreboot entry structures that is used */
>  
> @@ -64,4 +65,7 @@ struct lb_framebuffer {
>  	u8  reserved_mask_size;
>  } __packed;
>  
> +#define LB_FRAMEBUFFER_HAS_LFB(__fb) \
> +	((__fb)->size >= offsetofend(struct lb_framebuffer, reserved_mask_size))
> +

Does LFB stand for "Linear Frame Buffer"?

I supposed the LFB follows the struct lb_framebuffer in memory.  If yes, I'm
wondering does LB_FRAMEBUFFER_HAS_LFB() work?  As the struct lb_framebuffer
definition is different from [1].

`offsetofend(struct lb_framebuffer, reserved_mask_size)` is 37 in the kernel
but the tailing data (i.e., LFB in the context) might start from offset 40 in
coreboot.

[1] https://github.com/coreboot/coreboot/blob/main/payloads/libpayload/include/coreboot_tables.h#L232
