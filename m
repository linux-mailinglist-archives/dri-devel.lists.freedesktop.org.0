Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 632DE91232F
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 13:19:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4DA310F15D;
	Fri, 21 Jun 2024 11:19:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="reYlgOUT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com
 [209.85.219.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5DFA10F15D
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 11:19:12 +0000 (UTC)
Received: by mail-yb1-f177.google.com with SMTP id
 3f1490d57ef6-dff36345041so1932980276.3
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 04:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718968752; x=1719573552; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=H5QZgZfdaJY5tt1Kp5T6W2RdnqNcsMEWI2ebReKb6vI=;
 b=reYlgOUTj2bhR/mIHtTmJQUDfuqI3jKe8dhJyx6DYetNKhM32hWMdtEDZM4r+Qd8Rs
 plEssUHDItVYD5QOsOyJXrcJPMYkMtHPDGZTWRUm5nh9vT6MQx2WuoUku3DB6cVqSNrn
 ozkglCp7vYEnU69Z2nhgWhH/x990Gz67CV2uQ65FD9J5Y+hi+sBSa+K5I3MmZfeCZfWF
 476gKw01kAXpx6Ru6LFbN5MG6nx/p92asr4+IMGIzdiS+oIZjokB0fLtaceGydmhamMw
 fya0Y5hksKtYdAVp6D4zdvWG4M8gxFCWLwFdVJ9SW1eWY5RUmGMP55EHVTks+aotKlfi
 naiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718968752; x=1719573552;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=H5QZgZfdaJY5tt1Kp5T6W2RdnqNcsMEWI2ebReKb6vI=;
 b=ARWnsz82UBMA2otpzLjd3YTuveOyxBI0RxwvYLxK6VwJwm4YfqduGGulM0tSEmFRXo
 NqIx/12m+XOTBYgw+byJFcxqB3l5l0KX4D1rcYSxn2O1GxfokEvRylR7/UyunAZsni0V
 t8Sa9wygocStNw/aCVo9L2pmRoMr1F1zOpsV7Tpop5+5gHb4plcX5vlAuW/k8XvDIYMM
 8F9DsLKKrkqyBfVg0fn8/7XoBOL9nnbV8UVrjfWzsGcjerldDxuV5HZ9HQv13Ec9fRqx
 DCX+9aulUgYujZqsdbNDAAPA5aPZmAB/C2f2qZClLiH6h7D4dv44cEMaoyZun1+SPUp8
 1NBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWn9ouI0e9dWZJFgYjAZcsL3oWwBqHZdvvMY1VrskwYSzOVffLZ6qRO5lCciA+mkqC5m019bFHA9VXdB0PzMosDAg2BHvRgCX0+VBcBiQqZ
X-Gm-Message-State: AOJu0Ywng7DSeJOoyt1xXrVAXEyaX24Z7XNHXvfrF14D34wdR1NVhJ47
 qwicOEWPo+O5GY0oa+K3/5mJJeWxDDYzLgegOArnnCvqEKgZcTRU8B+fVSdx2zGxcysMyzr2OKM
 PVM2/oCmcRxacXLlKOa/Y5y/rySKHmLDydLwWnA==
X-Google-Smtp-Source: AGHT+IHNvgD/CLuCJPDEmrMqR6vErGZ956Gg+9FC6uT2K+FAj7cCLW+UCZ1u3hp0iVip8LrBW4sNqfFVjLQjBsohjHE=
X-Received: by 2002:a25:dbd1:0:b0:dff:4a3:2ded with SMTP id
 3f1490d57ef6-e02be13f445mr8358289276.22.1718968751833; Fri, 21 Jun 2024
 04:19:11 -0700 (PDT)
MIME-Version: 1.0
References: <20240612064731.25651-1-quic_ekangupt@quicinc.com>
 <zbpia232dh4ojfsvhcqxrp6cwfygaalu5cycdrs47pqmnrisvk@dq24nww26gkm>
 <z6g5ool5vomkudiroyaxh532rhlfu5x4i3l5xoqrsho2sxv4im@v5ghemjkpc3v>
In-Reply-To: <z6g5ool5vomkudiroyaxh532rhlfu5x4i3l5xoqrsho2sxv4im@v5ghemjkpc3v>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 21 Jun 2024 14:19:03 +0300
Message-ID: <CAA8EJprgCJKOnZo7Q31KZV3SA3NqWxcMmoUxuqnVF+8cQW5ucg@mail.gmail.com>
Subject: Re: [PATCH v1] misc: fastrpc: Move fastrpc driver to misc/fastrpc/
To: Bjorn Andersson <andersson@kernel.org>
Cc: Ekansh Gupta <quic_ekangupt@quicinc.com>, Oded Gabbay <ogabbay@kernel.org>,
 srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org, 
 gregkh@linuxfoundation.org, quic_bkumar@quicinc.com, 
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com, 
 dri-devel@lists.freedesktop.org
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

On Fri, 21 Jun 2024 at 09:19, Bjorn Andersson <andersson@kernel.org> wrote:
>
> On Wed, Jun 12, 2024 at 09:28:39PM GMT, Dmitry Baryshkov wrote:
> > On Wed, Jun 12, 2024 at 12:17:28PM +0530, Ekansh Gupta wrote:
> > > Move fastrpc.c from misc/ to misc/fastrpc/. New C files are planned
> > > to be added for PD notifications and other missing features. Adding
> > > and maintaining new files from within fastrpc directory would be easy.
> > >
> > > Example of feature that is being planned to be introduced in a new C
> > > file:
> > > https://lore.kernel.org/all/20240606165939.12950-6-quic_ekangupt@quicinc.com/
> > >
> > > Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> > > ---
> > >  MAINTAINERS                          |  2 +-
> > >  drivers/misc/Kconfig                 | 13 +------------
> > >  drivers/misc/Makefile                |  2 +-
> > >  drivers/misc/fastrpc/Kconfig         | 16 ++++++++++++++++
> > >  drivers/misc/fastrpc/Makefile        |  2 ++
> > >  drivers/misc/{ => fastrpc}/fastrpc.c |  0
> > >  6 files changed, 21 insertions(+), 14 deletions(-)
> > >  create mode 100644 drivers/misc/fastrpc/Kconfig
> > >  create mode 100644 drivers/misc/fastrpc/Makefile
> > >  rename drivers/misc/{ => fastrpc}/fastrpc.c (100%)
> >
> > Please consider whether it makes sense to move to drivers/accel instead
> > (and possibly writing a better Kconfig entry, specifying that the driver
> > is to be used to offload execution to the DSP).
> >
>
> Wouldn't this come with the expectation of following the ABIs of
> drivers/accel and thereby breaking userspace?

As I wrote earlier, that depends on the accel/ maintainers decision,
whether it's acceptable to have non-DRM_ACCEL code underneath.
But at least I'd try doing that on the grounds of keeping the code at
the proper place in the drivers/ tree, raising awareness of the
FastRPC, etc.
For example current fastrpc driver bypasses dri-devel reviews, while
if I remember correctly, at some point it was suggested that all
dma-buf-handling drivers should also notify the dri-devel ML.

Also having the driver under drivers/accels makes it possible and
logical to  implement DRM_ACCEL uAPI at some point. In the ideal world
we should be able to declare existing FastRPC uAPI as legacy /
deprecated / backwards compatibility only and migrate to the
recommended uAPI approach, which is DRM_ACCEL.

-- 
With best wishes
Dmitry
