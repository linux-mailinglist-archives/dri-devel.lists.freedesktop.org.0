Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0BmREdYld2kUcwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 09:29:10 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC5CB85737
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 09:29:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41A9810E3AB;
	Mon, 26 Jan 2026 08:29:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="R+QAmRBq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B11610E3AB
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 08:29:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0A8C6600C3;
 Mon, 26 Jan 2026 08:29:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07773C116C6;
 Mon, 26 Jan 2026 08:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769416145;
 bh=duv63FSna/7UJJZ/FsHnyQa6lqZbbd1PPZS3QmcNnrc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=R+QAmRBqjxBgW1zExN8CFs4irRmp9XHTWSdmyaACeX+KIVQ+agtMRIakolZn8cy4s
 lDx9Uxng0aegOT6V2/OgTfsFy2eg0A/cQ5WtrOsI+LrTTJiLiMfc+fMj19Em/VHL9/
 4j+hT9kHLxHb7ZKnnHxKyY9sEhIBjKAhB5w/BLkU9F7mfJqyED3uOT5KGfloHbDoY8
 +nrJDKGgJrqoTOBRU0+jJOSS8uiE4p/V6VhM4hT2NaflpoCe0t8FHWh3FoiZ0WYwSb
 H4qmjBn1rLB+ZfLjBz9EcOs6Wiq1yGl2+JSYI+VIFPx1aRskOKHoaSiw7i7pjX5HVc
 cnQl76LzmhPkw==
Date: Mon, 26 Jan 2026 08:29:02 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: briannorris@chromium.org, jwerner@chromium.org, javierm@redhat.com,
 samuel@sholland.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch,
 chrome-platform@lists.linux.dev, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 04/12] firmware: google: framebuffer: Tie platform
 device to PCI hardware
Message-ID: <aXclzjXprwN8HMQr@google.com>
References: <20260115082128.12460-1-tzimmermann@suse.de>
 <20260115082128.12460-5-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115082128.12460-5-tzimmermann@suse.de>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,suse.de:email]
X-Rspamd-Queue-Id: EC5CB85737
X-Rspamd-Action: no action

On Thu, Jan 15, 2026 at 08:57:14AM +0100, Thomas Zimmermann wrote:
> Use the PCI device as parent of the system-framebuffer device instead
> of the coreboot device. Prevents SIGBUS or SIGSEG after hot-unplug of
> the PCI device while the framebuffer is active.
> 
> The simple-framebuffer device depends on the PCI hardware, so this
> device needs to be its parent. The current coreboot parent is no
> longer needed after the system-framebuffer evice has been created.
                                            ^ d?
> 
> On systems without PCI or if no PCI parent device could be found,
> the platform device hangs on the platform bus directly.
> 
> The fix here is similar to code in sysfb, which contained that same
> bug.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

With some minor comments,
Acked-by: Tzung-Bi Shih <tzungbi@kernel.org>

> +	if (parent)
> +		put_device(parent);
> +
> +	return 0;

Or maybe just:

  ret = 0;
