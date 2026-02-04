Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CImkM7Mfg2nWhwMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 11:30:11 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3676EE481F
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 11:30:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 230B610E5B6;
	Wed,  4 Feb 2026 10:30:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="usDB/P+S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com
 [209.85.128.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0CAD10E5B6
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Feb 2026 10:30:07 +0000 (UTC)
Received: by mail-wm1-f74.google.com with SMTP id
 5b1f17b1804b1-4804157a3c9so76080485e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Feb 2026 02:30:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1770201006; x=1770805806;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=8XSWebpuCWegMlwjG4hS6R8tDkiXl6gBTB7fLfLRPN4=;
 b=usDB/P+SCheYuI4h6WvHAJX6qivnXnBGtBSc0U9+MV9oLuUWBPGozOOsl3PMP/9u0N
 sLLJ3Fkt3BWihFVCddurkIdzEzX6JviagKloJM6JSI/pmgwjkD+uZpH/Ck+0pBKUPEWx
 oXPq/TGckNeWK9BRJHJr9TZZORyJAs7gAy0QL/dgvdHXPWc3ZDayARDr0fvkrUeSkxLB
 J/LjSwik+BL0+UqGLwtzXLjjM7/Bg1/SdTe7bmTg7UhvjC7zVXMN0UPOoH5SUd8g7tOG
 2MmR2x6+nlWTQOCvCwWbVow65QiSKR62pki6Lj77G7FUY4P1hpioRSp8ubS+WBxpxk1g
 8qqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770201006; x=1770805806;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8XSWebpuCWegMlwjG4hS6R8tDkiXl6gBTB7fLfLRPN4=;
 b=Q3ckfbJdXxIxhVzN4rZUjhfKjVLVYtwzydyVL7XqbWWhhggQCGUxiE4HktAqOOyUIJ
 sUNAhoCzedBqDjCnRtSNFNVtqcdso38V9hDae7WZzEYPmAgmBo4/8ssleeBSVfrROKaR
 IIeDI3rYwnCZa+mwB73c+NLALjuT2aAyfu+rnKyT9vsqrfLXLV14Ell7PWPXkKMc/FfQ
 SjG/IVzlE7z8fk5qSmjxn6ed2N964J+8ZjmYH8R3qQ+Lhi7nuBKLkN1nHVGgO/M8Uq9n
 RwOCT+4+uzXmgKXh7rmVOieHve8Lkjbnwa2WbmeILsu7Inzs4SMuHg9vymukg7tPx/Vx
 H+jQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgrC8tURv55RG7U9FrrGr3SKIqhe18XEQal89qOtU0VzmvvQXwnBbDqubRXJou6OnufCPHqV7YPSU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx/oTDL6aXhaQVh07de97O1BdVF06r2nDGvwdJdISipTSi2HKou
 Ie/VTTimJEkFcFy6ZiVpZ+ZvyaGW2OIf3zme8T0u46OccPzKVVB+C5bknrhsO9n1Cv01GaqjrcJ
 e4Tn2WeNKYBu8XsR1jQ==
X-Received: from wmber8.prod.google.com ([2002:a05:600c:84c8:b0:47e:e4a5:c5f2])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1c02:b0:475:dd89:acb with SMTP id
 5b1f17b1804b1-4830e96fb19mr35946565e9.22.1770201006224; 
 Wed, 04 Feb 2026 02:30:06 -0800 (PST)
Date: Wed, 4 Feb 2026 10:30:05 +0000
In-Reply-To: <20260203081403.68733-3-phasta@kernel.org>
Mime-Version: 1.0
References: <20260203081403.68733-2-phasta@kernel.org>
 <20260203081403.68733-3-phasta@kernel.org>
Message-ID: <aYMfrT_Cv2NC-MB1@google.com>
Subject: Re: [RFC PATCH 1/4] rust: list: Add unsafe for container_of
From: Alice Ryhl <aliceryhl@google.com>
To: Philipp Stanner <phasta@kernel.org>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>,
 Benno Lossin <lossin@kernel.org>, 
 "Christian =?utf-8?B?S8O2bmln?=" <christian.koenig@amd.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 rust-for-linux@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:phasta@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:dakr@kernel.org,m:gary@garyguo.net,m:lossin@kernel.org,m:christian.koenig@amd.com,m:boris.brezillon@collabora.com,m:daniel.almeida@collabora.com,m:joelagnelf@nvidia.com,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[aliceryhl@google.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[gmail.com,ffwll.ch,kernel.org,garyguo.net,amd.com,collabora.com,nvidia.com,vger.kernel.org,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[aliceryhl@google.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 3676EE481F
X-Rspamd-Action: no action

On Tue, Feb 03, 2026 at 09:14:00AM +0100, Philipp Stanner wrote:
> impl_list_item_mod.rs calls container_of() without unsafe blocks at a
> couple of places. Since container_of() is an unsafe macro / function,
> the blocks are strictly necessary.
> 
> For unknown reasons, that problem was so far not visible and only gets
> visible once one utilizes the list implementation from within the core
> crate:
> 
> error[E0133]: call to unsafe function `core::ptr::mut_ptr::<impl *mut T>::byte_sub`
> is unsafe and requires unsafe block
>    --> rust/kernel/lib.rs:252:29
>     |
> 252 |           let container_ptr = field_ptr.byte_sub(offset).cast::<$Container>();
>     |                               ^^^^^^^^^^^^^^^^^^^^^^^^^^ call to unsafe function
>     |
>    ::: rust/kernel/drm/jq.rs:98:1
>     |
> 98  | / impl_list_item! {
> 99  | |     impl ListItem<0> for BasicItem { using ListLinks { self.links }; }
> 100 | | }
>     | |_- in this macro invocation
>     |
> note: an unsafe function restricts its caller, but its body is safe by default
>    --> rust/kernel/list/impl_list_item_mod.rs:216:13
>     |
> 216 |               unsafe fn view_value(me: *mut $crate::list::ListLinks<$num>) -> *const Self {
>     |               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>     |
>    ::: rust/kernel/drm/jq.rs:98:1
>     |
> 98  | / impl_list_item! {
> 99  | |     impl ListItem<0> for BasicItem { using ListLinks { self.links }; }
> 100 | | }
>     | |_- in this macro invocation
>     = note: requested on the command line with `-D unsafe-op-in-unsafe-fn`
>     = note: this error originates in the macro `$crate::container_of` which comes
>     from the expansion of the macro `impl_list_item`
> 
> Add unsafe blocks to container_of to fix the issue.
> 
> Cc: stable@vger.kernel.org # v6.17+
> Fixes: c77f85b347dd ("rust: list: remove OFFSET constants")
> Suggested-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Philipp Stanner <phasta@kernel.org>

With the reason that Gary shared added to the commit message:

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

> ---
>  rust/kernel/list/impl_list_item_mod.rs | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/rust/kernel/list/impl_list_item_mod.rs b/rust/kernel/list/impl_list_item_mod.rs
> index 202bc6f97c13..7052095efde5 100644
> --- a/rust/kernel/list/impl_list_item_mod.rs
> +++ b/rust/kernel/list/impl_list_item_mod.rs
> @@ -217,7 +217,7 @@ unsafe fn view_value(me: *mut $crate::list::ListLinks<$num>) -> *const Self {
>                  // SAFETY: `me` originates from the most recent call to `prepare_to_insert`, so it
>                  // points at the field `$field` in a value of type `Self`. Thus, reversing that
>                  // operation is still in-bounds of the allocation.
> -                $crate::container_of!(me, Self, $($field).*)
> +                unsafe { $crate::container_of!(me, Self, $($field).*) }
>              }
>  
>              // GUARANTEES:
> @@ -242,7 +242,7 @@ unsafe fn post_remove(me: *mut $crate::list::ListLinks<$num>) -> *const Self {
>                  // SAFETY: `me` originates from the most recent call to `prepare_to_insert`, so it
>                  // points at the field `$field` in a value of type `Self`. Thus, reversing that
>                  // operation is still in-bounds of the allocation.
> -                $crate::container_of!(me, Self, $($field).*)
> +                unsafe { $crate::container_of!(me, Self, $($field).*) }
>              }
>          }
>      )*};
> @@ -270,9 +270,9 @@ unsafe fn prepare_to_insert(me: *const Self) -> *mut $crate::list::ListLinks<$nu
>                  // SAFETY: The caller promises that `me` points at a valid value of type `Self`.
>                  let links_field = unsafe { <Self as $crate::list::ListItem<$num>>::view_links(me) };
>  
> -                let container = $crate::container_of!(
> +                let container = unsafe { $crate::container_of!(
>                      links_field, $crate::list::ListLinksSelfPtr<Self, $num>, inner
> -                );
> +                ) };

It may be cleaner to write this as:

let container = unsafe {
    $crate::container_of!(
        links_field, $crate::list::ListLinksSelfPtr<Self, $num>, inner
    )
};

Rustfmt has no effect on macro definitions, but if this was not a macro,
then I believe that rustfmt would format it like the above.

>  
>                  // SAFETY: By the same reasoning above, `links_field` is a valid pointer.
>                  let self_ptr = unsafe {
> @@ -319,9 +319,9 @@ unsafe fn view_links(me: *const Self) -> *mut $crate::list::ListLinks<$num> {
>              //   `ListArc` containing `Self` until the next call to `post_remove`. The value cannot
>              //   be destroyed while a `ListArc` reference exists.
>              unsafe fn view_value(links_field: *mut $crate::list::ListLinks<$num>) -> *const Self {
> -                let container = $crate::container_of!(
> +                let container = unsafe { $crate::container_of!(
>                      links_field, $crate::list::ListLinksSelfPtr<Self, $num>, inner
> -                );
> +                ) };

Ditto here.

Alice
