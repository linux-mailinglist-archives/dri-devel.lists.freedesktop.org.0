Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4AhxCnaHfGmbNgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 11:27:02 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 877BDB9560
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 11:27:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7825A10E985;
	Fri, 30 Jan 2026 10:26:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="JBFBwCwo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6945B10E1A0
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 10:26:57 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-4359a302794so1365638f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 02:26:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769768816; cv=none;
 d=google.com; s=arc-20240605;
 b=HyRlDI8eVZINZA/UCDu5oe52emw6H6z11G5KeuKOcIFihFsHn+A9UFCOGkb5Mh3TnO
 UF+hgG4CITZzX3EM1xcPLD4yCCVO7zN+KKAMVEw17OphpjXdDjkUyEMjs7geYJId8IaE
 1pCz+eKsEWl7d/hn8lK3i0F1fnldizxtGykF+d0zrcAfGeAPAtJq1HHGUEFHkWeWS/ys
 m1EEOVrLlJSdXZOLpWpep5L6RFJ6iey9q4wHzfBdswcySVLJL9suq1gsQzOEaqVRW7XL
 mlYdQrAePgyd6+o+i33DvSjojmdZJ0E3//5C2mz3SZUib+2ccfRjK2NveFIXPW7diZBk
 gZ6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=qKGf5ayE/1fi3WtglGaStB/NskmIOWGBfGvj57gDQYY=;
 fh=IBJexb1D7h300x2PLh188OfI0kDWocwcEditYVIjKfs=;
 b=XyglOKhJuEocKDbN7ZrIH6DAOmlkN0k5WJsGxI1D732keWEBsqT5VGs9xZrQhuMqia
 KcSiZxdy68BajIhU5FgspsNoBf6VMGC6C4CnNyu16E8t09aKd/uTjWCbA7Lbk5/hJrj8
 0LiBgIM0OCC70yId8H6gQO9YBOCaVQwjnBpyCeuAKZD3rmf9QQPNaYo9dzXkiT0yInhw
 YWrMPXECMxXcpA0LVDJyfX4gw5PTAMGiieL8+pq0T3OneQi3b0A6P18E07mSwDpBvlsR
 QxgJW1nOuI8LHwIj0FfMH7KZFRoMTd3ZKfJbvRTFmqEw+ZAABb48WET0Xgn2e0YEzlR4
 tJdw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1769768816; x=1770373616;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qKGf5ayE/1fi3WtglGaStB/NskmIOWGBfGvj57gDQYY=;
 b=JBFBwCwoSkbW44P4vncIjZO9PvWgonRi3cQ6qZ5wjikqD8m0wb3zkur2FvPr8Ray24
 SifpHrfS0b3+dZ1LLTTKhCAJwYOBQG7wIYP1gVE7Y2rjZvVantuEHNbCPThFwlLgU/7b
 st83OMHDVrM8RJZDsYzLZxsM9aU42mY9hQPkxaQp/jM0ORp1rVgcuCnBZArdqhnPfsai
 4q9iArC/5pUeoRviYbJyjp2ZZxTh/lc03ZjXr4LJkwFcqk9oM8AbPGWS92nRo+pPi1ci
 VhdasCWynfIhv0u6nO1UrPFwqVkJRwVEh/PRAQxP8CrLvannxYupDBsiL1E4HIyoDntZ
 bZPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769768816; x=1770373616;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=qKGf5ayE/1fi3WtglGaStB/NskmIOWGBfGvj57gDQYY=;
 b=nYx7s+IzXO+TT4FgQ/WpXj31YwyUX9SWorXlxeGBaVjaQ8BlLc7xY1ixTwgxjVomKu
 M7YPP7UBJzZ9NUM75UpCrSTmw494QhRlItwnj9dNOgNnsQ14uQ2cfhzZ6cJgWV2oK0xK
 ygw/DdpsJ/fqjEONLZ9vGJETZxa28IG1YCBqqxDTUZijVPky7EPevJ1M6qbMODOeDsKd
 Yee4Rk4yNDDKXvzuBwtMe6Y15GxRwCadSXv0wvLPN5ee8VnTUFe8xNr7cQxdS75qQ+9x
 xOLMvBO7laGp06rV/3UIX+m/8JbaejX9D4rVCaQibaF8aUgXodoB0ZwGQuH0p8vVRH1m
 MlQg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8fhDx40s32+DOYbi4C99c2sP8437oNKJmLRUxfP9HGkm1XTe1QSj9BwA0mmbCTQBx3fSFRtcq40A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwQx+6RGb9YdIPiulhy4Yloih4G3qiefP6GpzPex/IhtEE8Daat
 BMSjpxdNgELe1xfen3AqnvwXNptNIkEr/LAK/9HQ+vSVomDR5yUcYWK5WzEjK0AGByXwg7X8Iu6
 hUAwOPSQrVhA39LObquUTwuJtu5rGq8rv8b462N8R
X-Gm-Gg: AZuq6aKl5Zu04YVlGwHY629bS6oMvK0Yqusvw/8h7HrKiRNe7TDpnvCwjXkuY+dyNPR
 GIZ9bew0j/WRu6Yg/+N64M70KJfJq0XxUbPDkkYtT5NKf1YWfZ9uHjZWr0zvNHsKMn094XqdmnQ
 IB2mM+LrQLn7tqak3lGbYEeit6V1sAYu1hic643szAh2A4LLyO3YHuWumdhUYJrwZnuJxbXPtcQ
 +2Qej2d9bmdCcKYlLwHd1Kvce5zHg4zbLkjRupw2EtJtLpslPESUd0V3bbpgXZbdCJ8Buda6Glq
 /rEH8QygdeEA7qzMa7QpAEq6ow==
X-Received: by 2002:a05:6000:144a:b0:432:8504:a383 with SMTP id
 ffacd0b85a97d-435f3ab53cfmr3434365f8f.45.1769768815664; Fri, 30 Jan 2026
 02:26:55 -0800 (PST)
MIME-Version: 1.0
References: <20260130-coherent-array-v1-0-bcd672dacc70@nvidia.com>
 <20260130-coherent-array-v1-6-bcd672dacc70@nvidia.com>
In-Reply-To: <20260130-coherent-array-v1-6-bcd672dacc70@nvidia.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 30 Jan 2026 11:26:44 +0100
X-Gm-Features: AZwV_QjIZnbbm9xp8XOB5ABAESxw5YmRd900W4CPJMrijbzi9HEw_BSq-MEG1sk
Message-ID: <CAH5fLggBd6s5MooGPfUaoarNF651BjTyBt+KcuJc0zdx5xg7cg@mail.gmail.com>
Subject: Re: [PATCH 6/9] rust: dma: add dma_read! and dma_write! macros
To: Eliot Courtney <ecourtney@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Abdiel Janulgue <abdiel.janulgue@gmail.com>,
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Robin Murphy <robin.murphy@arm.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org
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
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:ecourtney@nvidia.com,m:dakr@kernel.org,m:acourbot@nvidia.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:abdiel.janulgue@gmail.com,m:daniel.almeida@collabora.com,m:robin.murphy@arm.com,m:a.hindborg@kernel.org,m:ojeda@kernel.org,m:boqun.feng@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:tmgross@umich.edu,m:nouveau@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:driver-core@lists.linux.dev,m:rust-for-linux@vger.kernel.org,m:abdieljanulgue@gmail.com,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	SUBJECT_HAS_EXCLAIM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[aliceryhl@google.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aliceryhl@google.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[kernel.org,nvidia.com,gmail.com,ffwll.ch,collabora.com,arm.com,garyguo.net,protonmail.com,umich.edu,lists.freedesktop.org,vger.kernel.org,lists.linux.dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,nvidia.com:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 877BDB9560
X-Rspamd-Action: no action

On Fri, Jan 30, 2026 at 9:35=E2=80=AFAM Eliot Courtney <ecourtney@nvidia.co=
m> wrote:
>
> Add dma_read! and dma_write! macros using the new infallible methods
> on CoherentArray.
>
> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
> ---
>  rust/kernel/dma.rs | 103 +++++++++++++++++++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 103 insertions(+)
>
> diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
> index e4bca7a18ac1..f3920f74583a 100644
> --- a/rust/kernel/dma.rs
> +++ b/rust/kernel/dma.rs
> @@ -811,6 +811,24 @@ pub unsafe fn as_slice_mut<const OFFSET: usize, cons=
t COUNT: usize>(&mut self) -
>              )
>          };
>      }
> +
> +    /// Returns a pointer to an element from the region with bounds chec=
king. `OFFSET` is in
> +    /// units of `T`, not the number of bytes.
> +    ///
> +    /// Public but hidden since it should only be used from [`dma_read`]=
 and [`dma_write`] macros.
> +    #[doc(hidden)]
> +    pub fn ptr_at<const OFFSET: usize>(&self) -> *mut T {
> +        build_assert!(
> +            OFFSET < N,
> +            "Index out of bounds when accessing CoherentArray"
> +        );

This build assert does not depend on runtime values, so it can be
written as a const block:
const { assert!(OFFSET < N, "Index out of bounds when accessing
CoherentArray"); }

Alice
