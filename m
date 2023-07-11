Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 994CF74FB9A
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 01:01:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D83C10E459;
	Tue, 11 Jul 2023 23:01:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02E7010E45B
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 23:01:13 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id
 5614622812f47-3a3a8d21208so5437723b6e.0
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 16:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689116473; x=1691708473;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=sNgvvti22BaVOQpn7FMXRFccxTxteRm9qMZTNS49wJc=;
 b=SnsZzYcxC8uETuqw89Oj9ypwhEjQ5xsUGI4SCT2U/HLgMMEp7sCEUWb8Vfj8I33+63
 oFukQSrN7Qm89fretmaq0T4Dew04HmVnlsTcP8GFhXCFKKtYp0x6/Q0p9T8S8J4DhpTh
 BuAWsNJv/LJdL6mBX762L1gy5A8LxqvQMHjVoK08oJPeaNxpbVtPR27aIDI0FbinbM7a
 fanXkh2FvbI3T7LhG0lTeaEhfgZ2CdTQMSC8/XbuLMjxgIxl3lwLuq7MsRVt69g5VV1G
 7nmWluz6vuiaiquNi3nwbiScFyynqIVDVaC5AwmdOakV5IyV+Ld2qNRworcXYC6cwOkA
 0i1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689116473; x=1691708473;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sNgvvti22BaVOQpn7FMXRFccxTxteRm9qMZTNS49wJc=;
 b=VNqlJBSZvN/qyUu3kGhzTx4F5/mfIYMdJNMqk3d/OMFedguYjoHu/Eu+JfXbwks492
 80EWh4VAVbmJbScFq1D8OmOdMFAF91R9mPOw851xtUR/mi7SL0LY0DECLZ8bjyzXtBAq
 iH7oRPnSb1L3E8nMN/KIL8VGOBqIZcfBPycdqBsKLwCCFPj6wVsecFYSZ8WButNsIU8f
 CBwaITNbHu2rld4DXZsN0hjK5+ZnW1mrCsOkkLeKZGQlhNSLRc4cBs5k8cFry8iFnyjq
 tx7/NYO9AYGmibq1/KPTgMosBgMwt9I7upykt7Muzo4VCA0S0I0PNtAt09OIjQ9cpLo9
 2AFA==
X-Gm-Message-State: ABy/qLamOol2rZgEWUwIiXBUBfSK/OM17bOn7gCALQNTqjrFyVITPIub
 z9Imi5xGBmFNV3MMITk4Dd1Ou1sT9Xc5BQB9IH8OCQ==
X-Google-Smtp-Source: APBJJlEkQ9HSi+CqGWUfrEa9mQbC5ePz8PSqoOABC9giUvRXnz9F6mkPYDAMXjPDWPnX5V9zeoA+Hz8x45tFMf9ARu4=
X-Received: by 2002:a05:6808:1441:b0:3a4:1319:9af1 with SMTP id
 x1-20020a056808144100b003a413199af1mr6467128oiv.51.1689116473078; Tue, 11 Jul
 2023 16:01:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230709041926.4052245-1-dmitry.baryshkov@linaro.org>
 <20230709041926.4052245-4-dmitry.baryshkov@linaro.org>
 <d80fab4d-f581-f6fa-4aa8-f8952f0c710c@linaro.org>
 <6968f4a5-fc5d-e166-3262-dc83762eeec1@linaro.org>
 <766ade98-f3c7-89a3-d3e0-63c8d01a8498@linaro.org>
In-Reply-To: <766ade98-f3c7-89a3-d3e0-63c8d01a8498@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 12 Jul 2023 02:01:02 +0300
Message-ID: <CAA8EJpqxuziMGqkCZsE18K6z=WyQ44nxo3+-He=SZhH7Gfggkg@mail.gmail.com>
Subject: Re: [PATCH 3/5] arm64: dts: qcom: qrb5165-rb5: add onboard USB-C
 redriver
To: Konrad Dybcio <konrad.dybcio@linaro.org>
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
Cc: devicetree@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, Andy Gross <agross@kernel.org>,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 12 Jul 2023 at 01:59, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> On 12.07.2023 00:39, Dmitry Baryshkov wrote:
> > On 12/07/2023 00:36, Konrad Dybcio wrote:
> >> On 9.07.2023 06:19, Dmitry Baryshkov wrote:
> >>> Add the nb7vpq904m, onboard USB-C redriver / retimer.
> >>>
> >>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>> ---
> >> [...]
> >>
> >>> +            port@1 {
> >>> +                reg = <1>;
> >>> +
> >>> +                redriver_phy_con_ss: endpoint {
> >>> +                    remote-endpoint = <&usb_1_qmpphy_typec_mux_in>;
> >>> +                    data-lanes = <0 1 2 3>;
> >> That's USB+DP lines combined, or how does it work? I'm confused :/
> >
> > 4 generic purpose SS lanes, which can be purposed for USB or for DP.
> Okay, so my gut did better than my brain.
>
> Other than that, I'm reading the bindings and it looks like ports 0 and
> 1 may possibly be swapped?

Yes. But if I get schematics right, the lanes are not swapped in this case.

>
> Konrad
> >
> >>
> >> Konrad
> >>> +                };
> >>> +            };
> >>> +
> >>> +            port@2 {
> >>> +                reg = <2>;
> >>> +
> >>> +                redriver_usb_con_sbu: endpoint {
> >>> +                    remote-endpoint = <&pm8150b_typec_sbu_out>;
> >>> +                };
> >>> +            };
> >>> +        };
> >>> +    };
> >>>   };
> >>>     &mdss {
> >>> @@ -1294,7 +1334,7 @@ &usb_1_qmpphy {
> >>>   };
> >>>     &usb_1_qmpphy_typec_mux_in {
> >>> -    remote-endpoint = <&pm8150b_typec_mux_out>;
> >>> +    remote-endpoint = <&redriver_phy_con_ss>;
> >>>   };
> >>>     &usb_2 {
> >>> @@ -1382,7 +1422,15 @@ pm8150b_role_switch_out: endpoint {
> >>>               port@1 {
> >>>                   reg = <1>;
> >>>                   pm8150b_typec_mux_out: endpoint {
> >>> -                    remote-endpoint = <&usb_1_qmpphy_typec_mux_in>;
> >>> +                    remote-endpoint = <&redriver_usb_con_ss>;
> >>> +                };
> >>> +            };
> >>> +
> >>> +            port@2 {
> >>> +                reg = <2>;
> >>> +
> >>> +                pm8150b_typec_sbu_out: endpoint {
> >>> +                    remote-endpoint = <&redriver_usb_con_sbu>;
> >>>                   };
> >>>               };
> >>>           };
> >



-- 
With best wishes
Dmitry
