Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC80A67DD5
	for <lists+dri-devel@lfdr.de>; Tue, 18 Mar 2025 21:13:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2025A10E4CD;
	Tue, 18 Mar 2025 20:13:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ei3A1LxJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD2F010E4CD;
 Tue, 18 Mar 2025 20:13:31 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-30c0517142bso53686731fa.1; 
 Tue, 18 Mar 2025 13:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742328810; x=1742933610; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7EYuK/t2IJSGOT76QGj0LoVWETpAfuQmAmJNAdEEvyY=;
 b=ei3A1LxJFC/X8eR5IwqgSFc8AusF5ZCnZJvFv+uqZ5SfWObUAMvV2hY5W5QvXu9/7E
 +m4GZN3A9X4u6/1d4RAOZYOT/eaYbICPbqjTCzBtNpJedMafmFQCIWIchy8mFRmEjkVJ
 mESwTv3dgcZVuc0sq7BWFBhF2O9twSm8TW/Py8K3i+gyKQkUEqV4c1SRZbTBZ11ynIoG
 6Mzr3fJcgqkcNGzWJPpnuk65/etqfNGsZcBTL24WS+x+pQEDFisgNXUODGRMIMOq1Kz7
 3kU4HfJj4ZO4IknSVhAmar6CicRjSb+FAc0JbZK0PcQCBLf71Evw9Fnjxe9pWDyMvt1W
 glAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742328810; x=1742933610;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7EYuK/t2IJSGOT76QGj0LoVWETpAfuQmAmJNAdEEvyY=;
 b=duZ0lZtBV8LjxbyiXPVM0pv5JgwxwriytFt6herI7/0IfNvhzHmUz8SUvI48PHUo1g
 5vDCWaSBoyyM/cdd/BosNrbe6Uxmp/LAvKH7XWW8c2ddnYeLgFw1tkwEP+/CofVv2kSD
 DJIzwaf4Bfh/Oqhwm6ruPgM0y1aJzsxOehIOAcWPbW95WcajDEJpwnHuKcUKtylS7hU+
 MasAK0tjY/hYD52w/hXyqU3lI/uBGer4CPQPr0eNIFGDlkb79EDF+Im8LmszRDJ5RPaY
 6MKtyqnGnbV/sDzZLWyWvmjL6qZBFaK/ZB1Zm7dAkh2k5s+Fdp1MBR231fyN7P3lihDt
 NfFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVYMcz+qCkDUQN0doRZTbPx6soug4WorTnHgw1QkHacbevsUI91JD/Q6l/8b7rtUZnTsMI51jNkRg==@lists.freedesktop.org,
 AJvYcCVcOZ0d9t3dapV2YdG9lvV+XbdMXO4ZAnHrNSs10BJKwAxcQA2gjy+dKbQdlJtzPODKwuzksn84Stw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxlgZhzeJ7AR+LUM8jMX07e4Hv7c8u/ktQubfBzMu8l6uKMuoHT
 fcA6J3ihX58Ymil/7CrkJw1lzCfMfJuhMwQ8JciuE3U05DE/F4kDBpEtAhZ7bnc4OYLrfBdix/D
 ML+gIuFPhBDig80M+tNqBwVMBRxg=
X-Gm-Gg: ASbGncsghY40Pnud8aZ9hn4lLk316zCCyXrfF7CMI6umaWwZaMdsksIe4H9uK8CA8gZ
 PYfpw7m7vyUZtBlWtf1GbtgRkiSshbetOFjN0YCNzluuRzmVczz1MwLemvHpubYAl6edKHoHn7V
 Et4VKO6DJ43oqJKrSBSsAp2LYB6cgLDygjFzd3JvZIXw==
X-Google-Smtp-Source: AGHT+IE03XdTIPJlrlbTe4XTC7CjLxzzw2MmqZ7G1kRhG67FU/kpFzEBbds8p2MpkhI2rqH08hJOoadGnI+7Ukp7gec=
X-Received: by 2002:a05:651c:a0b:b0:30b:f52d:148f with SMTP id
 38308e7fff4ca-30d6a3e2be0mr420101fa.18.1742328809683; Tue, 18 Mar 2025
 13:13:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250316111644.154602-1-andrewjballance@gmail.com>
 <20250316111644.154602-3-andrewjballance@gmail.com>
In-Reply-To: <20250316111644.154602-3-andrewjballance@gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Tue, 18 Mar 2025 16:12:53 -0400
X-Gm-Features: AQ5f1JqGHb-xKycRwPr6BJPWKgZnlSyF596guWZP_moUzsbI0d82WEiS8RZpmM4
Message-ID: <CAJ-ks9kAROOfyPtxMe6LE4-UPsvXca2sQ2VDjhRchZp3HLddGg@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] rust: alloc: add Vec::resize method
To: Andrew Ballance <andrewjballance@gmail.com>
Cc: dakr@kernel.org, airlied@gmail.com, simona@ffwll.ch, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 corbet@lwn.net, ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, 
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me, 
 a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, 
 acourbot@nvidia.com, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
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

On Sun, Mar 16, 2025 at 7:17=E2=80=AFAM Andrew Ballance
<andrewjballance@gmail.com> wrote:
>
> implement the equivalent of the rust std's Vec::resize
> on the kernel's Vec type.
>
> Signed-off-by: Andrew Ballance <andrewjballance@gmail.com>
> ---
>  rust/kernel/alloc/kvec.rs | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>
> diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
> index 18bcc59f0b38..eb6d40a1bf8b 100644
> --- a/rust/kernel/alloc/kvec.rs
> +++ b/rust/kernel/alloc/kvec.rs
> @@ -554,6 +554,32 @@ pub fn from_elem(value: T, n: usize, flags: Flags) -=
> Result<Self, AllocError> {
>
>          Ok(v)
>      }
> +
> +    /// Resizes the [`Vec`] so that `len` is equal to `new_len`.
> +    ///
> +    /// If `new_len` is smaller than `len`, the `Vec` is [`Vec::truncate=
`]d.
> +    /// If `new_len` is larger, each new slot is filled with clones of `=
value`.
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// let mut v =3D kernel::kvec![1, 2, 3]?;
> +    /// v.resize(1, 42, GFP_KERNEL)?;
> +    /// assert_eq!(&v, &[1]);
> +    ///
> +    /// v.resize(3, 42, GFP_KERNEL)?;
> +    /// assert_eq!(&v, &[1, 42, 42]);
> +    ///
> +    /// # Ok::<(), Error>(())
> +    /// ```
> +    pub fn resize(&mut self, new_len: usize, value: T, flags: Flags) -> =
Result<(), AllocError> {
> +        if new_len > self.len() {
> +            self.extend_with(new_len - self.len(), value, flags)
> +        } else {
> +            self.truncate(new_len);
> +            Ok(())
> +        }
> +    }

You can avoid underflow checking in debug builds by using `checked_sub`:

        match new_len.checked_sub(self.len()) {
            Some(n) =3D> self.extend_with(n, value, flags),
            None =3D> {
                self.truncate(new_len);
                Ok(())
            }
        }

>  }
>
>  impl<T, A> Drop for Vec<T, A>
> --
> 2.48.1
>
>

Either way:

Reviewed-by: Tamir Duberstein <tamird@gmail.com>
