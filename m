Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C1045E5CAC
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 09:51:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A254810EA65;
	Thu, 22 Sep 2022 07:50:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2751510E1B4
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 07:50:54 +0000 (UTC)
Received: by mail-yb1-xb2a.google.com with SMTP id s14so11554302ybe.7
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 00:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=Sds/Dyb9ikOJ5Khfgi4mahargaDHP26IO9csDUpISkI=;
 b=AL32irr9FYBKUHIMMo9eydEHfgQBuJXAF1H89Pdx7WfEOgLxDFof1d2iloaxmHz3MU
 7A6q3mQUUPlbgcPO1mv30xD6Jh46/G3ZSbLL9NzwwHNOmyDfps3O0ZS5hNnQHVsGEjqw
 kXXFtzjE6X/0uMrKBwPoj9qBj1e6naSv66VFWpxMUPKtV8A8owNf7h3nT5KRtiJqtjz+
 GicpVKAZCIBSVdcU/cNIZ7FW/Si2ErxCcRy15qVAjuTmExkgv/eU+gkTLgcWwLd4u0GQ
 nU8nLPhL81yotdmJHno45uTGy12/qx7v/7BFzCS7mnB6kltpVmz7iQx9Y2+oc7L3Lsai
 WRrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=Sds/Dyb9ikOJ5Khfgi4mahargaDHP26IO9csDUpISkI=;
 b=XY/7gbF5fGhd/XbJ0C4yuKl1lJDqgIihv4i5IoPV+poUxqocFelad7GvFdifgJiLO2
 k4CKA1LsIu/tzsD7vrm7ZeNJuTwkFZ/cutDahhg0JvVypmaFe9ZH/EDZuKHT0HvM/4Sg
 KccWP9/lZP+I9OYv8iy8E3OaCS22EpM303T+hyXKPnBxUDKXfB2UaKenx779MWUi94UG
 rD2PLOIguEXplzfUoMvYVtymRIo5sdDKyqxWrJlJdwKa2+Rmq7Vcd1Z7/dkKnf4xZMQC
 6xMnyThm1UM5njqFXrxez3gmA/tFsvs1I2f5tD29sfC62txvrCswapVeBPWoIGeWcsLC
 3fVQ==
X-Gm-Message-State: ACrzQf0JjO+c6/T/ssN2BMKrZmPyuDzVr9r48EocGEWXG4g6Y3nH4yiM
 vJ/J2rNxJkAH+UkDJQTwtsHAuBCux5ysPkXJhIosGA==
X-Google-Smtp-Source: AMsMyM4crSAFL+O0e+s4NTT408WVmhHJaTlutWu7sbiOJhejjg0f2UMZVY1/RmXcx4UZDj4v7SZabrQOYZMdyXO+xKs=
X-Received: by 2002:a25:81cf:0:b0:6a9:4d0d:5ee6 with SMTP id
 n15-20020a2581cf000000b006a94d0d5ee6mr2392450ybm.153.1663833054098; Thu, 22
 Sep 2022 00:50:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220915133742.115218-1-dmitry.baryshkov@linaro.org>
 <20220915133742.115218-5-dmitry.baryshkov@linaro.org>
 <2c7769ae-79af-dab5-ebe3-31ccca0bd9a4@linaro.org>
In-Reply-To: <2c7769ae-79af-dab5-ebe3-31ccca0bd9a4@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 22 Sep 2022 10:50:43 +0300
Message-ID: <CAA8EJppRdrfy5vPuLxH0+=DAELdadK4h6X0xmHA01rySoBFN7g@mail.gmail.com>
Subject: Re: [PATCH v7 04/12] dt-bindings: display/msm: move common DPU
 properties to dpu-common.yaml
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, Andy Gross <agross@kernel.org>,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 22 Sept 2022 at 10:02, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 15/09/2022 15:37, Dmitry Baryshkov wrote:
> > Move properties common to all DPU DT nodes to the dpu-common.yaml.
> >
> > Note, this removes description of individual DPU port@ nodes. However
> > such definitions add no additional value. The reg values do not
> > correspond to hardware INTF indices. The driver discovers and binds
> > these ports not paying any care for the order of these items. Thus just
> > leave the reference to graph.yaml#/properties/ports and the description.
>
> This is okay, but you loose required:ports@[01].

This is fine for me. The ports do not have 1:1 correspondence to
intfs. Usually platforms add ports as new sinks are added. For example
a platform can start with a single DSI node and later get second DSI,
DP, eDP, etc. as they are receiving support/required by end-user
devices.

-- 
With best wishes
Dmitry
