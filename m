Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 227ED54FE94
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 22:57:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB54F10E4CF;
	Fri, 17 Jun 2022 20:57:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6059610E4CF
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 20:57:04 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 l24-20020a0568301d7800b0060c1ebc6438so3929735oti.9
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 13:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=vMRFR0GXyCuyzUO1zmdvO0SdG3g9jDS3szGGSmZwvdo=;
 b=EoWrsaIdWmfmOGr1BtwEg2WSZK+OU+lG3deDCXDzb74IKSuCLjUw48r/Au0ZdFbBld
 CtADV5mdsqtHPiJQnM6grFYj+RXcVZ25BiaOF+SeT3sWq4i0Z9auBAbHmX9HOV5Xn+AO
 W4/IHFd1Zk/BzdQQ1hCIwfywNaHuB2eYr/RVE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=vMRFR0GXyCuyzUO1zmdvO0SdG3g9jDS3szGGSmZwvdo=;
 b=7pEewIoU8iavllViCI02pY3Tn5RdP4QFzZQuiBOBpca5+lB/+mAKw6+kTkGXrb9LnP
 9n6iMTgS1IyvqIdslR4xOptMwmdlUjawOUKZerA4G55FP7MnSoOa0Mdvf8bhx0pkCTja
 2hDpsG2aGX51Tqs7jFQihVw6M8r41Idxb5wSUMhYhudMkHSVBT9swmIWq3DDV6aWkU6s
 fIJUpxLpwwf29WraV72TCQDVAKMd40uKJ+eCtrIPNBIlekyS6jmgJXL8M5ExArL5aABA
 VDT2KQaETVFSdjusJ8qNyE/Q1Dwr3R/RR3IRTXb4f2xV4P1IE6B2eafIXRDf3iG6YVy0
 r+oQ==
X-Gm-Message-State: AJIora8E7KDDvaaAWvzOMQChe6EHfB1h89PXH8JJpf2ibJ9ENnJO1c8w
 J/xHbkwMGQAcB8azpt/dAQmD/YljhEcgReZJO0NBtA==
X-Google-Smtp-Source: AGRyM1sfzKoW9WyzAhvY11tv9iFwse5ymjpHxzBQ0uh1UWvv6lmB401+6sUT+IuSWkFK2+PScwaSfV3+9PXqLXqk5Zw=
X-Received: by 2002:a9d:6484:0:b0:60b:eb0b:4054 with SMTP id
 g4-20020a9d6484000000b0060beb0b4054mr4760290otl.159.1655499423686; Fri, 17
 Jun 2022 13:57:03 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 17 Jun 2022 13:57:03 -0700
MIME-Version: 1.0
In-Reply-To: <20220617103608.605898-4-dmitry.baryshkov@linaro.org>
References: <20220617103608.605898-1-dmitry.baryshkov@linaro.org>
 <20220617103608.605898-4-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 17 Jun 2022 13:57:03 -0700
Message-ID: <CAE-0n50=Lbrs84oivqni0oBNk0KSY9yGvkYFXggekwVDQ80fyQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: msm8996: add #clock-cells to the
 HDMI PHY node
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, linux-phy@lists.infradead.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-06-17 03:36:08)
> Add #clock-cells property to the HDMI PHY device node to let other nodes
> resolve the hdmipll clock.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
