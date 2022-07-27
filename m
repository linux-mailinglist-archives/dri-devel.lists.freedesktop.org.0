Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F9A58282F
	for <lists+dri-devel@lfdr.de>; Wed, 27 Jul 2022 16:05:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5804990753;
	Wed, 27 Jul 2022 14:05:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68DE9905AC
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jul 2022 14:05:06 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id m8so21508139edd.9
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jul 2022 07:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=zK2lTYN74IqKqZwsLWQgkra8zcwd3I1tBfPS/duxTDE=;
 b=eP1FhJrWO5R/3mIx4/oX2k7sNSEnfKppdcAjLwrGJf5LY+avDukYGRSUnzk2W87wPj
 hqh+0MCjd3iqzYW2AvCBCA4y/gA9838FMw/qMHm6SwHsmzXcPrz1eqeYGjs103YiGO8H
 ld7zOZomaTT3RyGZ9wzl0FMRQLObuHrgpNLcs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=zK2lTYN74IqKqZwsLWQgkra8zcwd3I1tBfPS/duxTDE=;
 b=PWEuHZZABDJY8OPC01SP9MYBqITfpdmBo/O+JY02MOPmI47wBsTPWZoLFHkvTKM5Sk
 /uck6a/LDh38H1y/fqV/+/Qa+eCCIE02v2vJDJEgF2cLpb2cOXonqpEI9cc+Ktisbn6B
 x/hrKD+x++nOOv8qRthA5d2cAUppcgnvewJtUkb2amiZ6NkDZl6y6XJVpwCOrqS1TXov
 hkIRSnByWKfvTuKUedNebnbpB328J9zVJNLYYa/11mLSqLfZ84Cb4Lj8xmGFRec49sLB
 czeoaEqXCS38RqVRvUwh8YDPKlpA/P6U7sII88DZYffTZ+iBgNNp5UqBW1XvYfmK59I3
 a0HQ==
X-Gm-Message-State: AJIora9NB1+dTAVTGFRDHuZ5aS1N1PNQsdnvrc7Dmt76AVZOo7qeqPkh
 EZQ0zGSiG57fNhfBpMUEf+wb359oDD7aMU+3
X-Google-Smtp-Source: AGRyM1uHtdLUZsEoN8zE4nE1LP6d3djAFwzyLNi3xZU2mZLsmdiMTDrqJ5qpw9Y4XrvGuGwDuyuVig==
X-Received: by 2002:a05:6402:388d:b0:43b:a17b:6212 with SMTP id
 fd13-20020a056402388d00b0043ba17b6212mr23521487edb.51.1658930704533; 
 Wed, 27 Jul 2022 07:05:04 -0700 (PDT)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com.
 [209.85.221.50]) by smtp.gmail.com with ESMTPSA id
 q6-20020a056402040600b0043bc33530ddsm10269478edv.32.2022.07.27.07.05.03
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Jul 2022 07:05:03 -0700 (PDT)
Received: by mail-wr1-f50.google.com with SMTP id u5so24402270wrm.4
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jul 2022 07:05:03 -0700 (PDT)
X-Received: by 2002:a05:600c:2e48:b0:3a3:1ce3:3036 with SMTP id
 q8-20020a05600c2e4800b003a31ce33036mr3078599wmf.188.1658930260190; Wed, 27
 Jul 2022 06:57:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220725174810.1.If1f94fbbdb7c1d0fb3961de61483a851ad1971a7@changeid>
 <661fa514-cd37-e062-3294-c844b7f0b894@quicinc.com>
In-Reply-To: <661fa514-cd37-e062-3294-c844b7f0b894@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 27 Jul 2022 06:57:27 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UHhfLn+S8F60EPoC0ip6YzmrihfTz=KmmauXHCxof2QQ@mail.gmail.com>
Message-ID: <CAD=FV=UHhfLn+S8F60EPoC0ip6YzmrihfTz=KmmauXHCxof2QQ@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH] drm/msm/dsi: Don't set a load before
 disabling a regulator
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
Cc: Sean Paul <sean@poorly.run>, Loic Poulain <loic.poulain@linaro.org>,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 Rajeev Nandan <quic_rajeevny@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Mark Brown <broonie@kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Stephen Boyd <swboyd@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, Jul 26, 2022 at 4:53 PM Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> On 7/25/2022 5:49 PM, Douglas Anderson wrote:
> > As of commit 5451781dadf8 ("regulator: core: Only count load for
> > enabled consumers"), a load isn't counted for a disabled
> > regulator. That means all the code in the DSI driver to specify and
> > set loads before disabling a regulator is not actually doing anything
> > useful. Let's remove it.
> >
> > It should be noted that all of the loads set that were being specified
> > were pointless noise anyway. The only use for this number is to pick
> > between low power and high power modes of regulators. Regulators
> > appear to do this changeover at loads on the order of 10000 uA. You
> > would a lot of clients of the same rail for that 100 uA number to
>
> I guess you meant "you would need a lot of clients"

Yeah, sorry. :( I'll fix it up if I need a v3.


> > @@ -259,15 +259,7 @@ static inline struct msm_dsi_host *to_msm_dsi_host(struct mipi_dsi_host *host)
> >   static void dsi_host_regulator_disable(struct msm_dsi_host *msm_host)
> >   {
> It seems like now we can drop this function dsi_host_regulator_disable()
> entirely and just call regulator_bulk_disable() ?

Sure, if you want. One could still argue that it provides a tiny bit
of abstraction and avoids the caller from having to know where to find
the number of regulators and all that, but I can go either way. Is
this worth a v3, do you think? If so, I might tack it on at the end of
the series.

Note that I say "v3" because I actually included this patch in a
larger series and called that series "v2" [1].


[1] https://lore.kernel.org/r/20220726173824.1166873-1-dianders@chromium.org
