Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA0B99716C1
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 13:25:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0210610E333;
	Mon,  9 Sep 2024 11:25:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="aMH4ACCT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com
 [209.85.128.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E275410E333
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Sep 2024 11:25:12 +0000 (UTC)
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-6daf46ee332so40872267b3.0
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Sep 2024 04:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725881112; x=1726485912; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=OpDNkm0dS8Pmjc3q7OtWCuq9xNsSuYsSijjbAHrD43k=;
 b=aMH4ACCTp0zNeAdPp9eOHDuE6zqz32e9WPbYSfubUEt1Mza41f+Gcty4gxpPpwv4BP
 TVo+y+R6GpKw59ulVhbI0LgC7C8MsYYsFH9npvQeLbb2JQXYZ0AoRxIAeBPDiyQRlpB6
 ZHaFsHF8Iy8o1etBYEgkZo+jGQP3nJx19B4rzkKTe3JKmLh52AGIQJ56QAQ/RBRk/MAG
 GP/KQvrnYzTCG+ozBmhGRsZ7GI5e1u56ec2dY8NSqHFg8WTAWAq8HPwoeO5qSW8oqdJ7
 5G6ftnXSk/rZ27CsIzqMd+rgYQYSvM18vfBKevG7I0NXkE2s/DoP8HdD0knHFUeQFjOd
 lJbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725881112; x=1726485912;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OpDNkm0dS8Pmjc3q7OtWCuq9xNsSuYsSijjbAHrD43k=;
 b=YcpEV/ujNEV1PyAEM85+htqMrWewF9LuFyZYnQz06EvZG1G4JcnUDn3c7pZU+KDvi2
 YcwzVF4n09OOyJX6X90K+MSAxBPSMjj4RQjcWhYPJ+cH94d4JKwZ7R+ywEVtYd4JSyvO
 a0uKGDwI4Fq3qDace1a+Wx8K7t21b3GDJWLDrgRKU6EruqvgIXxeGQZqNH1p5K3Zcjv9
 QxT+ULz3UDX+6A6REqPnvN/RVjx9xola9+7qq01glNFWNpLsDI7tf2b7PU54C7gYBt2r
 7aWNK9L9ZogXLih09xnKrpowv7SLgBs2vAM8ZJtct8QFMGggtK8KSAC7vt1vmTWGClCx
 Cv1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXlZ5qOVjdkf7XeIbQDsRs/lSO/PIkGo1B95QIxS3zZAVXPrYH5jXTtdzmDeY2VkJc6FccqZV5sW18=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywbts3Vaaps4uEiflZrXm62vvKbBefQnZ+1wgXGR6TPC8WUbtpW
 QQaOYQODibMTSk96Jj+a6jSsrOBoR1MIksqGuYKuxdYySg1cdns1iujTLpnK+vfX/rJzElZ690i
 ALux51XpPWW9hCMmcUX0+IXgYhp7mHZzvTSrPfg==
X-Google-Smtp-Source: AGHT+IGVWKFrtsCq0XAJNDTpJCkeUpuZkVj85lqCpCtbm1eC6mA7YuhdlDQM5pTaOZwXdhStu1bIUwPbyKm4Z7k9kso=
X-Received: by 2002:a05:690c:67c1:b0:6d9:90f3:1a79 with SMTP id
 00721157ae682-6db451544f3mr141002197b3.32.1725881111691; Mon, 09 Sep 2024
 04:25:11 -0700 (PDT)
MIME-Version: 1.0
References: <20240908-adreno-fix-cpas-v1-1-57697a0d747f@linaro.org>
 <c77ab7a8-49aa-447b-b7ac-18dd5c2eeecb@kernel.org>
In-Reply-To: <c77ab7a8-49aa-447b-b7ac-18dd5c2eeecb@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 9 Sep 2024 14:25:00 +0300
Message-ID: <CAA8EJpr4sMEmywD3qO8co1ZN3jG5w=dsfDYYmY90baRne3dHSA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: allow returning NULL from crete_address_space
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

On Mon, 9 Sept 2024 at 13:34, Konrad Dybcio <konradybcio@kernel.org> wrote:
>
> On 8.09.2024 7:59 PM, Dmitry Baryshkov wrote:
> > Under some circumstance
>
> Under what circumstances?
>
> This branch is only taken if there's a .create_private_address_space
> callback and it only seems to be there on a[67]xx.

Existing code doesn't. I stumbled upon it while debugging private
address space translation. And that's why I wrote 'it might be
required' rather than 'the function returns'.
So yes, there is no issue with the current code. And at the same time
not having this in place makes debugging more difficult.


> a6xx_create_address_space returns:
>
> - an ERR_PTR if msm_iommu_pagetable_create() fails
> - retval of msm_gem_address_space_create() otherwise
>    - retval of msm_iommu_pagetable_create() is nullchecked here
>      again because we apparently we want to be double sure
>    - err_ptr(-enomem) is returned if allocating aspace fails
>    - otherwise aspace is allocated somewhere
>
> Konrad



-- 
With best wishes
Dmitry
