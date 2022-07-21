Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D5E57CE38
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jul 2022 16:52:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8758510F425;
	Thu, 21 Jul 2022 14:52:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4321610FDE6
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jul 2022 14:52:19 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id ss3so3534172ejc.11
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jul 2022 07:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ltOZJ2KphG0d0DW5kFxQw6cxwCf3XHhnrjNPEB6uAhM=;
 b=GqcHAHQ4dhPcrDRrtzT1QFXBo9SckIDkd5pucGoABBMli/cpoSkioJ6cvz4F17aKpk
 J1b8mXuerCqilCV36ldocszUddyXRxKShRGF06LQ8abRM+DPmjUznZz+quSoY9VeZO6V
 fALHQi/5OCjS8u//p5bgNNYY4BxK08ZdxexH8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ltOZJ2KphG0d0DW5kFxQw6cxwCf3XHhnrjNPEB6uAhM=;
 b=N9/bc8F42FXjB1s9WvEPql3QUE1hu0JKX6tCotCQXI99ybS+agC5anhckNniJDLKPe
 FoGV9QJYtizSrqLZ3dYDXU1yfbYfYnprgUxZAy7TBhGoGQ/vamA3LdmsS0hbcPG5VCxa
 QNwWMvOcS7H8NduGIzQ2sDTzs0147XpxGRQyom+99ZvrVU3xQMPa3UiAxaJYnO8z6dkB
 qTSci9qYNSf2T7ilj1madouPA82uIim5ED/fQqWzyd2lBfiCkWoNm33gLazbFSbO/mdR
 t7Byt919k43BFuwh27+WBzBaU3W1tkVthMjygXoJWRX3e+zzBOZRzX42nbeva907v3ta
 8yQQ==
X-Gm-Message-State: AJIora9uxVLjZBKIkipfT8oHb4zeicRp/XdxdF5+kSNqOmO+dOCCvhXf
 ivrbsx8Z65Z+2TAmOlUaUKZbL31gEkJNQlh/cwE=
X-Google-Smtp-Source: AGRyM1ttqoNRxVzwPjbJkDkjprGQJSuogILM9J6Zm7eGJzFQHjxgmdGMaIzaFOnxrINyChEjzaTOpQ==
X-Received: by 2002:a17:907:9608:b0:72f:4b13:c66c with SMTP id
 gb8-20020a170907960800b0072f4b13c66cmr14502048ejc.531.1658415137539; 
 Thu, 21 Jul 2022 07:52:17 -0700 (PDT)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com.
 [209.85.221.44]) by smtp.gmail.com with ESMTPSA id
 f5-20020a50fc85000000b0043bc4b28464sm1105569edq.34.2022.07.21.07.52.15
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Jul 2022 07:52:16 -0700 (PDT)
Received: by mail-wr1-f44.google.com with SMTP id bu1so2619080wrb.9
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jul 2022 07:52:15 -0700 (PDT)
X-Received: by 2002:adf:fb12:0:b0:20c:79b2:a200 with SMTP id
 c18-20020adffb12000000b0020c79b2a200mr35414211wrr.617.1658415135216; Thu, 21
 Jul 2022 07:52:15 -0700 (PDT)
MIME-Version: 1.0
References: <1657038556-2231-1-git-send-email-quic_khsieh@quicinc.com>
 <YtkrDcjTGhpaU1e0@hovoldconsulting.com> <Ytk2dxEC2n/ffNpD@sirena.org.uk>
 <CAD=FV=UQGXqVkew544f3RDtWb3virRHWiafBAxK3ncb5wmVYwQ@mail.gmail.com>
In-Reply-To: <CAD=FV=UQGXqVkew544f3RDtWb3virRHWiafBAxK3ncb5wmVYwQ@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 21 Jul 2022 07:52:01 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WuyKAwLwJ80uv15jBPO=W9F7FGZ4dAci+CncwF0WPfOw@mail.gmail.com>
Message-ID: <CAD=FV=WuyKAwLwJ80uv15jBPO=W9F7FGZ4dAci+CncwF0WPfOw@mail.gmail.com>
Subject: Re: [PATCH v16 0/3] eDP/DP Phy vdda realted function
To: Mark Brown <broonie@kernel.org>
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
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>,
 Liam Girdwood <lgirdwood@gmail.com>, LKML <linux-kernel@vger.kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Jul 21, 2022 at 7:39 AM Doug Anderson <dianders@chromium.org> wrote:
>
> > You could add a way to specify constant base loads in DT on either a per
> > regulator or per consumer basis.
>
> Yes, this please! ...on a per consumer basis. :-) It's been on my
> wishlist for a while and would eliminate a massive amount of code /
> tables in the drivers.
>
> We could debate syntax, but I guess you'd either do it w/ two cells
>
> vdda-phy-supply = <&vdda_mipi_dsi0_1p2 21800>;
>
> ...or with matching properties:
>
> vdda-phy-supply = <&vdda_mipi_dsi0_1p2>;
> vdda-phy-supply-base-load = <21800>;

Ah, sorry to respond to my own thread so quickly, but I just thought
of a reason for the "matching properties" solution instead of the two
cells. It would allow the SoC "dtsi" file to specify a base load while
the board "dts" file can then specify the supply. That feels like it
could be a nice solution.

-Doug
