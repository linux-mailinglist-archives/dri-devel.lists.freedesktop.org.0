Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE8BCAA77C
	for <lists+dri-devel@lfdr.de>; Sat, 06 Dec 2025 14:51:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8439510E05B;
	Sat,  6 Dec 2025 13:51:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=jannau.net header.i=@jannau.net header.b="nEndZ23B";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="odThNdki";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 487 seconds by postgrey-1.36 at gabe;
 Sat, 06 Dec 2025 13:51:08 UTC
Received: from fout-b3-smtp.messagingengine.com
 (fout-b3-smtp.messagingengine.com [202.12.124.146])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6944A10E05B
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Dec 2025 13:51:08 +0000 (UTC)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
 by mailfout.stl.internal (Postfix) with ESMTP id 5AFF31D000B2;
 Sat,  6 Dec 2025 08:43:00 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-01.internal (MEProxy); Sat, 06 Dec 2025 08:43:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:subject
 :subject:to:to; s=fm3; t=1765028580; x=1765114980; bh=t4o08eCYHl
 EJY6FVGVNnMYAccSZ4Ut22BuwBX+NWmfA=; b=nEndZ23BKZ81fbvX8guKKtaYq0
 MN1GPl51//5L095iWH3zhIq65aKrcutyVQoJYBe4KYkJi6b7+WtEUNr6QfbhCrVx
 hvq3uwZpdjpz0fEHtDLNc0LxKeocblBreFJw8MWNM00gbk86CyX04V9Y0GWJx/WB
 nxvJH0WLLN2TrQ/anPAchR6f5KJR+L06hEesrB8kqRlWsKtM1oGKu8nhy9o9JU32
 ADjbFC0OpNtQGsdU9OJ0+j/u8ERdCj353nPUS/F+T9hgzCbvEMvglPx7MyKxe+wt
 YYRpWLJIl/cJwA5+vc07QwgS3JkVMl84vocCdbKla51aFivP2mkZwFDEEahg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1765028580; x=1765114980; bh=t4o08eCYHlEJY6FVGVNnMYAccSZ4Ut22Buw
 BX+NWmfA=; b=odThNdkidIdTuUAu/SA6FCQsysFAq8IUORAwGJvabMZ/RGqzeFi
 zyUfQs+hpYaaJjZQnEQvv8tHmRNFvxPlLeX622sbE6J4zeLIKLvY45VD7j55SJd/
 KWbxh7YhXv+jt8gYeXHQcsUGSSZ9DmjTtdqUAsl2SjiZcmTLW7SM29V/h1Gitj62
 dlZV20nq6tr5D56ev9L0m27VENAsQjZtHUqS9yhzJhJbtyfKp1UHLRCqmuMZNxwe
 fsLoo2iXb92byBYT60WaFv0Y6wmx4LFX//O1vvpr5vDDCeJQ5Mwe2m+oMSlObBmM
 Ujqi/riVA3JzyQb4ILxKBKPufgkQyKML9eA==
X-ME-Sender: <xms:4zI0abi6s9dIIQLYHHlxQYORgkLJ6bwOXzx17w7ZUKcr18z9VHPVxA>
 <xme:4zI0aZGHmOreMOwmlPMoEUamZf8IUjhgyWDYapxoqA7sUqfriT-LCWAfyd74DLc-1
 mI1Nvf6zg2G2uOGRft7kn9thucdpFbFDI7H0sO1PUZiEdNUx7L-V5g>
X-ME-Received: <xmr:4zI0aeDT8drWuSbEK5qSXG_OHoJDXAdghurPCAli4zJvG7KGeI4XEh_yJ2bdr5Rht7fMmO5UHQ4UNNonkMOqu-PbBnFikqIfFms>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduuddtkecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
 ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
 hrpeffhffvvefukfhfgggtuggjsehttdertddttdejnecuhfhrohhmpeflrghnnhgvucfi
 rhhunhgruhcuoehjsehjrghnnhgruhdrnhgvtheqnecuggftrfgrthhtvghrnhepgfdvff
 evleegudejfeefheehkeehleehfefgjefffeetudegtefhuedufeehfeetnecuvehluhhs
 thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhesjhgrnhhnrghurd
 hnvghtpdhnsggprhgtphhtthhopedviedpmhhouggvpehsmhhtphhouhhtpdhrtghpthht
 oheplhihuhguvgesrhgvughhrghtrdgtohhmpdhrtghpthhtohepughrihdquggvvhgvlh
 eslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdprhgtphhtthhopehruhhsthdq
 fhhorhdqlhhinhhugiesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopegrlh
 hitggvrhihhhhlsehgohhoghhlvgdrtghomhdprhgtphhtthhopegurghnihgvlhdrrghl
 mhgvihgurgestgholhhlrggsohhrrgdrtghomhdprhgtphhtthhopegurghkrheskhgvrh
 hnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgv
 rhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhgrsegrshgrhhhilhhinhgrrdhnvghtpd
 hrtghpthhtohepohhjvggurgeskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:4zI0aV-8rGL69jnGDjKnwKtYygMWhOARJD2aB_6XLENuZEhwAPehZQ>
 <xmx:4zI0aRhKrlxzRNFIl2g0wtE9aaaiUaeZEai3W55nCFyVKU1jMxJytQ>
 <xmx:4zI0aea0K5UKJEpvIYsxqgYXz74Ywl-0WeiCfl-FtEetqaMwA_MasQ>
 <xmx:4zI0aTQC7yp5KdqGYNXR-dDE7MiOrFkJ0cze8A0yrjRXajHWMgV3Xg>
 <xmx:5DI0aV-tlYWhqVuYKxAFDsB6tyTFw6bx4vaElocBckUxQE-NVYZVJwJD>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 6 Dec 2025 08:42:58 -0500 (EST)
Date: Sat, 6 Dec 2025 14:42:57 +0100
From: Janne Grunau <j@jannau.net>
To: Lyude Paul <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Alice Ryhl <aliceryhl@google.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org,
 Asahi Lina <lina@asahilina.net>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,	Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>,	Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Asahi Lina <lina+kernel@asahilina.net>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Tamir Duberstein <tamird@gmail.com>,
 FUJITA Tomonori <fujita.tomonori@gmail.com>,
 Krishna Ketan Rai <prafulrai522@gmail.com>, "open list:DMA BUFFER SHARING
 FRAMEWORK:Keyword:bdma_(?:buf|fence|resv)b" <linux-media@vger.kernel.org>,
 "moderated list:DMA BUFFER SHARING
 FRAMEWORK:Keyword:bdma_(?:buf|fence|resv)b"
 <linaro-mm-sig@lists.linaro.org>
Subject: Re: [PATCH v6 2/8] rust: helpers: Add bindings/wrappers for
 dma_resv_lock
Message-ID: <20251206134257.GA1097212@robin.jannau.net>
References: <20251202220924.520644-1-lyude@redhat.com>
 <20251202220924.520644-3-lyude@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251202220924.520644-3-lyude@redhat.com>
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

On Tue, Dec 02, 2025 at 05:03:28PM -0500, Lyude Paul wrote:
> From: Asahi Lina <lina@asahilina.net>
> 
> This is just for basic usage in the DRM shmem abstractions for implied
> locking, not intended as a full DMA Reservation abstraction yet.
> 
> Signed-off-by: Asahi Lina <lina@asahilina.net>
> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
>  rust/bindings/bindings_helper.h |  1 +
>  rust/helpers/dma-resv.c         | 13 +++++++++++++
>  rust/helpers/helpers.c          |  1 +
>  3 files changed, 15 insertions(+)
>  create mode 100644 rust/helpers/dma-resv.c
> 
> diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
> index 2e43c66635a2c..07f79e125c329 100644
> --- a/rust/bindings/bindings_helper.h
> +++ b/rust/bindings/bindings_helper.h
> @@ -48,6 +48,7 @@
>  #include <linux/cpumask.h>
>  #include <linux/cred.h>
>  #include <linux/debugfs.h>
> +#include <linux/dma-resv.h>
>  #include <linux/device/faux.h>
>  #include <linux/dma-direction.h>
>  #include <linux/dma-mapping.h>

nit: alphabetical order

> diff --git a/rust/helpers/dma-resv.c b/rust/helpers/dma-resv.c
> new file mode 100644
> index 0000000000000..05501cb814513
> --- /dev/null
> +++ b/rust/helpers/dma-resv.c
> @@ -0,0 +1,13 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/dma-resv.h>
> +
> +int rust_helper_dma_resv_lock(struct dma_resv *obj, struct ww_acquire_ctx *ctx)
> +{
> +	return dma_resv_lock(obj, ctx);
> +}
> +
> +void rust_helper_dma_resv_unlock(struct dma_resv *obj)
> +{
> +	dma_resv_unlock(obj);
> +}
> diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
> index 551da6c9b5064..36d40f911345c 100644
> --- a/rust/helpers/helpers.c
> +++ b/rust/helpers/helpers.c
> @@ -25,6 +25,7 @@
>  #include "cred.c"
>  #include "device.c"
>  #include "dma.c"
> +#include "dma-resv.c"
>  #include "drm.c"
>  #include "err.c"
>  #include "irq.c"

with that fixed

Reviewed-by: Janne Grunau <j@jananu.net>

Janne
