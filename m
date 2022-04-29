Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A4151459C
	for <lists+dri-devel@lfdr.de>; Fri, 29 Apr 2022 11:44:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6496910EEFD;
	Fri, 29 Apr 2022 09:44:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com
 [IPv6:2607:f8b0:4864:20::1129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A71310EEFE
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 09:44:40 +0000 (UTC)
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-2ebf4b91212so79507557b3.8
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 02:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WYCGVCEJksGGCdRlgIqjR2lhvuooSLq5edP8oO1Q4Gc=;
 b=qXTCKdPPbH69hhnz+M+TPUAGCmNzy6PuGKgWs0JHwB2aoBg7hrjTPaMZoAoIQDoWSs
 0lmnwzpo47pGHqJUzmoSLgH0xxs4vpYqKs5VaNkLhIjt4xe9NBaCxYnD5rZfSLgbIvMm
 zgsM0ilvnK84KcGPdNndif0vtYd6QRYkZJD3a2KzeKri4hyAji+GDZtusBC2mSHRCr6p
 SHFXwtn+sHZPaLC6Fb5Q0NESuoOi44uDggQGTZz3h/jeU4OWkJiRd3uhm2tuN+g2bh9f
 3Z9w0ZVNZJEs1+L18TcczTi8dfVqr4yn0gF8OPbL3O5iS7U8siW5kSCj9kKn8nzEQQc7
 3MkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WYCGVCEJksGGCdRlgIqjR2lhvuooSLq5edP8oO1Q4Gc=;
 b=wnLiNVG25thP2LS8ivx4bDpYtvHFiGP6kuhtIFGHS+bPneVbeztYWK7cJQpauRHuNU
 nZDTO0YqNcB0XDTD65Ovx8rPkpMms+8iBXs3uzAqVWKMyMumyHqQU8n/wpkyEhvfzFSO
 WiYmdEhvbtWeHyp5RF+sl5uNKj7FQJjR7xmbtlmowniwXrKX7bGkX4NDRPMZCRNkl/th
 4JBpLXfQBGap3/N5r2UxNupu9M6gv/xrLAIUGRO1TY6paPt4WVo2Ymgbcl8KEKaRtdo/
 uEGDlG2N9X9Ijk1qNyI+1TH1Wdhx8kK0V4N92EgsNmS1JQP0WQ+HHqfq6jK2XwvZ3M4O
 AESQ==
X-Gm-Message-State: AOAM532VVkNG41k8dugnrXLXp7kPY87hu6ha/ita0Pjg4JF0NIAgyUnL
 PXZwu3jgAZ+YDIPhuZlMNvrznEPVwU84fJki6GMIow==
X-Google-Smtp-Source: ABdhPJynZzoVZwfjlCOF1/abA7cHNOUV/ui+HyQTclEHfZp0K+s8TqPA+IOfsxjsI1xMK2BMg4DLPDanu12s14nmOyg=
X-Received: by 2002:a81:5603:0:b0:2f8:3187:f37a with SMTP id
 k3-20020a815603000000b002f83187f37amr15645499ywb.255.1651225479645; Fri, 29
 Apr 2022 02:44:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220217055529.499829-1-dmitry.baryshkov@linaro.org>
 <20220217055529.499829-4-dmitry.baryshkov@linaro.org>
 <CAE-0n53wAqV3ttugY+VR_zxdZGZGjbitWOppk1zF-Rp-buiNaA@mail.gmail.com>
In-Reply-To: <CAE-0n53wAqV3ttugY+VR_zxdZGZGjbitWOppk1zF-Rp-buiNaA@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 29 Apr 2022 12:44:28 +0300
Message-ID: <CAA8EJpqCwe_mr60SpFNfK8rE84RoA4EzAaPw-rC-PGmdB99ytQ@mail.gmail.com>
Subject: Re: [PATCH v5 3/5] drm/msm/dp: set stream_pixel rate directly
To: Stephen Boyd <swboyd@chromium.org>
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 29 Apr 2022 at 04:20, Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Dmitry Baryshkov (2022-02-16 21:55:27)
> > The only clock for which we set the rate is the "stream_pixel". Rather
> > than storing the rate and then setting it by looping over all the
> > clocks, set the clock rate directly.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>

Thanks! I think this series can be queued for 5.20 then (probably not
worth rushing it into 5.19)

-- 
With best wishes
Dmitry
