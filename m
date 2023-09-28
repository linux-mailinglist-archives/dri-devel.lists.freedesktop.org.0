Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 766577B2536
	for <lists+dri-devel@lfdr.de>; Thu, 28 Sep 2023 20:24:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8301C10E07A;
	Thu, 28 Sep 2023 18:24:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BDBB10E07A;
 Thu, 28 Sep 2023 18:24:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 5D6F5B81CBF;
 Thu, 28 Sep 2023 18:24:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDDD4C433C7;
 Thu, 28 Sep 2023 18:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695925487;
 bh=h9io9sW/9EKNfXuhbVDmG/ERea8sgTVkea3CXbxpcMM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=aAdZvCdpTxtSZe7T3jbt37NB8EhqfCnx/8i1HWRu9uqCjCUq7iPbdaQ4od2pz/EKo
 cR/ZfEwnJ6heg0PqVJCAqwE9llx6nUjocN7gHvKhcMBSd7KZhF2AIdPZw6liFjPj1Q
 sbuN88hyxQdkcRYBeSsqvCzJ9DN9zQwoEJktVc52eymvWE8jtCSLCTQJ0DaH5setXF
 kcJbpWcXJHnDdk+tpvsOr4c3kOzc8LkLxpfk+K9qZq0Hx5Go+yJWYj0qwpLYg969CE
 59qxx2dg0VoX/96mNpYEWsboAtdT+nLVsiRWUt0cnKVSg06WS+a5QRc4trB775fjxn
 FbC2Kkym6D08A==
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-5043a01ee20so18909944e87.0; 
 Thu, 28 Sep 2023 11:24:47 -0700 (PDT)
X-Gm-Message-State: AOJu0Yy7S4Dq3+YMvAWc8hwhhRC+pHmjlZ1a/wFeGX0YwdTS5Fr05HGA
 yQ6dHVRLXpnZIQlQgEJR7ci4DANDHRuN9an73A==
X-Google-Smtp-Source: AGHT+IFIjVbmeOmoi1Ex9wWzryBy0huO5vhLMaCPZ42y3Diqs0tyk+JP/B6O/jxBFtqJcFlDkre6GZiUXkBPfrtKulA=
X-Received: by 2002:a05:6512:234a:b0:500:7fc1:414b with SMTP id
 p10-20020a056512234a00b005007fc1414bmr2158838lfu.25.1695925485862; Thu, 28
 Sep 2023 11:24:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230723-sm6125-dpu-v4-0-a3f287dd6c07@somainline.org>
 <20230723-sm6125-dpu-v4-17-a3f287dd6c07@somainline.org>
In-Reply-To: <20230723-sm6125-dpu-v4-17-a3f287dd6c07@somainline.org>
From: Rob Herring <robh+dt@kernel.org>
Date: Thu, 28 Sep 2023 13:24:33 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJymkURYKONU4b9g7QHi7LzpbhLmo8i1WEHy995vfdS6w@mail.gmail.com>
Message-ID: <CAL_JsqJymkURYKONU4b9g7QHi7LzpbhLmo8i1WEHy995vfdS6w@mail.gmail.com>
Subject: Re: [PATCH v4 17/17] arm64: dts: qcom: sm6125-seine: Configure MDSS, 
 DSI and panel
To: Marijn Suijten <marijn.suijten@somainline.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Sean Paul <sean@poorly.run>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Loic Poulain <loic.poulain@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jul 23, 2023 at 11:09=E2=80=AFAM Marijn Suijten
<marijn.suijten@somainline.org> wrote:
>
> Enable MDSS and DSI, and configure the Samsung SOFEF01-M ams597ut01
> 6.0" 1080x2520 panel.
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>  .../dts/qcom/sm6125-sony-xperia-seine-pdx201.dts   | 59 ++++++++++++++++=
++++++
>  1 file changed, 59 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sm6125-sony-xperia-seine-pdx201.dts=
 b/arch/arm64/boot/dts/qcom/sm6125-sony-xperia-seine-pdx201.dts
> index 82b0da5bb794..62c3e6d8147c 100644
> --- a/arch/arm64/boot/dts/qcom/sm6125-sony-xperia-seine-pdx201.dts
> +++ b/arch/arm64/boot/dts/qcom/sm6125-sony-xperia-seine-pdx201.dts
> @@ -179,6 +179,43 @@ &i2c3 {
>         /* Cirrus Logic CS35L41 boosted audio amplifier @ 40 */
>  };
>
> +&mdss {
> +       status =3D "okay";
> +};
> +
> +&mdss_dsi0 {
> +       vdda-supply =3D <&pm6125_l18>;
> +       status =3D "okay";
> +
> +       panel@0 {
> +               compatible =3D "samsung,sofef01-m-ams597ut01";

This needs to be documented.

Rob
