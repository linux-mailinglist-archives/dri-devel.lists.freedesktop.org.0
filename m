Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 917A97CB420
	for <lists+dri-devel@lfdr.de>; Mon, 16 Oct 2023 22:12:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3132C10E012;
	Mon, 16 Oct 2023 20:12:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa2c.google.com (mail-vk1-xa2c.google.com
 [IPv6:2607:f8b0:4864:20::a2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B51810E012
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 20:12:21 +0000 (UTC)
Received: by mail-vk1-xa2c.google.com with SMTP id
 71dfb90a1353d-49d6bd360f8so1915127e0c.2
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 13:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697487140; x=1698091940; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5cJbyhQNnuJbrJ6Slo4J5xWZUBtK2V7OqKKxnE7AUr8=;
 b=eISpqtstwUwESHfKKC2lGbrwyNLEQQZmcWcc6WTG/VRps7cPnPHu8yNXiirq0kJ5+O
 1u4OMxbIPwBBVpUaI4gVyL33B4KyT0+IF7oWnf/L4sjNME4IcsWDyoP4V32LwvZDWZDF
 UAfxaM1DIgBBCNC8do+Yh0g2xRVeh0J+Y07yUM0IBhuL0coHmHxxWlqbBJ8eTpN3fM8N
 f7s+X9loKpVIvvzoOHPnhsmshLM0sZC6uaXR9s7nZkZdrLE21EBUJbiRL0O/6hNrUht9
 WnuMB7nl1mSkSJwx/Q5NccTGbSHtjMXDgeZQubLOJrM2dDq5qDF9LqR3lYbxETgyBlMT
 hWeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697487140; x=1698091940;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5cJbyhQNnuJbrJ6Slo4J5xWZUBtK2V7OqKKxnE7AUr8=;
 b=dixN+Ze/0v5P3MvJJg1OUW5GzycpakRCq/9Att5v2mVwe0NxWaQXmxmTYUwyhgJKxG
 Ns2QsY6eYy+aSlBJflxcZN51yO7cY1/IpBKEhNG1I7kOsI3Z3GmM1tJu3+WlJFHIRQyJ
 0gBI1a5i9yeQ8+Aj3bqW8X7qUJsSciTpccLnuTYCiqJid8fuNmASxpI601YcWRiBeLH9
 8BqnA3ePFNgg1FXXxBkugK6KRReNVtBblSY9OKjv9SWX7GZXYlNJs9FBILka432jWruQ
 QroOsVorqXQcI6pYPfMkoj1FbwaJytm2xDHe9oQZ8SIOuTrfX+Yohxl39o22f3OsZKJH
 CAKA==
X-Gm-Message-State: AOJu0YxNpSJbE51ZQkrFLD0J9YwyIRojkOx9uTBoYVNc4qzPP64zM7Y3
 VYi8d8XN1AMHhWUFaSHG14anLQHtVS39VU+Uc0q/+VzpUCgmdC1/
X-Google-Smtp-Source: AGHT+IGQvLj5dP2eHuUWWt/gp5/OFZ99yACyzLoDfAF2JUKOzYakNIBaxMNc36fVOtCiTFjSeGLi0U3v7AeRL2GonNE=
X-Received: by 2002:a05:6122:3107:b0:49d:fab:fa37 with SMTP id
 cg7-20020a056122310700b0049d0fabfa37mr577032vkb.4.1697487140575; Mon, 16 Oct
 2023 13:12:20 -0700 (PDT)
MIME-Version: 1.0
References: <20231016184200.639-1-gurchetansingh@chromium.org>
 <20231016184200.639-2-gurchetansingh@chromium.org>
In-Reply-To: <20231016184200.639-2-gurchetansingh@chromium.org>
From: Josh Simonot <josh.simonot@gmail.com>
Date: Mon, 16 Oct 2023 16:12:09 -0400
Message-ID: <CAP1LCYcWe5GZu2fOL=6nK45TsaicEpjPtTUiZcxnH7q-znzpkw@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm/uapi: add explicit virtgpu context debug name
To: Gurchetan Singh <gurchetansingh@chromium.org>
Content-Type: multipart/alternative; boundary="0000000000000660150607db0661"
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

--0000000000000660150607db0661
Content-Type: text/plain; charset="UTF-8"

Reviewed-by: Josh Simonot <josh.simonot at gmail.com>


On Mon, 16 Oct 2023 at 14:42, Gurchetan Singh <gurchetansingh@chromium.org>
wrote:

> There are two problems with the current method of determining the
> virtio-gpu debug name.
>
> 1) TASK_COMM_LEN is defined to be 16 bytes only, and this is a
>    Linux kernel idiom (see PR_SET_NAME + PR_GET_NAME). Though,
>    Android/FreeBSD get around this via setprogname(..)/getprogname(..)
>    in libc.
>
>    On Android, names longer than 16 bytes are common.  For example,
>    one often encounters a program like "com.android.systemui".
>
>    The virtio-gpu spec allows the debug name to be up to 64 bytes, so
>    ideally userspace should be able to set debug names up to 64 bytes.
>
> 2) The current implementation determines the debug name using whatever
>    task initiated virtgpu.  This is could be a "RenderThread" of a
>    larger program, when we actually want to propagate the debug name
>    of the program.
>
> To fix these issues, add a new CONTEXT_INIT param that allows userspace
> to set the debug name when creating a context.
>
> It takes a null-terminated C-string as the param value.
>
> Link to open-source userspace:
>
> https://android-review.googlesource.com/c/platform/hardware/google/gfxstream/+/2787176
>
> Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
> ---
>  include/uapi/drm/virtgpu_drm.h | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/include/uapi/drm/virtgpu_drm.h
> b/include/uapi/drm/virtgpu_drm.h
> index b1d0e56565bc..c2ce71987e9b 100644
> --- a/include/uapi/drm/virtgpu_drm.h
> +++ b/include/uapi/drm/virtgpu_drm.h
> @@ -97,6 +97,7 @@ struct drm_virtgpu_execbuffer {
>  #define VIRTGPU_PARAM_CROSS_DEVICE 5 /* Cross virtio-device resource
> sharing  */
>  #define VIRTGPU_PARAM_CONTEXT_INIT 6 /* DRM_VIRTGPU_CONTEXT_INIT */
>  #define VIRTGPU_PARAM_SUPPORTED_CAPSET_IDs 7 /* Bitmask of supported
> capability set ids */
> +#define VIRTGPU_PARAM_EXPLICIT_DEBUG_NAME 8 /* Ability to set debug name
> from userspace */
>
>  struct drm_virtgpu_getparam {
>         __u64 param;
> @@ -198,6 +199,7 @@ struct drm_virtgpu_resource_create_blob {
>  #define VIRTGPU_CONTEXT_PARAM_CAPSET_ID       0x0001
>  #define VIRTGPU_CONTEXT_PARAM_NUM_RINGS       0x0002
>  #define VIRTGPU_CONTEXT_PARAM_POLL_RINGS_MASK 0x0003
> +#define VIRTGPU_CONTEXT_PARAM_DEBUG_NAME      0x0004
>  struct drm_virtgpu_context_set_param {
>         __u64 param;
>         __u64 value;
> --
> 2.42.0.655.g421f12c284-goog
>
>

--0000000000000660150607db0661
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><pre><font size=3D"2" style=3D"font-family:arial,sans-seri=
f">Reviewed-by: Josh Simonot &lt;josh.simonot at <a href=3D"http://gmail.co=
m">gmail.com</a>&gt;</font></pre></div><br><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">On Mon, 16 Oct 2023 at 14:42, Gurchetan Si=
ngh &lt;<a href=3D"mailto:gurchetansingh@chromium.org">gurchetansingh@chrom=
ium.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">There are two problems with the current method of determining the<br=
>
virtio-gpu debug name.<br>
<br>
1) TASK_COMM_LEN is defined to be 16 bytes only, and this is a<br>
=C2=A0 =C2=A0Linux kernel idiom (see PR_SET_NAME + PR_GET_NAME). Though,<br=
>
=C2=A0 =C2=A0Android/FreeBSD get around this via setprogname(..)/getprognam=
e(..)<br>
=C2=A0 =C2=A0in libc.<br>
<br>
=C2=A0 =C2=A0On Android, names longer than 16 bytes are common.=C2=A0 For e=
xample,<br>
=C2=A0 =C2=A0one often encounters a program like &quot;com.android.systemui=
&quot;.<br>
<br>
=C2=A0 =C2=A0The virtio-gpu spec allows the debug name to be up to 64 bytes=
, so<br>
=C2=A0 =C2=A0ideally userspace should be able to set debug names up to 64 b=
ytes.<br>
<br>
2) The current implementation determines the debug name using whatever<br>
=C2=A0 =C2=A0task initiated virtgpu.=C2=A0 This is could be a &quot;RenderT=
hread&quot; of a<br>
=C2=A0 =C2=A0larger program, when we actually want to propagate the debug n=
ame<br>
=C2=A0 =C2=A0of the program.<br>
<br>
To fix these issues, add a new CONTEXT_INIT param that allows userspace<br>
to set the debug name when creating a context.<br>
<br>
It takes a null-terminated C-string as the param value.<br>
<br>
Link to open-source userspace:<br>
<a href=3D"https://android-review.googlesource.com/c/platform/hardware/goog=
le/gfxstream/+/2787176" rel=3D"noreferrer" target=3D"_blank">https://androi=
d-review.googlesource.com/c/platform/hardware/google/gfxstream/+/2787176</a=
><br>
<br>
Signed-off-by: Gurchetan Singh &lt;<a href=3D"mailto:gurchetansingh@chromiu=
m.org" target=3D"_blank">gurchetansingh@chromium.org</a>&gt;<br>
---<br>
=C2=A0include/uapi/drm/virtgpu_drm.h | 2 ++<br>
=C2=A01 file changed, 2 insertions(+)<br>
<br>
diff --git a/include/uapi/drm/virtgpu_drm.h b/include/uapi/drm/virtgpu_drm.=
h<br>
index b1d0e56565bc..c2ce71987e9b 100644<br>
--- a/include/uapi/drm/virtgpu_drm.h<br>
+++ b/include/uapi/drm/virtgpu_drm.h<br>
@@ -97,6 +97,7 @@ struct drm_virtgpu_execbuffer {<br>
=C2=A0#define VIRTGPU_PARAM_CROSS_DEVICE 5 /* Cross virtio-device resource =
sharing=C2=A0 */<br>
=C2=A0#define VIRTGPU_PARAM_CONTEXT_INIT 6 /* DRM_VIRTGPU_CONTEXT_INIT */<b=
r>
=C2=A0#define VIRTGPU_PARAM_SUPPORTED_CAPSET_IDs 7 /* Bitmask of supported =
capability set ids */<br>
+#define VIRTGPU_PARAM_EXPLICIT_DEBUG_NAME 8 /* Ability to set debug name f=
rom userspace */<br>
<br>
=C2=A0struct drm_virtgpu_getparam {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 __u64 param;<br>
@@ -198,6 +199,7 @@ struct drm_virtgpu_resource_create_blob {<br>
=C2=A0#define VIRTGPU_CONTEXT_PARAM_CAPSET_ID=C2=A0 =C2=A0 =C2=A0 =C2=A00x0=
001<br>
=C2=A0#define VIRTGPU_CONTEXT_PARAM_NUM_RINGS=C2=A0 =C2=A0 =C2=A0 =C2=A00x0=
002<br>
=C2=A0#define VIRTGPU_CONTEXT_PARAM_POLL_RINGS_MASK 0x0003<br>
+#define VIRTGPU_CONTEXT_PARAM_DEBUG_NAME=C2=A0 =C2=A0 =C2=A0 0x0004<br>
=C2=A0struct drm_virtgpu_context_set_param {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 __u64 param;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 __u64 value;<br>
-- <br>
2.42.0.655.g421f12c284-goog<br>
<br>
</blockquote></div>

--0000000000000660150607db0661--
