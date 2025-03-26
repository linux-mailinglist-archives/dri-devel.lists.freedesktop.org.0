Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60CB1A720F2
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 22:44:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10E7C10E1FD;
	Wed, 26 Mar 2025 21:44:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="eoVNdm4k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEDD510E1FD
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 21:44:22 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-ac345bd8e13so54890066b.0
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 14:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1743025461; x=1743630261;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5dx/obphFoFo4Mb9gqnODL9r6o5YzsqbFT7hm/AOErQ=;
 b=eoVNdm4knzBa7V7pJSI6fIkFUi1YAtDy0Q1IUp5ob4EDluHDdmXCGxF4ZNDJTwilbT
 dgdFdBik51F69ANYJZ9rhAfGBT9mdLekhT69sC1eqpZDQSeSIFd5AfS+S32C92nIOm3L
 H90gfG6MRbuCHcMnK+yTlPsS7R7m1MHOt28JE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743025461; x=1743630261;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5dx/obphFoFo4Mb9gqnODL9r6o5YzsqbFT7hm/AOErQ=;
 b=ErfseY7OCGJwJSQFyDEAiTXXK7Usar8STsOfvjWxHJlQLMUYvTdq4K0GubSoUtbp/I
 kB/uIdPfvvaDsxhVU+AaLPFZ8zhC2NqaI1CtxGFZiuFEN2o9St769ppCGxp/yoPgF47Q
 6CyUmNJ3IV19KBot46+OBy5SkTkHAjKboyioeTaYrCCDUTSsYJK7l5J/C+8eQLllYuCL
 r9fNpP/Z8hQPj0gYPYrAM1KLA725ZV5JyZrIpr8peVpZWWffLzMCpl27Sd0NDV6TuH2N
 cpp4UyLy2NcUY9HJNFFhfBTuDqrfsUSX5YyXy+YuTrxqLSUCz8xvVOId/4NHUBbdRuMF
 I6nQ==
X-Gm-Message-State: AOJu0YzzC1Q40d0XGcOF49QqkgMufykf91rGEsegVAljz8mQyxtljGx2
 3UOSdL81CzilLbMz6DlEzMVfNVOc6ewni2gkzATsU1Vmw+ViAmo7BPVKT/pMrhKiHVpSBM5TVps
 =
X-Gm-Gg: ASbGncuV6egKYtlHbcJxpKzk2Q7BBwHN6kHK0/McTjT+ZgA6H17wIg0ibp4gnzTNRs7
 TWS8H4IBYHy3Jw3AhARaTDuDKu/zyjQAfaj8bbqJ96BDBBMHOjg0J4a/r7Wmn8qjpg3AMCnLYIz
 AVtSd67PM9sQV+UivamC02eqCfjbXPuYavDTyAWzqDmbmULKPv3OaEicXFItmEKgK5iUn92huDI
 GOMKFV0uYvI7bhlJnEanQmbdbdBRB62sIEFZvJJ/lGmDjy6PsVkh9yJPckGSnjMfhjGe91ZLlVF
 CGW7+XHUdM+st5Fo0svlE0WdwunNROANMHiv2Z5ED493Iz5wuqTzlcV8cQcuNSCA9LipC+T9UPm
 B+clErMzh4/EY61ek
X-Google-Smtp-Source: AGHT+IHZNWOXFAuyyhXkcRSE9d+E1hUHbB88AIh10MfyqsaOWgJ64iqFcDJ8MfmA/TPJq5mMlopfuQ==
X-Received: by 2002:a17:906:c109:b0:ac2:49de:3969 with SMTP id
 a640c23a62f3a-ac6fb15d135mr104302366b.47.1743025460837; 
 Wed, 26 Mar 2025 14:44:20 -0700 (PDT)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com.
 [209.85.208.41]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac3efd955aasm1097781966b.180.2025.03.26.14.44.20
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Mar 2025 14:44:20 -0700 (PDT)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-5e5cbd8b19bso1433a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 14:44:20 -0700 (PDT)
X-Received: by 2002:aa7:c954:0:b0:5dc:ccb4:cb11 with SMTP id
 4fb4d7f45d1cf-5edaae205aamr12824a12.4.1743025459746; Wed, 26 Mar 2025
 14:44:19 -0700 (PDT)
MIME-Version: 1.0
References: <YT3PR01MB58570C381CB52E7EF5B1E751AFA72@YT3PR01MB5857.CANPRD01.PROD.OUTLOOK.COM>
In-Reply-To: <YT3PR01MB58570C381CB52E7EF5B1E751AFA72@YT3PR01MB5857.CANPRD01.PROD.OUTLOOK.COM>
From: Gurchetan Singh <gurchetansingh@chromium.org>
Date: Wed, 26 Mar 2025 14:44:06 -0700
X-Gmail-Original-Message-ID: <CAAfnVBnJKLuDSn+2M_H0t_spyaZPH09hkkqcJ_6Hk2Lmhs8bzA@mail.gmail.com>
X-Gm-Features: AQ5f1JpurXDZW6EFPebDlkKFpzB3Ml7FKOA3SV6ts657De-G820kDSBGR7bQZjY
Message-ID: <CAAfnVBnJKLuDSn+2M_H0t_spyaZPH09hkkqcJ_6Hk2Lmhs8bzA@mail.gmail.com>
Subject: Re: [PATCH] drm/virtio: Add capset definitions
To: Aaron Ruby <aruby@qnx.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Type: multipart/alternative; boundary="0000000000005d6e7b063145bded"
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

--0000000000005d6e7b063145bded
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 25, 2025 at 8:42=E2=80=AFAM Aaron Ruby <aruby@qnx.com> wrote:

> From 73e0b6fb04d90b70de1f40e8e2ffc8fe497fa204 Mon Sep 17 00:00:00 2001
> From: Aaron Ruby <aruby@qnx.com>
> Date: Mon, 24 Mar 2025 16:18:43 -0400
> Subject: [PATCH] drm/virtio: Add capset definitions
>
> Since the context-type additions to the virtio-gpu spec, these have been
> defined locally in guest user-space, and virtio-gpu backend library code.
>
> Now, these capsets have been stabilized, and should be defined in
> a common space, in both the virtio_gpu header, and alongside the
> virtgpu_drm
> interface that they apply to.
> ---
>  include/uapi/drm/virtgpu_drm.h  | 6 ++++++
>  include/uapi/linux/virtio_gpu.h | 3 ++-
>  2 files changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/include/uapi/drm/virtgpu_drm.h
> b/include/uapi/drm/virtgpu_drm.h
> index c2ce71987e9b..9debb320c34b 100644
> --- a/include/uapi/drm/virtgpu_drm.h
> +++ b/include/uapi/drm/virtgpu_drm.h
> @@ -163,6 +163,12 @@ struct drm_virtgpu_3d_wait {
>          __u32 flags;
>  };
>
> +#define VIRTGPU_DRM_CAPSET_VIRGL 1
> +#define VIRTGPU_DRM_CAPSET_VIRGL2 2
> +#define VIRTGPU_DRM_CAPSET_GFXSTREAM_VULKAN 3
> +#define VIRTGPU_DRM_CAPSET_VENUS 4
> +#define VIRTGPU_DRM_CAPSET_CROSS_DOMAIN 5
> +#define VIRTGPU_DRM_CAPSET_DRM 6
>  struct drm_virtgpu_get_caps {
>          __u32 cap_set_id;
>          __u32 cap_set_ver;
> diff --git a/include/uapi/linux/virtio_gpu.h
> b/include/uapi/linux/virtio_gpu.h
> index bf2c9cabd207..be109777d10d 100644
> --- a/include/uapi/linux/virtio_gpu.h
> +++ b/include/uapi/linux/virtio_gpu.h
> @@ -309,8 +309,9 @@ struct virtio_gpu_cmd_submit {
>
>  #define VIRTIO_GPU_CAPSET_VIRGL 1
>  #define VIRTIO_GPU_CAPSET_VIRGL2 2
> -/* 3 is reserved for gfxstream */
> +#define VIRTIO_GPU_CAPSET_GFXSTREAM_VULKAN 3
>  #define VIRTIO_GPU_CAPSET_VENUS 4
> +#define VIRTIO_GPU_CAPSET_CROSS_DOMAIN 5
>  #define VIRTIO_GPU_CAPSET_DRM 6
>
>  /* VIRTIO_GPU_CMD_GET_CAPSET_INFO */
> --
> 2.25.1
>

Reviewed-by: Gurchetan Singh <gurchetansingh@chromium.org>


>
> ----------------------------------------------------------------------
> This transmission (including any attachments) may contain confidential
> information, privileged material (including material protected by the
> solicitor-client or other applicable privileges), or constitute non-publi=
c
> information. Any use of this information by anyone other than the intende=
d
> recipient is prohibited. If you have received this transmission in error,
> please immediately reply to the sender and delete this information from
> your system. Use, dissemination, distribution, or reproduction of this
> transmission by unintended recipients is not authorized and may be unlawf=
ul.
>

--0000000000005d6e7b063145bded
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar 25,=
 2025 at 8:42=E2=80=AFAM Aaron Ruby &lt;<a href=3D"mailto:aruby@qnx.com">ar=
uby@qnx.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">From 73e0b6fb04d90b70de1f40e8e2ffc8fe497fa204 Mon Sep 17 00:00:0=
0 2001<br>
From: Aaron Ruby &lt;<a href=3D"mailto:aruby@qnx.com" target=3D"_blank">aru=
by@qnx.com</a>&gt;<br>
Date: Mon, 24 Mar 2025 16:18:43 -0400<br>
Subject: [PATCH] drm/virtio: Add capset definitions<br>
<br>
Since the context-type additions to the virtio-gpu spec, these have been<br=
>
defined locally in guest user-space, and virtio-gpu backend library code.<b=
r>
<br>
Now, these capsets have been stabilized, and should be defined in<br>
a common space, in both the virtio_gpu header, and alongside the virtgpu_dr=
m<br>
interface that they apply to.<br>
---<br>
=C2=A0include/uapi/drm/virtgpu_drm.h=C2=A0 | 6 ++++++<br>
=C2=A0include/uapi/linux/virtio_gpu.h | 3 ++-<br>
=C2=A02 files changed, 8 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/include/uapi/drm/virtgpu_drm.h b/include/uapi/drm/virtgpu_drm.=
h<br>
index c2ce71987e9b..9debb320c34b 100644<br>
--- a/include/uapi/drm/virtgpu_drm.h<br>
+++ b/include/uapi/drm/virtgpu_drm.h<br>
@@ -163,6 +163,12 @@ struct drm_virtgpu_3d_wait {<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __u32 flags;<br>
=C2=A0};<br>
=C2=A0<br>
+#define VIRTGPU_DRM_CAPSET_VIRGL 1<br>
+#define VIRTGPU_DRM_CAPSET_VIRGL2 2<br>
+#define VIRTGPU_DRM_CAPSET_GFXSTREAM_VULKAN 3<br>
+#define VIRTGPU_DRM_CAPSET_VENUS 4<br>
+#define VIRTGPU_DRM_CAPSET_CROSS_DOMAIN 5<br>
+#define VIRTGPU_DRM_CAPSET_DRM 6<br>
=C2=A0struct drm_virtgpu_get_caps {<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __u32 cap_set_id;<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __u32 cap_set_ver;<br>
diff --git a/include/uapi/linux/virtio_gpu.h b/include/uapi/linux/virtio_gp=
u.h<br>
index bf2c9cabd207..be109777d10d 100644<br>
--- a/include/uapi/linux/virtio_gpu.h<br>
+++ b/include/uapi/linux/virtio_gpu.h<br>
@@ -309,8 +309,9 @@ struct virtio_gpu_cmd_submit {<br>
=C2=A0<br>
=C2=A0#define VIRTIO_GPU_CAPSET_VIRGL 1<br>
=C2=A0#define VIRTIO_GPU_CAPSET_VIRGL2 2<br>
-/* 3 is reserved for gfxstream */<br>
+#define VIRTIO_GPU_CAPSET_GFXSTREAM_VULKAN 3<br>
=C2=A0#define VIRTIO_GPU_CAPSET_VENUS 4<br>
+#define VIRTIO_GPU_CAPSET_CROSS_DOMAIN 5<br>
=C2=A0#define VIRTIO_GPU_CAPSET_DRM 6<br>
=C2=A0<br>
=C2=A0/* VIRTIO_GPU_CMD_GET_CAPSET_INFO */<br>
--<br>
2.25.1<br></blockquote><div><br></div><div>Reviewed-by: Gurchetan Singh &lt=
;<span style=3D"font-family:&quot;Google Sans&quot;,Roboto,RobotoDraft,Helv=
etica,Arial,sans-serif;font-size:14px"><a href=3D"mailto:gurchetansingh@chr=
omium.org">gurchetansingh@chromium.org</a>&gt;</span></div><div>=C2=A0</div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
----------------------------------------------------------------------<br>
This transmission (including any attachments) may contain confidential info=
rmation, privileged material (including material protected by the solicitor=
-client or other applicable privileges), or constitute non-public informati=
on. Any use of this information by anyone other than the intended recipient=
 is prohibited. If you have received this transmission in error, please imm=
ediately reply to the sender and delete this information from your system. =
Use, dissemination, distribution, or reproduction of this transmission by u=
nintended recipients is not authorized and may be unlawful.<br>
</blockquote></div></div>

--0000000000005d6e7b063145bded--
