Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C017625B77B
	for <lists+dri-devel@lfdr.de>; Thu,  3 Sep 2020 02:00:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB4D16E0FF;
	Thu,  3 Sep 2020 00:00:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B6A96E0FF
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Sep 2020 00:00:42 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id r13so1336938ljm.0
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Sep 2020 17:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jQx2sOfZuecf8aiDV6gkqxPllMpoD/TWS6sxzrKtd78=;
 b=aoVe86FzYVTQuS9RULS5k0UYEn9iZImLN2a90HRknF28npEmepyqNHhGhHhlR46X/8
 yoZbVydKsIeQLtBkLYTKvJfKUjIikQTX0om76B1UeJq51ACuXfX0Np1bcH4uDKc/goGd
 II9R0KO1sc+cuTUcIirG6P7+4dDSfRZZwI4Cw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jQx2sOfZuecf8aiDV6gkqxPllMpoD/TWS6sxzrKtd78=;
 b=A9N8Ie+6pky9AsPbp7aXVoKEZxqHYj/hShZwOoLAU/2XUCetmEeg3x1k5Kmh61VOLz
 k7Wlpst/PCqu8aDD7Cisv7yzbxgSLyDOuw6X1NaneOgy+V2ZMKmHg3nqpk2VTvSgVmH4
 dpQqqeKHczIohLY5V0R/IC7IWRqCddMwX6HS8YJGOUJBVIP2+SPd270mRLP0VIrn71jk
 AXqCq8QdNu2YFGZPvN24uvV8UyH3gFmBpR8jxfkGbYJ2mLhGKzEm47CrbwQZFadSjz71
 ct3IP3szgjGSTDd4OuOMgDnE9mLvW/reVcIvL7+zpuV+DF1/IZOZBPdWi8sQ+I/9rHC2
 OVWA==
X-Gm-Message-State: AOAM531yGYUletXqAOnXMPp8/F0BzJPqiCqqykOD7wfW690LJXSDyHgn
 y504aqvdJnYxc7pZfkpxrG8QIgtVU+ksuw==
X-Google-Smtp-Source: ABdhPJyunfaf6U/kdkqTW5+xIQ9fuSKHnCfu+7QYJUeKQ3RN6kuOOjfKhQF/UaNPtXEUMPS9UxNhjg==
X-Received: by 2002:a2e:351a:: with SMTP id z26mr155321ljz.3.1599091240053;
 Wed, 02 Sep 2020 17:00:40 -0700 (PDT)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com.
 [209.85.208.177])
 by smtp.gmail.com with ESMTPSA id x11sm225484ljh.106.2020.09.02.17.00.38
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Sep 2020 17:00:38 -0700 (PDT)
Received: by mail-lj1-f177.google.com with SMTP id e11so1291787ljn.6
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Sep 2020 17:00:38 -0700 (PDT)
X-Received: by 2002:a2e:b0cb:: with SMTP id g11mr164219ljl.223.1599091237698; 
 Wed, 02 Sep 2020 17:00:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200902210847.2689-1-gurchetansingh@chromium.org>
 <20200902210847.2689-5-gurchetansingh@chromium.org>
 <20200902221514.GE1263242@redhat.com>
In-Reply-To: <20200902221514.GE1263242@redhat.com>
From: Gurchetan Singh <gurchetansingh@chromium.org>
Date: Wed, 2 Sep 2020 17:00:25 -0700
X-Gmail-Original-Message-ID: <CAAfnVBnfbwc07au1OMec8g5yHC0D3yXc88nOtTopO4sitYf8ig@mail.gmail.com>
Message-ID: <CAAfnVBnfbwc07au1OMec8g5yHC0D3yXc88nOtTopO4sitYf8ig@mail.gmail.com>
Subject: Re: [PATCH v2 04/23] virtio: Add get_shm_region method
To: Vivek Goyal <vgoyal@redhat.com>
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
Cc: virtio-dev@lists.oasis-open.org, Miklos Szeredi <miklos@szeredi.hu>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Sebastien Boeuf <sebastien.boeuf@intel.com>, Gerd Hoffmann <kraxel@redhat.com>
Content-Type: multipart/mixed; boundary="===============1580866580=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1580866580==
Content-Type: multipart/alternative; boundary="0000000000003049d305ae5d711d"

--0000000000003049d305ae5d711d
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 2, 2020 at 3:15 PM Vivek Goyal <vgoyal@redhat.com> wrote:

> Hi Gurchetan,
>
> Now Miklos has queued, these tree virtio patches for shared memory
> region in his tree as part of virtiofs dax patch series.
>
> I am hoping this will get merged in 5.10 through his tree.
>
>
> https://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/fuse.git/log/?h=dax


Terrific ... !  Maybe we can queue the version Miklos has in drm-misc-next
to avoid merge conflicts ?!?

There's a few checkpatch --strict fixes in the blob version, but I doubt
anyone cares.


>
> Thanks
> Vivek
>
> On Wed, Sep 02, 2020 at 02:08:28PM -0700, Gurchetan Singh wrote:
> > From: Sebastien Boeuf <sebastien.boeuf@intel.com>
> >
> > Virtio defines 'shared memory regions' that provide a continuously
> > shared region between the host and guest.
> >
> > Provide a method to find a particular region on a device.
> >
> > Signed-off-by: Sebastien Boeuf <sebastien.boeuf@intel.com>
> > Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> > Acked-by: Michael S. Tsirkin <mst@redhat.com>
> > Cc: kvm@vger.kernel.org
> > Cc: virtualization@lists.linux-foundation.org
> > Cc: "Michael S. Tsirkin" <mst@redhat.com>
> > ---
> >  include/linux/virtio_config.h | 17 +++++++++++++++++
> >  1 file changed, 17 insertions(+)
> >
> > diff --git a/include/linux/virtio_config.h
> b/include/linux/virtio_config.h
> > index 8fe857e27ef32..4b8e38c5c4d8c 100644
> > --- a/include/linux/virtio_config.h
> > +++ b/include/linux/virtio_config.h
> > @@ -11,6 +11,11 @@
> >
> >  struct irq_affinity;
> >
> > +struct virtio_shm_region {
> > +     u64 addr;
> > +     u64 len;
> > +};
> > +
> >  /**
> >   * virtio_config_ops - operations for configuring a virtio device
> >   * Note: Do not assume that a transport implements all of the operations
> > @@ -66,6 +71,7 @@ struct irq_affinity;
> >   *      the caller can then copy.
> >   * @set_vq_affinity: set the affinity for a virtqueue (optional).
> >   * @get_vq_affinity: get the affinity for a virtqueue (optional).
> > + * @get_shm_region: get a shared memory region based on the index.
> >   */
> >  typedef void vq_callback_t(struct virtqueue *);
> >  struct virtio_config_ops {
> > @@ -89,6 +95,8 @@ struct virtio_config_ops {
> >                              const struct cpumask *cpu_mask);
> >       const struct cpumask *(*get_vq_affinity)(struct virtio_device
> *vdev,
> >                       int index);
> > +     bool (*get_shm_region)(struct virtio_device *vdev,
> > +                            struct virtio_shm_region *region, u8 id);
> >  };
> >
> >  /* If driver didn't advertise the feature, it will never appear. */
> > @@ -251,6 +259,15 @@ int virtqueue_set_affinity(struct virtqueue *vq,
> const struct cpumask *cpu_mask)
> >       return 0;
> >  }
> >
> > +static inline
> > +bool virtio_get_shm_region(struct virtio_device *vdev,
> > +                        struct virtio_shm_region *region, u8 id)
> > +{
> > +     if (!vdev->config->get_shm_region)
> > +             return false;
> > +     return vdev->config->get_shm_region(vdev, region, id);
> > +}
> > +
> >  static inline bool virtio_is_little_endian(struct virtio_device *vdev)
> >  {
> >       return virtio_has_feature(vdev, VIRTIO_F_VERSION_1) ||
> > --
> > 2.26.2
> >
>
>

--0000000000003049d305ae5d711d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Sep 2, 2020 at 3:15 PM Vivek =
Goyal &lt;<a href=3D"mailto:vgoyal@redhat.com">vgoyal@redhat.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Gurcheta=
n,<br>
<br>
Now Miklos has queued, these tree virtio patches for shared memory<br>
region in his tree as part of virtiofs dax patch series.<br>
<br>
I am hoping this will get merged in 5.10 through his tree.<br>
<br>
<a href=3D"https://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/fuse.gi=
t/log/?h=3Ddax" rel=3D"noreferrer" target=3D"_blank">https://git.kernel.org=
/pub/scm/linux/kernel/git/mszeredi/fuse.git/log/?h=3Ddax</a></blockquote><d=
iv><br></div><div>Terrific ... !=C2=A0 Maybe we can queue the version Miklo=
s has in drm-misc-next to avoid merge conflicts ?!?</div><div><br></div><di=
v>There&#39;s a few checkpatch --strict fixes in the blob version, but I do=
ubt anyone cares.</div><div><br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex"><br>
<br>
Thanks<br>
Vivek<br>
<br>
On Wed, Sep 02, 2020 at 02:08:28PM -0700, Gurchetan Singh wrote:<br>
&gt; From: Sebastien Boeuf &lt;<a href=3D"mailto:sebastien.boeuf@intel.com"=
 target=3D"_blank">sebastien.boeuf@intel.com</a>&gt;<br>
&gt; <br>
&gt; Virtio defines &#39;shared memory regions&#39; that provide a continuo=
usly<br>
&gt; shared region between the host and guest.<br>
&gt; <br>
&gt; Provide a method to find a particular region on a device.<br>
&gt; <br>
&gt; Signed-off-by: Sebastien Boeuf &lt;<a href=3D"mailto:sebastien.boeuf@i=
ntel.com" target=3D"_blank">sebastien.boeuf@intel.com</a>&gt;<br>
&gt; Signed-off-by: Dr. David Alan Gilbert &lt;<a href=3D"mailto:dgilbert@r=
edhat.com" target=3D"_blank">dgilbert@redhat.com</a>&gt;<br>
&gt; Acked-by: Michael S. Tsirkin &lt;<a href=3D"mailto:mst@redhat.com" tar=
get=3D"_blank">mst@redhat.com</a>&gt;<br>
&gt; Cc: <a href=3D"mailto:kvm@vger.kernel.org" target=3D"_blank">kvm@vger.=
kernel.org</a><br>
&gt; Cc: <a href=3D"mailto:virtualization@lists.linux-foundation.org" targe=
t=3D"_blank">virtualization@lists.linux-foundation.org</a><br>
&gt; Cc: &quot;Michael S. Tsirkin&quot; &lt;<a href=3D"mailto:mst@redhat.co=
m" target=3D"_blank">mst@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 include/linux/virtio_config.h | 17 +++++++++++++++++<br>
&gt;=C2=A0 1 file changed, 17 insertions(+)<br>
&gt; <br>
&gt; diff --git a/include/linux/virtio_config.h b/include/linux/virtio_conf=
ig.h<br>
&gt; index 8fe857e27ef32..4b8e38c5c4d8c 100644<br>
&gt; --- a/include/linux/virtio_config.h<br>
&gt; +++ b/include/linux/virtio_config.h<br>
&gt; @@ -11,6 +11,11 @@<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 struct irq_affinity;<br>
&gt;=C2=A0 <br>
&gt; +struct virtio_shm_region {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u64 addr;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u64 len;<br>
&gt; +};<br>
&gt; +<br>
&gt;=C2=A0 /**<br>
&gt;=C2=A0 =C2=A0* virtio_config_ops - operations for configuring a virtio =
device<br>
&gt;=C2=A0 =C2=A0* Note: Do not assume that a transport implements all of t=
he operations<br>
&gt; @@ -66,6 +71,7 @@ struct irq_affinity;<br>
&gt;=C2=A0 =C2=A0*=C2=A0 =C2=A0 =C2=A0 the caller can then copy.<br>
&gt;=C2=A0 =C2=A0* @set_vq_affinity: set the affinity for a virtqueue (opti=
onal).<br>
&gt;=C2=A0 =C2=A0* @get_vq_affinity: get the affinity for a virtqueue (opti=
onal).<br>
&gt; + * @get_shm_region: get a shared memory region based on the index.<br=
>
&gt;=C2=A0 =C2=A0*/<br>
&gt;=C2=A0 typedef void vq_callback_t(struct virtqueue *);<br>
&gt;=C2=A0 struct virtio_config_ops {<br>
&gt; @@ -89,6 +95,8 @@ struct virtio_config_ops {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const struct cpumask *cpu_mask);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0const struct cpumask *(*get_vq_affinity)(str=
uct virtio_device *vdev,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0int index);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0bool (*get_shm_region)(struct virtio_device *vdev=
,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct virtio_shm_region *region, u8 id);<br>
&gt;=C2=A0 };<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 /* If driver didn&#39;t advertise the feature, it will never app=
ear. */<br>
&gt; @@ -251,6 +259,15 @@ int virtqueue_set_affinity(struct virtqueue *vq, =
const struct cpumask *cpu_mask)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; +static inline<br>
&gt; +bool virtio_get_shm_region(struct virtio_device *vdev,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 struct virtio_shm_region *region, u8 id)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!vdev-&gt;config-&gt;get_shm_region)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return false;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return vdev-&gt;config-&gt;get_shm_region(vdev, r=
egion, id);<br>
&gt; +}<br>
&gt; +<br>
&gt;=C2=A0 static inline bool virtio_is_little_endian(struct virtio_device =
*vdev)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return virtio_has_feature(vdev, VIRTIO_F_VER=
SION_1) ||<br>
&gt; -- <br>
&gt; 2.26.2<br>
&gt; <br>
<br>
</blockquote></div></div>

--0000000000003049d305ae5d711d--

--===============1580866580==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1580866580==--
