Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC2581EB4D
	for <lists+dri-devel@lfdr.de>; Wed, 27 Dec 2023 02:29:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43DD110E20B;
	Wed, 27 Dec 2023 01:29:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7514D10E20B
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Dec 2023 01:29:53 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5553f251e3cso361206a12.2
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Dec 2023 17:29:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1703640591; x=1704245391;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=qwq6TihVCAiposGoRNa81eZR5i3BAxdMKch0z/UC8LI=;
 b=HZ66FmIXVM6405EzlTsWlNU2tYNgI/JIe/PPUUZYJPPzUlY4yu/fTnXuyargkzJQUb
 zlr9xZeCvi8kPW9wpb0PXjH+9hmh3PauRwiFf0j/XQXdZbDmirx2PocjDvMJXMpkBWnb
 hQ+BvrZwKSHdYp3niPp+N3JJQn+D6S19+tweM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703640591; x=1704245391;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qwq6TihVCAiposGoRNa81eZR5i3BAxdMKch0z/UC8LI=;
 b=nVBE5kLHC7P73eYCNGvS0hCeG6metbkliiENqfloo4s1G6dsc21cW6Oe1sv2wZA2QP
 tVW9zB8WxgkCQiBtBZhcPoEYRH/tkqhwJQ1x16LW0tEaTlYneUf3QbhWVRGP3zirxhjB
 iZA44El0aa6/s/ZY62Qc4z/j4HWbgHaxRnbR6POvZ9FIXMEFOjKyrgYow73X6aT0PdnD
 vlEHwIm5utaziscmc7XyC5miX1Crqq2pI1AaUJMAnbTDSPkdpPj0IgVJpLpSnMbpG16X
 jidaxyA0ZKgvn8aSoDl4d207mpgg0fhVYWRLt5Vbk6wSNzrR47TAo/39WIyeZuSlh3po
 7a8g==
X-Gm-Message-State: AOJu0YwB2CAS0c5E2Q+RqkNbuc+pgqUHGz3SIo2TXK3vhkYIhsb0wAL/
 FCndj2QWwpvsD4yBAvVcvJYNMw4RRHa0D4Esja5Yst+cueey
X-Google-Smtp-Source: AGHT+IGBcItAipV7bztpXaj4GDr3Krpprd9YoaxY9/PXQ5/uLcL0Aybh54KlvZgD94GXhQj7NPPYVA==
X-Received: by 2002:a50:aadc:0:b0:553:452d:5070 with SMTP id
 r28-20020a50aadc000000b00553452d5070mr5773780edc.38.1703640591061; 
 Tue, 26 Dec 2023 17:29:51 -0800 (PST)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com.
 [209.85.208.44]) by smtp.gmail.com with ESMTPSA id
 p12-20020a05640243cc00b0055493aa8905sm4561348edc.63.2023.12.26.17.29.50
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Dec 2023 17:29:50 -0800 (PST)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-548ae9a5eeaso42256a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Dec 2023 17:29:50 -0800 (PST)
X-Received: by 2002:a50:cd8a:0:b0:553:9d94:9f6a with SMTP id
 p10-20020a50cd8a000000b005539d949f6amr518011edi.7.1703640590301; Tue, 26 Dec
 2023 17:29:50 -0800 (PST)
MIME-Version: 1.0
References: <20231221100016.4022353-1-julia.zhang@amd.com>
In-Reply-To: <20231221100016.4022353-1-julia.zhang@amd.com>
From: Gurchetan Singh <gurchetansingh@chromium.org>
Date: Tue, 26 Dec 2023 17:29:37 -0800
X-Gmail-Original-Message-ID: <CAAfnVBm+oo=dnDuqp1hYVj+OrQHHp5NPUHh2oxmEVjNrsDDUTQ@mail.gmail.com>
Message-ID: <CAAfnVBm+oo=dnDuqp1hYVj+OrQHHp5NPUHh2oxmEVjNrsDDUTQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/1] Implementation of resource_query_layout
To: Julia Zhang <julia.zhang@amd.com>
Content-Type: multipart/alternative; boundary="00000000000036599d060d73bc65"
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
Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Chen Jiqian <Jiqian.Chen@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <marek.olsak@amd.com>,
 Erik Faye-Lund <kusmabite@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 Huang Rui <ray.huang@amd.com>, amd-gfx@lists.freedesktop.org,
 Honglei Huang <honglei1.huang@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@redhat.com>,
 David Airlie <airlied@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--00000000000036599d060d73bc65
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 21, 2023 at 2:01=E2=80=AFAM Julia Zhang <julia.zhang@amd.com> w=
rote:

> Hi all,
>
> Sorry to late reply. This is v2 of the implementation of
> resource_query_layout. This adds a new ioctl to let guest query informati=
on
> of host resource, which is originally from Daniel Stone. We add some
> changes to support query the correct stride of host resource before it's
> created, which is to support to blit data from dGPU to virtio iGPU for dG=
PU
> prime feature.
>
> Changes from v1 to v2:
> -Squash two patches to a single patch.
> -A small modification of VIRTIO_GPU_F_RESOURCE_QUERY_LAYOUT
>
>
> Below is description of v1:
> This add implementation of resource_query_layout to get the information o=
f
> how the host has actually allocated the buffer. This function is now used
> to query the stride for guest linear resource for dGPU prime on guest VMs=
.
>

You can use a context specific protocol or even the virgl capabilities [for
a linear strided resource].  For example, Sommelier does the following:

https://chromium.googlesource.com/chromiumos/platform2/+/HEAD/vm_tools/somm=
elier/virtualization/virtgpu_channel.cc#549

i.e, you should be able to avoid extra ioctl + hypercall.


>
> v1 of kernel side:
>  https:
> //
> lore.kernel.org/xen-devel/20231110074027.24862-1-julia.zhang@amd.com/T/#t
>
> v1 of qemu side:
> https:
> //
> lore.kernel.org/qemu-devel/20231110074027.24862-1-julia.zhang@amd.com/T/#=
t
>
> Daniel Stone (1):
>   drm/virtio: Implement RESOURCE_GET_LAYOUT ioctl
>
>  drivers/gpu/drm/virtio/virtgpu_drv.c   |  1 +
>  drivers/gpu/drm/virtio/virtgpu_drv.h   | 22 ++++++++-
>  drivers/gpu/drm/virtio/virtgpu_ioctl.c | 66 ++++++++++++++++++++++++++
>  drivers/gpu/drm/virtio/virtgpu_kms.c   |  8 +++-
>  drivers/gpu/drm/virtio/virtgpu_vq.c    | 63 ++++++++++++++++++++++++
>  include/uapi/drm/virtgpu_drm.h         | 21 ++++++++
>  include/uapi/linux/virtio_gpu.h        | 30 ++++++++++++
>  7 files changed, 208 insertions(+), 3 deletions(-)
>
> --
> 2.34.1
>
>

--00000000000036599d060d73bc65
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Dec 21, 2023 at 2:01=E2=80=AF=
AM Julia Zhang &lt;<a href=3D"mailto:julia.zhang@amd.com">julia.zhang@amd.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">Hi all,<br>
<br>
Sorry to late reply. This is v2 of the implementation of<br>
resource_query_layout. This adds a new ioctl to let guest query information=
<br>
of host resource, which is originally from Daniel Stone. We add some<br>
changes to support query the correct stride of host resource before it&#39;=
s<br>
created, which is to support to blit data from dGPU to virtio iGPU for dGPU=
<br>
prime feature. <br>
<br>
Changes from v1 to v2:<br>
-Squash two patches to a single patch. <br>
-A small modification of VIRTIO_GPU_F_RESOURCE_QUERY_LAYOUT<br>
<br>
<br>
Below is description of v1:<br>
This add implementation of resource_query_layout to get the information of<=
br>
how the host has actually allocated the buffer. This function is now used<b=
r>
to query the stride for guest linear resource for dGPU prime on guest VMs.<=
br></blockquote><div><br></div><div>You can use a context specific protocol=
 or even the virgl capabilities=C2=A0[for a linear strided resource].=C2=A0=
 For example, Sommelier does the following:</div><div><br></div><div><a hre=
f=3D"https://chromium.googlesource.com/chromiumos/platform2/+/HEAD/vm_tools=
/sommelier/virtualization/virtgpu_channel.cc#549">https://chromium.googleso=
urce.com/chromiumos/platform2/+/HEAD/vm_tools/sommelier/virtualization/virt=
gpu_channel.cc#549</a><br></div><div><br></div><div>i.e, you should be able=
 to avoid extra ioctl=C2=A0+ hypercall.</div><div>=C2=A0</div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">
<br>
v1 of kernel side:<br>
=C2=A0https:<br>
//<a href=3D"http://lore.kernel.org/xen-devel/20231110074027.24862-1-julia.=
zhang@amd.com/T/#t" rel=3D"noreferrer" target=3D"_blank">lore.kernel.org/xe=
n-devel/20231110074027.24862-1-julia.zhang@amd.com/T/#t</a><br>
<br>
v1 of qemu side:<br>
https:<br>
//<a href=3D"http://lore.kernel.org/qemu-devel/20231110074027.24862-1-julia=
.zhang@amd.com/T/#t" rel=3D"noreferrer" target=3D"_blank">lore.kernel.org/q=
emu-devel/20231110074027.24862-1-julia.zhang@amd.com/T/#t</a><br>
<br>
Daniel Stone (1):<br>
=C2=A0 drm/virtio: Implement RESOURCE_GET_LAYOUT ioctl<br>
<br>
=C2=A0drivers/gpu/drm/virtio/virtgpu_drv.c=C2=A0 =C2=A0|=C2=A0 1 +<br>
=C2=A0drivers/gpu/drm/virtio/virtgpu_drv.h=C2=A0 =C2=A0| 22 ++++++++-<br>
=C2=A0drivers/gpu/drm/virtio/virtgpu_ioctl.c | 66 +++++++++++++++++++++++++=
+<br>
=C2=A0drivers/gpu/drm/virtio/virtgpu_kms.c=C2=A0 =C2=A0|=C2=A0 8 +++-<br>
=C2=A0drivers/gpu/drm/virtio/virtgpu_vq.c=C2=A0 =C2=A0 | 63 +++++++++++++++=
+++++++++<br>
=C2=A0include/uapi/drm/virtgpu_drm.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 21 =
++++++++<br>
=C2=A0include/uapi/linux/virtio_gpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 30 +++++=
+++++++<br>
=C2=A07 files changed, 208 insertions(+), 3 deletions(-)<br>
<br>
-- <br>
2.34.1<br>
<br>
</blockquote></div></div>

--00000000000036599d060d73bc65--
