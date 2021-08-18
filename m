Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4005D3F0C6B
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 22:07:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C03F6E8C8;
	Wed, 18 Aug 2021 20:07:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EADFF6E8C2
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 20:07:38 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id
 k12-20020a056830150c00b0051abe7f680bso553417otp.1
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 13:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=cfm13iXUxECEplWQ0q6Pxak3YtFCZRWGUuhoBsOQF1o=;
 b=FiSrUv34t+HgydbQhzRo7RHOAQFm9OxrQI98LwsaMAeyJz41igKBAGF/7khk9DESSF
 2uo0zyzxy+hlRiFcu5axiGiY/bPo8RUcNImSiN3Kyq+BuI8hGe5+GFGRUA4J2mgdicgA
 OE3Al9FgiJ2bfV2UIx6fosxcF57TPy/3vdZ7M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=cfm13iXUxECEplWQ0q6Pxak3YtFCZRWGUuhoBsOQF1o=;
 b=fsZyCcl8MOY8D3wd9yLn/RHHOMAwmuDdMbs3L2XaVbca8POmnGSC4e7aeY5ycH01/L
 SGQlP09/5wqqp6Bfm9TihYo1fsODxbtFkD+AQyu5Tsly5YM/+L9sMeGX536G+KKp2S7v
 fL0fyk0IC94mjV+FI2D3DW24vCh1+qBZ3zLO1Q3M8oQhsRJikdcOfecltz4Em4vKeFDq
 L9qfZOamrNlXQwI1DIH625MU7zo91OQQLvtCXshAIT5UFVrb7h/HihGtnc6s5tgLRbV+
 ZDmhsCiJRxfIEcuDn+af+rxbLbsogZw4mjHAP2eSGN3IymCO9KIW5pHLOSVBKf2ULfYO
 L0fg==
X-Gm-Message-State: AOAM533k2Aaxs/w0qG88sE9uTGS7WQ+rLM15L4ha1rKatARqhzxImFV9
 /AFitgEtmAUeJ7xHdPmVcWvplXCHIbm4VAsar3qnPw==
X-Google-Smtp-Source: ABdhPJyELNhhchyiGz4aTzehMCOLQwh2D+h4c08VfwqU9GfrDc66h204pRTnxTXnauLt5QAn0FSePec2ZgVpt81vPKo=
X-Received: by 2002:a05:6830:2473:: with SMTP id
 x51mr1798273otr.34.1629317258305; 
 Wed, 18 Aug 2021 13:07:38 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 18 Aug 2021 13:07:37 -0700
MIME-Version: 1.0
In-Reply-To: <1629282424-4070-1-git-send-email-mkrishn@codeaurora.org>
References: <1629282424-4070-1-git-send-email-mkrishn@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Wed, 18 Aug 2021 13:07:37 -0700
Message-ID: <CAE-0n52r-+MjLO0o3JOWCsLHHWVOYNKnSuZYTwiarpJW-M643g@mail.gmail.com>
Subject: Re: [PATCH v1 1/4] dt-bindings: msm: add DT bindings for sc7280
To: Krishna Manikandan <mkrishn@codeaurora.org>, devicetree@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: kalyan_t@codeaurora.org, sbillaka@codeaurora.org, abhinavk@codeaurora.org, 
 robdclark@gmail.com, bjorn.andersson@linaro.org, khsieh@codeaurora.org, 
 rajeevny@codeaurora.org, freedreno@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org
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

Quoting Krishna Manikandan (2021-08-18 03:27:01)
> MSM Mobile Display Subsystem (MDSS) encapsulates sub-blocks
> like DPU display controller, DSI, EDP etc. Add required DPU
> device tree bindings for SC7280.
>
> Signed-off-by: Krishna Manikandan <mkrishn@codeaurora.org>
> ---

Please send a cover-letter next time.

Do you have the display port dts bits and driver code ready too? Can it
be part of this patch series?
