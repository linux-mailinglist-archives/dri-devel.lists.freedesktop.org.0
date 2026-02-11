Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AJqjJiJKjGmukgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 10:21:38 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D065122A94
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 10:21:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A272F10E329;
	Wed, 11 Feb 2026 09:21:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WvQ3ewTX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96E5310E2C4;
 Wed, 11 Feb 2026 09:21:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id F00EB600CB;
 Wed, 11 Feb 2026 09:21:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2F38C4CEF7;
 Wed, 11 Feb 2026 09:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1770801694;
 bh=bbT8L9yuhCkcKZIt2AwaX5L7rkxzlrBrldrxjRCY6Qc=;
 h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
 b=WvQ3ewTXZ2lQSqYQAAxvDxZIXx23sQMjCI9kZmySTxXf08I7vSWq2wMpO6JUEUGPl
 84R832HYeYTEN0Sk2sDTMYgyZkGhgpKuuL7Gt2uee/ViV4W3er/rKoAd6jcx/tqQ19
 OiCiuHd9MlBlEh9GPY3AlGmbqCZfyIWufwYIkkLGn7LojPEaoyHXlkqjdE3pLOOABq
 cEOz7Oqh37c+3cpcftV6Nhv8NFmzgTs1tkvuXcpbqOFtPCbG7YslH9I9XRCg0Rs5Bs
 AN7w3KKk1aPoNzeTaCrUukzHvsI39VzMEwYkAqejXLvG4xov+ipmcO0xKsgvmnwAFG
 aTpMU/ppeRiXA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Feb 2026 10:21:23 +0100
Message-Id: <DGC0T35RJU05.2TLS17F5B30B3@kernel.org>
Cc: <linux-kernel@vger.kernel.org>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Simona Vetter" <simona@ffwll.ch>, "Jonathan Corbet" <corbet@lwn.net>,
 "Alex Deucher" <alexander.deucher@amd.com>,
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
 Gross" <tmgross@umich.edu>, "Alistair Popple" <apopple@nvidia.com>,
 "Alexandre Courbot" <acourbot@nvidia.com>, "Andrea Righi"
 <arighi@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "Philipp Stanner"
 <phasta@kernel.org>, "Elle Rhumsaa" <elle@weathered-steel.dev>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "David Airlie"
 <airlied@gmail.com>, "Edwin Peer" <epeer@nvidia.com>, "John Hubbard"
 <jhubbard@nvidia.com>, "Andy Ritger" <aritger@nvidia.com>, "Balbir Singh"
 <balbirs@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 <joel@joelfernandes.org>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <linux-fbdev@vger.kernel.org>
To: "Joel Fernandes" <joelagnelf@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH -next v9 3/3] nova-core: mm: Select GPU_BUDDY for VRAM
 allocation
References: <20260210233204.790524-1-joelagnelf@nvidia.com>
 <20260210233204.790524-4-joelagnelf@nvidia.com>
In-Reply-To: <20260210233204.790524-4-joelagnelf@nvidia.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,linux.intel.com,kernel.org,ffwll.ch,lwn.net,amd.com,intel.com,ursulin.net,gmx.de,google.com,gmail.com,garyguo.net,protonmail.com,umich.edu,nvidia.com,weathered-steel.dev,collabora.com,joelfernandes.org,lists.freedesktop.org];
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
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[49];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 6D065122A94
X-Rspamd-Action: no action

On Wed Feb 11, 2026 at 12:32 AM CET, Joel Fernandes wrote:
> nova-core will use the GPU buddy allocator for physical VRAM management.
> Enable it in Kconfig.
>
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> ---
>  drivers/gpu/nova-core/Kconfig | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/nova-core/Kconfig b/drivers/gpu/nova-core/Kconfi=
g
> index 527920f9c4d3..6513007bf66f 100644
> --- a/drivers/gpu/nova-core/Kconfig
> +++ b/drivers/gpu/nova-core/Kconfig
> @@ -3,8 +3,9 @@ config NOVA_CORE
>  	depends on 64BIT
>  	depends on PCI
>  	depends on RUST
> -	select RUST_FW_LOADER_ABSTRACTIONS

I think moving this should be a separate patch.

>  	select AUXILIARY_BUS
> +	select GPU_BUDDY
> +	select RUST_FW_LOADER_ABSTRACTIONS
>  	default n
>  	help
>  	  Choose this if you want to build the Nova Core driver for Nvidia
> --=20
> 2.34.1

