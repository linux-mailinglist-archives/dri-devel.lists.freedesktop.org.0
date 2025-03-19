Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27122A6953B
	for <lists+dri-devel@lfdr.de>; Wed, 19 Mar 2025 17:44:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E34E010E148;
	Wed, 19 Mar 2025 16:44:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="E/DGZCMj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AD9110E148;
 Wed, 19 Mar 2025 16:43:56 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id
 98e67ed59e1d1-2ff73032ac0so1094589a91.3; 
 Wed, 19 Mar 2025 09:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742402634; x=1743007434; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=G5BNJ4m+r3o40jW+KqQYzYpok7VJ6qTlzwR/jvK1izM=;
 b=E/DGZCMjG7nXcnDqaiCaWX3YTpdRN0Q1wBGJxgYL83Xuw3KyjS7Am333AuSBmdHr7Y
 m8aikXZpE76aaGRqYQLggbZgqNLluKIklPdRugcUAY5hNmtOzRnzuJJu95jI0+JEYAre
 vy09aGteMIyxrmnZc/Ra5wB/CGwyonptESsiz/l01lkndStnCPe967d9EIvRvN7Xcvhj
 9COeD0rMJCJHppm21NVtYIHcWil0j9rzjuWoGb1Jc/Sek24hdM8sdad7eeS0e+NndlYW
 LufCiraqaJPYY7f6SDZM9vobR8+oRLRHZR64lQAdznKnXTArtXP5KbrhMl2qgTupYWc/
 ur7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742402634; x=1743007434;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=G5BNJ4m+r3o40jW+KqQYzYpok7VJ6qTlzwR/jvK1izM=;
 b=GIO7UhBttzYkY/F9c5kESv7o30/yra89RzZ839o2T2253+s5qTMP7trv7LsAkhbO17
 E8uRFfC61+mpqrj5W4G+pOMwpkiwljVYuGSyeHEOaax2MHkQwBAcP62nK7wTNO2fP0hf
 AsNGXgE5DsR7iRG9oHt78S8Y2J16cz9MJ7vRR04bwi1GTrQ7TbhBoEyw0IxjqatmaFom
 7ClsDXGYNEyp4Ns2x6tJ5x2mJ8S9DJoInoJNcPNdFhMdeQjTES5Q1mniUkLwjOFQHnUe
 A6Ss1XPAkRd38jnkcN1xer8GjYvsL1bmP2JPDxH6nOKYyi1yafIgmycSdZ5Q0pDKApQI
 cOFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUysfNY5iDEwzPEBlaz9Z7JPVPdnLS9+UPC1Rvdf55WpT50bNk3XDDfr4RuwGNB9lh4FD4o6Ye0BG0=@lists.freedesktop.org,
 AJvYcCWxH0qpBm3Acv7CEQQRY7P33k05CRS3yNygpDbysuGBjBtz7ahpeDtBOYJDzXw2W9Vv34EU1hTQBQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy0yBPnlgpfq2xYs3C9Cuq7zSttaqjpRn5o+2jzbbjwDihEFMLw
 RcxF+zwJJWT30pKsUS+k5ODJWPewJ1UL28gcaXZzVQz1XRsMDao63Inwow0fqz47TwZ8RfT6eeO
 ZLtfKMPJLbCxLpx6HjEmR7coVAXo=
X-Gm-Gg: ASbGncvX9VF2lAWC28QMLVOTHBgw9E0eTQGxT1Iqp4Vr92A7xoI+9934vHu85t3ZFsG
 6wCnfRZmt1OTFNFHaqssUUCj0Qm/gNhyfNOgBrNsQvsJWdLgThTF6OuM+TeYlnSnGvOaDGDvATu
 YEMSk84RhSbe0+oicuKdcfGf/5oA==
X-Google-Smtp-Source: AGHT+IE6prSwtYU8jejOPsFrwL3RDnyz90ZHDcNbMw1dnn0qFUyiFfKtLcqRpq6p+gU5DbquskqSKPCLBmcBo6KTjo0=
X-Received: by 2002:a17:90b:1c08:b0:2fe:b972:a2c3 with SMTP id
 98e67ed59e1d1-301bfb7e9demr1882412a91.0.1742402633787; Wed, 19 Mar 2025
 09:43:53 -0700 (PDT)
MIME-Version: 1.0
References: <20250316111644.154602-1-andrewjballance@gmail.com>
 <20250316111644.154602-3-andrewjballance@gmail.com>
 <CAJ-ks9kAROOfyPtxMe6LE4-UPsvXca2sQ2VDjhRchZp3HLddGg@mail.gmail.com>
 <D8JTWL8JY7DM.3IVH6FZ4M49CB@proton.me>
 <CAJ-ks9k+A1+0CWXZmD2m0+jRqTRTNFn-=d9VXqytiOqvn4BR0w@mail.gmail.com>
 <D8KBFC9M74H5.4ZJ2SJK06SGR@proton.me>
 <CAJ-ks9=NQrz3ySacKt+XXm2vS+Fn9gjmtqAaaoz1k=iTG_1HXw@mail.gmail.com>
 <CANiq72mnT73Mb7RJhZjf4de=_Orv4pipunMhOersOj_aqrFA-g@mail.gmail.com>
 <CAJ-ks9=23qEqxT5rivsbfNYC6iUP4RXsKbcDU9XDx32ERnKbYg@mail.gmail.com>
In-Reply-To: <CAJ-ks9=23qEqxT5rivsbfNYC6iUP4RXsKbcDU9XDx32ERnKbYg@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 19 Mar 2025 17:43:40 +0100
X-Gm-Features: AQ5f1JoD8JRbysUimai1WtvAXi34kvhXnv2WVJ5eMVKyON4mEJVuBdVGab5J3Xw
Message-ID: <CANiq72kfgDVkKAeX1SiahEoo13+kHrcvVY3hMAfRPGjwErCt6A@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] rust: alloc: add Vec::resize method
To: Tamir Duberstein <tamird@gmail.com>
Cc: Benno Lossin <benno.lossin@proton.me>,
 Andrew Ballance <andrewjballance@gmail.com>, dakr@kernel.org, 
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, corbet@lwn.net, ojeda@kernel.org, 
 alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
 bjorn3_gh@protonmail.com, a.hindborg@kernel.org, aliceryhl@google.com, 
 tmgross@umich.edu, acourbot@nvidia.com, nouveau@lists.freedesktop.org, 
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

On Wed, Mar 19, 2025 at 5:13=E2=80=AFPM Tamir Duberstein <tamird@gmail.com>=
 wrote:
>
> No, I meant avoiding the check. The existing code already explicitly
> checks `new_len > self.len()` before evaluating `new_len -
> self.len()`. This means the check occurs twice. `checked_sub` reduces
> the number of checks by 1. Perhaps my wording could have been clearer
> ("avoid *an* underflow check").

Ah, you mean in the function you suggested, I see.

I think it they all may compile down to the same thing, whether
overflows checks are enabled or not, and whether the version in the
patch or `checked_sub` is used or not. At least in a quick Compiler
Explorer test it seems so, but I didn't check in an actual kernel
build.

The implicit check is gated behind the other one, so that one can be
removed, even if values are unknown -- we always have optimizations
enabled, even under "debug" builds (assuming "debug" means overflow
checking enabled).

Cheers,
Miguel
