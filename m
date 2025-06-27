Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDAA1AEB699
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jun 2025 13:37:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2253510E02B;
	Fri, 27 Jun 2025 11:37:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="2UF0Jh7r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5E8810E9E5
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 11:37:08 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-3a4e742dc97so2061907f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 04:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1751024227; x=1751629027;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bomnLwHZuA9rg+cFy8tAC4Q2mTuNozVG1EqvGvsyDqs=;
 b=2UF0Jh7rKsWYojudSNJ5631F+OA/pAu8NxH4M0ptxdB3AybK9S5qUnj4os8bNLjUSF
 vwBh9fk2L+UhYnMrfK72R9FuvzP3iqY5dHEh3SAX16i7tRHkep2z+iYzrtuXBvCynHIu
 SnQhLxSMaM7xnWS129hZB4KVLzzKtitliXp+4QxMAHvQyxmbdA+0Y0Sgoct9UTaRG2L1
 KQ0vazA1l8sdFOrCZUpLJiiprPEkSSN/Zpv8YvKyZSnYZzVHSteE4e4FhVbORXp4c+5D
 E4oM2Hm5mMGoY6yBT8nVZQ1Eo2JR7QkBQX8rG/s3zud3a7iI315EJlqFTt6VsdFTJJUV
 UV0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751024227; x=1751629027;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bomnLwHZuA9rg+cFy8tAC4Q2mTuNozVG1EqvGvsyDqs=;
 b=FHx/0GL09mS28ba//m5JrSKsu6CKoiRgJ1R5+5HoeK032unN2q/ksZaXHlCKl1zyyE
 6jp5ErC1+cydnDzEVMnZ4KAWlNRzfXJRnL0eqIvPkSoItD2gX0aIlOU6yjyA2WNeAVa+
 nUyi3aPqM7Kzu0sfRqHX61EV+Qkde7ynI9Bt70n8VQ2M1Y6K1fC+TnGwGw38uKb1ciZB
 Jj/efF4Z4iYOrp4gPFkmO6wlBfASZblOeH3Iw3hvRpTSNlEMsG87qhpg1dhh60w3AIWH
 jR++bWzFkpUqFASBBcfrB5zgJ4j6/FhauNl+igfJD+aw3WlbNlwCP1/+QIBNNUrbGfwM
 5x7Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUxBigJoAmBnm2pJwdVp7Fr+Bizj7JN8DQGC/8TfSQwlSlzacSPYc2K3ge35hHmALtxT6tkysMTeII=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyZWyDddJX3aXpbMOb6Q0rp0ibh1qk9Ra6jZ5eHsy62St9Wk8+5
 sw+vInD2nyI57niZMa+7I+Z5hsjgTtrIgDEDlltQ8bPem9v0MWnVYvr/jlEpJv437J75jmPzMlA
 rOZQzHh+21meMqM+GfgL5wKzkpEJPjZcm1OT42+qK
X-Gm-Gg: ASbGncvcPDhnc9h9HNqNkIReooSIbCUyQe8k3vvpFjCltp87ZOILGLlIYFQxXAmsPl+
 k2c9VVp8kro1X3Qm2kfCfDIDEdwzg3aYWSHRCgRO9pIeq0y/1gtxbTmendXImpq61GS2iL/Slph
 ctrbzSWVZESh0d7dn7vHWRgmEUnHEBQlC6VXXMwLSEHZhP
X-Google-Smtp-Source: AGHT+IHhQwveHXquBiq2OL5jFul3X4Iqrm3gaTcQksYUbptvQShoEH4ZnoLoGPXB5w2cgF2SU8OAzk3Y3AeFtNlDlKs=
X-Received: by 2002:adf:e18c:0:b0:3a6:d95e:f39d with SMTP id
 ffacd0b85a97d-3a97fcd2910mr2337836f8f.4.1751024226841; Fri, 27 Jun 2025
 04:37:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250627094102.770689-1-jfalempe@redhat.com>
In-Reply-To: <20250627094102.770689-1-jfalempe@redhat.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 27 Jun 2025 13:36:40 +0200
X-Gm-Features: Ac12FXzCmQBarxz6DrTB7aiRsIFjDy1zyR5MJjJQhJ3mD38Fryft7yJAf_t0jpw
Message-ID: <CAH5fLgimktQmU6d24o3QVDBX90OD5E4wdnvLoNhk_gtpbUhXMA@mail.gmail.com>
Subject: Re: [PATCH] drm/panic: Add a u64 divide by 10 for arm32
To: Jocelyn Falempe <jfalempe@redhat.com>
Cc: Andrei Lalaev <andrey.lalaev@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Christian Schrefl <chrisi.schrefl@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Russell King <linux@armlinux.org.uk>, Paolo Bonzini <pbonzini@redhat.com>, 
 rust-for-linux <rust-for-linux@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org
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

On Fri, Jun 27, 2025 at 11:41=E2=80=AFAM Jocelyn Falempe <jfalempe@redhat.c=
om> wrote:
>
> On 32bits ARM, u64 divided by a constant is not optimized to a
> multiply by inverse by the compiler [1].
> So do the multiply by inverse explicitly for this architecture.
>
> Link: https://github.com/llvm/llvm-project/issues/37280 [1]
> Reported-by: Andrei Lalaev <andrey.lalaev@gmail.com>
> Closes: https://lore.kernel.org/dri-devel/c0a2771c-f3f5-4d4c-aa82-d673b3c=
5cb46@gmail.com/
> Fixes: 675008f196ca ("drm/panic: Use a decimal fifo to avoid u64 by u64 d=
ivide")
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>

Not to block this change, but I think this really ought to be fixed in
the compiler. We should not have to do this kind of thing to divide by
10.

>  drivers/gpu/drm/drm_panic_qr.rs | 24 +++++++++++++++++++++++-
>  1 file changed, 23 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/drm_panic_qr.rs b/drivers/gpu/drm/drm_panic_=
qr.rs
> index dd55b1cb764d..82acecd505d3 100644
> --- a/drivers/gpu/drm/drm_panic_qr.rs
> +++ b/drivers/gpu/drm/drm_panic_qr.rs
> @@ -381,6 +381,24 @@ struct DecFifo {
>      len: usize,
>  }
>
> +/// On arm32 architecture, dividing an u64 by a constant will generate a=
 call
> +/// to __aeabi_uldivmod which is not present in the kernel.
> +/// So use the multiply by inverse method for this architecture.
> +#[cfg(target_arch =3D "arm")]
> +fn div10(val: u64) -> u64
> +{

Please run rustfmt on your patch.

> +    let val_h =3D val >> 32;
> +    let val_l =3D val & 0xFFFFFFFF;
> +    let b_h: u64 =3D 0x66666666;
> +    let b_l: u64 =3D 0x66666667;
> +
> +    let tmp1 =3D val_h * b_l + ((val_l * b_l) >> 32);
> +    let tmp2 =3D val_l * b_h + (tmp1 & 0xffffffff);
> +    let tmp3 =3D val_h * b_h + (tmp1 >> 32) + (tmp2 >> 32);
> +
> +    tmp3 >> 2
> +}
> +
>  impl DecFifo {
>      fn push(&mut self, data: u64, len: usize) {
>          let mut chunk =3D data;
> @@ -389,7 +407,11 @@ fn push(&mut self, data: u64, len: usize) {
>          }
>          for i in 0..len {
>              self.decimals[i] =3D (chunk % 10) as u8;
> -            chunk /=3D 10;
> +            if cfg!(target_arch =3D "arm") {
> +                chunk =3D div10(chunk);
> +            } else {
> +                chunk /=3D 10;
> +            }

I would get rid of this conditional and declare another div10 function
that just does input/10 on other arches.

Alice
