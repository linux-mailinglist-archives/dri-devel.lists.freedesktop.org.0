Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA845E8F48
	for <lists+dri-devel@lfdr.de>; Sat, 24 Sep 2022 20:22:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C53910E081;
	Sat, 24 Sep 2022 18:22:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com
 [IPv6:2607:f8b0:4864:20::112b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6289710E07A
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Sep 2022 18:22:33 +0000 (UTC)
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-345528ceb87so30316357b3.11
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Sep 2022 11:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=s2yVFEWeDENib5ZI/a0e4ge6cSf4cj8rWCXGLC8hWc8=;
 b=wxMdeFEZDUmk1q3u139fGzFutmWA3RDqZJDDpILqRY8aNRDEHhddkYzPg3AmSAmtKL
 a28v+VdYgGVulYsS+pbwPNXyWq4u7zF0P3w/4Jo2MLt0Q99QblBroXAzGYWb+cTHxXqg
 OCpHbKEzut3wEex19I/RXeUN9ZV4FqD2L33md0qJ+APWgl/qlX0dJrH9stA6F+f4ZG8t
 /5+CWuEAjpFC6q/1pn3czSH1jVuj6S4lkcMCbKnPj2PSP6gzRmPt3Fg3zyYRGmbYSx69
 xltQVHNl+GV6On0h971Iu3BqUG1ZUJh4KloHkfvQgYzjDYusKvsoJKVKUqUxizCKmIJg
 Mchg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=s2yVFEWeDENib5ZI/a0e4ge6cSf4cj8rWCXGLC8hWc8=;
 b=UjaoBZreAUZdycYydWIn3DiiTNfQyFg3hBTUz9ad2Nq6G7hT/9iCnQkJB2DNWZNTjH
 uh3WiPfsaUmtqQMtER6LVzvy3cSIyZwNbTEHh4xt4+au7frnhRwW2Q4iKMdFHl8dlAT3
 6+1xHpq5m4IZErEQLyx28rH//1q8YP7V+E6OKlW/E+yxLXLLGN1sqaDEUfEHc69RBW1g
 X8+Lid2JiNbKVS1j4CV/+YJjZoKAU3Y8U6+20RxXw0p059LGPBQ9NvVU8UTncC2qX6Wq
 r/FaJoKQo60fWTeZjF6bkYX9qkSh5Cal7XoiWp2D7zVo6VdySerIoOovBg0BxQ2mvmq8
 i5aA==
X-Gm-Message-State: ACrzQf1UxU3TvRTwy5y21mXWU7lP5G0lVWLrINKkC2Old+95zFzzugqy
 GMTzdWjKHJhH8cH8CNK12Wdza5dr5FDkicZjjgiB/w==
X-Google-Smtp-Source: AMsMyM55C7BiVAgLyyl2DjyMdVD0pDcGpUVDvvuje9A16f1dgXZcSU4O2RBMsUKcA7MgADqVBthdJWgunYiS+vBYqbo=
X-Received: by 2002:a81:1e0d:0:b0:33b:fb67:9895 with SMTP id
 e13-20020a811e0d000000b0033bfb679895mr13952159ywe.188.1664043752195; Sat, 24
 Sep 2022 11:22:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220924123611.225520-1-dmitry.baryshkov@linaro.org>
 <20220924123611.225520-4-dmitry.baryshkov@linaro.org>
 <20220924172324.qdgz5dnccncadmfz@krzk-bin>
In-Reply-To: <20220924172324.qdgz5dnccncadmfz@krzk-bin>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 24 Sep 2022 21:22:21 +0300
Message-ID: <CAA8EJpoZq9zrVeSYdn4_MQ_HVQTEXR8Zmx+BWpoo1PDUS7X+5A@mail.gmail.com>
Subject: Re: [PATCH v8 03/12] dt-bindings: display/msm: add interconnects
 property to qcom,mdss-smd845
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
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sean Paul <sean@poorly.run>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, Andy Gross <agross@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 24 Sept 2022 at 20:23, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On Sat, 24 Sep 2022 15:36:02 +0300, Dmitry Baryshkov wrote:
> > Add interconnects required for the SDM845 MDSS device tree node. This
> > change was made in the commit c8c61c09e38b ("arm64: dts: qcom: sdm845:
> > Add interconnects property for display"), but was not reflected in the
> > schema.
> >
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  .../devicetree/bindings/display/msm/dpu-sdm845.yaml    | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >
>
> Running 'make dtbs_check' with the schema in this patch gives the
> following warnings. Consider if they are expected or the schema is
> incorrect. These may not be new warnings.
>
> Note that it is not yet a requirement to have 0 warnings for dtbs_check.
> This will change in the future.
>
> Full log is available here: https://patchwork.ozlabs.org/patch/1681884
>
>
> mdss@ae00000: 'dsi-phy@ae94400', 'dsi-phy@ae96400', 'dsi@ae94000', 'dsi@ae96000' do not match any of the regexes: '^display-controller@[0-9a-f]+$', 'pinctrl-[0-9]+'
>         arch/arm64/boot/dts/qcom/sdm845-cheza-r1.dtb
>         arch/arm64/boot/dts/qcom/sdm845-cheza-r2.dtb
>         arch/arm64/boot/dts/qcom/sdm845-cheza-r3.dtb
>         arch/arm64/boot/dts/qcom/sdm845-db845c.dtb
>         arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dtb
>         arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dtb
>         arch/arm64/boot/dts/qcom/sdm845-mtp.dtb
>         arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dtb
>         arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dtb
>         arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dtb
>         arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akari.dtb
>         arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akatsuki.dtb
>         arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-apollo.dtb
>         arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dtb
>         arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dtb
>         arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dtb
>         arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dtb

This is expected and fixed by one of the later patches.

-- 
With best wishes
Dmitry
