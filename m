Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C707DA34141
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 15:05:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B998510EAC1;
	Thu, 13 Feb 2025 14:05:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.b="HES6hc0J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C541D10EAC1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 14:05:34 +0000 (UTC)
Received: by mail-qk1-f181.google.com with SMTP id
 af79cd13be357-7c05bb6dab7so94949885a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 06:05:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar.org; s=google; t=1739455533; x=1740060333;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=fiZcI5pNzRU07XzzU8EnwEz/jsrm+hKHSzrUBfY4xZU=;
 b=HES6hc0JwbCcswlw6WNGONaIGw9Rik5CrSoQoumJYCjMis8eKqYPpy5RkjXN8mGdmF
 nklsnsOxft2Vr5j2u3aVPMTQPkybPx+PK6hzRIe8ofXadLH7hNV9VIadRdVnDgMRyfyL
 yfBHGl7ot2o5opeEznjYVt3Y3vM+k7rK3cWpqKbgeCLimqVBfqJmFjXEd8F2veZhVrs8
 Vu2OPtuVCYujHKlIvQyihgJ28tWf3zqewEjklur9eXgMWaKA41snEpq011fvEZ8z3nrr
 Q2nUXFSl5JW6adlqhL9otem1s7F53QlagQbhJ61sxIYvPXXI84OJJzohlx/Y2yYiZnT9
 pb4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739455533; x=1740060333;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fiZcI5pNzRU07XzzU8EnwEz/jsrm+hKHSzrUBfY4xZU=;
 b=wtxEPh+nzRWbOcCCrEFm1h7xLd3dVrl6q0o4Ks5z6HGZNATbIfRffm2F3Oe00/EVEf
 TGNe6xK8GrxIHcDeoDIIuyuJ/g9QF5WQaJdtVXdaKKsB/X0rsPDL3GT/Z/O7BJhV5FmM
 eGhz/GTGoCL21liwbOtB0aCbQ8T9oGejDecSUozNeB+Q0wb4Xj1SMIRGYutElV3zNq3T
 w7woFcsQxzeLi6obSKzQ8wYB+Ej9GwvgUA/er4IWHRPOT0Il6IrkPfhpNAA7wX0HovZB
 edAMZozE+vZDgn2hWNracKVBQc86pbTwY24VSvKcyMr6TzUkBOH27MOub0sa039XCTG6
 +Ltg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVR6mOoB9cbGzYREfhRl6MnlYExMcW5qpDKbMd+GZbkW8EkCSB6KvHM6hC6Co3jqpyitHZYZEnHEA0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz6CU1XTm+CpXd1CY08VUg8h2nroPQnTgytII5SLWTgkrNR0V61
 OaA5t+ruaYbVJ9URYv/qtdG06tK6hj213ON1NBoVMkKpjqTUVb/htuafzlEA8xRwjsqhz2+7igA
 Wx+/pamnJGgXu70EU7dYI8NHZXNIU9cAEsX1peQ==
X-Gm-Gg: ASbGnctrCxdjb8ZSIfii8LfMKmvRGwPbkctL6b/ZcAA74zg7k6JuhYTWZqjnheibISO
 s7KLjguu4/9r6VROVcdLJ+KcLy3uVSBBo3aTu/pc67OcZTfCoRBiHrAimWrrMawZ9NBcmcQ==
X-Google-Smtp-Source: AGHT+IGMP88jINMPoFMOhhs/JAOS7v2yzIBooFPBVGpWjkqaheBF8kqUyMw9whWPj/OQ8rwmytDe/wVilf8O/rIqWwA=
X-Received: by 2002:a05:620a:6841:b0:7b6:d611:ce6f with SMTP id
 af79cd13be357-7c07a89294cmr506602985a.8.1739455533614; Thu, 13 Feb 2025
 06:05:33 -0800 (PST)
MIME-Version: 1.0
References: <20241217100809.3962439-1-jens.wiklander@linaro.org>
 <20250212205613.4400a888@collabora.com>
 <CAFA6WYOaGEPj0xNEDBCoEmjJreEHChjQ2hyXRJ_CYoGhiBonfw@mail.gmail.com>
 <20250213093557.278f5d19@collabora.com>
 <CAFA6WYOJkSRsH-15QdqXNMd08Q=Dg4NkRd1Cr9LXA+5nozTF6g@mail.gmail.com>
 <20250213134008.4cbef142@collabora.com>
In-Reply-To: <20250213134008.4cbef142@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 13 Feb 2025 14:05:22 +0000
X-Gm-Features: AWEUYZn29uWPvEYSBg2IY8QVofzDJvdO9H1dHkQQoSFoIsbJfLKOXfSzgdbP8WY
Message-ID: <CAPj87rM5Y=-Jgf4mwukicF6Yb-vccn2fpG2X1jNq0upH2+cAEQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/6] TEE subsystem for restricted dma-buf allocations
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Sumit Garg <sumit.garg@linaro.org>,
 Jens Wiklander <jens.wiklander@linaro.org>, 
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

On Thu, 13 Feb 2025 at 12:40, Boris Brezillon
<boris.brezillon@collabora.com> wrote:
> On Thu, 13 Feb 2025 14:46:01 +0530 Sumit Garg <sumit.garg@linaro.org> wrote:
> > Yeah but all the prior vendor specific secure/restricted DMA heaps
> > relied on DT information.
>
> Right, but there's nothing in the DMA heap provider API forcing that.

Yeah. DMA heaps are just a way to allocate memory from a specific
place. It allows people to settle on having a single way to do
allocations from weird platform-specific places; the only weird
platform-specific part userspace needs to deal with is figuring out
the name to use. The rest is at least a unified API: the point of
dma-heaps was exactly to have a single coherent API for userspace, not
to create one API for ZONE_CMA and DT ranges and everyone else doing
their own thing.

> > Rather than that it's better
> > for the user to directly ask the TEE device to allocate restricted
> > memory without worrying about how the memory restriction gets
> > enforced.
>
> If the consensus is that restricted/protected memory allocation should
> always be routed to the TEE, sure, but I had the feeling this wasn't as
> clear as that. OTOH, using a dma-heap to expose the TEE-SDP
> implementation provides the same benefits, without making potential
> future non-TEE based implementations a pain for users. The dma-heap
> ioctl being common to all implementations, it just becomes a
> configuration matter if we want to change the heap we rely on for
> protected/restricted buffer allocation. And because heaps have
> unique/well-known names, users can still default to (or rely solely on)
> the TEE-SPD implementation if they want.
>
> > There have been several attempts with DMA heaps in the past which all
> > resulted in a very vendor specific vertically integrated solution. But
> > the solution with TEE subsystem aims to make it generic and vendor
> > agnostic.
>
> Just because all previous protected/restricted dma-heap effort
> failed to make it upstream, doesn't mean dma-heap is the wrong way of
> exposing this feature IMHO.

To be fair, having a TEE implementation does give us a much better
chance of having a sensible cross-vendor plan. And the fact it's
already (sort of accidentally and only on one platform AFAICT) ready
for a 'test' interface, where we can still exercise protected
allocation paths but without having to go through all the
platform-specific setup that is inaccessible to most people, is also
really great! That's probably been the biggest barrier to having this
tested outside of IHVs and OEMs.

But just because TEE is one good backend implementation, doesn't mean
it should be the userspace ABI. Why should userspace care that TEE has
mediated the allocation instead of it being a predefined range within
DT? How does userspace pick which TEE device to use?  What advantage
does userspace get from having to have a different codepath to get a
different handle to memory?  What about x86?

I think this proposal is looking at it from the wrong direction.
Instead of working upwards from the implementation to userspace, start
with userspace and work downwards. The interesting property to focus
on is allocating memory, not that EL1 is involved behind the scenes.

Cheers,
Daniel
