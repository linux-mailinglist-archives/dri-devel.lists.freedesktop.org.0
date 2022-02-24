Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6594C34DE
	for <lists+dri-devel@lfdr.de>; Thu, 24 Feb 2022 19:40:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E30010E1A8;
	Thu, 24 Feb 2022 18:40:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED7EE10E1A8
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Feb 2022 18:40:22 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id k2so4151539oia.2
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Feb 2022 10:40:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to; bh=uGRzeIMR+VJeAhB/Jkzq73lY1AnlrPjfWAcpkdP42pU=;
 b=Emulhj+pUl1q8xm5+STw3amfnxepAxPStDek1bLArh0rgifJ8KEmCLdJrBbNLaDg3v
 uIjVFRoKbK9LkZd2SOkW54xiBub2zZ3djDPX5PgRGh+WN7+gJW7uVAdHrAkGQlKXufIc
 fjKLIZ1xUJ9CnxbZ773JYx2/as5e09kT09V/U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to;
 bh=uGRzeIMR+VJeAhB/Jkzq73lY1AnlrPjfWAcpkdP42pU=;
 b=LC7d11OT41oVWUP+nwdMWOCjohNBvc4OWCTJiEQo12FChljiviGzdKJr5oeZDc3Iqi
 otNMNXA6c+UKnCSin4hk+8ubWG1uEre/0w11jdHMV1v3VBiqiZaX1Oi1ErlcW/hK5pZP
 RXK3pkcNp2dMi05j4ZARtauPtujYSsNlAPyzuuxy32CNjmorcl7d/w4FK/ESLCJb6wtL
 lL/ADCPcGqsW0fQaGdRxLB4eRZeGqvbbmZo/TDPT11++gRJ9WZCmSnS7f+B3xjwxH3NI
 w5FrQKrAw0ZeVxhj8mgGo+rXGkKEvDRKXuzZugkGBGzk+hSTEJhVxodE4K1B/bagtptm
 Rjjw==
X-Gm-Message-State: AOAM53251L3nepmEOtXbiPGOxjq/t4c9lJwlCHTrrIPJRt+xzx2ltKMm
 GmvmrgIiKch/dAZ2Me2tPnjxs6crzYmAPhAHWLdVYQ==
X-Google-Smtp-Source: ABdhPJxGSXx9icgch/oHPPyeetdUeJLtClJklQg0MYVH+QgSlCgW5Pe4J/OdD3j4ytSK1CEKEnbZEf/JOvxQ1sEcNVQ=
X-Received: by 2002:a05:6870:631a:b0:d1:7d97:806 with SMTP id
 s26-20020a056870631a00b000d17d970806mr1778397oao.8.1645728022218; Thu, 24 Feb
 2022 10:40:22 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 24 Feb 2022 10:40:21 -0800
MIME-Version: 1.0
In-Reply-To: <2e1095c2-ae18-b412-3dba-8be6dfcbdc99@quicinc.com>
References: <1645122930-23863-1-git-send-email-quic_khsieh@quicinc.com>
 <1645122930-23863-4-git-send-email-quic_khsieh@quicinc.com>
 <CAE-0n52cz6JibgsJ4MWsdGhAjxHa6en+JbyKjKHVwQDnM8-5Og@mail.gmail.com>
 <e01aefa4-0792-307d-caee-4fb3d2b32a23@quicinc.com>
 <2e1095c2-ae18-b412-3dba-8be6dfcbdc99@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 24 Feb 2022 10:40:21 -0800
Message-ID: <CAE-0n50xBZ3oJgo5EmdJXS1cMGHg1bq3=WhVRcmF1P9gsjqDjw@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] drm/msm/dp: replace DRM_DEBUG_DP marco with
 drm_dbg_dp
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org, airlied@linux.ie,
 bjorn.andersson@linaro.org, daniel@ffwll.ch, dmitry.baryshkov@linaro.org, 
 dri-devel@lists.freedesktop.org, robdclark@gmail.com, sean@poorly.run, 
 vkoul@kernel.org
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

Quoting Kuogee Hsieh (2022-02-24 10:20:31)
> Hi Stephen,
>
> Are you still has concern on this patch?
>

No more concerns.
