Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D86DD13A2D4
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2020 09:19:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E05A6E30F;
	Tue, 14 Jan 2020 08:19:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com
 [IPv6:2607:f8b0:4864:20::e44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CF586E106
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2020 17:57:56 +0000 (UTC)
Received: by mail-vs1-xe44.google.com with SMTP id g15so6439851vsf.1
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2020 09:57:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/PSAG61zqvqUhEF7Z9C4HzB18X1ivvURgJooHOXqFPo=;
 b=U7SjrFDaaz+/MDMTk9CfnltmkROyQxSE573yO+aZ1ve4Vf/7FCxfoVrI9fwjIQcHb3
 E1ziR3/pRLE2zhQ098s/vbM8OVuhUJjnvpuUyY8+zh7HJoDJD0A9mUmhDl1G0YAfJsNv
 nKECzqaUITjF5nduR/gMV21xXpLSnphlxLvZRdrfL3waRkO3VCvouAz7BVU2W8ozah/l
 FZLcLAbB6++7q3upGrMQmlGQeQwJt/bVFqsVp960u6vhVw2Yh/SH/Q3sqCA0ox/WSYVl
 KMmfRv1XpMs7QqYjHxVVdzKosWnfwWHiE5py1s+ZPp3X888Vnhlw3NjSIG/Zd8ebtIRD
 9aew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/PSAG61zqvqUhEF7Z9C4HzB18X1ivvURgJooHOXqFPo=;
 b=U+i5XArMWv0Hnm2KZc4AhHeTWDcrzZQ81zG8wBhfQWp5Izm/+WZJDjIQhqY1uyMBar
 RoiKijdqojFMhGGj+pEEXutSjkbqH8+DGBezT2QLHnIM9Aur6PMarzgz6QBWIOR5sahg
 Ip2zpAVHBxy/6Dnms7Npjk9nfsVUeBZHtRXXRqBK9UBvPKTPzsL1xzPAtRERVXusWX/r
 HMyIKuGRPx7B8xcCQloOxXNOyFW8WqbR8FlCPdefwyu0JqMNRVAlVTC+ivXToff9kz3i
 rK1vZJGE7de+i3An8FD57QDlJy3qEGaAd1luQDxVEmZTGXUsGbdgWUgLM358WVNj6FjL
 YaUg==
X-Gm-Message-State: APjAAAV90KVEWFjriIwnXJU7ZVU9k8p+q1m3kibqKu/BLms25nZXJFY0
 GRiClzcbqMXZ0kDXQpooKEncCRce1Rnm33wjkkKvHQ==
X-Google-Smtp-Source: APXvYqzwq4ZZv4+20rb3CbEM3yBuDX6VlLLlMHaVhP+fmZDfVppeLZwBC1lIy01D1ZYgrUTnGHzBd+m5DSCokU3uKrk=
X-Received: by 2002:a67:2c83:: with SMTP id s125mr9445098vss.121.1578938275250; 
 Mon, 13 Jan 2020 09:57:55 -0800 (PST)
MIME-Version: 1.0
References: <20200113153605.52350-1-brian@brkho.com>
 <20200113153605.52350-3-brian@brkho.com>
 <CAJs_Fx48B-C8GEeAmPaqGAqAOTR2dT0csg8W=TRyULOfy=1=VQ@mail.gmail.com>
In-Reply-To: <CAJs_Fx48B-C8GEeAmPaqGAqAOTR2dT0csg8W=TRyULOfy=1=VQ@mail.gmail.com>
From: Kristian Kristensen <hoegsberg@google.com>
Date: Mon, 13 Jan 2020 09:57:43 -0800
Message-ID: <CAOPc6Tn8CWVzcLoJOGmn3CW6B9FMKf_-NzE8TpwDHsPfoQDaQQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/msm: Add MSM_WAIT_IOVA ioctl
To: Rob Clark <robdclark@chromium.org>
X-Mailman-Approved-At: Tue, 14 Jan 2020 08:19:25 +0000
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
Cc: Brian Ho <brian@brkho.com>, David Airlie <airlied@linux.ie>,
 freedreno <freedreno@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 hoegsberg <hoegsberg@chromium.org>, Sean Paul <sean@poorly.run>
Content-Type: multipart/mixed; boundary="===============0588019574=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0588019574==
Content-Type: multipart/alternative; boundary="000000000000051c10059c0937c3"

--000000000000051c10059c0937c3
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 13, 2020 at 8:25 AM Rob Clark <robdclark@chromium.org> wrote:

> On Mon, Jan 13, 2020 at 7:37 AM Brian Ho <brian@brkho.com> wrote:
> >
> > Implements an ioctl to wait until a value at a given iova is greater
> > than or equal to a supplied value.
> >
> > This will initially be used by turnip (open-source Vulkan driver for
> > QC in mesa) for occlusion queries where the userspace driver can
> > block on a query becoming available before continuing via
> > vkGetQueryPoolResults.
> >
> > Signed-off-by: Brian Ho <brian@brkho.com>
> > ---
> >  drivers/gpu/drm/msm/msm_drv.c | 63 +++++++++++++++++++++++++++++++++--
> >  include/uapi/drm/msm_drm.h    | 13 ++++++++
> >  2 files changed, 74 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_drv.c
> b/drivers/gpu/drm/msm/msm_drv.c
> > index c84f0a8b3f2c..dcc46874a5a2 100644
> > --- a/drivers/gpu/drm/msm/msm_drv.c
> > +++ b/drivers/gpu/drm/msm/msm_drv.c
> > @@ -36,10 +36,11 @@
> >   *           MSM_GEM_INFO ioctl.
> >   * - 1.4.0 - softpin, MSM_RELOC_BO_DUMP, and GEM_INFO support to set/get
> >   *           GEM object's debug name
> > - * - 1.5.0 - Add SUBMITQUERY_QUERY ioctl
> > + * - 1.5.0 - Add SUBMITQUEUE_QUERY ioctl
> > + * - 1.6.0 - Add WAIT_IOVA ioctl
> >   */
> >  #define MSM_VERSION_MAJOR      1
> > -#define MSM_VERSION_MINOR      5
> > +#define MSM_VERSION_MINOR      6
> >  #define MSM_VERSION_PATCHLEVEL 0
> >
> >  static const struct drm_mode_config_funcs mode_config_funcs = {
> > @@ -952,6 +953,63 @@ static int msm_ioctl_submitqueue_close(struct
> drm_device *dev, void *data,
> >         return msm_submitqueue_remove(file->driver_priv, id);
> >  }
> >
> > +static int msm_ioctl_wait_iova(struct drm_device *dev, void *data,
> > +               struct drm_file *file)
> > +{
> > +       struct msm_drm_private *priv = dev->dev_private;
> > +       struct drm_gem_object *obj;
> > +       struct drm_msm_wait_iova *args = data;
> > +       ktime_t timeout = to_ktime(args->timeout);
> > +       unsigned long remaining_jiffies = timeout_to_jiffies(&timeout);
> > +       struct msm_gpu *gpu = priv->gpu;
> > +       void *base_vaddr;
> > +       uint64_t *vaddr;
> > +       int ret;
> > +
> > +       if (args->pad)
> > +               return -EINVAL;
> > +
> > +       if (!gpu)
> > +               return 0;
>
> hmm, I'm not sure we should return zero in this case.. maybe -ENODEV?
>
> > +
> > +       obj = drm_gem_object_lookup(file, args->handle);
> > +       if (!obj)
> > +               return -ENOENT;
> > +
> > +       base_vaddr = msm_gem_get_vaddr(obj);
> > +       if (IS_ERR(base_vaddr)) {
> > +               ret = PTR_ERR(base_vaddr);
> > +               goto err_put_gem_object;
> > +       }
> > +       if (args->offset + sizeof(*vaddr) > obj->size) {
> > +               ret = -EINVAL;
> > +               goto err_put_vaddr;
> > +       }
> > +
> > +       vaddr = base_vaddr + args->offset;
> > +
> > +       /* Assumes WC mapping */
> > +       ret = wait_event_interruptible_timeout(
> > +                       gpu->event, *vaddr >= args->value,
> remaining_jiffies);
>

This needs to do the awkward looking

  (int64_t)(*data - value) >= 0

to properly handle the wraparound case.

> +
> > +       if (ret == 0) {
> > +               ret = -ETIMEDOUT;
> > +               goto err_put_vaddr;
> > +       } else if (ret == -ERESTARTSYS) {
> > +               goto err_put_vaddr;
> > +       }
>
> maybe:
>
>  } else {
>    ret = 0;
>  }
>
> and then drop the next three lines?
>
> > +
> > +       msm_gem_put_vaddr(obj);
> > +       drm_gem_object_put_unlocked(obj);
> > +       return 0;
> > +
> > +err_put_vaddr:
> > +       msm_gem_put_vaddr(obj);
> > +err_put_gem_object:
> > +       drm_gem_object_put_unlocked(obj);
> > +       return ret;
> > +}
> > +
> >  static const struct drm_ioctl_desc msm_ioctls[] = {
> >         DRM_IOCTL_DEF_DRV(MSM_GET_PARAM,    msm_ioctl_get_param,
> DRM_RENDER_ALLOW),
> >         DRM_IOCTL_DEF_DRV(MSM_GEM_NEW,      msm_ioctl_gem_new,
> DRM_RENDER_ALLOW),
> > @@ -964,6 +1022,7 @@ static const struct drm_ioctl_desc msm_ioctls[] = {
> >         DRM_IOCTL_DEF_DRV(MSM_SUBMITQUEUE_NEW,
>  msm_ioctl_submitqueue_new,   DRM_RENDER_ALLOW),
> >         DRM_IOCTL_DEF_DRV(MSM_SUBMITQUEUE_CLOSE,
> msm_ioctl_submitqueue_close, DRM_RENDER_ALLOW),
> >         DRM_IOCTL_DEF_DRV(MSM_SUBMITQUEUE_QUERY,
> msm_ioctl_submitqueue_query, DRM_RENDER_ALLOW),
> > +       DRM_IOCTL_DEF_DRV(MSM_WAIT_IOVA, msm_ioctl_wait_iova,
> DRM_RENDER_ALLOW),
> >  };
> >
> >  static const struct vm_operations_struct vm_ops = {
> > diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
> > index 0b85ed6a3710..8477f28a4ee1 100644
> > --- a/include/uapi/drm/msm_drm.h
> > +++ b/include/uapi/drm/msm_drm.h
> > @@ -298,6 +298,17 @@ struct drm_msm_submitqueue_query {
> >         __u32 pad;
> >  };
> >
> > +/* This ioctl blocks until the u64 value at bo + offset is greater than
> or
> > + * equal to the reference value.
> > + */
> > +struct drm_msm_wait_iova {
> > +       __u32 handle;          /* in, GEM handle */
> > +       __u32 pad;
> > +       struct drm_msm_timespec timeout;   /* in */
> > +       __u64 offset;          /* offset into bo */
> > +       __u64 value;           /* reference value */
>
> Maybe we should go ahead and add a __u64 mask;
>
> that would let us wait for 32b values as well, and wait for bits in a
> bitmask
>

I think we'd be OK to just default to 32 bit values instead, since most of
the CP commands that this is intended to work with (CP_EVENT_WRITE,
CP_WAIT_MEM_GTE etc) operate on 32 bit values. We could move 'value' to the
slot right after 'handle' but then we'd not have any pad/reserved fields.
Maybe we keep 'value' 64 bit but restrict it to 32 bits, with an option to
add a 64 bit flag in 'pad' later on?

>
> Other than those minor comments, it looks pretty good to me
>
> BR,
> -R
>
> > +};
> > +
> >  #define DRM_MSM_GET_PARAM              0x00
> >  /* placeholder:
> >  #define DRM_MSM_SET_PARAM              0x01
> > @@ -315,6 +326,7 @@ struct drm_msm_submitqueue_query {
> >  #define DRM_MSM_SUBMITQUEUE_NEW        0x0A
> >  #define DRM_MSM_SUBMITQUEUE_CLOSE      0x0B
> >  #define DRM_MSM_SUBMITQUEUE_QUERY      0x0C
> > +#define DRM_MSM_WAIT_IOVA      0x0D
> >
> >  #define DRM_IOCTL_MSM_GET_PARAM        DRM_IOWR(DRM_COMMAND_BASE +
> DRM_MSM_GET_PARAM, struct drm_msm_param)
> >  #define DRM_IOCTL_MSM_GEM_NEW          DRM_IOWR(DRM_COMMAND_BASE +
> DRM_MSM_GEM_NEW, struct drm_msm_gem_new)
> > @@ -327,6 +339,7 @@ struct drm_msm_submitqueue_query {
> >  #define DRM_IOCTL_MSM_SUBMITQUEUE_NEW    DRM_IOWR(DRM_COMMAND_BASE +
> DRM_MSM_SUBMITQUEUE_NEW, struct drm_msm_submitqueue)
> >  #define DRM_IOCTL_MSM_SUBMITQUEUE_CLOSE  DRM_IOW (DRM_COMMAND_BASE +
> DRM_MSM_SUBMITQUEUE_CLOSE, __u32)
> >  #define DRM_IOCTL_MSM_SUBMITQUEUE_QUERY  DRM_IOW (DRM_COMMAND_BASE +
> DRM_MSM_SUBMITQUEUE_QUERY, struct drm_msm_submitqueue_query)
> > +#define DRM_IOCTL_MSM_WAIT_IOVA        DRM_IOW (DRM_COMMAND_BASE +
> DRM_MSM_WAIT_IOVA, struct drm_msm_wait_iova)
> >
> >  #if defined(__cplusplus)
> >  }
> > --
> > 2.25.0.rc1.283.g88dfdc4193-goog
> >
>

--000000000000051c10059c0937c3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jan 13, 2020 at 8:25 AM Rob C=
lark &lt;<a href=3D"mailto:robdclark@chromium.org">robdclark@chromium.org</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On=
 Mon, Jan 13, 2020 at 7:37 AM Brian Ho &lt;<a href=3D"mailto:brian@brkho.co=
m" target=3D"_blank">brian@brkho.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Implements an ioctl to wait until a value at a given iova is greater<b=
r>
&gt; than or equal to a supplied value.<br>
&gt;<br>
&gt; This will initially be used by turnip (open-source Vulkan driver for<b=
r>
&gt; QC in mesa) for occlusion queries where the userspace driver can<br>
&gt; block on a query becoming available before continuing via<br>
&gt; vkGetQueryPoolResults.<br>
&gt;<br>
&gt; Signed-off-by: Brian Ho &lt;<a href=3D"mailto:brian@brkho.com" target=
=3D"_blank">brian@brkho.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 drivers/gpu/drm/msm/msm_drv.c | 63 +++++++++++++++++++++++++++++=
++++--<br>
&gt;=C2=A0 include/uapi/drm/msm_drm.h=C2=A0 =C2=A0 | 13 ++++++++<br>
&gt;=C2=A0 2 files changed, 74 insertions(+), 2 deletions(-)<br>
&gt;<br>
&gt; diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_d=
rv.c<br>
&gt; index c84f0a8b3f2c..dcc46874a5a2 100644<br>
&gt; --- a/drivers/gpu/drm/msm/msm_drv.c<br>
&gt; +++ b/drivers/gpu/drm/msm/msm_drv.c<br>
&gt; @@ -36,10 +36,11 @@<br>
&gt;=C2=A0 =C2=A0*=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MSM_GEM_INFO ioc=
tl.<br>
&gt;=C2=A0 =C2=A0* - 1.4.0 - softpin, MSM_RELOC_BO_DUMP, and GEM_INFO suppo=
rt to set/get<br>
&gt;=C2=A0 =C2=A0*=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GEM object&#39;s=
 debug name<br>
&gt; - * - 1.5.0 - Add SUBMITQUERY_QUERY ioctl<br>
&gt; + * - 1.5.0 - Add SUBMITQUEUE_QUERY ioctl<br>
&gt; + * - 1.6.0 - Add WAIT_IOVA ioctl<br>
&gt;=C2=A0 =C2=A0*/<br>
&gt;=C2=A0 #define MSM_VERSION_MAJOR=C2=A0 =C2=A0 =C2=A0 1<br>
&gt; -#define MSM_VERSION_MINOR=C2=A0 =C2=A0 =C2=A0 5<br>
&gt; +#define MSM_VERSION_MINOR=C2=A0 =C2=A0 =C2=A0 6<br>
&gt;=C2=A0 #define MSM_VERSION_PATCHLEVEL 0<br>
&gt;<br>
&gt;=C2=A0 static const struct drm_mode_config_funcs mode_config_funcs =3D =
{<br>
&gt; @@ -952,6 +953,63 @@ static int msm_ioctl_submitqueue_close(struct drm=
_device *dev, void *data,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return msm_submitqueue_remove(file-&g=
t;driver_priv, id);<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt; +static int msm_ioctl_wait_iova(struct drm_device *dev, void *data,<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_fil=
e *file)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct msm_drm_private *priv =3D dev-&gt;d=
ev_private;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_gem_object *obj;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_msm_wait_iova *args =3D data;<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ktime_t timeout =3D to_ktime(args-&gt;time=
out);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long remaining_jiffies =3D timeou=
t_to_jiffies(&amp;timeout);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct msm_gpu *gpu =3D priv-&gt;gpu;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0void *base_vaddr;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0uint64_t *vaddr;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (args-&gt;pad)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL=
;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!gpu)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
<br>
hmm, I&#39;m not sure we should return zero in this case.. maybe -ENODEV?<b=
r>
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0obj =3D drm_gem_object_lookup(file, args-&=
gt;handle);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!obj)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOENT=
;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0base_vaddr =3D msm_gem_get_vaddr(obj);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(base_vaddr)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D PTR_ER=
R(base_vaddr);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto err_put_g=
em_object;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (args-&gt;offset + sizeof(*vaddr) &gt; =
obj-&gt;size) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D -EINVA=
L;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto err_put_v=
addr;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0vaddr =3D base_vaddr + args-&gt;offset;<br=
>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Assumes WC mapping */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D wait_event_interruptible_timeout(<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0gpu-&gt;event, *vaddr &gt;=3D args-&gt;value, remaining_jiffi=
es);<br></blockquote><div><br></div><div>This needs to do the awkward looki=
ng</div><div><br></div><div>=C2=A0 (int64_t)(*data - value) &gt;=3D 0<br></=
div><div><br></div><div>to properly handle the wraparound case.</div><div><=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret =3D=3D 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D -ETIME=
DOUT;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto err_put_v=
addr;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0} else if (ret =3D=3D -ERESTARTSYS) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto err_put_v=
addr;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
maybe:<br>
<br>
=C2=A0} else {<br>
=C2=A0 =C2=A0ret =3D 0;<br>
=C2=A0}<br>
<br>
and then drop the next three lines?<br>
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0msm_gem_put_vaddr(obj);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0drm_gem_object_put_unlocked(obj);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +<br>
&gt; +err_put_vaddr:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0msm_gem_put_vaddr(obj);<br>
&gt; +err_put_gem_object:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0drm_gem_object_put_unlocked(obj);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +}<br>
&gt; +<br>
&gt;=C2=A0 static const struct drm_ioctl_desc msm_ioctls[] =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_IOCTL_DEF_DRV(MSM_GET_PARAM,=C2=
=A0 =C2=A0 msm_ioctl_get_param,=C2=A0 =C2=A0 DRM_RENDER_ALLOW),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_IOCTL_DEF_DRV(MSM_GEM_NEW,=C2=A0 =
=C2=A0 =C2=A0 msm_ioctl_gem_new,=C2=A0 =C2=A0 =C2=A0 DRM_RENDER_ALLOW),<br>
&gt; @@ -964,6 +1022,7 @@ static const struct drm_ioctl_desc msm_ioctls[] =
=3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_IOCTL_DEF_DRV(MSM_SUBMITQUEUE_NEW=
,=C2=A0 =C2=A0msm_ioctl_submitqueue_new,=C2=A0 =C2=A0DRM_RENDER_ALLOW),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_IOCTL_DEF_DRV(MSM_SUBMITQUEUE_CLO=
SE, msm_ioctl_submitqueue_close, DRM_RENDER_ALLOW),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_IOCTL_DEF_DRV(MSM_SUBMITQUEUE_QUE=
RY, msm_ioctl_submitqueue_query, DRM_RENDER_ALLOW),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_IOCTL_DEF_DRV(MSM_WAIT_IOVA, msm_ioctl=
_wait_iova, DRM_RENDER_ALLOW),<br>
&gt;=C2=A0 };<br>
&gt;<br>
&gt;=C2=A0 static const struct vm_operations_struct vm_ops =3D {<br>
&gt; diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h<b=
r>
&gt; index 0b85ed6a3710..8477f28a4ee1 100644<br>
&gt; --- a/include/uapi/drm/msm_drm.h<br>
&gt; +++ b/include/uapi/drm/msm_drm.h<br>
&gt; @@ -298,6 +298,17 @@ struct drm_msm_submitqueue_query {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 pad;<br>
&gt;=C2=A0 };<br>
&gt;<br>
&gt; +/* This ioctl blocks until the u64 value at bo + offset is greater th=
an or<br>
&gt; + * equal to the reference value.<br>
&gt; + */<br>
&gt; +struct drm_msm_wait_iova {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 handle;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 /* in, GEM handle */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 pad;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_msm_timespec timeout;=C2=A0 =C2=
=A0/* in */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0__u64 offset;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 /* offset into bo */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0__u64 value;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0/* reference value */<br>
<br>
Maybe we should go ahead and add a __u64 mask;<br>
<br>
that would let us wait for 32b values as well, and wait for bits in a bitma=
sk<br></blockquote><div><br></div><div>I think we&#39;d be OK to just defau=
lt to 32 bit values instead, since most of the CP commands that this is int=
ended to work with (CP_EVENT_WRITE, CP_WAIT_MEM_GTE etc) operate on 32 bit =
values. We could move &#39;value&#39; to the slot right after &#39;handle&#=
39; but then we&#39;d not have any pad/reserved fields. Maybe we keep &#39;=
value&#39; 64 bit but restrict it to 32 bits, with an option to add a 64 bi=
t flag in &#39;pad&#39; later on?</div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">
<br>
Other than those minor comments, it looks pretty good to me<br>
<br>
BR,<br>
-R<br>
<br>
&gt; +};<br>
&gt; +<br>
&gt;=C2=A0 #define DRM_MSM_GET_PARAM=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 0x00<br>
&gt;=C2=A0 /* placeholder:<br>
&gt;=C2=A0 #define DRM_MSM_SET_PARAM=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 0x01<br>
&gt; @@ -315,6 +326,7 @@ struct drm_msm_submitqueue_query {<br>
&gt;=C2=A0 #define DRM_MSM_SUBMITQUEUE_NEW=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x0A<=
br>
&gt;=C2=A0 #define DRM_MSM_SUBMITQUEUE_CLOSE=C2=A0 =C2=A0 =C2=A0 0x0B<br>
&gt;=C2=A0 #define DRM_MSM_SUBMITQUEUE_QUERY=C2=A0 =C2=A0 =C2=A0 0x0C<br>
&gt; +#define DRM_MSM_WAIT_IOVA=C2=A0 =C2=A0 =C2=A0 0x0D<br>
&gt;<br>
&gt;=C2=A0 #define DRM_IOCTL_MSM_GET_PARAM=C2=A0 =C2=A0 =C2=A0 =C2=A0 DRM_I=
OWR(DRM_COMMAND_BASE + DRM_MSM_GET_PARAM, struct drm_msm_param)<br>
&gt;=C2=A0 #define DRM_IOCTL_MSM_GEM_NEW=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
DRM_IOWR(DRM_COMMAND_BASE + DRM_MSM_GEM_NEW, struct drm_msm_gem_new)<br>
&gt; @@ -327,6 +339,7 @@ struct drm_msm_submitqueue_query {<br>
&gt;=C2=A0 #define DRM_IOCTL_MSM_SUBMITQUEUE_NEW=C2=A0 =C2=A0 DRM_IOWR(DRM_=
COMMAND_BASE + DRM_MSM_SUBMITQUEUE_NEW, struct drm_msm_submitqueue)<br>
&gt;=C2=A0 #define DRM_IOCTL_MSM_SUBMITQUEUE_CLOSE=C2=A0 DRM_IOW (DRM_COMMA=
ND_BASE + DRM_MSM_SUBMITQUEUE_CLOSE, __u32)<br>
&gt;=C2=A0 #define DRM_IOCTL_MSM_SUBMITQUEUE_QUERY=C2=A0 DRM_IOW (DRM_COMMA=
ND_BASE + DRM_MSM_SUBMITQUEUE_QUERY, struct drm_msm_submitqueue_query)<br>
&gt; +#define DRM_IOCTL_MSM_WAIT_IOVA=C2=A0 =C2=A0 =C2=A0 =C2=A0 DRM_IOW (D=
RM_COMMAND_BASE + DRM_MSM_WAIT_IOVA, struct drm_msm_wait_iova)<br>
&gt;<br>
&gt;=C2=A0 #if defined(__cplusplus)<br>
&gt;=C2=A0 }<br>
&gt; --<br>
&gt; 2.25.0.rc1.283.g88dfdc4193-goog<br>
&gt;<br>
</blockquote></div></div>

--000000000000051c10059c0937c3--

--===============0588019574==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0588019574==--
