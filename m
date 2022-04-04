Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C92E4F1409
	for <lists+dri-devel@lfdr.de>; Mon,  4 Apr 2022 13:48:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 968BE10F099;
	Mon,  4 Apr 2022 11:48:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC2D710F099
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Apr 2022 11:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649072881;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RTroqqfcI2MDqWqbKgh6wbTef7dlVoQDzw8gA9QgLOo=;
 b=h9Ey3quBvWDwyLNBGO2IYTZY+vlmCZQc7/ExNtSp3C9O2aIvFKk/fvNcKXsb+eJBbOwd4A
 A4jK8Vo8c/jC3J5PCltpUUdOUA6EDOSmbpVGz776xGGA1aesC/jvmZNtMraF98wnfihhBR
 IXj/+Ki7jxJ7u6hxruujbnzfl8tWW20=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-492-6SwW7F4iPT2mCEfVsRu3BQ-1; Mon, 04 Apr 2022 07:47:59 -0400
X-MC-Unique: 6SwW7F4iPT2mCEfVsRu3BQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 u30-20020adfa19e000000b00206153b3cceso445051wru.1
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Apr 2022 04:47:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=RTroqqfcI2MDqWqbKgh6wbTef7dlVoQDzw8gA9QgLOo=;
 b=H3e2QHQ+AOS7WnF6BUjJvgI/teedl9CnWB1hnT7dxMidSAAzaqW5VNy/irdaQOT40y
 gYFJibVFuy+fTpB5/g6oWPDJjIrTsia9UKak/oyQW8PsIwUOvgJ88E3hRBmvKdxj7r6/
 Rs70i/U+Xr1QRthPYHxtMPkAtHg5sCC5W/WZBePoWKaBjqUTLP+Fet6zUPzfaF7IA8vV
 oq3BBQOuOK7h9sCkXfnreyzJNGOt3u1NhzBI4HT2zef05cBqxKVggnWveb+LC4u7dkNg
 fkKZZMJPh9iiDMB+hxRb8OIi4gK+XJ5WEEeq+8YoB/0iTLumUNtpUMImFlrorKzKSTlO
 SU3w==
X-Gm-Message-State: AOAM530IhDww49d1b7Ng25tNgM5MS2VkFQsO0bmyZ9lVwZsKA+zEw+qD
 xjtWSZROIVBLqy35KPkPp5mSE7yRSIIgBt8Wsg9Sp4katqGDoqNq2volWpFhMV5FBxa3kfcOCCw
 OuPtCah8ex2++pmAk3CmLtVweZqfXeVoSB8iwE0pdbfbh
X-Received: by 2002:a5d:58d7:0:b0:206:f0f:18d5 with SMTP id
 o23-20020a5d58d7000000b002060f0f18d5mr4382179wrf.271.1649072878708; 
 Mon, 04 Apr 2022 04:47:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwfRniqq9oqHEt+AqH3PzMdEl+bXOMrnTFH6QrcmXHaI3SOtDHTkoB5JjP9e+7HlHoWE4/n4Er3zYtwjoxKlo8=
X-Received: by 2002:a5d:58d7:0:b0:206:f0f:18d5 with SMTP id
 o23-20020a5d58d7000000b002060f0f18d5mr4382168wrf.271.1649072878518; Mon, 04
 Apr 2022 04:47:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220321135856.1331-1-christian.koenig@amd.com>
 <20220321135856.1331-6-christian.koenig@amd.com>
 <b9eb079c-3ec3-6095-92ab-5dbfab88d327@amd.com>
In-Reply-To: <b9eb079c-3ec3-6095-92ab-5dbfab88d327@amd.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Mon, 4 Apr 2022 13:47:47 +0200
Message-ID: <CACO55ttbz2vtr_3F=koenYW0S_238_FHXZ_w=r+i_X49ke+BYg@mail.gmail.com>
Subject: Re: [PATCH 06/23] drm/nouveau: stop using dma_resv_excl_fence
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 nouveau <nouveau@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Apr 3, 2022 at 5:59 PM Christian K=C3=B6nig <christian.koenig@amd.c=
om> wrote:
>
> Just a gentle ping to the nouveau guys.
>
> Any more comments on this? Otherwise I'm pushing that with Daniels rb.
>

It looks fine, but given that this area broke in the past I will try
to do some testing either before or after you push it. As long as we
do so before 5.19 it should be okay I think.

Unless somebody knowing more about this code has anything else to say.

> Thanks,
> Christian.
>
> Am 21.03.22 um 14:58 schrieb Christian K=C3=B6nig:
> > Instead use the new dma_resv_get_singleton function.
> >
> > Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Cc: Ben Skeggs <bskeggs@redhat.com>
> > Cc: Karol Herbst <kherbst@redhat.com>
> > Cc: Lyude Paul <lyude@redhat.com>
> > Cc: nouveau@lists.freedesktop.org
> > ---
> >   drivers/gpu/drm/nouveau/nouveau_bo.c | 9 ++++++++-
> >   1 file changed, 8 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nou=
veau/nouveau_bo.c
> > index fa73fe57f97b..74f8652d2bd3 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> > @@ -959,7 +959,14 @@ nouveau_bo_vm_cleanup(struct ttm_buffer_object *bo=
,
> >   {
> >       struct nouveau_drm *drm =3D nouveau_bdev(bo->bdev);
> >       struct drm_device *dev =3D drm->dev;
> > -     struct dma_fence *fence =3D dma_resv_excl_fence(bo->base.resv);
> > +     struct dma_fence *fence;
> > +     int ret;
> > +
> > +     /* TODO: This is actually a memory management dependency */
> > +     ret =3D dma_resv_get_singleton(bo->base.resv, false, &fence);
> > +     if (ret)
> > +             dma_resv_wait_timeout(bo->base.resv, false, false,
> > +                                   MAX_SCHEDULE_TIMEOUT);
> >
> >       nv10_bo_put_tile_region(dev, *old_tile, fence);
> >       *old_tile =3D new_tile;
>

