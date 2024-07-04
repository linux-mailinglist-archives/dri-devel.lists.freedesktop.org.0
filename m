Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11EAA92732D
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2024 11:38:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F142F10EA40;
	Thu,  4 Jul 2024 09:38:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="OCgXcUEh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF53B10EA40
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2024 09:38:08 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-424ad289949so2783335e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Jul 2024 02:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1720085887; x=1720690687;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B61Ndz/Y+22Ue4UGWv4+nbcIEIQi+VpzgZKgjVAJvzU=;
 b=OCgXcUEhcYq8Y83CaNYh1NXB6xUTCNQ0aWKUnfQ0Akw52DgQj4O+P9+G/320WCA11y
 MCRgNHsfVi2as18G4HD78+LaAhEd2ZpuBqrgBAGGChxgNShBEa/BFrq86E0QLLTaIZQ6
 zgkdbRzhhZk8lk1jlYncYBuAc0xQSz+EvPkdQo62vTOWv/xiRVWCZGo8PRrq5dQ4Q/lW
 MM+np8PSV+6g90RaVbfuTAA7cUjmSD61UObSjXGpOe6sZHmpQwDVUYdvt0x9ZhdJAZor
 wd6lmjjoDpUalpdiwqBbzwl2hyXHy5nHSWrelQzidBBW2B8fmtvEZ94YV81PTctZZKjy
 MtXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720085887; x=1720690687;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B61Ndz/Y+22Ue4UGWv4+nbcIEIQi+VpzgZKgjVAJvzU=;
 b=jbF/JZF3Uu6+CvkoZqwD6uCS+2jpwJf46UpVwI8r9eOWxItY1dUjxG1gU0P96x7qsP
 AbBGvlB/Kuwj4BzbAE60FrXdMH++jwXhvPJE6NSazHA1t0K/PWewuTvVVYdLUUoInduW
 4vkgc8SkjiVnCQZTaeS7C7QDRjsAq3f4osQSzJeCh0tQ/pC+EHpqCfh7LNsBLJEY/hHu
 KYDfFlqQ5sKlMiPmA9scY9OALwuCanfBP9mluz9Ld9sWXUfaiSM5lc5IRrCBVb4VY+Df
 wti3t7OdkG0AYLlTTwc9ncRtgZcb+MSRlF+Mf4RdIfxYv/P/YYKQRJ+gUrmb7foPYfQG
 RiwQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNXMi1PMnSd8+0RXlpITXwkKgY41pSVf0TpmG390YjPmu5jJx6VE8Bz5t6heTHdKcYaFoT5P4r3S6FPGO0Vv/gRYlnmwwrZUdhLyu4vHBN
X-Gm-Message-State: AOJu0YwKmwgFdOy38UY85pIWIzOm3lRXpt/zXxenK1SN9Zq1uxvDuKyj
 MJU6eQCAbY4Vn87GeM6AQ70wdvjB6+5oBnNqBMpuutagMg8LNfHEE2CtUFUJVGyPSoFgXuSUKCu
 o3O8eGFfiWqKIB9EeeRBffpf52iaHSdo5eClH
X-Google-Smtp-Source: AGHT+IE3csL2P+Oa1bm2MMKxJf3sdfNwLRB7vTutviF9jHId7ofiRmfWJCeXK5ZIB/EESpULmX6hfWO8Mr00zUiietA=
X-Received: by 2002:a05:600c:887:b0:425:7784:56e8 with SMTP id
 5b1f17b1804b1-4264a4319f9mr7152035e9.28.1720085886954; Thu, 04 Jul 2024
 02:38:06 -0700 (PDT)
MIME-Version: 1.0
References: <20240703154309.426867-5-jfalempe@redhat.com>
 <20240704091109.1453809-1-aliceryhl@google.com>
 <2024070407-pregnancy-hazing-add9@gregkh>
In-Reply-To: <2024070407-pregnancy-hazing-add9@gregkh>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 4 Jul 2024 11:37:55 +0200
Message-ID: <CAH5fLghobuv39Pv5gUrieridzHg5ouAESCOdXGWcjAe=yx1U+A@mail.gmail.com>
Subject: Re: [PATCH 4/4] drm/panic: Add a qr_code panic screen
To: Greg KH <gregkh@linuxfoundation.org>
Cc: jfalempe@redhat.com, a.hindborg@samsung.com, airlied@gmail.com, 
 alex.gaynor@gmail.com, benno.lossin@proton.me, bjorn3_gh@protonmail.com, 
 boqun.feng@gmail.com, dakr@redhat.com, daniel@ffwll.ch, 
 dri-devel@lists.freedesktop.org, gary@garyguo.net, 
 linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, ojeda@kernel.org, rust-for-linux@vger.kernel.org, 
 tzimmermann@suse.de, wedsonaf@gmail.com
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

On Thu, Jul 4, 2024 at 11:28=E2=80=AFAM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Thu, Jul 04, 2024 at 09:11:09AM +0000, Alice Ryhl wrote:
> > As long as the above requirements are satisfied, calling
> > `drm_panic_qr_generate` should never cause memory unsafety, so this is
> > an appropriate list of safety requirements.
> >
> > (You also require that `data_len <=3D data_size`, but if this is violat=
ed
> > you get a kernel panic which isn't a memory safety problem, so it does
> > not need to be listed in the safety requirements.)
>
> Panicing while trying to print out a panic message is not a good idea,
> so enforcing this would be nice :)

I guess it would make sense to have an if that verifies that `data_len
<=3D data_size` at the top of drm_panic_qr_generate.

Alice
