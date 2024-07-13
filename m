Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC2E930482
	for <lists+dri-devel@lfdr.de>; Sat, 13 Jul 2024 10:17:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43EFD10E100;
	Sat, 13 Jul 2024 08:17:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XbB7WHt8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFE0110E100
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Jul 2024 08:17:16 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id
 98e67ed59e1d1-2ca8dfa2cceso2025325a91.2
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Jul 2024 01:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720858636; x=1721463436; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vuTDpjOknZIP3OPJBIYnYVOkq2l4rHcKJCw+bFO9yU8=;
 b=XbB7WHt8x8P0ScjSZSAVz39OCqefdaLjTZ+0ZG3m424kBs+8r5YaCxnqqhT9x6UgXR
 mbZgY+i3QIwLX93xrS7UtonWyhLWVaS8dDuvKA4wsERa4G9pQzO+Pj3w9bbEqcAykTMo
 EPKnE0cIreQk2Rn7GUN9N0os0y2n+CV4UGqIiMN8sVgt+5nbkQLzZVGlbAH8ZA014Ic8
 7GLWpdy7yhW5kBmeJl8qznzPe0mW2pk0VziS8wuvgG3efVuxkANO56FpDOwcsUyaHYdm
 mflX43mNP9/1HhIai0URw/XybO3Jp+GCFQtrjmFgra29n4tgge2qfWDUANSoe0gcoNhh
 7bUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720858636; x=1721463436;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vuTDpjOknZIP3OPJBIYnYVOkq2l4rHcKJCw+bFO9yU8=;
 b=tYXNIVs1Yq4nu/O5N3N6+Iu1mWce+Nce5ikPG6SRPFjmUfvUTYkX08PK40Mn0Ra5D5
 7gP6ipnwrXlI85xPpQeN+8pLN53Xpmex+IZaZ57viofcTC3uzE/Uob1BEHOuKBLg0si5
 Hucli3+HmPRz4N180sXUgTDzI8X/zsmEh96g2dAQnPZ61cOAUH1aqHzk5x5g5qCVbMLD
 XAhuxDRIAE0FIi7fbAH067CvFhVpnSxxKef6bYvbGg6Uzbtx1TvD+sGkpxMhgyD9J6Do
 vZYJTJVZT7LeyFzjcEbzFtrN4XGQoFPBFoiyJu+omgoAEfVqjFoqyEfYm455PlzVknc4
 3ZKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTJi3m6AUEhmWMgFa+SPxt83dmMS044iKKTk+SYMjuOQBu7YsqqCnVo8rcf2/bcrF1XRH2TVCoPHxwfCEaovLzfT0JRMdIlBA9uwPMek4k
X-Gm-Message-State: AOJu0YwrtKKVzJZpHmoqfibsogYr+3Sg9XZHDBb6D6LLo3hNcJktgjiB
 ufZamyIz/pY2J44F1dU/J4lEa9CtR4zUZK70fvdkqA4nPif/EzSfPJ3XVrDMbNNl4cz31T75M0I
 V8GPSw6IEHyf+fdeuysXLHsF3Vww=
X-Google-Smtp-Source: AGHT+IG2cm8kzFCASH5FbYxr2z1a1YaZfkV2ynwONRqoxeKn7KGsSrpsEXY6g7FXnyh4IWb1I3jo/N2wLeVEGq+V/uU=
X-Received: by 2002:a17:90b:1c10:b0:2c7:b11b:e327 with SMTP id
 98e67ed59e1d1-2ca35d8606dmr10280290a91.44.1720858636218; Sat, 13 Jul 2024
 01:17:16 -0700 (PDT)
MIME-Version: 1.0
References: <20240710225011.275153-1-daniel.almeida@collabora.com>
 <fe84a028-01a8-4987-b1b7-141fb76d263c@arm.com>
 <4344B22F-D859-4C64-A351-69FFB5208362@collabora.com>
 <ZpFDeajsuVONbSYJ@cassiopeiae>
 <0A0C1EFC-29A1-4D73-8B02-CC1C693D6A7A@collabora.com>
 <ZpFMmAEdqo1dhj0s@cassiopeiae>
 <CAPM=9twNU3Wm02zCqzipSt4mDU3UUF5AyVycpBkPTGqv7fwPAQ@mail.gmail.com>
In-Reply-To: <CAPM=9twNU3Wm02zCqzipSt4mDU3UUF5AyVycpBkPTGqv7fwPAQ@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 13 Jul 2024 10:17:03 +0200
Message-ID: <CANiq72=J=RVRy+f8+B=Eb_J6sNBsGqvBT8-io-m+VqJNgZRnkw@mail.gmail.com>
Subject: Re: [RFC PATCH] drm: panthor: add dev_coredumpv support
To: Dave Airlie <airlied@gmail.com>
Cc: Danilo Krummrich <dakr@redhat.com>,
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Steven Price <steven.price@arm.com>, Wedson Almeida Filho <wedsonaf@gmail.com>,
 ojeda@kernel.org, 
 lyude@redhat.com, robh@kernel.org, lina@asahilina.net, mcanal@igalia.com, 
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

On Sat, Jul 13, 2024 at 2:48=E2=80=AFAM Dave Airlie <airlied@gmail.com> wro=
te:
>
> I think I'm on the uapi should remain in C for now, we define uapi
> types with the kernel types and we have downstream tools to scan and
> parse them to deal with alignments and padding (I know FEX relies on
> it), so I think we should be bindgen from uapi headers into rust for
> now. There might be a future where this changes, but that isn't now
> and I definitely don't want to mix C and rust uapi in one driver.

Agreed, I think with what you say here (changes required to external
tooling), even if the generation was done by `rustc` itself and
guaranteed to be stable, it would still be impractical at this point
in time.

Cheers,
Miguel
