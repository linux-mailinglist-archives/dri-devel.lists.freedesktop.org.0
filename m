Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F933A46AB9
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 20:16:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 920B310E9CA;
	Wed, 26 Feb 2025 19:16:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="H9AaezMR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CB5810E9C9;
 Wed, 26 Feb 2025 19:16:45 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id
 98e67ed59e1d1-2fe851fa123so51750a91.0; 
 Wed, 26 Feb 2025 11:16:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740597405; x=1741202205; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VjtNitstYYf60IMnZQOoZ5YL1+sKrxwbs6AgHj0hDAQ=;
 b=H9AaezMRR3oZP6EaMQRX97XtouFQRdMUxNAidbiQrvYVTMgq8/XQfCRDTQZjsuSgfm
 I5LkWbxzxGk8wzOURiYny6EtKM6ZMhdUBrc5nJyn7LhZYFpsIsbghYI3l0U611JK7LEU
 xA+RjvDZNT2Zo/Dr4wFHtN5ja5tgay7+sIOSBsBRf+KDBjAhPuTSJj0A5S3MOCKRDjqY
 j+NsxaD0K48cd2u1JJ4zzcCJMzeCNH+wbMwbVUBmPLOfTmhS/dhMdWvAwoeyg1AXqDH0
 o6KXpWj6qtY+QbEW8e3wBI1T+xRT5Y5Lo3sQXOTCg42X9wV/Az5lvjT7Dxxk5BH/HQ8R
 VLBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740597405; x=1741202205;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VjtNitstYYf60IMnZQOoZ5YL1+sKrxwbs6AgHj0hDAQ=;
 b=kxNBBUyqvdi391vfqyBwTrU8uOl7cZZjoWEp+Zt5IptpUZ5oPkVIwSkniwK+dVwI1B
 eEhqsz2yTVzUJyRA3Osatp1Q0WD7Z4UcHns5mCptoCbG30KT65yoRO9UVYAyozp9bezO
 5kWkwa0uhqvN+sd0P2ZB1L6A1kOmjErwBg1V2CRli+dfbqcX89ut7Ufm2XFJJC4yjKGN
 le4hXBSQ+k04KkfAqB0V8j4QjfKF47tCFFLiSWvvGZGuKYWn5m04PYdq15bisbHR47g9
 umskNW7F7WnqjEtU0y09Xa4Dx1PoUSVMZPV3qoO5sAh000eGqwGiFackwsXAfNsZqhyw
 0GWA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWAGq8Jj8pWkPMm/z7zjmu2yytX0dBvR94yInshEK0oOqVbKgrn2g2cpKYjmjrnrRx84D5jxs+1@lists.freedesktop.org,
 AJvYcCX1yCmPSxpzICyE/juXR3zQcjYnng2CS2lir2cyiSw5ASmu1MKo//cAKm6vr4GAd7ukS6zKX9AyxBW+@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwSx/gtDSCGNMtkqi28UTcXC2yIo/usz0MboXbl7ofCPHEWafh5
 1iYzQuMjPArGwphp54iF6N6hXk9q+fA/W568TxRkFMFql/0Mso/bpkY4znNYY3aS77INlidZJdE
 N2cuWD8tVnXuNvxc0nhv51EX1JT0=
X-Gm-Gg: ASbGncukOy9/pHPzxlFelhv63T9fFAzEjn6JL/8JNe9uU0emkDTNBgvmGdVhyCRlvai
 0B8aLWglR9hc0LG2iDYtaNiFA0g8K7XZO1tX4bmdK2bfEZ8GOel62cTVDleW+VAcLrRXzHGbqk9
 kPzag8TxI=
X-Google-Smtp-Source: AGHT+IHgWo4yFmzqB/Z9FUw87haS2aL6MUTOk2Od04bWbhTEwvhKuzoJHg77mviLKvY13jtSsscAzch+iDPY4BA442c=
X-Received: by 2002:a17:90b:3848:b0:2ee:cbc9:d50b with SMTP id
 98e67ed59e1d1-2fce7aef973mr14367404a91.4.1740597404926; Wed, 26 Feb 2025
 11:16:44 -0800 (PST)
MIME-Version: 1.0
References: <20250226083731.3584509-1-make24@iscas.ac.cn>
 <749a1601-fa9f-468b-92d1-1a1548a08471@amd.com>
In-Reply-To: <749a1601-fa9f-468b-92d1-1a1548a08471@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 26 Feb 2025 14:16:33 -0500
X-Gm-Features: AQ5f1JqZKQbC5NjwnQBDg9bLvkGO3Y_FuwCdAgPbNdvGDi3qHR2ihJQAqXVMKn0
Message-ID: <CADnq5_NJKwmiGfcP2RwK+pZD7YXA_pbe7VtsWYoNt_nVRFO5iw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/amd/display: Fix null check for
 pipe_ctx->plane_state in resource_build_scaling_params
To: Alex Hung <alex.hung@amd.com>
Cc: Ma Ke <make24@iscas.ac.cn>, dillon.varone@amd.com, Samson.Tam@amd.com, 
 chris.park@amd.com, aurabindo.pillai@amd.com, george.shen@amd.com, 
 gabe.teeger@amd.com, Yihan.Zhu@amd.com, Tony.Cheng@amd.com, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
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

Applied.  Thanks!

Alex

On Wed, Feb 26, 2025 at 2:04=E2=80=AFPM Alex Hung <alex.hung@amd.com> wrote=
:
>
> Reviewed-by: Alex Hung <alex.hung@amd.com>
>
> On 2/26/25 01:37, Ma Ke wrote:
> > Null pointer dereference issue could occur when pipe_ctx->plane_state
> > is null. The fix adds a check to ensure 'pipe_ctx->plane_state' is not
> > null before accessing. This prevents a null pointer dereference.
> >
> > Found by code review.
> >
> > Cc: stable@vger.kernel.org
> > Fixes: 3be5262e353b ("drm/amd/display: Rename more dc_surface stuff to =
plane_state")
> > Signed-off-by: Ma Ke <make24@iscas.ac.cn>
> > ---
> > Changes in v2:
> > - modified the patch as suggestions.
> > ---
> >   drivers/gpu/drm/amd/display/dc/core/dc_resource.c | 3 ++-
> >   1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c b/driver=
s/gpu/drm/amd/display/dc/core/dc_resource.c
> > index 520a34a42827..a45037cb4cc0 100644
> > --- a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
> > +++ b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
> > @@ -1455,7 +1455,8 @@ bool resource_build_scaling_params(struct pipe_ct=
x *pipe_ctx)
> >       DC_LOGGER_INIT(pipe_ctx->stream->ctx->logger);
> >
> >       /* Invalid input */
> > -     if (!plane_state->dst_rect.width ||
> > +     if (!plane_state ||
> > +                     !plane_state->dst_rect.width ||
> >                       !plane_state->dst_rect.height ||
> >                       !plane_state->src_rect.width ||
> >                       !plane_state->src_rect.height) {
>
