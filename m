Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC10784FB9
	for <lists+dri-devel@lfdr.de>; Wed, 23 Aug 2023 06:46:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6383610E04F;
	Wed, 23 Aug 2023 04:46:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com
 [IPv6:2607:f8b0:4864:20::f2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E397410E04F
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Aug 2023 04:46:26 +0000 (UTC)
Received: by mail-qv1-xf2c.google.com with SMTP id
 6a1803df08f44-64f444fe7a7so11657166d6.0
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Aug 2023 21:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1692765985; x=1693370785;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pbuj0UaWEA761fCPdddWt+wikwDEFpkNLnzTAhHNiDs=;
 b=D/1uhAMBMMYSvv227R9QNsh9n0F41mPXzvZeQQctwcKB8Lkiwnuj6gAhnssR72xkha
 AyzyPJ4cLH0iU2vV/ZVZujGM2DWIr1L7+0LfPaMHMjomDakkBXtJVTjPwk6ZOPHGRf89
 QcGi8vkKxE1bmOAvTVOKADMlGbOw0rgfwOHD0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692765985; x=1693370785;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pbuj0UaWEA761fCPdddWt+wikwDEFpkNLnzTAhHNiDs=;
 b=YlweYs54TLrX6NlgAC6iIZt3I5uT4mYJzfFERvafVDQnxutIZSy9q2voq0/3ys2Ney
 U1bD18eZ65Y6PpN5inZSoVvywcB2vNnOgNph5Bn45Xv85rnh6sEJ9+4ppWD7h//ESoZv
 QeGasjdbaT2QO3vxLS+dCwVT3T93IdK+M0ZWabiluI7O1F+3SjPTGMCG0/NOdixZ0hAe
 z8OecoAdUoIOupcJDqSk9WimyDwxXMO4Anz0a4D9f72dkA2aObzEnhIyOt60XbbJ2Yah
 dxgVEfunk4UdvlxJCreFGpyrFsm3bnmfKLtt4acg7WeX6Le59GSANtjYsOposcicNnOg
 QaGg==
X-Gm-Message-State: AOJu0YzYu5FpDlFNQVsLvWDikcR8bLSUV5XUMJ51MLpt0KU4XAN2Ud8D
 Pf26pEvG6wqe0aSVFQG5muGiQyb4Yp/DyxqHqM0ldg==
X-Google-Smtp-Source: AGHT+IHe3o3EjgDs01VNschH9lHoDx0Oh44arZdbLtMJRzponGhvAJbECDJcjASwrIomL84BHrOChQ==
X-Received: by 2002:a05:6214:2686:b0:63f:8839:658 with SMTP id
 gm6-20020a056214268600b0063f88390658mr15140749qvb.1.1692765985315; 
 Tue, 22 Aug 2023 21:46:25 -0700 (PDT)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com.
 [209.85.222.180]) by smtp.gmail.com with ESMTPSA id
 x14-20020a0cb20e000000b0064d0fb1a8c5sm3215552qvd.98.2023.08.22.21.46.24
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Aug 2023 21:46:24 -0700 (PDT)
Received: by mail-qk1-f180.google.com with SMTP id
 af79cd13be357-76da1331db9so137396285a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Aug 2023 21:46:24 -0700 (PDT)
X-Received: by 2002:a05:6214:5493:b0:62d:f04b:b51 with SMTP id
 lg19-20020a056214549300b0062df04b0b51mr14567439qvb.29.1692765983989; Tue, 22
 Aug 2023 21:46:23 -0700 (PDT)
MIME-Version: 1.0
References: <029b982f-da62-4fa8-66c4-ab11a515574a@synaptics.com>
In-Reply-To: <029b982f-da62-4fa8-66c4-ab11a515574a@synaptics.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Wed, 23 Aug 2023 13:46:07 +0900
X-Gmail-Original-Message-ID: <CAAFQd5CqAvr7ZUdDSYPEOWSgvbttTBjHa0YWDomxJJSaiZxGog@mail.gmail.com>
Message-ID: <CAAFQd5CqAvr7ZUdDSYPEOWSgvbttTBjHa0YWDomxJJSaiZxGog@mail.gmail.com>
Subject: Re: [RFC]: shmem fd for non-DMA buffer sharing cross drivers
To: Hsia-Jun Li <Randy.Li@synaptics.com>
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
Cc: daniels@collabora.com, ayaka <ayaka@soulik.info>, hughd@google.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 akpm@linux-foundation.org,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Hsia-Jun,

On Tue, Aug 22, 2023 at 8:14=E2=80=AFPM Hsia-Jun Li <Randy.Li@synaptics.com=
> wrote:
>
> Hello
>
> I would like to introduce a usage of SHMEM slimier to DMA-buf, the major
> purpose of that is sharing metadata or just a pure container for cross
> drivers.
>
> We need to exchange some sort of metadata between drivers, likes dynamic
> HDR data between video4linux2 and DRM.

If the metadata isn't too big, would it be enough to just have the
kernel copy_from_user() to a kernel buffer in the ioctl code?

> Or the graphics frame buffer is
> too complex to be described with plain plane's DMA-buf fd.
> An issue between DRM and V4L2 is that DRM could only support 4 planes
> while it is 8 for V4L2. It would be pretty hard for DRM to expend its
> interface to support that 4 more planes which would lead to revision of
> many standard likes Vulkan, EGL.

Could you explain how a shmem buffer could be used to support frame
buffers with more than 4 planes?

>
> Also, there is no reason to consume a device's memory for the content
> that device can't read it, or wasting an entry of IOMMU for such data.

That's right, but DMA-buf doesn't really imply any of those. DMA-buf
is just a kernel object with some backing memory. It's up to the
allocator to decide how the backing memory is allocated and up to the
importer on whether it would be mapped into an IOMMU.

> Usually, such a metadata would be the value should be written to a
> hardware's registers, a 4KiB page would be 1024 items of 32 bits register=
s.
>
> Still, I have some problems with SHMEM:
> 1. I don't want thhe userspace modify the context of the SHMEM allocated
> by the kernel, is there a way to do so?

This is generally impossible without doing any of the two:
1) copying the contents to an internal buffer not accessible to the
userspace, OR
2) modifying any of the buffer mappings to read-only

2) can actually be more costly than 1) (depending on the architecture,
data size, etc.), so we shouldn't just discard the option of a simple
copy_from_user() in the ioctl.

> 2. Should I create a helper function for installing the SHMEM file as a f=
d?

We already have the udmabuf device [1] to turn a memfd into a DMA-buf,
so maybe that would be enough?

[1] https://elixir.bootlin.com/linux/v6.5-rc7/source/drivers/dma-buf/udmabu=
f.c

Best,
Tomasz

>
> --
> Hsia-Jun(Randy) Li
