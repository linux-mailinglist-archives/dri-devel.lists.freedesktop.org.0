Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DDBD39DDCC
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jun 2021 15:38:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EA6C6E107;
	Mon,  7 Jun 2021 13:38:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 898456E107
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jun 2021 13:38:04 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id
 v27-20020a056830091bb02903cd67d40070so13633270ott.1
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Jun 2021 06:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Xl04dvqDeOpNgt2rlTFMEUA1A8EWZjEtLSeJ/iMfZJ4=;
 b=DrhXHITHY3bjzw7iBg0F/ih9xxUu2RVBVRFfeTJ6cVdxwhFBg5xejunVYUmdlLNC26
 pKuHKSjphvpFBAnYmxr/Yd2DcF4fYrQut2hohu/jNUWdDiqADeXxy2nJt9uhWcm6/TlK
 /KpsUoxa4rFRCUOyuBbevNwglvmLNrXU5cXheMDmo8Eq+mJhr5FVtEfum+8mHu5kn50w
 b51vNAyeLnY9eUBhNjaCWfaDC41KopyNH3Ey6i1rdRjH0S9ROHIXmDwPB25Ooh5lyXNG
 As3p1GSAt/B/+BWM19YD1wZA0le9LrQNOjJfOdK9xQTJneGQZDP11Kk79GxoU7ZpPn7G
 O4bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Xl04dvqDeOpNgt2rlTFMEUA1A8EWZjEtLSeJ/iMfZJ4=;
 b=twzB7g/Sh+aOW/go1q9r7j+/kN4Z6QXvWAfdXtwQtz9Gh+hassJNA2U0/WxAG9XkxD
 MkEcOIychaARBWKC9EqKU03iU/Sixp1TpKkxtrfmGRzCTsHy/I4lavFiSQbtwQlAL28P
 39zV1AaiQUzCi6nynV96LPEoxBNX+EhEBTK8KSTgWPcnz1yNOuI+oaE1RqtaIHxyqvvw
 e0AcOIrHjVyq+nWELRhTLFuUsopJQdrmzC2MDNHJnAs/l2pEiFWeG9OUhGXJRlgKLmlE
 lGXxOafz4Xwrd6vuOAy9LVvd4jALlrDKGOhCS9KVt+AZTBYkfVofqdP5Qm8G8O/HCM/Q
 U7qA==
X-Gm-Message-State: AOAM5338mI9Mq0oATKgBbyvMZEB3vVQZ4djKJ3COMG0YEdbeWwgXGxh0
 rHUs2g68b9T0Qq5DJ+tFgGZlebiAmfMyP+TMpFlvupeS
X-Google-Smtp-Source: ABdhPJxXTjwy0KMPW/8M29iazVzyNg1WD3Ez3/oT3TFhM8TnpKziB7fM1XsK5A5w8agTHE3YKj+IVZqG8aUcWMKBXcg=
X-Received: by 2002:a05:6830:1e64:: with SMTP id
 m4mr11052618otr.23.1623073083791; 
 Mon, 07 Jun 2021 06:38:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210607070658.11586-1-christian.koenig@amd.com>
 <b9d6384d-bbc4-001c-68b1-5137218c9846@gmail.com>
In-Reply-To: <b9d6384d-bbc4-001c-68b1-5137218c9846@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 7 Jun 2021 09:37:52 -0400
Message-ID: <CADnq5_Orcb0ysBWBnUf5oyRrp5xjMdMqP-+Aijtke4xsAqBOqA@mail.gmail.com>
Subject: Re: [PATCH] RDMA/umem: fix missing automated rename
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Jason Ekstrand <jason@jlekstrand.net>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

On Mon, Jun 7, 2021 at 7:01 AM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Ping. Can anybody give me a quick rb or ack-by?
>
> The driver currently doesn't compile without this on the drm-misc-next
> branch.
>
> Thanks,
> Christian.
>
> Am 07.06.21 um 09:06 schrieb Christian K=C3=B6nig:
> > This occasions was missed during the recent rename of the function.
> >
> > Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> > Reported-by: kernel test robot <lkp@intel.com>
> > Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > ---
> >   drivers/infiniband/core/umem_dmabuf.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/infiniband/core/umem_dmabuf.c b/drivers/infiniband=
/core/umem_dmabuf.c
> > index 0d65ce146fc4..c6e875619fac 100644
> > --- a/drivers/infiniband/core/umem_dmabuf.c
> > +++ b/drivers/infiniband/core/umem_dmabuf.c
> > @@ -66,7 +66,7 @@ int ib_umem_dmabuf_map_pages(struct ib_umem_dmabuf *u=
mem_dmabuf)
> >        * may be not up-to-date. Wait for the exporter to finish
> >        * the migration.
> >        */
> > -     fence =3D dma_resv_get_excl(umem_dmabuf->attach->dmabuf->resv);
> > +     fence =3D dma_resv_excl_fence(umem_dmabuf->attach->dmabuf->resv);
> >       if (fence)
> >               return dma_fence_wait(fence, false);
> >
>
