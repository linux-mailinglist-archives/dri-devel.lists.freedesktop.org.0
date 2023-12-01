Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 964068014FD
	for <lists+dri-devel@lfdr.de>; Fri,  1 Dec 2023 22:13:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63A5010E95C;
	Fri,  1 Dec 2023 21:13:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com
 [IPv6:2607:f8b0:4864:20::1136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3C8210E146
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Dec 2023 21:13:11 +0000 (UTC)
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-5d3d0f862f7so18008427b3.0
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Dec 2023 13:13:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701465191; x=1702069991; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=qFcscOKS+KeBuJ79kHtYrcnP4y16ClEYnsDu1e9phGc=;
 b=bbyUQDUXDqT0VDLKctrCnlNvxAXCytwk6CXRi96/OP2Rmp9+rOKB2YGAbM6CCDNYfC
 XzXXCDaNf+4mOf73mZX28PmAE3BA/jJF9CcpmBU0YoK6tE3kzQoDsEBuBH4ls97lgMli
 aTbT06fAZ+LWytoNVTjV5Q3Xzgjd/zhYETtT1FqkJ5Yh+uqK4ttOMqLdsQEw5SVCpwT+
 Tj6jkVkxs9MEOHSneELG0J/Gh0HYPFJo/lUw+NQX0OwuPtp+7nhPfv7dlNavorop1f9P
 mGi5Ssax6I8473uciAErDZmdQE+uokvtz9l6PkFNe9SRhpVdjmuu6XuuZtfoyJWMLjj2
 ykmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701465191; x=1702069991;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qFcscOKS+KeBuJ79kHtYrcnP4y16ClEYnsDu1e9phGc=;
 b=Gi4JS2VLCI+EZZpcr8xy/l4yAn1nPXcxIoO/OH5PNF4F4F2Gu0eKO2GsbnIq4nyie8
 HHsfxBZ5392DQulehEnFmsUpb3syjf/USpiCVuxdnFm3ninSfiBInH5ROnSAoMvkxnOt
 bnykOk8+rqRMb9p7wXt7ZecsCI9zkeQEwUE5/jq66NM9hsmMXn7/P7JkWmgn3/YCqAr1
 p+MRFajlWuRKxe7n7aGoeVtYUARI3zWPniCHzaDxzaFdBvWB0xybMgvUP5qr+yB4Rdzi
 e3d1HAeYJWnktHKiE2sd4itqPWb3VIaZhEuYTZPKFGywHVYTHTqNNhb3ou+BBo5HsP3c
 3Hhw==
X-Gm-Message-State: AOJu0YzQCOBjiyCCBzsrtQtMZ47oNIzxCNLbFJuDQI9M1rHP7dX17pI7
 lX2+eW7+Y+E/tMmPfYY8xfAfk5sfY25S+hAlsOy6uQ==
X-Google-Smtp-Source: AGHT+IEjhMbg+u8d2JTKNyFigsjKYOvhHdb/RZ1AFJXxaavi0QLf9ngcSuMDgs4UQpxI1yREp/yiDoEACIs+yDv+4TM=
X-Received: by 2002:a0d:ee41:0:b0:57a:cf8:5b4 with SMTP id
 x62-20020a0dee41000000b0057a0cf805b4mr25615864ywe.51.1701465191106; 
 Fri, 01 Dec 2023 13:13:11 -0800 (PST)
MIME-Version: 1.0
References: <20231201014101.15802-1-quic_parellan@quicinc.com>
 <20231201014101.15802-2-quic_parellan@quicinc.com>
 <CAA8EJpqGx3eQ3o6bJhv3OBmHqtp67x8ODupZgKfSLSfFcRRmHQ@mail.gmail.com>
 <730d7e5b-e748-465d-cfee-06bfdcee5844@quicinc.com>
In-Reply-To: <730d7e5b-e748-465d-cfee-06bfdcee5844@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 1 Dec 2023 23:13:00 +0200
Message-ID: <CAA8EJpoobZe-TzTdEU_+eKgsu6Any7C+LJU4ePDKgVkabT=gcg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] drm/msm/dpu: Modify vblank_refcount if error in
 callback
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
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
Cc: marijn.suijten@somainline.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, seanpaul@chromium.org,
 steev@kali.org, quic_jesszhan@quicinc.com,
 Paloma Arellano <quic_parellan@quicinc.com>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 1 Dec 2023 at 21:14, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 11/30/2023 11:45 PM, Dmitry Baryshkov wrote:
> > On Fri, 1 Dec 2023 at 03:41, Paloma Arellano <quic_parellan@quicinc.com> wrote:
> >>
> >> When the irq callback returns a value other than zero,
> >> modify vblank_refcount by performing the inverse
> >> operation of its corresponding if-else condition.
> >
> > I think it might be better to follow Bjorn's suggestion: once we have
> > the lock, we don't need atomics at all.
> > Then you rearrange the code to set the new value after getting return
> > code from dpu_core_irq_register_callback() /
> > dpu_core_irq_unregister_callback().
> >
>
> Even if we drop the atomics, we will have to replace it with a simple
> refcount. The refcount checks will be before calling
> dpu_core_irq_register_callback() / dpu_core_irq_unregister_callback().
>
> So we will still need the corresponding inverse refcount when either of
> those calls fail but just that they wont be atomics.

Within the critical section you can check the value before
register_callback and increment it afterwards if registration
succeeds.

>
> Am I missing something here?
>
> >>
> >> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> >> ---
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 9 +++++++--
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 9 +++++++--
> >>   2 files changed, 14 insertions(+), 4 deletions(-)
> >



-- 
With best wishes
Dmitry
