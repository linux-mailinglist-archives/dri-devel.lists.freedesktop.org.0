Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A8E6914412
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 09:59:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDEA010E39F;
	Mon, 24 Jun 2024 07:59:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="fHI+Gg+h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2628E10E39F
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 07:59:39 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-5295eb47b48so4731033e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 00:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719215977; x=1719820777; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=lDo6FigYFQGMZS3Mpraq4BokVAZg7iCXZo4sAcKEd/g=;
 b=fHI+Gg+heyu8IbGywuPDIWttUqRHznb1za9b0H2o9pRhxv9gzyzihad+tccSHNXZEw
 FR+MULJV6pS7hUOwyQs2p3K4egf/pwTLaWG+HZJJY/Ippniv4dJq0Ks3q0Qr3qzzJg83
 InsUX8RTSiOY8aRXL9sTpBjYcpa3fKR1hbvMI1HqpvFeicIg9qj97wR0vc/0PyAQkZyJ
 Q8YWvNCKAbucvC/R+PypMP0c0ZzI16mNviP4ZJHPOUOFg80d9i3jUtnIV/dmlPfKaJa4
 coFfrA8lg7o+U0DrytpwfYsAzLUIhLTGCfQacM9Nq5392U2ARopghj/IhEWUE0b1D5Pd
 UhsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719215977; x=1719820777;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lDo6FigYFQGMZS3Mpraq4BokVAZg7iCXZo4sAcKEd/g=;
 b=NATb70NYx2pA1BA30XHjNqZAoVT4bbtX3OjSelLzBVLZVAQEr+fGPVFOAzbZZ/TZ7W
 Nk3iGGut+Ix6VDIl9KMBawe8hfhTA/F+q4fincc4zeO1n04f7+h652j1wWnmaP++aj/6
 TOpJq1oqWReqtVovp92VGk95/Hgq9mgTtcO1F3dmLI+tpjuGxhIcx9GJuPFF7Vtb0/2Z
 i12cnZdbXaRv0YjBeUgKq97V+IsRf8LpV/Ma74G5g9y5179CcPEm7g71S2Oq7Emk4uK4
 iNawuhJFm3/+FXx3SK1EtDnpdDrQxj8A8a2QPoFZE4fHHQ9GA0AX3445YNwhvmm95evk
 fvqQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCH1MToO0xI34nv/t+gG2IoN+Zayf91QUgU4IZZ7joW6kQ/GUiLR9tq4j6WCx654SbcS6zYB80hToKh5qlXi+TvbEsP7m28jN4v7WQn5eV
X-Gm-Message-State: AOJu0Yxj0cqSMPrkADN90fTzHsFZQLClLT4OZUUnf+wfNRSMPmdf/G8F
 XLcl6iyKsNY8S9y7GeVTNGQK1sGl2LgYbupDJNUUtGQiFtNQmy20VJnSmoCUhpI=
X-Google-Smtp-Source: AGHT+IHenuOkInITr6W0VLjG1A7f0qBzFfDGHfEiH9gMy4oUCngVCqpgbvTbaQobNROLVIHjJmUdEg==
X-Received: by 2002:a05:6512:b23:b0:52c:e383:b0d1 with SMTP id
 2adb3069b0e04-52ce383b18cmr3072773e87.53.1719215976959; 
 Mon, 24 Jun 2024 00:59:36 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52cdb4a7215sm787583e87.171.2024.06.24.00.59.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jun 2024 00:59:36 -0700 (PDT)
Date: Mon, 24 Jun 2024 10:59:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Jeffrey Hugo <quic_jhugo@quicinc.com>, 
 Ekansh Gupta <quic_ekangupt@quicinc.com>, Oded Gabbay <ogabbay@kernel.org>,
 srinivas.kandagatla@linaro.org, 
 linux-arm-msm@vger.kernel.org, gregkh@linuxfoundation.org,
 quic_bkumar@quicinc.com, 
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, Dave Airlie <airlied@gmail.com>
Subject: Re: [PATCH v1] misc: fastrpc: Move fastrpc driver to misc/fastrpc/
Message-ID: <jhjbx32kxywnzzin6w3tzobpu5v3zxfak4vz4q5t36v6hrbvuo@uixf3imdiefl>
References: <20240612064731.25651-1-quic_ekangupt@quicinc.com>
 <zbpia232dh4ojfsvhcqxrp6cwfygaalu5cycdrs47pqmnrisvk@dq24nww26gkm>
 <z6g5ool5vomkudiroyaxh532rhlfu5x4i3l5xoqrsho2sxv4im@v5ghemjkpc3v>
 <CAA8EJprgCJKOnZo7Q31KZV3SA3NqWxcMmoUxuqnVF+8cQW5ucg@mail.gmail.com>
 <6f59552d-d7a3-5e05-3465-e707c1b7eaf2@quicinc.com>
 <ZnWhwJtTXS32UI9H@phenom.ffwll.local>
 <fin5dnpf3jyo5mk4b7fktdutbds5lkpxwzojecxa4zh7gwfad2@rkryxqzt6maq>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fin5dnpf3jyo5mk4b7fktdutbds5lkpxwzojecxa4zh7gwfad2@rkryxqzt6maq>
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

On Sun, Jun 23, 2024 at 03:19:17PM GMT, Bjorn Andersson wrote:
> On Fri, Jun 21, 2024 at 05:52:32PM GMT, Daniel Vetter wrote:
> > On Fri, Jun 21, 2024 at 09:40:09AM -0600, Jeffrey Hugo wrote:
> > > On 6/21/2024 5:19 AM, Dmitry Baryshkov wrote:
> > > > On Fri, 21 Jun 2024 at 09:19, Bjorn Andersson <andersson@kernel.org> wrote:
> > > > > 
> > > > > On Wed, Jun 12, 2024 at 09:28:39PM GMT, Dmitry Baryshkov wrote:
> > > > > > On Wed, Jun 12, 2024 at 12:17:28PM +0530, Ekansh Gupta wrote:
> > > > > > > Move fastrpc.c from misc/ to misc/fastrpc/. New C files are planned
> > > > > > > to be added for PD notifications and other missing features. Adding
> > > > > > > and maintaining new files from within fastrpc directory would be easy.
> > > > > > > 
> > > > > > > Example of feature that is being planned to be introduced in a new C
> > > > > > > file:
> > > > > > > https://lore.kernel.org/all/20240606165939.12950-6-quic_ekangupt@quicinc.com/
> > > > > > > 
> > > > > > > Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> > > > > > > ---
> > > > > > >   MAINTAINERS                          |  2 +-
> > > > > > >   drivers/misc/Kconfig                 | 13 +------------
> > > > > > >   drivers/misc/Makefile                |  2 +-
> > > > > > >   drivers/misc/fastrpc/Kconfig         | 16 ++++++++++++++++
> > > > > > >   drivers/misc/fastrpc/Makefile        |  2 ++
> > > > > > >   drivers/misc/{ => fastrpc}/fastrpc.c |  0
> > > > > > >   6 files changed, 21 insertions(+), 14 deletions(-)
> > > > > > >   create mode 100644 drivers/misc/fastrpc/Kconfig
> > > > > > >   create mode 100644 drivers/misc/fastrpc/Makefile
> > > > > > >   rename drivers/misc/{ => fastrpc}/fastrpc.c (100%)
> > > > > > 
> > > > > > Please consider whether it makes sense to move to drivers/accel instead
> > > > > > (and possibly writing a better Kconfig entry, specifying that the driver
> > > > > > is to be used to offload execution to the DSP).
> > > > > > 
> > > > > 
> > > > > Wouldn't this come with the expectation of following the ABIs of
> > > > > drivers/accel and thereby breaking userspace?
> > > > 
> > > > As I wrote earlier, that depends on the accel/ maintainers decision,
> > > > whether it's acceptable to have non-DRM_ACCEL code underneath.
> > > > But at least I'd try doing that on the grounds of keeping the code at
> > > > the proper place in the drivers/ tree, raising awareness of the
> > > > FastRPC, etc.
> > > > For example current fastrpc driver bypasses dri-devel reviews, while
> > > > if I remember correctly, at some point it was suggested that all
> > > > dma-buf-handling drivers should also notify the dri-devel ML.
> 
> If the agreement is that dma-buf-handling drivers must get reviews from
> dri-devel, then let's document that in MAINTAINERS and agree with the
> maintainer.

Good idea.

> 
> There's no need to move the driver for that.

-- 
With best wishes
Dmitry
