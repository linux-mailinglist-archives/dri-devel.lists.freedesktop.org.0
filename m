Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF57F178812
	for <lists+dri-devel@lfdr.de>; Wed,  4 Mar 2020 03:09:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22A706EAA1;
	Wed,  4 Mar 2020 02:09:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C80B96E115
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2020 02:09:29 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id f13so199867ljp.0
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2020 18:09:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=w9rQKyxU00fsH1SFUakW02vAV8mH2XFD3VIqUoPGL9o=;
 b=BSnWCRO8JBW40e1RW9kkQi3cTuUYLXqdEnCZjMZ5Rufz21z8JtU1yStbObadpQ1ngN
 GsM311sdZZhIl2BAbWbP50pjL3ImHrEuX3JSEeRYSNFcRqw6Bf/Wy7joEGsFqh16wmdn
 z74wGoNzqSwRvMULWObJwi7CkGKww50EVKvK8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w9rQKyxU00fsH1SFUakW02vAV8mH2XFD3VIqUoPGL9o=;
 b=CyfZ7TAhCvXTsI2JBCK+azrdasJ0eP+Sx4mTBoabR86nWq6oT5UpVFEmX/VhPM9UF5
 IKcpDYnvbWO89que5wFspr/gZXxDdPDX7supZdn110SjHeFNfNP+1ULjpWO8mAnclUyK
 NmA7NHALc2fKSxryABRn9wNMvljOZYhaJ4yR8SvL/l7Sza4wUF2xv/WGzIZRnYlibeHH
 B6xGv9nrY6m2uM2jezjeHJ2bkHxgTIKfGwnxBBzqMA4o0H+b4z7nO5DZi1DYzngLiiLY
 VDJLgR+c27Ec+zKaHBJ+XuCe7BKXmy26eu9llYOI2Pl/vV+/ZI4Bmx0DnrEaq+G2TDsv
 Lm2Q==
X-Gm-Message-State: ANhLgQ1NFlJ3UZnlZAXTnfKLCWLmGR+fRZrAoHZ9Ng2zt6LWd270BWTQ
 MDui1N9pa8bLthdNqpQKTVmu8qsFZfw=
X-Google-Smtp-Source: ADFU+vtR+mYv/p77lgak664ReYrKzAb339GEvXbfaKrbVwLhCw78lO4Lo8dI/Xeu91gSx/i/rR5a6g==
X-Received: by 2002:a2e:45c3:: with SMTP id s186mr467600lja.90.1583287767911; 
 Tue, 03 Mar 2020 18:09:27 -0800 (PST)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com.
 [209.85.208.182])
 by smtp.gmail.com with ESMTPSA id s2sm4638394ljo.58.2020.03.03.18.09.27
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Mar 2020 18:09:27 -0800 (PST)
Received: by mail-lj1-f182.google.com with SMTP id x7so197081ljc.1
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2020 18:09:27 -0800 (PST)
X-Received: by 2002:a05:651c:313:: with SMTP id
 a19mr441142ljp.173.1583287766917; 
 Tue, 03 Mar 2020 18:09:26 -0800 (PST)
MIME-Version: 1.0
References: <20200303014010.418-1-gurchetansingh@chromium.org>
 <20200303095650.2q477cboekzfsrsg@sirius.home.kraxel.org>
In-Reply-To: <20200303095650.2q477cboekzfsrsg@sirius.home.kraxel.org>
From: Gurchetan Singh <gurchetansingh@chromium.org>
Date: Tue, 3 Mar 2020 18:09:15 -0800
X-Gmail-Original-Message-ID: <CAAfnVB=3ttNGW_CFb5nH2OhUCSQ9kx7Bc5JTL2j9qGCOrPBBoA@mail.gmail.com>
Message-ID: <CAAfnVB=3ttNGW_CFb5nH2OhUCSQ9kx7Bc5JTL2j9qGCOrPBBoA@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/virtio: factor out the sg_table from
 virtio_gpu_object
To: Gerd Hoffmann <kraxel@redhat.com>
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
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1302823006=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1302823006==
Content-Type: multipart/alternative; boundary="000000000000ed0729059ffde89f"

--000000000000ed0729059ffde89f
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 3, 2020 at 1:56 AM Gerd Hoffmann <kraxel@redhat.com> wrote:

>   Hi,
>
> >  struct virtio_gpu_object {
> >       struct drm_gem_shmem_object base;
> >       uint32_t hw_res_handle;
> > -
> > -     struct sg_table *pages;
> >       uint32_t mapped;
> > -
> >       bool dumb;
> >       bool created;
> >  };
> >  #define gem_to_virtio_gpu_obj(gobj) \
> >       container_of((gobj), struct virtio_gpu_object, base.base)
> >
> > +struct virtio_gpu_object_shmem {
> > +     struct virtio_gpu_object base;
> > +     struct sg_table *pages;
> > +};
>
> mapped can be moved too.
>
> > @@ -600,10 +600,11 @@ void virtio_gpu_cmd_transfer_to_host_2d(struct
> virtio_gpu_device *vgdev,
>
> > +     struct virtio_gpu_object_shmem *shmem = to_virtio_gpu_shmem(bo);
>
> Should we pass struct virtio_gpu_object_shmem to
> virtio_gpu_cmd_transfer_to_host_2d (+friends) instead?
>

It ends up being a little more complicated, due to casting to
virtio_gpu_object and then virtio_gpu_object_shmem in
virtio_gpu_transfer_to_host_ioctl, so I omitted it v2...


>
> hostmem will not need transfers ...
>
> cheers,
>   Gerd
>
>

--000000000000ed0729059ffde89f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar 3, 2020 at 1:56 AM Gerd H=
offmann &lt;<a href=3D"mailto:kraxel@redhat.com">kraxel@redhat.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=C2=A0 Hi=
,<br>
<br>
&gt;=C2=A0 struct virtio_gpu_object {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_gem_shmem_object base;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t hw_res_handle;<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0struct sg_table *pages;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t mapped;<br>
&gt; -<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bool dumb;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bool created;<br>
&gt;=C2=A0 };<br>
&gt;=C2=A0 #define gem_to_virtio_gpu_obj(gobj) \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0container_of((gobj), struct virtio_gpu_objec=
t, base.base)<br>
&gt;=C2=A0 <br>
&gt; +struct virtio_gpu_object_shmem {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct virtio_gpu_object base;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct sg_table *pages;<br>
&gt; +};<br>
<br>
mapped can be moved too.<br>
<br>
&gt; @@ -600,10 +600,11 @@ void virtio_gpu_cmd_transfer_to_host_2d(struct v=
irtio_gpu_device *vgdev,<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct virtio_gpu_object_shmem *shmem =3D to_virt=
io_gpu_shmem(bo);<br>
<br>
Should we pass struct virtio_gpu_object_shmem to<br>
virtio_gpu_cmd_transfer_to_host_2d (+friends) instead?<br></blockquote><div=
><br></div><div>It ends up being a little more complicated, due to casting =
to virtio_gpu_object and then virtio_gpu_object_shmem in virtio_gpu_transfe=
r_to_host_ioctl, so I omitted it v2...</div><div>=C2=A0</div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">
<br>
hostmem will not need transfers ...<br>
<br>
cheers,<br>
=C2=A0 Gerd<br>
<br>
</blockquote></div></div>

--000000000000ed0729059ffde89f--

--===============1302823006==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1302823006==--
