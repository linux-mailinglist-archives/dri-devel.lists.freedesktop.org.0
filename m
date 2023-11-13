Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D6D7EA195
	for <lists+dri-devel@lfdr.de>; Mon, 13 Nov 2023 18:02:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 338E310E002;
	Mon, 13 Nov 2023 17:02:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3765610E002
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 17:02:03 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-53dfc28a2afso7111255a12.1
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 09:02:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1699894921; x=1700499721;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ekBSHP/1YeU9jwYcmsP3zzbhcplNaOryrB1NGQEPyWc=;
 b=a+bQxAkQkXUNcu9LyPLjeFQZV4jlMVn/crkVWQnTtaHjKc8ZScmcP9EFFHCvA5eUd3
 dBrcWmltlE3FaEGrzYgPfDJP86lWrGXbhDt7MFXF20ol5TzymVHE7OA3i6L3uFhdVQm0
 gab3WlWO9I++hWiFgklft7KGLiWmw2wpuX06U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699894921; x=1700499721;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ekBSHP/1YeU9jwYcmsP3zzbhcplNaOryrB1NGQEPyWc=;
 b=tGWAkL/kKrAQJPNFdy7+CocJSFC09iSLD88YPK73/oVARpQldl9EJsRI49h4Qgx1J4
 WB3FTNl+w/aOznGDfX2GzTBxq4CWiJopQrMOls29FtJn74e25xVd5fcD6gA8kNuofdgK
 /tS5OOa4FvhH9VGvjyaAwvBn+dlo8F3n9U2w5shp9l3wTui2MJwjuID27pFXkFbEvKop
 5F9V5vAUgBP1RNfh5djQ62Cz7JYrjscaOVPlZKfbTa+BhWcH/j2FCRpFi/0hCOxJAw3M
 G0GfSe+g1spWLCsXaUllHd1Qfo+iJIOdVzv/HtKXaIoMBykBKzmtglYzV3pADhB4oGhu
 ho5A==
X-Gm-Message-State: AOJu0YxDwV5cMdNzCz9QaLa5klypov7OVicQz2YQbEXSc0NjvuEo7OrQ
 3VdiubFn4qxFf4kBA9MwphY6IYXU46jwinBXQANdkg==
X-Google-Smtp-Source: AGHT+IHtMmMZaR3ECa29smPLB+QQx8SRK5r0v+WH+pjGwnV7RTv7owYPUAYxVoowdINKaXRQ0cONNQ==
X-Received: by 2002:aa7:d5cd:0:b0:53b:9948:cc1f with SMTP id
 d13-20020aa7d5cd000000b0053b9948cc1fmr5491992eds.12.1699894921254; 
 Mon, 13 Nov 2023 09:02:01 -0800 (PST)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com.
 [209.85.208.41]) by smtp.gmail.com with ESMTPSA id
 g24-20020a50d5d8000000b0054037c6676esm3989232edj.69.2023.11.13.09.02.01
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Nov 2023 09:02:01 -0800 (PST)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-54366bb1c02so16931a12.1
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 09:02:01 -0800 (PST)
X-Received: by 2002:a05:6402:518d:b0:544:e249:be8f with SMTP id
 q13-20020a056402518d00b00544e249be8fmr178013edd.1.1699894920683; Mon, 13 Nov
 2023 09:02:00 -0800 (PST)
MIME-Version: 1.0
References: <20231111224236.890431-1-dmitry.osipenko@collabora.com>
In-Reply-To: <20231111224236.890431-1-dmitry.osipenko@collabora.com>
From: Gurchetan Singh <gurchetansingh@chromium.org>
Date: Mon, 13 Nov 2023 09:01:47 -0800
X-Gmail-Original-Message-ID: <CAAfnVBmrqDTADFSuxLr2iiT0re8pv0H_==htjDnDQahxo0u+1A@mail.gmail.com>
Message-ID: <CAAfnVBmrqDTADFSuxLr2iiT0re8pv0H_==htjDnDQahxo0u+1A@mail.gmail.com>
Subject: Re: [PATCH v1] drm/virtio: Fix return value for
 VIRTGPU_CONTEXT_PARAM_DEBUG_NAME
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Type: multipart/alternative; boundary="000000000000e7da1f060a0ba0f4"
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Gerd Hoffmann <kraxel@redhat.com>, David Airlie <airlied@redhat.com>,
 kernel@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000e7da1f060a0ba0f4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 11, 2023 at 2:43=E2=80=AFPM Dmitry Osipenko <
dmitry.osipenko@collabora.com> wrote:

> The strncpy_from_user() returns number of copied bytes and not zero on
> success. The non-zero return value of ioctl is treated as error. Return
> zero on success instead of the number of copied bytes.
>
> Fixes: 7add80126bce ("drm/uapi: add explicit virtgpu context debug name")
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>

Reviewed-by: Gurchetan Singh <gurchetansingh@chromium.org>


> ---
>  drivers/gpu/drm/virtio/virtgpu_ioctl.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> index 1e2042419f95..e4f76f315550 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> @@ -665,6 +665,7 @@ static int virtio_gpu_context_init_ioctl(struct
> drm_device *dev,
>                                 goto out_unlock;
>
>                         vfpriv->explicit_debug_name =3D true;
> +                       ret =3D 0;
>                         break;
>                 default:
>                         ret =3D -EINVAL;
> --
> 2.41.0
>
>

--000000000000e7da1f060a0ba0f4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sat, Nov 11, 2023 at 2:43=E2=80=AF=
PM Dmitry Osipenko &lt;<a href=3D"mailto:dmitry.osipenko@collabora.com">dmi=
try.osipenko@collabora.com</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">The strncpy_from_user() returns number of copied =
bytes and not zero on<br>
success. The non-zero return value of ioctl is treated as error. Return<br>
zero on success instead of the number of copied bytes.<br>
<br>
Fixes: 7add80126bce (&quot;drm/uapi: add explicit virtgpu context debug nam=
e&quot;)<br>
Signed-off-by: Dmitry Osipenko &lt;<a href=3D"mailto:dmitry.osipenko@collab=
ora.com" target=3D"_blank">dmitry.osipenko@collabora.com</a>&gt;<br></block=
quote><div><br></div><div>Reviewed-by: Gurchetan Singh &lt;<a href=3D"mailt=
o:gurchetansingh@chromium.org">gurchetansingh@chromium.org</a>&gt;</div><di=
v>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0drivers/gpu/drm/virtio/virtgpu_ioctl.c | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virti=
o/virtgpu_ioctl.c<br>
index 1e2042419f95..e4f76f315550 100644<br>
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c<br>
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c<br>
@@ -665,6 +665,7 @@ static int virtio_gpu_context_init_ioctl(struct drm_dev=
ice *dev,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out_unlock;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 vfpriv-&gt;explicit_debug_name =3D true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ret =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 default:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ret =3D -EINVAL;<br>
-- <br>
2.41.0<br>
<br>
</blockquote></div></div>

--000000000000e7da1f060a0ba0f4--
