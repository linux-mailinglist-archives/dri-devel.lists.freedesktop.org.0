Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47DE35B19EA
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 12:26:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F08A910E9A8;
	Thu,  8 Sep 2022 10:26:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC80410E9A8
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Sep 2022 10:26:15 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id l12so10890567ljg.9
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Sep 2022 03:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=7zHmF7fV9+CSAN0NLZlR4YsL2QCd2uL4OzOpXBOMvMs=;
 b=Updcj/5C3zcysfgCd+XVSKzzlMDbyhzK9KV7VA96nw7o6Aiq7w/f6Rreuf4t+ru6Ia
 XO+EzWUB7W7bZkjzNvd5TPNumCOUW62pJeFae/RT0JfZ/BWDywBeuSuLlZkuIsKR1Pwm
 d4a4Lv4ZDEL5fi0jHtYo48baOvLY9PUg1De+IXOTIkkn5XGYeNN8b6M/2ztvVLYhYZc1
 AECew7rZxgj4NzTaXGLk4iVuGwxcSXlWVPABmSd8xaPB7p2RO85yNvQsIIvlgvKgxdlf
 qWZM75W5ERmzTblB28p3YXmF242iZ0Ud02IP837dPVV8UHmxhGYuR58YPXhqkIftwMpP
 5LlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=7zHmF7fV9+CSAN0NLZlR4YsL2QCd2uL4OzOpXBOMvMs=;
 b=1gsPof3ZnE4l+1pk09k6bHQKjWaUECxoOr4ZqHARoa0jxTGuOhKyk1m3pCKIkncafp
 TGsCYub5WrWRUI7HLFFei19JKGlW1VTyJlDVJPL9MXDBv9oBd26PtRJf9sFYFHTAyMV1
 hELHozeMx/Rj5SjLBGdBKLwHF/JlYckHU6TiOwaC2SJ+sjGxyyZgetBHxdiMGalL0AM4
 7CaEco3TvzQVZeFKdjggF0lc1KYWsZaj9vRuLqS3wCibSIn5I3G6UNVs8/oYQ/l12Ee+
 m5l+5wbGooSt8C+Z3/HRDZl0F1TQaeq8b7ZaNxYZPJ5SpLIGvbiDymZ8L7tCl7Qgc1TX
 DL/A==
X-Gm-Message-State: ACgBeo1DDvD5WrApNHWBPL2nfgXM1wNm96Jtk0GONiaHBXf2FyC9spWW
 EsNrd/VlPkcnGbQtNMq9RFwt2jLPKZmzKsFfPmrf7A==
X-Google-Smtp-Source: AA6agR5d+wwCPsH/ETCPRquWaPRFMuEHcU81Q+wmC6wIdZFu96tqD4jYmOC7FgcjqLpochaAtlr2pT1hUtYbk0+6Eas=
X-Received: by 2002:a2e:9799:0:b0:26b:dd3c:7080 with SMTP id
 y25-20020a2e9799000000b0026bdd3c7080mr255822lji.297.1662632773944; Thu, 08
 Sep 2022 03:26:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220812143055.12938-1-olivier.masse@nxp.com>
 <CAFA6WYM89+SrW2Br-fnFke4djt4GgGHXn7JS3=rxvAa7dAAY7w@mail.gmail.com>
 <YxemmVxh5F0fXEPJ@phenom.ffwll.local>
In-Reply-To: <YxemmVxh5F0fXEPJ@phenom.ffwll.local>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Thu, 8 Sep 2022 15:56:02 +0530
Message-ID: <CAFA6WYMstaxeGVcuEKF68Bo9ZFSvQCaJfiC59Bv2q6LDCD3JDQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/1] tee: Add tee_shm_register_fd
To: daniel@ffwll.ch
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
Cc: clement.faure@nxp.com, christian.koenig@amd.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 sumit.semwal@linaro.org, linaro-mm-sig@lists.linaro.org,
 op-tee@lists.trustedfirmware.org, Olivier Masse <olivier.masse@nxp.com>,
 etienne.carriere@linaro.org, jens.wiklander@linaro.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

On Wed, 7 Sept 2022 at 01:29, Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Fri, Aug 19, 2022 at 01:54:31PM +0530, Sumit Garg wrote:
> > Hi Olivier,
> >
> > On Fri, 12 Aug 2022 at 20:01, Olivier Masse <olivier.masse@nxp.com> wrote:
> > >
> > > Add a new ioctl called TEE_IOC_SHM_REGISTER_FD to register a
> > > shared memory from a dmabuf file descriptor.
> > > This new ioctl will allow the Linux Kernel to register a buffer
> > > to be used by the Secure Data Path OPTEE OS feature.
> > >
> > > Please find more information here:
> > > https://static.linaro.org/connect/san19/presentations/san19-107.pdf
> > >
> > > Patch tested on Hikey 6220.
> > >
> >
> > AFAIU, for the OP-TEE SDP feature to work you need to have a DMA-BUF
> > heap driver for allocating secure buffers through exposed chardev:
> > "/dev/dma_heap/sdp". Have you tested it with some out-of-tree driver
> > as I can't find it upstream? Also, do you plan to push that upstream
> > as well?
> >
> > BTW, please add a changelog while sending newer patch-set versions.
>
> Also after the huge discussion last year dma-buf are agreed to be under
> the "you need an open source userspace for any new uapi using them" rule
> that all gpu drivers are under.
>
> Does this exist here?

There is already an open source userspace test application using it
here [1] [2] demonstrating its use-case. I think that should be
sufficient.

[1] https://github.com/OP-TEE/optee_test/blob/master/host/xtest/sdp_basic.c
[2] https://github.com/OP-TEE/optee_test/blob/master/host/xtest/sdp_basic.h

-Sumit

> -Daniel
>
> >
> > -Sumit
> >
> > > Etienne Carriere (1):
> > >   tee: new ioctl to a register tee_shm from a dmabuf file descriptor
> > >
> > >  drivers/tee/tee_core.c   | 38 +++++++++++++++
> > >  drivers/tee/tee_shm.c    | 99 +++++++++++++++++++++++++++++++++++++++-
> > >  include/linux/tee_drv.h  | 11 +++++
> > >  include/uapi/linux/tee.h | 29 ++++++++++++
> > >  4 files changed, 175 insertions(+), 2 deletions(-)
> > >
> > > --
> > > 2.25.0
> > >
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
