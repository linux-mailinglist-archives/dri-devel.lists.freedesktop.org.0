Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED166B49943
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 21:03:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E2A910E0C5;
	Mon,  8 Sep 2025 19:03:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="1IGl9TD4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CBCB10E0C5
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 19:03:01 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-3df3be0e098so2631808f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 12:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1757358180; x=1757962980;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YGkvJHfAPV/3bX3cS+jtsH6Oy+pYikY5VFUSFXl/ge4=;
 b=1IGl9TD4Xvi9SATDPUiDmOkhnAIpt/RPqAPQzGoBpnIPsXUa7yHAa/E60NrxWwYyrS
 Evc0oQNyvGy8mWMjG2AfglbKTt7Viagz5nAs+ZVb5JXnQyf0UW3WfI5PcE2y2dxWsRXU
 P90U9j3z+t/MixIMtTH+ZZ1Jju6JWdjGGz9/abb/N3JKLBIk5MGBvJtBpiVCqYbGsCUE
 l16MmLmDK2pzrTDmIFn5DI3sIDnj/lDBsc3ScuUgvAa310tXy7MHNphNCM4kxHNXlFwc
 Dc5EFZ5BnVSHCLcEkvrQfALEbcOQaPH+IOQtSDL5W/L5UdHlvhwPKj24JWeYeDSkDU3q
 Ph2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757358180; x=1757962980;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YGkvJHfAPV/3bX3cS+jtsH6Oy+pYikY5VFUSFXl/ge4=;
 b=lumIYcWRyKIBWS2/4XxMBdZdLdjbzkYtXTZGzEOV/anwHC6gm5bbapTtsRBNx50akq
 0TB7GPc2Kt8XuibPSNfEBi2+PGNkPIcN+YHdaDbGkorLim4WfuG1RGDNNwZh6xJU+/4m
 WQrX+xYwgX0H3jvaTyigITgTeOKn/hsAmbDy6DbPRyMlXVXMc1q3pNEL0FrkIQkuJa0O
 PRliYo3lIAbEZCs0nT+n6kY4q98+mvs39sa/EzF4+32rNgzW8GPe7+bLtXk7zO4CjQ0+
 N+QlHk1MJwAH5tdmzayQKqM7vfOFo+QdfGYgUB6yWLX13UA5jQ5PEpkvR5jNv4anWguL
 D+cA==
X-Gm-Message-State: AOJu0YwfynOif1ZgR3QDmFWq7CY+ZRK57KTYedu8T4JPkWdUsUxXZSlW
 e07tGh5D+TtJD9+osT2JmpEXnIwuvyVA3Qv1tLG8P4xzI7RMjSBtcyzyhjNSrd7Qf9HK5/tUuCJ
 0l2F2xc0bBhTLm+8Z6NGuLNLQKnd6jOiBsX7MkL93
X-Gm-Gg: ASbGnctIGOEO2BrJduM5gN7T7yEkrsNX1a7wz9YErP/fCkrFqmhGnMaUuD1CW0loIyj
 WBTrMYohI6eSoSFVT5dgouDaEgz698ITG2VRdA2Rl01a3qvoNNhWuaZsPrg4zOxF4Pc/TDdsZi/
 kb/rXo2+9X8neVqnGghEI4DRWrj5o+DVNNkg6aSYmEZ8V6UbGE0nAkrTBC4Omj4ZwaISj7eXGiq
 dcfy06BG0sekWOsYnDhc21TlolUkjdoLjhBt+CLXcfBeJk=
X-Google-Smtp-Source: AGHT+IHD9xXpzxFp5PJ1LiMALVk8G2qCrHktRr6s3MtGbxUdLsV0q4AzUS7LRxtsm9cmQI9P4cr+vh4V5ldORb0FTlQ=
X-Received: by 2002:a05:6000:288c:b0:3d4:2f8c:1d41 with SMTP id
 ffacd0b85a97d-3e6429ce523mr7165940f8f.20.1757358179561; Mon, 08 Sep 2025
 12:02:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250908185239.135849-1-lyude@redhat.com>
In-Reply-To: <20250908185239.135849-1-lyude@redhat.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 8 Sep 2025 21:02:47 +0200
X-Gm-Features: AS18NWA9JjcfFmYV0JQId5ES12OkLgTAZUupg-74m7pAwM3NG9Y9Z08Ctn_PmSc
Message-ID: <CAH5fLgh8_pmtwgOPuXpDqhiK7rsj0S-ySrX9M_yEsn6n5pKHpA@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] rust/drm: Misc. gem bindings cleanup
To: Lyude Paul <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
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

On Mon, Sep 8, 2025 at 8:52=E2=80=AFPM Lyude Paul <lyude@redhat.com> wrote:
>
> This is the first few patches that were originally part of the series to
> introduce gem shmem bindings for rust into the Linux kernel, which can
> be found here:
>
> https://lkml.org/lkml/2025/8/29/1533
>
> These patches don't have any dependencies besides needing to be applied
> on top of drm-rust-next.
>
> Lyude Paul (3):
>   rust: drm: gem: Simplify use of generics
>   rust: drm: gem: Add DriverFile type alias
>   rust: drm: gem: Drop Object::SIZE
>
>  drivers/gpu/drm/nova/gem.rs |  8 ++--
>  rust/kernel/drm/driver.rs   |  3 ++
>  rust/kernel/drm/gem/mod.rs  | 93 ++++++++++++++++---------------------
>  3 files changed, 47 insertions(+), 57 deletions(-)

For all 3 patches:
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
