Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 821EDA34C22
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 18:39:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3613410EB5F;
	Thu, 13 Feb 2025 17:39:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.b="C0T/8UhE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
 [209.85.160.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8876610EB5F
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 17:39:46 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id
 d75a77b69052e-4717fe0735fso12029011cf.1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 09:39:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar.org; s=google; t=1739468385; x=1740073185;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=whhYbCC8Ye/92zXnbL6IJWDNwsx8j4boIogQLPts9MI=;
 b=C0T/8UhEQ/XLAt40Yja04Gbz/8tpH2U/pcPDYfj+Ae8Ww6K0Ukk+6f6dh8YNzgiWcG
 /fI9o/e5GlsecpF+aSg7sYev2jDVwV7rBRqqssJTZ1Jlpb/ZBMhhHxhmcsLdPx/ysZfP
 rjUbezlt68f1avu32q78vLwQBY3gi4fKmX04t0KR+F2SM/KuuKWUN9CYNMJcrbPMJD4z
 UddSH1mPFpNG7HWDkbsB9qNfPJHwHdEu8N5iG4JXfCev6llBTKZKV77dK31kTSj+P1bw
 t3G3Y6Hhdx1tgo1goBkJAhLXHv+sFDOje5LIFI4eMTDFCOVum4ew8XTLk55Pmv2vYJ8a
 1kqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739468385; x=1740073185;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=whhYbCC8Ye/92zXnbL6IJWDNwsx8j4boIogQLPts9MI=;
 b=NnPsrzfvU7UPqiJJ11unacVWEaxlQyeIksAD61bUwAqAHV82Qn2QHstiWhn7LpnO2f
 ilrp6CiyfGLeDry+zpRIWHqo6jVugE9jgo7kAvqQPhULJ+r4e/NkEExbHDNXTQE3XAUz
 XaXZiui3Ow8aR4n2S/dZAxZE0B1FvrSPxqkwY0Lfjopa2UCtfxhb+lO+HsuF9rjd0EEd
 4G6xlCi2ZePV4OoZ/jWbfrmq5toc9RlldYJ7tUn2vY+j67V+jJrYtlYHX4fpFbPxOVi3
 MtKG52kLLvG2v4WU4YqxpsvaeSI13daDEOMKVUjKCvD1NbAA75CDs3Oe8VauhDvSuAw4
 BBXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXPC0fAjlkhyd4lJ1Yta8CTQ0tNBGNuW8MBpd223IGWEelmuXfQQb1/AVtyQR/vjwQaH0CzZr+fvII=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzaRD+Qn5kZHZ2qlMXJQUR78lpCTOTspfmcwBqMsdolB2jOxKTQ
 T0mFrSdo/Oc7gcKfyz+mqrqg+rpFI5E01otNhqgtfwxKXws1vRcPS6YGzs7si2I40A8fI1hC6Bg
 XFIaVDinrIeBzC4D72uFYOWQB0Kr/1UGJGH2DUg==
X-Gm-Gg: ASbGncss0aOOzQrwIdFbKo3BYzniQaxvTOLFBSYqcRGvmEg5Mgv0GX6fdGf2aqZwr4C
 ab9SQsD2caED5suTr90Y9PW+hLQ8jrQeDXkRtWMA+Gxsv56TQRG7v3iBDVhsNNAVlADNwe8g=
X-Google-Smtp-Source: AGHT+IGE9qUAgteAk42h8NRzlwUiEVQLmyQkmiwetNHn7TWQ4JRreBJYCr8hrD0N2jIsyDYrKQ939hR7SXW12F654hE=
X-Received: by 2002:a05:622a:418e:b0:471:bd5e:d5dd with SMTP id
 d75a77b69052e-471bd5ed804mr90077321cf.16.1739468385599; Thu, 13 Feb 2025
 09:39:45 -0800 (PST)
MIME-Version: 1.0
References: <20241217100809.3962439-1-jens.wiklander@linaro.org>
 <20250212205613.4400a888@collabora.com>
 <CAFA6WYOaGEPj0xNEDBCoEmjJreEHChjQ2hyXRJ_CYoGhiBonfw@mail.gmail.com>
 <20250213093557.278f5d19@collabora.com>
 <CAFA6WYOJkSRsH-15QdqXNMd08Q=Dg4NkRd1Cr9LXA+5nozTF6g@mail.gmail.com>
 <20250213134008.4cbef142@collabora.com>
 <CAPj87rM5Y=-Jgf4mwukicF6Yb-vccn2fpG2X1jNq0upH2+cAEQ@mail.gmail.com>
 <CAHUa44G9hw-z6wzxg=HkVAxPKEW1yES5JTEqRWMvJUJAtcUDkQ@mail.gmail.com>
In-Reply-To: <CAHUa44G9hw-z6wzxg=HkVAxPKEW1yES5JTEqRWMvJUJAtcUDkQ@mail.gmail.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 13 Feb 2025 17:39:33 +0000
X-Gm-Features: AWEUYZlDafBpFokqUpKbJAhQu7Ep0JLs4xPUNmdO9fz5XX0E98BWFTHCpoumcPo
Message-ID: <CAPj87rPHnME5Osgnf5-FSAu22mDpLj=dzvhi_NqEcOwr1ThgGw@mail.gmail.com>
Subject: Re: [PATCH v4 0/6] TEE subsystem for restricted dma-buf allocations
To: Jens Wiklander <jens.wiklander@linaro.org>
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

On Thu, 13 Feb 2025 at 15:57, Jens Wiklander <jens.wiklander@linaro.org> wr=
ote:
> On Thu, Feb 13, 2025 at 3:05=E2=80=AFPM Daniel Stone <daniel@fooishbar.or=
g> wrote:
> > But just because TEE is one good backend implementation, doesn't mean
> > it should be the userspace ABI. Why should userspace care that TEE has
> > mediated the allocation instead of it being a predefined range within
> > DT?
>
> The TEE may very well use a predefined range that part is abstracted
> with the interface.

Of course. But you can also (and this has been shipped on real
devices) handle this without any per-allocation TEE needs by simply
allocating from a memory range which is predefined within DT.

From the userspace point of view, why should there be one ABI to
allocate memory from a predefined range which is delivered by DT to
the kernel, and one ABI to allocate memory from a predefined range
which is mediated by TEE?

> >  What advantage
> > does userspace get from having to have a different codepath to get a
> > different handle to memory? What about x86?
> >
> > I think this proposal is looking at it from the wrong direction.
> > Instead of working upwards from the implementation to userspace, start
> > with userspace and work downwards. The interesting property to focus
> > on is allocating memory, not that EL1 is involved behind the scenes.
>
> From what I've gathered from earlier discussions, it wasn't much of a
> problem for userspace to handle this. If the kernel were to provide it
> via a different ABI, how would it be easier to implement in the
> kernel? I think we need an example to understand your suggestion.

It is a problem for userspace, because we need to expose acceptable
parameters for allocation through the entire stack. If you look at the
dmabuf documentation in the kernel for how buffers should be allocated
and exchanged, you can see the negotiation flow for modifiers. This
permeates through KMS, EGL, Vulkan, Wayland, GStreamer, and more.

Standardising on heaps allows us to add those in a similar way. If we
have to add different allocation mechanisms, then the complexity
increases, permeating not only into all the different userspace APIs,
but also into the drivers which need to support every different
allocation mechanism even if they have no opinion on it - e.g. Mali
doesn't care in any way whether the allocation comes from a heap or
TEE or ACPI or whatever, it cares only that the memory is protected.

Does that help?

Cheers,
Daniel
