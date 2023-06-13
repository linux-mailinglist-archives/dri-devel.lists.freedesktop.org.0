Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9655672EDD1
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 23:23:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34B2610E3E1;
	Tue, 13 Jun 2023 21:23:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B152E10E3E1
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 21:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686691426;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EWsjugpohne5df5/X+6GB3p53oFQ5MGoNldK3p6P9vk=;
 b=UNYKXCS9WT6o9XpjpbQcwYRYtGER5gF1etrbl9OFsgSamRzsfXhM6FzIMMBHlnfPljW2c6
 kfYEkLc2oZW0nmjqMEUpcXLt0lR5gV5Is3zmb5MqftiW1j2P50htPlZNwImmhqP5EGAFkJ
 hAZvjjFHZ2qsTjwNIj9+bIEY1Ar+3O0=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-168-fdlhQipJMxeF5s9t9E4sUA-1; Tue, 13 Jun 2023 17:23:45 -0400
X-MC-Unique: fdlhQipJMxeF5s9t9E4sUA-1
Received: by mail-lj1-f198.google.com with SMTP id
 38308e7fff4ca-2b1b8ec9343so9501441fa.1
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 14:23:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686691424; x=1689283424;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EWsjugpohne5df5/X+6GB3p53oFQ5MGoNldK3p6P9vk=;
 b=GjkQHI81MzIfgjNktfgJPcGQJs4OuTLDET+C0MeC2nXGsrwHHh/Fi5TlCsp+QetS5G
 ojTg9RM/5iAOgPBnyhaNkqrcbL8Y7WALGrrG9SxOmaEJdab5EBPLs1BJpHh2PYJXQv8r
 MsRH/I4ZY1doM0E6cfJyrrCz1UKTabvM4dcJZ2yT8MadHTup60Vu9UQX2Yq437YQAyjj
 ZBqhh9zc2OPlYvNVnD8bVPew51I/Fj1hPVl6F1ci6H/dxqGK8SC13OebLnX7xFllRgwb
 uc+lleLqh0WpYqh79iQ19Tkgyi6rgh2/mdqgMU/Zdx2BMPJ2icGWaeb5x94ola/wT/y3
 H6rA==
X-Gm-Message-State: AC+VfDwIDCm3oyMMmpKCKzzhxwwGmRrc/beidrEGvDo4wk+yU1JmYTj3
 kE5LkfnObtHxuBBMLFaC5EpkMtz/ECl+JDxg9ldODWkgwtw627mVyALrsxnQoKAfcd0mprGmaDk
 1eqYjPJMvDm9YkHW7cn8ZE4x1zs7GLAHqegmPbHjDy/dC
X-Received: by 2002:a05:651c:169b:b0:2b1:e625:7e1b with SMTP id
 bd27-20020a05651c169b00b002b1e6257e1bmr6319978ljb.0.1686691424032; 
 Tue, 13 Jun 2023 14:23:44 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5AlCNoOaXbVxU5NOLaYc+4CaTl5SFp3/u3ykWEuLnEhB2JrvIcHz5LPSUIjytKMktVlyqAzKFlzlBmlBdkItY=
X-Received: by 2002:a05:651c:169b:b0:2b1:e625:7e1b with SMTP id
 bd27-20020a05651c169b00b002b1e6257e1bmr6319969ljb.0.1686691423715; Tue, 13
 Jun 2023 14:23:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230613210529.552098-1-lyude@redhat.com>
In-Reply-To: <20230613210529.552098-1-lyude@redhat.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Tue, 13 Jun 2023 23:23:32 +0200
Message-ID: <CACO55tvju6-pF-e9-Zx+7dNB1XKavaf74RW0yGheGzbM1w9nhg@mail.gmail.com>
Subject: Re: [PATCH] drm/nouveau/kms/nv50-: Fix drm_dp_remove_payload()
 invocation
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
Cc: Jani Nikula <jani.nikula@intel.com>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <nouveau@lists.freedesktop.org>, open list <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 Dave Airlie <airlied@redhat.com>, nouveau-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 13, 2023 at 11:05=E2=80=AFPM Lyude Paul <lyude@redhat.com> wrot=
e:
>
> We changed the semantics for this in:
>
> e761cc20946a ("drm/display/dp_mst: Handle old/new payload states in drm_d=
p_remove_payload()")
>
> But I totally forgot to update this properly in nouveau. So, let's do tha=
t.
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>

Reviewed-by: Karol Herbst <kherbst@redhat.com>

> ---
>  drivers/gpu/drm/nouveau/dispnv50/disp.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/no=
uveau/dispnv50/disp.c
> index 5bb777ff13130..1637e08b548c2 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> @@ -909,15 +909,19 @@ nv50_msto_prepare(struct drm_atomic_state *state,
>         struct nouveau_drm *drm =3D nouveau_drm(msto->encoder.dev);
>         struct nv50_mstc *mstc =3D msto->mstc;
>         struct nv50_mstm *mstm =3D mstc->mstm;
> -       struct drm_dp_mst_atomic_payload *payload;
> +       struct drm_dp_mst_topology_state *old_mst_state;
> +       struct drm_dp_mst_atomic_payload *payload, *old_payload;
>
>         NV_ATOMIC(drm, "%s: msto prepare\n", msto->encoder.name);
>
> +       old_mst_state =3D drm_atomic_get_old_mst_topology_state(state, mg=
r);
> +
>         payload =3D drm_atomic_get_mst_payload_state(mst_state, mstc->por=
t);
> +       old_payload =3D drm_atomic_get_mst_payload_state(old_mst_state, m=
stc->port);
>
>         // TODO: Figure out if we want to do a better job of handling VCP=
I allocation failures here?
>         if (msto->disabled) {
> -               drm_dp_remove_payload(mgr, mst_state, payload, payload);
> +               drm_dp_remove_payload(mgr, mst_state, old_payload, payloa=
d);
>
>                 nvif_outp_dp_mst_vcpi(&mstm->outp->outp, msto->head->base=
.index, 0, 0, 0, 0);
>         } else {
> --
> 2.40.1
>

