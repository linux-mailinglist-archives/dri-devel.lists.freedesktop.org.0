Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9DA0380B1A
	for <lists+dri-devel@lfdr.de>; Fri, 14 May 2021 16:07:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C16CA6EE87;
	Fri, 14 May 2021 14:07:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CEE96EE87;
 Fri, 14 May 2021 14:07:42 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 400986145B;
 Fri, 14 May 2021 14:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621001262;
 bh=Oj6EqcJGVRl7HQLLBeUi7iUE3kzn01uiwQ60mMnabr0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ZlvUVT7SuAyt9VcldCYSCodBCYYmchAiHGOH88ZC3CB0+UFIZv0AJ9zb9qd+KBO1I
 YAQo4Q+T2/o3NFR+yQvf6S3LOWBhlcp7VceLZeVfKnKWr3yHrhkSd4WI1bRDXufktZ
 MEFGb3k2J5zNmNjroisDYeT+WnzSet4yfgDwWup90y4YAqjtrBVq41cf3iy6yE6Y31
 88cnCbKWEByqPikwUdEN5pr2QWM1JArNT2yweWdf02Z+2EWKuPDifFuTFRZD9lT7UV
 kr1eKHE71qNPiSEZ7rWbiWGc5b/ppbA+cdYrHIpaHzUPCifaW1I9eaxHB3gTywS7C0
 MOVNhra/j6G/Q==
Received: by mail-ed1-f44.google.com with SMTP id r11so10803040edt.13;
 Fri, 14 May 2021 07:07:42 -0700 (PDT)
X-Gm-Message-State: AOAM533jjKG/miPjwW1aEU3Olve7msjeuJoos8ehZodTl/2PAVOJFDzx
 Y0ZHy+VQOPxIPSa6xqq9KOePAhepzVQZmXXmpg==
X-Google-Smtp-Source: ABdhPJxS5DE6zdpF8zsbOt/jb2GTOdzIFwXPWkfoHTlXpR26d8eKqzJ4NSveJ/zw/8+SAiTELXptXb98kelnX61fB1A=
X-Received: by 2002:a05:6402:234b:: with SMTP id
 r11mr56322652eda.137.1621001260779; 
 Fri, 14 May 2021 07:07:40 -0700 (PDT)
MIME-Version: 1.0
References: <1617620770-26202-1-git-send-email-mkrishn@codeaurora.org>
 <1617620770-26202-2-git-send-email-mkrishn@codeaurora.org>
 <20210408150300.GA1476562@robh.at.kernel.org>
 <827048554933585f4cc42c94aa911e55@codeaurora.org>
In-Reply-To: <827048554933585f4cc42c94aa911e55@codeaurora.org>
From: Rob Herring <robh@kernel.org>
Date: Fri, 14 May 2021 09:07:28 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJCFNToWYUxGnWaA=EaRv5rPfWDsF_DDt6a-w=RzBTKHQ@mail.gmail.com>
Message-ID: <CAL_JsqJCFNToWYUxGnWaA=EaRv5rPfWDsF_DDt6a-w=RzBTKHQ@mail.gmail.com>
Subject: Re: [PATCH v15 2/4] dt-bindings: msm: dsi: add yaml schemas for DSI
 bindings
To: Krishna Manikandan <mkrishn@codeaurora.org>
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
Cc: Sean Paul <sean@poorly.run>, devicetree@vger.kernel.org,
 Doug Anderson <dianders@chromium.org>, Vinod Koul <vinod.koul@linaro.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, khsieh@codeaurora.org,
 Tanmay Shah <tanmay@codeaurora.org>, Kalyan Thota <kalyan_t@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 5, 2021 at 11:11 PM <mkrishn@codeaurora.org> wrote:
>
> On 2021-04-08 20:33, Rob Herring wrote:
> > On Mon, Apr 05, 2021 at 04:36:08PM +0530, Krishna Manikandan wrote:
> >> Add YAML schema for the device tree bindings for DSI

> >> +              data-lanes:
> >> +                $ref: "/schemas/media/video-interfaces.yaml#"
> >
> > Not how this reference works. Look at other examples.
> >
> >> +                description: |
> >> +                  This describes how the physical DSI data lanes are
> >> mapped
> >> +                  to the logical lanes on the given platform. The
> >> value contained in
> >> +                  index n describes what physical lane is mapped to
> >> the logical lane n
> >> +                  (DATAn, where n lies between 0 and 3). The clock
> >> lane position is fixed
> >> +                  and can't be changed. Hence, they aren't a part of
> >> the DT bindings.
> >> +
> >> +                items:
> >> +                  - const: 0
> >> +                  - const: 1
> >> +                  - const: 2
> >> +                  - const: 3
> >
> > If this is the only possible value, why does it need to be in DT?
> Hi Rob,
> These are the possible values:
> -    <0 1 2 3>
> -    <1 2 3 0>
> -    <2 3 0 1>
> -    <3 0 1 2>
> -    <0 3 2 1>
> -    <1 0 3 2>
> -    <2 1 0 3>
> -    <3 2 1 0>
>
> Shall I follow the below mentioned approach for defining these values ?
> oneOf:
>    - items:
>      - const: 0
>      - const: 1
>      - const: 2
>      - const: 3
>    - items:
>      - const: 1
>      - const: 2
>      - const: 3
>      - const: 0
>    - items:
>      - const: 2
>      - const: 3
>      - const: 0
>      - const: 1
>    - items:
>      - const: 3
>      - const: 0
>      - const: 1
>      - const: 2
>    - items:
>      - const: 0
>      - const: 3
>      - const: 2
>      - const: 1
>    - items:
>      - const: 1
>      - const: 0
>      - const: 3
>      - const: 2
>    - items:
>      - const: 2
>      - const: 1
>      - const: 0
>      - const: 3
>    - items:
>      - const: 3
>      - const: 2
>      - const: 1
>      - const: 0

That's too verbose.

maxItems: 4
minItems: 4 (or is less supported?)
items:
  enum: [ 0, 1, 2, 3 ]
