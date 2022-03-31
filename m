Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA8524EE4A6
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 01:23:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF49910E32B;
	Thu, 31 Mar 2022 23:23:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBF8110E32B
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 23:23:21 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id j15so2346441eje.9
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 16:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7juVurgjLt3GvUzI9U9c+xp5sahJ/Uk+aOlgugxy0EM=;
 b=RtJix/BsoQj0ELH2OMFl7dwsORWQLL0UBqSXWJr5KoYLICZZbVFRb/zdCkHwWWysN5
 3b5vtLz0FaF+JGho0PKGYaYoz18U0Fy53xtgtIwoMITco5McP4KTTF/FQkbhfbr91SR4
 pxJraAJYBLjynqhNcmQ0n9QTPBRiLktURUGCg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7juVurgjLt3GvUzI9U9c+xp5sahJ/Uk+aOlgugxy0EM=;
 b=DeVOoZZQMRRaxhVBKcL7uCFv8OXirhm70AHMhl2tRTxMpX9AcGCZlCJRaVVk6MpjlV
 Z0qS7RXDNEU7bO+2a10dqPOjmNezoioFvv4FziGobIDQI9yBXCbgRqSpJLfBBz0n8fXT
 wTvpnD5oQYW+Sv9teoRa6w2qcHdm0vsBZxzaGrPtP3tZNsIojoqh/06pB40WtIap+FWn
 8DhAmPofALyu5vJCv1Ro1iY1AN6G/INfKC73LR9vHeo/AaTZNGNx/is6YDWsexD5iMzq
 EnRXPVYUhsBI5eytpemND2HKdvbPay1q8RKoz4yVRFwK0PgGYZr2GM9uy0QfPmAMGU4m
 iiSQ==
X-Gm-Message-State: AOAM533NQPOX3y5/bv1J8vZUboALbqukISX1rhk9oddVvIdqATRelzJw
 46q4+8yWksS2DHZQmToHk7JguYXlZyLljyX3
X-Google-Smtp-Source: ABdhPJzxgNr+hBe8aNCbKkzBDuhP7uB/iYWICh7leO8JsEiIM2IISQAFrNxU6dAwGAmR/nrKRHaOpg==
X-Received: by 2002:a17:907:7214:b0:6dd:e8fe:3e9 with SMTP id
 dr20-20020a170907721400b006dde8fe03e9mr7077656ejc.51.1648769000021; 
 Thu, 31 Mar 2022 16:23:20 -0700 (PDT)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com.
 [209.85.221.49]) by smtp.gmail.com with ESMTPSA id
 ky5-20020a170907778500b006d1b2dd8d4csm320242ejc.99.2022.03.31.16.23.18
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Mar 2022 16:23:19 -0700 (PDT)
Received: by mail-wr1-f49.google.com with SMTP id h23so1796571wrb.8
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 16:23:18 -0700 (PDT)
X-Received: by 2002:adf:e7cd:0:b0:204:ba2:b106 with SMTP id
 e13-20020adfe7cd000000b002040ba2b106mr5551021wrn.679.1648768998053; Thu, 31
 Mar 2022 16:23:18 -0700 (PDT)
MIME-Version: 1.0
References: <1648656179-10347-1-git-send-email-quic_sbillaka@quicinc.com>
 <1648656179-10347-6-git-send-email-quic_sbillaka@quicinc.com>
In-Reply-To: <1648656179-10347-6-git-send-email-quic_sbillaka@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 31 Mar 2022 16:23:05 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Wn-XypjRcw-D0VtBHZbuTz=RHiMq6RCHCa=CWmZM42nQ@mail.gmail.com>
Message-ID: <CAD=FV=Wn-XypjRcw-D0VtBHZbuTz=RHiMq6RCHCa=CWmZM42nQ@mail.gmail.com>
Subject: Re: [PATCH v6 5/8] drm/msm/dp: prevent multiple votes for dp resources
To: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
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
Cc: quic_kalyant <quic_kalyant@quicinc.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 quic_vproddut <quic_vproddut@quicinc.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>,
 Sean Paul <seanpaul@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, quic_aravindh@quicinc.com,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Mar 30, 2022 at 9:04 AM Sankeerth Billakanti
<quic_sbillaka@quicinc.com> wrote:
>
> The aux_bus support with the dp_display driver will enable the dp
> resources during msm_dp_modeset_init. The host_init has to return early
> if the core is already initialized to prevent putting an additional vote
> for the dp controller resources.
>
> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)

I'm not a huge fan of this but I'll leave it up to Dmitry. In general
it feels like there should be _a_ place that enables these resources.
Checks like this make it feel like we just scattershot enabling
resources in a bunch of random places instead of coming up with the
design for enabling them in the right place.

In any case, if we do end up landing this patch, it sure feels like it
needs to move earlier in the patch series, right? This patch shouldn't
hurt even without the other patches in the series but if you apply the
earlier patches in the series without this one then you'll have a bug,
right? That means this needs to come earlier.

-Doug
