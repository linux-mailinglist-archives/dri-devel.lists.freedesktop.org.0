Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kFr+EeuGeGlVqwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 10:35:39 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC50191CD5
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 10:35:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C38E10E4FA;
	Tue, 27 Jan 2026 09:35:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="DZLlfMAZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6967010E4FA
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 09:35:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 259AC436E0;
 Tue, 27 Jan 2026 09:35:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7037AC116C6;
 Tue, 27 Jan 2026 09:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1769506535;
 bh=GJEGWRBJrTMt43UDuvg3iY/vbh+kLH5sEKoX9eSVoJw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DZLlfMAZ/iBXiXwVTR5CxoUqs1ypJ7GVadvLAq0gV8XD+9eij3onyX5fZNwsz2/1T
 h7BrBp0aXl03GqpV/e3moZZ+R9qBnLzhU+h4qS9H0g7NS3BsslWUdGKoMbeIWcrLIA
 JunXloca3zl/JIZP9yetkhXMb6Ax2V7AC2SoJnwA=
Date: Tue, 27 Jan 2026 10:35:31 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: pengfuyuan <pengfuyuan@kylinos.cn>
Cc: Helge Deller <deller@gmx.de>, Alexandre Courbot <acourbot@nvidia.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, "Rafael J . Wysocki" <rafael@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Hans de Goede <hansg@kernel.org>, Lee Jones <lee@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, Zsolt Kajtar <soci@c64.rulez.org>,
 Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v1 v1 0/4] [RUST] Framebuffer driver support
Message-ID: <2026012738-unfrosted-underpass-22c6@gregkh>
References: <20260126081744.781392-1-pengfuyuan@kylinos.cn>
 <ed48e82a-cb94-477f-83c4-b2d87ae3cde6@suse.de>
 <DFYG7MT5JINY.1T8ZZ4ASIWXU@nvidia.com>
 <20260127080419.GA965382@peng>
 <578209b5-6d22-4255-a2e6-256d3f5afa72@gmx.de>
 <20260127085826.GA970322@peng>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260127085826.GA970322@peng>
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
X-Spamd-Result: default: False [4.69 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:pengfuyuan@kylinos.cn,m:deller@gmx.de,m:acourbot@nvidia.com,m:tzimmermann@suse.de,m:dakr@kernel.org,m:aliceryhl@google.com,m:daniel.almeida@collabora.com,m:ojeda@kernel.org,m:boqun.feng@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:tmgross@umich.edu,m:rafael@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:hansg@kernel.org,m:lee@kernel.org,m:sam@ravnborg.org,m:soci@c64.rulez.org,m:ville.syrjala@linux.intel.com,m:rust-for-linux@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-fbdev@vger.kernel.org,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[gregkh@linuxfoundation.org,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[gmx.de,nvidia.com,suse.de,kernel.org,google.com,collabora.com,gmail.com,garyguo.net,protonmail.com,umich.edu,ffwll.ch,ravnborg.org,c64.rulez.org,linux.intel.com,vger.kernel.org,lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,linuxfoundation.org:dkim]
X-Rspamd-Queue-Id: DC50191CD5
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 04:58:26PM +0800, pengfuyuan wrote:
> I would like to ask about the current status and plans for Rust DRM KMS
> support:
> 
> - Is there any active work or a design for KMS abstractions in Rust?

Very much so, look at the patches on the rust mailing list for them!

> - Is there a WIP tree or an RFC that I could look at?

Again, look at the list, there are loads of patches there.

> - Are there specific areas where I could help (e.g. prototyping KMS bindings,
>   writing tests, or working on smaller pieces under guidance)?

Build on the patches that have been submitted and work from there?

thanks,

greg k-h
