Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8966B7F368A
	for <lists+dri-devel@lfdr.de>; Tue, 21 Nov 2023 19:53:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80C2B10E56A;
	Tue, 21 Nov 2023 18:53:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com
 [IPv6:2001:4860:4864:20::2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D62F10E2B8;
 Tue, 21 Nov 2023 18:53:08 +0000 (UTC)
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-1f938410f92so1377213fac.3; 
 Tue, 21 Nov 2023 10:53:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700592788; x=1701197588; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4MJviHtyv8L1V4pX3J+mGOhL9XRHlVW6pwIEatSbK/o=;
 b=UC0lk1hQA2KKAivYd/scbg6bJKs5bMzYrby6bBXieBzYUrhzi71X0/swBlmCWdcbaa
 qZyqpeJZ/pLyz1U643HEUmd2pW9E2W42DwIw+uDjWRXeaKIUMH/Ul1jkPUL3eRMTBUo8
 xbceE0Dah6MrZzXr44TohyD4zpl4qMJYTdaf3t8iOmN43rxZpj8BuLF57QN5XTzH8XxA
 2Y0KBKhiWnXafU/tcy7ta9fAbnIXRMfztd/K8higOO/YNRiuwM0oo4tekTvn60nItltH
 lMCtfWr3yKyBltXu198E16VDqFU87KlG0V11Zr4/KttymJnxnQktQ7wWzoaxr/lEOq7N
 gwKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700592788; x=1701197588;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4MJviHtyv8L1V4pX3J+mGOhL9XRHlVW6pwIEatSbK/o=;
 b=sD0jX5iHDJegS7+3KVaBzKxCAU/Qwl5vr6mWyjhqzIc5+ViT1A/lVNFAPMw6NhnhaA
 YxBhwGcc3Xv5ooCYl1M6KlZY6Xu7o6RESCls9Qs2LQK9Rgo1WXPmBCQKbq6Bal/WG9hC
 YFLkKN5XLjTIXQAIfKJZIa7s7eNjNLQe3kAcM8ICSRx6NGYBF4uDI/uDVoqtVO9oPDFl
 1MJKHaYFh+brMjtbL6ugqTA7XfK39Mb7nIOGO5QhsUJh7cU4rGmrZTbAWAD1Xu+H6eHr
 vJaCvT0/2WbIt8zRlia0X3xtD63INdfd/chVZ+lGudZ2eGSSc2Z1RC6BmYbXH2nB51sy
 T3lQ==
X-Gm-Message-State: AOJu0YwAa7LJnrqpGyv90uzUkAphep0A90tSvuY9gnthQNWg0LKCICHA
 VISemNcDHX4m/1qFFl98B+Z3bQiIoWq7lIhOZsE=
X-Google-Smtp-Source: AGHT+IE4CuBHJccxLbxl9uGN4mYz2Nq3566nDVcfvuXoHLGqjwkxWr/FWzsJgyhoRhGglObIvVU6uSnFU4vVZm9S4z0=
X-Received: by 2002:a05:6870:bacf:b0:1f9:5155:b135 with SMTP id
 js15-20020a056870bacf00b001f95155b135mr187608oab.39.1700592787805; Tue, 21
 Nov 2023 10:53:07 -0800 (PST)
MIME-Version: 1.0
References: <20231121043621.9351-1-u202112078@hust.edu.cn>
 <bac617fe-6b23-411f-8dc9-c97cc84208f3@amd.com>
In-Reply-To: <bac617fe-6b23-411f-8dc9-c97cc84208f3@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 21 Nov 2023 13:52:56 -0500
Message-ID: <CADnq5_P-Wr8C75vueF_oEqfp+PB2rf8KcJE8z4Xtd84jLB96bA@mail.gmail.com>
Subject: Re: [PATCH] gpu: display: remove unnecessary braces to fix coding
 style
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: hust-os-kernel-patches@googlegroups.com, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Leo Li <sunpeng.li@amd.com>, RutingZhang <u202112078@hust.edu.cn>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Dongliang Mu <dzm91@hust.edu.cn>,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 21, 2023 at 4:27=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 21.11.23 um 05:36 schrieb RutingZhang:
> > checkpatch complains that:
> >
> > WARNING: braces {} are not necessary for single statement blocks
> > +                if (pool->base.irqs !=3D NULL) {
> > +                        dal_irq_service_destroy(&pool->base.irqs);
> > +                }
> >
> > Fixed it by removing unnecessary braces to fix the coding style issue.
> >
> > Signed-off-by: RutingZhang <u202112078@hust.edu.cn>
> > Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>
>
> Subject line prefix should be "drm/amdgpu".
>
> Apart from this nit it looks good to me, but might be already fixed
> internally.

Applied.  Thanks!

Alex

>
> Regards,
> Christian.
>
> > ---
> >   drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c | 3 +--
> >   1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c b/dr=
ivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c
> > index 447de8492594..6835dbb733a2 100644
> > --- a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c
> > +++ b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c
> > @@ -713,9 +713,8 @@ static void dcn21_resource_destruct(struct dcn21_re=
source_pool *pool)
> >                       pool->base.hubps[i] =3D NULL;
> >               }
> >
> > -             if (pool->base.irqs !=3D NULL) {
> > +             if (pool->base.irqs !=3D NULL)
> >                       dal_irq_service_destroy(&pool->base.irqs);
> > -             }
> >       }
> >
> >       for (i =3D 0; i < pool->base.res_cap->num_ddc; i++) {
>
