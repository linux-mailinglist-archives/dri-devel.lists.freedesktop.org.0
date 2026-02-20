Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EBsTEjQ8mGnbDgMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 11:49:24 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F28016701F
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 11:49:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9005110E0EE;
	Fri, 20 Feb 2026 10:49:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="NrzujvOS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CD8610E0EE
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Feb 2026 10:49:19 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-48371bb515eso25000255e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Feb 2026 02:49:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771584558; cv=none;
 d=google.com; s=arc-20240605;
 b=LLP2R2IKerwWhk4pSB302QrHHqvgt7ZIhWHC7rBcvDkw7lJrQcO8ObXnJ6J7rN1oP7
 pzvhdptHlJ71G7ZP3oC5wc8G7ZqdAI6xY3PXSDTtBNOIAUIbhVrhH6EYK8QmEL2E60iG
 7M4GGD2oaWuppEOiwH31woTTqDLyOG10OMTzr8ruWmJgNQyiEjoYXUXlm70PcxdcceiX
 sGL2STltdQigHfRyUULotO5919fuxdEKe4c+w2Kf6nN95T7k6eXnRBmVeZv5WYyvxx+q
 MZr4Xr1Pv8obQhBu7AKBm5fJaovcD+doVotndJ5v01brjG7ruklI0g0JSFSmLlIip8hS
 QncA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=Ab0aEJOyc1j8sAVck7x1NuXrJJFBzT+zHKOVXAo2rqQ=;
 fh=6Ms04hU5b7NoeDiyK2D5m589zX5Sast6o49Vp3hjmlA=;
 b=WkQ5BhBqraFq5KG8WvC/5eKbIHMfegYzyRaqW4egMZyVnedR7oB6J/DFuqCdooXKM7
 IDtmEHnZL/O8TNJjtGcD0fIBt7Xp9/aDepX0f6oBHPCpV3uxXmaqTGRusaqQvLY3O7/C
 AAo6O2kaZATP4yhyHlIoo5303QekVCN/QBkZXxVVSLrVkY5Ca7dqunFWiZhprxzapdu6
 PWUVlWnYwlM/kwyRIpyfHnFlhmf6YH9OcoyrREtIoOk+oC7yHuI2J/8M9GZIV+9to8r5
 VxrGUTorL1Q/il6EYAnowWXF4O5MBpD22eu1tSztAc8LEoH9nmIn/WLm0k7sgaieOYPB
 cqRA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1771584558; x=1772189358;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ab0aEJOyc1j8sAVck7x1NuXrJJFBzT+zHKOVXAo2rqQ=;
 b=NrzujvOSufGAOseN4UiuppGEQ6ZzdoknvBfmvpGPHH/Yb8r056i5vKF/1mufuDwdz6
 XmFrmgOwlhg4Vce6ytxMNLfzaIqsr4BGjruO57mFdXvsRNoyiMjgciURzXSobiY0xbGy
 S1hSK+9RmMsgifm93rWKVpbb8wfoy7RzLQDapNzni2pNt8TXeXjvlDMN9Q3BTFG+/a8I
 PTRdt7MxAAv4GT5zv88dhKim//oymgTPO3J/S9PLQ5D5e2ZeQdw+j/NNN8w9EAHi1z0A
 XM+vTOI4JCI56Xe9Fl3BGuhO/Rr1ZMYEu/GWhpxUK4zUQcXAdpOg0Bl91jjfDP+nb/KO
 Ttog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771584558; x=1772189358;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Ab0aEJOyc1j8sAVck7x1NuXrJJFBzT+zHKOVXAo2rqQ=;
 b=Gd+k1lDyDMOLA1plNVwlN+Fn3VqECSZpbRJ1ZH7sAPsOP1CNnNAg+vyxazVKBjia5V
 c2q2V5EwNIjXKX87QqZzLlNO2XJgrDKnGCkldB3mO8XCA3GOUoDDMKMJPrfVQePJMgSy
 KBxHrjQ7AAd1dvzi2TcoJCVUT10zsm3j7E6Noye5og1VnnJ0xN4NY7kPtW8ty3v5n+Kw
 qTmK9d93bF2wB4W9O4w7WIhnj0XpJW8HYAUbuVXvTmfhzBxLtwjpBEhWQgRWW54cpyy1
 Xf81K4cEDXKyUZrOHaykEm78cPn4hv2svA0qinrxcRvzZgMdPacGGKp3dcA7rce8Jahv
 eF1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBqrmDPt1Pxq+eW0e2RBOff9R5erh4Xu5YmpZdrGAgpDMrAUm41cwrSX/KYCDCxaJmSHaidPHhdbA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywmy2yAYBrCxBwtw/cWzL9CQhlBf7O6kJLiVrJPHAMDQKWBJZla
 hjDsMbBlfu9jKYgieKxjkL5Xh2e1cXQHaLgqpr3Vv733ciYm0RaKBo1tsRmCuOrwnvjnqDum7Yx
 5lu2yoUmGd5+TAhlbIdWJBHTNIQIz0A48CSr5mdkW
X-Gm-Gg: AZuq6aJX4sptDkOJ1jgwXSRFAmNPL857O1+ioOKCpHN3JsgNnjKYVYe5bT3xpq4OvKM
 GbbuIKozXU1DeR7/naFvCeqM0yPNcCQwOZM5XfHDOwo5ceL2SvYF7lLV3txC0AQVzaWGp9AwR3J
 nw7fcE3HFRJJplWUT+cIHyqnOLP+64QyYckVwB1exPzf2jbtvOoTAueo7YvwGFXMpaRVMNpHcY0
 qkmAKIz9/5FqbB0skOOX9cNCrDi6SzajCR4TAxvM+gXmZSKNzsVK5Lmjb5Y/w7WXrHkjaUPqI+K
 NxbAJGPHq+2mQCi6Af07flexg34jkiojpm95Og==
X-Received: by 2002:a05:600c:5289:b0:483:71f7:2782 with SMTP id
 5b1f17b1804b1-48398b0990dmr130223325e9.12.1771584557648; Fri, 20 Feb 2026
 02:49:17 -0800 (PST)
MIME-Version: 1.0
References: <20260220-unique-ref-v15-0-893ed86b06cc@kernel.org>
 <20260220-unique-ref-v15-9-893ed86b06cc@kernel.org>
In-Reply-To: <20260220-unique-ref-v15-9-893ed86b06cc@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 20 Feb 2026 11:49:06 +0100
X-Gm-Features: AaiRm51MAhLW1OtRkAHOYwRwshfGarw67yqaE2vYRvgLvB2RCqsl8u_ReojFPGo
Message-ID: <CAH5fLggNQD+TbA7rXVB5w+O+qHcJcYC4u0b3W+mHR2DZiUe4eQ@mail.gmail.com>
Subject: Re: [PATCH v15 9/9] rust: page: add `from_raw()`
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
 Leon Romanovsky <leon@kernel.org>, Paul Moore <paul@paul-moore.com>,
 Serge Hallyn <sergeh@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
 Igor Korotin <igor.korotin.linux@gmail.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Viresh Kumar <vireshk@kernel.org>,
 Nishanth Menon <nm@ti.com>, 
 Stephen Boyd <sboyd@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, linux-block@vger.kernel.org, 
 linux-security-module@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, linux-pm@vger.kernel.org, 
 linux-pci@vger.kernel.org
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:a.hindborg@kernel.org,m:ojeda@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:tmgross@umich.edu,m:dakr@kernel.org,m:gregkh@linuxfoundation.org,m:david.m.ertman@intel.com,m:ira.weiny@intel.com,m:leon@kernel.org,m:paul@paul-moore.com,m:sergeh@kernel.org,m:rafael@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:viro@zeniv.linux.org.uk,m:brauner@kernel.org,m:jack@suse.cz,m:igor.korotin.linux@gmail.com,m:daniel.almeida@collabora.com,m:lorenzo.stoakes@oracle.com,m:Liam.Howlett@oracle.com,m:vireshk@kernel.org,m:nm@ti.com,m:sboyd@kernel.org,m:bhelgaas@google.com,m:kwilczynski@kernel.org,m:boqun@kernel.org,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-block@vger.kernel.org,m:linux-security-module@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:linux-mm@kvack.org,m:linux-pm@vger.kernel.org,m:linux-pci@vger.kernel.org,m:igorkorotinlinux@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[aliceryhl@google.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[38];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aliceryhl@google.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,umich.edu,linuxfoundation.org,intel.com,paul-moore.com,gmail.com,ffwll.ch,zeniv.linux.org.uk,suse.cz,collabora.com,oracle.com,ti.com,google.com,vger.kernel.org,lists.freedesktop.org,kvack.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,samsung.com:email]
X-Rspamd-Queue-Id: 7F28016701F
X-Rspamd-Action: no action

On Fri, Feb 20, 2026 at 10:52=E2=80=AFAM Andreas Hindborg <a.hindborg@kerne=
l.org> wrote:
>
> Add a method to `Page` that allows construction of an instance from `stru=
ct
> page` pointer.
>
> Signed-off-by: Andreas Hindborg <a.hindborg@samsung.com>
> ---
>  rust/kernel/page.rs | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/rust/kernel/page.rs b/rust/kernel/page.rs
> index 4591b7b01c3d2..803f3e3d76b22 100644
> --- a/rust/kernel/page.rs
> +++ b/rust/kernel/page.rs
> @@ -191,6 +191,17 @@ pub fn nid(&self) -> i32 {
>          unsafe { bindings::page_to_nid(self.as_ptr()) }
>      }
>
> +    /// Create a `&Page` from a raw `struct page` pointer
> +    ///
> +    /// # Safety
> +    ///
> +    /// `ptr` must be valid for use as a reference for the duration of `=
'a`.
> +    pub unsafe fn from_raw<'a>(ptr: *const bindings::page) -> &'a Self {
> +        // SAFETY: By function safety requirements, ptr is not null and =
is
> +        // valid for use as a reference.
> +        unsafe { &*Opaque::cast_from(ptr).cast::<Self>() }

If you're going to do a pointer cast, then keep it simple and just do
&*ptr.cast().

Alice
