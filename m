Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B70A09755B8
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2024 16:39:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B75EB10EA2E;
	Wed, 11 Sep 2024 14:39:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com
 [209.85.210.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7B5F10E0B4;
 Wed, 11 Sep 2024 14:39:31 +0000 (UTC)
Received: by mail-ot1-f42.google.com with SMTP id
 46e09a7af769-70f645a30dcso4562163a34.3; 
 Wed, 11 Sep 2024 07:39:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726065571; x=1726670371;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Jh6Z8MEnk8715rYAo3KB0ViNTJYGHgy4p/+qql2rFWw=;
 b=mcVfkSFEjfnSet1y+Z25c6BIFlADSp7Ya71EvANNIM/KyZrpv5266Z5WwObfTv5wg5
 XFk5reI5THzN9KcUFH+ljsEywCIQD7i0ow/F+EZJZaSS0S9acbiT2HEpsksnINAxhNed
 C0IkzvklzJRIFvluH9zDdWqlRHSBw32pDjoUuY3+cATax7EiP17uZlmqPOOFQU6K8XkF
 KTOp0lMTUuAhb95tuxsAzuC/m2/7nI/yzIqm4kwnkvyCx/U2Ytiz5halwfQ+Iv2hlNjG
 C+eQlj1h8Bhx43CRJMTQ3gKygumoaANpOl3038qomQK64amhKobbPpFIu8UNWEm8hLW5
 TsnQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUyxunMiRMwGe7Iv2snU332yV94BoHg8doGvsuA425fkVEITdmHIBfUv/uubsBno235oju7dGhWUU0=@lists.freedesktop.org,
 AJvYcCWtRt92ewXrebXUqLIGVNsWuw3pXUOFZiMQBifQvwvrOn/5f/3SWl8DOyVgrn18FvSaDRgF6ZG6XA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxbHvG8Q2VFTS9hJx2LuYEl8YaExRrDM9DSn5yYaKsvWYriqGyC
 rgkfueioNXKr3FSKwGvmoOzJ4CmBclOkyi226N/pOEwjrkWG9muXWcq0IwHylWIKkfcZOkls5Vi
 GUnYdIoU6lG2l/FsOu5xeN3mzLRU=
X-Google-Smtp-Source: AGHT+IF3wpG47CIG8HAng/5k1BoCwGJ5gr1ysnmhW+CYKjd/SXWivdxIHC1anfG9u4eJhD5HjtLRprmYq0Xv951tXuQ=
X-Received: by 2002:a05:6830:6c8c:b0:710:ecf0:205d with SMTP id
 46e09a7af769-710ecf0292cmr5578861a34.13.1726065570772; Wed, 11 Sep 2024
 07:39:30 -0700 (PDT)
MIME-Version: 1.0
References: <20240906100434.1171093-1-jfalempe@redhat.com>
 <20240906100434.1171093-4-jfalempe@redhat.com>
 <CAKb7UviZ_SZyuEV3apP80oEHZZKm4mAY1pSGueSOEswvzwgdkQ@mail.gmail.com>
 <21e44532-7989-43a9-99dd-04461c346be6@nvidia.com>
 <2fb7978b-9d1f-49f1-afe0-f32cc3b6a0c0@redhat.com>
In-Reply-To: <2fb7978b-9d1f-49f1-afe0-f32cc3b6a0c0@redhat.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Wed, 11 Sep 2024 10:39:19 -0400
Message-ID: <CAKb7Uvh8x0z00DY_w-16voWwBbm6pRGLLMBKai-M6_8CDLQfGw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] drm/nouveau: Add drm_panic support for nv50+
To: Jocelyn Falempe <jfalempe@redhat.com>
Cc: James Jones <jajones@nvidia.com>, Karol Herbst <kherbst@redhat.com>, 
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@redhat.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Content-Type: multipart/alternative; boundary="00000000000034af6e0621d8f555"
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

--00000000000034af6e0621d8f555
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 11, 2024 at 10:19=E2=80=AFAM Jocelyn Falempe <jfalempe@redhat.c=
om>
wrote:

> On 06/09/2024 21:36, James Jones wrote:
> > Right, there are 3 iterations of block linear tiling actually. NV50 doe=
s
> > support scanout of block linear surfaces. All block-linear-capable GPUs
> > do. The 3 generations are:
> >
> > NV5x/G8x/GTXXX line: Original block size.
> > GFXXX(nvc0 I believe in nouveau terms)-GV100: double the block height I
> > believe.
> > GTXXX+: Same block size, but the layout within a block is subtly
> > different, at least as visible in CPU mappings.
> >
>
> I'm looking at how to check for specific chip in nouveau, and fix the
> tiling for other cards than Turing.
> It looks like in most case nouveau uses device->info.chipset, with
> hardcoded hex value. so for nvc0+ I should check device->info.chipset >=
=3D
> 0xc0 ?
>
> chipset < c0 : block_height 4, "old layout"
> chipset >=3D c0 : block_height 8, "old layout"
> chispet >=3D ?? : block_height 8, "new layout"
>
> For testing, I have at hand a GTX1650 (Turing) and an old Geforce
> 8800GTS (Tesla?), so it's a NV92, and still uses this nv50+ code ?
>

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/dri=
vers/gpu/drm/nouveau/nvkm/engine/device/base.c#n2399

So probably >=3D 0x160

There should also be a device->card_type which is an enum that you can use
too, depending on what you have available? Set here:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/dri=
vers/gpu/drm/nouveau/nvkm/engine/device/base.c#n3177

Once you have a patch tested, ideally someone with the hardware should test
on a >=3D fermi && < turing card.

Hope this helps,

  -ilia

--00000000000034af6e0621d8f555
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, Sep 11, 2024 at 10:19=E2=80=AFAM =
Jocelyn Falempe &lt;<a href=3D"mailto:jfalempe@redhat.com">jfalempe@redhat.=
com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">On 06/09/2024 21:36, James Jones wrote:<br>
&gt; Right, there are 3 iterations of block linear tiling actually. NV50 do=
es <br>
&gt; support scanout of block linear surfaces. All block-linear-capable GPU=
s <br>
&gt; do. The 3 generations are:<br>
&gt; <br>
&gt; NV5x/G8x/GTXXX line: Original block size.<br>
&gt; GFXXX(nvc0 I believe in nouveau terms)-GV100: double the block height =
I <br>
&gt; believe.<br>
&gt; GTXXX+: Same block size, but the layout within a block is subtly <br>
&gt; different, at least as visible in CPU mappings.<br>
&gt; <br>
<br>
I&#39;m looking at how to check for specific chip in nouveau, and fix the <=
br>
tiling for other cards than Turing.<br>
It looks like in most case nouveau uses device-&gt;info.chipset, with <br>
hardcoded hex value. so for nvc0+ I should check device-&gt;info.chipset &g=
t;=3D <br>
0xc0 ?<br>
<br>
chipset &lt; c0 : block_height 4, &quot;old layout&quot;<br>
chipset &gt;=3D c0 : block_height 8, &quot;old layout&quot;<br>
chispet &gt;=3D ?? : block_height 8, &quot;new layout&quot;<br>
<br>
For testing, I have at hand a GTX1650 (Turing) and an old Geforce <br>
8800GTS (Tesla?), so it&#39;s a NV92, and still uses this nv50+ code ?<br><=
/blockquote><div><br></div><div><a href=3D"https://git.kernel.org/pub/scm/l=
inux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/nouveau/nvkm/engine=
/device/base.c#n2399">https://git.kernel.org/pub/scm/linux/kernel/git/torva=
lds/linux.git/tree/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c#n2399<=
/a><br></div><div><br></div><div>So probably &gt;=3D 0x160</div><div><br></=
div><div>There should also be a device-&gt;card_type which is an enum that =
you can use too, depending on what you have available? Set here:</div><div>=
<br></div><div><a href=3D"https://git.kernel.org/pub/scm/linux/kernel/git/t=
orvalds/linux.git/tree/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c#n3=
177">https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tre=
e/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c#n3177</a><br></div><div=
><br></div><div>Once you have a patch tested, ideally someone with the hard=
ware should test on a &gt;=3D fermi &amp;&amp; &lt; turing card.</div><div>=
<br></div><div>Hope this helps,</div><div><br></div><div>=C2=A0 -ilia</div>=
</div></div>

--00000000000034af6e0621d8f555--
