Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 168E34F8F36
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 09:11:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0910010F8DC;
	Fri,  8 Apr 2022 07:11:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EA2110EC67;
 Thu,  7 Apr 2022 18:36:08 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id r13so12709253ejd.5;
 Thu, 07 Apr 2022 11:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=efsOEK74uxQH0g4CA1QrPFjgXzWZd0T4aU7euJISdQs=;
 b=qHBU2iY1gdx/BaLr7O+TicPwlIUJq0P588uTeJuPqy+p4jbqR3GT1rpakWQ1FwYg6H
 9vCwzfhEX0k156qWY/2XNSeYGmSd+MeAcVfgmpSZkWEEDrVAlSYDO1bJf4GsKoiTaRjf
 Fa6uMjaxFuznkMDuOwUBW9mfx0E4B415zukgiJ+u43lIQ1HG073zu3bRGzQNn8jh3/xu
 BacDAA/ttzHu3krCFUSLk7uV7HDep2eeb1v4hh9429ZgHcZioQUz/CXJMUrpgF/V/bPz
 GF9VD56SR/TnQU6QN1TXCBYbCC+grCuIO7qj6fgtCqnT+705f9ajUuS6Zy6AG4OIQpWZ
 UBnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=efsOEK74uxQH0g4CA1QrPFjgXzWZd0T4aU7euJISdQs=;
 b=lIXiT2Cd2VUBKfTos59kKnJ2AYzFHEgjG6MP3yz2NsMiVaBPF6pFSnfUZKO4/rnjxY
 IZUIRcD6Bkgl59XSYKIdntEgSbX3f1bMBmfmDAJxyYRYMVW2M6n/JkS33f+QNgVOivqM
 y15jnvvYzRBAF4Es52DopDccqIoa9fyLLMetqIDsiJs06SLEoHWHcS65oAGq1khFZNVS
 doN3i52uMPOnox4eQaIqXFjluU8hEZbT3YWyITbC67ajB8/U1R/wn9WaLczhOJOk3bXh
 wfFSFICK6V3pJi9EZDPCTsPgB+s9KITYESwvzUvZ7fhQa0pahHtMdHceQOZYhgiX2h/m
 NMwg==
X-Gm-Message-State: AOAM532GaUk9hv9CyXjjl1MqdBeJaCReU9H57L2iUxYfSXFuf/N10aJU
 AyVHU+NbZcJTBiDocTncEMmKFRzTjSG6s6Epyys=
X-Google-Smtp-Source: ABdhPJxy1jWI5CERHD0x1aaFsei6BQ4Qn3oXT1cfmvk0+B0UJyjaV5LYpzZPw2p9s5subhfYioZotT1XZiWr7wT7vpI=
X-Received: by 2002:a17:906:7947:b0:6da:892f:2503 with SMTP id
 l7-20020a170906794700b006da892f2503mr14421854ejo.710.1649356566868; Thu, 07
 Apr 2022 11:36:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220406165057.97492-1-h0tc0d3@gmail.com>
 <26951c45-f742-2f0e-f4a6-281a031c3471@gmail.com>
 <CADnq5_NXzEzo=6adPQzEBrAGtWfegyvi=yGHVVOsb+3r9OiNaQ@mail.gmail.com>
In-Reply-To: <CADnq5_NXzEzo=6adPQzEBrAGtWfegyvi=yGHVVOsb+3r9OiNaQ@mail.gmail.com>
From: =?UTF-8?B?0JPRgNC40LPQvtGA0LjQuQ==?= <h0tc0d3@gmail.com>
Date: Thu, 7 Apr 2022 21:36:05 +0300
Message-ID: <CAD5ugGDe1SnjEKfoJp0yS8BM-PPc=dOJ+7u-eEkMH0pSOTyFZg@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Fix code with incorrect enum type
To: Alex Deucher <alexdeucher@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 08 Apr 2022 07:11:00 +0000
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
Cc: Joseph Greathouse <Joseph.Greathouse@amd.com>,
 Guchun Chen <guchun.chen@amd.com>, David Airlie <airlied@linux.ie>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Melissa Wen <mwen@igalia.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Alex Deucher I will do it. Initially, I came across an error that
different enum types are used.
Now I looked at the files, and indeed AMDGPU_GFX_PIPE_PRIO_* is used
instead of AMDGPU_RING_PRIO_*.
The question remains whether it is worth increasing the priority to
AMDGPU_RING_PRIO_MAX=3D3 ?

Regards, Grigory.

=D1=87=D1=82, 7 =D0=B0=D0=BF=D1=80. 2022 =D0=B3. =D0=B2 20:46, Alex Deucher=
 <alexdeucher@gmail.com>:
>
> On Thu, Apr 7, 2022 at 2:21 AM Christian K=C3=B6nig
> <ckoenig.leichtzumerken@gmail.com> wrote:
> >
> > Am 06.04.22 um 18:50 schrieb Grigory Vasilyev:
> > > Instead of the 'amdgpu_ring_priority_level' type,
> > > the 'amdgpu_gfx_pipe_priority' type was used,
> > > which is an error when setting ring priority.
> > > This is a minor error, but may cause problems in the future.
> > >
> > > Instead of AMDGPU_RING_PRIO_2 =3D 2, we can use AMDGPU_RING_PRIO_MAX =
=3D 3,
> > > but AMDGPU_RING_PRIO_2 =3D 2 is used for compatibility with
> > > AMDGPU_GFX_PIPE_PRIO_HIGH =3D 2, and not change the behavior of the
> > > code.
> > >
> > > Signed-off-by: Grigory Vasilyev <h0tc0d3@gmail.com>
> >
> > Good catch, Acked-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> >
> > > ---
> > >   drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c b/drivers/gpu/drm/=
amd/amdgpu/gfx_v8_0.c
> > > index 5554084ec1f1..9bc26395f833 100644
> > > --- a/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
> > > +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
> > > @@ -1929,7 +1929,7 @@ static int gfx_v8_0_compute_ring_init(struct am=
dgpu_device *adev, int ring_id,
> > >               + ring->pipe;
> > >
> > >       hw_prio =3D amdgpu_gfx_is_high_priority_compute_queue(adev, rin=
g) ?
> > > -                     AMDGPU_GFX_PIPE_PRIO_HIGH : AMDGPU_RING_PRIO_DE=
FAULT;
> > > +                     AMDGPU_RING_PRIO_2 : AMDGPU_RING_PRIO_DEFAULT;
>
> gfx_v8_0.c, gfx_v9_0.c, gfx_v10_0.c all do this.  Care to fix them all up=
?
>
> Alex
>
> > >       /* type-2 packets are deprecated on MEC, use type-3 instead */
> > >       r =3D amdgpu_ring_init(adev, ring, 1024, &adev->gfx.eop_irq, ir=
q_type,
> > >                            hw_prio, NULL);
> >
