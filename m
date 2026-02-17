Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SPkdKDBSlGktCQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 12:34:08 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40AA014B6BD
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 12:34:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D66510E21C;
	Tue, 17 Feb 2026 11:34:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NMwv43k3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B3B710E21C;
 Tue, 17 Feb 2026 11:34:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 2D42C61338;
 Tue, 17 Feb 2026 11:34:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5638C4CEF7;
 Tue, 17 Feb 2026 11:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771328043;
 bh=LV3jUL2UP1KL2QagXkM8DQrfPbVTS+RWLcvVnZs54XU=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=NMwv43k3/ARhjfdEv+5CuqpT5SjuOqHMOOfr2nDH+cKFv0JJroEQLoMQaTbBQfSvl
 UdqGTtHdh8/jg0/24VzWirWhYaxTX4Y2UL+oL231uye9mCgq0ClrRZXNMlT1YDN48u
 +7T6EAX0UkTZhZCMtNVcoGDJ1lVHRW+lgFO9J89iBEiC4NKrU0hQ+zonWqaUgx64fB
 rqkOTa7swYjXt10isbzgDiKWV2M5/VCe7Pc12P0lS/siSnolsR2sgUoOlSms7u2flC
 grAokBAFSOA1EUzpif73/NEqjWCcxQssJy8DTAvwCSq/DhURaUPE5h2m8s4qDDaggD
 vF4xyP/qRrrlw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Feb 2026 12:33:59 +0100
Message-Id: <DGH7DVJRH25E.2C9F743QLF6IA@kernel.org>
Subject: Re: [PATCH v3 0/8] gpu: nova-core: miscellaneous improvements
Cc: "Alice Ryhl" <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "John Hubbard" <jhubbard@nvidia.com>,
 "Alistair Popple" <apopple@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Edwin Peer"
 <epeer@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>, "Lyude
 Paul" <lyude@redhat.com>, "Gary Guo" <gary@garyguo.net>
To: "Alexandre Courbot" <acourbot@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260217-nova-misc-v3-0-b4e2d45eafbc@nvidia.com>
In-Reply-To: <20260217-nova-misc-v3-0-b4e2d45eafbc@nvidia.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[google.com,gmail.com,ffwll.ch,nvidia.com,lists.freedesktop.org,vger.kernel.org,redhat.com,garyguo.net];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 40AA014B6BD
X-Rspamd-Action: no action

On Tue Feb 17, 2026 at 3:45 AM CET, Alexandre Courbot wrote:
> A few simple, loosely-related small improvements for nova-core,
> including reporting unprocessed data in GSP messages, removal of
> unnecessary code in GSP and the sequencer, and leveraging the Zeroable
> derive macro and core library's CStr. Probably nothing too
> controversial, so I plan on applying it soon after -rc1 gets released.
>
> This revision is based on master.
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

With my comments in patch 7 addressed,

Reviewed-by: Danilo Krummrich <dakr@kernel.org>
