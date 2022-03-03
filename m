Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 069B54CC934
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 23:38:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B63DA10E3B8;
	Thu,  3 Mar 2022 22:38:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0D4D10E3B8
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Mar 2022 22:38:15 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id yy13so4876025ejb.2
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Mar 2022 14:38:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ST9Fc76g6pvjQi4fhR+noZ4Seq3datbHBQS0X9jUxZ8=;
 b=FrOz5ub3zWjEQK22ZLwg3u+vEvcmxk5pcWahe3+zoJFfvsvs0UQBjv/AElEkUlyAw9
 EePN55pYYRl4RbnXJxniWi54yJRwLRFnUpNNgmipiWdmEHy76MIi5bA6dIIROOGw5+9j
 DlrsvRRt7Ab5hlgGMIvKwZMS89rVmz14yqa6Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ST9Fc76g6pvjQi4fhR+noZ4Seq3datbHBQS0X9jUxZ8=;
 b=XOyNOURyHQAVh5evfJL8xB+s1+FILThCwsMR85fMx9RDorHS55ALMetvOLlqBk361C
 kVfiwcGJO/037qjwIGP2Nmkeu1Fc17KSKlOFqWlX3KMbyy6pbVhRRnWXMV+RO/ocv8DW
 tshI563sKOFlJ7O21Z9CfbMsAHqAHzxUz1HjYbjgUy84VyAtYegGeQScE3EoCJe+s8BC
 Zt7SnvHDnT3uOyE1g5ge925SUO6GYzjdfW2EOlV2F6CpS1l9maFsOZUGx1FmzcmdmVkY
 4dBdbLgRe8SR8L5SMGGZ0JUCvCWkutHQ4E07J2A6jvwd5CDHFQBxuInmnC+HhfQl88hl
 mq2A==
X-Gm-Message-State: AOAM530pMEXux7ayT4gp+pMOrlODeYQkuohCNnUia25GoQx6BvI2aq/Q
 B83bnBqa4/yUesav7zXdRmxwj7WqHuEhFQ==
X-Google-Smtp-Source: ABdhPJzWiMy3HqTT2Qy9/8L2V4GY71JDuBgU/9nhNsYsqa+PxngWpS/KxZe3QH6q3ccP02PgoAnq1w==
X-Received: by 2002:a17:906:3fd4:b0:6da:8ab0:a882 with SMTP id
 k20-20020a1709063fd400b006da8ab0a882mr4664498ejj.572.1646347094022; 
 Thu, 03 Mar 2022 14:38:14 -0800 (PST)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com.
 [209.85.128.45]) by smtp.gmail.com with ESMTPSA id
 o2-20020a50d802000000b00410d7f0c52csm1419703edj.8.2022.03.03.14.38.13
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Mar 2022 14:38:13 -0800 (PST)
Received: by mail-wm1-f45.google.com with SMTP id
 l2-20020a7bc342000000b0037fa585de26so4564446wmj.1
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Mar 2022 14:38:13 -0800 (PST)
X-Received: by 2002:a7b:c381:0:b0:37b:e01f:c1c0 with SMTP id
 s1-20020a7bc381000000b0037be01fc1c0mr5453850wmj.98.1646347092922; Thu, 03 Mar
 2022 14:38:12 -0800 (PST)
MIME-Version: 1.0
References: <1646300401-9063-1-git-send-email-quic_vpolimer@quicinc.com>
 <1646300401-9063-2-git-send-email-quic_vpolimer@quicinc.com>
In-Reply-To: <1646300401-9063-2-git-send-email-quic_vpolimer@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 3 Mar 2022 14:38:00 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VHBn0H6Oz0F3vHrXZzSSo8y+QbLc-xn+CVVSQkommsHw@mail.gmail.com>
Message-ID: <CAD=FV=VHBn0H6Oz0F3vHrXZzSSo8y+QbLc-xn+CVVSQkommsHw@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] arm64/dts/qcom/sc7280: remove assigned-clock-rate
 property for mdp clk
To: Vinod Polimera <quic_vpolimer@quicinc.com>
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
Cc: quic_kalyant@quicinc.com,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Mar 3, 2022 at 1:40 AM Vinod Polimera <quic_vpolimer@quicinc.com> wrote:
>
> Kernel clock driver assumes that initial rate is the
> max rate for that clock and was not allowing it to scale
> beyond the assigned clock value.
>
> Drop the assigned clock rate property and vote on the mdp clock as per
> calculated value during the usecase.

I see the "Drop the assigned clock rate property" part, but where is
the "and vote on the mdp clock" part? Did it already land or
something? I definitely see that commit 5752c921d267 ("drm/msm/dpu:
simplify clocks handling") changed a bunch of this but it looks like
dpu_core_perf_init() still sets "max_core_clk_rate" to whatever the
clock was at bootup. I assume you need to modify that function to call
into the OPP layer to find the max frequency?


> Changes in v2:
> - Remove assigned-clock-rate property and set mdp clk during resume sequence.
> - Add fixes tag.
>
> Changes in v3:
> - Remove extra line after fixes tag.(Stephen Boyd)
>
> Fixes: 62fbdce91("arm64: dts: qcom: sc7280: add display dt nodes")

Having a "Fixes" is good, but presumably you need a code change along
with this, right? Otherwise if someone picks this back to stable then
they'll end up breaking, right? We need to tag / note that _somehow_.
