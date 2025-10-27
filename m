Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B39CCC0F8BA
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 18:10:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D178110E502;
	Mon, 27 Oct 2025 17:10:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QeLbTnWT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com
 [209.85.222.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BDEB10E51D
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 17:10:28 +0000 (UTC)
Received: by mail-ua1-f50.google.com with SMTP id
 a1e0cc1a2514c-932cf276843so1942714241.1
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 10:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761585026; x=1762189826; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4yg0rbfawIn1Arrvn5hPRBZqSEKlTBCbiXBwOFnHB3c=;
 b=QeLbTnWTEwoF7dbudUt2OjvMEmE1VbHX3ikRhdsbXiBW2i4eQKDELDTIjh9WybGWFM
 OibFyYe2Ueq/2+GiADspS5/Dl0cS4R7PirPJDPtqo+KYiSS3N8QZB65KbOJfU0NPXfhr
 l5ujdugJqZMZvizqWEwvGCtECPKmkGJ0xChOnkRu+4oFTxoDiBgA1SIhanc67k/yYSw2
 7H0+cFXEKNXCF8SHS5+dwbAqP9xbhsKS6tDnzgsENjSQdiCtIevV232ZnoD1K4WpOS3/
 z+szpzAZajC5HomE4+P4HcxRyCwgXPkSdrJeLAwpn4ySym6LnmMDr7IZTmGGpupZ8pNy
 ZF/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761585026; x=1762189826;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4yg0rbfawIn1Arrvn5hPRBZqSEKlTBCbiXBwOFnHB3c=;
 b=oWefNddf4NXuj91Id7uc9Of4uB62M1H391SSd9SbWqL21EM72uCIoim8lW4r/roYQo
 4uv9KiFClzU8SlYKS11Ga6h6jzoIL2404e/bynZxgGP4AYwHMxL+0kQs/TOOLOMoLotW
 BnaW0ihtDPztD2vybEguD7SeZJZR6ztji668970Lc5HE1E8fdcjedLl1puF75vc5EUhI
 49lNilNnLK1M2gAcbVL7/uHuREz308YJw+XHxHfq73POaefkJVbQK/gETypjRp7FVLN7
 tf/rqJiXEnZjFPLlDbqNKD9ZCha9SGLIPXLJBnCidQtaHl/OALeZS3DhHqdEss28HKlu
 axwA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUmBhdmU91lvmkl8Dv8KdTxQ0mxYbkPzgZWVdajdX/vSv1fdli+QB3xC2wBfB1bkMw6lFFJILBs14g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyJDrYcfNmLpNhO5f3AskTmUjm260ZxU58NbkkBV+DHLU0NROK5
 tQe0W6m8HkEEye1orvS/3Qnn2lJWZo0ZHXXnkNethrWXLQFRPt0fgE9zWv45CF9oJKUbc1BnYar
 dwRicwXJ97bNwjY4shkbu3POejJbmyhM=
X-Gm-Gg: ASbGncv5Noyz/rhHEF6vdFEu/XN8mU8oeC0lm9IR3W+SzXp8Du/GYMFlMmZX8vvq6C1
 gJijvBpB1WOctF0VO6ERYhEVIusM6jq5mI9wfX19o7tyGsQtiNXka5BAyVDS2M5CMvcuna/A3CL
 c6ZbxU9JIzYitgrEhcjN/bMYzWREw1/fw3EHCNqyx98j95XwXNZ6cTWODXCTqOqH2HHb3yPWz4A
 0gOrAEreWXK0tprcjjQIO3Isy+/rB6SFnWgPvMDmBWrDMBG0jyHhgJ/Qf5vIg==
X-Google-Smtp-Source: AGHT+IHUkYAmfqsL4pfrAr2m2hdDN3o6uRLRGRxPeQNNakdfKiLHAcYIg1YSxmUZUhNXfkuM7ZRz3ojoiDUBwfP84Ao=
X-Received: by 2002:a05:6102:50a5:b0:5db:3d11:c8da with SMTP id
 ada2fe7eead31-5db7cc1d762mr254232137.41.1761585026033; Mon, 27 Oct 2025
 10:10:26 -0700 (PDT)
MIME-Version: 1.0
References: <20251020053523.731353-1-uwu@icenowy.me>
 <dff6216d-b4a4-4d5d-89e3-e393dc018dec@amd.com>
In-Reply-To: <dff6216d-b4a4-4d5d-89e3-e393dc018dec@amd.com>
From: Han Gao <rabenda.cn@gmail.com>
Date: Tue, 28 Oct 2025 01:10:14 +0800
X-Gm-Features: AWmQ_bm6-SMkjAfWg6AAWYb_OA35WvrpXbak9x2LihJWZchEZTCd_NTCuMVV1sc
Message-ID: <CAAT7Ki9NGDhVo1dq3R5X-Mo1g0-+MZWcQ2TfWG7CAL27Y6BvcQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/ttm: add pgprot handling for RISC-V
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Icenowy Zheng <uwu@icenowy.me>, Huang Rui <ray.huang@amd.com>, 
 Matthew Auld <matthew.auld@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Vivian Wang <wangruikang@iscas.ac.cn>, Inochi Amaoto <inochiama@gmail.com>, 
 Yao Zi <ziyao@disroot.org>
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

Tested on sophgo sg2042/sophgo sg2044/ultrarisc dp1000.

On Mon, Oct 27, 2025 at 3:57=E2=80=AFPM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
>
>
> On 10/20/25 07:35, Icenowy Zheng wrote:
> > The RISC-V Svpbmt privileged extension provides support for overriding
> > page memory coherency attributes, and, along with vendor extensions lik=
e
> > Xtheadmae, supports pgprot_{writecombine,noncached} on RISC-V.
> >
> > Adapt the codepath that maps ttm_write_combined to pgprot_writecombine
> > and ttm_noncached to pgprot_noncached to RISC-V, to allow proper page
> > access attributes.
> >
> > Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> > Tested-by: Han Gao <rabenda.cn@gmail.com>
> > ---
> > Changes in v2:
> > - Added Han Gao's test tag.
> >
> >  drivers/gpu/drm/ttm/ttm_module.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/ttm/ttm_module.c b/drivers/gpu/drm/ttm/ttm=
_module.c
> > index b3fffe7b5062a..aa137ead5cc59 100644
> > --- a/drivers/gpu/drm/ttm/ttm_module.c
> > +++ b/drivers/gpu/drm/ttm/ttm_module.c
> > @@ -74,7 +74,8 @@ pgprot_t ttm_prot_from_caching(enum ttm_caching cachi=
ng, pgprot_t tmp)
> >  #endif /* CONFIG_UML */
> >  #endif /* __i386__ || __x86_64__ */
> >  #if defined(__ia64__) || defined(__arm__) || defined(__aarch64__) || \
> > -     defined(__powerpc__) || defined(__mips__) || defined(__loongarch_=
_)
> > +     defined(__powerpc__) || defined(__mips__) || defined(__loongarch_=
_) || \
> > +     defined(__riscv)
>
> Looks reasonable, but does that work on all RISC-V variants?
>
> And while at it maybe please fix the indentation, using a tab here is pro=
bably not very adequate. In other words make the defined() match the one on=
 the first line.
>
> Regards,
> Christian.
>
> >       if (caching =3D=3D ttm_write_combined)
> >               tmp =3D pgprot_writecombine(tmp);
> >       else
>
