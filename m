Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C0D7CD5A8
	for <lists+dri-devel@lfdr.de>; Wed, 18 Oct 2023 09:48:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 018AD10E3B8;
	Wed, 18 Oct 2023 07:48:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com
 [IPv6:2607:f8b0:4864:20::1131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EC9A10E389
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Oct 2023 07:48:09 +0000 (UTC)
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-5a7c95b8d14so83229657b3.3
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Oct 2023 00:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697615288; x=1698220088; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=f747C4U8IoZwyu+El4waA+++U856sYb0R6YT3hMoxgc=;
 b=xnGtqkyrj492XOZfcK38YykO9f31ty9tTA6PWaNJ6nORerkZxLwAoot1DZ/2TPMroD
 MnJPTdwikL3XPTsoa7ifz+jIgl+It4OLv31FDmGUxaRrPjNDbuNIzfhP1bhlaFKflI8J
 NGWmXEhpK2a6ynXUoLE7PjRICWIqp1m1uBDYqQUSHcsFXIf3j69qjoPzp0+BtHJOJV1T
 Mv5T/p6XwYI1xYZPI8bmjrj/TQNvhGAqf+zLDFwDxZ5wOvsu8CEvaXrqJOStJPTEXW6G
 9UGSE/ZQ6omCEyuwDnpR7ixyPivrwYJMR2uoCYgHQT9V/6jUhA34g6HCBNn7X6M8g4IQ
 2V4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697615288; x=1698220088;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=f747C4U8IoZwyu+El4waA+++U856sYb0R6YT3hMoxgc=;
 b=AM5bey8TybAHZb6MIc9kKBBKbJuQRJApat7Fn1wnqBk2AZim50eOgiZJJafzK9frRZ
 XoFY8Mz0U5YbbsVOYRqDhrq7vF5yL+ysvA2+C24Osyd+EhkT9zpD+j0NPRmSncsg0oxI
 +Pq+A9Uy29O7mMjTVBRH4WdByxYV/gMPpJgtDDLg5ulivEJKHuK8iV2vc804TXtoIcmA
 ukctUZorYvxm9IcX+U6doIhvuFBxZ586MEGqm/spt/KN1oPh2auJaJcg+ZGKhCV9Whwm
 Vo+4lYtqpDWHOPnU4+pbfH+nkV8phfBTKmBPUwFclIvPM7VO1uzg8MMeLCpwui3O+DyY
 9Sig==
X-Gm-Message-State: AOJu0YyxawgieOLEd1XzJq7wMuSxXVyph/oYqrqJyaK73nb/0FINoQA3
 iHj3tOoZuI5xrn8sz8mr9+rCnX6Mp+Qf1R7Rh1q3mwIajmPb80SSxF5Pgg==
X-Google-Smtp-Source: AGHT+IH8nl7SgUpvgBkgQixVGgpK0NMaVDkGMP6hZfYjxi25iLCtiD6oyBiVsBxjJWdcHsNr7ZkLItkk3bbAVEPUkas=
X-Received: by 2002:a0d:cccf:0:b0:5a7:fae6:1cc6 with SMTP id
 o198-20020a0dcccf000000b005a7fae61cc6mr5006410ywd.24.1697615288545; Wed, 18
 Oct 2023 00:48:08 -0700 (PDT)
MIME-Version: 1.0
References: <20231018074627.55637-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20231018074627.55637-1-dmitry.baryshkov@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 18 Oct 2023 10:47:57 +0300
Message-ID: <CAA8EJprdiac17UfMLg-1Kg2urd4PZOs=5DT_1YGrN7u1W0=Bbw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: attach the DP subconnector property
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 18 Oct 2023 at 10:46, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> While developing and testing the commit bfcc3d8f94f4 ("drm/msm/dp:
> support setting the DP subconnector type") I had the patch [1] in my
> tree. I haven't noticed that it was a dependency for the commit in
> question. Mea culpa.

[1] https://patchwork.freedesktop.org/patch/555530/

> Since the patch has not landed yet (and even was not reviewed)
> and since one of the bridges erroneously uses USB connector type instead
> of DP, attach the property directly from the MSM DP driver.
>
> This fixes the following oops on DP HPD event:
>
>  drm_object_property_set_value (drivers/gpu/drm/drm_mode_object.c:288)
>  dp_display_process_hpd_high (drivers/gpu/drm/msm/dp/dp_display.c:402)
>  dp_hpd_plug_handle.isra.0 (drivers/gpu/drm/msm/dp/dp_display.c:604)
>  hpd_event_thread (drivers/gpu/drm/msm/dp/dp_display.c:1110)
>  kthread (kernel/kthread.c:388)
>  ret_from_fork (arch/arm64/kernel/entry.S:858)


-- 
With best wishes
Dmitry
