Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 198AC4CC88F
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 23:06:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7B3A10E337;
	Thu,  3 Mar 2022 22:06:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C72910E331
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Mar 2022 22:06:41 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id ay7so6113942oib.8
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Mar 2022 14:06:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=r7kKCHWz3Rfv0TQHHwtEWE4mf+UhKdYlq+PNtd3O+F8=;
 b=Z/JYd4+V376HcbtMkvRBhrUgb5bIqQI7F34q31nMVDyB5DKCMuF39gIVI7GHkLnK5z
 xwecd6zPlWqMWR83kkWkOdDZRbFCWNM5KowBFcTzELnIZyrazGRjk+9YjZMMPeCzfSen
 Dc4coFcuRY/XfS2qdlrDgBfiaAjeb+BrfQnDE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=r7kKCHWz3Rfv0TQHHwtEWE4mf+UhKdYlq+PNtd3O+F8=;
 b=Wlj5ofXYyXNzVGjpl1cOANNlD9zS54wwRtrZaoIQsxeDH/LwmwAXBPuwaD9He4twvi
 Gjrj1R8hjc5YSuxYKhnrETOdzlYrZp1eoqdxuEqrtUR9m7PXM4rw+jZFgAdOXAFdksDV
 W1NGbfz9Jq4jv7MusTgTMCcSTXVx8SjA7WzqO4jKtUSo4s+qN3ENZs3xUxXn0JPRsvmK
 PU4N60h3ZFnRzzC2bXB7qSADpmay9XfA2rbllL857V2Pivrw9ku+oG+h1DrvqZUBMH8H
 TmQzG4AJmMmn6uPqSBscecM9FsJm0UdQjQrWowGL9Wxs75uMhTsRys+gbL34edhqP/GT
 8cag==
X-Gm-Message-State: AOAM533OAn8E0fM1GcGP8/3YqbiPg+3I3TMvNPIUyuYV2IfUZmgi3xAm
 9fug7KkfoZY4jQA1JwEnlt7sEqHC9wjqeqF/u8qHfQ==
X-Google-Smtp-Source: ABdhPJyMZuWL+CCeZIqQWqg/RiahdrvQ8SCiVP/B4EwHgyJoeXa1tCMmS59sHA3zE1RwwWN0mnFkZj+JMSwmHPiUj3g=
X-Received: by 2002:aca:3346:0:b0:2d9:91f9:a7f2 with SMTP id
 z67-20020aca3346000000b002d991f9a7f2mr809414oiz.32.1646345200874; Thu, 03 Mar
 2022 14:06:40 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 3 Mar 2022 14:06:40 -0800
MIME-Version: 1.0
In-Reply-To: <1646300401-9063-5-git-send-email-quic_vpolimer@quicinc.com>
References: <1646300401-9063-1-git-send-email-quic_vpolimer@quicinc.com>
 <1646300401-9063-5-git-send-email-quic_vpolimer@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 3 Mar 2022 14:06:40 -0800
Message-ID: <CAE-0n50sRHDaBdKADrqXMR1Dc7s=Stj_eY3Go=VPTTHRHtiUPQ@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] arm64/dts/qcom/sm8250: remove assigned-clock-rate
 property for mdp clk
To: Vinod Polimera <quic_vpolimer@quicinc.com>, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org
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
Cc: quic_kalyant@quicinc.com, linux-kernel@vger.kernel.org,
 dianders@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Vinod Polimera (2022-03-03 01:40:01)
> Kernel clock driver assumes that initial rate is the
> max rate for that clock and was not allowing it to scale
> beyond the assigned clock value.
>
> Drop the assigned clock rate property and vote on the mdp clock as per
> calculated value during the usecase.
>
> Fixes: 7c1dffd471("arm64: dts: qcom: sm8250.dtsi: add display system nodes")
> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
