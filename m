Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 50FB750C60A
	for <lists+dri-devel@lfdr.de>; Sat, 23 Apr 2022 03:38:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AEA110E283;
	Sat, 23 Apr 2022 01:38:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com
 [IPv6:2001:4860:4864:20::35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA56C10E2D9
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Apr 2022 01:38:47 +0000 (UTC)
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-e5e433d66dso10429519fac.5
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 18:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=98Q4KjRvjXM0WQPHZUCc5YLZNElnBXI0Q4eC5MfmUig=;
 b=k9a6JGU17lPps5sbFfsmrztGSV/zL0+DC4LCy8hfnFFRNlK3hMnkZdQlhPTQtnmjRY
 3wjBJTvJ5Vsx0dJpwdSNsAuJUz7h22PH0sQ+beTiWIJvsz+z/1ycgNfkuiMzJGyBtvbg
 cJVAUi1g0etBvKVT4kVNTt1YZMGIDFwFBrcyY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=98Q4KjRvjXM0WQPHZUCc5YLZNElnBXI0Q4eC5MfmUig=;
 b=bS3KPHhZGJW7d6NCOMvox95aufy/1PqGm8XqrBc5uaXw+qEuuf203HdzXFIESFGMHy
 Wh/4BK5P9hXlMnoosWTADEMIU7qlEQ774+LiBCFvDgcUdE1zgdNaMoPP/WNsTzrfoHz1
 zy2yupzyfWO+Vh6an808/PCn3FEQX7cK4IyElzUJWBN5JMnfifEykbqQjlwvx6ra5CGl
 8GPvT+alIN1foRiOsQW5erVyuQsSyyJO+kn++FZDzg8Y9ySsJkYVAL1kVrScvrztHSnx
 R5KJQxq5CGgC/Gl7L2zcVN+MvkF8QeP87XTZ9yb+RF6WH+nFNTiqBsU8Yv7+JEdKrgh4
 s7Nw==
X-Gm-Message-State: AOAM531nJJx7sWslmMVyU4lNIptDOL9vD5GH3h0FR9GjtQAXrcbgxXrP
 6AUOkc6jMy/taoo3BC3cC9OSPPCdlQ8+czHV0LQ/Aw==
X-Google-Smtp-Source: ABdhPJwlNqj63PkZquQxnFkGieqNdLLQiY/83YWsqgq1LyL+nK1ybanQly0mL7jbdoUfgkPKLIFUeSjxb0+Oi7jnSBA=
X-Received: by 2002:a05:6870:15ca:b0:e9:551:6d1c with SMTP id
 k10-20020a05687015ca00b000e905516d1cmr1868942oad.193.1650677927041; Fri, 22
 Apr 2022 18:38:47 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 22 Apr 2022 18:38:46 -0700
MIME-Version: 1.0
In-Reply-To: <1650618666-15342-4-git-send-email-quic_sbillaka@quicinc.com>
References: <1650618666-15342-1-git-send-email-quic_sbillaka@quicinc.com>
 <1650618666-15342-4-git-send-email-quic_sbillaka@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 22 Apr 2022 18:38:46 -0700
Message-ID: <CAE-0n520s1XdUO5k2xxX16AsJc8pCjV8yXeR-0f5BC7A5+f-Vw@mail.gmail.com>
Subject: Re: [PATCH v9 3/4] drm/msm/dp: wait for hpd high before aux
 transaction
To: Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
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
Cc: quic_kalyant@quicinc.com, dianders@chromium.org, quic_vproddut@quicinc.com,
 airlied@linux.ie, quic_abhinavk@quicinc.com, steev@kali.org,
 quic_khsieh@quicinc.com, seanpaul@chromium.org, dmitry.baryshkov@linaro.org,
 quic_aravindh@quicinc.com, bjorn.andersson@linaro.org, sean@poorly.run
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Sankeerth Billakanti (2022-04-22 02:11:05)
> The source device should ensure the sink is ready before proceeding to
> read the sink capability or perform any aux transactions. The sink
> will indicate its readiness by asserting the HPD line. The controller
> driver needs to wait for the hpd line to be asserted by the sink before
> it performs any aux transactions.
>
> The eDP sink is assumed to be always connected. It needs power from the
> source and its HPD line will be asserted only after the panel is powered
> on. The panel power will be enabled from the panel-edp driver and only
> after that, the hpd line will be asserted.
>
> Whereas for DP, the sink can be hotplugged and unplugged anytime. The hpd
> line gets asserted to indicate the sink is connected and ready. Hence
> there is no need to wait for the hpd line to be asserted for a DP sink.
>
> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
