Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MNSrDnpxeGnEpwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 09:04:10 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD47B90E62
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 09:04:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7883010E287;
	Tue, 27 Jan 2026 08:04:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oeeAUez+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD09410E287
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 08:04:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 3409260097;
 Tue, 27 Jan 2026 08:04:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35DD2C16AAE;
 Tue, 27 Jan 2026 08:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769501044;
 bh=Qz5Colq+aYuTcYXa/uYYzxOdfv48MJddodnQZw7klwk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oeeAUez+ceIJtD4NwNHFZXriOGpj7C162c3Ux1ZZ/HgJ5oHe0HjrI04bzNj5ExxZU
 q+dTM9fCbzTZ3AtrwzETQ8kUuYGvds+LuNyiGz87mVLu8DN2Hof4KB5tT14pouKVPw
 mVSDk9WENm8ISLOpewxnZvbttBDfDSCAp5kvDYFuTv7jVTa81/BvEEMOGienD5yU7e
 t8Q4iBdeeuthv18WN/MR6/gt6hlO0M2hW12Fx4GsLezQ3FIelg92EpUVtnz+dGh/4Z
 aHoC+XCiWiCxv1o964awRedTzlFmDPN7CEK/i9DQEt+6seElYJ0D3iuxCFSpunsR0Y
 +299PdXBCZW8A==
Date: Tue, 27 Jan 2026 08:04:01 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: briannorris@chromium.org, jwerner@chromium.org, javierm@redhat.com,
 samuel@sholland.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch,
 chrome-platform@lists.linux.dev, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 12/12] drm/corebotdrm: Support panel orientation
Message-ID: <aXhxcS1Sifj_qeyb@google.com>
References: <20260115082128.12460-1-tzimmermann@suse.de>
 <20260115082128.12460-13-tzimmermann@suse.de>
 <aXhuGnUlM500G6Ht@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aXhuGnUlM500G6Ht@google.com>
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
X-Rspamd-Queue-Id: BD47B90E62
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 07:49:46AM +0000, Tzung-Bi Shih wrote:
> On Thu, Jan 15, 2026 at 08:57:22AM +0100, Thomas Zimmermann wrote:
> > diff --git a/include/linux/coreboot.h b/include/linux/coreboot.h
> > [...]
> > @@ -63,9 +68,13 @@ struct lb_framebuffer {
> >  	u8  blue_mask_size;
> >  	u8  reserved_mask_pos;
> >  	u8  reserved_mask_size;
> > +	u8  orientation;
> >  } __packed;
> >  
> >  #define LB_FRAMEBUFFER_HAS_LFB(__fb) \
> >  	((__fb)->size >= offsetofend(struct lb_framebuffer, reserved_mask_size))
> >  
> > +#define LB_FRAMEBUFFER_HAS_ORIENTATION(__fb) \
> > +	((__fb)->size >= offsetofend(struct lb_framebuffer, orientation))
> 
> Wouldn't the new field in struct lb_framebuffer break LB_FRAMEBUFFER_HAS_LFB()?
> E.g., fb->size == offsetofend(struct lb_framebuffer, reserved_mask_size)
>    -> LB_FRAMEBUFFER_HAS_LFB(fb) == true
>    -> LB_FRAMEBUFFER_HAS_ORIENTATION(fb) == false?

The example is wrong, please forget it.

Again, I supposed the "LFB" is tailing data of struct lb_framebuffer.

I meant: is it possible that there is no tailing data
      -> fb->size == offsetofend(struct lb_framebuffer, orientation)
      -> LB_FRAMEBUFFER_HAS_LFB() == true falsely.
