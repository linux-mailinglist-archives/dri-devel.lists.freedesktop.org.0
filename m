Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C1D34F8680
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 19:46:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12A6B10EC0F;
	Thu,  7 Apr 2022 17:46:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AAB710EC0F;
 Thu,  7 Apr 2022 17:46:17 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id r8so6391728oib.5;
 Thu, 07 Apr 2022 10:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=kckLnLuecUYcAuxBtICpKDRrQ9GlihWSL3S+Wrg2yNI=;
 b=qz/L7HMW5FWMU9PnysBussxrdFIj6na0FNFo0tIYMWuPOv7leY+GD2TUH5fXzeyAUF
 AfTXBfiqczCkc9Vr+oeCXg4vvcceXirEc/Y0dOf+1k2lFE9jIOUeG5Bq0HxXzKe77wif
 9z53vYpUnA0ZNSH1NUnuhvJm3TVpZ9OFFwZvSCMTaix0QOTLALnWiz2kiw0nFk3oNwdP
 x/dtGSPAHPtPn1bTDG/MHjH5Q7lEyIhGElvJr+gJgSl7E1VYcrryWz1jb6oKddRCDWPT
 W/wqjGVprJ48lba3zeG39FSqvFVr79eLVekPBP2EE+M4WQjY7j5SbDDp17J73K4X/Bb+
 ckPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=kckLnLuecUYcAuxBtICpKDRrQ9GlihWSL3S+Wrg2yNI=;
 b=SCvA2RUfeSI3ECtuHVaBMMyudt/xBS1haKzuKQ4UiGbzShr1zC4/zw/PzT8HDsbyB2
 oH3KYPiyIEFF/2NlzEZDLhkm9EguXa5CveY9jMdx3YPtQp3eUcqp04BMbumbA8kQy+If
 +x2otkhs/L95FBH5c212HNMcg79mJFNPpntfdfgj7UBk2yqczy7ErUZjB4PwOdB3pUQ0
 Llwl2BQuwE4RTKU93hWvvZJR0XQC0akSOxQHt7e1PGU1Js6rahGcoRh90IYBGcfr6ApX
 4/2lJlSElJK9LINorhp43iuRmLPcNppXnTSjsomiQJfbBj2HbZPtP60eS6THUwScX0/R
 TnPA==
X-Gm-Message-State: AOAM532hFx2Ba3lvJsNji0i76SsFAs5YMXSEW7ji12eYKqpKPktpW0t+
 Vq6m9Ldzyh/HzmDO79Z3dIJEQoVR0UwGxqfXR0Y=
X-Google-Smtp-Source: ABdhPJx3mMJs6xssQJ/peuDcZMDi6IZivTlWc2wFhiBWvW2T6mN3TfUUvic2qm4/MuGOmUSaYBlzozUg+53lqkWfwNw=
X-Received: by 2002:a05:6808:2390:b0:2f9:c718:80e0 with SMTP id
 bp16-20020a056808239000b002f9c71880e0mr446338oib.253.1649353576369; Thu, 07
 Apr 2022 10:46:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220406165057.97492-1-h0tc0d3@gmail.com>
 <26951c45-f742-2f0e-f4a6-281a031c3471@gmail.com>
In-Reply-To: <26951c45-f742-2f0e-f4a6-281a031c3471@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 7 Apr 2022 13:46:05 -0400
Message-ID: <CADnq5_NXzEzo=6adPQzEBrAGtWfegyvi=yGHVVOsb+3r9OiNaQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Fix code with incorrect enum type
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
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
Cc: Joseph Greathouse <Joseph.Greathouse@amd.com>,
 Guchun Chen <guchun.chen@amd.com>, Grigory Vasilyev <h0tc0d3@gmail.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Melissa Wen <mwen@igalia.com>,
 David Airlie <airlied@linux.ie>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 7, 2022 at 2:21 AM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Am 06.04.22 um 18:50 schrieb Grigory Vasilyev:
> > Instead of the 'amdgpu_ring_priority_level' type,
> > the 'amdgpu_gfx_pipe_priority' type was used,
> > which is an error when setting ring priority.
> > This is a minor error, but may cause problems in the future.
> >
> > Instead of AMDGPU_RING_PRIO_2 =3D 2, we can use AMDGPU_RING_PRIO_MAX =
=3D 3,
> > but AMDGPU_RING_PRIO_2 =3D 2 is used for compatibility with
> > AMDGPU_GFX_PIPE_PRIO_HIGH =3D 2, and not change the behavior of the
> > code.
> >
> > Signed-off-by: Grigory Vasilyev <h0tc0d3@gmail.com>
>
> Good catch, Acked-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>
> > ---
> >   drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c b/drivers/gpu/drm/am=
d/amdgpu/gfx_v8_0.c
> > index 5554084ec1f1..9bc26395f833 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
> > @@ -1929,7 +1929,7 @@ static int gfx_v8_0_compute_ring_init(struct amdg=
pu_device *adev, int ring_id,
> >               + ring->pipe;
> >
> >       hw_prio =3D amdgpu_gfx_is_high_priority_compute_queue(adev, ring)=
 ?
> > -                     AMDGPU_GFX_PIPE_PRIO_HIGH : AMDGPU_RING_PRIO_DEFA=
ULT;
> > +                     AMDGPU_RING_PRIO_2 : AMDGPU_RING_PRIO_DEFAULT;

gfx_v8_0.c, gfx_v9_0.c, gfx_v10_0.c all do this.  Care to fix them all up?

Alex

> >       /* type-2 packets are deprecated on MEC, use type-3 instead */
> >       r =3D amdgpu_ring_init(adev, ring, 1024, &adev->gfx.eop_irq, irq_=
type,
> >                            hw_prio, NULL);
>
