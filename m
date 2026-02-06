Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oLk8FLjGhWnAGAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 11:47:20 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6DFAFCC74
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 11:47:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D763D10E027;
	Fri,  6 Feb 2026 10:47:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="k+AaQumU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C39F10E027;
 Fri,  6 Feb 2026 10:47:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 51BF760051;
 Fri,  6 Feb 2026 10:47:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AAB7C116C6;
 Fri,  6 Feb 2026 10:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1770374834;
 bh=hHVMdwW+wwkpn3m9YeQ+L1EfN1f7eOWIlEoTCcgPMEY=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=k+AaQumUDRdLTa6+HJXM/M/ZH64/GRbY5Sqv5y58SCHivX8wv4BRcGRaowVuvFyi1
 l28Re4f2IqBLyHlpTy4dN8W1IWVNDg2bE7GW8+GH9xWUgyaGCXCZo3dYHKB57jLjqf
 zmXyX1z4VuYT388ufz63Rken35Iy8ckMJra7lWxw2g4eFKR+PB8yHBygXf8JlA5L0h
 bI6q3oksHykbX/gZNI19GBo75SZjmanw9ZQ/Pg2qjHKSSzClGSADG1dTTbwx0h1pa4
 gIf5BfRIxEW7v+EK+edD4iljRFXiQ1khCj5p93BXhkBGCwA0hjCaHCdU/P8Dt++g08
 Vp6+VlLtcltpQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Feb 2026 11:47:05 +0100
Message-Id: <DG7THZ3CYQYJ.LM9KKSFC48HI@kernel.org>
Subject: Re: [PATCH v2 00/10] rust: pci: add abstractions for SR-IOV capability
Cc: "Peter Colberg" <pcolberg@redhat.com>, "Bjorn Helgaas"
 <bhelgaas@google.com>, =?utf-8?q?Krzysztof_Wilczy=C5=84ski?=
 <kwilczynski@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Abdiel Janulgue"
 <abdiel.janulgue@gmail.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Robin Murphy" <robin.murphy@arm.com>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Dave Ertman"
 <david.m.ertman@intel.com>, "Ira Weiny" <ira.weiny@intel.com>, "Leon
 Romanovsky" <leon@kernel.org>, "David Airlie" <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, "Jonathan Corbet" <corbet@lwn.net>, "Xu Yilun"
 <yilun.xu@intel.com>, "Tom Rix" <trix@redhat.com>, "Moritz Fischer"
 <mdf@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, "Zhi Wang"
 <zhiw@nvidia.com>, "Zijing Zhang" <zijing.zhang@ry.rs>,
 <linux-pci@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>,
 "Alistair Popple" <apopple@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "John Hubbard" <jhubbard@nvidia.com>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-doc@vger.kernel.org>, <linux-fpga@vger.kernel.org>,
 <driver-core@lists.linux.dev>, "Jason Gunthorpe" <jgg@ziepe.ca>
To: "Dirk Behme" <dirk.behme@de.bosch.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260205-rust-pci-sriov-v2-0-ef9400c7767b@redhat.com>
 <4669209d-c53b-4cc5-ab2f-0f09aa5dfc50@de.bosch.com>
In-Reply-To: <4669209d-c53b-4cc5-ab2f-0f09aa5dfc50@de.bosch.com>
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
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[redhat.com,google.com,kernel.org,gmail.com,garyguo.net,protonmail.com,umich.edu,collabora.com,arm.com,linuxfoundation.org,intel.com,ffwll.ch,lwn.net,nvidia.com,ry.rs,vger.kernel.org,lists.freedesktop.org,lists.linux.dev,ziepe.ca];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[42];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: C6DFAFCC74
X-Rspamd-Action: no action

On Fri Feb 6, 2026 at 8:45 AM CET, Dirk Behme wrote:
> Or is this completely orthogonal?

Yes, this is orthogonal.
