Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EADBA912E18
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 21:48:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 132B910E159;
	Fri, 21 Jun 2024 19:48:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="v5DpuX8P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com
 [209.85.128.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06EF910E07E
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 19:48:39 +0000 (UTC)
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-63bd10df78dso22571457b3.2
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 12:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718999319; x=1719604119; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=P/c8cghJ6uMh9jC1Qg2cHE9CahIR6DPBACZ2TcXW56A=;
 b=v5DpuX8Pf6rxexCFOXo4BAO3gHnuIeTEdVrEabfiDsN7qIoIfg5Bkhf9MBEp+przx9
 Zbx+R3Ldjn+MGI/uSB1ctm76BW+C15LK6xiBWKYKFDxOa4IJkxMXfEIt6zW3Ryz0uRFh
 hvctdXnPXxyARmmYh/oexidGEdqi4LI3n6gXybXWlFSY1yTul+nbX4vB0gZ4woR6wPUb
 PjTLuqhZeckfHQ1haUXYj4F9rYRxW6EfKAIXvFRguZJAI0cxKlXCeYF6lYFaLCkTXdgD
 AUrWrBXwElDpRkRYPbs3ZO2qt3aGsg9WbhiZ9EkASoqZBQC/urOhxy0LCX0gYT5KAFSY
 n3uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718999319; x=1719604119;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=P/c8cghJ6uMh9jC1Qg2cHE9CahIR6DPBACZ2TcXW56A=;
 b=a6Aqjld05AT5l848/vSoajB8aeMD5keyJZWlMRGMNBl0Y7dhjT4N53ZjwYJ7yayN0G
 59YFHBHwleNy1uPvzPo0fW01r7f8SNnAv/IbD1X65nIl24/tSKD2F9he5MWgZqxonDyQ
 1k+qFc+7j5Kdsbz3JAqp90IHqwqXeIT/PGhnd3C+NZ2JMU4/5ktZlkfnlSfTckX1EPGV
 ZefgtEOdMClRDFVaSEXTEGHZNSNTTqNBKbMl89HwO5ajJFKQfgakgOAOiMi0P6vFtgw5
 jijaXgPIArEpaPci/PP+UsT/Gv51hHg+Y/8wapPLNA5jLS/HANyY0KUt5Hquk86tO7xd
 MOOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWkirEuCMD4bnpUnvL6zFre0qQgk3Wbd//xgV/ZR3zQHTTkFOiQuFQb+nXeOTEOMr/rLg65EVVjGRy4hNflGJLDmx9gcN6pVKp5xNFbtwFF
X-Gm-Message-State: AOJu0YysPMlsu2fBZycHj+NM89zHosZs7WN19RGy8hGuMnih10hYySRK
 Af0pZPaT18IGtY3N1dEzP9nbVz/jQUbmJ5XcUf5cWR2RvqfDCKHPfnoQlKdy99QGcyizQvWVQ7d
 l8M1NUH7Fz3SZFDwgHruyPX/DipCyCZHoDyw6RA==
X-Google-Smtp-Source: AGHT+IFvOw/kHfTfZo+OrqgAX4CDfPljUrETGvD6Moa3aTJuLqtsXuUSv/1M4m37lNwuXK/7MTl9DPjJyvK+nqkQaqI=
X-Received: by 2002:a0d:d48d:0:b0:622:c901:950b with SMTP id
 00721157ae682-63a8fddc9d9mr103318627b3.43.1718999318614; Fri, 21 Jun 2024
 12:48:38 -0700 (PDT)
MIME-Version: 1.0
References: <20240612064731.25651-1-quic_ekangupt@quicinc.com>
 <zbpia232dh4ojfsvhcqxrp6cwfygaalu5cycdrs47pqmnrisvk@dq24nww26gkm>
 <z6g5ool5vomkudiroyaxh532rhlfu5x4i3l5xoqrsho2sxv4im@v5ghemjkpc3v>
 <CAA8EJprgCJKOnZo7Q31KZV3SA3NqWxcMmoUxuqnVF+8cQW5ucg@mail.gmail.com>
 <6f59552d-d7a3-5e05-3465-e707c1b7eaf2@quicinc.com>
 <ZnWhwJtTXS32UI9H@phenom.ffwll.local>
In-Reply-To: <ZnWhwJtTXS32UI9H@phenom.ffwll.local>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 21 Jun 2024 22:48:27 +0300
Message-ID: <CAA8EJppRP0HdM6AfmL0uga2esDey12LVjuSn=wJZtV4Uz0CgZg@mail.gmail.com>
Subject: Re: [PATCH v1] misc: fastrpc: Move fastrpc driver to misc/fastrpc/
To: Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>,
 Ekansh Gupta <quic_ekangupt@quicinc.com>, 
 Oded Gabbay <ogabbay@kernel.org>, srinivas.kandagatla@linaro.org, 
 linux-arm-msm@vger.kernel.org, gregkh@linuxfoundation.org, 
 quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org, 
 quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org, 
 Dave Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
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

On Fri, 21 Jun 2024 at 18:52, Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Fri, Jun 21, 2024 at 09:40:09AM -0600, Jeffrey Hugo wrote:
> > On 6/21/2024 5:19 AM, Dmitry Baryshkov wrote:
> > > On Fri, 21 Jun 2024 at 09:19, Bjorn Andersson <andersson@kernel.org> wrote:
> > > >
> > > > On Wed, Jun 12, 2024 at 09:28:39PM GMT, Dmitry Baryshkov wrote:
> > > > > On Wed, Jun 12, 2024 at 12:17:28PM +0530, Ekansh Gupta wrote:
> > > > > > Move fastrpc.c from misc/ to misc/fastrpc/. New C files are planned
> > > > > > to be added for PD notifications and other missing features. Adding
> > > > > > and maintaining new files from within fastrpc directory would be easy.
> > > > > >
> > > > > > Example of feature that is being planned to be introduced in a new C
> > > > > > file:
> > > > > > https://lore.kernel.org/all/20240606165939.12950-6-quic_ekangupt@quicinc.com/
> > > > > >
> > > > > > Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> > > > > > ---
> > > > > >   MAINTAINERS                          |  2 +-
> > > > > >   drivers/misc/Kconfig                 | 13 +------------
> > > > > >   drivers/misc/Makefile                |  2 +-
> > > > > >   drivers/misc/fastrpc/Kconfig         | 16 ++++++++++++++++
> > > > > >   drivers/misc/fastrpc/Makefile        |  2 ++
> > > > > >   drivers/misc/{ => fastrpc}/fastrpc.c |  0
> > > > > >   6 files changed, 21 insertions(+), 14 deletions(-)
> > > > > >   create mode 100644 drivers/misc/fastrpc/Kconfig
> > > > > >   create mode 100644 drivers/misc/fastrpc/Makefile
> > > > > >   rename drivers/misc/{ => fastrpc}/fastrpc.c (100%)
> > > > >
> > > > > Please consider whether it makes sense to move to drivers/accel instead
> > > > > (and possibly writing a better Kconfig entry, specifying that the driver
> > > > > is to be used to offload execution to the DSP).
> > > > >
> > > >
> > > > Wouldn't this come with the expectation of following the ABIs of
> > > > drivers/accel and thereby breaking userspace?
> > >
> > > As I wrote earlier, that depends on the accel/ maintainers decision,
> > > whether it's acceptable to have non-DRM_ACCEL code underneath.
> > > But at least I'd try doing that on the grounds of keeping the code at
> > > the proper place in the drivers/ tree, raising awareness of the
> > > FastRPC, etc.
> > > For example current fastrpc driver bypasses dri-devel reviews, while
> > > if I remember correctly, at some point it was suggested that all
> > > dma-buf-handling drivers should also notify the dri-devel ML.
> > >
> > > Also having the driver under drivers/accels makes it possible and
> > > logical to  implement DRM_ACCEL uAPI at some point. In the ideal world
> > > we should be able to declare existing FastRPC uAPI as legacy /
> > > deprecated / backwards compatibility only and migrate to the
> > > recommended uAPI approach, which is DRM_ACCEL.
> > >
> >
> > I suspect Vetter/Airlie need to be involved in this.
> >
> > Its my understanding that accelerator drivers are able to reside in misc as
> > long as there is no use of dma-buf.  Use of dma-buf means they need to be in
> > drm/accel.
> >
> > There is precedent for moving a driver from misc to accel (HabanaLabs).
> >
> > Right now, I'm not aware that fastRPC meets the requirements for drm/accel.
> > There is an open source userspace driver, but I'm not aware of an open
> > source compiler.  From what I know of the architecture, it should be
> > possible to utilize upstream LLVM to produce one.
>
> Yeah so fastrpc is one of the reasons why I've added a dma_buf regex match
> to MAINTAINERS, and given this move has shown up here on dri-devel that
> seems to work.
>
> But also, it slipped through, can't break uapi, so I just pretend it's not
> really there :-)
>
> That aside, going forward it might make sense to look into drivers/accel,
> and also going forward new dma_buf uapi will be reviewed to fairly
> stringent standards. We're not going to impose the dri-devel userspace
> rules on everyone, each subsystem tends to know what's best in their
> ecosystem. But if something just ends up in misc so it can avoid the drm
> or accel rules (and I think media is also pretty much on the same page
> nowadays), then expect some serious heat ...

After discussing this on #dri-devel, I'm going to retract my
suggestion of moving the driver to drivers/accel/, unless there is an
actual interest in moving to drm_accel.h style of uAPI.

It should still be noted that there is a strong recommendation to
start from scratch and to use DRM / accel uAPI, either using the
existing driver for the legacy platforms or dropping it completely.
When the fastrpc driver was started by Qualcomm engineers, there was
no standard method of implementing the accel drivers. Since 1st of
November 2022 we have drm_accel.h.

-- 
With best wishes
Dmitry
