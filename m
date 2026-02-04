Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +CLnNAl4g2mFmwMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 17:47:05 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE6CEA732
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 17:47:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F9B310E6CF;
	Wed,  4 Feb 2026 16:47:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZHj8q1Uc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A61C610E6CF
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Feb 2026 16:47:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 2BC5240E19;
 Wed,  4 Feb 2026 16:47:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF418C4CEF7;
 Wed,  4 Feb 2026 16:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1770223620;
 bh=dy73/9OQI/HuBvsd+ptSVtFrF/SFQ/zEvH4RIO0j4i4=;
 h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
 b=ZHj8q1Ucvt7QcaZcn9QuPYACGDPfU/YL82+e6kQIaszjDn8/K3Lk25/ytj8Malksx
 QTrROJpGVUsMkMWTzjQvp0wcUGKl69dlGdw+uM4ZXkcku66CUCCFf+JntNkoa9XeFK
 UBAoEJloaJHzf8XjFtFKSgZDr+rjjdpxj021cT2FEEhwdvxmV1QnS69elAgBlCG2S1
 5VpdKtuK+x95jkiRP0Q0olnVlaCNxNMiWvM9N5rJSdpQVInfdYkjh/kMwVzxggH0vt
 xi4ko64jYM5R0Fh8vdICZWmXXV6iTywKSpHzFCGMppUp7E+ZJ8jy9VLrS1L5oDN6Sy
 z8aQSzU00WK2A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Feb 2026 17:46:51 +0100
Message-Id: <DG6BWC5SOHUG.2K1ZXGYNVB69V@kernel.org>
To: "Andreas Hindborg" <a.hindborg@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v14 1/9] rust: types: Add Ownable/Owned types
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, "Dave Ertman"
 <david.m.ertman@intel.com>, "Ira Weiny" <ira.weiny@intel.com>, "Leon
 Romanovsky" <leon@kernel.org>, "Paul Moore" <paul@paul-moore.com>, "Serge
 Hallyn" <sergeh@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Alexander Viro" <viro@zeniv.linux.org.uk>, "Christian Brauner"
 <brauner@kernel.org>, "Jan Kara" <jack@suse.cz>, "Igor Korotin"
 <igor.korotin.linux@gmail.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Lorenzo Stoakes"
 <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 "Viresh Kumar" <vireshk@kernel.org>, "Nishanth Menon" <nm@ti.com>, "Stephen
 Boyd" <sboyd@kernel.org>, "Bjorn Helgaas" <bhelgaas@google.com>,
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <linux-block@vger.kernel.org>, <linux-security-module@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-fsdevel@vger.kernel.org>,
 <linux-mm@kvack.org>, <linux-pm@vger.kernel.org>,
 <linux-pci@vger.kernel.org>, "Asahi Lina" <lina+kernel@asahilina.net>
References: <20260204-unique-ref-v14-0-17cb29ebacbb@kernel.org>
 <20260204-unique-ref-v14-1-17cb29ebacbb@kernel.org>
 <7uftlTZxNVxMw7VNqETbf9dBIWLrQ1Px16pM3qnAcc6FPgQj-ERdWfAACc5aDSAdeHM5lLTdSBZYkcOIgu7mWA==@protonmail.internalid>
 <DG6AIA0QK77C.EKG7X4NBEJ00@kernel.org>
 <87fr7gpk6d.fsf@t14s.mail-host-address-is-not-set>
In-Reply-To: <87fr7gpk6d.fsf@t14s.mail-host-address-is-not-set>
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:a.hindborg@kernel.org,m:ojeda@kernel.org,m:boqun.feng@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:gregkh@linuxfoundation.org,m:david.m.ertman@intel.com,m:ira.weiny@intel.com,m:leon@kernel.org,m:paul@paul-moore.com,m:sergeh@kernel.org,m:rafael@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:viro@zeniv.linux.org.uk,m:brauner@kernel.org,m:jack@suse.cz,m:igor.korotin.linux@gmail.com,m:daniel.almeida@collabora.com,m:lorenzo.stoakes@oracle.com,m:Liam.Howlett@oracle.com,m:vireshk@kernel.org,m:nm@ti.com,m:sboyd@kernel.org,m:bhelgaas@google.com,m:kwilczynski@kernel.org,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-block@vger.kernel.org,m:linux-security-module@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:linux-mm@kvack.org,m:linux-pm@vger.kernel.org,m:linux-pci@vger.kernel.org,m:lina+kernel@asahilina.net,m:boqunfeng@gmail.com,m:igorkorotinlinux@gmail.com,m:l
 ina@asahilina.net,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dakr@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[39];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu,linuxfoundation.org,intel.com,paul-moore.com,ffwll.ch,zeniv.linux.org.uk,suse.cz,collabora.com,oracle.com,ti.com,vger.kernel.org,lists.freedesktop.org,kvack.org,asahilina.net];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel,kernel];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 5DE6CEA732
X-Rspamd-Action: no action

On Wed Feb 4, 2026 at 5:06 PM CET, Andreas Hindborg wrote:
> It is my understanding that the SoB needs confirmation from the author
> if the code was changed. I changed the code and did not want to bother
> the original author, because it is my understanding they do not wish to
> be contacted. I did not want to misrepresent the original author, and so
> I did not change the "From:" line.

Frankly, I don't know what's the correct thing to do in this case; maybe th=
e
correct thing is to just keep the SoB, but list all the changes that have b=
een
made.

Technically, the same thing is common practice when maintainers (including
myself) apply (minor) changes to a patch when applying them to their tree.

> How would you prefer to account for the work by Abdiel and Boqun?

I mean, I don't have a preference and if I would have one, it wouldn't be
relevant. :) I just wanted to bring it up since the very first version was =
sent
by the two of them. So, I think we should just ask.
