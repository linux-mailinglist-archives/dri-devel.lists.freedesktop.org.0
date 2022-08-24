Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB45559FD88
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 16:48:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E8E011AF1F;
	Wed, 24 Aug 2022 14:47:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com
 [IPv6:2607:f8b0:4864:20::1134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A29510E437
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Aug 2022 14:47:35 +0000 (UTC)
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-335624d1e26so466992867b3.4
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Aug 2022 07:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=Ss980jKeV/+inxRLWeDKg+qqYPK5OjBy43jtFVNG7+4=;
 b=FHWnBm5kFM2twUoHOLMK2lEwYnJJMPdBuk++FnamFC8ldvUmqstnSzcMGbcrM/TcLf
 5slHYGU/m36eSGEs1cnLkQCMvU5EDZru57pzpeS3wWBJYcQnwY/nAyjZw0e2bcPAXB43
 06MRZVyzOvko94HhZYNPKj7FwzIqHZ3h4V0NW1TRbz2DiDYLFlMRo3E1e9ZEyGx8pitV
 PV+33zCWwiFM/Wp2vqFIqrU53OBJebjdY51JeZuUkE8X4KM4878NkomA8CJlS1U84SFw
 gPrIOYc0r8cQVGAPOmLNaEJH1Dl/+QQZAzY2VpYR3pRd8IXO+4jtrZBgaei/onrvo/Rs
 Ld8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=Ss980jKeV/+inxRLWeDKg+qqYPK5OjBy43jtFVNG7+4=;
 b=kMx3tVeW+HzRaIHyoAjOO+XObJA/3qkVxHa4HjwaO5kquCb3yHB8PtDUvZlMu/hM7N
 PnPeLU21hBCmNfnT5qTezdHaSFFRiU6s3l62NBqetAcG+g2Nj4E1hLYNQn2DGKLutyrs
 a5QbML9eznzDILrwlTSpR6oUwmQx6XZJ6k0zi/1Jemsc+x90lY5XcciQM9HBquEvKF3I
 8pSUtqKe4XRmi5UAXsXcU0UcWC2Kix5V2FBIBRk396BaqC9+VAvMIU9NDtke1p3Uh4eL
 RyDCn7Q/jmRA35ImZIhPjjk0vzfvWyoqIz/11U6Kb5KhNa2IbfbGDYOEnslRs/+AfasW
 BswQ==
X-Gm-Message-State: ACgBeo3/Bnq4u/+Y+L0prK+LaCfVP9jQj4FUmof4yw7D5NRDPEjiWo/t
 vonu8ZtMY0r9RGMVltxBbrxMpxe5xZHjtGFdH4k/mw==
X-Google-Smtp-Source: AA6agR6CdDBf8D0OtXdEFPHd+z3oqtttugfVwqOhwxQh+FmSx2J8isX8iTUDqPMNNqrAlTPDYzlxla8YKnv7ajyGUNA=
X-Received: by 2002:a25:2f4a:0:b0:695:8b9a:1788 with SMTP id
 v71-20020a252f4a000000b006958b9a1788mr17276979ybv.126.1661352454980; Wed, 24
 Aug 2022 07:47:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220802210158.4162525-1-jason.ekstrand@collabora.com>
 <4e8657c4-54aa-ad16-3350-f81c610997f4@amd.com>
 <427467a1466ec7c56616661775d98102407f6fdb.camel@collabora.com>
In-Reply-To: <427467a1466ec7c56616661775d98102407f6fdb.camel@collabora.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Wed, 24 Aug 2022 09:47:23 -0500
Message-ID: <CAOFGe96pKaiH85ReT6y_V4vCKQjXz_hf2O7mqG89aiKXoFiF1w@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: Use dma_fence_unwrap_for_each when importing
 fences
To: Jason Ekstrand <jason.ekstrand@collabora.com>
Content-Type: multipart/alternative; boundary="000000000000ed23be05e6fdc224"
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
Cc: Sarah Walker <Sarah.Walker@imgtec.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000ed23be05e6fdc224
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 8, 2022 at 11:39 AM Jason Ekstrand <jason.ekstrand@collabora.co=
m>
wrote:

> On Sun, 2022-08-07 at 18:35 +0200, Christian K=C3=B6nig wrote:
> > Am 02.08.22 um 23:01 schrieb Jason Ekstrand:
> > > Ever since 68129f431faa ("dma-buf: warn about containers in
> > > dma_resv object"),
> > > dma_resv_add_shared_fence will warn if you attempt to add a
> > > container fence.
> > > While most drivers were fine, fences can also be added to a
> > > dma_resv via the
> > > recently added DMA_BUF_IOCTL_IMPORT_SYNC_FILE.  Use
> > > dma_fence_unwrap_for_each
> > > to add each fence one at a time.
> > >
> > > Fixes: 594740497e99 ("dma-buf: Add an API for importing sync files
> > > (v10)")
> > > Signed-off-by: Jason Ekstrand <jason.ekstrand@collabora.com>
> > > Reported-by: Sarah Walker <Sarah.Walker@imgtec.com>
> > > Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> > > ---
> > >   drivers/dma-buf/dma-buf.c | 23 +++++++++++++++++------
> > >   1 file changed, 17 insertions(+), 6 deletions(-)
> > >
> > > diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> > > index 630133284e2b..8d5d45112f52 100644
> > > --- a/drivers/dma-buf/dma-buf.c
> > > +++ b/drivers/dma-buf/dma-buf.c
> > > @@ -15,6 +15,7 @@
> > >   #include <linux/slab.h>
> > >   #include <linux/dma-buf.h>
> > >   #include <linux/dma-fence.h>
> > > +#include <linux/dma-fence-unwrap.h>
> > >   #include <linux/anon_inodes.h>
> > >   #include <linux/export.h>
> > >   #include <linux/debugfs.h>
> > > @@ -391,8 +392,10 @@ static long dma_buf_import_sync_file(struct
> > > dma_buf *dmabuf,
> > >                                      const void __user *user_data)
> > >   {
> > >         struct dma_buf_import_sync_file arg;
> > > -       struct dma_fence *fence;
> > > +       struct dma_fence *fence, *f;
> > >         enum dma_resv_usage usage;
> > > +       struct dma_fence_unwrap iter;
> > > +       unsigned int num_fences;
> > >         int ret =3D 0;
> > >
> > >         if (copy_from_user(&arg, user_data, sizeof(arg)))
> > > @@ -411,13 +414,21 @@ static long dma_buf_import_sync_file(struct
> > > dma_buf *dmabuf,
> > >         usage =3D (arg.flags & DMA_BUF_SYNC_WRITE) ?
> > > DMA_RESV_USAGE_WRITE :
> > >
> > > DMA_RESV_USAGE_READ;
> > >
> > > -       dma_resv_lock(dmabuf->resv, NULL);
> > > +       num_fences =3D 0;
> > > +       dma_fence_unwrap_for_each(f, &iter, fence)
> > > +               ++num_fences;
> > >
> > > -       ret =3D dma_resv_reserve_fences(dmabuf->resv, 1);
> > > -       if (!ret)
> > > -               dma_resv_add_fence(dmabuf->resv, fence, usage);
> > > +       if (num_fences > 0) {
> > > +               dma_resv_lock(dmabuf->resv, NULL);
> > >
> > > -       dma_resv_unlock(dmabuf->resv);
> > > +               ret =3D dma_resv_reserve_fences(dmabuf->resv,
> > > num_fences);
> >
> > That looks like it is misplaced.
> >
> > You *must* only lock the reservation object once and then add all
> > fences
> > in one go.
>
> That's what I'm doing.  Lock, reserve, add a bunch, unlock.  I am
> assuming that the iterator won't suddenly want to iterate more fences
> between my initial count and when I go to add them but I think that
> assumption is ok.
>

Bump.  This has been sitting here for a couple of weeks.  I still don't see
the problem.

--Jason


> --Jason
>
>
> > Thinking now about it we probably had a bug around that before as
> > well.
> > Going to double check tomorrow.
> >
> > Regards,
> > Christian.
> >
> > > +               if (!ret) {
> > > +                       dma_fence_unwrap_for_each(f, &iter, fence)
> > > +                               dma_resv_add_fence(dmabuf->resv, f,
> > > usage);
> > > +               }
> > > +
> > > +               dma_resv_unlock(dmabuf->resv);
> > > +       }
> > >
> > >         dma_fence_put(fence);
> > >
> >
>
>

--000000000000ed23be05e6fdc224
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Mon, Aug 8, 2022 at 11:39 AM Jason Ekstrand &lt;<a href=3D"mailto=
:jason.ekstrand@collabora.com">jason.ekstrand@collabora.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Sun, 2022-08-=
07 at 18:35 +0200, Christian K=C3=B6nig wrote:<br>
&gt; Am 02.08.22 um 23:01 schrieb Jason Ekstrand:<br>
&gt; &gt; Ever since 68129f431faa (&quot;dma-buf: warn about containers in<=
br>
&gt; &gt; dma_resv object&quot;),<br>
&gt; &gt; dma_resv_add_shared_fence will warn if you attempt to add a<br>
&gt; &gt; container fence.<br>
&gt; &gt; While most drivers were fine, fences can also be added to a<br>
&gt; &gt; dma_resv via the<br>
&gt; &gt; recently added DMA_BUF_IOCTL_IMPORT_SYNC_FILE.=C2=A0 Use<br>
&gt; &gt; dma_fence_unwrap_for_each<br>
&gt; &gt; to add each fence one at a time.<br>
&gt; &gt; <br>
&gt; &gt; Fixes: 594740497e99 (&quot;dma-buf: Add an API for importing sync=
 files<br>
&gt; &gt; (v10)&quot;)<br>
&gt; &gt; Signed-off-by: Jason Ekstrand &lt;<a href=3D"mailto:jason.ekstran=
d@collabora.com" target=3D"_blank">jason.ekstrand@collabora.com</a>&gt;<br>
&gt; &gt; Reported-by: Sarah Walker &lt;<a href=3D"mailto:Sarah.Walker@imgt=
ec.com" target=3D"_blank">Sarah.Walker@imgtec.com</a>&gt;<br>
&gt; &gt; Cc: Christian K=C3=B6nig &lt;<a href=3D"mailto:christian.koenig@a=
md.com" target=3D"_blank">christian.koenig@amd.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt; =C2=A0 drivers/dma-buf/dma-buf.c | 23 +++++++++++++++++------<br>
&gt; &gt; =C2=A0 1 file changed, 17 insertions(+), 6 deletions(-)<br>
&gt; &gt; <br>
&gt; &gt; diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.=
c<br>
&gt; &gt; index 630133284e2b..8d5d45112f52 100644<br>
&gt; &gt; --- a/drivers/dma-buf/dma-buf.c<br>
&gt; &gt; +++ b/drivers/dma-buf/dma-buf.c<br>
&gt; &gt; @@ -15,6 +15,7 @@<br>
&gt; &gt; =C2=A0 #include &lt;linux/slab.h&gt;<br>
&gt; &gt; =C2=A0 #include &lt;linux/dma-buf.h&gt;<br>
&gt; &gt; =C2=A0 #include &lt;linux/dma-fence.h&gt;<br>
&gt; &gt; +#include &lt;linux/dma-fence-unwrap.h&gt;<br>
&gt; &gt; =C2=A0 #include &lt;linux/anon_inodes.h&gt;<br>
&gt; &gt; =C2=A0 #include &lt;linux/export.h&gt;<br>
&gt; &gt; =C2=A0 #include &lt;linux/debugfs.h&gt;<br>
&gt; &gt; @@ -391,8 +392,10 @@ static long dma_buf_import_sync_file(struct<=
br>
&gt; &gt; dma_buf *dmabuf,<br>
&gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 const void __user *user_data)<br>
&gt; &gt; =C2=A0 {<br>
&gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct dma_buf_im=
port_sync_file arg;<br>
&gt; &gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct dma_fence *fenc=
e;<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct dma_fence *fenc=
e, *f;<br>
&gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0enum dma_resv_usa=
ge usage;<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct dma_fence_unwra=
p iter;<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0unsigned int num_fence=
s;<br>
&gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int ret =3D 0;<br=
>
&gt; &gt; =C2=A0 <br>
&gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (copy_from_use=
r(&amp;arg, user_data, sizeof(arg)))<br>
&gt; &gt; @@ -411,13 +414,21 @@ static long dma_buf_import_sync_file(struct=
<br>
&gt; &gt; dma_buf *dmabuf,<br>
&gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0usage =3D (arg.fl=
ags &amp; DMA_BUF_SYNC_WRITE) ?<br>
&gt; &gt; DMA_RESV_USAGE_WRITE :<br>
&gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0<br>
&gt; &gt; DMA_RESV_USAGE_READ;<br>
&gt; &gt; =C2=A0 <br>
&gt; &gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0dma_resv_lock(dmabuf-&=
gt;resv, NULL);<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0num_fences =3D 0;<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0dma_fence_unwrap_for_e=
ach(f, &amp;iter, fence)<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0++num_fences;<br>
&gt; &gt; =C2=A0 <br>
&gt; &gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ret =3D dma_resv_reser=
ve_fences(dmabuf-&gt;resv, 1);<br>
&gt; &gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!ret)<br>
&gt; &gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0dma_resv_add_fence(dmabuf-&gt;resv, fence, usage=
);<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (num_fences &gt; 0)=
 {<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0dma_resv_lock(dmabuf-&gt;resv, NULL);<br>
&gt; &gt; =C2=A0 <br>
&gt; &gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0dma_resv_unlock(dmabuf=
-&gt;resv);<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0ret =3D dma_resv_reserve_fences(dmabuf-&gt;resv,=
<br>
&gt; &gt; num_fences);<br>
&gt; <br>
&gt; That looks like it is misplaced.<br>
&gt; <br>
&gt; You *must* only lock the reservation object once and then add all<br>
&gt; fences <br>
&gt; in one go.<br>
<br>
That&#39;s what I&#39;m doing.=C2=A0 Lock, reserve, add a bunch, unlock.=C2=
=A0 I am<br>
assuming that the iterator won&#39;t suddenly want to iterate more fences<b=
r>
between my initial count and when I go to add them but I think that<br>
assumption is ok.<br></blockquote><div><br></div><div>Bump.=C2=A0 This has =
been sitting here for a couple of weeks.=C2=A0 I still don&#39;t see the pr=
oblem.</div><div><br></div><div>--Jason<br></div><div>=C2=A0</div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">
--Jason<br>
<br>
<br>
&gt; Thinking now about it we probably had a bug around that before as<br>
&gt; well. <br>
&gt; Going to double check tomorrow.<br>
&gt; <br>
&gt; Regards,<br>
&gt; Christian.<br>
&gt; <br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!ret) {<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
dma_fence_unwrap_for_each(f, &amp;iter, fence)<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0dma_resv_add_fence(dmabuf-&=
gt;resv, f,<br>
&gt; &gt; usage);<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0}<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0dma_resv_unlock(dmabuf-&gt;resv);<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}<br>
&gt; &gt; =C2=A0 <br>
&gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0dma_fence_put(fen=
ce);<br>
&gt; &gt; =C2=A0 <br>
&gt; <br>
<br>
</blockquote></div></div>

--000000000000ed23be05e6fdc224--
