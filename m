Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 108D59D8E51
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2024 23:08:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B0B910E3D8;
	Mon, 25 Nov 2024 22:08:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="hq5ihD1q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com
 [209.85.219.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 141C910E033
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 22:08:22 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id
 3f1490d57ef6-e388186edbfso4755897276.3
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 14:08:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732572501; x=1733177301; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=2eAVON7HGIpJamTV+1ul/jOyH9ikQLUzIAIpUaFRKeE=;
 b=hq5ihD1qczCJ3WGh7tbutwy/gAsjTFlYaTOY0O8QEFVczM5rPMFJ4fPuB2j5q/BLch
 vCydzYuNbCKWCZSZXAKy4E7zG3NeH7vK+Mtsd35pG9qNXAq2S7Xg3bvYr4FvY/RlLzXb
 skDSonysG1u3/Ge8gxwdbK5ljaIEN3LKTzdKIeOTXHaDce3DFGz57+Bf1VaDC50sKpVl
 Z5r06baIq+FXITdK5MHYgpvXTP+RZ2RXgI4hznmIKiz9n69Tfh2nD++B0onlhyyOGojQ
 /YkZ+rp4FzMIKEIfQJAW1BlO6+2qjyNdd90SvvU+JA4CkO5U2/PizRCHGi74c6BAm926
 ESnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732572501; x=1733177301;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2eAVON7HGIpJamTV+1ul/jOyH9ikQLUzIAIpUaFRKeE=;
 b=sKBoZqIQC9pB6G2YI9tG7itjsAJlKqF/LJkJLyDtwBtzVrJsQAtPkGv2tbUdq1nVuK
 I0GZ1mtHm9FEFtLicAPPGzXruz9FMGjuK/xMDwB6ZwGHPqdxRRd1sAn4QhmEAruI0pey
 c7riROseUgsPLZ44dQtlOJsyTJK+B8SkeehBvdaEAQJPejW5Q7P7LaplsCTLEyMTExzg
 dwYwTp9hPez5Tm+RkCiS/oHMfNrqsxWihO9ghhUmYH0pbsFJFWWgMuV6lp4v93zfYhym
 HBINjGtZWHoWjFR3y4AobR82AyibarMNFgymeSckY56pFjKttW2vgMa0CEly+UBYt9SS
 s8Fg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHFBZCS3ycq0UWfRDOeLZxM1RdHneyNrQOAEDq4pYebGthomvuN35SeCBhMKUm/D/q+2fNyBxqvAY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzp2kn35/8ub8l2v3AAWNFwVijiFgFUr2FU5MiFEU+g63qUpas/
 DUEcggrB+qDo5RepL2bZbseV6yqezLTLFm2YwGOn8xP8+aRzE+WccrqFIvXUT2JC1rbGufCl9pn
 GSyOIbB7BOhjhe7hF5TUjPeTJeAzQusGHFaDJNA==
X-Gm-Gg: ASbGnctGFM0FKtCKQnpbLINzGo7ae5FWWj9TLhmhZvMjgM6Qbtnbb5RObMr3rsnAy+s
 vGdCOeyWI34AmEzw7fkMhdowZFJ460HpWIBsKKhGArhSzzA==
X-Google-Smtp-Source: AGHT+IH3FXdPBpJiJnoxYtZf5OcPuzoBCcHTS63VZoNzGC8i3tQMMu8CiFEfyuzsoE5SpSq1X+HyPrst164d4mk4PR4=
X-Received: by 2002:a05:6902:2b85:b0:e38:bec9:527d with SMTP id
 3f1490d57ef6-e38f8b22061mr11846744276.26.1732572501125; Mon, 25 Nov 2024
 14:08:21 -0800 (PST)
MIME-Version: 1.0
References: <20241122-add-display-support-for-qcs615-platform-v3-0-35252e3a51fe@quicinc.com>
 <20241122-add-display-support-for-qcs615-platform-v3-9-35252e3a51fe@quicinc.com>
 <azdmcs7uafw3n6cqbq4ei66oybzhtyvdyz2xl4wtaf3u5zextb@vdhbs6wnbeg4>
 <520419eb-cedf-465b-a14a-12d97ab257a0@quicinc.com>
In-Reply-To: <520419eb-cedf-465b-a14a-12d97ab257a0@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 26 Nov 2024 00:08:10 +0200
Message-ID: <CAA8EJpqvkeMWgeWCx9D-HcJhRfipZJdEvpvag0wk-WXazkPahA@mail.gmail.com>
Subject: Re: [PATCH v3 9/9] arm64: dts: qcom: Add display support for QCS615
 RIDE board
To: fange zhang <quic_fangez@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Li Liu <quic_lliu6@quicinc.com>, 
 Xiangxu Yin <quic_xiangxuy@quicinc.com>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 25 Nov 2024 at 09:39, fange zhang <quic_fangez@quicinc.com> wrote:
>
>
>
> On 2024/11/22 18:22, Dmitry Baryshkov wrote:
> > On Fri, Nov 22, 2024 at 05:56:52PM +0800, Fange Zhang wrote:
> >> From: Li Liu <quic_lliu6@quicinc.com>
> >>
> >> Add display MDSS and DSI configuration for QCS615 RIDE board.
> >> QCS615 has a DP port, and DP support will be added in a later patch.
> >>
> >> Signed-off-by: Li Liu <quic_lliu6@quicinc.com>
> >> Signed-off-by: Fange Zhang <quic_fangez@quicinc.com>
> >> ---
> >>   arch/arm64/boot/dts/qcom/qcs615-ride.dts | 76 ++++++++++++++++++++++++++++++++
> >>   1 file changed, 76 insertions(+)
> >>
> >> diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> >> index ee6cab3924a6d71f29934a8debba3a832882abdd..cc7dadc411ab79b9e60ccb15eaff84ea5f997c4c 100644
> >> --- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> >> +++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> >> @@ -202,6 +202,82 @@ &gcc {
> >>               <&sleep_clk>;
> >>   };
> >>
> >> +&i2c2 {
> >> +    clock-frequency = <400000>;
> >> +    status = "okay";
> >> +
> >> +    ioexp: gpio@3e {
> >> +            compatible = "semtech,sx1509q";
> >> +            reg = <0x3e>;
> >> +            interrupt-parent = <&tlmm>;
> >> +            interrupts = <58 0>;
> >> +            gpio-controller;
> >> +            #gpio-cells = <2>;
> >> +            interrupt-controller;
> >> +            #interrupt-cells = <2>;
> >> +            semtech,probe-reset;
> >> +    };
> >> +
> >> +    i2c-mux@77 {
> >> +            compatible = "nxp,pca9542";
> >> +            reg = <0x77>;
> >> +            #address-cells = <1>;
> >> +            #size-cells = <0>;
> >> +            i2c@0 {
> >> +                    reg = <0>;
> >> +                    #address-cells = <1>;
> >> +                    #size-cells = <0>;
> >> +
> >> +                    anx7625@58 {
> >> +                            compatible = "analogix,anx7625";
> >> +                            reg = <0x58>;
> >> +                            interrupt-parent = <&ioexp>;
> >> +                            interrupts = <0 0>;
> >> +                            enable-gpios = <&tlmm 4 GPIO_ACTIVE_HIGH>;
> >> +                            reset-gpios = <&tlmm 5 GPIO_ACTIVE_HIGH>;
> >> +                            wakeup-source;
> >> +
> >> +                            ports {
> >> +                                    #address-cells = <1>;
> >> +                                    #size-cells = <0>;
> >> +
> >> +                                    port@0 {
> >> +                                            reg = <0>;
> >> +                                            anx_7625_in: endpoint {
> >> +                                                    remote-endpoint = <&mdss_dsi0_out>;
> >> +                                            };
> >> +                                    };
> >> +
> >> +                                    port@1 {
> >> +                                            reg = <1>;
> >> +                                            anx_7625_out: endpoint {
> >> +                                            };
> >
> > Where is it connected? Is it DP port? USB-C? eDP?
> yes, it's DP port

So, I'd expect to see a dp-connector node at the end, not the
unterminated anx7625.

> >
> >> +                                    };
> >> +                            };
> >> +                    };
> >> +            };
> >> +    };
> >> +};
> >> +
> >> +&mdss {
> >> +    status = "okay";
> >> +};
> >> +
> >> +&mdss_dsi0 {
> >> +    vdda-supply = <&vreg_l11a>;
> >> +    status = "okay";
> >> +};
> >> +
> >> +&mdss_dsi0_out {
> >> +    remote-endpoint = <&anx_7625_in>;
> >> +    data-lanes = <0 1 2 3>;
> >> +};
> >> +
> >> +&mdss_dsi0_phy {
> >> +    vdds-supply = <&vreg_l5a>;
> >> +    status = "okay";
> >> +};
> >> +
> >>   &qupv3_id_0 {
> >>      status = "okay";
> >>   };
> >>
> >> --
> >> 2.34.1
> >>
> >
>


-- 
With best wishes
Dmitry
