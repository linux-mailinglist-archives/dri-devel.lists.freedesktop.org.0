Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72638543E1C
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 23:03:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41B7611A2A4;
	Wed,  8 Jun 2022 21:03:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com
 [IPv6:2001:4860:4864:20::36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 561C411A2A4
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 21:03:19 +0000 (UTC)
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-edeb6c3642so28794116fac.3
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jun 2022 14:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=65dBCxsJ6dC2Uyj0TcbkJX+Arrc/ZeAtploHCpvdkV4=;
 b=JZ2d5sKtFvwhs4lLkMBqeCq+MOTix1afL+PKZNuyXaNU2Vx0Nh3veu47lY06+E1tnY
 sAxPLa+shJV1QjcZ97F64XdSjtiaTo2v91/3tmUifh29co+jCBDsbqs2mIk95p1X5XgJ
 iot2r3NUGDjCRictGzl6QvrCnn3tT1TMpNItg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=65dBCxsJ6dC2Uyj0TcbkJX+Arrc/ZeAtploHCpvdkV4=;
 b=TBKcfMRjQnPdfhcc4mg060lmfpybIDx/ecjy43EkL4TxUSqGcqbvFlIGKG5B/JG5eI
 KGJ16XGa9wNPJFdNlDqqE8LzjjSK78EGDxKqZWnlFPiAfTATMnG7vGyzp3xP25chhFZX
 t2KTbCrKifAHvBTcVr85LLGILL27eg4h2BtotmQyGCSuJy8Hz3WVFo246CAjewLR0YPy
 UpbZMsgrNHDlI7cODBZ0i4MvhYw2iL3skuPogiOUOAB0YoHGgPf5tn1SjzVAaECpNBVg
 N3RF5cuqFroATvClZCmszM9/u9PUvz5Qp/EYnz+EqfuIvDXUOoJVBUXHkMMAygrvIC9t
 OppA==
X-Gm-Message-State: AOAM5330BkhjuJlLml02cBcFaHHlqGCfs1xnNKkjJBPC/B/ah6VY4nya
 bNq+oYe4cn4SfF7frzoZrZNlkv6d8/wl63YcYn3nWA==
X-Google-Smtp-Source: ABdhPJyUVWcKxF93dWj/tXelu1J2T7r+P63jOMACN654/la794ZorpfGFI+EJb9tB2lJs3lmxKyb/vuZ2OejEiwMArw=
X-Received: by 2002:a05:6870:b381:b0:fe:2004:b3b5 with SMTP id
 w1-20020a056870b38100b000fe2004b3b5mr1766467oap.63.1654722198626; Wed, 08 Jun
 2022 14:03:18 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 8 Jun 2022 14:03:18 -0700
MIME-Version: 1.0
In-Reply-To: <20220608120723.2987843-10-dmitry.baryshkov@linaro.org>
References: <20220608120723.2987843-1-dmitry.baryshkov@linaro.org>
 <20220608120723.2987843-10-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 8 Jun 2022 14:03:18 -0700
Message-ID: <CAE-0n52JtdmhtKP2_3Qw=fZV+ALW4qQPN81JgVcV+Xmver42iw@mail.gmail.com>
Subject: Re: [PATCH v2 09/12] drm/msm/hdmi: drop hpd_regs usage on 8x74/8084
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Clark <robdclark@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, Sean Paul <sean@poorly.run>
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
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-06-08 05:07:20)
> The MSM HDMI driver has support for hpd_regs on 8x74/8084: supply
> regulators that are to be enabled for HPD to work. Currently these
> regulators contain the hpd_gdsc, which was replaced by the power-domains
> support and hpd-5v/hpd-5v-en, which are not used by the chip itself.
> They power up the ESD bridge.
> However it is a separate device which should be represented separately
> in the device tree.
> None of upstreamed devices support these properties. Thus drop support
> for them from the HDMI driver.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
