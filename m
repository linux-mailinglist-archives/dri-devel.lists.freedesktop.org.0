Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB865B19F6
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 12:29:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B246F10EA72;
	Thu,  8 Sep 2022 10:29:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D730710EA8E
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Sep 2022 10:28:59 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id bt10so26978352lfb.1
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Sep 2022 03:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=o8Z4CAve5fqqekItJ5TFGp6h+pybclKENCYKBTuFmhk=;
 b=IwcoQSz3UBrwnTW+HJsc6p8YeZ3gsbEhZ9gow3OEDbwrZWKiJ4I0GZtV40U0N60tH4
 g6iWHb8C/2uMf1AUqLqniwMkuSC0UXtsyjPPUO/238y/DnuRIcMCTrvrKfwhjwFST81q
 WCI0Bzvb+68TiJRBY2P3TXTqKehNdv1cuRQVc31f7d3fT9OSHBmtRpeVNXKXm0itJAZu
 wzG2WwVEBIaPuN21x1nTMFmLsMU2yRjFNpKQrXZpj8F0G1aR0kF8N0JlrwbLQIchOG2S
 S0sKweHdVu2Py7n87UpmgLnbDYmywB/aBdtRTJ5Q/i0bugqSaUHWPVsvVuCK04qp4WPD
 t3Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=o8Z4CAve5fqqekItJ5TFGp6h+pybclKENCYKBTuFmhk=;
 b=vozf8336bPJPnhjhncbN6PaMTHUaunX6IU2mwQVnvwiawH9PbAjnVAGTQHj/W36zZU
 42PITmHYgA6BR7lADZeD62pwWxoS1+viI3I4m6XHpL+ld51+Ogf4yGZgJuIV+kELF8FH
 LaOhwIbPn2NOaYlu4Lz1kg5ngAAi3TXH8JnLEc1EAeo5OO5STrQ5bwiDHRBAj1lFMG03
 0Dl5IrrY9VQIHkHWGr/rlr/JTzGPAIYckZsFsmSllCAyiyBUxmEps9llIhSa06+6Npgd
 fKQqBZyCp/OeUFMhfqG6diEhq4yppkgs3Y/PR3fJmmSzjPMNTa4jDtdLj0H6t/9t3LJC
 LL0g==
X-Gm-Message-State: ACgBeo1m8TP+YagGjyrDGw2vtA+KQarPlAdF51kE+W18+Ls9HWSccOdt
 4z6Faf8pwjxmbsnXdLPwTPMpuU+zyd+a/UweJU2eBw==
X-Google-Smtp-Source: AA6agR5m51Ese4pRsiZ202uyHyguCnTFQK0dB89rjGUTjXVlu7AN+6Kz3Be2wVD4Zf8ywGIliea3qbme0TqsVaR8RrU=
X-Received: by 2002:a05:6512:3da5:b0:497:6082:98fd with SMTP id
 k37-20020a0565123da500b00497608298fdmr2328152lfv.109.1662632938143; Thu, 08
 Sep 2022 03:28:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220812143055.12938-1-olivier.masse@nxp.com>
 <CAFA6WYM89+SrW2Br-fnFke4djt4GgGHXn7JS3=rxvAa7dAAY7w@mail.gmail.com>
 <fb641c168a6b9fc041785a0baa8ee4b2d3ff8ed4.camel@nxp.com>
In-Reply-To: <fb641c168a6b9fc041785a0baa8ee4b2d3ff8ed4.camel@nxp.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Thu, 8 Sep 2022 15:58:47 +0530
Message-ID: <CAFA6WYM+G=MPonqPpfVXCgCAxuezUjFnm7gZ1x6ybHGrAtQp3g@mail.gmail.com>
Subject: Re: [EXT] Re: [PATCH v2 0/1] tee: Add tee_shm_register_fd
To: Olivier Masse <olivier.masse@nxp.com>
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
Cc: =?UTF-8?Q?Cl=C3=A9ment_Faure?= <clement.faure@nxp.com>,
 "op-tee@lists.trustedfirmware.org" <op-tee@lists.trustedfirmware.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "jens.wiklander@linaro.org" <jens.wiklander@linaro.org>,
 "etienne.carriere@linaro.org" <etienne.carriere@linaro.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 8 Sept 2022 at 14:48, Olivier Masse <olivier.masse@nxp.com> wrote:
>
> Hi Sumit
>
> On ven., 2022-08-19 at 13:54 +0530, Sumit Garg wrote:
> > Caution: EXT Email
> >
> > Hi Olivier,
> >
> > On Fri, 12 Aug 2022 at 20:01, Olivier Masse <olivier.masse@nxp.com>
> > wrote:
> > >
> > > Add a new ioctl called TEE_IOC_SHM_REGISTER_FD to register a
> > > shared memory from a dmabuf file descriptor.
> > > This new ioctl will allow the Linux Kernel to register a buffer
> > > to be used by the Secure Data Path OPTEE OS feature.
> > >
> > > Please find more information here:
> > >
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fstati=
c.linaro.org%2Fconnect%2Fsan19%2Fpresentations%2Fsan19-107.pdf&amp;data=3D0=
5%7C01%7Colivier.masse%40nxp.com%7C05071ff1c28044ab740908da81bc44e2%7C686ea=
1d3bc2b4c6fa92cd99c5c301635%7C0%7C1%7C637964942860947359%7CUnknown%7CTWFpbG=
Zsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C=
3000%7C%7C%7C&amp;sdata=3DnYLb2iMoJExdKEg4CL4eW5%2FQ%2Bqqj4Iw1TxFsd1UqWW0%3=
D&amp;reserved=3D0
> > >
> > > Patch tested on Hikey 6220.
> > >
> >
> > AFAIU, for the OP-TEE SDP feature to work you need to have a DMA-BUF
> > heap driver for allocating secure buffers through exposed chardev:
> > "/dev/dma_heap/sdp". Have you tested it with some out-of-tree driver
> > as I can't find it upstream? Also, do you plan to push that upstream
> > as well?
>
> It has been tested with linaro,secure-heap reserved dma heap memory
> which is also in review for upstream.

Can you provide the corresponding reference? Also, do keep OP-TEE ML
in CC if you send any new iteration for that patch.

-Sumit

>
> >
> > BTW, please add a changelog while sending newer patch-set versions.
> >
> > -Sumit
> >
> > > Etienne Carriere (1):
> > >   tee: new ioctl to a register tee_shm from a dmabuf file
> > > descriptor
> > >
> > >  drivers/tee/tee_core.c   | 38 +++++++++++++++
> > >  drivers/tee/tee_shm.c    | 99
> > > +++++++++++++++++++++++++++++++++++++++-
> > >  include/linux/tee_drv.h  | 11 +++++
> > >  include/uapi/linux/tee.h | 29 ++++++++++++
> > >  4 files changed, 175 insertions(+), 2 deletions(-)
> > >
> > > --
> > > 2.25.0
> > >
