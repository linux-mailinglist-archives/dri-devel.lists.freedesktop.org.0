Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OLgnLhr1eWnT1AEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 12:38:02 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB73A096E
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 12:38:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C10E10E6A7;
	Wed, 28 Jan 2026 11:37:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="VEC26QRf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ADD910E6A7;
 Wed, 28 Jan 2026 11:37:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 224C244091;
 Wed, 28 Jan 2026 11:37:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23404C4CEF1;
 Wed, 28 Jan 2026 11:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769600277;
 bh=Q84GU8xgsjGXyT/viKhB7wVI26KgRvvwxmD1gNRdy8M=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=VEC26QRf+0VxV8vqSHDh+7/n7HJgr9VHxk0DfXO02krOr0HKGpHnslA8xQM7F/Sfx
 uvgpjvKWl80Jt2NzzrP5Vf4WzZEKkgkCutpfrCte31cGJ0oyWexjKhZZJaw9iMT5Kr
 MRJ659ORGYlPWX98JxGlDIa2zLTppGEXexk40IyQd06aW2Z0u1J2et46X9rBROXCpr
 3Eu1ofi7CTwfE7MEJTfTYl337ZPaHDbJf5Fxu+NXyXcRqGvGFSqH2uIoULyZTrma/o
 gNvMYUWfo1U6149cpZkMVGRsGAZLiRYJ5I0009kg+Guok8oyVcMNOqbgdra/drRR6I
 tev/SXp8kLopQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 28 Jan 2026 12:37:44 +0100
Message-Id: <DG06XUWOJLO5.1ESB8ES6A6081@kernel.org>
Subject: Re: [PATCH RFC v6 00/26] nova-core: Memory management
 infrastructure (v6)
Cc: <linux-kernel@vger.kernel.org>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Jonathan Corbet"
 <corbet@lwn.net>, "Alex Deucher" <alexander.deucher@amd.com>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, "Jani Nikula"
 <jani.nikula@linux.intel.com>, "Joonas Lahtinen"
 <joonas.lahtinen@linux.intel.com>, "Rodrigo Vivi" <rodrigo.vivi@intel.com>,
 "Tvrtko Ursulin" <tursulin@ursulin.net>, "Huang Rui" <ray.huang@amd.com>,
 "Matthew Auld" <matthew.auld@intel.com>, "Matthew Brost"
 <matthew.brost@intel.com>, "Lucas De Marchi" <lucas.demarchi@intel.com>,
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Helge Deller" <deller@gmx.de>, "Alice Ryhl" <aliceryhl@google.com>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>,
 "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "John Hubbard" <jhubbard@nvidia.com>, "Alistair
 Popple" <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Edwin Peer"
 <epeer@nvidia.com>, "Alexandre Courbot" <acourbot@nvidia.com>, "Andrea
 Righi" <arighi@nvidia.com>, "Andy Ritger" <aritger@nvidia.com>, "Zhi Wang"
 <zhiw@nvidia.com>, "Alexey Ivanov" <alexeyi@nvidia.com>, "Balbir Singh"
 <balbirs@nvidia.com>, "Philipp Stanner" <phasta@kernel.org>, "Elle Rhumsaa"
 <elle@weathered-steel.dev>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, <joel@joelfernandes.org>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>, <linux-doc@vger.kernel.org>,
 <amd-gfx@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, <linux-fbdev@vger.kernel.org>
To: "Joel Fernandes" <joelagnelf@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260120204303.3229303-1-joelagnelf@nvidia.com>
In-Reply-To: <20260120204303.3229303-1-joelagnelf@nvidia.com>
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
	FREEMAIL_CC(0.00)[vger.kernel.org,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,lwn.net,amd.com,intel.com,ursulin.net,gmx.de,google.com,garyguo.net,protonmail.com,umich.edu,nvidia.com,weathered-steel.dev,collabora.com,joelfernandes.org,lists.freedesktop.org];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_GT_50(0.00)[51];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 6CB73A096E
X-Rspamd-Action: no action

On Tue Jan 20, 2026 at 9:42 PM CET, Joel Fernandes wrote:
> This series is rebased on drm-rust-kernel/drm-rust-next and provides memo=
ry
> management infrastructure for the nova-core GPU driver. It combines sever=
al
> previous series and provides a foundation for nova GPU memory management
> including page tables, virtual memory management, and BAR mapping. All th=
ese
> are critical nova-core features.

Thanks for this work, I will go through the series soon. (Although it would=
 also
be nice to have what I mention below addressed first.)

> The series includes:
> - A Rust module (CList) to interface with C circular linked lists, requir=
ed
>   for iterating over buddy allocator blocks.
> - Movement of the DRM buddy allocator up to drivers/gpu/ level, renamed t=
o GPU buddy.
> - Rust bindings for the GPU buddy allocator.
> - PRAMIN aperture support for direct VRAM access.
> - Page table types for MMU v2 and v3 formats.
> - Virtual Memory Manager (VMM) for GPU virtual address space management.
> - BAR1 user interface for mapping access GPU via virtual memory.
> - Selftests for PRAMIN and BAR1 user interface (disabled by default).
>
> Changes from v5 to v6:
> - Rebased on drm-rust-kernel/drm-rust-next
> - Added page table types and page table walker infrastructure
> - Added Virtual Memory Manager (VMM)
> - Added BAR1 user interface
> - Added TLB flush support
> - Added GpuMm memory manager
> - Extended to 26 patches from 6 (full mm infrastructure now included)
>
> The git tree with all patches can be found at:
> git://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git (tag: nova-=
mm-v6-20260120)
>
> Link to v5: https://lore.kernel.org/all/20251219203805.1246586-1-joelagne=
lf@nvidia.com/
>
> Previous series that are combined:
> - v4 (clist + buddy): https://lore.kernel.org/all/20251204215129.2357292-=
1-joelagnelf@nvidia.com/
> - v3 (clist only): https://lore.kernel.org/all/20251129213056.4021375-1-j=
oelagnelf@nvidia.com/
> - v2 (clist only): https://lore.kernel.org/all/20251111171315.2196103-4-j=
oelagnelf@nvidia.com/
> - clist RFC (original with buddy): https://lore.kernel.org/all/2025103019=
0613.1224287-1-joelagnelf@nvidia.com/
> - DRM buddy move: https://lore.kernel.org/all/20251124234432.1988476-1-jo=
elagnelf@nvidia.com/
> - PRAMIN series: https://lore.kernel.org/all/20251020185539.49986-1-joela=
gnelf@nvidia.com/

I'm not overly happy with this version history. I understand that you are
building things on top of each other, but going back and forth with adding =
and
removing features from a series is confusing and makes it hard to keep trac=
k of
things.

(In the worst case it may even result in reviewers skipping over it leaving=
 you
with no progress eventually.)

I.e. you stared with a CList and DRM buddy RFC, then DRM buddy disappeared =
for a
few versions and came back eventually. Then, in the next version, the PRAMI=
N
stuff came back in, which also had a predecessor series already and now you
added lots of MM stuff on top of it.

The whole version history is about what features and patches were added and
removed to/from the series, rather than about what actually changed design =
wise
and code wise between the iterations (which is the important part for revie=
wers
and maintainers).

I also think it is confusing that a lot of the patches in this series have =
never
been posted before, yet they are labeled as v6 of this RFC.

Hence, please separate the features from each other in separate patch serie=
s,
with their own proper version history and changelog. In order to account fo=
r the
dependencies, you can just mention them in the cover letter and add a link =
to
the other related patch series, which should be sufficient for people inter=
ested
in the full picture.

I think the most clean approach would probably be a split with CList, DRM b=
uddy
and Nova MM stuff.

And just to clarify, in the end I do not care too much about whether it's a=
ll in
a single series or split up, but going back and forth with combining things=
 that
once have been separate and have a separate history doesn't work out well.
