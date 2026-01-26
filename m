Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sEulGA1Bd2mMdQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 11:25:17 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD6986D47
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 11:25:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 392CA10E3F3;
	Mon, 26 Jan 2026 10:25:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Wmcy2gK3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9ADB10E3F3
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 10:25:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id AB7954040B;
 Mon, 26 Jan 2026 10:25:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC2DAC19421;
 Mon, 26 Jan 2026 10:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769423114;
 bh=1Rl/NJhMTYCsDeKJhDknpfhqitogEoQQWuJfyg+0UsM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Wmcy2gK3gzl5rqmDjmIUi1KlqXc9G5SvIix+BvfRQuiZWPCm8dzQ7qoOmDD7u/dt2
 qb9GCHkoZmLfNH7E9jcv6dytfIpW9+6ELA5UC/+APDrV2vitourfMnYepwn+Bb5VsE
 8y78zia0ZXtWBtsyTp0Q99v9pIv/EXSu1A5Cwpr3QRXUgYY97Ebo5gXoXRgiTJyq6O
 CN2feiXdgvdpTcYuUZrVAmpm5m88o6TrvbaqWtbzsMEn1eVwEPMq/MBuslE1/L70wr
 YlEARsn+8DmRx7VaaOCu6YRyQqVnBEPoA0/imxGyXLqGFnoxti76/OPyC1QTUl7Jwi
 vTZe1pllR2Sbw==
Date: Mon, 26 Jan 2026 10:25:11 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: briannorris@chromium.org, jwerner@chromium.org, javierm@redhat.com,
 samuel@sholland.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch,
 chrome-platform@lists.linux.dev, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 06/12] firmware: google: Init coreboot bus with
 subsys_initcall()
Message-ID: <aXdBB89WR-DVxDHi@google.com>
References: <20260115082128.12460-1-tzimmermann@suse.de>
 <20260115082128.12460-7-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115082128.12460-7-tzimmermann@suse.de>
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
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tzimmermann@suse.de,m:briannorris@chromium.org,m:jwerner@chromium.org,m:javierm@redhat.com,m:samuel@sholland.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:chrome-platform@lists.linux.dev,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[tzungbi@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[chromium.org,redhat.com,sholland.org,linux.intel.com,kernel.org,gmail.com,ffwll.ch,lists.linux.dev,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tzungbi@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[11];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: CFD6986D47
X-Rspamd-Action: no action

On Thu, Jan 15, 2026 at 08:57:16AM +0100, Thomas Zimmermann wrote:
> Using module_init()/device_initcall() is too late to initialize
> the coreboot bus, as there might already be drivers that depend
> on it.
> 
> So far this hasn't been a problem, as coreboot controls all device
> creation. Initializing the coreboot bus earlier in subsys_initcall()
> will allow for external coreboot drivers to register themselves
> with device_initcall(). Prepares coreboot to support additional
> coreboot drivers from other subsystems.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Acked-by: Tzung-Bi Shih <tzungbi@kernel.org>
