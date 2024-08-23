Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D28395C235
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2024 02:17:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B1D710E73F;
	Fri, 23 Aug 2024 00:17:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="IFUpOyCZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 380E210E15E
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2024 00:17:55 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-2f3f25a1713so14010271fa.2
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2024 17:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1724372273; x=1724977073;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+6dtQwLGXiJHupaIL7w5cPUIa2crnohimUGIR4NIah8=;
 b=IFUpOyCZ8Tjd1dj+9J96W+3etMWumDJRvrQ6YHvLItTv+feH3rjorfbpy7ua0C/u6Z
 y9fdMXOfCYmLpWJ9CJhXYfbMqQAoPauER0a4wYJfrV8YQzpNEAtTLVZQRzs08REe5nQ2
 OfRohgrX7iUxHlS6l4gMs9qisi3LksxUDk6sI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724372273; x=1724977073;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+6dtQwLGXiJHupaIL7w5cPUIa2crnohimUGIR4NIah8=;
 b=jKODw2RQzA3gAXzM0XIfBDa7JVHqW+zdQf6a+vK2IXp9s6Na43uNFOa7EUhSmGT4DG
 5JSPmTOFrSBVVRXDm3c8AIdgyNzdSVX/q9pZXWDgU5qCegr8r90sImp6AA6eVjgSS+Jl
 /9KMRMU0Db34BgcWj0JyBobBfYYJ8aVNljmYC5jADOpy4Fz+yDIOBoIJ6zgm1LHocr89
 0atH+d7xpX8HdKU0hVW7XhIAs6ZOS+GgE03crMPnFjH505cy8aeVCaO1x2iQ/IZLviP1
 xmHLVfpIoWmPF7UWSZDrL2sM8MebbhZEknF1kFCb98zj9YvpdMGfesi8TfdPK6AhgVjp
 0FKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8ezcf6Cb7C6g48sqlgqaoj9e5baAGegWfMfXWDjNFEHQWJr/Ml4SiOVqIqAIxvhnfy1yQTgRUaAc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx9ZAYcSupSzkYDCY1oy2rSLRLX0uBS9KzvXHYHjIN8Jl3WAUBx
 qgAldxzF7Q1kcmvm5SqsLgYZKSd6SdDeLxTiJBWnav0dknM7cmrKlGejhjUdrWnUJfETXG25sUt
 wnA==
X-Google-Smtp-Source: AGHT+IGT4gNyJx51qrwZBVZfD+NiLTqkZjpp6GERN24rjVHP3kdXHGRV8FTo52wjapmw/+aw+iKQQw==
X-Received: by 2002:a05:6512:ac4:b0:52e:9c69:b25b with SMTP id
 2adb3069b0e04-534387840e7mr266122e87.28.1724372271684; 
 Thu, 22 Aug 2024 17:17:51 -0700 (PDT)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com.
 [209.85.208.54]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a868f4361c3sm179953066b.114.2024.08.22.17.17.51
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Aug 2024 17:17:51 -0700 (PDT)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-5c07fb195b6so3363a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2024 17:17:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUMWkSPpDpk/T3RM1hcdLsg7msiYp+byAK5qAbH4CK4qBF0Oef/npBPUXIbKBOBVWv9EV0XzOAZx4E=@lists.freedesktop.org
X-Received: by 2002:a05:6402:2110:b0:57c:b712:47b5 with SMTP id
 4fb4d7f45d1cf-5c0870a3c9emr85551a12.4.1724372270538; Thu, 22 Aug 2024
 17:17:50 -0700 (PDT)
MIME-Version: 1.0
References: <20240723114914.53677-1-slp@redhat.com>
 <942afa37-a24c-48ed-ae10-c811849165bf@collabora.com>
 <CAAiTLFV6mAgrMj=itcxoBCibvYRyrAk02wYp-gYJ8kxhF0EPmw@mail.gmail.com>
 <CAAfnVBkWKn3+YEhNz0CTmw-T_jjL72axkWqYgkzkSa72t_Gf0A@mail.gmail.com>
 <CAF6AEGsnpEYFsCfZUAPopWzY=wv_GWn0P5f5D6U9y-JrWGQVnw@mail.gmail.com>
 <CAAfnVBki816fSPuQ_FcvuwYzbSwiS_WaYsGSA1AyitmAA5OsXg@mail.gmail.com>
 <CAAiTLFUWhP+wy694MbYDvzHgUD_pZZf7Jj=AfVvTj6CWAYZ+zA@mail.gmail.com>
 <CAAfnVBkkste=HR2SKRBNWXKcunbA2iEP+rr9yhDy89+WZsYeQw@mail.gmail.com>
 <CAAiTLFVhtuzLYM0aj_CQYxAQqMVUy4WQ0KKSsJ4hDmGhL2vdGA@mail.gmail.com>
In-Reply-To: <CAAiTLFVhtuzLYM0aj_CQYxAQqMVUy4WQ0KKSsJ4hDmGhL2vdGA@mail.gmail.com>
From: Gurchetan Singh <gurchetansingh@chromium.org>
Date: Thu, 22 Aug 2024 17:17:38 -0700
X-Gmail-Original-Message-ID: <CAAfnVBkBEsbmUF_meU8hV2v9gahR3L9mAWNqQdXT8YXqNf+yxA@mail.gmail.com>
Message-ID: <CAAfnVBkBEsbmUF_meU8hV2v9gahR3L9mAWNqQdXT8YXqNf+yxA@mail.gmail.com>
Subject: Re: [PATCH 0/2] drm/virtio: introduce the HOST_PAGE_SIZE feature
To: Sergio Lopez Pascual <slp@redhat.com>
Cc: Rob Clark <robdclark@gmail.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
 tzimmermann@suse.de, mripard@kernel.org, olvaffe@gmail.com, kraxel@redhat.com, 
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, airlied@redhat.com, 
 linux-kernel@vger.kernel.org, virtualization@lists.linux.dev, 
 dri-devel@lists.freedesktop.org
Content-Type: multipart/alternative; boundary="000000000000a6188106204eb498"
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

--000000000000a6188106204eb498
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 22, 2024 at 8:29=E2=80=AFAM Sergio Lopez Pascual <slp@redhat.co=
m> wrote:

> Gurchetan Singh <gurchetansingh@chromium.org> writes:
>
> > On Thu, Aug 8, 2024 at 3:38=E2=80=AFAM Sergio Lopez Pascual <slp@redhat=
.com>
> wrote:
> >
> >> Gurchetan Singh <gurchetansingh@chromium.org> writes:
> >>
> >> > On Tue, Aug 6, 2024 at 1:15=E2=80=AFPM Rob Clark <robdclark@gmail.co=
m> wrote:
> >> >
> >> >> On Tue, Aug 6, 2024 at 9:15=E2=80=AFAM Gurchetan Singh
> >> >> <gurchetansingh@chromium.org> wrote:
> >> >> >
> >> >> >
> >> >> >
> >> >> > On Mon, Aug 5, 2024 at 2:14=E2=80=AFAM Sergio Lopez Pascual <
> slp@redhat.com>
> >> >> wrote:
> >> >> >>
> >> >> >> Dmitry Osipenko <dmitry.osipenko@collabora.com> writes:
> >> >> >>
> >> >> >> > On 7/23/24 14:49, Sergio Lopez wrote:
> >> >> >> >> There's an incresing number of machines supporting multiple
> page
> >> >> sizes
> >> >> >> >> and on these machines the host and a guest can be running, ea=
ch
> >> one,
> >> >> >> >> with a different page size.
> >> >> >> >>
> >> >> >> >> For what pertains to virtio-gpu, this is not a problem if the
> page
> >> >> size
> >> >> >> >> of the guest happens to be bigger or equal than the host, but
> will
> >> >> >> >> potentially lead to failures in memory allocations and/or
> mappings
> >> >> >> >> otherwise.
> >> >> >> >
> >> >> >> > Please describe concrete problem you're trying to solve. Guest
> >> memory
> >> >> >> > allocation consists of guest pages, I don't see how knowledge =
of
> >> host
> >> >> >> > page size helps anything in userspace.
> >> >> >> >
> >> >> >> > I suspect you want this for host blobs, but then it should be
> >> >> >> > virtio_gpu_vram_create() that should use max(host_page_sz,
> >> >> >> > guest_page_size), AFAICT. It's kernel who is responsible for
> memory
> >> >> >> > management, userspace can't be trusted for doing that.
> >> >> >>
> >> >> >> Mesa's Vulkan/Venus uses CREATE_BLOB to request the host the
> creation
> >> >> >> and mapping into the guest of device-backed memory and shmem
> regions.
> >> >> >> The CREATE_BLOB ioctl doesn't update
> >> drm_virtgpu_resource_create->size,
> >> >> >> so the guest kernel (and, as a consequence, the host kernel) can=
't
> >> >> >> override the user's request.
> >> >> >>
> >> >> >> I'd like Mesa's Vulkan/Venus in the guest to be able to obtain t=
he
> >> host
> >> >> >> page size to align the size of the CREATE_BLOB requests as
> required.
> >> >> >
> >> >> >
> >> >> > gfxstream solves this problem by putting the relevant information
> in
> >> the
> >> >> capabilities obtained from the host:
> >> >> >
> >> >> >
> >> >>
> >>
> https://android.googlesource.com/platform/hardware/google/gfxstream/+/ref=
s/heads/main/host/virtio-gpu-gfxstream-renderer.cpp#1691
> >> >> >
> >> >> > If you want to be paranoid, you can also validate the
> >> >> ResourceCreateBlob::size is properly host-page aligned when that
> request
> >> >> reaches the host.
> >> >> >
> >> >> > So you can probably solve this problem using current interfaces.
> >> >> Whether it's cleaner for all context types to use the capabilities,
> or
> >> have
> >> >> all VMMs to expose VIRTIO_GPU_F_HOST_PAGE_SIZE, would be the
> >> cost/benefit
> >> >> tradeoff.
> >> >> >
> >> >>
> >> >> I guess solving it in a context-type specific way is possible.  But=
 I
> >> >> think it is a relatively universal constraint.  And maybe it makes
> >> >> sense for virtgpu guest kernel to enforce alignment (at least it ca=
n
> >> >> return an error synchronously) in addition to the host.
> >> >>
> >> >
> >> > virtio-media may have support for VIRTIO_MEDIA_CMD_MMAP too, so coul=
d
> run
> >> > into this issue.
> >> >
> >> >
> >>
> https://github.com/chromeos/virtio-media?tab=3Dreadme-ov-file#shared-memo=
ry-regions
> >> >
> >> > virtio-fs also has the DAX window which uses the same memory mapping
> >> > mechanism.
> >> >
> >> > https://virtio-fs.gitlab.io/design.html
> >> >
> >> > Maybe this should not be a virtio-gpu thing, but a virtio thing?
> >>
> >> This is true, but finding a common place to put the page size is reall=
y
> >> hard in practice. I don't think we can borrow space in the feature bit=
s
> >> for that (and that would probably be abusing its purpose quite a bit)
> >> and extending the transport configuration registers is quite cumbersom=
e
> >> and, in general, undesirable.
> >>
> >> That leaves us with the device-specific config space, and that implies=
 a
> >> device-specific feature bit as it's implemented in this series.
> >>
> >> The Shared Memory Regions on the VIRTIO spec, while doesn't talk
> >> specifically about page size, also gives us a hint about this being th=
e
> >> right direction:
> >>
> >
> > Can't we just modify the Shared Memory region PCI capability to include
> > page size?  We can either:
> >
> > 1) keep the same size struct + header (VIRTIO_PCI_CAP_SHARED_MEMORY_CFG=
),
> > and just hijack one of the padding fields. If the padding field is zero=
,
> we
> > can just say it's 4096.
>
> Yes, we can turn that padding into "__le16 page_size_order" to store
> "PAGE_SIZE >> 12". That should be enough to secure some future-proofing.
> There's also some space in the "MMIO Device Register Layout" to store it
> as a 16 bit or 32 bit value.
>
> This would require proposing it as a change to the VIRTIO specs. Do you
> want to do it yourself or should I take the initiative?
>

You should do it.


>
> Thanks,
> Sergio.
>
>

--000000000000a6188106204eb498
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Aug 22, 2024 at 8:29=E2=80=AF=
AM Sergio Lopez Pascual &lt;<a href=3D"mailto:slp@redhat.com">slp@redhat.co=
m</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>Gurchetan Singh &lt;<a href=3D"mailto:gurchetansingh@chromium.org" target=
=3D"_blank">gurchetansingh@chromium.org</a>&gt; writes:<br>
<br>
&gt; On Thu, Aug 8, 2024 at 3:38=E2=80=AFAM Sergio Lopez Pascual &lt;<a hre=
f=3D"mailto:slp@redhat.com" target=3D"_blank">slp@redhat.com</a>&gt; wrote:=
<br>
&gt;<br>
&gt;&gt; Gurchetan Singh &lt;<a href=3D"mailto:gurchetansingh@chromium.org"=
 target=3D"_blank">gurchetansingh@chromium.org</a>&gt; writes:<br>
&gt;&gt;<br>
&gt;&gt; &gt; On Tue, Aug 6, 2024 at 1:15=E2=80=AFPM Rob Clark &lt;<a href=
=3D"mailto:robdclark@gmail.com" target=3D"_blank">robdclark@gmail.com</a>&g=
t; wrote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; On Tue, Aug 6, 2024 at 9:15=E2=80=AFAM Gurchetan Singh<br=
>
&gt;&gt; &gt;&gt; &lt;<a href=3D"mailto:gurchetansingh@chromium.org" target=
=3D"_blank">gurchetansingh@chromium.org</a>&gt; wrote:<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; On Mon, Aug 5, 2024 at 2:14=E2=80=AFAM Sergio Lopez =
Pascual &lt;<a href=3D"mailto:slp@redhat.com" target=3D"_blank">slp@redhat.=
com</a>&gt;<br>
&gt;&gt; &gt;&gt; wrote:<br>
&gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; Dmitry Osipenko &lt;<a href=3D"mailto:dmitry.osi=
penko@collabora.com" target=3D"_blank">dmitry.osipenko@collabora.com</a>&gt=
; writes:<br>
&gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; On 7/23/24 14:49, Sergio Lopez wrote:<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; There&#39;s an incresing number of mach=
ines supporting multiple page<br>
&gt;&gt; &gt;&gt; sizes<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; and on these machines the host and a gu=
est can be running, each<br>
&gt;&gt; one,<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; with a different page size.<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; For what pertains to virtio-gpu, this i=
s not a problem if the page<br>
&gt;&gt; &gt;&gt; size<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; of the guest happens to be bigger or eq=
ual than the host, but will<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; potentially lead to failures in memory =
allocations and/or mappings<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; otherwise.<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; Please describe concrete problem you&#39;re=
 trying to solve. Guest<br>
&gt;&gt; memory<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; allocation consists of guest pages, I don&#=
39;t see how knowledge of<br>
&gt;&gt; host<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; page size helps anything in userspace.<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; I suspect you want this for host blobs, but=
 then it should be<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; virtio_gpu_vram_create() that should use ma=
x(host_page_sz,<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; guest_page_size), AFAICT. It&#39;s kernel w=
ho is responsible for memory<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; management, userspace can&#39;t be trusted =
for doing that.<br>
&gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; Mesa&#39;s Vulkan/Venus uses CREATE_BLOB to requ=
est the host the creation<br>
&gt;&gt; &gt;&gt; &gt;&gt; and mapping into the guest of device-backed memo=
ry and shmem regions.<br>
&gt;&gt; &gt;&gt; &gt;&gt; The CREATE_BLOB ioctl doesn&#39;t update<br>
&gt;&gt; drm_virtgpu_resource_create-&gt;size,<br>
&gt;&gt; &gt;&gt; &gt;&gt; so the guest kernel (and, as a consequence, the =
host kernel) can&#39;t<br>
&gt;&gt; &gt;&gt; &gt;&gt; override the user&#39;s request.<br>
&gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; I&#39;d like Mesa&#39;s Vulkan/Venus in the gues=
t to be able to obtain the<br>
&gt;&gt; host<br>
&gt;&gt; &gt;&gt; &gt;&gt; page size to align the size of the CREATE_BLOB r=
equests as required.<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; gfxstream solves this problem by putting the relevan=
t information in<br>
&gt;&gt; the<br>
&gt;&gt; &gt;&gt; capabilities obtained from the host:<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; <a href=3D"https://android.googlesource.com/platform/hardware/goog=
le/gfxstream/+/refs/heads/main/host/virtio-gpu-gfxstream-renderer.cpp#1691"=
 rel=3D"noreferrer" target=3D"_blank">https://android.googlesource.com/plat=
form/hardware/google/gfxstream/+/refs/heads/main/host/virtio-gpu-gfxstream-=
renderer.cpp#1691</a><br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; If you want to be paranoid, you can also validate th=
e<br>
&gt;&gt; &gt;&gt; ResourceCreateBlob::size is properly host-page aligned wh=
en that request<br>
&gt;&gt; &gt;&gt; reaches the host.<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; So you can probably solve this problem using current=
 interfaces.<br>
&gt;&gt; &gt;&gt; Whether it&#39;s cleaner for all context types to use the=
 capabilities, or<br>
&gt;&gt; have<br>
&gt;&gt; &gt;&gt; all VMMs to expose VIRTIO_GPU_F_HOST_PAGE_SIZE, would be =
the<br>
&gt;&gt; cost/benefit<br>
&gt;&gt; &gt;&gt; tradeoff.<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; I guess solving it in a context-type specific way is poss=
ible.=C2=A0 But I<br>
&gt;&gt; &gt;&gt; think it is a relatively universal constraint.=C2=A0 And =
maybe it makes<br>
&gt;&gt; &gt;&gt; sense for virtgpu guest kernel to enforce alignment (at l=
east it can<br>
&gt;&gt; &gt;&gt; return an error synchronously) in addition to the host.<b=
r>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; virtio-media may have support for VIRTIO_MEDIA_CMD_MMAP too, =
so could run<br>
&gt;&gt; &gt; into this issue.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; <a href=3D"https://github.com/chromeos/virtio-media?tab=3Dreadme-o=
v-file#shared-memory-regions" rel=3D"noreferrer" target=3D"_blank">https://=
github.com/chromeos/virtio-media?tab=3Dreadme-ov-file#shared-memory-regions=
</a><br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; virtio-fs also has the DAX window which uses the same memory =
mapping<br>
&gt;&gt; &gt; mechanism.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; <a href=3D"https://virtio-fs.gitlab.io/design.html" rel=3D"no=
referrer" target=3D"_blank">https://virtio-fs.gitlab.io/design.html</a><br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Maybe this should not be a virtio-gpu thing, but a virtio thi=
ng?<br>
&gt;&gt;<br>
&gt;&gt; This is true, but finding a common place to put the page size is r=
eally<br>
&gt;&gt; hard in practice. I don&#39;t think we can borrow space in the fea=
ture bits<br>
&gt;&gt; for that (and that would probably be abusing its purpose quite a b=
it)<br>
&gt;&gt; and extending the transport configuration registers is quite cumbe=
rsome<br>
&gt;&gt; and, in general, undesirable.<br>
&gt;&gt;<br>
&gt;&gt; That leaves us with the device-specific config space, and that imp=
lies a<br>
&gt;&gt; device-specific feature bit as it&#39;s implemented in this series=
.<br>
&gt;&gt;<br>
&gt;&gt; The Shared Memory Regions on the VIRTIO spec, while doesn&#39;t ta=
lk<br>
&gt;&gt; specifically about page size, also gives us a hint about this bein=
g the<br>
&gt;&gt; right direction:<br>
&gt;&gt;<br>
&gt;<br>
&gt; Can&#39;t we just modify the Shared Memory region PCI capability to in=
clude<br>
&gt; page size?=C2=A0 We can either:<br>
&gt;<br>
&gt; 1) keep the same size struct + header (VIRTIO_PCI_CAP_SHARED_MEMORY_CF=
G),<br>
&gt; and just hijack one of the padding fields. If the padding field is zer=
o, we<br>
&gt; can just say it&#39;s 4096.<br>
<br>
Yes, we can turn that padding into &quot;__le16 page_size_order&quot; to st=
ore<br>
&quot;PAGE_SIZE &gt;&gt; 12&quot;. That should be enough to secure some fut=
ure-proofing.<br>
There&#39;s also some space in the &quot;MMIO Device Register Layout&quot; =
to store it<br>
as a 16 bit or 32 bit value.<br>
<br>
This would require proposing it as a change to the VIRTIO specs. Do you<br>
want to do it yourself or should I take the initiative?<br></blockquote><di=
v><br></div><div>You should do it.</div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
<br>
Thanks,<br>
Sergio.<br>
<br>
</blockquote></div></div>

--000000000000a6188106204eb498--
