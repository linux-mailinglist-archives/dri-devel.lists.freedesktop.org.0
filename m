Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD52757D37F
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jul 2022 20:42:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6387D113235;
	Thu, 21 Jul 2022 18:42:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [IPv6:2607:f8b0:4864:20::72b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4B2910F206
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jul 2022 18:42:01 +0000 (UTC)
Received: by mail-qk1-x72b.google.com with SMTP id o21so1967722qkm.10
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jul 2022 11:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+RQnuRQVAxAGI0N6/NnLGG+FggFTKyFm89xEXb36pkw=;
 b=iyniFeKPwDu5YPSQmW8iQt+xqhxFQoPdxQjdUIgapHfOqPMwIDAiMIsP8KHWWmUUqc
 VBlBRg7crLnY3rJMYSRDh2ATS1OW2p4cK1dEkdliPUAbxZa3mfkqy2FAjNp/eouhe0QV
 BvDeWRn33axasZAOviZ1Vau68l6ZKppGw+WAPxwCd6aEe3VaM3Zz3Q63Gz7OCFFaSflj
 eFsgsWbn2OLOQPDP72jbZ5ZQY168A2emerxJYUpXrhBAJuQBSaQf1ib0yGUzE3yVMJKO
 0fzeU7s5SEoi8OAk5sb9a1b+uvGGEuddx7cfMtcL6lsZetlLUhFLOCseY/xQJFvFLSU9
 RCKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+RQnuRQVAxAGI0N6/NnLGG+FggFTKyFm89xEXb36pkw=;
 b=B/gnYH5h+MnSbHfT9mQifWTBz7XvBqQqQ8AVxECGTgLMPi5JAmynG8gIrnofWkz3u3
 7xTlpqldNzCf6w1h3Mb4kr6cQu+zvxaht5DhYXyu+B7Ca8tD5v21UDtClZ0R7vz1JguF
 3LFJc8vM/ezem9VnQIc5RpMRUQGIotjgeWFXmPGtVQAkxwxpvHuMm7XMz307RxZlOJqv
 KkBT5+VA+2/jVEq5cYdQE5/hR3U3OdYXooXIX22l2dtaGJBGT12aT7lYFVHVAVwX5xrV
 5FBpKGB7t9qEVKTDsI8YPOswaiRr5FNa7VIhq8+x3ieTpD5p6RZF5NHKJtWThqDJV3wl
 rCSw==
X-Gm-Message-State: AJIora9UrKuI9EOIovo2EvAAndCI2EN3Z5MvhCsM3kVG6Y+8yUeM1C8k
 vDtDBcTNUy69R+af35N/HumlPU0giCdmWNuGvGzpEA==
X-Google-Smtp-Source: AGRyM1v29kSP8xawWrXzI8sSr5FM+BvUWfSZ3Fu+pP7hxXeMYCoPETKED42dCZUElsVZdMDlopzzF1/ML7pLO8dDpb0=
X-Received: by 2002:a05:620a:2408:b0:6b6:2df3:d18b with SMTP id
 d8-20020a05620a240800b006b62df3d18bmr55176qkn.203.1658428920842; Thu, 21 Jul
 2022 11:42:00 -0700 (PDT)
MIME-Version: 1.0
References: <1657038556-2231-1-git-send-email-quic_khsieh@quicinc.com>
 <YtkrDcjTGhpaU1e0@hovoldconsulting.com>
 <CAA8EJprQnnWjDZJy9+zUBsVQCi3jtc0Ngtzzk9MXpwOvuAS68g@mail.gmail.com>
 <CAD=FV=W0m-x9JC=5hQ3urSNmUp8sY-u8YkNd66yrKfRNAH4rcg@mail.gmail.com>
In-Reply-To: <CAD=FV=W0m-x9JC=5hQ3urSNmUp8sY-u8YkNd66yrKfRNAH4rcg@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 21 Jul 2022 21:41:49 +0300
Message-ID: <CAA8EJppWeDXAMqYmw6iOs_tr2mpnxmdbSKT79SH9f8=TYaBLnQ@mail.gmail.com>
Subject: Re: [PATCH v16 0/3] eDP/DP Phy vdda realted function
To: Doug Anderson <dianders@chromium.org>
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

On Thu, 21 Jul 2022 at 17:50, Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Thu, Jul 21, 2022 at 6:25 AM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > > This series breaks USB and PCIe for some SC8280XP and SA540P machines
> > > where the DP PHY regulators are shared with other PHYs whose drivers do
> > > not request a load.
> >
> > I'm trying to understand, why does this series cause the regression.
> > Previously it would be the DP controller voting on the regulators
> > load, now it has been moved to the DP/eDP PHYs.
>
> I think in the past not many device trees actually hooked up the
> regulators to the DP/eDP but did hook up the regulators to the PHYs?
> That means they didn't used to get a regulator_set_load() on them and
> now they do?
>
> It should also be noted that we're now setting the load for a bunch of
> USB PHYs that we didn't used to set a load on...

Might be the case, yes.

> > > It seems quite likely that changes like this one affects other systems
> > > too, and the effects may be hard to debug. So a more general solution
> > > than playing whack-a-mole using DT would be good to have.
> >
> > I think enabling a regulator which supports set_load() and without
> > load being set should cause a warning, at least with
> > CONFIG_REGULATOR_DEBUG. WDYT?
>
> I'm not a total fan. I'd love to see evidence to the contrary, but I'm
> a believer that the amount of extra cruft involved with all these
> regulator_set_load() calls is overkill for most cases. All the extra
> code / per-SoC tables added to drivers isn't ideal.

I'm fine with the load being specified in the DT (and that sounds like
a good idea for me too).
What I'd like to achieve is catching load-enabled regulators for which
we did not set the load (via an API call or via the DT).

-- 
With best wishes
Dmitry
