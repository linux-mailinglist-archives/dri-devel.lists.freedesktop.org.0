Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CBpbI2eHcWlaIwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 03:11:51 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8F060BE0
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 03:11:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EABC810E272;
	Thu, 22 Jan 2026 02:11:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="amcZoNO4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A94AF10E272
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jan 2026 02:11:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1769047903; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=ncOmHeNwR9WO2RKzfXvT4+ZDddd2LEVJ5qh7R85vtLoP90jYmZ9i0D5PXuSAvQdfmoB/cKSUtUOSro6YAD39XJbIBE3r1JwdD+39z/YTVYvF/y0wZumkoLgRHVkbmgLMLhq6GR8eBpLv7eFw+vYBwLFv/3whsWZiBVqr3oLqpsY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1769047903;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=IZoDNO1tUhowBC/Wb25mkcmJiP2cen+Vd6UQb65epvU=; 
 b=ZiaXm31ar1ZH5jiGwTlSF7hFj1W2iWH9U5aGit9IagxPE5v3tbSYk6La5JigZhUGvkDVYBcacFeX4PGO+QyXKNADIXwQHEhcsYTM+vREpGnQuYsGEdFnX8wzgsrpqYTrZVJqe8nwI0mQeotmIMLabLizVke5J9M/ubmw+3vWVOo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
 dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1769047903; 
 s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com; 
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
 bh=IZoDNO1tUhowBC/Wb25mkcmJiP2cen+Vd6UQb65epvU=;
 b=amcZoNO4Hrtx0l/ld3w8zFM68PPjnTOprmE0QLxoQeTHSiPuiNVBWqnQ5DcZcYCS
 ghEREg18NsvNyakh2T+NFQpnzEm2D2pcedZ8dUblkNsIuWtzZ5bSwrSOQqM/p9Ubv62
 mEYbOpWlVXFUhyC7VN3xizdfqfhIJKsFnevzcDos=
Received: by mx.zohomail.com with SMTPS id 1769047901905718.0624885472727;
 Wed, 21 Jan 2026 18:11:41 -0800 (PST)
Date: Wed, 21 Jan 2026 18:11:40 -0800
From: Deborah Brouwer <deborah.brouwer@collabora.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 daniel.almeida@collabora.com, aliceryhl@google.com,
 boris.brezillon@collabora.com, broonie@kernel.org, dakr@kernel.org
Subject: Re: [PATCH] drm/tyr: suppress unread field warnings
Message-ID: <aXGHXEylGKcNsqic@um790>
References: <20260122003746.405370-1-deborah.brouwer@collabora.com>
 <CANiq72=xNcgg6hahQRkAjfbiKOEGMvdePLSaWvD7cML9qTP2iA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72=xNcgg6hahQRkAjfbiKOEGMvdePLSaWvD7cML9qTP2iA@mail.gmail.com>
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
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:miguel.ojeda.sandonis@gmail.com,m:rust-for-linux@vger.kernel.org,m:daniel.almeida@collabora.com,m:aliceryhl@google.com,m:boris.brezillon@collabora.com,m:broonie@kernel.org,m:dakr@kernel.org,m:miguelojedasandonis@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[deborah.brouwer@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[deborah.brouwer@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 1F8F060BE0
X-Rspamd-Action: no action

On Thu, Jan 22, 2026 at 01:58:40AM +0100, Miguel Ojeda wrote:
> On Thu, Jan 22, 2026 at 1:38 AM Deborah Brouwer
> <deborah.brouwer@collabora.com> wrote:
> >
> > Currently these warnings, as errors, are preventing Tyr driver
> > from building:
> 
> From what I understand, this is only reproducible with Rust 1.80.0
> (unsupported upstream), and was fixed in Rust 1.80.1. Did you
> reproduce it elsewhere? I asked Mark where his toolchain comes to see
> what could be done there (e.g. in his distribution).

Yes, I have the error with 1.91.0
rustc --version --verbose
rustc 1.91.0 (f8297e351 2025-10-28)
binary: rustc
commit-hash: f8297e351a40c1439a467bbbb6879088047f50b3
commit-date: 2025-10-28
host: x86_64-unknown-linux-gnu
release: 1.91.0
LLVM version: 21.1.2

bindgen --version
bindgen 0.72.1

> 
> If it is just in Rust 1.80.0, and if a distribution still uses that
> one, and for some reason they don't want to use/backport the fix in
> 1.80.1, then we could consider something more global, i.e. ignoring
> that lint altogether for that version, since it also fails for another
> trait in `bounded.rs` (that is why I knew about this).
> 
> (By the way, in any case, we would need a proper explanation of this
> full context in the commit message.)
> 
> Thanks!
> 
> Cheers,
> Miguel
