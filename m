Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gANyALAld2kUcwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 09:28:32 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AEAF856EB
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 09:28:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73E1110E3A8;
	Mon, 26 Jan 2026 08:28:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="cLbaMKG2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB52F10E3A8
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 08:28:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 5532443432;
 Mon, 26 Jan 2026 08:28:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F048C116C6;
 Mon, 26 Jan 2026 08:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769416108;
 bh=usa0U3J/t7rWhIRFX+n7Ph/rpD+CzdJPl76FuUsIbac=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cLbaMKG2HqHjC04DLKVtYluLnUfTTSbSWRr1mBIcuzHf3uaJZ8BNjyFc4ct6qZtLN
 v3STGt0FH9SOZ6fEMyLxlQlsbfQyXS+RwXeukVCA5ZaAZM3vww5ygd61H7YS4lGV5y
 cZM4nszFqTeA8M0c061Use+X9L1XgzHXBqeyePVb4AEs8k+sYrpsflmeZeJUYWiKif
 BG3mDW2UgaPiGy37QZgsi0SVMLijQ3oc4/F2GzegPmBPMWw1dtiOnF/6LHg+yTimcz
 C2DbteJeXEjLNu6XX/L6yeuL3s4FokDEBDgk1krl3hLTmcXjRbTP4dHWdQuKxSYbux
 7SzQHZVPl6zzA==
Date: Mon, 26 Jan 2026 08:28:23 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: briannorris@chromium.org, jwerner@chromium.org, javierm@redhat.com,
 samuel@sholland.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch,
 chrome-platform@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Hans de Goede <hansg@kernel.org>, linux-fbdev@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH v2 01/12] firmware: google: framebuffer: Do not
 unregister platform device
Message-ID: <aXclp4omCL-BTV7R@google.com>
References: <20260115082128.12460-1-tzimmermann@suse.de>
 <20260115082128.12460-2-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115082128.12460-2-tzimmermann@suse.de>
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
	FORGED_RECIPIENTS(0.00)[m:tzimmermann@suse.de,m:briannorris@chromium.org,m:jwerner@chromium.org,m:javierm@redhat.com,m:samuel@sholland.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:chrome-platform@lists.linux.dev,m:hansg@kernel.org,m:linux-fbdev@vger.kernel.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[tzungbi@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[chromium.org,redhat.com,sholland.org,linux.intel.com,kernel.org,gmail.com,ffwll.ch,lists.linux.dev,lists.freedesktop.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[tzungbi@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,suse.de:email]
X-Rspamd-Queue-Id: 6AEAF856EB
X-Rspamd-Action: no action

On Thu, Jan 15, 2026 at 08:57:11AM +0100, Thomas Zimmermann wrote:
> The native driver takes over the framebuffer aperture by removing the
> system- framebuffer platform device. Afterwards the pointer in drvdata
> is dangling. Remove the entire logic around drvdata and let the kernel's
> aperture helpers handle this. The platform device depends on the native
> hardware device instead of the coreboot device anyway.
> 
> When commit 851b4c14532d ("firmware: coreboot: Add coreboot framebuffer
> driver") added the coreboot framebuffer code, the kernel did not support
> device-based aperture management. Instead native driviers only removed
> the conflicting fbdev device. At that point, unregistering the framebuffer
> device most likely worked correctly. It was definitely broken after
> commit d9702b2a2171 ("fbdev/simplefb: Do not use struct
> fb_info.apertures"). So take this commit for the Fixes tag. Earlier
> releases might work depending on the native hardware driver.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: d9702b2a2171 ("fbdev/simplefb: Do not use struct fb_info.apertures")

Acked-by: Tzung-Bi Shih <tzungbi@kernel.org>
