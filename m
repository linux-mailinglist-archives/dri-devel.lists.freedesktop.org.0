Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YCv5AiJ1cmlpkwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 20:06:10 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4816CE44
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 20:06:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1AD010EA47;
	Thu, 22 Jan 2026 19:06:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="kBmVs6np";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3BF410EA47
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jan 2026 19:06:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1769108763; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=g0ptvo0tmmgB9fdAFJoCetNQFCJ6m5F3/MFhZy/fMcOoNeaTncjeX0eGEY/DWZOiPKcqpHPBX1fkSY8zmEbjpY2X8g/QzPfn1ztBg5LIUvcWvtc4W6ViL/HfqTgxuamT4uAmjhmDuumFX4oHGdwR7luP2zti15F1d6z35RDi0Hs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1769108763;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=faRdJUDNrt+iPBKV4ukuA3a4Ha5WPF5TGx+wxawSFO0=; 
 b=keX6X1e0Cb4i5XUBsxZEELBmbmkqOQCbKmTe/RdJmFgamlrNKkKfAkd8UDIfRV4PkBZl3horT9B8srCu9vQrOD2Iu5tpkIq0knXa2kwx6pp3d9Xo5LCIlsqTfBKgBZpJy85JM/IRii1ajEFnaWfM/NkyeFXYCrt41ye1wuPOh5k=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
 dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1769108763; 
 s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com; 
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
 bh=faRdJUDNrt+iPBKV4ukuA3a4Ha5WPF5TGx+wxawSFO0=;
 b=kBmVs6npXNcrQe+DcdjW85v+0gfddLLEobVO66xlGJkNIf4j4/YsCQPYxP2OoWgv
 142hn7AUjWzzPKkaQeJKZBrGDah7zKymD2Oo9KWMBQZ2MjdUlaL/nRfRupDS3/DAYD/
 0DX83P96Sx6IfCm1kL+mTgz+KCJ6/8K3X5j5hFus=
Received: by mx.zohomail.com with SMTPS id 1769108760674919.727871103422;
 Thu, 22 Jan 2026 11:06:00 -0800 (PST)
Date: Thu, 22 Jan 2026 11:05:59 -0800
From: Deborah Brouwer <deborah.brouwer@collabora.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 daniel.almeida@collabora.com, boris.brezillon@collabora.com,
 broonie@kernel.org, dakr@kernel.org, miguel.ojeda.sandonis@gmail.com
Subject: Re: [PATCH] drm/tyr: suppress unread field warnings
Message-ID: <aXJ1F4e7wdgM83Oo@um790>
References: <20260122003746.405370-1-deborah.brouwer@collabora.com>
 <aXHi2jJNptrgUqyj@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aXHi2jJNptrgUqyj@google.com>
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
X-Spamd-Result: default: False [-0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:aliceryhl@google.com,m:rust-for-linux@vger.kernel.org,m:daniel.almeida@collabora.com,m:boris.brezillon@collabora.com,m:broonie@kernel.org,m:dakr@kernel.org,m:miguel.ojeda.sandonis@gmail.com,m:miguelojedasandonis@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[deborah.brouwer@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,collabora.com,kernel.org,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[deborah.brouwer@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_SPAM(0.00)[0.303];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 3E4816CE44
X-Rspamd-Action: no action

On Thu, Jan 22, 2026 at 08:42:02AM +0000, Alice Ryhl wrote:
> On Wed, Jan 21, 2026 at 04:37:46PM -0800, Deborah Brouwer wrote:
> > Currently these warnings, as errors, are preventing Tyr driver
> > from building:
> > 
> > error: field `device` is never read
> >   --> drivers/gpu/drm/tyr/driver.rs:37:5
> >    |
> > 36 | pub(crate) struct TyrDriver {
> >    |                   --------- field in this struct
> > 37 |     device: ARef<TyrDevice>,
> >    |     ^^^^^^
> >    |
> >    = note: `-D dead-code` implied by `-D warnings`
> >    = help: to override `-D warnings` add `#[allow(dead_code)]`
> > 
> > error: fields `mali` and `sram` are never read
> >    --> drivers/gpu/drm/tyr/driver.rs:196:5
> >     |
> > 195 | struct Regulators {
> >     |        ---------- fields in this struct
> > 196 |     mali: Regulator<regulator::Enabled>,
> >     |     ^^^^
> > 197 |     sram: Regulator<regulator::Enabled>,
> >     |     ^^^^
> > 
> > error: aborting due to 2 previous errors
> > 
> > Suppress these errors so that the Tyr driver will build.
> > 
> > Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
> 
> I still don't understand why I couldn't reproduce it myself, but
> assuming it's not just an 1.80.0 issue, below is my review:

I think the problem is not actually the rust compiler version, but commit
"0242623384c7 rust: driver: let probe() return impl PinInit<Self, Error>"

Tyr probe() used to return a fully initialized Pin<KBox<Self>>, so the
fields existed in an allocated struct which I suppose counted as
“reading” the fields. But now Tyr probe() returns just a PinInit
closure which doesn’t count as reading these fields.

> 
> >  drivers/gpu/drm/tyr/driver.rs | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/tyr/driver.rs b/drivers/gpu/drm/tyr/driver.rs
> > index 2a45d0288825..04c865cb4397 100644
> > --- a/drivers/gpu/drm/tyr/driver.rs
> > +++ b/drivers/gpu/drm/tyr/driver.rs
> > @@ -34,6 +34,7 @@
> >  
> >  #[pin_data(PinnedDrop)]
> >  pub(crate) struct TyrDriver {
> > +    #[allow(dead_code)]
> >      device: ARef<TyrDevice>,
> 
> Let's use #[expect(dead_code)] so we remember to remove this when a user
> is added.

Using #[expect(dead_code)] also fails with 'unfulfilled lint expectation'.
So I could keep #[allow(dead_code)] or maybe just use an underscore
_driver too with a comment to explain the issue. What do you think?

> 
> >  }
> >  
> > @@ -193,6 +194,8 @@ struct Clocks {
> >  
> >  #[pin_data]
> >  struct Regulators {
> > +    #[allow(dead_code)]
> >      mali: Regulator<regulator::Enabled>,
> > +    #[allow(dead_code)]
> >      sram: Regulator<regulator::Enabled>,
> 
> I don't think we intend to ever use these fields - they exist only for
> their destructor. In that case, please prefix them with an underscore
> instead:
> 
> #[pin_data]
> struct Regulators {
>     _mali: Regulator<regulator::Enabled>,
>     _sram: Regulator<regulator::Enabled>,
> }
> 
> Alice
