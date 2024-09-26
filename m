Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A72859874C8
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2024 15:53:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C8DC10EB57;
	Thu, 26 Sep 2024 13:53:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="iAH0z9fx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com
 [209.85.217.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9817A10EB57
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 13:53:11 +0000 (UTC)
Received: by mail-vs1-f41.google.com with SMTP id
 ada2fe7eead31-49bcd11fc37so392820137.3
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 06:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727358790; x=1727963590; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v7tAPySwmdQHAtA+YRpD9HZ0WA3SFgtNuMS1LZNdOfM=;
 b=iAH0z9fxP3QJZlJxfbeRqJWY6Ee/by5vyo6M3B6RiedFpGSY/Y8H7iPlT477ylsURW
 x7dOABzt2v7/Bkuz4JBu2kFF+aqkeLW29SQ838xJZvQAGiSkUf9MbiGMz/Nvd6ysQYzg
 e3iKIkuFRmU3NB8qdKRT3R/Ato0CJe3AwTccR1qoc8QJDk7xHBjkgjwIBYzuyFi36q9A
 NVBq7M6Evl2ILdwbAEnMtzcBeAsrUW1GXfcjWRgAsgWipfwF7yL/9xmqa17v6QmBU9zH
 mHZd62j81wfLr5i02LsDotbiM0TuJ81F8qFTF08EWeT49XGk4jk8YOOytHmrPMJ/u3GJ
 FS5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727358790; x=1727963590;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v7tAPySwmdQHAtA+YRpD9HZ0WA3SFgtNuMS1LZNdOfM=;
 b=HNDO+S6lnLKdQG+dMe3EqdF+Q5xQTEVmlm6ISVF5XlrPT3ItMJLeLkerbIVDOBCDPI
 XDaua1lvxxQKdozJFQrf9XQwehfB1HCMCrvmspU85d4ifA9twMWsjEsYGSucYPR/BIMu
 NYoLrT8j8jG7ONyRFTs/yOpY+gxfTItNIpixs5dBsuCQy2xllWnZpxJbEQuQE9PYvOac
 Pl6gLBQF/XQzlHT4S6RdSQBwk5CMkuGaqPpFIEy+PPxkcRhN0zliGQrSXIk8gYxCrW9I
 gtBs6u5B4KS2oraZczOCYf1bV0v4EVJBelk2zeOtCmtnXZ3kSfpO9zBguJDmWl0hRjlX
 yi7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXdpNTwl7TT1DzyJWlWaKqK5wm+FRKXqeMfnX2tr/COfToxmIExYqwjbP1S4OjM9LDP96sCieg+ifU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy0LCyZDav3bTbiq5SZ43GxSOj2TIsj9oX+j7qo8ke+w41/PlBQ
 wU2tzaVLxmpey4bjZ/Tr+mYRBjB3xe01v6PpyINxE88b/waN4G+3STTQSYy14xmo6wjwryQTg/l
 LXW7+DWj0tmC8qvoT0E1UCsNsuaMbkFnHXDZNBg==
X-Google-Smtp-Source: AGHT+IGiiwbrTmw9dljjWSN9d0gHwqaQUj+Fn0r4rGaVn1FGbJ9M6TMGDh8ZVVMliTp3gdeL94LIECqfDzeHqpj4reg=
X-Received: by 2002:a05:6102:3e8f:b0:49b:d1e7:5442 with SMTP id
 ada2fe7eead31-4a15dd44cd9mr6602413137.18.1727358790467; Thu, 26 Sep 2024
 06:53:10 -0700 (PDT)
MIME-Version: 1.0
References: <20240830070351.2855919-1-jens.wiklander@linaro.org>
 <dhxvyshwi4qmcmwceokhqey2ww4azjcs6qrpnkgivdj7tv5cke@r36srvvbof6q>
 <d8e0cb78-7cfb-42bf-b3a5-f765592e8dd4@ti.com>
 <mzur3odofwwrdqnystozjgf3qtvb73wqjm6g2vf5dfsqiehaxk@u67fcarhm6ge>
 <e967e382-6cca-4dee-8333-39892d532f71@gmail.com>
 <lk7a2xuqrctyywuanjwseh5lkcz3soatc2zf3kn3uwc43pdyic@edm3hcd2koas>
 <04caa788-19a6-4336-985c-4eb191c24438@amd.com>
 <2f9a4abe-b2fc-4bc7-9926-1da2d38f5080@linaro.org>
In-Reply-To: <2f9a4abe-b2fc-4bc7-9926-1da2d38f5080@linaro.org>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Thu, 26 Sep 2024 19:22:59 +0530
Message-ID: <CAFA6WYMd46quafJoGXjkCiPOKpYoDZdXwrNbG3QekyjB3_2FTA@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] Re: [RFC PATCH 0/4] Linaro restricted heap
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: Andrew Davis <afd@ti.com>, Jens Wiklander <jens.wiklander@linaro.org>,
 linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 op-tee@lists.trustedfirmware.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Olivier Masse <olivier.masse@nxp.com>, 
 Thierry Reding <thierry.reding@gmail.com>, Yong Wu <yong.wu@mediatek.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, 
 John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
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

[Resend in plain text format as my earlier message was rejected by
some mailing lists]

On Thu, 26 Sept 2024 at 19:17, Sumit Garg <sumit.garg@linaro.org> wrote:
>
> On 9/25/24 19:31, Christian K=C3=B6nig wrote:
>
> Am 25.09.24 um 14:51 schrieb Dmitry Baryshkov:
>
> On Wed, Sep 25, 2024 at 10:51:15AM GMT, Christian K=C3=B6nig wrote:
>
> Am 25.09.24 um 01:05 schrieb Dmitry Baryshkov:
>
> On Tue, Sep 24, 2024 at 01:13:18PM GMT, Andrew Davis wrote:
>
> On 9/23/24 1:33 AM, Dmitry Baryshkov wrote:
>
> Hi,
>
> On Fri, Aug 30, 2024 at 09:03:47AM GMT, Jens Wiklander wrote:
>
> Hi,
>
> This patch set is based on top of Yong Wu's restricted heap patch set [1]=
.
> It's also a continuation on Olivier's Add dma-buf secure-heap patch set [=
2].
>
> The Linaro restricted heap uses genalloc in the kernel to manage the heap
> carvout. This is a difference from the Mediatek restricted heap which
> relies on the secure world to manage the carveout.
>
> I've tried to adress the comments on [2], but [1] introduces changes so I=
'm
> afraid I've had to skip some comments.
>
> I know I have raised the same question during LPC (in connection to
> Qualcomm's dma-heap implementation). Is there any reason why we are
> using generic heaps instead of allocating the dma-bufs on the device
> side?
>
> In your case you already have TEE device, you can use it to allocate and
> export dma-bufs, which then get imported by the V4L and DRM drivers.
>
> This goes to the heart of why we have dma-heaps in the first place.
> We don't want to burden userspace with having to figure out the right
> place to get a dma-buf for a given use-case on a given hardware.
> That would be very non-portable, and fail at the core purpose of
> a kernel: to abstract hardware specifics away.
>
> Unfortunately all proposals to use dma-buf heaps were moving in the
> described direction: let app select (somehow) from a platform- and
> vendor- specific list of dma-buf heaps. In the kernel we at least know
> the platform on which the system is running. Userspace generally doesn't
> (and shouldn't). As such, it seems better to me to keep the knowledge in
> the kernel and allow userspace do its job by calling into existing
> device drivers.
>
> The idea of letting the kernel fully abstract away the complexity of inte=
r
> device data exchange is a completely failed design. There has been plenty=
 of
> evidence for that over the years.
>
> Because of this in DMA-buf it's an intentional design decision that
> userspace and *not* the kernel decides where and what to allocate from.
>
> Hmm, ok.
>
> What the kernel should provide are the necessary information what type of
> memory a device can work with and if certain memory is accessible or not.
> This is the part which is unfortunately still not well defined nor
> implemented at the moment.
>
> Apart from that there are a whole bunch of intentional design decision wh=
ich
> should prevent developers to move allocation decision inside the kernel. =
For
> example DMA-buf doesn't know what the content of the buffer is (except fo=
r
> it's total size) and which use cases a buffer will be used with.
>
> So the question if memory should be exposed through DMA-heaps or a driver
> specific allocator is not a question of abstraction, but rather one of th=
e
> physical location and accessibility of the memory.
>
> If the memory is attached to any physical device, e.g. local memory on a
> dGPU, FPGA PCIe BAR, RDMA, camera internal memory etc, then expose the
> memory as device specific allocator.
>
> So, for embedded systems with unified memory all buffers (maybe except
> PCIe BARs) should come from DMA-BUF heaps, correct?
>
>
> From what I know that is correct, yes. Question is really if that will st=
ay this way.
>
> Neural accelerators look a lot stripped down FPGAs these days and the ben=
efit of local memory for GPUs is known for decades.
>
> Could be that designs with local specialized memory see a revival any tim=
e, who knows.
>
> If the memory is not physically attached to any device, but rather just
> memory attached to the CPU or a system wide memory controller then expose
> the memory as DMA-heap with specific requirements (e.g. certain sized pag=
es,
> contiguous, restricted, encrypted, ...).
>
> Is encrypted / protected a part of the allocation contract or should it
> be enforced separately via a call to TEE / SCM / anything else?
>
>
> Well that is a really good question I can't fully answer either. From wha=
t I know now I would say it depends on the design.
>

IMHO, I think Dmitry's proposal to rather allow the TEE device to be
the allocator and exporter of DMA-bufs related to restricted memory
makes sense to me. Since it's really the TEE implementation (OP-TEE,
AMD-TEE, TS-TEE or future QTEE) which sets up the restrictions on a
particular piece of allocated memory. AFAIK, that happens after the
DMA-buf gets allocated and then user-space calls into TEE to set up
which media pipeline is going to access that particular DMA-buf. It
can also be a static contract depending on a particular platform
design.

As Jens noted in the other thread, we already manage shared memory
allocations (from a static carve-out or dynamically mapped) for
communications among Linux and TEE that were based on DMA-bufs earlier
but since we didn't required them to be shared with other devices, so
we rather switched to anonymous memory.

From user-space perspective, it's cleaner to use TEE device IOCTLs for
DMA-buf allocations since it already knows which underlying TEE
implementation it's communicating with rather than first figuring out
which DMA heap to use for allocation and then communicating with TEE
implementation.

-Sumit
