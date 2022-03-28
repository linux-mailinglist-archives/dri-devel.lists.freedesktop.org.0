Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36C8F4E9EE4
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 20:21:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4765E10E16E;
	Mon, 28 Mar 2022 18:21:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A74010E16E;
 Mon, 28 Mar 2022 18:21:50 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7D3D5B811EF;
 Mon, 28 Mar 2022 18:21:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C195C34110;
 Mon, 28 Mar 2022 18:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648491707;
 bh=/hes25yU3YvOd5H4gdqZgtO6BmQMj0GOVhwieQHFZC8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Y3QBOeE45tCdVprMsjGLhZlFYzWBlJSWFm+ayqCtpno9EM3H/L8qTyfR82lNHNj5d
 j3FaXSvSjdUBIZWYEw3TMFnz7Acw/ekopa8kgWViL4E9TYOk7kDHN8iECu6x0Aa9kw
 WeFWsjp0s7xF8A/XERp4kPA7KUuk8NbazZId2klK+rp9jeQvKmTSyIC3+HEX1/BjYN
 +pmQ0Np5twFrrOQUlqXdtUjIwEuZk6Nd6NJl3Fn4ryqacVqt5hn4kScj4xYWV3KJcx
 BMS72Wa/+Imo4F6uxou6AtZjm/BblVKTw3un+ZLzMu0/hmvpLljjE8HjNk7d6XZJmK
 olceDM7ZW4Z/w==
Received: by mail-ej1-f42.google.com with SMTP id yy13so30456207ejb.2;
 Mon, 28 Mar 2022 11:21:47 -0700 (PDT)
X-Gm-Message-State: AOAM530QM8WbzJXc+dMLFEMYEwdQj7mGXqcYb5z9QZpHoYvCRnQY+Z3V
 MKx55vmSq5KTxewXHIvmIkETV8/DT2JDozITCw==
X-Google-Smtp-Source: ABdhPJyBS6Yqu8DRRebdgTJ8I6WtYN5VWc6v7Ptjdf8OtDush1axetkjF2N3WNYaWT7JCDrp9+ia9rMS2pC0YQOyHHg=
X-Received: by 2002:a17:906:5418:b0:6df:a07f:764b with SMTP id
 q24-20020a170906541800b006dfa07f764bmr28174092ejo.27.1648491705248; Mon, 28
 Mar 2022 11:21:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220328152923.90623-1-krzysztof.kozlowski@linaro.org>
 <CAA8EJprWoxWwk5EWEfWdLquPR+2=u6V0-v1-+wHMHOk8HiEyNw@mail.gmail.com>
 <YkHtY9absUjmqmW7@matsya> <12b0056b-8032-452b-f325-6f36037b5a80@linaro.org>
In-Reply-To: <12b0056b-8032-452b-f325-6f36037b5a80@linaro.org>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 28 Mar 2022 13:21:33 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+6rx0UU6ryH+z_8KLQqKKuhTCnh=Oft2F03bcze+EV0Q@mail.gmail.com>
Message-ID: <CAL_Jsq+6rx0UU6ryH+z_8KLQqKKuhTCnh=Oft2F03bcze+EV0Q@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: display: msm: dsi: remove address/size cells
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
Cc: Krishna Manikandan <mkrishn@codeaurora.org>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>, Sean Paul <sean@poorly.run>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 28, 2022 at 12:18 PM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 28/03/2022 19:16, Vinod Koul wrote:
> > On 28-03-22, 19:43, Dmitry Baryshkov wrote:
> >> On Mon, 28 Mar 2022 at 18:30, Krzysztof Kozlowski
> >> <krzysztof.kozlowski@linaro.org> wrote:
> >>>
> >>> The DSI node is not a bus and the children do not have unit addresses.
> >>>
> >>> Reported-by: Vinod Koul <vkoul@kernel.org>
> >>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >>
> >> NAK.
> >> DSI panels are children of the DSI device tree node with the reg = <0>; address.
> >> This is the convention used by other platforms too (see e.g.
> >> arch/arm64/boot/dts/freescale/imx8mq-evk.dts).
> >
> > So we should add reg = 0, i will update my dtsi fix
> >
>
> To "ports" node? No. The reg=0 is for children of the bus, so the
> panels. How to combine both without warnings - ports and panel@0 - I
> don't know yet...

I don't think that should case a warning. Or at least it's one we turn off.

Rob
