Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kG8iAWXHlGnCHgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 20:54:13 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B56A14FC61
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 20:54:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E968E10E2A3;
	Tue, 17 Feb 2026 19:54:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="BIuD1Xks";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF54210E2A3;
 Tue, 17 Feb 2026 19:54:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1771358042; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=IZkPQy0Wik5rusuc4aV5B+jj0MB29fyUbs7pP71qFNHoO0oyqwqttjDtQsNv3c93JLN+JtwIZOTlU0D/rurWQKAsjeFcaKYB4F1Uml9m5Tyxbhahe6cHFXvwjfi0FM/BY2eSJ53hrIYEmBCG6mDIsCj4tuJOrQhRZPNo8GsjNY8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1771358042;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=yNZugCRDEKYVk22Dh/+iA3R9vz8Imiqc3mNY11FG0x8=; 
 b=hM0+aQV0V1j77EEsy4U9UmNgGLxSQQYdTYEWKwaxiYjqCLbAyrMwjVe4+sXTlQRAd72kRslWM7wTw/7s7jXLJKhVWaqUUtVJlVH+NW2kflkWK5FgyPVp1GPRIRSc1+ZNWZwboyDXgg/4lyzwsHIIrtsA3ajZdyx//8E63Jv5X3A=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1771358042; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=yNZugCRDEKYVk22Dh/+iA3R9vz8Imiqc3mNY11FG0x8=;
 b=BIuD1XksshXGnfiD1sllUBw1cr1wQM6CmsE6FN5FeiPnZDqiy99OrdIh/7zMrAwY
 tb463WGExPPYsBoB4QlX8M3heTsHFYEDEzlZTYukbUu9s+/e1eALNbYyyMCzbkbH/e7
 jRx53bSfL7LuZC63Q7Bjz2GwqP3zabX5h8AoVFWY=
Received: by mx.zohomail.com with SMTPS id 1771358037932727.3027003579033;
 Tue, 17 Feb 2026 11:53:57 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v7 5/7] rust: drm: gem: Introduce shmem::SGTable
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20260206223431.693765-6-lyude@redhat.com>
Date: Tue, 17 Feb 2026 16:53:41 -0300
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>,
 nouveau@lists.freedesktop.org, Gary Guo <gary@garyguo.net>,
 Benno Lossin <lossin@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
 Janne Grunau <j@jannau.net>
Content-Transfer-Encoding: quoted-printable
Message-Id: <9442F3C0-AC21-4AC2-9D8A-352424144999@collabora.com>
References: <20260206223431.693765-1-lyude@redhat.com>
 <20260206223431.693765-6-lyude@redhat.com>
To: Lyude Paul <lyude@redhat.com>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External
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
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[collabora.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel.almeida@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[dri-devel];
	APPLE_MAILER_COMMON(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,collabora.com:mid,collabora.com:dkim,collabora.com:email]
X-Rspamd-Queue-Id: 8B56A14FC61
X-Rspamd-Action: no action



> On 6 Feb 2026, at 19:34, Lyude Paul <lyude@redhat.com> wrote:
>=20
> Currently we expose the ability to retrieve an SGTable for an shmem =
gem
> object using gem::shmem::Object::<T>::sg_table(). However, this only =
gives
> us a borrowed reference. This being said - retrieving an SGTable is a
> fallible operation, and as such it's reasonable that a driver may want =
to
> hold onto an SGTable for longer then a reference would allow in order =
to
> avoid having to deal with fallibility every time they want to access =
the
> SGTable. One such driver with this usecase is the Asahi driver.
>=20
> So to support this, let's introduce shmem::SGTable - which both holds =
a
> pointer to the SGTable and a reference to its respective GEM object in
> order to keep the GEM object alive for as long as the shmem::SGTable. =
The
> type can be used identically to a normal SGTable.
>=20
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Reviewed-by: Janne Grunau <j@jananu.net>
>=20
> ---
> V3:
> * Rename OwnedSGTable to shmem::SGTable. Since the current version of =
the
>  SGTable abstractions now has a `Owned` and `Borrowed` variant, I =
think
>  renaming this to shmem::SGTable makes things less confusing.
>  We do however, keep the name of owned_sg_table() as-is.
> V4:
> * Clarify safety comments for SGTable to explain why the object is
>  thread-safe.
> * Rename from SGTableRef to SGTable
>=20
> rust/kernel/drm/gem/shmem.rs | 50 ++++++++++++++++++++++++++++++++++++
> 1 file changed, 50 insertions(+)
>=20
> diff --git a/rust/kernel/drm/gem/shmem.rs =
b/rust/kernel/drm/gem/shmem.rs
> index d9f1a4e95cedc..e511a9b6710e0 100644
> --- a/rust/kernel/drm/gem/shmem.rs
> +++ b/rust/kernel/drm/gem/shmem.rs
> @@ -197,6 +197,25 @@ pub fn sg_table(&self) -> =
Result<&scatterlist::SGTable> {
>         // pointer to a scatterlist
>         Ok(unsafe { scatterlist::SGTable::from_raw(sgt) })
>     }
> +
> +    /// Creates (if necessary) and returns an owned reference to a =
scatter-gather table of DMA pages
> +    /// for this object.
> +    ///
> +    /// This is the same as [`sg_table`](Self::sg_table), except that =
it instead returns an
> +    /// [`shmem::SGTable`] which holds a reference to the associated =
gem object, instead of a
> +    /// reference to an [`scatterlist::SGTable`].
> +    ///
> +    /// This will pin the object in memory.
> +    ///
> +    /// [`shmem::SGTable`]: SGTable
> +    pub fn owned_sg_table(&self) -> Result<SGTable<T>> {
> +        Ok(SGTable {
> +            sgt: self.sg_table()?.into(),
> +            // INVARIANT: We take an owned refcount to `self` here, =
ensuring that `sgt` remains
> +            // valid for as long as this `SGTable`.
> +            _owner: self.into(),
> +        })
> +    }
> }
>=20
> impl<T: DriverObject> Deref for Object<T> {
> @@ -247,3 +266,34 @@ impl<T: DriverObject> driver::AllocImpl for =
Object<T> {
>         dumb_map_offset: None,
>     };
> }
> +
> +/// An owned reference to a scatter-gather table of DMA address spans =
for a GEM shmem object.
> +///
> +/// This object holds an owned reference to the underlying GEM shmem =
object, ensuring that the
> +/// [`scatterlist::SGTable`] referenced by this type remains valid =
for the lifetime of this object.
> +///
> +/// # Invariants
> +///
> +/// - `sgt` is kept alive by `_owner`, ensuring it remains valid for =
as long as `Self`.
> +/// - `sgt` corresponds to the owned object in `_owner`.
> +/// - This object is only exposed in situations where we know the =
underlying `SGTable` will not be
> +///   modified for the lifetime of this object. Thus, it is safe to =
send/access this type across
> +///   threads.
> +pub struct SGTable<T: DriverObject> {
> +    sgt: NonNull<scatterlist::SGTable>,
> +    _owner: ARef<Object<T>>,
> +}
> +
> +// SAFETY: This object is thread-safe via our type invariants.
> +unsafe impl<T: DriverObject> Send for SGTable<T> {}
> +// SAFETY: This object is thread-safe via our type invariants.
> +unsafe impl<T: DriverObject> Sync for SGTable<T> {}
> +
> +impl<T: DriverObject> Deref for SGTable<T> {
> +    type Target =3D scatterlist::SGTable;
> +
> +    fn deref(&self) -> &Self::Target {
> +        // SAFETY: Creating an immutable reference to this is safe =
via our type invariants.
> +        unsafe { self.sgt.as_ref() }
> +    }
> +}
> --=20
> 2.53.0
>=20

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>

