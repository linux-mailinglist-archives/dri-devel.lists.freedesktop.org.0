Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 937BD742651
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jun 2023 14:26:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FEFF89798;
	Thu, 29 Jun 2023 12:26:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D009F10E1B1
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jun 2023 12:26:45 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id
 46e09a7af769-6b74b37fbe0so533573a34.1
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jun 2023 05:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688041604; x=1690633604;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=NIk8wJfpH3/FAkecZSGRLuKhBChqs6CWPQ8UTS6BFyg=;
 b=eR/kPUuAd3/af7k4Nbz4TVTCdX1xjvfgAzUSaztt8l1P+l5BEnIae3/gvu6h42hE9G
 /Rs6xuuqPGj78oHLv5cIKvQARlFXqgJwJM5S5bOcoJQfSaUkWsfoHJIYZveMMkzDzWnm
 VJgk/NyNwVcs5RHGSeI7AjySTjefoggCBomRpr3ldjA8sVbPV5XkELdSZwL/SyNY6c5w
 6ipHpivvrUEDvJIUhAPNOGe+ZvWVf6sYKZGCAhGT5uFL+BQTGKt4OZlV0U5rrbcAlDTM
 nv8YkIs7PJpCXyqGsH2qJsGh7itojyBM88kqCe4nyFOShcmW/UhHIJQhh48mqPpMHOEN
 UpUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688041604; x=1690633604;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NIk8wJfpH3/FAkecZSGRLuKhBChqs6CWPQ8UTS6BFyg=;
 b=D2SWbGD4RoLijoFm4jJxHx9+q2ryup5Q9ldMLk1/WANwcVwr3O8ukZLgY7IOoSAC+G
 v0m8lbYrlRq4cgQD3t+8wMumPZqCqx9W1mxiqnsXYfcOqkQev/Ys1vKjoFt3w/5IDyIs
 LXwvCNDpVsoAmxnwTWFaFAr7RVprDMFSqeUJkRAIarssXMdqyYqCjoEWKxXoO2q8unc5
 Znjqrsip1l6+9WPXaS36b2g3wTbhZUhOOmOrhoOnRnY9omPWrR3Y4z2FlLatbsiKtvBK
 R+a5wT5iVqZBCTXLNjJ4w8Z7zpmI+hM8dlF6L1iqhayrVsUmZMRxQXFlOEJxRkpHEisX
 3eMg==
X-Gm-Message-State: AC+VfDyH/fl48enOawezOfys+J0RbB9aKfF8d9IitI3MHPxnXHFDtoNB
 qWroZmjzjk70XrjWF1PRT5yiWx8H7k01de/NJEcTjg==
X-Google-Smtp-Source: ACHHUZ7elJFZUK/QSAojN3eXj6aPyhL1NPR9xEeFzIAo7HV9CqflV2dOYJOUp8Wkhr8zxc0HCzV1+n6otclDt9K3gI0=
X-Received: by 2002:a05:6359:601:b0:134:d0d0:c5f1 with SMTP id
 eh1-20020a056359060100b00134d0d0c5f1mr6107800rwb.19.1688041604413; Thu, 29
 Jun 2023 05:26:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230627-sm6125-dpu-v2-0-03e430a2078c@somainline.org>
 <20230627-sm6125-dpu-v2-12-03e430a2078c@somainline.org>
 <84eb1d40-436b-a5b4-a4e3-75a511ad5a90@linaro.org>
 <st3nrb54zxa5xp7qqkdyygf7t6ucgzl3xc5w6d426xy6udj4fx@puakunoaoj2l>
In-Reply-To: <st3nrb54zxa5xp7qqkdyygf7t6ucgzl3xc5w6d426xy6udj4fx@puakunoaoj2l>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 29 Jun 2023 15:26:33 +0300
Message-ID: <CAA8EJpqHh4ZWZxuRMLN2z8BZYFqzoWxZV=oW1ANzEJy4i-PWNw@mail.gmail.com>
Subject: Re: [PATCH v2 12/15] arm64: dts: qcom: sm6125: Switch fixed xo_board
 clock to RPM XO clock
To: Marijn Suijten <marijn.suijten@somainline.org>
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
Cc: Michael Turquette <mturquette@baylibre.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, dri-devel@lists.freedesktop.org,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-clk@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Andy Gross <agross@kernel.org>, Lux Aliaga <they@mint.lgbt>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>, Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Sean Paul <sean@poorly.run>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Loic Poulain <loic.poulain@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jami Kettunen <jami.kettunen@somainline.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 29 Jun 2023 at 15:09, Marijn Suijten
<marijn.suijten@somainline.org> wrote:
>
> On 2023-06-29 13:55:28, Dmitry Baryshkov wrote:
> > On 27/06/2023 23:14, Marijn Suijten wrote:
> > > We have a working RPM XO clock; no other driver except rpmcc should be
> > > parenting directly to the fixed-factor xo_board clock nor should it be
> > > reachable by that global name.  Remove the name to that effect, so that
> > > every clock relation is explicitly defined in DTS.
> > >
> > > Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> > > Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> > > ---
> > >   arch/arm64/boot/dts/qcom/sm6125.dtsi | 7 ++++---
> > >   1 file changed, 4 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/arch/arm64/boot/dts/qcom/sm6125.dtsi b/arch/arm64/boot/dts/qcom/sm6125.dtsi
> > > index 722dde560bec..edb03508dba3 100644
> > > --- a/arch/arm64/boot/dts/qcom/sm6125.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/sm6125.dtsi
> > > @@ -22,7 +22,6 @@ xo_board: xo-board {
> > >                     compatible = "fixed-clock";
> > >                     #clock-cells = <0>;
> > >                     clock-frequency = <19200000>;
> > > -                   clock-output-names = "xo_board";
> >
> > Why? I'd say, leave it.
>
> The exact reason is explained in the commit message.

Usually we do no not kill the xo_board name for the sake of anybody
still looking for the old name. Weak argument, I know.

>
> >
> > With that fixed:
>
> Hence I don't think it makes sense to "fix" this.
>
> - Marijn
>
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>



-- 
With best wishes
Dmitry
