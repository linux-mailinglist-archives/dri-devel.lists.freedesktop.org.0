Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C2D18AB3F9
	for <lists+dri-devel@lfdr.de>; Fri, 19 Apr 2024 18:58:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A162210FCFD;
	Fri, 19 Apr 2024 16:58:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fIDsAcuA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1914810FCF8
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Apr 2024 16:57:59 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id
 41be03b00d2f7-5d8b519e438so1756070a12.1
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Apr 2024 09:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713545879; x=1714150679; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=UVhdLoqOmP33JcxmAZZppMT40QvlL/I6MqHHmvjWVwA=;
 b=fIDsAcuAUjGGLUEGWrL8RjwP+M6cWhxLCR8TuhQh/0kIyQxBZUb4PzmsQ7Wuqu7Vli
 +kgAZxCqKDtN+DQvFMN4sGfqqUp7W2vRPb3NSed7TeFZ779OuQbOXxKaWQ+0VgLofi/W
 jnNxN4p2SnJ51WWIs5SsUuVZyw0gMAZYSGKGvlZm30haLZwFcz8TUXV2N75d8MOOwFnG
 FlTzEqRvoQaZ/HEKPLbcCQWYwj9zZOOpVFC5lH/gP0DQoWCVsa+ySKDABErWL3I6wIsa
 87r2x1V9I1vOV6qbtzFPbe4j1jnzgZvBWXWHzQ9FgHAbhAgfxQddvaA8Je+quL/p6KJc
 qEcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713545879; x=1714150679;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UVhdLoqOmP33JcxmAZZppMT40QvlL/I6MqHHmvjWVwA=;
 b=epiPpytdyS36En7v+La/rVk+9sXKmq83vNUDzh96lKgeTEIKnFmg9lq30BbDupBrM1
 vfz4Ondg92AZrtwiY0y8AzynWPenoUeEbsg+YFH4GL2goQg8q5Q4RHAVFfAFbJMDW+Z+
 GwJJeUN3KR2q/khiMARRcQup5Zt5ufgQAqHmVHP0gN6QylHXoE47PDRh9E9vN6NzTqkJ
 0pMYCXiCkMZr4ST2gEC9x/3VMdcdlbB3/ocjOro9NxwblvhVzw8E5gwEx0MWsP0EXwHC
 fbxG5Sw0x1pRq4ee2/1j4ZZKRJFCIHZxad1OvvC9Z6xyuNQzbINiMC9quLvLnuAQC71m
 0+Nw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1EKAZNoRm8ODHTg1nlBL2/ODEtpHNc8p4TXdDfcVa/rjNPs4+OhBNBWWoN5Upbt7pvT0NwXYP3UQmeGMIUh/9s6yjxWYay96YWax0ZbfX
X-Gm-Message-State: AOJu0Yz52HL+8T+XeuYy/rr/6B7YhDohcn85Pwe+PXzUBOCBx5C+YQul
 nB5Xzy5+H6/UJKrcyPvQtUQ96aF7+m+7Kh/xywX87UerXiLyiSGqB0XE8cihDCqkJtAQiGHF78r
 NgJwwuF4FbX0I8nqJImnh5J1sTe8=
X-Google-Smtp-Source: AGHT+IGd2q8SP9g4kc04Aop9W0vIGu3rv607Ws+SBDlsjApM9U32JwLK736Znh95YUtvArDUHHvirc9PKw/9X7r6Yj4=
X-Received: by 2002:a17:90a:5d04:b0:2a0:4c3b:2c39 with SMTP id
 s4-20020a17090a5d0400b002a04c3b2c39mr3379824pji.23.1713545879215; Fri, 19 Apr
 2024 09:57:59 -0700 (PDT)
MIME-Version: 1.0
References: <20240409120605.4138472-1-Pascal.FONTAIN@bachmann.info>
 <20240409120605.4138472-3-Pascal.FONTAIN@bachmann.info>
 <2024040944-flashcard-tribune-6a8e@gregkh>
In-Reply-To: <2024040944-flashcard-tribune-6a8e@gregkh>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Fri, 19 Apr 2024 18:57:47 +0200
Message-ID: <CAH9NwWezn1A=n9_NqY_Lp9VzYwzAd0dAjQPD9wBB3_ragddZWg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] misc: sram: Add DMA-BUF Heap exporting of SRAM
 areas
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Pascal FONTAIN <Pascal.FONTAIN@bachmann.info>, linux-kernel@vger.kernel.org,
 Derek Kiernan <derek.kiernan@amd.com>, Dragan Cvetic <dragan.cvetic@amd.com>, 
 Arnd Bergmann <arnd@arndb.de>, Sumit Semwal <sumit.semwal@linaro.org>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, afd@ti.com, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org
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

Am Di., 9. Apr. 2024 um 14:14 Uhr schrieb Greg Kroah-Hartman
<gregkh@linuxfoundation.org>:
>
> On Tue, Apr 09, 2024 at 02:06:05PM +0200, Pascal FONTAIN wrote:
> > From: Andrew Davis <afd@ti.com>
> >
> > This new export type exposes to userspace the SRAM area as a DMA-BUF
> > Heap,
> > this allows for allocations of DMA-BUFs that can be consumed by various
> > DMA-BUF supporting devices.
> >
> > Signed-off-by: Andrew Davis <afd@ti.com>
> > Tested-by: Pascal Fontain <pascal.fontain@bachmann.info>
>
> When sending on a patch from someone else, you too must sign off on it
> as per our documenation.  Please read it and understand what you are
> agreeing to when you do that for a new version please.
>
> > ---
> >  drivers/misc/Kconfig         |   7 +
> >  drivers/misc/Makefile        |   1 +
> >  drivers/misc/sram-dma-heap.c | 246 +++++++++++++++++++++++++++++++++++
> >  drivers/misc/sram.c          |   6 +
> >  drivers/misc/sram.h          |  16 +++
> >  5 files changed, 276 insertions(+)
> >  create mode 100644 drivers/misc/sram-dma-heap.c
> >
> > diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
> > index 9e4ad4d61f06..e6674e913168 100644
> > --- a/drivers/misc/Kconfig
> > +++ b/drivers/misc/Kconfig
> > @@ -448,6 +448,13 @@ config SRAM
> >  config SRAM_EXEC
> >       bool
> >
> > +config SRAM_DMA_HEAP
> > +     bool "Export on-chip SRAM pools using DMA-Heaps"
> > +     depends on DMABUF_HEAPS && SRAM
> > +     help
> > +       This driver allows the export of on-chip SRAM marked as both pool
> > +       and exportable to userspace using the DMA-Heaps interface.
>
> What will use this in userspace?
>

I could imagine a way it might be used.

Imagine a SoC like TI's AM64x series, where some cores (A53) run Linux
and others (R5F) are managed by remoteproc to
execute a RTOS. When it comes to efficiently exchanging large data
sets, the conventional method involves using rpmsg,
which has limitations due to message size and could potentially slow
down data transfer. However, an alternative
approach could be to allocate a sizable chunk of SRAM memory in
userspace. By utilizing memcpy() to copy data into
this memory, followed by a single rpmsg signal to notify the RTOS that
the data is ready, we can leverage the faster access
speed of SRAM compared to DDR from the remoteproc.

-- 
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
