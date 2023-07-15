Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2959A7547DE
	for <lists+dri-devel@lfdr.de>; Sat, 15 Jul 2023 11:23:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F47110E0B1;
	Sat, 15 Jul 2023 09:23:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73BEC10E0BD
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Jul 2023 09:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689412996;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T67vF7lK28TebQE5iDVY482spLCTkCO2SL9TUb1C5Xo=;
 b=IuSiPzbggsQiiuqk5XnwUtbbt9FnP1lOGV4oZaro8lVrcuuPwafEkOZGLxZgrEEnIzvzg1
 YBWNQY3cMs8rQGOUu3n++H2a3RiryB51AVWIwZxCd5eRxBe/0ca1t7ZeFNCbmiIx3TInaw
 D9PWGj2dOD8iiWnFrX52sK6+vp5bgLI=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-462-Sg_lGNfhMtmqlZJRUOzKgg-1; Sat, 15 Jul 2023 05:23:14 -0400
X-MC-Unique: Sg_lGNfhMtmqlZJRUOzKgg-1
Received: by mail-lj1-f200.google.com with SMTP id
 38308e7fff4ca-2b72262fb80so4838711fa.0
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Jul 2023 02:23:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689412992; x=1690017792;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T67vF7lK28TebQE5iDVY482spLCTkCO2SL9TUb1C5Xo=;
 b=NREnmZN0dwu5SMllszd12D2itFBX8bZw600X94Cz+D2UNWDJMb/2JlLg8a/XSfSLtZ
 QIT0EuMkdJw9RJWChhuH6cCN+pShIM48RSvGX1Ylm5jZKurm6pPVv3ZtPLilkeQZnP29
 QaPXwnJIWbIdWFQFogYXTyMc7aVUWNa3TIFKvvPWQ48/kdrYmaK2E2JKPeWm9ROp5ola
 jCP75umzozRZLKEJR1Az+lsWPbj56NQROxw9hm0ysTZILCAeXCFhOx11iahUS4X5dMeT
 ZxqFhB6SMHZEcmovku9T9MCztSz+ZcHrCkGSy60x+F6qASmzi1mS8wpSwIjni/9Tgowh
 lAuw==
X-Gm-Message-State: ABy/qLaL5you4PizIdXkFZP//fSrqJiare625GJo3ss0lh3ocs43uBpK
 3U7OFyPnrxUxUjEvr3D5T86qJw3Pp+4eygKfKXb2ccHr6mUdR+9TDuK9nhSkvIrjHzep4LdmbkE
 neCU+oq1ydMfXgzhph7w59Lfk2NBVBna3GYq9MlfTLh20
X-Received: by 2002:a05:651c:2123:b0:2b6:a662:b879 with SMTP id
 a35-20020a05651c212300b002b6a662b879mr964534ljq.3.1689412992751; 
 Sat, 15 Jul 2023 02:23:12 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFalwUBzCDIhgeQM4PgOEFdZlcRiXI5UE3UZbzH859X91WuS1+9/Njeg/b/sg7vTRMDlagQb8LNWaQla49OP5g=
X-Received: by 2002:a05:651c:2123:b0:2b6:a662:b879 with SMTP id
 a35-20020a05651c212300b002b6a662b879mr964525ljq.3.1689412992377; Sat, 15 Jul
 2023 02:23:12 -0700 (PDT)
MIME-Version: 1.0
References: <5c894d0a8a178628ca200d054004be3c@208suo.com>
 <f25017a660f8a3a4e49258a1d96003dc@208suo.com>
 <2f4a7303e305d07fdd9c15a9dc95dc5f@208suo.com>
 <d0d767fb0dd3a9b7642559f379dbb0d6@208suo.com>
 <0ad4154429aaa41ca26da859c3f35784@208suo.com>
 <856d1130fad58062ea454da297fa64348382bda2.camel@redhat.com>
In-Reply-To: <856d1130fad58062ea454da297fa64348382bda2.camel@redhat.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Sat, 15 Jul 2023 11:23:01 +0200
Message-ID: <CACO55tu08XTx=TZQK=RyCGRdFVDQN9m+X+y3F3V0H7nuwyycRw@mail.gmail.com>
Subject: Re: [PATCH] drm/nouveau/fifo:Fix Nineteen occurrences of the gk104.c
 error: ERROR: : trailing statements should be on next line
To: Lyude Paul <lyude@redhat.com>
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
Cc: huzhi001@208suo.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bskeggs@redhat.com,
 nouveau@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jul 15, 2023 at 1:07=E2=80=AFAM Lyude Paul <lyude@redhat.com> wrote=
:
>
> NAK - checkpatch.pl is a (strongish) guideline, but not a rule. In the ca=
ses
> corrected in the patch series here, we format the switch cases on single =
lines
> as it dramatically improves the readability of what is otherwise just a /=
long/
> list of slightly different static mappings. I don't believe we're the onl=
y
> part of the kernel to do this either.
>

I wished there was a place to document something like "patches whose
only reason is 'checkpatch.pl' said so" will be rejected.

I think following some checkpatch rules are sane, but then the
argument should be "makes code more clear" or "converts risky coding
practises to less risky ones". Or do we have such a place? Maybe we
should patch checkpatch.pl instead to throw a warning

> On Fri, 2023-07-14 at 14:58 +0800, huzhi001@208suo.com wrote:
> > Signed-off-by: ZhiHu <huzhi001@208suo.com>
> > ---
> >   .../gpu/drm/nouveau/nvkm/engine/fifo/gk104.c  | 40 ++++++++++++++----=
-
> >   1 file changed, 29 insertions(+), 11 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/gk104.c
> > b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/gk104.c
> > index d8a4d773a58c..b99e0a7c96bb 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/gk104.c
> > +++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/gk104.c
> > @@ -137,15 +137,29 @@ gk104_ectx_bind(struct nvkm_engn *engn, struct
> > nvkm_cctx *cctx, struct nvkm_chan
> >       u64 addr =3D 0ULL;
> >
> >       switch (engn->engine->subdev.type) {
> > -    case NVKM_ENGINE_SW    : return;
> > -    case NVKM_ENGINE_GR    : ptr0 =3D 0x0210; break;
> > -    case NVKM_ENGINE_SEC   : ptr0 =3D 0x0220; break;
> > -    case NVKM_ENGINE_MSPDEC: ptr0 =3D 0x0250; break;
> > -    case NVKM_ENGINE_MSPPP : ptr0 =3D 0x0260; break;
> > -    case NVKM_ENGINE_MSVLD : ptr0 =3D 0x0270; break;
> > -    case NVKM_ENGINE_VIC   : ptr0 =3D 0x0280; break;
> > -    case NVKM_ENGINE_MSENC : ptr0 =3D 0x0290; break;
> > -    case NVKM_ENGINE_NVDEC :
> > +    case NVKM_ENGINE_SW:
> > +        return;
> > +    case NVKM_ENGINE_GR:
> > +        ptr0 =3D 0x0210;
> > +        break;
> > +    case NVKM_ENGINE_SEC:
> > +        ptr0 =3D 0x0220;
> > +        break;
> > +    case NVKM_ENGINE_MSPDEC:
> > +        ptr0 =3D 0x0250;
> > +        break;
> > +    case NVKM_ENGINE_MSPPP:
> > +        ptr0 =3D 0x0260;
> > +        break;
> > +    case NVKM_ENGINE_MSVLD:
> > +        ptr0 =3D 0x0270;
> > +        break;
> > +    case NVKM_ENGINE_VIC:
> > +        ptr0 =3D 0x0280; break;
> > +    case NVKM_ENGINE_MSENC:
> > +        ptr0 =3D 0x0290;
> > +        break;
> > +    case NVKM_ENGINE_NVDEC:
> >           ptr1 =3D 0x0270;
> >           ptr0 =3D 0x0210;
> >           break;
> > @@ -435,8 +449,12 @@ gk104_runl_commit(struct nvkm_runl *runl, struct
> > nvkm_memory *memory, u32 start,
> >       int target;
> >
> >       switch (nvkm_memory_target(memory)) {
> > -    case NVKM_MEM_TARGET_VRAM: target =3D 0; break;
> > -    case NVKM_MEM_TARGET_NCOH: target =3D 3; break;
> > +    case NVKM_MEM_TARGET_VRAM:
> > +        target =3D 0;
> > +        break;
> > +    case NVKM_MEM_TARGET_NCOH:
> > +        target =3D 3;
> > +        break;
>
> This one isn't very long, but I'd still say it's definitely a lot easier =
to
> read in the compact form. If anything, the only change I would make here =
is
> formatting the default: case to be on a single line as well
>
> >       default:
> >           WARN_ON(1);
> >           return;
>
> --
> Cheers,
>  Lyude Paul (she/her)
>  Software Engineer at Red Hat
>

