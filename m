Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA0D42B0A7
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 01:56:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 443A16E045;
	Tue, 12 Oct 2021 23:56:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D79A6E045
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Oct 2021 23:56:45 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id t9so3831016lfd.1
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Oct 2021 16:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rapPYH7V1hTNRP0fIwhOazgfaLtTR12NlYuQ8nIxcS4=;
 b=kNbNFLXLpZG9ARM2tQdVmhbs6Pbjs0M9mbHSqefCyCc9oTcV0mxzoGRs9czNZIAW0q
 LHXWhOqIArQEBYhU9QfFznXqBWKz/eSWj7DTBHozxNxuICOEbfSW5/A9M0g/Zqec6GY3
 C5p4CiMMyix+v4MyP4qliMFttcBAoD/stF7xDi5nvH0jCBoQnxeBrNd2kNnfPRMgU+LI
 Qc+1vO4UrhuPWbyQVI8EYO7FiJEUpSPzDR9lm4WM2AkgowG20Qo9014sjPWW7SbIm5df
 kcX1RXVzGMvxo7a+xlNpdPslR78QMVIf3JrnNwyFNkR1OxLtrDROnIXc0RJ6P7Bt706V
 KNrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rapPYH7V1hTNRP0fIwhOazgfaLtTR12NlYuQ8nIxcS4=;
 b=be2UXh0YwfLTZZDIr5oAg/JmKAUJEH1zN6/uuOdU0J4BEvHQ8hiOM1onWbHlZFxaEk
 fJLKM1alNRxPWU9yDIFtNinO5E0gaco2Lar69RKLTHGQofvGi66DgPndHrgCXjgV6d5Z
 aPEb1EKGj5vyRL4G+JHuIKxZ/1QZYGuOI0Ynjs9g8kWMdr8WEJic/UiTWaDjlS0QXHiv
 jvvftA76bvXPM8ojjPKv2iP83kyUMTqsqcxqkoHMRewBCib29NmkNc3xqYl4H5L3Wy6T
 tOSY9pspnEkTCwezdH64kTIr5PlB9Zn0N6o/S/mmOAsJI1lpuQKM0+IdNncPFEaX9c65
 FeYw==
X-Gm-Message-State: AOAM5331T6c6mzQsMxHXaDVgTHqkjL1H8aBDO9aCeGrhGVN1+C9zHIJV
 hOhOdxQTBMC/LCxYFU8jHXoY5x6SwUN15heFPDn2VQ==
X-Google-Smtp-Source: ABdhPJzwNqtdmk87n0ek9Tq3sboN0Jw3reZ5002XxS4UFhnSSp/omrMqb9kwCQ/XdpbeqWO1MtWcRhLqhpIfVhQ1log=
X-Received: by 2002:a05:6512:3c83:: with SMTP id
 h3mr32272899lfv.170.1634083003911; 
 Tue, 12 Oct 2021 16:56:43 -0700 (PDT)
MIME-Version: 1.0
References: <eba79a76-413b-570c-aec0-899a5f918d38@amd.com>
 <20211012084109.176542-1-guangming.cao@mediatek.com>
In-Reply-To: <20211012084109.176542-1-guangming.cao@mediatek.com>
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Wed, 13 Oct 2021 05:26:30 +0530
Message-ID: <CAO_48GE_jCWY4waK-+FqVw5sbuoHddt4kWpnkpvyLDRC__yE+g@mail.gmail.com>
Subject: Re: [PATCH v2] dma-buf: remove restriction of IOCTL:DMA_BUF_SET_NAME
To: guangming.cao@mediatek.com
Cc: Christian Koenig <christian.koenig@amd.com>, 
 DRI mailing list <dri-devel@lists.freedesktop.org>, 
 Linaro MM SIG <linaro-mm-sig@lists.linaro.org>,
 linux-arm-kernel@lists.infradead.org, 
 LKML <linux-kernel@vger.kernel.org>, 
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 linux-mediatek@lists.infradead.org, 
 matthias.bgg@gmail.com, Randy Dunlap <rdunlap@infradead.org>,
 wsd_upstream@mediatek.com
Content-Type: multipart/alternative; boundary="000000000000fb688205ce30982d"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000fb688205ce30982d
Content-Type: text/plain; charset="UTF-8"

Hello Guangming, Christian,



On Tue, 12 Oct 2021, 14:09 , <guangming.cao@mediatek.com> wrote:

> From: Guangming Cao <Guangming.Cao@mediatek.com>
>
> > Am 09.10.21 um 07:55 schrieb guangming.cao@mediatek.com:
> > From: Guangming Cao <Guangming.Cao@mediatek.com>
> > >
> > > If dma-buf don't want userspace users to touch the dmabuf buffer,
> > > it seems we should add this restriction into dma_buf_ops.mmap,
> > > not in this IOCTL:DMA_BUF_SET_NAME.
> > >
> > > With this restriction, we can only know the kernel users of the dmabuf
> > > by attachments.
> > > However, for many userspace users, such as userpsace users of dma_heap,
> > > they also need to mark the usage of dma-buf, and they don't care about
> > > who attached to this dmabuf, and seems it's no meaning to be waiting
> for
> > > IOCTL:DMA_BUF_SET_NAME rather than mmap.
> >
> > Sounds valid to me, but I have no idea why this restriction was added in
> > the first place.
> >
> > Can you double check the git history and maybe identify when that was
> > added? Mentioning this change in the commit message then might make
> > things a bit easier to understand.
> >
> > Thanks,
> > Christian.
> It was add in this patch: https://patchwork.freedesktop.org/patch/310349/.
> However, there is no illustration about it.
> I guess it wants users to set_name when no attachments on the dmabuf,
> for case with attachments, we can find owner by device in attachments.
> But just I said in commit message, this is might not a good idea.
>
> Do you have any idea?
>

For the original series, the idea was that allowing name change mid-use
could confuse the users about the dma-buf. However, the rest of the series
also makes sure each dma-buf have a unique inode, and any accounting should
probably use that, without relying on the name as much.
So I don't have an objection to this change.

Best,
Sumit.

> >
> > >
> > > Signed-off-by: Guangming Cao <Guangming.Cao@mediatek.com>
> > > ---
> > >   drivers/dma-buf/dma-buf.c | 14 ++------------
> > >   1 file changed, 2 insertions(+), 12 deletions(-)
> > >
> > > diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> > > index 511fe0d217a0..db2f4efdec32 100644
> > > --- a/drivers/dma-buf/dma-buf.c
> > > +++ b/drivers/dma-buf/dma-buf.c
> > > @@ -325,10 +325,8 @@ static __poll_t dma_buf_poll(struct file *file,
> poll_table *poll)
> > >
> > >   /**
> > >    * dma_buf_set_name - Set a name to a specific dma_buf to track the
> usage.
> > > - * The name of the dma-buf buffer can only be set when the dma-buf is
> not
> > > - * attached to any devices. It could theoritically support changing
> the
> > > - * name of the dma-buf if the same piece of memory is used for
> multiple
> > > - * purpose between different devices.
> > > + * It could theoretically support changing the name of the dma-buf if
> the same
> > > + * piece of memory is used for multiple purpose between different
> devices.
> > >    *
> > >    * @dmabuf: [in]     dmabuf buffer that will be renamed.
> > >    * @buf:    [in]     A piece of userspace memory that contains the
> name of
> > > @@ -346,19 +344,11 @@ static long dma_buf_set_name(struct dma_buf
> *dmabuf, const char __user *buf)
> > >     if (IS_ERR(name))
> > >             return PTR_ERR(name);
> > >
> > > -   dma_resv_lock(dmabuf->resv, NULL);
> > > -   if (!list_empty(&dmabuf->attachments)) {
> > > -           ret = -EBUSY;
> > > -           kfree(name);
> > > -           goto out_unlock;
> > > -   }
> > >     spin_lock(&dmabuf->name_lock);
> > >     kfree(dmabuf->name);
> > >     dmabuf->name = name;
> > >     spin_unlock(&dmabuf->name_lock);
> > >
> > > -out_unlock:
> > > -   dma_resv_unlock(dmabuf->resv);
> > >     return ret;
> > >   }
> > >
>

--000000000000fb688205ce30982d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hello Guangming, Christian,<div dir=3D"auto"><br></d=
iv><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr"=
>On Tue, 12 Oct 2021, 14:09 , &lt;<a href=3D"mailto:guangming.cao@mediatek.=
com" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">guangming.c=
ao@mediatek.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">From=
: Guangming Cao &lt;<a href=3D"mailto:Guangming.Cao@mediatek.com" rel=3D"no=
referrer noreferrer noreferrer noreferrer" target=3D"_blank">Guangming.Cao@=
mediatek.com</a>&gt;<br>
<br>
&gt; Am 09.10.21 um 07:55 schrieb <a href=3D"mailto:guangming.cao@mediatek.=
com" rel=3D"noreferrer noreferrer noreferrer noreferrer" target=3D"_blank">=
guangming.cao@mediatek.com</a>:<br>
&gt; From: Guangming Cao &lt;<a href=3D"mailto:Guangming.Cao@mediatek.com" =
rel=3D"noreferrer noreferrer noreferrer noreferrer" target=3D"_blank">Guang=
ming.Cao@mediatek.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt; If dma-buf don&#39;t want userspace users to touch the dmabuf buf=
fer,<br>
&gt; &gt; it seems we should add this restriction into dma_buf_ops.mmap,<br=
>
&gt; &gt; not in this IOCTL:DMA_BUF_SET_NAME.<br>
&gt; &gt;<br>
&gt; &gt; With this restriction, we can only know the kernel users of the d=
mabuf<br>
&gt; &gt; by attachments.<br>
&gt; &gt; However, for many userspace users, such as userpsace users of dma=
_heap,<br>
&gt; &gt; they also need to mark the usage of dma-buf, and they don&#39;t c=
are about<br>
&gt; &gt; who attached to this dmabuf, and seems it&#39;s no meaning to be =
waiting for<br>
&gt; &gt; IOCTL:DMA_BUF_SET_NAME rather than mmap.<br>
&gt; <br>
&gt; Sounds valid to me, but I have no idea why this restriction was added =
in <br>
&gt; the first place.<br>
&gt; <br>
&gt; Can you double check the git history and maybe identify when that was =
<br>
&gt; added? Mentioning this change in the commit message then might make <b=
r>
&gt; things a bit easier to understand.<br>
&gt; <br>
&gt; Thanks,<br>
&gt; Christian.<br>
It was add in this patch: <a href=3D"https://patchwork.freedesktop.org/patc=
h/310349/" rel=3D"noreferrer noreferrer noreferrer noreferrer noreferrer" t=
arget=3D"_blank">https://patchwork.freedesktop.org/patch/310349/</a>.<br>
However, there is no illustration about it.<br>
I guess it wants users to set_name when no attachments on the dmabuf,<br>
for case with attachments, we can find owner by device in attachments.<br>
But just I said in commit message, this is might not a good idea.<br>
<br>
Do you have any idea?<br></blockquote></div></div><div dir=3D"auto"><br></d=
iv><div dir=3D"auto">For the original series, the idea was that allowing na=
me change mid-use could confuse the users about the dma-buf. However, the r=
est of the series also makes sure each dma-buf have a unique inode, and any=
 accounting should probably use that, without relying on the name as much.<=
/div><div dir=3D"auto">So I don&#39;t have an objection to this change.</di=
v><div dir=3D"auto"><br></div><div dir=3D"auto">Best,</div><div dir=3D"auto=
">Sumit.</div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex">
&gt; <br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Guangming Cao &lt;<a href=3D"mailto:Guangming.Cao@=
mediatek.com" rel=3D"noreferrer noreferrer noreferrer noreferrer" target=3D=
"_blank">Guangming.Cao@mediatek.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 =C2=A0drivers/dma-buf/dma-buf.c | 14 ++------------<br>
&gt; &gt;=C2=A0 =C2=A01 file changed, 2 insertions(+), 12 deletions(-)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.=
c<br>
&gt; &gt; index 511fe0d217a0..db2f4efdec32 100644<br>
&gt; &gt; --- a/drivers/dma-buf/dma-buf.c<br>
&gt; &gt; +++ b/drivers/dma-buf/dma-buf.c<br>
&gt; &gt; @@ -325,10 +325,8 @@ static __poll_t dma_buf_poll(struct file *fi=
le, poll_table *poll)<br>
&gt; &gt;=C2=A0 =C2=A0<br>
&gt; &gt;=C2=A0 =C2=A0/**<br>
&gt; &gt;=C2=A0 =C2=A0 * dma_buf_set_name - Set a name to a specific dma_bu=
f to track the usage.<br>
&gt; &gt; - * The name of the dma-buf buffer can only be set when the dma-b=
uf is not<br>
&gt; &gt; - * attached to any devices. It could theoritically support chang=
ing the<br>
&gt; &gt; - * name of the dma-buf if the same piece of memory is used for m=
ultiple<br>
&gt; &gt; - * purpose between different devices.<br>
&gt; &gt; + * It could theoretically support changing the name of the dma-b=
uf if the same<br>
&gt; &gt; + * piece of memory is used for multiple purpose between differen=
t devices.<br>
&gt; &gt;=C2=A0 =C2=A0 *<br>
&gt; &gt;=C2=A0 =C2=A0 * @dmabuf: [in]=C2=A0 =C2=A0 =C2=A0dmabuf buffer tha=
t will be renamed.<br>
&gt; &gt;=C2=A0 =C2=A0 * @buf:=C2=A0 =C2=A0 [in]=C2=A0 =C2=A0 =C2=A0A piece=
 of userspace memory that contains the name of<br>
&gt; &gt; @@ -346,19 +344,11 @@ static long dma_buf_set_name(struct dma_buf=
 *dmabuf, const char __user *buf)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0if (IS_ERR(name))<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_ERR(nam=
e);<br>
&gt; &gt;=C2=A0 =C2=A0<br>
&gt; &gt; -=C2=A0 =C2=A0dma_resv_lock(dmabuf-&gt;resv, NULL);<br>
&gt; &gt; -=C2=A0 =C2=A0if (!list_empty(&amp;dmabuf-&gt;attachments)) {<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D -EBUSY;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kfree(name);<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out_unlock;<br>
&gt; &gt; -=C2=A0 =C2=A0}<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0spin_lock(&amp;dmabuf-&gt;name_lock);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0kfree(dmabuf-&gt;name);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0dmabuf-&gt;name =3D name;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0spin_unlock(&amp;dmabuf-&gt;name_lock);<br>
&gt; &gt;=C2=A0 =C2=A0<br>
&gt; &gt; -out_unlock:<br>
&gt; &gt; -=C2=A0 =C2=A0dma_resv_unlock(dmabuf-&gt;resv);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; &gt;=C2=A0 =C2=A0}<br>
&gt; &gt;=C2=A0 =C2=A0<br>
</blockquote></div></div></div>

--000000000000fb688205ce30982d--
