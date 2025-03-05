Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38EBAA50D0A
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 22:07:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4CF810E795;
	Wed,  5 Mar 2025 21:07:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Bl2sJGm+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D603010E795;
 Wed,  5 Mar 2025 21:07:30 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id
 98e67ed59e1d1-2ff53b26af2so3459a91.0; 
 Wed, 05 Mar 2025 13:07:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741208850; x=1741813650; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ppeUxjaKjmx50Q3bQDc5N6dSfYxyGJbGKWKkwVwTeuI=;
 b=Bl2sJGm+KITi8YIbZxrKzcYJDFJqGaC+3YhKJqxuwIHfAYOtN11RZMvbtZzjwF3/6k
 jDJVGZkvzQnvh0HXIvtURxYDLErWMwROvVyhDEj0jTvBF6lbe6UWhnMsR8r870bpfGJo
 A24NndjyD12KS8iAlGQoVAZlWu5A8xoDcoLtUaZ4vIU/+xNBBk8/h/vea0JqkbTnsRMe
 ivbUUUav9pEsrKsIYELk6RUSYgKX+UEpLEqzbcRstj6t0aTMf42id1+ppHjwt2tF4JIl
 EQEE3UA23M1gQ9SBi443E7yjpWND4DVaEKqp35paQA/boO7neterxDAQiuuqX7D9IyXf
 c+DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741208850; x=1741813650;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ppeUxjaKjmx50Q3bQDc5N6dSfYxyGJbGKWKkwVwTeuI=;
 b=cj6NMXdUCztSMcCwxZXjkb8QLbAtfKd1vt9jaOZIAVKxHsUl/jWTIypYsGsbRSoupV
 Ym0JqLmAC1R6FC1X7jk52sTT8FaZvsGlG+dIFTdSyB/PqoO/ERqMDuqkVRoe2IxxjL2M
 xI9TDHegKCYbjcv7PSEkgCdUcPit2PKvKx0VBa/5y+Grzm13Al6/2HvOP1VO0c6gS/zT
 vyRWyZ1jePJiPWl2PSV3sm9T8da1kvQWty9+yRD9iCaHfmSUitH58G3KQpfq5w2GGxdD
 kK+3fsxzG14rUug0nZTdyV921e05Zn6MbUrnUbm+NAb80njlkBGRv6hUsjuLlD+RsZHt
 cbQA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUuSucX3Upz8QQzgO8+fp7GrGNgI9AsdAAevruv7Gne+k7Tbe2OOyv+U9rA7oPuXVeUAtOgjG8ZhQ==@lists.freedesktop.org,
 AJvYcCWuHJ0nx14Tkv9pYPTWWZ22LVVE4xlUFOTmSBMmsIAtW3Ubu6sPKiaHQqU79LlgHIdAa3BuukNYp7c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzjnULXLYS56StpKjeZevH1um4VX65my9gU/e3n0a7dBmc8BFOQ
 ebGHtBcwGHkAMEj0J7/W4+hevstKoNlTJGJ5YPxCvXeOIeQH+aXDXBi462m8pMQpyZdRFaFdVJu
 4iGwij6b4MeyQNICfW+7ztHOrpy0=
X-Gm-Gg: ASbGnctu2knZ4QwEApB2l2BUPKUMuSHCuX5I9xvYyiGqtXN5EBts+teiqwS5baIy2Rz
 Pyts9KG/aLJyXGwjsnEEy3luXAKS7le4G3CH2Duvdv3cVm2SEZ3FWvqegy+wH4GghqbI+UWJ/dC
 yAH4nfWL8XbQidGUaHyGqzI42hTQ==
X-Google-Smtp-Source: AGHT+IFdCsF1vk5OPN4taJHp2TBXL+JUlxGZBmkkbeifhcezimLuADcrM7P2FojcMB4CukfeYQQYekuvC1Sp9CWZOJY=
X-Received: by 2002:a17:90b:3504:b0:2ee:6563:20b5 with SMTP id
 98e67ed59e1d1-2ff49634954mr3085426a91.0.1741208850256; Wed, 05 Mar 2025
 13:07:30 -0800 (PST)
MIME-Version: 1.0
References: <20250304173555.2496-1-dakr@kernel.org>
 <20250304173555.2496-2-dakr@kernel.org>
In-Reply-To: <20250304173555.2496-2-dakr@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 5 Mar 2025 22:07:18 +0100
X-Gm-Features: AQ5f1Jo9uyXmUsRhx9aiXZGx5yBRRudRw6l9QRLBH4aKQdIv0iL_aGAt-0G_uyM
Message-ID: <CANiq72kr1NU-xs2f8TG3XXG5su4HmZG0TGj6p2vtrzygxTv0TA@mail.gmail.com>
Subject: Re: [PATCH v5 1/5] rust: module: add type `LocalModule`
To: Danilo Krummrich <dakr@kernel.org>
Cc: airlied@gmail.com, simona@ffwll.ch, corbet@lwn.net, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 ajanulgu@redhat.com, lyude@redhat.com, pstanner@redhat.com, zhiw@nvidia.com, 
 cjia@nvidia.com, jhubbard@nvidia.com, bskeggs@nvidia.com, acurrid@nvidia.com, 
 ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, 
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me, 
 a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, 
 gregkh@linuxfoundation.org, mcgrof@kernel.org, russ.weight@linux.dev, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org, 
 rust-for-linux@vger.kernel.org
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

On Tue, Mar 4, 2025 at 6:36=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> w=
rote:
>
> The `LocalModule` type is the type of the module created by `module!`,
> `module_pci_driver!`, `module_platform_driver!`, etc.
>
> Since the exact type of the module is sometimes generated on the fly by
> the listed macros, provide an alias.
>
> This is first used by the `module_firmware!` macro introduced in a
> subsequent patch.
>
> Suggested-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel
