Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA3E651019
	for <lists+dri-devel@lfdr.de>; Mon, 19 Dec 2022 17:16:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 718FD10E2C3;
	Mon, 19 Dec 2022 16:16:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B11C110E2D5
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Dec 2022 16:16:07 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id s186so8236562oia.5
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Dec 2022 08:16:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=t1fQ3HMUMjTYp4HukGDzZcKzvdvCdzA+hW6xmFvbLbk=;
 b=mawyphQIqE/IdbX4iuJqDAYHDp5dpI18h3M1s3GRCCdPuxswNYEyIw5fHZQFOnfCY6
 FpWMaNjIDZm3APc6kJC+1BW7xR4j+GQjkB8yxswZCpxJYY9aMDZ8fTW/T1TCpcB9691x
 9iH+FqFzci8DHbP8Y0LJFA5xRdCCEs3Jnt8zRjEpzhHV66DyJdoFEjhIbrPVQoK+bdLk
 xP3lRf0tc3U1nCc2OHxbNEuzy87zfwvbcHUjE0bXNpmVPmb4b2ELg37PtmFIpmVqFt3B
 mpCA9xzo6u+DN+X60gwbKU77Uu8NYE/Lj9yBO1y7pJU/p/8pcIzmGy8G0XmYhUbbvAII
 plFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=t1fQ3HMUMjTYp4HukGDzZcKzvdvCdzA+hW6xmFvbLbk=;
 b=JU7qDZ9HdleKngsYJRySI2Uuo6LDHcJ6z0kDi3nGO9V+RH61mJxzMURbiPoVWRIfzr
 FnhS1Rp1Ecqi5PYpOJ+tZOBkVTdUmqqlQz4pUUitLW7lJYjs8gxZS5/W7DhdnaYDs0vO
 FmLHxwY/5y7+fe+bWvugjA6tIMbPfbJk31ZXFtrhcN1HyD7EpqPupDo0R31oNkdA946x
 ms/KbjGxol6TGNLQ/tiy5YgP/tXuqjP2pQFLdMaK3A5VdaRULOGyYZXR2gLoAHg8CVH1
 9kuojTZ31yxK2x4IqnvG6G9E0cWd6Vzsnneov1NpQ4N+Avz+XzqAAwT92giIU30gq0B5
 87aQ==
X-Gm-Message-State: ANoB5pl3TGlOPxBn7Gmt0d4erFdtIc069E4bKlWPl6JKKV9D4kJiLiXg
 oyQPi/HsJrxZlQ5L4YKyVELXqXzs92JQ49Q/pu9ndQ==
X-Google-Smtp-Source: AA0mqf4S6tnPPRCOQWCsOq5kuksb7+u/7cQmv2C9BJe4b2BQ//W8JNd2zSsEQvuXeFLOKtkDMW4ei0zslW/NQI2W9RI=
X-Received: by 2002:aca:1c07:0:b0:359:ef86:2f4f with SMTP id
 c7-20020aca1c07000000b00359ef862f4fmr1016768oic.14.1671466566962; Mon, 19 Dec
 2022 08:16:06 -0800 (PST)
MIME-Version: 1.0
References: <20221205163754.221139-1-robert.foss@linaro.org>
 <20221205163754.221139-9-robert.foss@linaro.org>
 <60884c0e-7533-788b-2f93-c128cf7d27fd@kernel.org>
In-Reply-To: <60884c0e-7533-788b-2f93-c128cf7d27fd@kernel.org>
From: Robert Foss <robert.foss@linaro.org>
Date: Mon, 19 Dec 2022 17:15:56 +0100
Message-ID: <CAG3jFyuoXekXN48jAgXxLMy8yGAzK9oJH_1HHYAuRLBCzyordQ@mail.gmail.com>
Subject: Re: [PATCH v3 08/11] arm64: dts: qcom: sm8350: Use 2 interconnect
 cells
To: Georgi Djakov <djakov@kernel.org>
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
Cc: airlied@linux.ie, konrad.dybcio@somainline.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 krzysztof.kozlowski+dt@linaro.org, angelogioacchino.delregno@somainline.org,
 vinod.koul@linaro.org, Jonathan Marek <jonathan@marek.ca>,
 quic_vpolimer@quicinc.com, agross@kernel.org, quic_jesszhan@quicinc.com,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, swboyd@chromium.org, robh+dt@kernel.org,
 sean@poorly.run, quic_kalyant@quicinc.com, loic.poulain@linaro.org,
 andersson@kernel.org, dianders@chromium.org, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, vkoul@kernel.org,
 dmitry.baryshkov@linaro.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 5 Dec 2022 at 20:19, Georgi Djakov <djakov@kernel.org> wrote:
>
> Hi Robert,
>
> On 5.12.22 18:37, Robert Foss wrote:
> > Use two interconnect cells in order to optionally
> > support a path tag.
> >
> > Signed-off-by: Robert Foss <robert.foss@linaro.org>
> > Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> > ---
> >   arch/arm64/boot/dts/qcom/sm8350.dtsi | 28 ++++++++++++++--------------
> >   1 file changed, 14 insertions(+), 14 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
> > index 805d53d91952..434f8e8b12c1 100644
> > --- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
> > @@ -1543,56 +1543,56 @@ apps_smmu: iommu@15000000 {
> >               config_noc: interconnect@1500000 {
> >                       compatible = "qcom,sm8350-config-noc";
> >                       reg = <0 0x01500000 0 0xa580>;
> > -                     #interconnect-cells = <1>;
> > +                     #interconnect-cells = <2>;
> >                       qcom,bcm-voters = <&apps_bcm_voter>;
> >               };
> >
> >               mc_virt: interconnect@1580000 {
> >                       compatible = "qcom,sm8350-mc-virt";
> >                       reg = <0 0x01580000 0 0x1000>;
> > -                     #interconnect-cells = <1>;
> > +                     #interconnect-cells = <2>;
> >                       qcom,bcm-voters = <&apps_bcm_voter>;
> >               };
> [..]
> > @@ -1620,8 +1620,8 @@ ipa: ipa@1e40000 {
> >                       clocks = <&rpmhcc RPMH_IPA_CLK>;
> >                       clock-names = "core";
> >
> > -                     interconnects = <&aggre2_noc MASTER_IPA &mc_virt SLAVE_EBI1>,
> > -                                     <&gem_noc MASTER_APPSS_PROC &config_noc SLAVE_IPA_CFG>;
> > +                     interconnects = <&aggre2_noc MASTER_IPA 0 &mc_virt SLAVE_EBI1 0>,
> > +                                     <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_IPA_CFG 0>;
> >                       interconnect-names = "memory",
> >                                            "config";
> >
> > @@ -1661,7 +1661,7 @@ mpss: remoteproc@4080000 {
> >                                       <&rpmhpd SM8350_MSS>;
> >                       power-domain-names = "cx", "mss";
> >
> > -                     interconnects = <&mc_virt MASTER_LLCC &mc_virt SLAVE_EBI1>;
> > +                     interconnects = <&mc_virt MASTER_LLCC &mc_virt SLAVE_EBI1 0>;
>
> The second cell for the first endpoint is missing, so this should be:
>         interconnects = <&mc_virt MASTER_LLCC 0 &mc_virt SLAVE_EBI1 0>;

Nice catch, thanks!

>
> Thanks,
> Georgi
>
> >
> >                       memory-region = <&pil_modem_mem>;
> >
> > @@ -2239,7 +2239,7 @@ cdsp: remoteproc@98900000 {
> >                                       <&rpmhpd SM8350_MXC>;
> >                       power-domain-names = "cx", "mxc";
> >
> > -                     interconnects = <&compute_noc MASTER_CDSP_PROC &mc_virt SLAVE_EBI1>;
> > +                     interconnects = <&compute_noc MASTER_CDSP_PROC 0 &mc_virt SLAVE_EBI1 0>;
> >
> >                       memory-region = <&pil_cdsp_mem>;
> >
> > @@ -2421,14 +2421,14 @@ usb_2_ssphy: phy@88ebe00 {
> >               dc_noc: interconnect@90c0000 {
> >                       compatible = "qcom,sm8350-dc-noc";
> >                       reg = <0 0x090c0000 0 0x4200>;
> > -                     #interconnect-cells = <1>;
> > +                     #interconnect-cells = <2>;
> >                       qcom,bcm-voters = <&apps_bcm_voter>;
> >               };
> >
> >               gem_noc: interconnect@9100000 {
> >                       compatible = "qcom,sm8350-gem-noc";
> >                       reg = <0 0x09100000 0 0xb4000>;
> > -                     #interconnect-cells = <1>;
> > +                     #interconnect-cells = <2>;
> >                       qcom,bcm-voters = <&apps_bcm_voter>;
> >               };
> >
>
