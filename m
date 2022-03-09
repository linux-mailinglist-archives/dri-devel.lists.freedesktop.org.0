Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 739D64D3A52
	for <lists+dri-devel@lfdr.de>; Wed,  9 Mar 2022 20:25:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA36B10E3E6;
	Wed,  9 Mar 2022 19:25:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA4C110E3FC
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Mar 2022 19:25:39 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id m12so4155720edc.12
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Mar 2022 11:25:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=A9Y6szzvKtNHoFGCjb1F/maZTq9LGD/L2oPRd71PbSg=;
 b=loJ4PyWWDk+MnjSEe9xkYcUQ+ARkCw/t7ZO5FrgFH/jEsHuyJEpg3AKAsftIm6OkSn
 ZRp+5pjqcNtZj+sXo8p4FlSS7uN+9Li5sNb+nDLHkgqHcpj7hz2YkjJ+ICsNao3JJyk/
 tCrtC1n8SySLdhq5cUehTSAY6gRAqJHpgfNu4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=A9Y6szzvKtNHoFGCjb1F/maZTq9LGD/L2oPRd71PbSg=;
 b=B8ZddMErFxP48AabaMrT/EHo/HD+/lEdum22B3vt+kBO33klvSX3JOSMgtVMJ3nt5N
 BGdTQq7/GIs3gj2AWDHiCyALA8YcPaDvPA0Z8JHCrvzxECIX4XKqdZsOYn3NJlU+tsZl
 snMFWFutsuDewyVWKQR85AFJgg+VuIJXzADWRD7aruaS37En3tUXKO9PrYRkNkI+goEX
 DDhnhsz5CLrEHCuf1p4UrKjLx46yLssN7t14fosOZvgTPkia+wXAa868GEc22LZY3W3C
 Y0bRgt3NoVJJhyeiHaJKnm1hHW3+NNL52RdE+5YrdQifIkfitIpiFVhu8rOha5Y8FhYr
 5OAg==
X-Gm-Message-State: AOAM5310dz1R0a2qUs0KbSAGt/94kWe75FUrxn4q5jA7kfm/Phq4HJIb
 73c/XSd0U1RcfJUrNzQnYtmaCRVVsqRZ8kdx
X-Google-Smtp-Source: ABdhPJyNj6vOq0xf2InBgiDEi9+3TSOoyS0f6wj+7796wkKc+/PCGHkizoJW42q30eqISHxzKy4Jiw==
X-Received: by 2002:a05:6402:1e89:b0:416:a641:9fe with SMTP id
 f9-20020a0564021e8900b00416a64109femr979554edf.312.1646853938052; 
 Wed, 09 Mar 2022 11:25:38 -0800 (PST)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com.
 [209.85.221.53]) by smtp.gmail.com with ESMTPSA id
 u24-20020a1709064ad800b006d70e40bd9esm1091981ejt.15.2022.03.09.11.25.37
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Mar 2022 11:25:37 -0800 (PST)
Received: by mail-wr1-f53.google.com with SMTP id r6so4192768wrr.2
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Mar 2022 11:25:37 -0800 (PST)
X-Received: by 2002:a5d:5232:0:b0:1f7:7c4c:e48 with SMTP id
 i18-20020a5d5232000000b001f77c4c0e48mr811587wra.679.1646853936582; Wed, 09
 Mar 2022 11:25:36 -0800 (PST)
MIME-Version: 1.0
References: <1646758500-3776-1-git-send-email-quic_vpolimer@quicinc.com>
 <1646758500-3776-6-git-send-email-quic_vpolimer@quicinc.com>
In-Reply-To: <1646758500-3776-6-git-send-email-quic_vpolimer@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 9 Mar 2022 11:25:24 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WFairiQF2zWc637Z+H61rX4Ar-E9ufG1fMctEk9E_xTg@mail.gmail.com>
Message-ID: <CAD=FV=WFairiQF2zWc637Z+H61rX4Ar-E9ufG1fMctEk9E_xTg@mail.gmail.com>
Subject: Re: [PATCH v5 5/5] drm/msm/disp/dpu1: set mdp clk to the maximum
 frequency in opp table during probe
To: Vinod Polimera <quic_vpolimer@quicinc.com>
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
Cc: quic_kalyant@quicinc.com,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, Mar 8, 2022 at 8:55 AM Vinod Polimera <quic_vpolimer@quicinc.com> wrote:
>
> use max clock during probe/bind sequence from the opp table.
> The clock will be scaled down when framework sends an update.
>
> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 3 +++
>  1 file changed, 3 insertions(+)

In addition to Dmitry's requests, can you also make this patch #1 in
the series since the DTS stuff really ought to come _after_ this one.

...and actually, thinking about it further:

1. If we land this fix, we actually don't _need_ the dts patches,
right? Sure, the clock rate will get assigned before probe but then
we'll change it right away in probe, right?

2. If we land the dts patches _before_ the driver patch then it will
be a regression, right?

3. The dts patches and driver patch will probably land through
separate trees. The driver patch will go through the MSM DRM tree and
the device tree patches through the Qualcomm armsoc tree, right?


Assuming that the above is right, we should:

1. Put the driver patch first.

2. Remove the "Fixes" tag on the dts patches. I guess in theory we
could have a FIxes tag on this patch?

3. Note in the dts patches commit messages that they depend on the driver patch.

4. Delay the dts patches until the driver change has made it to mainline.

Does that sound reasonable?
