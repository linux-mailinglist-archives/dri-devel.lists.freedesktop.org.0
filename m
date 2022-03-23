Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B68C14E53E1
	for <lists+dri-devel@lfdr.de>; Wed, 23 Mar 2022 15:02:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E77F10E6ED;
	Wed, 23 Mar 2022 14:02:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51CBB10E6EC;
 Wed, 23 Mar 2022 14:02:31 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CB709616C3;
 Wed, 23 Mar 2022 14:02:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F2E6C340E8;
 Wed, 23 Mar 2022 14:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648044150;
 bh=JxYjL1a/RqmPUfkRn2b3Bnz8DtavbdauzsNtNCTAyYA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=X/mKPGAZAkLMD7aUka2FD6U5VeJcM15iO3H+sx3APLDDWCOOj3zVv/c0sfuXE1MM1
 eu+bkbpQfKVtibdTWwdNkve2NqJ5ZJMmBLIk8J/dfvAF47J70mw9fos53+qMF9+HFA
 Nq4MX2Hou89QrM2TGe89EcilfXEFuHgeemLEqSUMKAN4jgNgNFDQgKanyyxSVFDhUD
 2qjA7HKP5QIzj0T0mStuQna9+C6f8zRnLliS5Fjy10QcPYBjUSGAAztiIZ9ufQy/jL
 iibKMWZ/di/De9qdsaFHfPN9rqSCKPTwZr8eqJWux3CzQcg5gXmyUb70DZywpep/56
 eJ6x/NOdYOhoQ==
Received: by mail-ej1-f43.google.com with SMTP id dr20so3041763ejc.6;
 Wed, 23 Mar 2022 07:02:30 -0700 (PDT)
X-Gm-Message-State: AOAM530nNfup2JHjbpEHjCVHPq43NA4mGgDa9j4O8MvCPRBA9vqXhVjr
 cM3yjbMLQbFwcjgUo6JNhKP4XBKk2rtADqMFAQ==
X-Google-Smtp-Source: ABdhPJx2TFWrM7icRG1WmcNLDv99GAOvmhqZlzEVH4q/kNWKTlIGOLxQ9V863+3ejraj2Zqd64uKHsl0Oob/a0vBacY=
X-Received: by 2002:a17:906:d204:b0:6d6:df17:835e with SMTP id
 w4-20020a170906d20400b006d6df17835emr119400ejz.20.1648044145846; Wed, 23 Mar
 2022 07:02:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220302001410.2264039-1-dmitry.baryshkov@linaro.org>
 <CAL_Jsq+TwPpZSZa3Jq-qYg0kUpb2ord5bWKVAwqsdVP40RKFuQ@mail.gmail.com>
In-Reply-To: <CAL_Jsq+TwPpZSZa3Jq-qYg0kUpb2ord5bWKVAwqsdVP40RKFuQ@mail.gmail.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Wed, 23 Mar 2022 09:02:13 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+dQDBoWST6+HfhsQjT4=Gks2F72S7iPyHzapp2eEdwfA@mail.gmail.com>
Message-ID: <CAL_Jsq+dQDBoWST6+HfhsQjT4=Gks2F72S7iPyHzapp2eEdwfA@mail.gmail.com>
Subject: Re: [RESEND PATCH] dt-bindings: display/msm: add missing brace in
 dpu-qcm2290.yaml
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, Loic Poulain <loic.poulain@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 8, 2022 at 1:36 PM Rob Herring <robh+dt@kernel.org> wrote:
>
> On Tue, Mar 1, 2022 at 6:14 PM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > Add missing brace in dpu-qcm2290.yaml. While we are at it, also fix
> > indentation for another brace, so it matches the corresponding line.
> >
> > Reported-by: Rob Herring <robh@kernel.org>
> > Cc: Loic Poulain <loic.poulain@linaro.org>
> > Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> > Didn't include freedreno@ in the first email, so resending.
> > ---
> >  Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
>
> Now that the example actually builds, we get just schema warnings:
>
> /builds/robherring/linux-dt/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.example.dt.yaml:
> mdss@5e00000: compatible: ['qcom,qcm2290-mdss', 'qcom,mdss'] is too
> long
> From schema: /builds/robherring/linux-dt/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
> /builds/robherring/linux-dt/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.example.dt.yaml:
> mdss@5e00000: 'mdp@5e01000' does not match any of the regexes:
> '^display-controller@[0-9a-f]+$', 'pinctrl-[0-9]+'
> From schema: /builds/robherring/linux-dt/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
>
>
> I would have assumed upon reporting errors with 'make
> dt_binding_check' that the fixes would be tested with 'make
> dt_binding_check'...

Still failing. Please send a fix ASAP.

Rob
