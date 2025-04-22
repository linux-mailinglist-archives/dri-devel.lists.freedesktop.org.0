Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E73A97085
	for <lists+dri-devel@lfdr.de>; Tue, 22 Apr 2025 17:25:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF13010E5C2;
	Tue, 22 Apr 2025 15:25:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BZZrLAcs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43D3310E5BD;
 Tue, 22 Apr 2025 15:25:04 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id
 98e67ed59e1d1-301317939a0so712607a91.2; 
 Tue, 22 Apr 2025 08:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745335504; x=1745940304; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5vDqQdhlV6K1g44V2MO+orh6zIAZuQgVJU448hs2xyg=;
 b=BZZrLAcsWFi9aY+XhZcrP4oIYCrMvPXqoS9oLJ1kTa2pXih5qHvx/DDnPcX8pOGxki
 Pkao0fR0R9AObfRmZFjfEyq3xSGpmiMg/tigm5gBnLaIVYJzg997Oq3QsoO8m2Sy6zAb
 SHQUgz4VWcHl9auKZpyqzPlyIq/mZXgMlIJKyjFSZklbpQ+FmwC3avZIYo6Bnv++52Ie
 /xecaFb/C3ksmLgAC36ZampbMA/ncbJg6t5L4h3QlxTDGIDQW0o/7+wLwJT7WC15q1u2
 aDV6cAM3lgqgwOQQ6XrtgPsGuD6ZPW/P88tieNX1DhhxZgi7RjfB0LE8oso6WT+7DQg1
 pc2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745335504; x=1745940304;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5vDqQdhlV6K1g44V2MO+orh6zIAZuQgVJU448hs2xyg=;
 b=sXRK6JJM2RAE0U6kogPhf4pGUGbcOb0nW3n1+ZM2wEVURIoj6dCJBvELX0GO7NcQqE
 LCmS8coDo1A027vsirnXJeDMGyq4xk5dil98Oxm/YHdnGikj4liZr/1LVsG7FXuXKMyC
 3mEjzs/RLr7Iyy4nHkr2hXEr9G4v+1cAXXAmAhGcKwk6OsabSoPRa7S06dItEGJAdCWP
 zKU6S65TysRNe+wsqQUOckdDdyur00zvJkeKGJrbr4oU5cbheA3Lxun30oeI5mVu90tV
 jnm/2l06U5zp6TGx5NSxeQoSMa0irgxoreVMFcas8cz60QtPagQdXjQb0Gm+AEE3MbZL
 cUOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVgDkvHGP34wYhU9BuirOvGyK/RKOmX8C/Zi3DuIYFXFq3+sidrBF1HlmFJ6eN2NVGw7K0+f1xAkpYW@lists.freedesktop.org,
 AJvYcCXvICIFI9EoxXcNHAJGtoB4b4uk2P3E/yoMVbGPgPtYT0UpUgOuPmvlKC0+UYH8Xenp9MpefVpZ@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzVCOlEDR+ScbbhwDAE79TzDGbumKKTG9ZTo1SX2vHaqWi9Jkrs
 vn1Dpyp1PaltudqIUCEoSD+zbh599cVyJpuUj0ljaG5736MHpXnuSbzd1S5bIUKwMtOAEziqXWw
 BT++xT2oTlMDYJq63cIczQBwJn+o=
X-Gm-Gg: ASbGnct+st8CXKybD4uVXEXf7eS//jPTK0H45uldYCXL+F2iy1ZMGgoX+focbMBQPWp
 NvUviQko7oGYKZQ+8DW719CRhV5FMBVRcgwKkPzhqN3i3bnnOLj1vnTLNf2V2pCmZB40cXSxFVN
 RtRUswxjGF2sPq1tZMN3BmUA==
X-Google-Smtp-Source: AGHT+IE0mBEY5TL7BdwUTIPiJoEE3w4k5pGY2WN1PZHGIVPpSPR667SNMI7xE+LINKJpITF5xTTsY8zMQltqeALGF6w=
X-Received: by 2002:a17:90b:33d2:b0:305:5f31:6c63 with SMTP id
 98e67ed59e1d1-3087bcd50b5mr9034048a91.6.1745335503645; Tue, 22 Apr 2025
 08:25:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250421215833.work.924-kees@kernel.org>
 <CADnq5_MbGS+DBRZhQccqP-o50vvv6uiT31msefRTw5bMydAAKg@mail.gmail.com>
 <202504220755.179FD11DAD@keescook>
In-Reply-To: <202504220755.179FD11DAD@keescook>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 22 Apr 2025 11:24:51 -0400
X-Gm-Features: ATxdqUGzNJyWfxfrM2voJs_-V9FhvQHWxBTvwOEbE9UpStQwCBAP4Mn-zzvaJO8
Message-ID: <CADnq5_OmuPFE5KvHsUAFMdT4irNKK8zrwsiVXVk2au2mPWpHkw@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu/atom: Work around vbios NULL offset false
 positive
To: Kees Cook <kees@kernel.org>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Jesse Zhang <jesse.zhang@amd.com>, Tim Huang <Tim.Huang@amd.com>, 
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Alexander Richards <electrodeyt@gmail.com>, 
 Lijo Lazar <lijo.lazar@amd.com>, Mario Limonciello <mario.limonciello@amd.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Al Viro <viro@zeniv.linux.org.uk>, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
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

On Tue, Apr 22, 2025 at 10:56=E2=80=AFAM Kees Cook <kees@kernel.org> wrote:
>
> On Tue, Apr 22, 2025 at 09:22:26AM -0400, Alex Deucher wrote:
> > On Mon, Apr 21, 2025 at 5:59=E2=80=AFPM Kees Cook <kees@kernel.org> wro=
te:
> > >
> > > GCC really does not want to consider NULL (or near-NULL) addresses as
> > > valid, so calculations based off of NULL end up getting range-tracked=
 into
> > > being an offset wthin a 0 byte array. It gets especially mad about th=
is:
> > >
> > >                 if (vbios_str =3D=3D NULL)
> > >                         vbios_str +=3D sizeof(BIOS_ATOM_PREFIX) - 1;
> > >         ...
> > >         if (vbios_str !=3D NULL && *vbios_str =3D=3D 0)
> > >                 vbios_str++;
> > >
> > > It sees this as being "sizeof(BIOS_ATOM_PREFIX) - 1" byte offset from
> > > NULL, when building with -Warray-bounds (and the coming
> > > -fdiagnostic-details flag):
> > >
> > > In function 'atom_get_vbios_pn',
> > >     inlined from 'amdgpu_atom_parse' at drivers/gpu/drm/amd/amdgpu/at=
om.c:1553:2:
> > > drivers/gpu/drm/amd/amdgpu/atom.c:1447:34: error: array subscript 0 i=
s outside array bounds of 'unsigned char[0]' [-Werror=3Darray-bounds=3D]
> > >  1447 |         if (vbios_str !=3D NULL && *vbios_str =3D=3D 0)
> > >       |                                  ^~~~~~~~~~
> > >   'amdgpu_atom_parse': events 1-2
> > >  1444 |                 if (vbios_str =3D=3D NULL)
> > >       |                    ^
> > >       |                    |
> > >       |                    (1) when the condition is evaluated to tru=
e
> > > ......
> > >  1447 |         if (vbios_str !=3D NULL && *vbios_str =3D=3D 0)
> > >       |                                  ~~~~~~~~~~
> > >       |                                  |
> > >       |                                  (2) out of array bounds here
> > > In function 'amdgpu_atom_parse':
> > > cc1: note: source object is likely at address zero
> > >
> > > As there isn't a sane way to convince it otherwise, hide vbios_str fr=
om
> > > GCC's optimizer to avoid the warning so we can get closer to enabling
> > > -Warray-bounds globally.
> > >
> > > Signed-off-by: Kees Cook <kees@kernel.org>
> >
> > Acked-by: Alex Deucher <alexander.deucher@amd.com>
>
> Thanks!
>
> > Do you want me to pick this up, or do you want to take this through
> > some other tree?
>
> Whatever is easier for you. I'm happy to carry it if you'd like. :)
> There's no rush on these -- it's been a long road to getting
> -Warray-bounds enabled. ;)

I've picked it up.  Thanks!

Alex

>
> --
> Kees Cook
