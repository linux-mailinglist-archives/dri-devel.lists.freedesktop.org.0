Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B185AAD2A
	for <lists+dri-devel@lfdr.de>; Fri,  2 Sep 2022 13:11:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3249D10E804;
	Fri,  2 Sep 2022 11:11:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEC5310E809
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Sep 2022 11:11:29 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id b142so1287467iof.10
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Sep 2022 04:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=0uxRZBOPLi+NS9/RxnDo7X4RCP5qkt6gVLnbm7RHdG0=;
 b=MDDK0E/FDsqrvMBSeQgKwGIHYGkmcNOk/JK2LfBWtKTnvz8UXigbZgJ8amIbXTgeZ0
 CJ58uJ3ILTmOU9dOiBID8MtuvQeceTweyTewSDUirG6oCXMlHs1hrKQYMH7eVLpSccXa
 nHqWLMPfhbDGIWv2gnaL4YKxq3V9NJkQYjTpQJJSGpzPb3EbkvG7hbP7rAPuHCqSECkC
 kI8o7dM3EolwUV/EKm2doVCxGCeq2fL2fyyb3G2jmjnRZwUY/1cMGSf83187L2r4fz+3
 yjUjQGsQIzwsbufaR/UV5lx5UNLm9Euadt2cY1Pp/uFFnoGXgxJWzLMnAZ06h81ayuXT
 P0Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=0uxRZBOPLi+NS9/RxnDo7X4RCP5qkt6gVLnbm7RHdG0=;
 b=yUtXr8R7LCHLiazLIlht0U2Uj0O9FI7vE73wmB7TZ1EMLfZbsf6KZcQQnVH42XgcUw
 cY/Yr5fm4D7ySzu40llBQi4E3wV/Dm+9RQFoNi8YYuz0RdcwJSTB46tly2+MOA6Nknd0
 M7bY5EV3HFOjUaf3hYyfBXVkU3WrTLTGQQBwLPSL3czPZE3rgj0Adj9oG48/xJ6nuH97
 HN431mRnTR4D9wU/PI/h2qz7taRPe5s/xOlh1VkVo/3Qi4OEJi1xY9Bh9yo9EUf3Ueef
 R4Np6DJKggb8mahWjFykTz6yux53I/njR9balMfADEs3wZ8iqmM46TMiMZGAmNLlp57+
 6UyQ==
X-Gm-Message-State: ACgBeo3DMHzClj4kEDSGB6GOv9ZfMXtmdILvZyNv2XIwZlOroYemEOED
 GDMRPEh1KVhIpi/sugnw2z6RpgnhjU7LI9hb9rhdqg==
X-Google-Smtp-Source: AA6agR46FuiTckak+7eI/hkJWGysIYCuexaGhU1eFwLL1oMDPn4WchWwt+YhdAsfjM/PsTajny0RiajCzr8ncAGjJpw=
X-Received: by 2002:a6b:3f88:0:b0:689:c144:328a with SMTP id
 m130-20020a6b3f88000000b00689c144328amr16521320ioa.63.1662117089052; Fri, 02
 Sep 2022 04:11:29 -0700 (PDT)
MIME-Version: 1.0
References: <1659608930-4370-1-git-send-email-quic_kalyant@quicinc.com>
 <CAA8EJpoAN4CVMKNouh3pPtX-5rnBeL3_T60M5cNhirNEmNeEkQ@mail.gmail.com>
 <BN0PR02MB8142FFB573A4D05B0560A13996639@BN0PR02MB8142.namprd02.prod.outlook.com>
 <04d77534-e2b5-b860-a59e-e1a511ed35ae@linaro.org>
 <BN0PR02MB8142049D9867BFD4CBC9B285967A9@BN0PR02MB8142.namprd02.prod.outlook.com>
In-Reply-To: <BN0PR02MB8142049D9867BFD4CBC9B285967A9@BN0PR02MB8142.namprd02.prod.outlook.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 2 Sep 2022 14:11:17 +0300
Message-ID: <CAA8EJprs02M05BPDP6Pb6htLKkH2nVG7o5MKu_1+_A3zeOnNcA@mail.gmail.com>
Subject: Re: [v1] drm/msm/disp/dpu1: add support for hierarchical flush for
 dspp in sc7280
To: Kalyan Thota <kalyant@qti.qualcomm.com>
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
Cc: "Kalyan Thota \(QUIC\)" <quic_kalyant@quicinc.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "dianders@chromium.org" <dianders@chromium.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "swboyd@chromium.org" <swboyd@chromium.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
 "Vinod Polimera \(QUIC\)" <quic_vpolimer@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 2 Sept 2022 at 12:35, Kalyan Thota <kalyant@qti.qualcomm.com> wrote:
>
>
>
> >-----Original Message-----
> >From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >Sent: Friday, August 26, 2022 5:02 PM
> >To: Kalyan Thota <kalyant@qti.qualcomm.com>; Kalyan Thota (QUIC)
> ><quic_kalyant@quicinc.com>; dianders@chromium.org
> >Cc: dri-devel@lists.freedesktop.org; linux-arm-msm@vger.kernel.org;
> >freedreno@lists.freedesktop.org; devicetree@vger.kernel.org; linux-
> >kernel@vger.kernel.org; robdclark@gmail.com; swboyd@chromium.org; Vinod
> >Polimera (QUIC) <quic_vpolimer@quicinc.com>; Abhinav Kumar (QUIC)
> ><quic_abhinavk@quicinc.com>
> >Subject: Re: [v1] drm/msm/disp/dpu1: add support for hierarchical flush for dspp
> >in sc7280

Ugh. I'd kindly ask to fix your email client to behave like a normal one.

> >>>> @@ static void _setup_ctl_ops(struct dpu_hw_ctl_ops *ops,
> >>>>          ops->setup_blendstage = dpu_hw_ctl_setup_blendstage;
> >>>>          ops->get_bitmask_sspp = dpu_hw_ctl_get_bitmask_sspp;
> >>>>          ops->get_bitmask_mixer = dpu_hw_ctl_get_bitmask_mixer;
> >>>> -       ops->get_bitmask_dspp = dpu_hw_ctl_get_bitmask_dspp;
> >>>> +       if (cap & BIT(DPU_CTL_HIERARCHICAL_FLUSH)) {
> >>>> +               ops->get_bitmask_dspp =
> >>>> + dpu_hw_ctl_get_bitmask_dspp_v1;
> >>>
> >>> We have used _v1 for active CTLs. What is the relationship between
> >>> CTL_HIERARCHILCAL_FLUSH and active CTLs?
> >> Active CTL design replaces legacy CTL_MEM_SEL, CTL_OUT_SEL registers
> >> in grouping the resources such as WB, INTF, pingpong, DSC etc into the
> >> data path DSPP hierarchical flush will gives us a finer control on which post
> >processing blocks to be flushed as part of the composition ( like IGC, PCC, GC ..
> >etc ) These blocks are contained in DSPP package.
> >
> >So, I assume that hierarchical DSPP flush does not exist on non-active CTL SoCs.
> >Which supported SoCs do support the hierarchichal DSPP flush?
> >
> Dspp Sub-block flush is supported from the DPU 7-series, the only target in the catalogue is sc7280.

Ack, thanks.


-- 
With best wishes
Dmitry
