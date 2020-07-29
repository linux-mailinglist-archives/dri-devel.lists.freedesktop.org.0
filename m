Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F705231946
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jul 2020 08:01:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E42C6E442;
	Wed, 29 Jul 2020 06:01:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com
 [IPv6:2607:f8b0:4864:20::b41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 741FF6E442
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jul 2020 06:01:02 +0000 (UTC)
Received: by mail-yb1-xb41.google.com with SMTP id a34so6898002ybj.9
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 23:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pPAP8tFVyggCkghU1FLEalFz3aaGvBX3MxeIBkz/wg4=;
 b=qsnqGtE+/2u2l7YElw+Dkz4JbybI4NxyRG3b/A6OAJM5f6l/W71f70WDzPEK7pdcoX
 c0hXwyh1izUtDaj7n49AgmZbq9RRIUMxM8V+7arBP/JgcP05WvFL6pvOTSiUwE/12FuJ
 JlJeFLsXs92fT5fBbnJWImdL0x+vSgbcbi70X01k478GpJHBL2Pwu/jwXEtNlhV5z2c8
 lb7FTPfioekHnmt+8nuRr7wZ8eF/EM8ULZocASkw7FWqSCwTBnFsOBW1c7Rnz79DfMYr
 eQa+ugZCPp0HkaldNYESVTqDr3Zj0WlOSUTqG+Uifi5aW07fDf4f+tTVAun11prh5d8V
 mPaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pPAP8tFVyggCkghU1FLEalFz3aaGvBX3MxeIBkz/wg4=;
 b=tZUl3qUDldgG2gENqGNerBxMCQafNMcRP24G5HLCiJy6QtIh6nqeMsayfWNIZlvGjY
 paOhOjEwDdjZ4FL+8FjrwC/w/VixzsjBjVjWUrQVa2z20aQiYYMc2ePW0Nh1/a6eIwgC
 AlklYbtk4+E023x2Vtq1IbayHmNvx7lL6uEsOMTeFHQxpLIoJlNxZowZ6vMFAIU5XP/5
 QMCw6qGJd+Fqnb1SDWw+2nHjniAk/hAw3UOfCrgzWIoWAjmaAikSTd1y5RveGGMaFMnj
 mJuFzFqnzsTbxjIOGge10JZcQTn/j2PixzhYs296naCfZSIRq6BFAlhz8bRUheKCLKl+
 xbgw==
X-Gm-Message-State: AOAM530b6CC2PymqjdAtD4an0szVSjtdTaadrx9VXOPJlTaZIviJ3JS+
 VvT6HDLOVXuJ5qbs+px+3+ZDXHcgZOrzIFIyR5E=
X-Google-Smtp-Source: ABdhPJwQmBOButyrx6n5MeOUjG5GJ1lj7tp3La8DET0PMqVBmUXPO01BHI+fR71wB5fUDJteRto3PCfv+4WSD/p1my4=
X-Received: by 2002:a25:cc46:: with SMTP id l67mr17910262ybf.283.1596002461629; 
 Tue, 28 Jul 2020 23:01:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200728032545.19878-1-airlied@gmail.com>
 <14063C7AD467DE4B82DEDB5C278E866301245EE4F7@FMSMSX108.amr.corp.intel.com>
 <CACAvsv6_V4jhKra4wY32h5chheBddyZDzPWZHHOzsQn+UZLfQQ@mail.gmail.com>
 <14063C7AD467DE4B82DEDB5C278E866301245EEBD6@FMSMSX108.amr.corp.intel.com>
In-Reply-To: <14063C7AD467DE4B82DEDB5C278E866301245EEBD6@FMSMSX108.amr.corp.intel.com>
From: Ben Skeggs <skeggsb@gmail.com>
Date: Wed, 29 Jul 2020 16:00:50 +1000
Message-ID: <CACAvsv7-yt=8oxZXTnjcT-Z9TqwUdf01kzzs0NV8yYG0uA0OyQ@mail.gmail.com>
Subject: Re: [PATCH] nouveau: use ttm populate mapping functions. (v2)
To: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
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
Cc: "bskeggs@redhat.com" <bskeggs@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1526233369=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1526233369==
Content-Type: multipart/alternative; boundary="000000000000c93f1b05ab8e47ce"

--000000000000c93f1b05ab8e47ce
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 29 Jul 2020 at 06:33, Ruhl, Michael J <michael.j.ruhl@intel.com>
wrote:

> >-----Original Message-----
> >From: Ben Skeggs <skeggsb@gmail.com>
> >Sent: Tuesday, July 28, 2020 4:16 PM
> >To: Ruhl, Michael J <michael.j.ruhl@intel.com>
> >Cc: Dave Airlie <airlied@gmail.com>; dri-devel@lists.freedesktop.org;
> >bskeggs@redhat.com
> >Subject: Re: [PATCH] nouveau: use ttm populate mapping functions. (v2)
> >
> >On Wed, 29 Jul 2020 at 02:08, Ruhl, Michael J <michael.j.ruhl@intel.com>
> >wrote:
> >>
> >> >-----Original Message-----
> >> >From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf O=
f
> >> >Dave Airlie
> >> >Sent: Monday, July 27, 2020 11:26 PM
> >> >To: dri-devel@lists.freedesktop.org
> >> >Cc: bskeggs@redhat.com
> >> >Subject: [PATCH] nouveau: use ttm populate mapping functions. (v2)
> >> >
> >> >From: Dave Airlie <airlied@redhat.com>
> >> >
> >> >Instead of rolling driver copies of them.
> >> >
> >> >v2: cleanup return handling (Ben)
> >> >Signed-off-by: Dave Airlie <airlied@redhat.com>
> >> >---
> >> > drivers/gpu/drm/nouveau/nouveau_bo.c | 38 ++------------------------=
--
> >> > 1 file changed, 2 insertions(+), 36 deletions(-)
> >> >
> >> >diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c
> >> >b/drivers/gpu/drm/nouveau/nouveau_bo.c
> >> >index 7806278dce57..6ef5085c9a91 100644
> >> >--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> >> >+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> >> >@@ -1231,8 +1231,6 @@ nouveau_ttm_tt_populate(struct ttm_tt *ttm,
> >> >struct ttm_operation_ctx *ctx)
> >> >       struct ttm_dma_tt *ttm_dma =3D (void *)ttm;
> >> >       struct nouveau_drm *drm;
> >> >       struct device *dev;
> >> >-      unsigned i;
> >> >-      int r;
> >> >       bool slave =3D !!(ttm->page_flags & TTM_PAGE_FLAG_SG);
> >> >
> >> >       if (ttm->state !=3D tt_unpopulated)
> >> >@@ -1260,31 +1258,7 @@ nouveau_ttm_tt_populate(struct ttm_tt *ttm,
> >> >struct ttm_operation_ctx *ctx)
> >> >               return ttm_dma_populate((void *)ttm, dev, ctx);
> >> >       }
> >> > #endif
> >> >-
> >> >-      r =3D ttm_pool_populate(ttm, ctx);
> >> >-      if (r) {
> >> >-              return r;
> >> >-      }
> >> >-
> >> >-      for (i =3D 0; i < ttm->num_pages; i++) {
> >> >-              dma_addr_t addr;
> >> >-
> >> >-              addr =3D dma_map_page(dev, ttm->pages[i], 0, PAGE_SIZE=
,
> >> >-                                  DMA_BIDIRECTIONAL);
> >> >-
> >> >-              if (dma_mapping_error(dev, addr)) {
> >> >-                      while (i--) {
> >> >-                              dma_unmap_page(dev, ttm_dma-
> >> >>dma_address[i],
> >> >-                                             PAGE_SIZE,
> >> >DMA_BIDIRECTIONAL);
> >> >-                              ttm_dma->dma_address[i] =3D 0;
> >> >-                      }
> >> >-                      ttm_pool_unpopulate(ttm);
> >> >-                      return -EFAULT;
> >> >-              }
> >> >-
> >> >-              ttm_dma->dma_address[i] =3D addr;
> >> >-      }
> >> >-      return 0;
> >> >+      return ttm_populate_and_map_pages(dev, ttm_dma, ctx);
> >>
> >> This is not a completely straight code replacement.
> >>
> >> ttm_populate_and_map_pages() also has code to deal with pages that are
> >> contiguous (consolidates them).
> >>
> >> Is it possible that the nouveau HW can't handle a contiguous buffer
> larger
> >> than PAG_SIZE?
> >I think it's fine.  The function appears to consolidate the pages for
> >the dma_map_page() call, but otherwise leave dma_address[] in
> >PAGE_SIZE chunks, I don't believe anything else in the driver will
> >care.
>
> Ahh..  I misread it.   This is limiting the calls to dma_map_page().
> Instead
> of calling it for each page, just do it for the first one...
>
> Thanks for setting me straight. =F0=9F=98=8A
>
> Reviewed-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
>
Thanks for the review!  I've got the patch in my tree.

Ben.


>
> Mike
>
>
> >Ben.
> >
> >>
> >> Thanks,
> >>
> >> Mike
> >>
> >> > }
> >> >
> >> > static void
> >> >@@ -1293,7 +1267,6 @@ nouveau_ttm_tt_unpopulate(struct ttm_tt *ttm)
> >> >       struct ttm_dma_tt *ttm_dma =3D (void *)ttm;
> >> >       struct nouveau_drm *drm;
> >> >       struct device *dev;
> >> >-      unsigned i;
> >> >       bool slave =3D !!(ttm->page_flags & TTM_PAGE_FLAG_SG);
> >> >
> >> >       if (slave)
> >> >@@ -1316,14 +1289,7 @@ nouveau_ttm_tt_unpopulate(struct ttm_tt
> >*ttm)
> >> >       }
> >> > #endif
> >> >
> >> >-      for (i =3D 0; i < ttm->num_pages; i++) {
> >> >-              if (ttm_dma->dma_address[i]) {
> >> >-                      dma_unmap_page(dev, ttm_dma->dma_address[i],
> >> >PAGE_SIZE,
> >> >-                                     DMA_BIDIRECTIONAL);
> >> >-              }
> >> >-      }
> >> >-
> >> >-      ttm_pool_unpopulate(ttm);
> >> >+      ttm_unmap_and_unpopulate_pages(dev, ttm_dma);
> >> > }
> >> >
> >> > void
> >> >--
> >> >2.26.2
> >> >
> >> >_______________________________________________
> >> >dri-devel mailing list
> >> >dri-devel@lists.freedesktop.org
> >> >https://lists.freedesktop.org/mailman/listinfo/dri-devel
> >> _______________________________________________
> >> dri-devel mailing list
> >> dri-devel@lists.freedesktop.org
> >> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>

--000000000000c93f1b05ab8e47ce
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, 29 Jul 2020 at 06:33, Ruhl, Micha=
el J &lt;<a href=3D"mailto:michael.j.ruhl@intel.com">michael.j.ruhl@intel.c=
om</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">&gt;-----Original Message-----<br>
&gt;From: Ben Skeggs &lt;<a href=3D"mailto:skeggsb@gmail.com" target=3D"_bl=
ank">skeggsb@gmail.com</a>&gt;<br>
&gt;Sent: Tuesday, July 28, 2020 4:16 PM<br>
&gt;To: Ruhl, Michael J &lt;<a href=3D"mailto:michael.j.ruhl@intel.com" tar=
get=3D"_blank">michael.j.ruhl@intel.com</a>&gt;<br>
&gt;Cc: Dave Airlie &lt;<a href=3D"mailto:airlied@gmail.com" target=3D"_bla=
nk">airlied@gmail.com</a>&gt;; <a href=3D"mailto:dri-devel@lists.freedeskto=
p.org" target=3D"_blank">dri-devel@lists.freedesktop.org</a>;<br>
&gt;<a href=3D"mailto:bskeggs@redhat.com" target=3D"_blank">bskeggs@redhat.=
com</a><br>
&gt;Subject: Re: [PATCH] nouveau: use ttm populate mapping functions. (v2)<=
br>
&gt;<br>
&gt;On Wed, 29 Jul 2020 at 02:08, Ruhl, Michael J &lt;<a href=3D"mailto:mic=
hael.j.ruhl@intel.com" target=3D"_blank">michael.j.ruhl@intel.com</a>&gt;<b=
r>
&gt;wrote:<br>
&gt;&gt;<br>
&gt;&gt; &gt;-----Original Message-----<br>
&gt;&gt; &gt;From: dri-devel &lt;<a href=3D"mailto:dri-devel-bounces@lists.=
freedesktop.org" target=3D"_blank">dri-devel-bounces@lists.freedesktop.org<=
/a>&gt; On Behalf Of<br>
&gt;&gt; &gt;Dave Airlie<br>
&gt;&gt; &gt;Sent: Monday, July 27, 2020 11:26 PM<br>
&gt;&gt; &gt;To: <a href=3D"mailto:dri-devel@lists.freedesktop.org" target=
=3D"_blank">dri-devel@lists.freedesktop.org</a><br>
&gt;&gt; &gt;Cc: <a href=3D"mailto:bskeggs@redhat.com" target=3D"_blank">bs=
keggs@redhat.com</a><br>
&gt;&gt; &gt;Subject: [PATCH] nouveau: use ttm populate mapping functions. =
(v2)<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;From: Dave Airlie &lt;<a href=3D"mailto:airlied@redhat.com" ta=
rget=3D"_blank">airlied@redhat.com</a>&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;Instead of rolling driver copies of them.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;v2: cleanup return handling (Ben)<br>
&gt;&gt; &gt;Signed-off-by: Dave Airlie &lt;<a href=3D"mailto:airlied@redha=
t.com" target=3D"_blank">airlied@redhat.com</a>&gt;<br>
&gt;&gt; &gt;---<br>
&gt;&gt; &gt; drivers/gpu/drm/nouveau/nouveau_bo.c | 38 ++-----------------=
---------<br>
&gt;&gt; &gt; 1 file changed, 2 insertions(+), 36 deletions(-)<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c<br>
&gt;&gt; &gt;b/drivers/gpu/drm/nouveau/nouveau_bo.c<br>
&gt;&gt; &gt;index 7806278dce57..6ef5085c9a91 100644<br>
&gt;&gt; &gt;--- a/drivers/gpu/drm/nouveau/nouveau_bo.c<br>
&gt;&gt; &gt;+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c<br>
&gt;&gt; &gt;@@ -1231,8 +1231,6 @@ nouveau_ttm_tt_populate(struct ttm_tt *t=
tm,<br>
&gt;&gt; &gt;struct ttm_operation_ctx *ctx)<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct ttm_dma_tt *ttm_dma =3D (voi=
d *)ttm;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct nouveau_drm *drm;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct device *dev;<br>
&gt;&gt; &gt;-=C2=A0 =C2=A0 =C2=A0 unsigned i;<br>
&gt;&gt; &gt;-=C2=A0 =C2=A0 =C2=A0 int r;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bool slave =3D !!(ttm-&gt;page_flag=
s &amp; TTM_PAGE_FLAG_SG);<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ttm-&gt;state !=3D tt_unpopulat=
ed)<br>
&gt;&gt; &gt;@@ -1260,31 +1258,7 @@ nouveau_ttm_tt_populate(struct ttm_tt *=
ttm,<br>
&gt;&gt; &gt;struct ttm_operation_ctx *ctx)<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return =
ttm_dma_populate((void *)ttm, dev, ctx);<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; &gt; #endif<br>
&gt;&gt; &gt;-<br>
&gt;&gt; &gt;-=C2=A0 =C2=A0 =C2=A0 r =3D ttm_pool_populate(ttm, ctx);<br>
&gt;&gt; &gt;-=C2=A0 =C2=A0 =C2=A0 if (r) {<br>
&gt;&gt; &gt;-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return r;<br=
>
&gt;&gt; &gt;-=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;-<br>
&gt;&gt; &gt;-=C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt; ttm-&gt;num_pages; =
i++) {<br>
&gt;&gt; &gt;-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dma_addr_t a=
ddr;<br>
&gt;&gt; &gt;-<br>
&gt;&gt; &gt;-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 addr =3D dma=
_map_page(dev, ttm-&gt;pages[i], 0, PAGE_SIZE,<br>
&gt;&gt; &gt;-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DMA_BIDIRECTION=
AL);<br>
&gt;&gt; &gt;-<br>
&gt;&gt; &gt;-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (dma_mapp=
ing_error(dev, addr)) {<br>
&gt;&gt; &gt;-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 while (i--) {<br>
&gt;&gt; &gt;-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dma_unmap_page(dev, ttm_dma-<=
br>
&gt;&gt; &gt;&gt;dma_address[i],<br>
&gt;&gt; &gt;-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0PAGE_SIZE,<br>
&gt;&gt; &gt;DMA_BIDIRECTIONAL);<br>
&gt;&gt; &gt;-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ttm_dma-&gt;dma_address[i] =
=3D 0;<br>
&gt;&gt; &gt;-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 ttm_pool_unpopulate(ttm);<br>
&gt;&gt; &gt;-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 return -EFAULT;<br>
&gt;&gt; &gt;-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;-<br>
&gt;&gt; &gt;-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ttm_dma-&gt;=
dma_address[i] =3D addr;<br>
&gt;&gt; &gt;-=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;-=C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt;&gt; &gt;+=C2=A0 =C2=A0 =C2=A0 return ttm_populate_and_map_pages(dev, t=
tm_dma, ctx);<br>
&gt;&gt;<br>
&gt;&gt; This is not a completely straight code replacement.<br>
&gt;&gt;<br>
&gt;&gt; ttm_populate_and_map_pages() also has code to deal with pages that=
 are<br>
&gt;&gt; contiguous (consolidates them).<br>
&gt;&gt;<br>
&gt;&gt; Is it possible that the nouveau HW can&#39;t handle a contiguous b=
uffer larger<br>
&gt;&gt; than PAG_SIZE?<br>
&gt;I think it&#39;s fine.=C2=A0 The function appears to consolidate the pa=
ges for<br>
&gt;the dma_map_page() call, but otherwise leave dma_address[] in<br>
&gt;PAGE_SIZE chunks, I don&#39;t believe anything else in the driver will<=
br>
&gt;care.<br>
<br>
Ahh..=C2=A0 I misread it.=C2=A0 =C2=A0This is limiting the calls to dma_map=
_page().=C2=A0 Instead<br>
of calling it for each page, just do it for the first one...<br>
<br>
Thanks for setting me straight. =F0=9F=98=8A<br>
<br>
Reviewed-by: Michael J. Ruhl &lt;<a href=3D"mailto:michael.j.ruhl@intel.com=
" target=3D"_blank">michael.j.ruhl@intel.com</a>&gt;<br></blockquote><div>T=
hanks for the review!=C2=A0 I&#39;ve got the patch in my tree.</div><div><b=
r></div><div>Ben.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">
<br>
Mike<br>
<br>
<br>
&gt;Ben.<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt; Thanks,<br>
&gt;&gt;<br>
&gt;&gt; Mike<br>
&gt;&gt;<br>
&gt;&gt; &gt; }<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; static void<br>
&gt;&gt; &gt;@@ -1293,7 +1267,6 @@ nouveau_ttm_tt_unpopulate(struct ttm_tt =
*ttm)<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct ttm_dma_tt *ttm_dma =3D (voi=
d *)ttm;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct nouveau_drm *drm;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct device *dev;<br>
&gt;&gt; &gt;-=C2=A0 =C2=A0 =C2=A0 unsigned i;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bool slave =3D !!(ttm-&gt;page_flag=
s &amp; TTM_PAGE_FLAG_SG);<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (slave)<br>
&gt;&gt; &gt;@@ -1316,14 +1289,7 @@ nouveau_ttm_tt_unpopulate(struct ttm_tt=
<br>
&gt;*ttm)<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; &gt; #endif<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;-=C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt; ttm-&gt;num_pages; =
i++) {<br>
&gt;&gt; &gt;-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ttm_dma-=
&gt;dma_address[i]) {<br>
&gt;&gt; &gt;-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 dma_unmap_page(dev, ttm_dma-&gt;dma_address[i],<br>
&gt;&gt; &gt;PAGE_SIZE,<br>
&gt;&gt; &gt;-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DM=
A_BIDIRECTIONAL);<br>
&gt;&gt; &gt;-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;-=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; &gt;-<br>
&gt;&gt; &gt;-=C2=A0 =C2=A0 =C2=A0 ttm_pool_unpopulate(ttm);<br>
&gt;&gt; &gt;+=C2=A0 =C2=A0 =C2=A0 ttm_unmap_and_unpopulate_pages(dev, ttm_=
dma);<br>
&gt;&gt; &gt; }<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; void<br>
&gt;&gt; &gt;--<br>
&gt;&gt; &gt;2.26.2<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;_______________________________________________<br>
&gt;&gt; &gt;dri-devel mailing list<br>
&gt;&gt; &gt;<a href=3D"mailto:dri-devel@lists.freedesktop.org" target=3D"_=
blank">dri-devel@lists.freedesktop.org</a><br>
&gt;&gt; &gt;<a href=3D"https://lists.freedesktop.org/mailman/listinfo/dri-=
devel" rel=3D"noreferrer" target=3D"_blank">https://lists.freedesktop.org/m=
ailman/listinfo/dri-devel</a><br>
&gt;&gt; _______________________________________________<br>
&gt;&gt; dri-devel mailing list<br>
&gt;&gt; <a href=3D"mailto:dri-devel@lists.freedesktop.org" target=3D"_blan=
k">dri-devel@lists.freedesktop.org</a><br>
&gt;&gt; <a href=3D"https://lists.freedesktop.org/mailman/listinfo/dri-deve=
l" rel=3D"noreferrer" target=3D"_blank">https://lists.freedesktop.org/mailm=
an/listinfo/dri-devel</a><br>
</blockquote></div></div>

--000000000000c93f1b05ab8e47ce--

--===============1526233369==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1526233369==--
