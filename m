Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2868BED6A
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2024 21:59:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A44711260E;
	Tue,  7 May 2024 19:59:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="b98by3Tj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com
 [209.85.219.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4476A10F066
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2024 19:59:54 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id
 3f1490d57ef6-deb654482bcso3631862276.1
 for <dri-devel@lists.freedesktop.org>; Tue, 07 May 2024 12:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1715111993; x=1715716793; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=9u4+z96HwXR809ZF1PkEWCwnBjus+4ZFL2JjXWvh/IY=;
 b=b98by3Tj5V8E9mgh/ArRnAVnW+rf1BRjjwM/0y+H1+SNglgMzxAB5MvarwbuIx8dTY
 6M5rM3Z0G3qM1Au8l4YEskrcux2VHg22gtEccA/q6ZbGd/OWWIZmLJ1Cg80CSBdeG/wf
 TmOLYgbqfOj9hPK4eAnQuKa5eN8+6vC8Yj9R719uZMRmQmGtABpg98/rgECQagJScYsx
 rtYZJhqxqJJCdfwWMm1b2Yay7Ga+Hr+b9JOHf0X7QBbpq0SLuohWGmCewYlRtTBSGmxb
 I2bAHIljIC49S0mGnxJlV2eTRvjbnWbt/EoOvzxmjvSj0jdya4aJwlYqDtJlgkD+VtiY
 U9Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715111993; x=1715716793;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9u4+z96HwXR809ZF1PkEWCwnBjus+4ZFL2JjXWvh/IY=;
 b=gMEVaX58+RNXMi2MKj7VqoHSX0B7ukyEu6c1BMnhwFyXpevNLDqdCj6oW97zk/WBBM
 mr+zvsLC7K3INr6CDVLQ3R2B4fvvybW4yZs+eFeFwksmAS0I4s+G9A9tZYQ5h8wv9PYH
 oDHTnX+OmYvCi00rFl/tlwN/RtZ8InJQL9j3YE8+++/dQa8oPhve5EAAHa9BbD1Wp9Dv
 j+FqVUCX0I6882qlSB3kLA9WIPyBwQUNH62bWfXBT87zzzeHr3X/rCS4AbNXLZuAlrTR
 gJ5IU1q/tjnXXNKs0qPr9T5bncYy2S3OQ43Y0F0jqZioeV8C0dtxICCmui2twI96aRCE
 sHcg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWO3x43tZW7wm5jWwX7M1N15e8/lJscjub3OC/i4OMtc6GSkUL/grVrLCt62eB+vN6Uv6k1pFplrS/tJ1zG9uKPliJnElIbMUDk0jWRWyDa
X-Gm-Message-State: AOJu0YwhynVWa1izDrE0oYFhsxqnClYNxvu7REieLZs4dkq+hKaMcMH/
 VfoQAa7mUVSVvMhKkHpFdflc5G9y+2wfMxchX6Rxjk+dvcM4mpjvwcBgkLvTqgpOE0/mXERjyWj
 d+W06M3/uM5A+z1qkQDVhdHagwMc7aXJehSfAtA==
X-Google-Smtp-Source: AGHT+IHOidTRxfaPcTyYfkMUG+K57a4v9CN0Di3Y62BasjAdrMLYfJVqOjaj2F7Xus+0Xcdfeto1KfCFGsurjzlI9PQ=
X-Received: by 2002:a5b:881:0:b0:deb:b3da:b1ad with SMTP id
 3f1490d57ef6-debb9cf9739mr749935276.12.1715111993047; Tue, 07 May 2024
 12:59:53 -0700 (PDT)
MIME-Version: 1.0
References: <bb372250-e8b8-4458-bc99-dd8365b06991@redhat.com>
 <ojduxo54lpcbfg2wfuhqhy7k3phncamtklh65z7gvttcwztmhk@zkifewcy4ovi>
 <3c0c7e7e-1530-411b-b7a4-9f13e0ff1f9e@redhat.com>
 <e7ilwp3vc32xze3iu2ejgqlgz44codsktnvyiufjhuf2zxcnnf@tnwzgzoxvbg2>
 <d2a512b2-e6b1-4675-b406-478074bbbe95@linaro.org>
 <CAA8EJpr4bJUQt2T63_FZ=KHGEm4vixfpk3pMV9naABEONJfMmQ@mail.gmail.com>
 <20240507184049.GC20390@pendragon.ideasonboard.com>
In-Reply-To: <20240507184049.GC20390@pendragon.ideasonboard.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 7 May 2024 22:59:42 +0300
Message-ID: <CAA8EJpqLu5w7gnqtDyuDDQBd7AEROTd6LTYi8muzjToXmkKR3w@mail.gmail.com>
Subject: Re: Safety of opening up /dev/dma_heap/* to physically present users
 (udev uaccess tag) ?
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
 Hans de Goede <hdegoede@redhat.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, 
 John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Lennart Poettering <mzxreary@0pointer.de>,
 Robert Mader <robert.mader@collabora.com>, 
 Sebastien Bacher <sebastien.bacher@canonical.com>, 
 Linux Media Mailing List <linux-media@vger.kernel.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 linaro-mm-sig@lists.linaro.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Milan Zamazal <mzamazal@redhat.com>, Maxime Ripard <mripard@redhat.com>,
 Andrey Konovalov <andrey.konovalov.ynk@gmail.com>
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

On Tue, 7 May 2024 at 21:40, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Tue, May 07, 2024 at 06:19:18PM +0300, Dmitry Baryshkov wrote:
> > On Tue, 7 May 2024 at 18:15, Bryan O'Donoghue wrote:
> > > On 07/05/2024 16:09, Dmitry Baryshkov wrote:
> > > > Ah, I see. Then why do you require the DMA-ble buffer at all? If you are
> > > > providing data to VPU or DRM, then you should be able to get the buffer
> > > > from the data-consuming device.
> > >
> > > Because we don't necessarily know what the consuming device is, if any.
> > >
> > > Could be VPU, could be Zoom/Hangouts via pipewire, could for argument
> > > sake be GPU or DSP.
> > >
> > > Also if we introduce a dependency on another device to allocate the
> > > output buffers - say always taking the output buffer from the GPU, then
> > > we've added another dependency which is more difficult to guarantee
> > > across different arches.
> >
> > Yes. And it should be expected. It's a consumer who knows the
> > restrictions on the buffer. As I wrote, Zoom/Hangouts should not
> > require a DMA buffer at all.
>
> Why not ? If you want to capture to a buffer that you then compose on
> the screen without copying data, dma-buf is the way to go. That's the
> Linux solution for buffer sharing.

Yes. But it should be allocated by the DRM driver. As Sima wrote,
there is no guarantee that the buffer allocated from dma-heaps is
accessible to the GPU.

>
> > Applications should be able to allocate
> > the buffer out of the generic memory.
>
> If applications really want to copy data and degrade performance, they
> are free to shoot themselves in the foot of course. Applications (or
> compositors) need to support copying as a fallback in the worst case,
> but all components should at least aim for the zero-copy case.

I'd say that they should aim for the optimal case. It might include
both zero-copying access from another DMA master or simple software
processing of some kind.

> > GPUs might also have different
> > requirements. Consider GPUs with VRAM. It might be beneficial to
> > allocate a buffer out of VRAM rather than generic DMA mem.
>
> Absolutely. For that we need a centralized device memory allocator in
> userspace. An effort was started by James Jones in 2016, see [1]. It has
> unfortunately stalled. If I didn't have a camera framework to develop, I
> would try to tackle that issue :-)

I'll review the talk. However the fact that the effort has stalled
most likely means that 'one fits them all' approach didn't really fly
well. We have too many usecases.

>
> [1] https://www.x.org/wiki/Events/XDC2016/Program/Unix_Device_Memory_Allocation.pdf

-- 
With best wishes
Dmitry
