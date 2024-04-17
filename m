Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3BC18A8295
	for <lists+dri-devel@lfdr.de>; Wed, 17 Apr 2024 13:57:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EC7E113446;
	Wed, 17 Apr 2024 11:57:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="mFZb7vu8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com
 [209.85.219.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7D6A113444
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Apr 2024 11:57:00 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id
 3f1490d57ef6-dc74e33fe1bso4908343276.0
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Apr 2024 04:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713355020; x=1713959820; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=7V6DnLCsUFkJaBmXGBgPYovHMmnV4qT3enJ4vhqHZQM=;
 b=mFZb7vu89CdLkeJyH7p9rX9G+yn80/6UopoQdbDtmBYSOl7UNErjxGj5uznWiG0imE
 BZnWLXNK9k5DkB55YCkIVZ/T7xh/xMRseUI0utG3E10lKFyWdz++k7QboerkVhob9aex
 pz86DL0BdLD8OCrkmep2crPAM203riNlCeWF11etvCzhnCdD2Sj+1EbEorGRqPvYgjt3
 Dfn45Ptj38Bxc2GSxJuGVsBliWI/RzlfaX3UjW9clddXpzfQd/jQGR6QQ0+uvBJTz4JR
 gX43ycTDOY6rk5G+7gmZroYe1zAN3erkApIQqnkIW3hulcQH8kVKdn7PHnOzzRDUbNF5
 vFTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713355020; x=1713959820;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7V6DnLCsUFkJaBmXGBgPYovHMmnV4qT3enJ4vhqHZQM=;
 b=WO7HtfRO1Y7HSLbqIBgMT6gV1GvzndZUFaw2ZKcQlnyKa8y+NKBns3QtWuR6Jbbjsw
 NUp257wTZ1D6ou/O6/gRSbAoocJf9Yg1U4dATsnJdv128FjalSV1kzakqOSxJM+rOln/
 Wc15gflhcSmrfM7aaP6YSI8p98KUYzbIftJIKda0Zq1A+S2DCN74bla7Nm4YIBlf38Nj
 disRt/WaHtQhszG6bjzXP7KJRsvssddxw9/f/IYGxnXE5gWVPie1vYiGEPreC0DFrRwv
 C4NvXbWduCuxaIcM7iso+7MBujLG8pc2KgCZPZeFo4kiO4PeqbRRjh6QHW5KQ8T853n6
 v1hw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWldSw8A3KqaA1a7X3gMAVkjILDj4rk+94YEVhEwGFGr88EVdRNE79vdInLzSI2OoQdOXE+cbgSwUyXGdVxNsMasmQNJe23QiE0SmdW60Ff
X-Gm-Message-State: AOJu0YxMduDWrIgE10wSiE6XEokP2ICfXTtYY6JBgy1DQBTO9FBXrWY2
 g4uBGOk5zEcxOxTBXyflzBzb4tIOeE/yAqrWRBDXhImthq/7U3DeJVqh75UzT1f7eK+Vuqv5uk0
 qee0SBMQVsrn1HLyXk6NXo9NYJ6OUAlt63A/6nw==
X-Google-Smtp-Source: AGHT+IHuJ+P0+tIP8Ja/s31hcE/lLfe8rzFJZRFTNiK24q6dN5Ov40yhIbmq423DTWh9Cjd7EAZUIsIKaKherzh7G/4=
X-Received: by 2002:a25:4ec2:0:b0:dcc:1449:71ea with SMTP id
 c185-20020a254ec2000000b00dcc144971eamr15228037ybb.50.1713355019639; Wed, 17
 Apr 2024 04:56:59 -0700 (PDT)
MIME-Version: 1.0
References: <20240417-drm-msm-initial-dualpipe-dsc-fixes-v1-0-78ae3ee9a697@somainline.org>
 <20240417-drm-msm-initial-dualpipe-dsc-fixes-v1-1-78ae3ee9a697@somainline.org>
In-Reply-To: <20240417-drm-msm-initial-dualpipe-dsc-fixes-v1-1-78ae3ee9a697@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 17 Apr 2024 14:56:48 +0300
Message-ID: <CAA8EJpqJfkRd3hN-QoHaxhP2dUaEOyaqnGzA5MiGk96oTLRO2g@mail.gmail.com>
Subject: Re: [PATCH 1/7] drm/msm/dsi: Print dual-DSI-adjusted pclk instead of
 original mode pclk
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Archit Taneja <architt@codeaurora.org>,
 Chandan Uddaraju <chandanu@codeaurora.org>, 
 Vinod Koul <vkoul@kernel.org>, Sravanthi Kollukuduru <skolluku@codeaurora.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jordan Crouse <jordan@cosmicpenguin.net>, Rajesh Yadav <ryadav@codeaurora.org>,
 Jeykumar Sankaran <jsanka@codeaurora.org>,
 ~postmarketos/upstreaming@lists.sr.ht, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Martin Botka <martin.botka@somainline.org>, 
 Jami Kettunen <jami.kettunen@somainline.org>
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

On Wed, 17 Apr 2024 at 02:57, Marijn Suijten
<marijn.suijten@somainline.org> wrote:
>
> When dual-DSI (bonded DSI) was added in commit ed9976a09b48
> ("drm/msm/dsi: adjust dsi timing for dual dsi mode") some DBG() prints
> were not updated, leading to print the original mode->clock rather
> than the adjusted (typically the mode clock divided by two, though more
> recently also adjusted for DSC compression) msm_host->pixel_clk_rate
> which is passed to clk_set_rate() just below.  Fix that by printing the
> actual pixel_clk_rate that is being set.
>
> Fixes: ed9976a09b48 ("drm/msm/dsi: adjust dsi timing for dual dsi mode")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
