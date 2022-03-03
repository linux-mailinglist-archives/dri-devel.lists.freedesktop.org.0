Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE1994CC7F1
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 22:23:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CAEA10EDF5;
	Thu,  3 Mar 2022 21:23:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6056B10EDF5
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Mar 2022 21:23:08 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id
 w3-20020a056830060300b005ad10e3becaso5737236oti.3
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Mar 2022 13:23:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=7SgYE66lSNBfbXKtYfPMd2eJnZt2Qn9IBmBY69OkvEA=;
 b=c52FFpOC3IxjlPN+Nc7NzY/iyzvsZNDOgW787F/Z/O1kbfR1FINg/yN3D3g9pSTbn1
 Z1WmCOZw0/B0jL501VnE78SO4m/3NAkK5Sf7tfJwh+fUBxvsu6k4sDzrzklX/73lba+A
 5O7cTjy06XwKfomgibRsaCoG8vXusZ+PyNcuQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=7SgYE66lSNBfbXKtYfPMd2eJnZt2Qn9IBmBY69OkvEA=;
 b=pRFAw7le7stxh7sou4RXe1kJ72OIQj0QBXYxKYT5bLLzX1tHf+ug3VyOhyi1INaHh0
 KDJ09A8y/8Ic9/+SUjbSel25J8Jt9jtXeET1al+zLM/ArMDS1PC2Wrhkkiv5ygGwGfGh
 IwaA7HGDgAT9EkEHqS3PIeUTEdKD21mWMs17nMK8lWKofyEAM1/tNgNk+UtfzVIcT+bW
 8DY4iOGwDP7wXTAVl3nQZmB3YkjkdEuMYtBtN+2/GKOlhZeUW6jhGJtJzqSxj2J9hvr0
 qA/3IvMQv53Ojw0unv5W0IKMIbD1jPLuuUbWzzsBLLFAzoIGiuc90JyuA5IG0qsru2qs
 NIuA==
X-Gm-Message-State: AOAM5310aqNkywBU4qe8F5xs3T1zlcVt1lWON1cpDsjmsBrs/MsdtNRi
 Dy7Kfk4EFPuQjLiFu2c5Hbq6tr9AKLnM8KNqEjm1dz8A4dY=
X-Google-Smtp-Source: ABdhPJzKDqUE8CMsgi/yYVdb41bUuclCz1cIqjPcyZGDL4j77+L3k0NvYP8fE3Y23DScOxA2sEpMU/dHPZTeU3/V3IE=
X-Received: by 2002:a4a:a9cf:0:b0:2e9:5c75:e242 with SMTP id
 h15-20020a4aa9cf000000b002e95c75e242mr19679471oon.25.1646342577179; Thu, 03
 Mar 2022 13:22:57 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 3 Mar 2022 13:22:56 -0800
MIME-Version: 1.0
In-Reply-To: <20220217043148.480898-1-dmitry.baryshkov@linaro.org>
References: <20220217043148.480898-1-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 3 Mar 2022 13:22:56 -0800
Message-ID: <CAE-0n50+s_FSgV5q21DduC4=QFWhsO6WPqENJyM7xF218ec7Cw@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] drm/msm/dpu: simplify IRQ helpers
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-02-16 20:31:42)
> This is the second part of
> https://patchwork.freedesktop.org/series/91631/ reworked and cleaned up.
>
> Changes since v1:

v2?

>  - Fix warning ins dpu_trace.h related to
>    dpu_core_irq_unregister_callback event

Any plans to migrate to hierarchical irqchip in here?
