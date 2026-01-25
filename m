Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qJgAIGmIdmncRgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jan 2026 22:17:29 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D94D282781
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jan 2026 22:17:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52CFD10E0FE;
	Sun, 25 Jan 2026 21:17:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="J7p6w6CF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C9AF10E0FE;
 Sun, 25 Jan 2026 21:17:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id DF44F40A2E;
 Sun, 25 Jan 2026 21:17:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DD97C4CEF1;
 Sun, 25 Jan 2026 21:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769375844;
 bh=P2aw8fg1hcqAS5/X9fP1N5WppHckO6H7eqIrLxTjsCU=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=J7p6w6CFZoRkIeWwp6Nuzqbqt6dn66hyrsPrL2A4LFxDcsb5lzxmRN77VO8bh+jER
 Os+iazBiCmctL5VX+xVJF+a4GykfLXsjthZUDwykmfch6At6AXCxX+GZfBInmTcRdU
 DGOromZVRJ9GoZebRKr1wLkTFnOzXjXglgYkNCi+WWaozA4P0HRwYF5ZJmZVoW1mGD
 eUZ/35uVruMyaIqZheZfkZugICgKo7I8zvtWhaCnDpN76JaleXrsdpe6qac30zXY0F
 ybdzxAFkeAcs6xcYVmsl3bPFUI+/nth9uPl7dnfhs5j44OXOiEWu2bB4tCI0S7NZEr
 2qtuVJ575ZWaQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 25 Jan 2026 22:17:17 +0100
Message-Id: <DFXZDYFOPVZ5.1EM568PBOZI1F@kernel.org>
Subject: Re: [PATCH 1/3] gpu: nova-core: remove imports available via prelude
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Alexandre Courbot" <acourbot@nvidia.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Daniel del
 Castillo" <delcastillodelarosadaniel@gmail.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "John Hubbard" <jhubbard@nvidia.com>, "Alistair
 Popple" <apopple@nvidia.com>, "Lyude Paul" <lyude@redhat.com>, "Timur Tabi"
 <ttabi@nvidia.com>, "Shankari Anand" <shankari.ak0208@gmail.com>,
 <rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
To: "Gary Guo" <gary@garyguo.net>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260123172007.136873-1-gary@garyguo.net>
 <20260123172007.136873-2-gary@garyguo.net>
In-Reply-To: <20260123172007.136873-2-gary@garyguo.net>
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
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,protonmail.com,google.com,umich.edu,nvidia.com,ffwll.ch,redhat.com,vger.kernel.org,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_TWELVE(0.00)[22];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: D94D282781
X-Rspamd-Action: no action

On Fri Jan 23, 2026 at 6:19 PM CET, Gary Guo wrote:
> These imports are already in scope by importing `kernel::prelude::*` and
> does not need to be imported separately.
>
> Signed-off-by: Gary Guo <gary@garyguo.net>

I will pick this one up after -rc1 is out.
