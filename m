Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA13DA348AE
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 16:58:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DE7110E458;
	Thu, 13 Feb 2025 15:58:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="cHT76zIy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com
 [209.85.160.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA4A310E457
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 15:57:58 +0000 (UTC)
Received: by mail-oa1-f41.google.com with SMTP id
 586e51a60fabf-2b85d1a9091so521149fac.0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 07:57:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739462278; x=1740067078; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NHtO1l0Sm3xnCkozanEaDdmWEvTg249bwN+Pta/EflE=;
 b=cHT76zIyF1ALUZ3azOKI3kXu12gXTzfKk1ifaes56u6baCfNi9xWDUC8+lGE7ww92Q
 bxB6E62L+3fGjOBXSoKoTpRj5IzjFTuyz76hEWLjRTRALwsWhiBtPdayMDvZDggtuaGi
 LC1KMf69LAe5MV/XOtxQRNJfVU9GCkCjP226p7kL3Bd+xyROdqrZo4+v+Uv6MyN4NZoo
 GqXkSJfESNF23AVREqbd3+dabKx/n/lOgUs8RJ/sjLfRDs//rpVQbiWWTIAClI3qwMIs
 HLDhFpfOvfdsfpfCmEnnynKZs+YqtDyaS908KQ/c4jEtK0d36zctmBTc4NzZPXrAO45V
 iVuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739462278; x=1740067078;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NHtO1l0Sm3xnCkozanEaDdmWEvTg249bwN+Pta/EflE=;
 b=vbxwPd8bUzK1cXt9l1eeQPoqLqyZXItpzzGSOLnZbfmcsqq8nPuB0+D5F4k+sgiQMD
 c2FunmIxBd65ZXPkF9NGLVuv6WzRUzIHwtiNlPbTRjZYdqgx0hmliqZ7m5Ga6ywUZ1z0
 3G3edBmM1HEfhKMet8weMWB1xYICIni6Xw4V4u3YHt9I6GdzBMbpY2Q4cmmRidUs8NJt
 JROc6U6vCXVv1F8z9WCJswr67yI7XH3r+2+NOLQf4ASa0XSMp6P6W33zKs+O3w2Tc7VS
 SHtohHKtbWXs5Bc5soOcWkqjiYpCIwzb/rkzSdvA3EXPhS/jP4GAmdIWQBeZ5N4eSAQw
 eV/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNXotHMWDVU02ixxJY73BOB1UxBGA/BO8GtygeCThSVUNakzX76RGLO6EALAXfZDy7WikdIqEP4/o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwdqV7wo2EA7zbQs2v04gBQfamY7SuHzaPjT/7c11C3Zq+nqQnu
 7hxPh82bqIf7qKCVdh4cyUre/XKkKSBoe1YWh06NQdh9oFk+48Hhtv4EneHtCzAiwgybwCGQ0t6
 BHbUchSO0NYZbTk7A7S/9EwYRaIjz83hx8y+HKg==
X-Gm-Gg: ASbGncsQ43sETAdcm9PjVEeW5RQXq+aZ7q8CEuvWTqsKEsgy2+iYUpVDIr1Kr9Ty8Pb
 8HvZEd0QP1U2vUiXgthUCGuAeSodHT9wzarhp4GxOJrgfN843Mo29JXVgz3sSxXXdFLdPHcaZjw
 ==
X-Google-Smtp-Source: AGHT+IFP5g43bicIDLt/S4uI2Sk6WesrFKEkZAgRcsR6UVnbplWcWySy+Pe58g7cxxxYF2yjdv9hpHSaFgfwFOWE+Ow=
X-Received: by 2002:a05:6870:f112:b0:2b8:84d7:ddd5 with SMTP id
 586e51a60fabf-2b8d68c6af2mr4406581fac.39.1739462278059; Thu, 13 Feb 2025
 07:57:58 -0800 (PST)
MIME-Version: 1.0
References: <20241217100809.3962439-1-jens.wiklander@linaro.org>
 <20250212205613.4400a888@collabora.com>
 <CAFA6WYOaGEPj0xNEDBCoEmjJreEHChjQ2hyXRJ_CYoGhiBonfw@mail.gmail.com>
 <20250213093557.278f5d19@collabora.com>
 <CAFA6WYOJkSRsH-15QdqXNMd08Q=Dg4NkRd1Cr9LXA+5nozTF6g@mail.gmail.com>
 <20250213134008.4cbef142@collabora.com>
 <CAPj87rM5Y=-Jgf4mwukicF6Yb-vccn2fpG2X1jNq0upH2+cAEQ@mail.gmail.com>
In-Reply-To: <CAPj87rM5Y=-Jgf4mwukicF6Yb-vccn2fpG2X1jNq0upH2+cAEQ@mail.gmail.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Thu, 13 Feb 2025 16:57:42 +0100
X-Gm-Features: AWEUYZmgVASDSvu5hsJWJHBSSPIof2Z6xxr-T5u2MSp4prWGrnjV2aHs43vhfXo
Message-ID: <CAHUa44G9hw-z6wzxg=HkVAxPKEW1yES5JTEqRWMvJUJAtcUDkQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/6] TEE subsystem for restricted dma-buf allocations
To: Daniel Stone <daniel@fooishbar.org>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Sumit Garg <sumit.garg@linaro.org>, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 op-tee@lists.trustedfirmware.org, linux-arm-kernel@lists.infradead.org, 
 Olivier Masse <olivier.masse@nxp.com>,
 Thierry Reding <thierry.reding@gmail.com>, 
 Yong Wu <yong.wu@mediatek.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
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

Hi,

On Thu, Feb 13, 2025 at 3:05=E2=80=AFPM Daniel Stone <daniel@fooishbar.org>=
 wrote:
>
> Hi,
>
> On Thu, 13 Feb 2025 at 12:40, Boris Brezillon
> <boris.brezillon@collabora.com> wrote:
> > On Thu, 13 Feb 2025 14:46:01 +0530 Sumit Garg <sumit.garg@linaro.org> w=
rote:
> > > Yeah but all the prior vendor specific secure/restricted DMA heaps
> > > relied on DT information.
> >
> > Right, but there's nothing in the DMA heap provider API forcing that.
>
> Yeah. DMA heaps are just a way to allocate memory from a specific
> place. It allows people to settle on having a single way to do
> allocations from weird platform-specific places; the only weird
> platform-specific part userspace needs to deal with is figuring out
> the name to use. The rest is at least a unified API: the point of
> dma-heaps was exactly to have a single coherent API for userspace, not
> to create one API for ZONE_CMA and DT ranges and everyone else doing
> their own thing.
>
> > > Rather than that it's better
> > > for the user to directly ask the TEE device to allocate restricted
> > > memory without worrying about how the memory restriction gets
> > > enforced.
> >
> > If the consensus is that restricted/protected memory allocation should
> > always be routed to the TEE, sure, but I had the feeling this wasn't as
> > clear as that. OTOH, using a dma-heap to expose the TEE-SDP
> > implementation provides the same benefits, without making potential
> > future non-TEE based implementations a pain for users. The dma-heap
> > ioctl being common to all implementations, it just becomes a
> > configuration matter if we want to change the heap we rely on for
> > protected/restricted buffer allocation. And because heaps have
> > unique/well-known names, users can still default to (or rely solely on)
> > the TEE-SPD implementation if they want.
> >
> > > There have been several attempts with DMA heaps in the past which all
> > > resulted in a very vendor specific vertically integrated solution. Bu=
t
> > > the solution with TEE subsystem aims to make it generic and vendor
> > > agnostic.
> >
> > Just because all previous protected/restricted dma-heap effort
> > failed to make it upstream, doesn't mean dma-heap is the wrong way of
> > exposing this feature IMHO.
>
> To be fair, having a TEE implementation does give us a much better
> chance of having a sensible cross-vendor plan. And the fact it's
> already (sort of accidentally and only on one platform AFAICT) ready
> for a 'test' interface, where we can still exercise protected
> allocation paths but without having to go through all the
> platform-specific setup that is inaccessible to most people, is also
> really great! That's probably been the biggest barrier to having this
> tested outside of IHVs and OEMs.
>
> But just because TEE is one good backend implementation, doesn't mean
> it should be the userspace ABI. Why should userspace care that TEE has
> mediated the allocation instead of it being a predefined range within
> DT?

The TEE may very well use a predefined range that part is abstracted
with the interface.

> How does userspace pick which TEE device to use?

There's normally only one and even if there is more than one it should
be safe to assume that only one of them should be used when allocating
restricted memory (TEE_GEN_CAP_RSTMEM from TEE_IOC_VERSION).

>  What advantage
> does userspace get from having to have a different codepath to get a
> different handle to memory? What about x86?
>
> I think this proposal is looking at it from the wrong direction.
> Instead of working upwards from the implementation to userspace, start
> with userspace and work downwards. The interesting property to focus
> on is allocating memory, not that EL1 is involved behind the scenes.

From what I've gathered from earlier discussions, it wasn't much of a
problem for userspace to handle this. If the kernel were to provide it
via a different ABI, how would it be easier to implement in the
kernel? I think we need an example to understand your suggestion.

Cheers,
Jens
