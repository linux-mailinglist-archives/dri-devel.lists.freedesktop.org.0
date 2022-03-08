Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F324D2285
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 21:25:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C522910E25E;
	Tue,  8 Mar 2022 20:25:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com
 [IPv6:2607:f8b0:4864:20::c2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3C8710E556
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 20:25:53 +0000 (UTC)
Received: by mail-oo1-xc2c.google.com with SMTP id
 x26-20020a4a9b9a000000b003211029e80fso376467ooj.5
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Mar 2022 12:25:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=2UXmQ50P7tN4nCifSsYLR5v4PC0QeUfNpesrP6Nz2bo=;
 b=UnBlg7FjIvKHdIM/8qFzs/2KBWiZLm7f9JvWz0IKkewxQ1/Zhr7+PheRLI05qkcc+3
 pASI0vapPEsrO9tpxNGtZ5cuekPc76PMGnIKbr9LMSAWUE9pakBEXWOFHi6+roOSpuUa
 QLT1GBBANS6oJ3m42NJnfwcF0Lc38etOsDvJY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=2UXmQ50P7tN4nCifSsYLR5v4PC0QeUfNpesrP6Nz2bo=;
 b=dsc9Uk1qxBdRUtBmt4AIV8UMIbU1axqwwIpZQhhvKs4QHQxk7WHfInS30R53zN3xHy
 FqDWn0aXKzCKwK4yOVrXIPHNpQJnaSzBjhIrLR88Dy0cw/zKqiQyuSZ+RpwLu97DCurH
 Ja66Kc+kl8j9UiD0re7uiQEGYutaIMUUgcfossx0H9wHsD45xhWG/IdvseIDJY9odXag
 TKMgWeC42wM47EuW4X16duk9eeNt+KOgb7V4KOxBWslJ5t6tZPLPfn6RvxHmWLXD1QoS
 H2HJmUMPJblG/KSoBPezKIM9y1uqBIGW4rzxHpu/n5Gq/US8pE513FHdqTIBgZqQOKcD
 AKcw==
X-Gm-Message-State: AOAM532NJBP+KHNQVHE6DZWgkU4RxNr6H2OtPwnM/Zt1kpuUhs9uZ7Z4
 KuJFVYj79/0rOAUu+JgoSNvJQROmHuUdiT8MpRw0Iw==
X-Google-Smtp-Source: ABdhPJznHjaBW3HlsoRzKsRdv2O2Pu9HzfsfCXAIfzhdmW0Ezry2PXhAde/tG2cfzvENxhTq1veN8mnHh0KzqzzWoH0=
X-Received: by 2002:a05:6870:d250:b0:da:b3f:3211 with SMTP id
 h16-20020a056870d25000b000da0b3f3211mr3469915oac.193.1646771152990; Tue, 08
 Mar 2022 12:25:52 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 8 Mar 2022 12:25:52 -0800
MIME-Version: 1.0
In-Reply-To: <20220304032106.2866043-2-dmitry.baryshkov@linaro.org>
References: <20220304032106.2866043-1-dmitry.baryshkov@linaro.org>
 <20220304032106.2866043-2-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 8 Mar 2022 12:25:52 -0800
Message-ID: <CAE-0n52wgr-EENZoNKTu5cAur5=f7spxu2EYFUkdKsFF_=q0hQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] drm/msm: unify MDSS drivers
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
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
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-03-03 19:21:02)
> MDP5 and DPU1 both provide the driver handling the MDSS region, which
> handles the irq domain and (incase of DPU1) adds some init for the UBWC
> controller. Unify those two pieces of code into a common driver.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
