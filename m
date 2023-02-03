Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D27689821
	for <lists+dri-devel@lfdr.de>; Fri,  3 Feb 2023 12:52:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 260AB10E771;
	Fri,  3 Feb 2023 11:52:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x92a.google.com (mail-ua1-x92a.google.com
 [IPv6:2607:f8b0:4864:20::92a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99E8E10E771
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Feb 2023 11:52:29 +0000 (UTC)
Received: by mail-ua1-x92a.google.com with SMTP id j21so915593uap.5
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Feb 2023 03:52:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZpzVwlq8baNl6ZH97vURb66cFPTVgwAOhkQcEJQQw80=;
 b=k0JINYd7gST81UPzqhfe9dYr7F3U8lZfpRv+34L5rsHc6k30R8Pyt4FBvwDbjmwrRn
 owtzbjG48/wP24M4GqbI7s/VlRzcp84Ovah+dsLNT7Aqyqj62mVY8JKFacFcJXYYf9zR
 Ex2QW6ICxBDe7VYwA634bFlw8TZ2FS/PSFbLLkjeFM6SzhLPw6535CvqcvBTX2QXvcC2
 IndYO0M8/kK5dFCsnoUoJVU+e+79dc7ZGel/rrMOb71gbLd7yCMotKmetXGY19XecJeX
 UrsqJhbPjDbwefLkxMk2BWgePkMx2DCQDNjBJaKmdxdtJf3XJ7fAEyJe5l+byvllzwOf
 aEuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZpzVwlq8baNl6ZH97vURb66cFPTVgwAOhkQcEJQQw80=;
 b=5PDqwbezz49U+FvTiS3lrBehZ9NxmSVEJRge8pWSVmwn5rZOlJaAfqQ1omKanswsuf
 qoMqEELDJ2ZbKV1r8z5ZWlcH/JiGb+A04PCYq+iwbZxUDcGfQcyqSn2WzLPPKd45s4to
 qPj73WXIP3jAexy2GRla5TXEnrc8FeKscvJ/vv074b/j+t2MBADdehaNfdzSOiJL0hgZ
 JBoz+w+61Mb30/0o3IHknLhIAby5Y06KY06NEFFTwjgFzlkQ8NUQ7euNIRJJd0vKk+g6
 ljKA+GxB16HKTzkU07V99OlOHv5P9h3MYHVDdnB9izGJ7oG4tsw1+D1TexWgC3qz8nyG
 j6wg==
X-Gm-Message-State: AO0yUKWRtp19WguzwXD7prB5ml+BJCwDkGcRoyQ6s59J5YOOa6n4v6Pe
 82KUcOedl+S4fdIYt7mqJXDjGFJorumC19jwXv+I7A==
X-Google-Smtp-Source: AK7set+PnLEjMteCRsI/cC38YUUuajQrz3prxLqGHOFVgrksf3jgyv6qZlJM+yOk1v/yc6QJEiWWIAfifgnEm/72V4Y=
X-Received: by 2002:ab0:3903:0:b0:631:641a:ed3b with SMTP id
 b3-20020ab03903000000b00631641aed3bmr1530213uaw.13.1675425148524; Fri, 03 Feb
 2023 03:52:28 -0800 (PST)
MIME-Version: 1.0
References: <20220812143055.12938-1-olivier.masse@nxp.com>
 <20220812143055.12938-2-olivier.masse@nxp.com>
 <30534fadb8172088eddef46ae71d87c167cbf32e.camel@nxp.com>
 <CAFA6WYOMCswgHHxsgc9Hgi7rmTPaZDqce=BixvYoFTfL0bTFDQ@mail.gmail.com>
 <PA4PR04MB75204E8D2B959893A04D55F388D69@PA4PR04MB7520.eurprd04.prod.outlook.com>
 <CAFA6WYPGT8xZnB1idcxcHT1bvM=0kwFssBQbn063-qg=czM-ZQ@mail.gmail.com>
 <CAN5uoS8XgvAKVwKHx-uOe3hAa4Jrd5FJt6xNOG5s-simkRND9w@mail.gmail.com>
 <c86d1a46af6e076038b3f0c2dd68213ff1e8b254.camel@nxp.com>
In-Reply-To: <c86d1a46af6e076038b3f0c2dd68213ff1e8b254.camel@nxp.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Fri, 3 Feb 2023 17:22:17 +0530
Message-ID: <CAFA6WYMtDkRdqLW=k8hFisQFTqBic59NHufxLDywPkF9d_TNPw@mail.gmail.com>
Subject: Re: [EXT] Re: [PATCH v2 1/1] tee: new ioctl to a register tee_shm
 from a dmabuf file descriptor
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
Cc: Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Cl=C3=A9ment_Faure?= <clement.faure@nxp.com>,
 "fredgc@google.com" <fredgc@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "afd@ti.com" <afd@ti.com>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "op-tee@lists.trustedfirmware.org" <op-tee@lists.trustedfirmware.org>,
 Cyrille Fleury <cyrille.fleury@nxp.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "joakim.bech@linaro.org" <joakim.bech@linaro.org>,
 "etienne.carriere@linaro.org" <etienne.carriere@linaro.org>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "jens.wiklander@linaro.org" <jens.wiklander@linaro.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 3 Feb 2023 at 16:31, Olivier Masse <olivier.masse@nxp.com> wrote:
>
> On jeu., 2023-02-02 at 10:58 +0100, Etienne Carriere wrote:
> > Caution: EXT Email
> >
> > On Thu, 2 Feb 2023 at 09:35, Sumit Garg <sumit.garg@linaro.org>
> > wrote:
> > > Hi Cyrille,
> > >
> > > Please don't top post as it makes it harder to follow-up.
> > >
> > > On Thu, 2 Feb 2023 at 13:26, Cyrille Fleury <cyrille.fleury@nxp.com
> > > > wrote:
> > > > Hi Sumit, all
> > > >
> > > > Upstream OP-TEE should support registering a dmabuf since a
> > > > while, given how widely dmabuf is used in Linux for passing
> > > > buffers around between devices.
> > > >
> > > > Purpose of the new register_tee_shm ioctl is to allow OPTEE to
> > > > use memory allocated from the exiting linux dma buffer. We don't
> > > > need to have secure dma-heap up streamed.
> > > >
> > > > You mentioned secure dma-buffer, but secure dma-buffer is a dma-
> > > > buffer, so the work to be done for secure or "regular" dma
> > > > buffers by the register_tee_shm ioctl is 100% the same.
> > > >
> > > > The scope of this ioctl is limited to what existing upstream dma-
> > > > buffers are:
> > > >         -> sharing buffers for hardware (DMA) access across
> > > > multiple device drivers and subsystems, and for synchronizing
> > > > asynchronous hardware access.
> > > >        -> It means continuous memory only.
> > > >
> > > > So if we reduce the scope of register tee_shm to exiting dma-
> > > > buffer area, the current patch does the job.
> > >
> > > Do you have a corresponding real world use-case supported by
> > > upstream
> > > OP-TEE? AFAIK, the Secure Data Path (SDP) use-case is the one
> > > supported in OP-TEE upstream but without secure dmabuf heap [1]
> > > available, the new ioctl can't be exercised.
> > >
> > > [1]
> > > https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fg=
ithub.com%2FOP-TEE%2Foptee_test%2Fblob%2Fmaster%2Fhost%2Fxtest%2Fsdp_basic.=
h%23L15&data=3D05%7C01%7Colivier.masse%40nxp.com%7Ca27f690d9d7244c2bcff08db=
05040f11%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C638109287211847995%7C=
Unknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiL=
CJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DeNUbc0uaKjfmxau8L7ZB8u%2BtYdUxT4pIS%2=
Fht29uwRKg%3D&reserved=3D0
> >
> > OP-TEE has some SDP test taht can exercice SDP: 'xtest
> > regression_1014'.
> > https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgit=
hub.com%2FOP-TEE%2Foptee_test%2Fblob%2F3.20.0%2Fhost%2Fxtest%2Fregression_1=
000.c%23L1256&data=3D05%7C01%7Colivier.masse%40nxp.com%7Ca27f690d9d7244c2bc=
ff08db05040f11%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C638109287211847=
995%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1=
haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3D%2BOtAlVOq7%2Fi6SloSTZuwa5VtlC5=
RqtcJ4fGtio0YI8A%3D&reserved=3D0
> >
> > The test relies on old staged ION + local secure dmabuf heaps no more
> > maintained, so this test is currently not functional.
> > If we upgrade the test to mainline dmabuf alloc means, and apply the
> > change discussed here, we should be able to regularly test SDP in
> > OP-TEE project CI.
> > The part to update is the userland allocation of the dmabuf:
> > https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgit=
hub.com%2FOP-TEE%2Foptee_test%2Fblob%2F3.20.0%2Fhost%2Fxtest%2Fsdp_basic.c%=
23L91&data=3D05%7C01%7Colivier.masse%40nxp.com%7Ca27f690d9d7244c2bcff08db05=
040f11%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C638109287211847995%7CUn=
known%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJ=
XVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DK2NB2Bj7V3CXNsM9fZy95OEjF3EzqU4mgmM1PTY=
3J1Y%3D&reserved=3D0
> >
> >
>
> the test was already updated to support secure dma heap with Kernel
> version 5.11 and higher. the userland allocation could be find here:
> https://github.com/OP-TEE/optee_test/blob/3.20.0/host/xtest/sdp_basic.c#L=
153
>
> This upgrade need a Linux dma-buf patch:
> https://lore.kernel.org/all/20220805154139.2qkqxwklufjpsfdx@000377403353/=
T/
>

I would suggest you to club this new ioctl patch with this secure
dmabuf heap series so that you can provide a complete SDP use-case
picture with a working SDP xtest case.

-Sumit

>
> > br,
> > etienne
> >
> >
> > > -Sumit
> > >
> > > > Regards.
> > > >
> > > > -----Original Message-----
> > > > From: Sumit Garg <sumit.garg@linaro.org>
> > > > Sent: Wednesday, February 1, 2023 6:34 AM
> > > > To: Olivier Masse <olivier.masse@nxp.com>
> > > > Cc: fredgc@google.com; linux-media@vger.kernel.org;
> > > > linaro-mm-sig@lists.linaro.org; afd@ti.com;
> > > > op-tee@lists.trustedfirmware.org; jens.wiklander@linaro.org;
> > > > joakim.bech@linaro.org; sumit.semwal@linaro.org; Peter Griffin <
> > > > peter.griffin@linaro.org>; linux-kernel@vger.kernel.org;
> > > > etienne.carriere@linaro.org; dri-devel@lists.freedesktop.org;
> > > > christian.koenig@amd.com; Cl=C3=A9ment Faure <clement.faure@nxp.com=
>;
> > > > Cyrille Fleury <cyrille.fleury@nxp.com>
> > > > Subject: [EXT] Re: [PATCH v2 1/1] tee: new ioctl to a register
> > > > tee_shm from a dmabuf file descriptor
> > > >
> > > > Caution: EXT Email
> > > >
> > > > Hi Olivier,
> > > >
> > > > On Fri, 27 Jan 2023 at 16:24, Olivier Masse <
> > > > olivier.masse@nxp.com> wrote:
> > > > > Hi Joakim,
> > > > > Hi Etienne,
> > > > >
> > > > > Let me bring back this pull request for OPTEE Linux driver.
> > > > >
> > > > > Last feedback was from Christian K=C3=B6nig and Sumit Garg.
> > > > > From Christian:
> > > > > > Just two comments:
> > > > > >
> > > > > > 1. Dmitry is working on a change which renames some functions
> > > > > > and
> > > > > > makes it mandatory to call them with the dma_resv lock held.
> > > > > >
> > > > > > Depending on how you want to upstream this change you will
> > > > > > certainly
> > > > > > run into conflicts with that.
> > > > >
> > > > > Is there any update on these changes ?
> > > > >
> > > > > > 2. Would it be possible to do this dynamically? In other
> > > > > > words does
> > > > > > the tee driver has a concept of buffers moving around?
> > > > >
> > > > > We do not support dynamic secure memory heap.
> > > > >
> > > > > From Sumit:
> > > > > > What limits you to extend this feature to non-contiguous
> > > > > > memory
> > > > > > buffers? I believe that should be possible with OP-TEE
> > > > > > dynamic
> > > > > > shared memory which gives you the granularity to register a
> > > > > > list of pages.
> > > > >
> > > > > Our solution use a fixed protected reserved memory region and
> > > > > do not
> > > > > rely on a dynamic protection managed in secure.
> > > > >
> > > > > The scope of this implementation rely on a static memory region
> > > > > handled by a specific DMA Heap type.
> > > > >
> > > >
> > > > AFAIR, the last review for v2 is here [1]. So we need to have
> > > > this secure DMA heap upstream in order for ioctl added by this
> > > > patch to be usable.
> > > >
> > > > [1]
> > > > https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2=
Flists.trustedfirmware.org%2Farchives%2Flist%2Fop-tee%40lists.trustedfirmwa=
re.org%2Fmessage%2FM3WLO7RNG22OR4744BY6XNG2GLIYMNHN%2F&data=3D05%7C01%7Coli=
vier.masse%40nxp.com%7Ca27f690d9d7244c2bcff08db05040f11%7C686ea1d3bc2b4c6fa=
92cd99c5c301635%7C0%7C0%7C638109287211847995%7CUnknown%7CTWFpbGZsb3d8eyJWIj=
oiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7=
C&sdata=3D3ur7F71QnW6r15GdYR2e2YyoZLTONtTQvLHigH3uJsk%3D&reserved=3D0
> > > >
> > > > -Sumit
> > > >
> > > > > Best regards,
> > > > > Olivier MASSE
> > > > >
> > > > >
> > > > > On ven., 2022-08-12 at 16:30 +0200, Olivier Masse wrote:
> > > > > > From: Etienne Carriere <etienne.carriere@linaro.org>
> > > > > >
> > > > > > This change allows userland to create a tee_shm object that
> > > > > > refers
> > > > > > to a dmabuf reference.
> > > > > >
> > > > > > Userland provides a dmabuf file descriptor as buffer
> > > > > > reference.
> > > > > > The created tee_shm object exported as a brand new dmabuf
> > > > > > reference
> > > > > > used to provide a clean fd to userland. Userland shall closed
> > > > > > this
> > > > > > new fd to release the tee_shm object resources. The initial
> > > > > > dmabuf
> > > > > > resources are tracked independently through original dmabuf
> > > > > > file
> > > > > > descriptor.
> > > > > >
> > > > > > Once the buffer is registered and until it is released, TEE
> > > > > > driver
> > > > > > keeps a refcount on the registered dmabuf structure.
> > > > > >
> > > > > > This change only support dmabuf references that relates to
> > > > > > physically contiguous memory buffers.
> > > > > >
> > > > > > New tee_shm flag to identify tee_shm objects built from a
> > > > > > registered
> > > > > > dmabuf: TEE_SHM_EXT_DMA_BUF. Such tee_shm structures are
> > > > > > flagged
> > > > > > with TEE_SHM_EXT_DMA_BUF.
> > > > > >
> > > > > > Co-Developed-by: Etienne Carriere <
> > > > > > etienne.carriere@linaro.org>
> > > > > > Signed-off-by: Olivier Masse <olivier.masse@nxp.com>
> > > > > > Reported-by: kernel test robot <lkp@intel.com>
> > > > > > From:
> > > > > > https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%=
2F%2Fgi%2F&data=3D05%7C01%7Colivier.masse%40nxp.com%7Ca27f690d9d7244c2bcff0=
8db05040f11%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C638109287211847995=
%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haW=
wiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3D7LNWTr4TWQoB0OLqasXT05o%2BUkodxsOq=
pcUcvoeiZ74%3D&reserved=3D0
> > > > > > thub.com%2Flinaro-
> > > > > > swg%2Flinux.git&data=3D05%7C01%7Ccyrille.fleury%40nx
> > > > > > p.com%7Cb24461a4e7284314dff408db0415f23e%7C686ea1d3bc2b4c6fa9
> > > > > > 2cd99c5
> > > > > > c301635%7C0%7C0%7C638108264533221384%7CUnknown%7CTWFpbGZsb3d8
> > > > > > eyJWIjo
> > > > > > iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7
> > > > > > C3000%7
> > > > > > C%7C%7C&sdata=3D8jbFPaF%2B5JBed4Uvo1hsJiB%2BP71KUgJmnW%2BIi3zLf
> > > > > > ok%3D&r
> > > > > > eserved=3D0 (cherry picked from commit
> > > > > > 41e21e5c405530590dc2dd10b2a8dbe64589840f)
> > > > > > ---
> > > > > >  drivers/tee/tee_core.c   | 38 +++++++++++++++
> > > > > >  drivers/tee/tee_shm.c    | 99
> > > > > > +++++++++++++++++++++++++++++++++++++++-
> > > > > >  include/linux/tee_drv.h  | 11
> > > > > > +++++  include/uapi/linux/tee.h | 29
> > > > > > ++++++++++++
> > > > > >  4 files changed, 175 insertions(+), 2 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
> > > > > > index
> > > > > > 8aa1a4836b92..7c45cbf85eb9 100644
> > > > > > --- a/drivers/tee/tee_core.c
> > > > > > +++ b/drivers/tee/tee_core.c
> > > > > > @@ -355,6 +355,42 @@ tee_ioctl_shm_register(struct
> > > > > > tee_context *ctx,
> > > > > >       return ret;
> > > > > >  }
> > > > > >
> > > > > > +static int tee_ioctl_shm_register_fd(struct tee_context
> > > > > > *ctx,
> > > > > > +                                  struct
> > > > > > tee_ioctl_shm_register_fd_data __user *udata)
> > > > > > +{
> > > > > > +     struct tee_ioctl_shm_register_fd_data data;
> > > > > > +     struct tee_shm *shm;
> > > > > > +     long ret;
> > > > > > +
> > > > > > +     if (copy_from_user(&data, udata, sizeof(data)))
> > > > > > +             return -EFAULT;
> > > > > > +
> > > > > > +     /* Currently no input flags are supported */
> > > > > > +     if (data.flags)
> > > > > > +             return -EINVAL;
> > > > > > +
> > > > > > +     shm =3D tee_shm_register_fd(ctx, data.fd);
> > > > > > +     if (IS_ERR(shm))
> > > > > > +             return -EINVAL;
> > > > > > +
> > > > > > +     data.id =3D shm->id;
> > > > > > +     data.flags =3D shm->flags;
> > > > > > +     data.size =3D shm->size;
> > > > > > +
> > > > > > +     if (copy_to_user(udata, &data, sizeof(data)))
> > > > > > +             ret =3D -EFAULT;
> > > > > > +     else
> > > > > > +             ret =3D tee_shm_get_fd(shm);
> > > > > > +
> > > > > > +     /*
> > > > > > +      * When user space closes the file descriptor the
> > > > > > shared memory
> > > > > > +      * should be freed or if tee_shm_get_fd() failed then
> > > > > > it will
> > > > > > +      * be freed immediately.
> > > > > > +      */
> > > > > > +     tee_shm_put(shm);
> > > > > > +     return ret;
> > > > > > +}
> > > > > > +
> > > > > >  static int params_from_user(struct tee_context *ctx, struct
> > > > > > tee_param *params,
> > > > > >                           size_t num_params,
> > > > > >                           struct tee_ioctl_param __user
> > > > > > *uparams) @@
> > > > > > -829,6 +865,8 @@ static long tee_ioctl(struct file *filp,
> > > > > > unsigned
> > > > > > int cmd, unsigned long arg)
> > > > > >               return tee_ioctl_shm_alloc(ctx, uarg);
> > > > > >       case TEE_IOC_SHM_REGISTER:
> > > > > >               return tee_ioctl_shm_register(ctx, uarg);
> > > > > > +     case TEE_IOC_SHM_REGISTER_FD:
> > > > > > +             return tee_ioctl_shm_register_fd(ctx, uarg);
> > > > > >       case TEE_IOC_OPEN_SESSION:
> > > > > >               return tee_ioctl_open_session(ctx, uarg);
> > > > > >       case TEE_IOC_INVOKE:
> > > > > > diff --git a/drivers/tee/tee_shm.c b/drivers/tee/tee_shm.c
> > > > > > index
> > > > > > 836872467dc6..55a3fbbb022e 100644
> > > > > > --- a/drivers/tee/tee_shm.c
> > > > > > +++ b/drivers/tee/tee_shm.c
> > > > > > @@ -4,6 +4,7 @@
> > > > > >   */
> > > > > >  #include <linux/anon_inodes.h>
> > > > > >  #include <linux/device.h>
> > > > > > +#include <linux/dma-buf.h>
> > > > > >  #include <linux/idr.h>
> > > > > >  #include <linux/mm.h>
> > > > > >  #include <linux/sched.h>
> > > > > > @@ -12,6 +13,14 @@
> > > > > >  #include <linux/uio.h>
> > > > > >  #include "tee_private.h"
> > > > > >
> > > > > > +/* extra references appended to shm object for registered
> > > > > > shared
> > > > > > memory */
> > > > > > +struct tee_shm_dmabuf_ref {
> > > > > > +     struct tee_shm shm;
> > > > > > +     struct dma_buf *dmabuf;
> > > > > > +     struct dma_buf_attachment *attach;
> > > > > > +     struct sg_table *sgt;
> > > > > > +};
> > > > > > +
> > > > > >  static void shm_put_kernel_pages(struct page **pages, size_t
> > > > > > page_count)
> > > > > >  {
> > > > > >       size_t n;
> > > > > > @@ -71,7 +80,16 @@ static void
> > > > > > release_registered_pages(struct
> > > > > > tee_shm *shm)
> > > > > >
> > > > > >  static void tee_shm_release(struct tee_device *teedev,
> > > > > > struct
> > > > > > tee_shm *shm)  {
> > > > > > -     if (shm->flags & TEE_SHM_POOL) {
> > > > > > +     if (shm->flags & TEE_SHM_EXT_DMA_BUF) {
> > > > > > +             struct tee_shm_dmabuf_ref *ref;
> > > > > > +
> > > > > > +             ref =3D container_of(shm, struct
> > > > > > tee_shm_dmabuf_ref,
> > > > > > shm);
> > > > > > +             dma_buf_unmap_attachment(ref->attach, ref->sgt,
> > > > > > +                                      DMA_BIDIRECTIONAL);
> > > > > > +
> > > > > > +             dma_buf_detach(ref->dmabuf, ref->attach);
> > > > > > +             dma_buf_put(ref->dmabuf);
> > > > > > +     } else if (shm->flags & TEE_SHM_POOL) {
> > > > > >               teedev->pool->ops->free(teedev->pool, shm);
> > > > > >       } else if (shm->flags & TEE_SHM_DYNAMIC) {
> > > > > >               int rc =3D teedev->desc->ops->shm_unregister(shm-
> > > > > > >ctx,
> > > > > > shm);
> > > > > > @@ -195,7 +213,7 @@ struct tee_shm
> > > > > > *tee_shm_alloc_user_buf(struct
> > > > > > tee_context *ctx, size_t size)
> > > > > >   * tee_client_invoke_func(). The memory allocated is later
> > > > > > freed
> > > > > > with a
> > > > > >   * call to tee_shm_free().
> > > > > >   *
> > > > > > - * @returns a pointer to 'struct tee_shm'
> > > > > > + * @returns a pointer to 'struct tee_shm' on success, and
> > > > > > ERR_PTR
> > > > > > + on
> > > > > > failure
> > > > > >   */
> > > > > >  struct tee_shm *tee_shm_alloc_kernel_buf(struct tee_context
> > > > > > *ctx,
> > > > > > size_t size)  { @@ -229,6 +247,83 @@ struct tee_shm
> > > > > > *tee_shm_alloc_priv_buf(struct tee_context *ctx, size_t
> > > > > > size)  }
> > > > > > EXPORT_SYMBOL_GPL(tee_shm_alloc_priv_buf);
> > > > > >
> > > > > > +struct tee_shm *tee_shm_register_fd(struct tee_context *ctx,
> > > > > > int
> > > > > > +fd) {
> > > > > > +     struct tee_shm_dmabuf_ref *ref;
> > > > > > +     int rc;
> > > > > > +
> > > > > > +     if (!tee_device_get(ctx->teedev))
> > > > > > +             return ERR_PTR(-EINVAL);
> > > > > > +
> > > > > > +     teedev_ctx_get(ctx);
> > > > > > +
> > > > > > +     ref =3D kzalloc(sizeof(*ref), GFP_KERNEL);
> > > > > > +     if (!ref) {
> > > > > > +             rc =3D -ENOMEM;
> > > > > > +             goto err_put_tee;
> > > > > > +     }
> > > > > > +
> > > > > > +     refcount_set(&ref->shm.refcount, 1);
> > > > > > +     ref->shm.ctx =3D ctx;
> > > > > > +     ref->shm.id =3D -1;
> > > > > > +
> > > > > > +     ref->dmabuf =3D dma_buf_get(fd);
> > > > > > +     if (IS_ERR(ref->dmabuf)) {
> > > > > > +             rc =3D PTR_ERR(ref->dmabuf);
> > > > > > +             goto err_put_dmabuf;
> > > > > > +     }
> > > > > > +
> > > > > > +     ref->attach =3D dma_buf_attach(ref->dmabuf, &ref-
> > > > > > >shm.ctx-
> > > > > > > teedev->dev);
> > > > > > +     if (IS_ERR(ref->attach)) {
> > > > > > +             rc =3D PTR_ERR(ref->attach);
> > > > > > +             goto err_detach;
> > > > > > +     }
> > > > > > +
> > > > > > +     ref->sgt =3D dma_buf_map_attachment(ref->attach,
> > > > > > DMA_BIDIRECTIONAL);
> > > > > > +     if (IS_ERR(ref->sgt)) {
> > > > > > +             rc =3D PTR_ERR(ref->sgt);
> > > > > > +             goto err_unmap_attachement;
> > > > > > +     }
> > > > > > +
> > > > > > +     if (sg_nents(ref->sgt->sgl) !=3D 1) {
> > > > > > +             rc =3D PTR_ERR(ref->sgt->sgl);
> > > > > > +             goto err_unmap_attachement;
> > > > > > +     }
> > > > > > +
> > > > > > +     ref->shm.paddr =3D sg_dma_address(ref->sgt->sgl);
> > > > > > +     ref->shm.size =3D sg_dma_len(ref->sgt->sgl);
> > > > > > +     ref->shm.flags =3D TEE_SHM_EXT_DMA_BUF;
> > > > > > +
> > > > > > +     mutex_lock(&ref->shm.ctx->teedev->mutex);
> > > > > > +     ref->shm.id =3D idr_alloc(&ref->shm.ctx->teedev->idr,
> > > > > > &ref->shm,
> > > > > > +                             1, 0, GFP_KERNEL);
> > > > > > +     mutex_unlock(&ref->shm.ctx->teedev->mutex);
> > > > > > +     if (ref->shm.id < 0) {
> > > > > > +             rc =3D ref->shm.id;
> > > > > > +             goto err_idr_remove;
> > > > > > +     }
> > > > > > +
> > > > > > +     return &ref->shm;
> > > > > > +
> > > > > > +err_idr_remove:
> > > > > > +     mutex_lock(&ctx->teedev->mutex);
> > > > > > +     idr_remove(&ctx->teedev->idr, ref->shm.id);
> > > > > > +     mutex_unlock(&ctx->teedev->mutex);
> > > > > > +err_unmap_attachement:
> > > > > > +     dma_buf_unmap_attachment(ref->attach, ref->sgt,
> > > > > > DMA_BIDIRECTIONAL);
> > > > > > +err_detach:
> > > > > > +     dma_buf_detach(ref->dmabuf, ref->attach);
> > > > > > +err_put_dmabuf:
> > > > > > +     dma_buf_put(ref->dmabuf);
> > > > > > +     kfree(ref);
> > > > > > +err_put_tee:
> > > > > > +     teedev_ctx_put(ctx);
> > > > > > +     tee_device_put(ctx->teedev);
> > > > > > +
> > > > > > +     return ERR_PTR(rc);
> > > > > > +}
> > > > > > +EXPORT_SYMBOL_GPL(tee_shm_register_fd);
> > > > > > +
> > > > > >  static struct tee_shm *
> > > > > >  register_shm_helper(struct tee_context *ctx, unsigned long
> > > > > > addr,
> > > > > >                   size_t length, u32 flags, int id) diff --
> > > > > > git
> > > > > > a/include/linux/tee_drv.h b/include/linux/tee_drv.h index
> > > > > > 911cad324acc..40ddd5376c2d 100644
> > > > > > --- a/include/linux/tee_drv.h
> > > > > > +++ b/include/linux/tee_drv.h
> > > > > > @@ -25,6 +25,7 @@
> > > > > >  #define TEE_SHM_USER_MAPPED  BIT(1)  /* Memory mapped in
> > > > > > user space
> > > > > > */
> > > > > >  #define TEE_SHM_POOL         BIT(2)  /* Memory allocated
> > > > > > from pool
> > > > > > */
> > > > > >  #define TEE_SHM_PRIV         BIT(3)  /* Memory private to
> > > > > > TEE driver
> > > > > > */
> > > > > > +#define TEE_SHM_EXT_DMA_BUF     BIT(4)  /* Memory with dma-
> > > > > > buf
> > > > > > handle */
> > > > > >
> > > > > >  struct device;
> > > > > >  struct tee_device;
> > > > > > @@ -276,6 +277,16 @@ struct tee_shm
> > > > > > *tee_shm_alloc_kernel_buf(struct
> > > > > > tee_context *ctx, size_t size);  struct tee_shm
> > > > > > *tee_shm_register_kernel_buf(struct tee_context *ctx,
> > > > > >                                           void *addr, size_t
> > > > > > length);
> > > > > >
> > > > > > +/**
> > > > > > + * tee_shm_register_fd() - Register shared memory from file
> > > > > > descriptor
> > > > > > + *
> > > > > > + * @ctx:     Context that allocates the shared memory
> > > > > > + * @fd:              Shared memory file descriptor reference
> > > > > > + *
> > > > > > + * @returns a pointer to 'struct tee_shm' on success, and
> > > > > > ERR_PTR
> > > > > > + on
> > > > > > failure
> > > > > > + */
> > > > > > +struct tee_shm *tee_shm_register_fd(struct tee_context *ctx,
> > > > > > int
> > > > > > fd);
> > > > > > +
> > > > > >  /**
> > > > > >   * tee_shm_is_dynamic() - Check if shared memory object is
> > > > > > of the
> > > > > > dynamic kind
> > > > > >   * @shm:     Shared memory handle
> > > > > > diff --git a/include/uapi/linux/tee.h
> > > > > > b/include/uapi/linux/tee.h
> > > > > > index 25a6c534beb1..baf3cd7cfdac 100644
> > > > > > --- a/include/uapi/linux/tee.h
> > > > > > +++ b/include/uapi/linux/tee.h
> > > > > > @@ -121,6 +121,35 @@ struct tee_ioctl_shm_alloc_data {
> > > > > >  #define TEE_IOC_SHM_ALLOC    _IOWR(TEE_IOC_MAGIC,
> > > > > > TEE_IOC_BASE + 1,
> > > > > > \
> > > > > >                                    struct
> > > > > > tee_ioctl_shm_alloc_data)
> > > > > >
> > > > > > +/**
> > > > > > + * struct tee_ioctl_shm_register_fd_data - Shared memory
> > > > > > +registering
> > > > > > argument
> > > > > > + * @fd:              [in] File descriptor identifying the
> > > > > > shared
> > > > > > memory
> > > > > > + * @size:    [out] Size of shared memory to allocate
> > > > > > + * @flags:   [in] Flags to/from allocation.
> > > > > > + * @id:              [out] Identifier of the shared memory
> > > > > > + *
> > > > > > + * The flags field should currently be zero as input.
> > > > > > Updated by
> > > > > > + the
> > > > > > call
> > > > > > + * with actual flags as defined by TEE_IOCTL_SHM_* above.
> > > > > > + * This structure is used as argument for
> > > > > > TEE_IOC_SHM_REGISTER_FD
> > > > > > below.
> > > > > > + */
> > > > > > +struct tee_ioctl_shm_register_fd_data {
> > > > > > +     __s64 fd;
> > > > > > +     __u64 size;
> > > > > > +     __u32 flags;
> > > > > > +     __s32 id;
> > > > > > +} __attribute__ ((aligned (8)));
> > > > > > +
> > > > > > +/**
> > > > > > + * TEE_IOC_SHM_REGISTER_FD - register a shared memory from a
> > > > > > file
> > > > > > descriptor
> > > > > > + *
> > > > > > + * Returns a file descriptor on success or < 0 on failure
> > > > > > + *
> > > > > > + * The returned file descriptor refers to the shared memory
> > > > > > object
> > > > > > in kernel
> > > > > > + * land. The shared memory is freed when the descriptor is
> > > > > > closed.
> > > > > > + */
> > > > > > +#define TEE_IOC_SHM_REGISTER_FD      _IOWR(TEE_IOC_MAGIC,
> > > > > > TEE_IOC_BASE + 8, \
> > > > > > +                                  struct
> > > > > > tee_ioctl_shm_register_fd_data)
> > > > > > +
> > > > > >  /**
> > > > > >   * struct tee_ioctl_buf_data - Variable sized buffer
> > > > > >   * @buf_ptr: [in] A __user pointer to a buffer
