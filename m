Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E74F4B7C6E
	for <lists+dri-devel@lfdr.de>; Wed, 16 Feb 2022 02:33:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1029D10E196;
	Wed, 16 Feb 2022 01:32:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4EFC10E196
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Feb 2022 01:32:57 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id d10so1039452eje.10
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Feb 2022 17:32:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Sp7BCWIo45dUgDZ6Yeet+HVNBAxj5eJOd+Cy1XLZ2f8=;
 b=h64up5gwC+DME3RYkAv/xtT38PBrUhx8RlwtNtdfjGy0qVK47DQH13pPuOpT/+hxjz
 mBcfxYbPOSBpvzdHAu4jXWaEhfLSWkMZsxFzOZr0qPVXJV3ZGJ+zUWdnMffzk7qAZUnQ
 2QkFS2k4xx7K5DF58Oi9W3pF93xHzjyDv9EuA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Sp7BCWIo45dUgDZ6Yeet+HVNBAxj5eJOd+Cy1XLZ2f8=;
 b=Nmz/TsIFqbpNkuCZkbiXozL49UuMg1snIcN1P2ZdxRj5Ty62hk8XeXJkOyMAGAojNB
 Ys6jVr6iCNF2W+KrpGcNBrUAtq1D/q55LxbKQYg8LgL9CrrpdzhX8tg4XpDrg5CYRolZ
 aV2l9KEO3O4omoetz4JPCB8R2fIz6ANlWI6tJxkUgDsvbEupQHAU+w5iJsqkVf5yvlfI
 7EHrExc2gwQcPuMlhUMEFu41tsEB/8MkpgvZPmCY2P9NST540EDt5Yx8aJMys5lP6mbR
 na+0JFpNLPOeYMpRLjnGpmGyDK04L6ZhkAsJfhbb6V3HnKt61lTjUkgu6WPR+1javAUa
 YzjQ==
X-Gm-Message-State: AOAM531d/W/bIu2qO0fuiQphBGCzmqlb8Q6gtbKJqUOSsjv7i0U9C35h
 5KrKYhqZG/MrpGs0Ikl+R0UhNyzzHIsCnR+S
X-Google-Smtp-Source: ABdhPJySmLYNz4rv6SUCveu8eiZxtAxDKpjTmfwYhVpjcBFtlHB2g8gFjYa/GtR1acsHOX2jLeYihw==
X-Received: by 2002:a17:906:3152:b0:6cf:7204:5cf0 with SMTP id
 e18-20020a170906315200b006cf72045cf0mr483063eje.449.1644975175703; 
 Tue, 15 Feb 2022 17:32:55 -0800 (PST)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com.
 [209.85.221.50])
 by smtp.gmail.com with ESMTPSA id ek21sm729625edb.27.2022.02.15.17.32.52
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Feb 2022 17:32:53 -0800 (PST)
Received: by mail-wr1-f50.google.com with SMTP id d27so904560wrb.5
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Feb 2022 17:32:52 -0800 (PST)
X-Received: by 2002:a5d:63c3:0:b0:1e3:240a:550f with SMTP id
 c3-20020a5d63c3000000b001e3240a550fmr466622wrw.402.1644975172490; Tue, 15 Feb
 2022 17:32:52 -0800 (PST)
MIME-Version: 1.0
References: <20220216011614.360451-1-robdclark@gmail.com>
In-Reply-To: <20220216011614.360451-1-robdclark@gmail.com>
From: Gurchetan Singh <gurchetansingh@chromium.org>
Date: Tue, 15 Feb 2022 17:32:41 -0800
X-Gmail-Original-Message-ID: <CAAfnVB=8pQbRit50q3HaKU5Q+33uLLESh4=FAHje9gvZ+O8K1A@mail.gmail.com>
Message-ID: <CAAfnVB=8pQbRit50q3HaKU5Q+33uLLESh4=FAHje9gvZ+O8K1A@mail.gmail.com>
Subject: Re: [PATCH] drm/virtio: Fix capset-id query size
To: Rob Clark <robdclark@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000d2b80a05d818a023"
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Lingfeng Yang <lfy@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000d2b80a05d818a023
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 15, 2022 at 5:15 PM Rob Clark <robdclark@gmail.com> wrote:

> From: Rob Clark <robdclark@chromium.org>
>
> The UABI was already defined for pointer to 64b value, and all the
> userspace users of this ioctl that I could find are already using a
> uint64_t (but zeroing it out to work around kernel only copying 32b).
> Unfortunately this ioctl doesn't have a length field, so out of paranoia
> I restricted the change to copy 64b to the single 64b param that can be
> queried.
>
> Fixes: 78aa20fa4381 ("drm/virtio: implement context init: advertise
> feature to userspace")
> Signed-off-by: Rob Clark <robdclark@chromium.org>
>

Reviewed-by: Gurchetan Singh <gurchetansingh@chromium.org>


> ---
>  drivers/gpu/drm/virtio/virtgpu_ioctl.c | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> index 0f2f3f54dbf9..0158d27d5645 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> @@ -269,7 +269,8 @@ static int virtio_gpu_getparam_ioctl(struct drm_device
> *dev, void *data,
>  {
>         struct virtio_gpu_device *vgdev = dev->dev_private;
>         struct drm_virtgpu_getparam *param = data;
> -       int value;
> +       int value, ret, sz = sizeof(int);
> +       uint64_t value64;
>
>         switch (param->param) {
>         case VIRTGPU_PARAM_3D_FEATURES:
> @@ -291,13 +292,20 @@ static int virtio_gpu_getparam_ioctl(struct
> drm_device *dev, void *data,
>                 value = vgdev->has_context_init ? 1 : 0;
>                 break;
>         case VIRTGPU_PARAM_SUPPORTED_CAPSET_IDs:
> -               value = vgdev->capset_id_mask;
> +               value64 = vgdev->capset_id_mask;
> +               sz = sizeof(value64);
>                 break;
>         default:
>                 return -EINVAL;
>         }
> -       if (copy_to_user(u64_to_user_ptr(param->value), &value,
> sizeof(int)))
> -               return -EFAULT;
> +
> +       if (sz == sizeof(int)) {
> +               if (copy_to_user(u64_to_user_ptr(param->value), &value,
> sz))
> +                       return -EFAULT;
> +       } else {
> +               if (copy_to_user(u64_to_user_ptr(param->value), &value64,
> sz))
> +                       return -EFAULT;
> +       }
>
>         return 0;
>  }
> --
> 2.34.1
>
>

--000000000000d2b80a05d818a023
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Feb 15, 2022 at 5:15 PM Rob C=
lark &lt;<a href=3D"mailto:robdclark@gmail.com">robdclark@gmail.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Ro=
b Clark &lt;<a href=3D"mailto:robdclark@chromium.org" target=3D"_blank">rob=
dclark@chromium.org</a>&gt;<br>
<br>
The UABI was already defined for pointer to 64b value, and all the<br>
userspace users of this ioctl that I could find are already using a<br>
uint64_t (but zeroing it out to work around kernel only copying 32b).<br>
Unfortunately this ioctl doesn&#39;t have a length field, so out of paranoi=
a<br>
I restricted the change to copy 64b to the single 64b param that can be<br>
queried.<br>
<br>
Fixes: 78aa20fa4381 (&quot;drm/virtio: implement context init: advertise fe=
ature to userspace&quot;)<br>
Signed-off-by: Rob Clark &lt;<a href=3D"mailto:robdclark@chromium.org" targ=
et=3D"_blank">robdclark@chromium.org</a>&gt;<br></blockquote><div><br></div=
><div><span class=3D"gmail-il">Reviewed</span>-<span class=3D"gmail-il">by<=
/span>:=C2=A0<span class=3D"gmail-il">Gurchetan</span>=C2=A0<span class=3D"=
gmail-il">Singh</span>=C2=A0&lt;<a href=3D"mailto:gurchetansingh@chromium.o=
rg" target=3D"_blank">gurchetansingh@chromium.org</a>&gt;</div><div>=C2=A0<=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0drivers/gpu/drm/virtio/virtgpu_ioctl.c | 16 ++++++++++++----<br>
=C2=A01 file changed, 12 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virti=
o/virtgpu_ioctl.c<br>
index 0f2f3f54dbf9..0158d27d5645 100644<br>
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c<br>
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c<br>
@@ -269,7 +269,8 @@ static int virtio_gpu_getparam_ioctl(struct drm_device =
*dev, void *data,<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct virtio_gpu_device *vgdev =3D dev-&gt;dev=
_private;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_virtgpu_getparam *param =3D data;<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int value;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int value, ret, sz =3D sizeof(int);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0uint64_t value64;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (param-&gt;param) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 case VIRTGPU_PARAM_3D_FEATURES:<br>
@@ -291,13 +292,20 @@ static int virtio_gpu_getparam_ioctl(struct drm_devic=
e *dev, void *data,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 value =3D vgdev-&gt=
;has_context_init ? 1 : 0;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 case VIRTGPU_PARAM_SUPPORTED_CAPSET_IDs:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0value =3D vgdev-&gt=
;capset_id_mask;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0value64 =3D vgdev-&=
gt;capset_id_mask;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sz =3D sizeof(value=
64);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 default:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (copy_to_user(u64_to_user_ptr(param-&gt;valu=
e), &amp;value, sizeof(int)))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EFAULT;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (sz =3D=3D sizeof(int)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (copy_to_user(u6=
4_to_user_ptr(param-&gt;value), &amp;value, sz))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return -EFAULT;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (copy_to_user(u6=
4_to_user_ptr(param-&gt;value), &amp;value64, sz))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return -EFAULT;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
=C2=A0}<br>
-- <br>
2.34.1<br>
<br>
</blockquote></div></div>

--000000000000d2b80a05d818a023--
