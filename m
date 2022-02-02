Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3FF4A7A65
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 22:26:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9906B10E213;
	Wed,  2 Feb 2022 21:26:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0A1410E185
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Feb 2022 21:26:39 +0000 (UTC)
Received: by mail-il1-x135.google.com with SMTP id m2so460522ilg.11
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Feb 2022 13:26:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=o2/UoLjZiFXhay6ZdHILc8GiD9j1bhUbIT2EuWPLH8I=;
 b=FfAaTdVcfqAbX85RPfFV6HhR5h9+bXVbMraOahfnDr8UOhhCYSX4SEvQ55Wxuabmm7
 FhOfpBElQNYy6enchn8R3Q/efh9z0sddllHKf8duiau/uvjtonae4vMRqaM+Fvd54PTg
 u9vyqApXHmUX4M50H9N7bNPdmRJEjGXy5EfWE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=o2/UoLjZiFXhay6ZdHILc8GiD9j1bhUbIT2EuWPLH8I=;
 b=5WBPBvGJx6ax9JYq6+Yd7On7V02qKN6eHskKR/vaSiMoK+MVf1HW51MrpHxTz7UDAa
 gGsEFzqqGY5NUVRRQUiwFmIuWPocIDpMhXIKXCD+hqKHT88h0AQVMM+DcqUoDgdn2OtV
 sh9E9H/AgtlAv2gUlj4zumSvG9V2GhAlDmBlSHDLWrNzp0+yCUh558v6FtmyYvXZMQT9
 1CAhQfBSPg2hgx6N7ClxwGU11JC4gFuSQQTxQFmHYLvmwev7a/3hEDR6lk7YaZPf+dsk
 42gC/GemcJptz5L/UB6fHAh1Tq5C0x/r7byZhs7Ejf1dSuLn4AaUmDM4jqNrKdGm/NTm
 gApw==
X-Gm-Message-State: AOAM5319tLxGkAWx6mVbT/9SiCl7ijQcJjEDQRzQaYf6aLq62fD/N6Wt
 M/4hnAeCBwz3IgN+Lr9yNJNCoPlNVeRDdg==
X-Google-Smtp-Source: ABdhPJx9hJ7+VaVHe11OeDIpZBk34x8AKNjFpCQ4mv5HpJVFHMf5S8bxt4wBcdLYc1xWVrjXttdp6Q==
X-Received: by 2002:a92:a00e:: with SMTP id e14mr19202049ili.192.1643837198864; 
 Wed, 02 Feb 2022 13:26:38 -0800 (PST)
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com.
 [209.85.166.180])
 by smtp.gmail.com with ESMTPSA id w1sm862979ilc.41.2022.02.02.13.26.36
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Feb 2022 13:26:37 -0800 (PST)
Received: by mail-il1-f180.google.com with SMTP id e8so450396ilm.13
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Feb 2022 13:26:36 -0800 (PST)
X-Received: by 2002:a92:cd84:: with SMTP id r4mr18778065ilb.180.1643837196261; 
 Wed, 02 Feb 2022 13:26:36 -0800 (PST)
MIME-Version: 1.0
References: <1643048114-2996-1-git-send-email-quic_sbillaka@quicinc.com>
 <1643048114-2996-2-git-send-email-quic_sbillaka@quicinc.com>
 <CAD=FV=WjnDCh6dLV8pxgYepMDtf5oMSTb9v+Z8dwyMARL7TYaQ@mail.gmail.com>
In-Reply-To: <CAD=FV=WjnDCh6dLV8pxgYepMDtf5oMSTb9v+Z8dwyMARL7TYaQ@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 2 Feb 2022 13:26:24 -0800
X-Gmail-Original-Message-ID: <CAD=FV=X_y3duGCN09sKOR0uZLft5x7OcLcBbbtT9EHi-4EGV6g@mail.gmail.com>
Message-ID: <CAD=FV=X_y3duGCN09sKOR0uZLft5x7OcLcBbbtT9EHi-4EGV6g@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] ARM64: dts: qcom: enable eDP panel support for
 sc7280
To: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
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
Cc: quic_kalyant@quicinc.com,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, quic_abhinavk@quicinc.com,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, quic_khsieh@quicinc.com,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Andy Gross <agross@kernel.org>, Sean Paul <seanpaul@chromium.org>,
 quic_mkrishn@quicinc.com, Stephen Boyd <swboyd@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Jan 24, 2022 at 11:04 AM Doug Anderson <dianders@chromium.org> wrote:
>
> > +&mdss_edp {
> > +       status = "okay";
> > +
> > +       vdda-1p2-supply = <&vreg_l6b_1p2>;
> > +       vdda-0p9-supply = <&vreg_l10c_0p8>;
> > +
> > +       ports {
> > +               port@1 {
> > +                       reg = <1>;
> > +                       edp_out: endpoint {
> > +                               remote-endpoint = <&edp_panel_in>;
> > +                       };
> > +               };
> > +       };
>
> I think part of the above should be in sc7280.dtsi. Basically in
> sc7820.dtsi I think you should have:
>
> ports {
>   #address-cells = <1>;
>   #size-cells = <0>;
>   port@0 {
>     reg = <0>;
>     edp_in: endpoint {
>       remote-endpoint = <&dpu_intf5_out>;
>     };
>   };
>   port@1 {
>     reg = <1>;
>     edp_out: endpoint {
>     };
>   };
> };
>
> ...and then the crd dts file just needs:
>
> &edp_out {
>   remote-endpoint = <&edp_panel_in>;
> };
>
> Right?

I've attempted to do the sc7280 part of this in:

https://lore.kernel.org/r/20220202132301.v3.7.Ic84bb69c45be2fccf50e3bd17b845fe20eec624c@changeid

Assuming folks think that's good then you should probably base your
next version atop that.

-Doug
