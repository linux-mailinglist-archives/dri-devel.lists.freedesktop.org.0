Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +MYxMixTnWk2OgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 08:28:44 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE6D183073
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 08:28:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F2F010E4C7;
	Tue, 24 Feb 2026 07:28:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="BiP9EZDD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B51410E4C7
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 07:28:41 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-48371bb515eso64323155e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 23:28:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771918119; cv=none;
 d=google.com; s=arc-20240605;
 b=H8BQDDAp6iDhjOizId+QWxk4Jz7wiwmdCyMITsNgIBcqcZF0EyaJf/AKMB6POymng/
 EzjDaTU55azrV0kwBHsgI+AeuPeFiWfOKqb264OmCJlhNitJj4+78OXET2Mgc0CrPZYi
 bUx85WVBo28tm3WBvcAlqCOyt5hjuRMBPjVM7/9Hh/r0MTaN/+xN/NYz8RGnZzNtWTlC
 rPK+WiY5LcPkolw3uUJodKLRaTKkZyqBTPm1ye9aLbWiCHTQmzfFWrbZtdHOdImuPCPc
 UqDj2g0a5Mz1VfZdoPWJ1uap1XQO845j9SFZP+8Yt5deLX2Ei/swHPfoiFkcTt3PLRG0
 nXCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=ADQ2LS0GC1QDa36+EuaOS8kzbv7z7Bp7Bm4Gt5ISiek=;
 fh=JvpniaEtiKYMel2QJD1VmamviJxmLWcuPGVN5pMCzS0=;
 b=hdyKex7nKwMCNEvlt+R7H5nZ9jPbvFbEjE31AKjXtcTDzadm3+ZsJhj+MUxZkx2rIR
 OJDtKNg/ZTfcKK9nGa603iCty/TJtkghYFg2UnwhftLCQ+4VYCWid3zzHGrSQDCGB03H
 Yc8JbVpQ4JbUqNlEc4cEqwwbA83L6FzmnPQj+/Yyt0H8NNcCnA7K8yDOj+gAH5Xh9iVW
 ddGXA/ZCAMektkMMslRLuwPpAEGYtRSnZnL+DhJdZyrRP3w+hVv0iqi64s2SOtJAZr7h
 pT30Pig6zfwrKy/HI5XDZXbtoE/nnkoBYDogh55WCTxjNYtOsxNZyZA/Q0mYtw4QPdeS
 b8Jw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1771918119; x=1772522919;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ADQ2LS0GC1QDa36+EuaOS8kzbv7z7Bp7Bm4Gt5ISiek=;
 b=BiP9EZDDtcLpdRooNygHPLepMmIBRIcsNwnQhP6p2Y1TzWhehGC1K0ri47ycFCdKLo
 5bIyTNo4j8agl+YqC5Byg2ZtrdeqtOPozAjaEzpXRbMHvp6jjR51LRvfxJQLJDzbv5nD
 bslQgHOS2Yr+XyK+ZsXgSi7OzYpR62SeNOqzaqpdDWvtf7LaTLSZxT6JHoEYXZxx4OH5
 fV5414FkTmHr1Ba7mKYi1OgxWGGoK2lZTYfuoKHhLHYcTRdddLliIQc1lOjH3Waxxd4G
 DG5XmFJ1eIzC1Bct3Gr8sqcxNYFRBSGf/NTeGK+tc6pvnFqx1DDXPbTFPQ/pCm/vNKh7
 uf2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771918119; x=1772522919;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ADQ2LS0GC1QDa36+EuaOS8kzbv7z7Bp7Bm4Gt5ISiek=;
 b=SnHPRJZhIMkbvDoDMLAc0S3ayUdDsHgb/0B3LNiLsId5EK6aMtBfHL1Tb8B7zBvRBE
 qgum/U5+o2EuvnmlAQ1JTKbbu3hfvOSMslwhkd4tQnH5+qlij/vGyj2eMfuY9pZLTRQJ
 xnIMGF0b0T9mh5iLNoZLRueO/+Tmc9aN3jOcM6z2aF9KY+YlZr6rR85AWWBuiaNVV0yt
 I6eRnpoaPkaX7xirgUppXU1tGYzCWipPyVxFV7D5KXRMOzCB999yAxH645DNM1WtWljF
 Hbrdfm10XtOnUdf0FIZ0TdPL65j5SK8nCj8dAVASdDlVT+SXQAPHCKCYsVmgN0X9rh0r
 Iwow==
X-Forwarded-Encrypted: i=1;
 AJvYcCXtQcCcmBWZVT4P90NOVOx+lPa4iB7Q5OPDhvvN7Wr+bo8fSuSKJRPUs2VfTlPdFoH77dmokPjBY0E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz0lqwL8bezsLnUUM+bbXuzFJ2+X9lIc6UiNyd03AQRb/1ldOQ3
 VLsgRjCpcORjJ6OcJp9+maPyjnsUr1/Rs2XjwgzKRGqLM2poGsiXZ1691JfXbDzZqo+K44IYEBe
 OatZe7PmBNfqKLKiB99i7vYuvN8NyPFPA+CLB9yNK
X-Gm-Gg: AZuq6aL8LyL1pLF8xvMPHtdniJ2JzGesr+LcP6HEUI9SkeWAktXx5jBNQ3a/w461EHQ
 w8EGK975/ailD7p26INP7zlkBlAZ79AiVkFzTt8EGFSvDE1w9krqYRySJWYBnkTuaSt1CWxKjt3
 x0b4Smg8kEa1DFKfpsWILiAxrYB+NuFWGmWDgS3QoYpZj6dEl7wGrP2q6CPIk00Fg8QjE4g1HL3
 LHz/xJuhSzZ6HsZ6WMdLAMXZ0k2TCG306Vgda+fY/Dyp1va0oaZrFG1RCPdTyNyk6JK3uSuXFWe
 1NU3F+D0x7QPitxaiRk9zSLr2TH/+BSyqG02xA==
X-Received: by 2002:a05:600c:8109:b0:483:8e43:6dce with SMTP id
 5b1f17b1804b1-483a963a003mr172969955e9.29.1771918119178; Mon, 23 Feb 2026
 23:28:39 -0800 (PST)
MIME-Version: 1.0
References: <20260218205507.689429-1-joelagnelf@nvidia.com>
 <20260218205507.689429-6-joelagnelf@nvidia.com>
 <DGJN2M93S4ED.3272CCZWMRYOA@nvidia.com>
 <a7be758a-65ee-4572-b8ba-6d4a8d65af73@nvidia.com>
In-Reply-To: <a7be758a-65ee-4572-b8ba-6d4a8d65af73@nvidia.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 24 Feb 2026 08:28:27 +0100
X-Gm-Features: AaiRm50cmDpg-9YGkfyHUtxGyx8jesE30IQsaptAynPPK_BJKBTapWH8sOvIRP8
Message-ID: <CAH5fLgicH9u18pWYYkQqxZBT8WEig3bDP8JFT9VfDtG6McijQw@mail.gmail.com>
Subject: Re: [PATCH v10 5/8] rust: clist: Add support to interface with C
 linked lists
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: Eliot Courtney <ecourtney@nvidia.com>, linux-kernel@vger.kernel.org, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, Dave Airlie <airlied@redhat.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>,
 Koen Koning <koen.koning@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
 rust-for-linux@vger.kernel.org, Nikola Djukic <ndjukic@nvidia.com>, 
 dri-devel <dri-devel-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:joelagnelf@nvidia.com,m:ecourtney@nvidia.com,m:linux-kernel@vger.kernel.org,m:ojeda@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:tmgross@umich.edu,m:dakr@kernel.org,m:acourbot@nvidia.com,m:airlied@redhat.com,m:daniel.almeida@collabora.com,m:koen.koning@linux.intel.com,m:nouveau@lists.freedesktop.org,m:rust-for-linux@vger.kernel.org,m:ndjukic@nvidia.com,m:dri-devel-bounces@lists.freedesktop.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[aliceryhl@google.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[nvidia.com,vger.kernel.org,kernel.org,garyguo.net,protonmail.com,umich.edu,redhat.com,collabora.com,linux.intel.com,lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aliceryhl@google.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,nvidia.com:email]
X-Rspamd-Queue-Id: 3CE6D183073
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 2:13=E2=80=AFAM Joel Fernandes <joelagnelf@nvidia.c=
om> wrote:
>
> Hi Eliot,
>
> On 2/20/2026 3:16 AM, Eliot Courtney wrote:
> > On Thu Feb 19, 2026 at 5:55 AM JST, Joel Fernandes wrote:
> >> +/// Create a C doubly-circular linked list interface `CList` from a r=
aw `list_head` pointer.
> >> +///
> >> +/// This macro creates a `CList<T, OFFSET>` that can iterate over ite=
ms of type `$rust_type`
> >> +/// linked via the `$field` field in the underlying C struct `$c_type=
`.
> >> +///
> >> +/// # Arguments
> >> +///
> >> +/// - `$head`: Raw pointer to the sentinel `list_head` object (`*mut =
bindings::list_head`).
> >> +/// - `$rust_type`: Each item's rust wrapper type.
> >> +/// - `$c_type`: Each item's C struct type that contains the embedded=
 `list_head`.
> >> +/// - `$field`: The name of the `list_head` field within the C struct=
.
> >> +///
> >> +/// # Safety
> >> +///
> >> +/// This is an unsafe macro. The caller must ensure:
> >> +///
> >> +/// - `$head` is a valid, initialized sentinel `list_head` pointing t=
o a list that remains
> >> +///   unmodified for the lifetime of the rust `CList`.
> >> +/// - The list contains items of type `$c_type` linked via an embedde=
d `$field`.
> >> +/// - `$rust_type` is `#[repr(transparent)]` over `$c_type` or has co=
mpatible layout.
> >> +///
> >> +/// # Examples
> >> +///
> >> +/// Refer to the examples in this module's documentation.
> >> +#[macro_export]
> >> +macro_rules! clist_create {
> >> +    ($head:expr, $rust_type:ty, $c_type:ty, $($field:tt).+) =3D> {{
> >> +        // Compile-time check that field path is a list_head.
> >> +        let _: fn(*const $c_type) -> *const $crate::bindings::list_he=
ad =3D
> >> +            |p| &raw const (*p).$($field).+;
> >> +
> >> +        // Calculate offset and create `CList`.
> >> +        const OFFSET: usize =3D ::core::mem::offset_of!($c_type, $($f=
ield).+);
> >> +        $crate::ffi::clist::CList::<$rust_type, OFFSET>::from_raw($he=
ad)
> >> +    }};
> >> +}
> >
> > This uses offset_of! in a way that requires the offset_of_nested
> > feature, so it doesn't build in rust 1.78.0. The feature is already
> > added to rust_allowed_features, so I think it's ok to add
> > #![feature(offset_of_nested)].
>
> Maybe I am missing something, but why should the feature be gated behind
> that if all compiler versions (>=3D 1.78) support it either in a stable w=
ay
> or via an unstable feature flag?

The rust_allowed_features list only applies to drivers and such. It
doesn't apply to the Rust crates in the rust/ directory, which need to
use #![feature] annotations manually.

Alice
