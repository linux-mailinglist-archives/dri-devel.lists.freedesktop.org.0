Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E7066A4D6
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 22:12:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B00610E20A;
	Fri, 13 Jan 2023 21:12:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [IPv6:2607:f8b0:4864:20::b2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF8BC10E206
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jan 2023 21:11:58 +0000 (UTC)
Received: by mail-yb1-xb2e.google.com with SMTP id d62so7733015ybh.8
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jan 2023 13:11:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Nwi1WKddhAW8sPy/ujwfpc17G/Uaa3ESBQr8HYWaLxw=;
 b=ExxIeFvd2GIeHxK1e+u7KroQtACr/sH8/Ejm/zvlmXV5RBmEQVVZQCPlClFKUg+Y/Z
 Zu3o8WoEMu4BezFPqGnlQee8qPTqHyb/Dcj+xVOZfPj19hblI7bmW+jOWbDqCDasMjWd
 xlCM1bDHQegocMk5ELWQxR9whwDPRTfhJ98FzgZpUw+w9gY6cy7y0SKyyu3lNDOjzfbo
 h08KT8Qr8L7kgMW/RsyycO3QVrxrYu2BzJ+jpPjUf6P93rF1prGzohzz3uvWo0jByz+z
 7T8OW/7o2lbGmpcMdVyFEsgfkf5ztFQWM+rQy+1zEnzLa26wp6G4RE/6eJKBdDLkhqG2
 Q/Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Nwi1WKddhAW8sPy/ujwfpc17G/Uaa3ESBQr8HYWaLxw=;
 b=u6oSKDTLn1VKi3Cq4jrvSsSKnPOQ+HcA+RK6rh61+gNZLA7NIiYcbCg1BEVbU59akE
 ElqlZZ5nhxnuU5ULDa4YscrS8zR9oSgaTlHGZonyX5TlgwDXblqDc84fi/NcwT4Eu0gh
 K+rO3PyHpPSA+WI3qGzqspKv6kKZmPuHYPK6D0sp4e1+ZE+K/tb8dVS3BMhIWoJKHW5F
 gp0P56ZxHCf1jeNiph8lyCWMcyH4/VcjTStPfrQj6MsipgMfoDJUpaWMimIbi71xv1QZ
 9POw9lMfy5Uy1WNpvQW9YymaVW5tgYyfWHv3EHUQyoZJdHFD1F56On2Csfc5Ql5bTpx/
 9Blg==
X-Gm-Message-State: AFqh2kot53qsaD+7XdyVY2Sg824/No9bjhg1ET3XIjh75UKKqAfpaoPK
 pQ6NnkqhujauFZJZQSdPkEsQXPrMFDUysL7i8AZVGg==
X-Google-Smtp-Source: AMrXdXvcqjA0Ri5PB+/+im8+2opI/8QMNUqxjMQxunAmz1hTImGN3pCiltxTaFVZMZwXeDlQ8av4C7+HLdLGbnDwgn8=
X-Received: by 2002:a25:cc7:0:b0:6e0:c7d3:f026 with SMTP id
 190-20020a250cc7000000b006e0c7d3f026mr8961122ybm.275.1673644318081; Fri, 13
 Jan 2023 13:11:58 -0800 (PST)
MIME-Version: 1.0
References: <20230113083720.39224-1-dmitry.baryshkov@linaro.org>
 <20230113083720.39224-2-dmitry.baryshkov@linaro.org>
 <167362343145.2212490.16180994187587985655.robh@kernel.org>
In-Reply-To: <167362343145.2212490.16180994187587985655.robh@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 13 Jan 2023 23:11:47 +0200
Message-ID: <CAA8EJppdA_LZsbF9zbcF=bf-HqOyM=xSNoOX-_7ZA1w5WWExLA@mail.gmail.com>
Subject: Re: [PATCH v6 01/11] dt-bindings: display/msm: convert MDP5 schema to
 YAML format
To: Rob Herring <robh@kernel.org>
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
Cc: freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 13 Jan 2023 at 17:26, Rob Herring <robh@kernel.org> wrote:
>
>
> On Fri, 13 Jan 2023 10:37:10 +0200, Dmitry Baryshkov wrote:
> > Convert the mdp5.txt into the yaml format. Changes to the existing (txt) schema:
> >  - MSM8996 has additional "iommu" clock, define it separately
> >  - Add new properties used on some of platforms:
> >    - interconnects, interconnect-names
> >    - iommus
> >    - power-domains
> >    - operating-points-v2, opp-table
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  .../devicetree/bindings/display/msm/mdp5.txt  | 132 -----------------
> >  .../bindings/display/msm/qcom,mdp5.yaml       | 138 ++++++++++++++++++
> >  2 files changed, 138 insertions(+), 132 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/display/msm/mdp5.txt
> >  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml
> >
>
> Running 'make dtbs_check' with the schema in this patch gives the
> following warnings. Consider if they are expected or the schema is
> incorrect. These may not be new warnings.
>
> Note that it is not yet a requirement to have 0 warnings for dtbs_check.
> This will change in the future.
>
> Full log is available here: https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230113083720.39224-2-dmitry.baryshkov@linaro.org
>
>
> mdp@1a01000: compatible:0: 'qcom,mdp5' was expected
>         arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dtb
>
> mdp@1a01000: compatible: ['qcom,msm8953-mdp5', 'qcom,mdp5'] is too long
>         arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dtb

This is because we ended up in the middle of the conversion. msm8953
ended up using a new style of bindings, while the rest used old ones.
This is fixed by the patch 02 (which adds SoC-specific compatibles to
the schema) and patches 6 and 7 that convert the rest of DT.
--
With best wishes
Dmitry
