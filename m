Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46FC1A35E5A
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 14:07:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F50B10EC76;
	Fri, 14 Feb 2025 13:07:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="OO1LY8U2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com
 [209.85.219.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8187110EC76
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 13:07:26 +0000 (UTC)
Received: by mail-qv1-f49.google.com with SMTP id
 6a1803df08f44-6dd420f82e2so28338016d6.1
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 05:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739538445; x=1740143245; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FNnj7+IGvRtmWRtdYlqf7RvYRLfXlCqJXD/wP+Mfkkw=;
 b=OO1LY8U2P6bnpQfwbDMVs7EpVs0qCBsX7zzd7Phylw3mH1Uryv/XwfRqSzoSp5GqdB
 5XT+3BZgt/ZzPmnTmsjVnxVGzn8IHceqOGjH1P3fTlv7xu8bSANTNiUtauEd2kBGDjlP
 iNujPqCck9yy9FLs9rDLNy+Oa6OROaWDHoeZixuvT7A1olZKuNNB2qedsAL0mZ45naLD
 0XolKyDCKHefs+XMTBJPIjnvVhb5DKC08WEzpBBszGe2UKkJRim0o/Fbn+ugc6OVYhEm
 Yhi4wYQd7KhtuJkSR/0vm7Tn5j3JsO3m9tCeBtpsC0JFppWmHsyJ5tARcjjI/rFSZ4td
 dnAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739538445; x=1740143245;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FNnj7+IGvRtmWRtdYlqf7RvYRLfXlCqJXD/wP+Mfkkw=;
 b=LEIn6XXqqetkVcQi87HC+EobK4dM53gEsvpqeLCX91CEiYY9x5t0+PEsXDO+m5rlhw
 ReTr1USMzt3kWFJ1JKZTDl+CTHlWZJQ/3fX6MdBPYM07rL7DGINQUZE8f5LyKystx2gf
 if03YaW16oKaEE5IYilypmxWM+2HWSb7YD1uynx0quk9ECpRQzYxz5VZ6dwjaFUu3J+w
 9EHxe2Lah+P6hS3pHuR8JLQlN9b/8r49lh+wMlMHKl/3dV37LRjjCb0cbIHm91enEgxb
 658/mNy7JVf3t8mFFsgn2WgAmT29xf9gOal6Fgmm8Ja150KSXRPUcB2QQmLY4Qq/V+7/
 +GTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6mebaDeRZcwKK58ROrAQymfGxgGfeaJ9QMRGmdIoMgEktJFxA1R348DJ60rfZjaLtWFa4y9CKP6g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyAjZj3Y5nNFG7fooKgSNlvWLpW9GGRnqvUo67fi8bJQTQIrZar
 NlAaWp8OD/skZ3V299LLqh2fD/vvPttib46bllv4TffI0AX65hms+eUvzbV1/ZPgH3wwhQ7dO3V
 DWsp2Mh1VaLMi9+uJ4gxVVkCgYDrKeaQ5MqsaMw==
X-Gm-Gg: ASbGncshcCoOWn1V3xvUFVKbPT+rUjuBNLDpiqNOD/RnQ6SZhv4snlstMfxj1jSi+1Z
 0ArL4vTFSB3+Pls6hfTCshPCkIBhQG9jLt0BQW+0Oiy7cBlD8lfQz/58B9/aGIVNnqTjBPm3dkt
 I=
X-Google-Smtp-Source: AGHT+IE3ByM7DSgjLBAaQUp9tqk81OqGvrRN0VTqQ2J9pH/WZcBHm5+t6oEWmrDoJ+W5s9rNaAD7/fQhaTsa/R2yq4c=
X-Received: by 2002:a05:6214:469c:b0:6e6:6225:a907 with SMTP id
 6a1803df08f44-6e66225a975mr79026126d6.31.1739538445485; Fri, 14 Feb 2025
 05:07:25 -0800 (PST)
MIME-Version: 1.0
References: <20241217100809.3962439-1-jens.wiklander@linaro.org>
 <20250212205613.4400a888@collabora.com>
 <CAFA6WYOaGEPj0xNEDBCoEmjJreEHChjQ2hyXRJ_CYoGhiBonfw@mail.gmail.com>
 <20250213093557.278f5d19@collabora.com>
 <CAFA6WYOJkSRsH-15QdqXNMd08Q=Dg4NkRd1Cr9LXA+5nozTF6g@mail.gmail.com>
 <20250213134008.4cbef142@collabora.com>
 <CAPj87rM5Y=-Jgf4mwukicF6Yb-vccn2fpG2X1jNq0upH2+cAEQ@mail.gmail.com>
 <CAHUa44G9hw-z6wzxg=HkVAxPKEW1yES5JTEqRWMvJUJAtcUDkQ@mail.gmail.com>
 <CAPj87rPHnME5Osgnf5-FSAu22mDpLj=dzvhi_NqEcOwr1ThgGw@mail.gmail.com>
 <CAHUa44Gs0D1fBD0=+EDgcQUMeDv4knci9trUkYEc1J98qFV7HQ@mail.gmail.com>
In-Reply-To: <CAHUa44Gs0D1fBD0=+EDgcQUMeDv4knci9trUkYEc1J98qFV7HQ@mail.gmail.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Fri, 14 Feb 2025 18:37:14 +0530
X-Gm-Features: AWEUYZnJYqssuMMtIO5Ohg5UzNEocwYL0hODNzFGJUyN-biak0SnkML6hDkQjD8
Message-ID: <CAFA6WYOuTwRPEh3L7+hMyARB_E73xmp+OwhKyS-r4+ryS7=9sw@mail.gmail.com>
Subject: Re: [PATCH v4 0/6] TEE subsystem for restricted dma-buf allocations
To: Jens Wiklander <jens.wiklander@linaro.org>,
 Daniel Stone <daniel@fooishbar.org>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, op-tee@lists.trustedfirmware.org, 
 linux-arm-kernel@lists.infradead.org, Olivier Masse <olivier.masse@nxp.com>, 
 Thierry Reding <thierry.reding@gmail.com>, Yong Wu <yong.wu@mediatek.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, 
 John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 azarrabi@qti.qualcomm.com, Florent Tomasin <florent.tomasin@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Fri, 14 Feb 2025 at 15:37, Jens Wiklander <jens.wiklander@linaro.org> wr=
ote:
>
> Hi,
>
> On Thu, Feb 13, 2025 at 6:39=E2=80=AFPM Daniel Stone <daniel@fooishbar.or=
g> wrote:
> >
> > Hi,
> >
> > On Thu, 13 Feb 2025 at 15:57, Jens Wiklander <jens.wiklander@linaro.org=
> wrote:
> > > On Thu, Feb 13, 2025 at 3:05=E2=80=AFPM Daniel Stone <daniel@fooishba=
r.org> wrote:
> > > > But just because TEE is one good backend implementation, doesn't me=
an
> > > > it should be the userspace ABI. Why should userspace care that TEE =
has
> > > > mediated the allocation instead of it being a predefined range with=
in
> > > > DT?
> > >
> > > The TEE may very well use a predefined range that part is abstracted
> > > with the interface.
> >
> > Of course. But you can also (and this has been shipped on real
> > devices) handle this without any per-allocation TEE needs by simply
> > allocating from a memory range which is predefined within DT.
> >
> > From the userspace point of view, why should there be one ABI to
> > allocate memory from a predefined range which is delivered by DT to
> > the kernel, and one ABI to allocate memory from a predefined range
> > which is mediated by TEE?
>
> We need some way to specify the protection profile (or use case as
> I've called it in the ABI) required for the buffer. Whether it's
> defined in DT seems irrelevant.
>
> >
> > > >  What advantage
> > > > does userspace get from having to have a different codepath to get =
a
> > > > different handle to memory? What about x86?
> > > >
> > > > I think this proposal is looking at it from the wrong direction.
> > > > Instead of working upwards from the implementation to userspace, st=
art
> > > > with userspace and work downwards. The interesting property to focu=
s
> > > > on is allocating memory, not that EL1 is involved behind the scenes=
.
> > >
> > > From what I've gathered from earlier discussions, it wasn't much of a
> > > problem for userspace to handle this. If the kernel were to provide i=
t
> > > via a different ABI, how would it be easier to implement in the
> > > kernel? I think we need an example to understand your suggestion.
> >
> > It is a problem for userspace, because we need to expose acceptable
> > parameters for allocation through the entire stack. If you look at the
> > dmabuf documentation in the kernel for how buffers should be allocated
> > and exchanged, you can see the negotiation flow for modifiers. This
> > permeates through KMS, EGL, Vulkan, Wayland, GStreamer, and more.
>
> What dma-buf properties are you referring to?
> dma_heap_ioctl_allocate() accepts a few flags for the resulting file
> descriptor and no flags for the heap itself.
>
> >
> > Standardising on heaps allows us to add those in a similar way.
>
> How would you solve this with heaps? Would you use one heap for each
> protection profile (use case), add heap_flags, or do a bit of both?

Christian gave an historical background here [1] as to why that hasn't
worked in the past with DMA heaps given the scalability issues.

[1] https://lore.kernel.org/dri-devel/e967e382-6cca-4dee-8333-39892d532f71@=
gmail.com/

>
> > If we
> > have to add different allocation mechanisms, then the complexity
> > increases, permeating not only into all the different userspace APIs,
> > but also into the drivers which need to support every different
> > allocation mechanism even if they have no opinion on it - e.g. Mali
> > doesn't care in any way whether the allocation comes from a heap or
> > TEE or ACPI or whatever, it cares only that the memory is protected.
> >
> > Does that help?
>
> I think you're missing the stage where an unprotected buffer is
> received and decrypted into a protected buffer. If you use the TEE for
> decryption or to configure the involved devices for the use case, it
> makes sense to let the TEE allocate the buffers, too. A TEE doesn't
> have to be an OS in the secure world, it can be an abstraction to
> support the use case depending on the design. So the restricted buffer
> is already allocated before we reach Mali in your example.
>
> Allocating restricted buffers from the TEE subsystem saves us from
> maintaining proxy dma-buf heaps.

+1

-Sumit
