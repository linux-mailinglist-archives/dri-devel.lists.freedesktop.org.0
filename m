Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80523751CEF
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 11:14:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 470D910E659;
	Thu, 13 Jul 2023 09:14:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB3DB10E659
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 09:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689239641;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EINzy8OMuu+nLPtYF3xlSMnhvtIBY4/1ybYAlD/eApY=;
 b=brHT9VF5+hC27HdZhBQDKAsNOvAR4HygczAtGQ2k9fY86qTooSxFdXkVY6a2nULRsnKaqT
 3dfHAMGKjKTxgslKsH4G4ZRxCsabFWOvZHMmc5VaCVwVZiox+OtCnWACJ5AU+FcrItyyEU
 SzehCdHbemEmicUuHt+hkP+F8JDWg+4=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-370-SRa9oMFAMiOIW1iZTsnskQ-1; Thu, 13 Jul 2023 05:14:00 -0400
X-MC-Unique: SRa9oMFAMiOIW1iZTsnskQ-1
Received: by mail-lj1-f198.google.com with SMTP id
 38308e7fff4ca-2a7a6393ba6so687961fa.1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 02:14:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689239639; x=1691831639;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EINzy8OMuu+nLPtYF3xlSMnhvtIBY4/1ybYAlD/eApY=;
 b=bxGm+nVUxLugd1/75KYyoL/Mvth9R7Jg/DYMJrSh/fBlAOV4zxwXOO6jQ2LkgWeNWP
 0qaXFlOXQLj8TFxEWlxmAzV72VPAnRtcS9LdMStIAy2ob4Jz9nRCGDYVztP4LwxvZhKb
 8vpYXQIkqWzLEqGbyhvc0UPnLxRJJg/Yhx9BJ4imqzZeFgLRog+2MYPj01tK/6wKiBV0
 jr5OSn/QNQrt9Z+4eUuQ0727zlCJZNj/YQQsORmR6tvANPrSZiGLMFeoop26Gb++JWYe
 nGhLg9R7AWS13TWqz/nRPflWuF0aSTjwNnwW/PsFcdOa/tPrHlxaNBxw+GFMOy/FCwXJ
 zr7w==
X-Gm-Message-State: ABy/qLaQw2COqRvp3yT6NhF04vzO2j4UZww2Ld4G7Ec9PUlqfRws3KAZ
 mlEBU6di4/1fg234Xbj7Zm7PRPJoSEUTkLXtAK5tABCZQepFX0KjbkJSkrYr5RzYCPDApYzjiUE
 PRdzNPqT/FGgbjHtWcSieO+T+VsbHZMwbO7YSj23eiycc
X-Received: by 2002:a05:651c:198a:b0:2b6:120a:af65 with SMTP id
 bx10-20020a05651c198a00b002b6120aaf65mr1098586ljb.3.1689239639063; 
 Thu, 13 Jul 2023 02:13:59 -0700 (PDT)
X-Google-Smtp-Source: APBJJlF9pWLznHO6dCvVxwuohZtwG1kEt1OdgiJxyzIeD3eMvB3IqEKi9luli955rnWYGXvh91SLOIVoA6r9lksfANY=
X-Received: by 2002:a05:651c:198a:b0:2b6:120a:af65 with SMTP id
 bx10-20020a05651c198a00b002b6120aaf65mr1098567ljb.3.1689239638795; Thu, 13
 Jul 2023 02:13:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230710070505.53916-1-xujianghui@cdjrlc.com>
 <1ddf673283e93e83d912066f2241b976@208suo.com>
 <ZKvK4NXzkKZTE35E@debian.me>
In-Reply-To: <ZKvK4NXzkKZTE35E@debian.me>
From: Karol Herbst <kherbst@redhat.com>
Date: Thu, 13 Jul 2023 11:13:47 +0200
Message-ID: <CACO55tuG+4=4MTGq=FRuuP8dJaAHwtMCy3e9H8v5d8dVGsnkJw@mail.gmail.com>
Subject: Re: [PATCH] drm/nouveau/iccsense:
To: Bagas Sanjaya <bagasdotme@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: sunran001@208suo.com, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 10, 2023 at 11:10=E2=80=AFAM Bagas Sanjaya <bagasdotme@gmail.co=
m> wrote:
>
> On Mon, Jul 10, 2023 at 03:06:47PM +0800, sunran001@208suo.com wrote:
> > Fixed error: 'do not use assignment in if condition'
> >
> > This patch fixes error: 'do not use assignment in if condition'
> > in drm/nouveau/iccsense
>
> I guess this is checkpatch fix, right?
>
> >
> > Signed-off-by: Ran Sun <sunran001@208suo.com>
> > ---
> >  drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c
> > b/drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c
> > index 8f0ccd3664eb..2428f3d6e477 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c
> > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c
> > @@ -322,7 +322,8 @@ int
> >  nvkm_iccsense_new_(struct nvkm_device *device, enum nvkm_subdev_type t=
ype,
> > int inst,
> >             struct nvkm_iccsense **iccsense)
> >  {
> > -    if (!(*iccsense =3D kzalloc(sizeof(**iccsense), GFP_KERNEL)))
> > +    *iccsense =3D kzalloc(sizeof(**iccsense), GFP_KERNEL);
> > +    if (!*iccsense)
> >          return -ENOMEM;
> >      INIT_LIST_HEAD(&(*iccsense)->sensors);
> >      INIT_LIST_HEAD(&(*iccsense)->rails);
>
> Your patch is corrupted (tabs converted to spaces) because you're using
> Roundcube. Please use git-send-mail(1) instead.
>

oh right, I didn't notice with the patches I reviewed already here.
Yeah, none of them apply, please use git to send those patches.

> Thanks.
>
> --
> An old man doll... just what I always wanted! - Clara

