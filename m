Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KCb8CpF+cmmklQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 20:46:25 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80AA76D328
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 20:46:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 301A110EA77;
	Thu, 22 Jan 2026 19:46:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tmlBlkRr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 982AC10EA77
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jan 2026 19:46:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id BD5F960143;
 Thu, 22 Jan 2026 19:46:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D816CC116C6;
 Thu, 22 Jan 2026 19:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769111179;
 bh=TN8arzSGhBApGLLCHhBbYeBIMyt6PlxpwkFRnn9kLYo=;
 h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
 b=tmlBlkRrxjrblX0ToEJ9/v1bqxDvynGzITgcx4dvamHzPYcTvaVkJ/AJvv6SuURPf
 JTbCb0fKUINNpT3cw984O1q/olFHS12FBHjn9hFh9+eYE/pVyCaxQa9n6l4QXnmLb7
 IA6M0OECVXcA8xYgHgoeqekTU4mu4QgY4ZUTET08M08dQO42eU+dWtI+SpmXoRDzZb
 FZKDwUFiK9REttU1T9FUjzKQq/a5LS5LJ5sl08ervqwTmbA1DSpCribDSQMjev0Mcs
 YbjN21otNpjiHe/7b9XztPqo9OGTbu8r4jlymxIWiJxsw3TAALjAPlGan5yT6FV5cS
 jd1QVIWHtV7/g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 22 Jan 2026 20:46:16 +0100
Message-Id: <DFVDKMMA7KPC.2DN0951H3H55Y@kernel.org>
Cc: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>, "Deborah Brouwer"
 <deborah.brouwer@collabora.com>, <dri-devel@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>, <daniel.almeida@collabora.com>,
 <aliceryhl@google.com>, <boris.brezillon@collabora.com>
To: "Mark Brown" <broonie@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH] drm/tyr: suppress unread field warnings
References: <20260122003746.405370-1-deborah.brouwer@collabora.com>
 <CANiq72=xNcgg6hahQRkAjfbiKOEGMvdePLSaWvD7cML9qTP2iA@mail.gmail.com>
 <cccf7d2d-fe7c-4b90-8181-ae4cbfacb63f@sirena.org.uk>
In-Reply-To: <cccf7d2d-fe7c-4b90-8181-ae4cbfacb63f@sirena.org.uk>
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
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,collabora.com,lists.freedesktop.org,vger.kernel.org,google.com];
	FORGED_RECIPIENTS(0.00)[m:miguel.ojeda.sandonis@gmail.com,m:deborah.brouwer@collabora.com,m:rust-for-linux@vger.kernel.org,m:daniel.almeida@collabora.com,m:aliceryhl@google.com,m:boris.brezillon@collabora.com,m:broonie@kernel.org,m:miguelojedasandonis@gmail.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[dakr@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.925];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 80AA76D328
X-Rspamd-Action: no action

On Thu Jan 22, 2026 at 12:22 PM CET, Mark Brown wrote:
> On Thu, Jan 22, 2026 at 01:58:40AM +0100, Miguel Ojeda wrote:
>
>> From what I understand, this is only reproducible with Rust 1.80.0
>> (unsupported upstream), and was fixed in Rust 1.80.1. Did you
>> reproduce it elsewhere? I asked Mark where his toolchain comes to see
>> what could be done there (e.g. in his distribution).
>>=20
>> If it is just in Rust 1.80.0, and if a distribution still uses that
>> one, and for some reason they don't want to use/backport the fix in
>> 1.80.1, then we could consider something more global, i.e. ignoring
>> that lint altogether for that version, since it also fails for another
>> trait in `bounded.rs` (that is why I knew about this).
>
> As I said on the other thread I'm seeing this with what appears to be
> 1.85.0 in Debian stable.

That's pretty odd, I can only reproduce the ones you reported in the linux-=
next
report with 1.80.0.

If I run 1.85.0, I *instead* see the following ones from clippy:

  CLIPPY [M] drivers/gpu/drm/tyr/tyr.o
warning: operator precedence can trip the unwary
  --> drivers/gpu/drm/tyr/gpu.rs:51:13
   |
51 |             shader_present | u64::from(regs::GPU_SHADER_PRESENT_HI.rea=
d(dev, iomem)?) << 32;
   |             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^^^ help: consider parenthesizing your expression: `shade=
r_present | (u64::from(regs::GPU_SHADER_PRESENT_HI.read(dev, iomem)?) << 32=
)`
   |
   =3D help: for further information visit https://rust-lang.github.io/rust=
-clippy/master/index.html#precedence
   =3D note: `-W clippy::precedence` implied by `-W clippy::all`
   =3D help: to override `-W clippy::all` add `#[allow(clippy::precedence)]=
`

warning: operator precedence can trip the unwary
  --> drivers/gpu/drm/tyr/gpu.rs:55:13
   |
55 |             tiler_present | u64::from(regs::GPU_TILER_PRESENT_HI.read(=
dev, iomem)?) << 32;
   |             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^ help: consider parenthesizing your expression: `tiler_p=
resent | (u64::from(regs::GPU_TILER_PRESENT_HI.read(dev, iomem)?) << 32)`
   |
   =3D help: for further information visit https://rust-lang.github.io/rust=
-clippy/master/index.html#precedence

warning: operator precedence can trip the unwary
  --> drivers/gpu/drm/tyr/gpu.rs:58:26
   |
58 |         let l2_present =3D l2_present | u64::from(regs::GPU_L2_PRESENT=
_HI.read(dev, iomem)?) << 32;
   |                          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^^^^^^^^ help: consider parenthesizing your expression: `=
l2_present | (u64::from(regs::GPU_L2_PRESENT_HI.read(dev, iomem)?) << 32)`
   |
   =3D help: for further information visit https://rust-lang.github.io/rust=
-clippy/master/index.html#precedence

I wonder if this is Debian specific?
