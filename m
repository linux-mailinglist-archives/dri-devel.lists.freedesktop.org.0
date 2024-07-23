Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73FDD939D53
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2024 11:14:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C858210E4F0;
	Tue, 23 Jul 2024 09:14:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="zqXuJSzD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com
 [209.85.128.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1A9F10E4F0
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2024 09:14:43 +0000 (UTC)
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-64b417e1511so52093327b3.3
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2024 02:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721726083; x=1722330883; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=do76fn9eVUpHN8Ddkeci0hwMk6DMn3ti88cC7rkfzQc=;
 b=zqXuJSzDpGpW2fT5gwja68xaYOknX9QghgwTxDA8AYpUGDwOyOJoBWyhSJP8ZQ31hb
 HVKDHjaNbSK9oV9XVN122kEozGz6xALpJlVwkEdS64JXv7yerwF6DaKPfL1gQozh4lq1
 y0bCBl+1C7FTzY8Js3J6/admJ8bJau0Uhv699vXzuaBsSlmYUYCA6i4b6Tr/QqN7z3gB
 75Bvsh/i8wsEzFXMUJi07Hr6beju9+7Xqjt6YKFDJQWCpHollBFTpD7sS1m27eVDnJN0
 1jQeDyobku9+Dn0Q6jIxGTHfiX9i64FAcnTQCrZgOQVpfWDIHR7K4SWVdJz5EPGMj7sK
 b3JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721726083; x=1722330883;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=do76fn9eVUpHN8Ddkeci0hwMk6DMn3ti88cC7rkfzQc=;
 b=q6PsPjijhPo1VrVwPJKPtZJkHNopyU7Qc5RjOpozT0bAHWiCxVWzrNOLfMRH53EmkA
 vRqEtTCa0Hk11z4KUrxMiUS3HwUMt8iPGYT41JlkHZ2pHGnxhGjLJl1zpgh/C3UgUfUm
 uZvsMgM/0TCa2d4MPSu7ziV0TM5FalnvM5nivh//+R1gv5t7pycc5B8pP6zPeChf02p2
 Q8tPUjaefizGBt9eji+Tpx5WNraJtMErrImQJugpg/xc1zPya62XJanZwD0P7BZNJ38C
 +bsxjceoT2oYroBRa5gVRoiljVCMbulta0j0RRZJrxUorjQ54540RFj0qqiG7HqfhBak
 Pa9w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWIdi8/RPHk1ofdsVwv1+OQ3ZAaUUP3rkfY0nu0wp1x0YdfTa0ePtGjWKXi/9YKLji0CP56qRKW8be+xvvnPlIvu/Br/nFfbNMQUtGDBdc/
X-Gm-Message-State: AOJu0YzQlYj0wd8JBklAiWf4wdXnFeabrME2+kBVuqx/xx3b812+r0JI
 et06apE+0a1z6i5GaJPlnG6HW8wFt1Pp6ua6nteBEovzmvXQvzmEaHE90LqXzH3vzeh6pmaRhhO
 RhdagPM/EA1LisErY4ZPjjxtOzQeZd+fmmUBYvg==
X-Google-Smtp-Source: AGHT+IGDii57wttIhsWjllJQ0f567FJtrDS2mTN6cewKhchy/2c2bk7UMoqEAJRDMLDDuOfO1ytaXqNPjebbxFrr08M=
X-Received: by 2002:a05:690c:288a:b0:627:a917:76b1 with SMTP id
 00721157ae682-66a65e652d0mr117703277b3.44.1721726082779; Tue, 23 Jul 2024
 02:14:42 -0700 (PDT)
MIME-Version: 1.0
References: <20240722080200.3530850-1-quic_ekangupt@quicinc.com>
 <20240722080200.3530850-3-quic_ekangupt@quicinc.com>
 <cr6xv4tsk23sjynnucve4366fwvffgq3rjnbkpxhzdfeiktwtr@ydrp3mduapui>
 <be9ffb28-3ad7-4537-bf80-45ea43f97374@quicinc.com>
In-Reply-To: <be9ffb28-3ad7-4537-bf80-45ea43f97374@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 23 Jul 2024 12:14:31 +0300
Message-ID: <CAA8EJpo=mXS43Mhp15Z6fRtLc+__+PmQ7yrOaOQKW-_R1sgbTQ@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] misc: fastrpc: Increase unsigned PD initmem size
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org, 
 gregkh@linuxfoundation.org, quic_bkumar@quicinc.com, 
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com, 
 dri-devel@lists.freedesktop.org, arnd@arndb.de, stable <stable@kernel.org>
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

On Tue, 23 Jul 2024 at 07:36, Ekansh Gupta <quic_ekangupt@quicinc.com> wrote:
>
>
>
> On 7/22/2024 2:04 PM, Dmitry Baryshkov wrote:
> > On Mon, Jul 22, 2024 at 01:32:00PM GMT, Ekansh Gupta wrote:
> >> For unsigned PD offloading requirement, additional memory is required
> >> because of additional static heap initialization. Without this
> >> additional memory, PD initialization would fail. Increase the initmem
> >> size by 2MB for unsigned PD initmem buffer allocation. Any additional
> >> memory sent to DSP during PD init is used as the PD heap.
> > From the previous commit message I had the feeling that DSP can request
> > more memory if required. Currently you are stating that PD init would
> > fail if it doesn't have enough mem.
>
> DSP PD can request for memory only for PD heap and that too once the PD
> initialization is complete.

This should be a part of the (previous?) commit message.  Also what is
the difference between static heap vs PD heap?

>
> >
> >> Fixes: 7f1f481263c3 ("misc: fastrpc: check before loading process to the DSP")
> >> Cc: stable <stable@kernel.org>
> >> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> >> ---
> >>  drivers/misc/fastrpc.c | 8 ++++++++
> >>  1 file changed, 8 insertions(+)
> >>
>


-- 
With best wishes
Dmitry
