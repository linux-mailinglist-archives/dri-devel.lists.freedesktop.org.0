Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE2D7CB3BC
	for <lists+dri-devel@lfdr.de>; Mon, 16 Oct 2023 22:10:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E528310E105;
	Mon, 16 Oct 2023 20:10:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x92b.google.com (mail-ua1-x92b.google.com
 [IPv6:2607:f8b0:4864:20::92b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45E5710E105
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 20:10:27 +0000 (UTC)
Received: by mail-ua1-x92b.google.com with SMTP id
 a1e0cc1a2514c-7b66622b05aso936385241.0
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 13:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697487026; x=1698091826; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=nwG3c59gHv++gFl7DkhWPj0XmZY+iArfcMFw6yKPGZw=;
 b=KJFulBkgYE4wWIr+5o9nAkdh2bZC2H4eL2XGRtc4Ykq7bDfrD299ktgE/ZjItFXoku
 TyyVbh5KfVgGo1hC6Y/7Kk4umptITfiUFgjPDq/1661lDeDXwUI8Kyf7L5i5nYXAKHqD
 qKZ+7p4FlmTA2KdfMM1xta4wj9MxB/MbcVoQGawht09MMA24GHm8lcEvLM0gu6sV/h/g
 h3Eocoh/MkMMZZ10uoxGXTyFD3pUv/7Y56JAmXcngLtNsNBG+9dV5RW7HPwLhixvhs7x
 S+fjFs9mL257qalyM9dIqq0C/kYrY8KMD2RGg3rjHOIPPsLLEHt2esBUmMJmYvGSzMR9
 3n7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697487026; x=1698091826;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nwG3c59gHv++gFl7DkhWPj0XmZY+iArfcMFw6yKPGZw=;
 b=NwNfKk/23zxNg5i165RibS9brJ9ZvE9+uiVFB4Xwe8VpYP6OstTLJR/FjRpl+MTFSD
 OXsYV3J6jjJHXz/qdxARvWXzmYl1vQsVm3OQkM5/91kaVwJYSBAE7/9R+byfFKVac0jM
 bwzqySF9dhX1u2pw1IP6vNSyJeyl7NSYlCmJ0eqNHbN0kwfFoWYpMWEkHqKqU07i8yX9
 jm+PSwipwa6MBmqQ9kH/cm1KNtiWHQvhIB5NQhIKxo9j10obpmGEZRrz44m98M+wy+JP
 XhXgoNIbI1nq2nucadJHUGSrsIppl5GxgZFu84JSXnstW79IWf4n1GgY2mqv0UV3HnZG
 WmKQ==
X-Gm-Message-State: AOJu0YzVX39KXZk38fV+9VfHaELH2iIYHCrLugemRl8CDp4nWGZp3Mhm
 ec23yiRgbnuAfHjhoxJn1T6SffwFmDm3EdKwbDA=
X-Google-Smtp-Source: AGHT+IFOsDW2MfK17F2xaqqSrmRpPCdEHQrpidEXnOjBaPM6yBbefghBA0UL0FlnhNZ1a1BArX8X7cbHi8CFXtX3kCk=
X-Received: by 2002:a67:e192:0:b0:457:c10a:28d5 with SMTP id
 e18-20020a67e192000000b00457c10a28d5mr435977vsl.20.1697487026149; Mon, 16 Oct
 2023 13:10:26 -0700 (PDT)
MIME-Version: 1.0
References: <20231016184200.639-1-gurchetansingh@chromium.org>
In-Reply-To: <20231016184200.639-1-gurchetansingh@chromium.org>
From: Josh Simonot <josh.simonot@gmail.com>
Date: Mon, 16 Oct 2023 16:10:15 -0400
Message-ID: <CAP1LCYew6fKJRLTEYyqj=zaaN6v3aLVJyFxRmsSv14DZtSDWHQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/virtio: use uint64_t more in
 virtio_gpu_context_init_ioctl
To: Gurchetan Singh <gurchetansingh@chromium.org>
Content-Type: multipart/alternative; boundary="00000000000034617d0607daff42"
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
Cc: dmitry.osipenko@collabora.com, kraxel@redhat.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--00000000000034617d0607daff42
Content-Type: text/plain; charset="UTF-8"

Reviewed-by: Josh Simonot <josh.simonot at gmail.com>


On Mon, 16 Oct 2023 at 14:42, Gurchetan Singh <gurchetansingh@chromium.org>
wrote:

> drm_virtgpu_context_set_param defines both param and
> value to be u64s.
>
> Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
> ---
>  drivers/gpu/drm/virtio/virtgpu_ioctl.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> index b24b11f25197..8d13b17c215b 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> @@ -565,8 +565,8 @@ static int virtio_gpu_context_init_ioctl(struct
> drm_device *dev,
>                                          void *data, struct drm_file *file)
>  {
>         int ret = 0;
> -       uint32_t num_params, i, param, value;
> -       uint64_t valid_ring_mask;
> +       uint32_t num_params, i;
> +       uint64_t valid_ring_mask, param, value;
>         size_t len;
>         struct drm_virtgpu_context_set_param *ctx_set_params = NULL;
>         struct virtio_gpu_device *vgdev = dev->dev_private;
> --
> 2.42.0.655.g421f12c284-goog
>
>

--00000000000034617d0607daff42
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><pre><font size=3D"2" style=3D"font-famil=
y:arial,sans-serif">Reviewed-by: Josh Simonot &lt;josh.simonot at <a href=
=3D"http://gmail.com">gmail.com</a>&gt;</font></pre></div><br><div class=3D=
"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 16 Oct 2023 at =
14:42, Gurchetan Singh &lt;<a href=3D"mailto:gurchetansingh@chromium.org">g=
urchetansingh@chromium.org</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">drm_virtgpu_context_set_param defines both param =
and<br>
value to be u64s.<br>
<br>
Signed-off-by: Gurchetan Singh &lt;<a href=3D"mailto:gurchetansingh@chromiu=
m.org" target=3D"_blank">gurchetansingh@chromium.org</a>&gt;<br>
---<br>
=C2=A0drivers/gpu/drm/virtio/virtgpu_ioctl.c | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virti=
o/virtgpu_ioctl.c<br>
index b24b11f25197..8d13b17c215b 100644<br>
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c<br>
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c<br>
@@ -565,8 +565,8 @@ static int virtio_gpu_context_init_ioctl(struct drm_dev=
ice *dev,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vo=
id *data, struct drm_file *file)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int ret =3D 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t num_params, i, param, value;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0uint64_t valid_ring_mask;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t num_params, i;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0uint64_t valid_ring_mask, param, value;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 size_t len;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_virtgpu_context_set_param *ctx_set_p=
arams =3D NULL;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct virtio_gpu_device *vgdev =3D dev-&gt;dev=
_private;<br>
-- <br>
2.42.0.655.g421f12c284-goog<br>
<br>
</blockquote></div></div>

--00000000000034617d0607daff42--
