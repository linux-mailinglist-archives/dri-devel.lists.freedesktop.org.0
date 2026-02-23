Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UAbHLXnJnGkwKQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 22:41:13 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D5F517DAC4
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 22:41:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6159110E2AC;
	Mon, 23 Feb 2026 21:41:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HWYdGqDo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D16B10E2AC;
 Mon, 23 Feb 2026 21:41:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 5C43D42B77;
 Mon, 23 Feb 2026 21:41:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF471C116C6;
 Mon, 23 Feb 2026 21:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771882868;
 bh=t7J5Tj8RlZ5XzMAXGnsiXbH6mgB4YN/nTJgHtJEr3v4=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=HWYdGqDotHNUL4fdCzNzlGkoHmO/R1BdROR9kIfu1fiMzf28IKQ+Fg1UKDdhNbztJ
 aGt2C5oGfTz7x393TjjZbB4OTlJNxJPS+U1sCO7mj/uZp3wHo3k0u0uffcva8yL9bT
 3sHEsFtvXKE5eQ7sAWk7xB6pNVxE2tBaEuY3Sihod0wEOAhwntdJ53OhGD3WdgxzH6
 GQRXtjM4sSiCfSWII7sCPuvWdlM1JOGAdX23jF0C5X44e7/0RCXxhebalGqGNZ2D4I
 KVTzgr1FKhmx5NjjKvjF/ojbVHAIaelcz1Sq9Xxlv9FHs1gJJ0+B+PJyF5/oCIZgad
 vAE9J7gV8bcng==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Feb 2026 22:41:04 +0100
Message-Id: <DGMO1YUKS8WK.H2FG6YL1ROC3@kernel.org>
Subject: Re: [PATCH v2] drm/tyr: Clarify driver/device type names
Cc: <dri-devel@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>,
 <daniel.almeida@collabora.com>, <aliceryhl@google.com>,
 <boris.brezillon@collabora.com>, "dri-devel"
 <dri-devel-bounces@lists.freedesktop.org>
To: "Deborah Brouwer" <deborah.brouwer@collabora.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260223204648.208886-1-deborah.brouwer@collabora.com>
In-Reply-To: <20260223204648.208886-1-deborah.brouwer@collabora.com>
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
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 0D5F517DAC4
X-Rspamd-Action: no action

On Mon Feb 23, 2026 at 9:46 PM CET, Deborah Brouwer wrote:
> Currently the `TyrDriver` struct implements both `platform::Driver` and
> `drm::Driver`. For clarity, split up these two roles:
>  - Introduce `TyrPlatformDeviceData` to implement `platform::Driver`, and

I think this should be TyrPlatformDriverData instead, i.e. it is the driver=
's
private data that happens to be stored in (and owned by) the platform devic=
e.

The corresponding C setter is also called platform_set_drvdata() and not
platform_set_devdata().

>  - Introduce `TyrDrmDriver` to implement `drm::Driver`.
>
> Also rename other variables to reflect their roles in the DRM context:
> - Rename `TyrDevice` to `TyrDrmDevice`
> - Rename `TyrData` to `TyrDrmDeviceData`

Although it might sound contradictory at first, I think for a drm::Device i=
t is
OK to name it TyrDrmDeviceData as opposed to TyrDrmDriverData (although tha=
t
would make sense as well and I'd probably prefer that).

The reason is that a platform::Device being a bus device may store differen=
t
*driver specific* data types thoughout its whole lifetime, i.e. a platform
device may be bound to multiple different drivers throughout its lifetime.

But a drm::Device being a class device is always *statically* typed over it=
's
private data type, i.e. drm::Device<TyrDrmDeviceData>.

> - Rename `File` to `TyrDrmFileData`
> - Rename `DrmFile` to `TyrDrmFile`
>
> No functional changes are intended.
>
> Co-developed-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>

Otherwise LGTM.
