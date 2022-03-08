Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A789F4D2229
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 21:05:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B7B010E53F;
	Tue,  8 Mar 2022 20:05:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com
 [IPv6:2607:f8b0:4864:20::c2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53C5A10E53F
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 20:05:41 +0000 (UTC)
Received: by mail-oo1-xc2b.google.com with SMTP id
 h16-20020a4a6f10000000b00320507b9ccfso301507ooc.7
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Mar 2022 12:05:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=QX67c8/LWZdvLCoz7zI9uFhqDQjOSWv595jQDqaaHvw=;
 b=AoYICMH8irjSWwtZb+Z4eLYjCkWJeNSak3Ym+tkyXo7JKkBgfi/ApgCW8h+4uiTLk4
 9/ZBh92aXPInfCxmDlAWVb4MzPrC9fWhQAXR1EaTZrKwakYnK4HXEBRhrYs3Ep5zfB2E
 sF7dLTDPwJru+Mre8SMqknSkzXsiym3TOgeUA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=QX67c8/LWZdvLCoz7zI9uFhqDQjOSWv595jQDqaaHvw=;
 b=sZSyuvxRo7l/twTmnC7wGxbXYJ9Ow2PQmEp6z0W3sBDDdBL9aj9gjdggR9YQUCcEBz
 uxdwWHl/oapcgUnvJiB33abE39JWaPaMLARNhN52LjMQTyApwPEcMn7GU8MwBha/y75t
 aCNe0hvwMXBm1JyEAhoY1qKJCSaMBeA0Hsp7V7AeWtNsqMzzzbQUvhB3ddKpiJscFewP
 Qk7wQlr4OKXC5j6zN4n36rbofhxcK2ISpgBDakjg7tgR4OoHaiMDQfqi7GYl7G9m+CCL
 h45JRRTTUTqISLJuwfPLnmQEilE3/eQjSGydBRxAxgUxeZdj/Z2GIzQ3MbGSYm+2Zlnr
 i2EQ==
X-Gm-Message-State: AOAM532OWRwRzYyJLhgrOTGQ8JeKTUETMVLvv9oL6WMFvsxrZ2I0GopC
 oS8NyTlubJwY3AlpAKLVzeAbSjq8tePR5YL3occ/Wg==
X-Google-Smtp-Source: ABdhPJxFRuIHirmuMcP8JQW2CiIQQrW1zixcggRe6oOvjNpt2ZWhCvmWo6ALkosrHI8M9jLM4bLDX5HuCCoQWjlEW1Q=
X-Received: by 2002:a05:6870:d250:b0:da:b3f:3211 with SMTP id
 h16-20020a056870d25000b000da0b3f3211mr3425601oac.193.1646769940572; Tue, 08
 Mar 2022 12:05:40 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 8 Mar 2022 12:05:39 -0800
MIME-Version: 1.0
In-Reply-To: <1646758500-3776-2-git-send-email-quic_vpolimer@quicinc.com>
References: <1646758500-3776-1-git-send-email-quic_vpolimer@quicinc.com>
 <1646758500-3776-2-git-send-email-quic_vpolimer@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 8 Mar 2022 12:05:39 -0800
Message-ID: <CAE-0n51bfqWs8yOiyQ-A_bEQ7CZSqavz8epcFEWYyZxxoRYFHg@mail.gmail.com>
Subject: Re: [PATCH v5 1/5] arm64/dts/qcom/sc7280: remove assigned-clock-rate
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

Quoting Vinod Polimera (2022-03-08 08:54:56)
> Kernel clock driver assumes that initial rate is the
> max rate for that clock and was not allowing it to scale
> beyond the assigned clock value.

How? I see ftbl_disp_cc_mdss_mdp_clk_src[] has multiple frequencies and
clk_rcg2_shared_ops so it doesn't look like anything in the clk driver
is preventing the frequency from changing beyond the assigned value.

>
> Drop the assigned clock rate property and vote on the mdp clock as per
> calculated value during the usecase.
>
> Changes in v2:
> - Remove assigned-clock-rate property and set mdp clk during resume sequence.
> - Add fixes tag.
>
> Changes in v3:
> - Remove extra line after fixes tag.(Stephen Boyd)

This changelog should be removed.

>
> Fixes: 62fbdce91("arm64: dts: qcom: sc7280: add display dt nodes")

I thought folks were saying that this is bad to keep? I don't really
mind either way, but I guess it's better to drop the fixes tag because
this is largely a performance improvement?

> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
