Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4LJVA193gGmo8gIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 11:07:27 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0344CA819
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 11:07:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08EB710E3EE;
	Mon,  2 Feb 2026 10:07:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HQK92qyI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 041E410E3EC
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Feb 2026 10:07:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id DCB5543634;
 Mon,  2 Feb 2026 10:07:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4150BC116C6;
 Mon,  2 Feb 2026 10:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1770026843;
 bh=SPlQg0EyU4/DCh7w2oS8RGOQsjsSnbyrEHo3KSL1y1g=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=HQK92qyIX300LRHc2aMK3ubwx7dgLYNuRzLyUUyPldXvf3QcHTBEDznZO9XmT4/xY
 CIU2+TouJ8b0UyXd4vzERXzW5Cf/dUF760N11p4gF3cvmqGdeP6kbv4bIv4CmGBiEz
 CDCnliVNe1XhjJ92SpkO91ctMJIVid5sN0XpQW6xEMqM9ZRi57oVT6jhJCBSG61PPe
 R4n80mZejwHKCRPr4cKNCtNbgTV/LVPVx//RFH3C/pvvRBkuacSHU2tA3lconM/VEr
 SyWvAEe6FO1M+FglA7GJxmfGwSWOjAC0xiQefn+pDeRSa4TkXkDF8gUy6JFDJawicR
 x2altsxN3dX5w==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Daniel Almeida <daniel.almeida@collabora.com>, Oliver Mangold
 <oliver.mangold@pm.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn?= Roy
 Baron <bjorn3_gh@protonmail.com>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Benno Lossin <lossin@kernel.org>, Danilo
 Krummrich <dakr@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Dave Ertman <david.m.ertman@intel.com>, Ira
 Weiny <ira.weiny@intel.com>, Leon Romanovsky <leon@kernel.org>, "Rafael J.
 Wysocki" <rafael@kernel.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Lorenzo
 Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Viresh Kumar <vireshk@kernel.org>, Nishanth
 Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, Bjorn Helgaas
 <bhelgaas@google.com>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?=
 <kwilczynski@kernel.org>, Paul
 Moore <paul@paul-moore.com>, Serge Hallyn <sergeh@kernel.org>, Asahi Lina
 <lina+kernel@asahilina.net>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fsdevel@vger.kernel.org,
 linux-mm@kvack.org, linux-pm@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-security-module@vger.kernel.org
Subject: Re: [PATCH v13 3/4] rust: Add missing SAFETY documentation for
 `ARef` example
In-Reply-To: <06C410F4-8534-43B4-8DE1-039F70B26E5A@collabora.com>
References: <20251117-unique-ref-v13-0-b5b243df1250@pm.me>
 <20251117-unique-ref-v13-3-b5b243df1250@pm.me>
 <06C410F4-8534-43B4-8DE1-039F70B26E5A@collabora.com>
Date: Mon, 02 Feb 2026 10:52:12 +0100
Message-ID: <87tsvzpj5f.fsf@t14s.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:daniel.almeida@collabora.com,m:oliver.mangold@pm.me,m:ojeda@kernel.org,m:alex.gaynor@gmail.com,m:boqun.feng@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:aliceryhl@google.com,m:tmgross@umich.edu,m:lossin@kernel.org,m:dakr@kernel.org,m:gregkh@linuxfoundation.org,m:david.m.ertman@intel.com,m:ira.weiny@intel.com,m:leon@kernel.org,m:rafael@kernel.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:viro@zeniv.linux.org.uk,m:brauner@kernel.org,m:jack@suse.cz,m:lorenzo.stoakes@oracle.com,m:Liam.Howlett@oracle.com,m:vireshk@kernel.org,m:nm@ti.com,m:sboyd@kernel.org,m:bhelgaas@google.com,m:kwilczynski@kernel.org,m:paul@paul-moore.com,m:sergeh@kernel.org,m:lina+kernel@asahilina.net,m:rust-for-linux@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-block@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:linux-mm@kvack.org,m:linux-pm@vger.kernel.org,m:linux-pci@vger.kernel.org,m:lin
 ux-security-module@vger.kernel.org,m:alexgaynor@gmail.com,m:boqunfeng@gmail.com,m:lina@asahilina.net,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[a.hindborg@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[43];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu,linuxfoundation.org,intel.com,linux.intel.com,suse.de,ffwll.ch,zeniv.linux.org.uk,suse.cz,oracle.com,ti.com,paul-moore.com,asahilina.net,vger.kernel.org,lists.freedesktop.org,kvack.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[a.hindborg@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel,kernel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pm.me:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,t14s.mail-host-address-is-not-set:mid]
X-Rspamd-Queue-Id: B0344CA819
X-Rspamd-Action: no action

Daniel Almeida <daniel.almeida@collabora.com> writes:

>> On 17 Nov 2025, at 07:08, Oliver Mangold <oliver.mangold@pm.me> wrote:
>>=20
>> SAFETY comment in rustdoc example was just 'TODO'. Fixed.
>>=20
>> Signed-off-by: Oliver Mangold <oliver.mangold@pm.me>
>> Co-developed-by: Andreas Hindborg <a.hindborg@kernel.org>
>> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
>> ---
>> rust/kernel/sync/aref.rs | 10 ++++++----
>> 1 file changed, 6 insertions(+), 4 deletions(-)
>>=20
>> diff --git a/rust/kernel/sync/aref.rs b/rust/kernel/sync/aref.rs
>> index 4226119d5ac9..937dcf6ed5de 100644
>> --- a/rust/kernel/sync/aref.rs
>> +++ b/rust/kernel/sync/aref.rs
>> @@ -129,12 +129,14 @@ pub unsafe fn from_raw(ptr: NonNull<T>) -> Self {
>>     /// # Examples
>>     ///
>>     /// ```
>> -    /// use core::ptr::NonNull;
>> -    /// use kernel::sync::aref::{ARef, RefCounted};
>> +    /// # use core::ptr::NonNull;
>> +    /// # use kernel::sync::aref::{ARef, RefCounted};
>>     ///
>>     /// struct Empty {}
>>     ///
>> -    /// # // SAFETY: TODO.
>> +    /// // SAFETY: The `RefCounted` implementation for `Empty` does not=
 count references and
>> +    /// // never frees the underlying object. Thus we can act as having=
 a refcount on the object
>
> nit: perhaps saying =E2=80=9Can increment on the refcount=E2=80=9D is cle=
arer?

OK


    /// // SAFETY: The `RefCounted` implementation for `Empty` does not cou=
nt references and never
    /// // frees the underlying object. Thus we can act as owning an increm=
ent on the refcount for
    /// // the object that we pass to the newly created `ARef`.

>
>> +    /// // that we pass to the newly created `ARef`.
>>     /// unsafe impl RefCounted for Empty {
>>     ///     fn inc_ref(&self) {}
>>     ///     unsafe fn dec_ref(_obj: NonNull<Self>) {}
>> @@ -142,7 +144,7 @@ pub unsafe fn from_raw(ptr: NonNull<T>) -> Self {
>>     ///
>>     /// let mut data =3D Empty {};
>>     /// let ptr =3D NonNull::<Empty>::new(&mut data).unwrap();
>> -    /// # // SAFETY: TODO.
>> +    /// // SAFETY: We keep `data` around longer than the `ARef`.
>>     /// let data_ref: ARef<Empty> =3D unsafe { ARef::from_raw(ptr) };
>>     /// let raw_ptr: NonNull<Empty> =3D ARef::into_raw(data_ref);
>>     ///
>>=20
>> --=20
>> 2.51.2
>>=20
>>=20
>>=20
>
> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>

Thanks.


Best regards,
Andreas Hindborg


