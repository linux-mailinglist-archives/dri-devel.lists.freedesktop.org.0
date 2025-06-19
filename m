Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3316DAE05FA
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jun 2025 14:34:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8385110EA19;
	Thu, 19 Jun 2025 12:34:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="pGpw4Zc2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C51E710EA19
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jun 2025 12:34:37 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-3a365a6804eso487806f8f.3
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jun 2025 05:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1750336476; x=1750941276;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dUmxy/Hdai8107zqpCeX8C6jaNfW6QH+rBn5HzKsl7o=;
 b=pGpw4Zc21seWyLYbsLvSoaFA6tzL/IFU8wAj0sI6sDwOuT9skwQRmXwu2FKVtWP1KZ
 zRt9k1djzy17pSZr4yAta8+7DsXWqB5ASIXTjllOgEwxPxt01Yb8msQNBipQY0mnvg4j
 ml/Xx47IHmE6IywDQyiCj0xYOiEdyHGx9FPa4u4Cmpj0OoIoNUrbeFtgxzlrdYn3IHok
 IhgEUADlo0EpRR/Yqe5ExwWGi9aoAHodA2d7egx5K/Ktjm4NRqD+02rUw82s9OMUxh5T
 A4tM6iN/xzBTNRI+PFNVoZykOUFbYCU4tXpqJMMOa6hh/vm5mwowMs8Rm+CDMW8YDKkI
 T11g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750336476; x=1750941276;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dUmxy/Hdai8107zqpCeX8C6jaNfW6QH+rBn5HzKsl7o=;
 b=QshGWbIdpPooUSEUuG2b348Cou8Fvfh1UTCkSUM+w58/N9oxUI7r2wOWT4pB9YRJWc
 aa8Jw20RdeCTF2EeoA21+1I80gD1U2P+6+QVN14pDiEV8Dk9/I6qUlYkOvj1pP6fN5F3
 5bYnis1lMcAwwEWtp1S0ZfSJymTTKuER6bQWom3p+u6I6b9rCHQL7vMOM4S/giDocIif
 ztDy6hcEICTDfl2sxRxai0rBWZz2flHAB6VA2mXcHYvg/St4YbQjgwuhoFtqrzKYfrpI
 N/COmGR53nSH/kiuzKu//VXi/FdzfAGf+TqHUGteLKUf9mFlVGOj0qGQ/wCLigDdSDXv
 FzHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZXyUcn7dGSUglYGkRJoJngi0NY0FSWO5sl1egxkL+LCbBUJ3KsyzeD2dQ9oxSjbZUr+YycQOq4RE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyHKQmAIB8Ok6zC2UmZceuqpM5pE5xqQZj6RK4EmGx7NbbAZbBt
 c2xBPHBSOAdAVddikL5iYZIP0Mt7J1p0AyBVHR7krrHnU10PD/EVqvndqdFckuD6MNLH2X9sD3s
 Nlv6SFfYKWNNKIk1H1qLIaN7/9hm6J5eysyUIoDdX
X-Gm-Gg: ASbGncs64xfggoom+AskIRUYxwHOg11jrpbMyjfmHxlhPCKJB51q4Uy3zC7n3H18lIy
 UGKPCHhb/wDaowLVRZdBDDVb+ktwljTceHB1LCKU4yzqqW/cDyPDKcpd152Td24NGwm3ud5z46r
 trqmsHEk9VGwZBwJheTKWo5dfjzc7sWLk9s6CQYpte21aRVnSe3uBtQ+8TeqftbUzhh+DyUrM8w
 Q==
X-Google-Smtp-Source: AGHT+IF1gwD/zXJVqfwqTcm1IO6KBTRJQx5xJoQ9nmxLVDVOLDa0YMpOdlQTsc+e2Vchuf7u9PpveNnDcAMu2ctt+0c=
X-Received: by 2002:a05:6000:2f84:b0:3a3:63d3:369a with SMTP id
 ffacd0b85a97d-3a57237c5bamr18481410f8f.25.1750336476215; Thu, 19 Jun 2025
 05:34:36 -0700 (PDT)
MIME-Version: 1.0
References: <20250619102102.750668-1-beata.michalska@arm.com>
 <aFPsjIFIC1J2qtdc@pollux> <DAQGIG20TJV6.3O4G0F4O72327@kernel.org>
In-Reply-To: <DAQGIG20TJV6.3O4G0F4O72327@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 19 Jun 2025 14:34:24 +0200
X-Gm-Features: Ac12FXyZ-tFdKD4al7sN6xdj4fhGj-fFwkD4_1_dcr3JFbcXggzsKpKEk98zuno
Message-ID: <CAH5fLgguROtxet420KZND9NYUYUZ4ob7TsczkYFNaMeRoQK5=Q@mail.gmail.com>
Subject: Re: [PATCH] rust: drm: Drop the use of Opaque for ioctl arguments
To: Benno Lossin <lossin@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>,
 Beata Michalska <beata.michalska@arm.com>, ojeda@kernel.org, 
 alex.gaynor@gmail.com, daniel.almeida@collabora.com, boqun.feng@gmail.com, 
 gary@garyguo.net, bjorn3_gh@protonmail.com, a.hindborg@kernel.org, 
 tmgross@umich.edu, alyssa@rosenzweig.io, lyude@redhat.com, 
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org
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

On Thu, Jun 19, 2025 at 1:01=E2=80=AFPM Benno Lossin <lossin@kernel.org> wr=
ote:
>
> On Thu Jun 19, 2025 at 12:55 PM CEST, Danilo Krummrich wrote:
> > On Thu, Jun 19, 2025 at 12:21:02PM +0200, Beata Michalska wrote:
> >> diff --git a/rust/kernel/drm/ioctl.rs b/rust/kernel/drm/ioctl.rs
> >> index 445639404fb7..12b296131672 100644
> >> --- a/rust/kernel/drm/ioctl.rs
> >> +++ b/rust/kernel/drm/ioctl.rs
> >> @@ -139,7 +139,7 @@ pub mod internal {
> >>                              // asserted above matches the size of thi=
s type, and all bit patterns of
> >>                              // UAPI structs must be valid.
> >>                              let data =3D unsafe {
> >> -                                &*(raw_data as *const $crate::types::=
Opaque<$crate::uapi::$struct>)
> >> +                                &mut *(raw_data as *mut $crate::uapi:=
:$struct)
> >
> > I think we have to document the guarantees we rely on to create this mu=
table
> > reference.
>
> If the C side is using pointers to read/write the value concurrently,
> this is wrong, it needs to be wrapped in Opaque.

There's no concurrent reads or writes happening here. I think the
Opaque was added to deal with transmutes to/from byte arrays.

Alice
