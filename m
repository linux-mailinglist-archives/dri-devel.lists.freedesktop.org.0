Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBEF257CE1D
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jul 2022 16:50:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB0B114B490;
	Thu, 21 Jul 2022 14:50:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03ADF18A2CA
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jul 2022 14:50:15 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id z22so2466465edd.6
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jul 2022 07:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pcZOB/ApWbNF0eW5n1wK25WOXQGFTiPvR0q+4tEoNh8=;
 b=G3YMfG/1UshoRnypsy2wF1GATgIebl3pHBLTFzdgoM2X/Uoe71KwDZ1NlkC9aKIHRD
 gssmJqeb6tLPv4PMRn5MOMSkjkFFVPDspiiT/qVNq/GgwUIgVP5mj+QOrgopShFwil+N
 KmGbGJFviFlxnH+lFltHw5UGi4GByFZDZxLjw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pcZOB/ApWbNF0eW5n1wK25WOXQGFTiPvR0q+4tEoNh8=;
 b=wyXzzoHK3MxEVb4i4gs4vZYw1vibZjXaKxgQ7d6lkvO3mRLDrQIrChE/+JoGHrqr/P
 9ZexUS9637JB1T7XRpgBkoMJVDdRQBHBUNemh+JXJFj8p0tIbROtJIlmAxZoYmCEdo9I
 KfnBH8uOyMFa/A8vTcm5EnUE17zEIcvmWl+gxkkJbHqnLx064O9ZW1Yfua4mL7VTvH6O
 diU1LMxey8lAHPI9wTQCI9Wf5gQRqdkPa7XMiMFtT5FzhnWVfn6WnByCsETn6Jdlm0V/
 m4V57sk+aZznBlknbUwr1J751XpcRutBMUUg8BccAjAetkowURMfrKs7GmqAkREj7T2R
 JBEw==
X-Gm-Message-State: AJIora9XkJLNiAQnDwims6uGObJBC7T3N+19XnXeh+IYQ/0CPqFpv5Ig
 9aXYC1E/dsWJV5e0YaAeQrG5ekyuZojntwU1DvY=
X-Google-Smtp-Source: AGRyM1t44BFeLDbbUyxsk8HUr637PTU1muZzuh5x6IZA0GS6OsLWWLERdg6BhTYovSf0NGKo8US5LA==
X-Received: by 2002:a05:6402:1f13:b0:43b:c521:8de7 with SMTP id
 b19-20020a0564021f1300b0043bc5218de7mr4410771edb.79.1658415013219; 
 Thu, 21 Jul 2022 07:50:13 -0700 (PDT)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com.
 [209.85.221.47]) by smtp.gmail.com with ESMTPSA id
 w23-20020a17090649d700b0072b33e91f96sm922050ejv.190.2022.07.21.07.50.10
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Jul 2022 07:50:11 -0700 (PDT)
Received: by mail-wr1-f47.google.com with SMTP id bk26so2607354wrb.11
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jul 2022 07:50:10 -0700 (PDT)
X-Received: by 2002:a5d:5889:0:b0:21d:bccd:38e3 with SMTP id
 n9-20020a5d5889000000b0021dbccd38e3mr34236872wrf.659.1658415009781; Thu, 21
 Jul 2022 07:50:09 -0700 (PDT)
MIME-Version: 1.0
References: <1657038556-2231-1-git-send-email-quic_khsieh@quicinc.com>
 <YtkrDcjTGhpaU1e0@hovoldconsulting.com>
 <CAA8EJprQnnWjDZJy9+zUBsVQCi3jtc0Ngtzzk9MXpwOvuAS68g@mail.gmail.com>
In-Reply-To: <CAA8EJprQnnWjDZJy9+zUBsVQCi3jtc0Ngtzzk9MXpwOvuAS68g@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 21 Jul 2022 07:49:55 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W0m-x9JC=5hQ3urSNmUp8sY-u8YkNd66yrKfRNAH4rcg@mail.gmail.com>
Message-ID: <CAD=FV=W0m-x9JC=5hQ3urSNmUp8sY-u8YkNd66yrKfRNAH4rcg@mail.gmail.com>
Subject: Re: [PATCH v16 0/3] eDP/DP Phy vdda realted function
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
Cc: Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 David Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Johan Hovold <johan@kernel.org>,
 "Aravind Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Andy Gross <agross@kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 Stephen Boyd <swboyd@chromium.org>, Mark Brown <broonie@kernel.org>,
 Sean Paul <sean@poorly.run>, Vinod Koul <vkoul@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, LKML <linux-kernel@vger.kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Jul 21, 2022 at 6:25 AM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> > This series breaks USB and PCIe for some SC8280XP and SA540P machines
> > where the DP PHY regulators are shared with other PHYs whose drivers do
> > not request a load.
>
> I'm trying to understand, why does this series cause the regression.
> Previously it would be the DP controller voting on the regulators
> load, now it has been moved to the DP/eDP PHYs.

I think in the past not many device trees actually hooked up the
regulators to the DP/eDP but did hook up the regulators to the PHYs?
That means they didn't used to get a regulator_set_load() on them and
now they do?

It should also be noted that we're now setting the load for a bunch of
USB PHYs that we didn't used to set a load on...


> > It seems quite likely that changes like this one affects other systems
> > too, and the effects may be hard to debug. So a more general solution
> > than playing whack-a-mole using DT would be good to have.
>
> I think enabling a regulator which supports set_load() and without
> load being set should cause a warning, at least with
> CONFIG_REGULATOR_DEBUG. WDYT?

I'm not a total fan. I'd love to see evidence to the contrary, but I'm
a believer that the amount of extra cruft involved with all these
regulator_set_load() calls is overkill for most cases. All the extra
code / per-SoC tables added to drivers isn't ideal.

Every single LDO on Qualcomm's PMICs seems to be able to be set in
"high power mode" and "low power mode", but I think the majority of
clients only really care about two things: on and in high power mode
vs. off. I think the amount of stuff peripherals can do in low power
mode is super limited, so you have to be _really_ sure that the
peripheral won't draw too much current without you having a chance to
reconfigure the regulator.

Of course, if the load could be easily specified in the device tree
and we could get rid of all the cruft in the drivers then maybe that
would be OK.

-Doug
