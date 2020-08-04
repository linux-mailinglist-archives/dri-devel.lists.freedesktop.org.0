Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A4D23BD5F
	for <lists+dri-devel@lfdr.de>; Tue,  4 Aug 2020 17:42:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08FA289FD3;
	Tue,  4 Aug 2020 15:42:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9827889F8B;
 Tue,  4 Aug 2020 15:42:09 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id v22so19439846edy.0;
 Tue, 04 Aug 2020 08:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=G7TWxU3RrpRjJxbp4gq/13lUnFREHVtoNcL++CjhnMk=;
 b=esM63yMeDOa9kxDHU3HwnQXBgFY03PDyLbgTuKbQKFYMkCuVWb4LLj/+fynZ6g6SBJ
 6eu0Gicqk0VlH6PeWt0sV+AYteVRl4mfmIxoOguGp0cCOHbbLI7xSAccIXgb6EixkACD
 9fhBu2QD3Z5pvLxUo/rc/O/fk6jY0JJSN0Tmno+fvKhMLmopa90JY9q9q2xtAQeZpkUk
 bIP0Brgdb4cfxmQkxLjEzeEwoMO/PvHY1MKs7BXSI4hOjvTg9laFrzrbZ+iB/EUmkR3E
 qSn52LEWtVIsBQwRQK6RcIEwUvt1SLZPp6wX93ZVXJkVKhb1vPqXBeiEpT6COLeMMVQL
 kBBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=G7TWxU3RrpRjJxbp4gq/13lUnFREHVtoNcL++CjhnMk=;
 b=SyAxZEMn0bAzcbWUFRen9FyWcJOXZIof+Xm3QIInNfoqqWbSky8b7ND7xu+bdext2p
 650OD4yXHsqyP42vEbFU3cbDlp2EWo3nu5+7l0DMB0WXTHPofO3KPB5mrADOhgSsZxy7
 KQFuXGwEDstTtTetPYPE41LGxUreQXE71ZFVcWm1s707B23pb04GvFMe/yNMEPvrp7Ho
 u+e5O60TcbNgaQvozOgM4tZzbvCf3Z8oYnG0P9usP+f2kGSpudobWUYQIUOgt+ttCqCv
 KhY6pQNoqDz7GsjJ7hxneP0iaFjsg/3bLWgttIxys9NyV8jfx1xu/FBfO7/EgCkf8399
 BxOA==
X-Gm-Message-State: AOAM531pvI5jWIABtg3FqZ7VBkh5iWcTG737tW4Nvh9RzFkfmijWkgZb
 ISHbhNugteFuJ68d7b2dRlrJQjJ+aGoFbU48gp3xYiSoAj0=
X-Google-Smtp-Source: ABdhPJxiSFDp4mmG/vqyuuKnvkaR7c1gRfsVdMfHLNjvZeQBwYrQ/3kBZh7BWg2AVcLM3ET4vFJCzcHQa2eAHVvewk0=
X-Received: by 2002:a05:6402:1c10:: with SMTP id
 ck16mr20692925edb.151.1596555728124; 
 Tue, 04 Aug 2020 08:42:08 -0700 (PDT)
MIME-Version: 1.0
References: <1594899334-19772-1-git-send-email-kalyan_t@codeaurora.org>
In-Reply-To: <1594899334-19772-1-git-send-email-kalyan_t@codeaurora.org>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 4 Aug 2020 08:42:52 -0700
Message-ID: <CAF6AEGuNk+bhjULnng1pNKh1yoxcXEF8jHB-1jYJuYnBos64AQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm64: dts: sc7180: add interconnect bindings for
 display
To: Kalyan Thota <kalyan_t@codeaurora.org>
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
Cc: Krishna Manikandan <mkrishn@codeaurora.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Raviteja Tamatam <travitej@codeaurora.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Douglas Anderson <dianders@chromium.org>, Sean Paul <seanpaul@chromium.org>,
 "Kristian H. Kristensen" <hoegsberg@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 16, 2020 at 4:36 AM Kalyan Thota <kalyan_t@codeaurora.org> wrote:
>
> From: Krishna Manikandan <mkrishn@codeaurora.org>
>
> This change adds the interconnect bindings to the
> MDSS node. This will establish Display to DDR path
> for bus bandwidth voting.
>
> Changes in v2:
>         - Change in commit message(Matthias Kaehlcke)
>
> Changes in v3:
>         - Updated commit message to include
>           reviewer's name in v2
>
> Signed-off-by: Krishna Manikandan <mkrishn@codeaurora.org>

Reviewed-by: Rob Clark <robdclark@chromium.org>

> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index 998f101..4f2c0d1 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -1522,6 +1522,9 @@
>                         interrupt-controller;
>                         #interrupt-cells = <1>;
>
> +                       interconnects = <&mmss_noc MASTER_MDP0 &mc_virt SLAVE_EBI1>;
> +                       interconnect-names = "mdp0-mem";
> +
>                         iommus = <&apps_smmu 0x800 0x2>;
>
>                         #address-cells = <2>;
> --
> 1.9.1
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
