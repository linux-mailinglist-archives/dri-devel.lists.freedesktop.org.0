Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0D766BE36
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jan 2023 13:52:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1530B10E3F2;
	Mon, 16 Jan 2023 12:52:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com
 [IPv6:2607:f8b0:4864:20::b34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2BCE10E3F2
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jan 2023 12:52:42 +0000 (UTC)
Received: by mail-yb1-xb34.google.com with SMTP id a9so13468207ybb.3
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jan 2023 04:52:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=2HwxURQ04QRPHjYFiwUTAY9c1+Tu3uq4SQk4i0sNqu4=;
 b=BX2XXb6Z/I8uqSGq+V3t+G3jgfTOzjVgOOQsSxDjQGnulfnkLrpeXJgo7xxz7Lk3gb
 69GvlI+IeJRRULFIykgNvw14q5nFemOJXWUjCtnrpQGB8/270ANcD4Ra9GDwo5kdKXOH
 njJzNwh14rD6t/8n6V/YIE6klTzC4otbBHzBYR1PM9o7BKsWcaawdYlxMoWwaRVt7do/
 wP6GtqJt4YNQ6fGZvoxaNJNaMST/Xxs4MhUxU++Z2pu0A4iZCoVs5ZW0GFvP9x47vfPP
 pNE045klwXHyEJuo2GG7O+uB1ftlF2ixt0ES468NgvgLLGObBloQEGYaqUTWLy3utNVy
 VdtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2HwxURQ04QRPHjYFiwUTAY9c1+Tu3uq4SQk4i0sNqu4=;
 b=BLPvfWvOINQCeKi5Fn4sGPF5AtcL138apOjlkifu5bgGtFY4K26qNmeFLsvTpmhZDd
 KfY8LRbwJF689Ul9AYNzYpTpds40+y03dkFm9xp5pp2hxVmSMnQFIWqrhy9KzzycCb18
 NlgowstK8zbJOL9DnlhCc7sVkEBs1obS7U4ADc4i/k2NUuByjWnqJNw7Wxlhra7VXiaa
 ElMbLYNiygtOiXyeEkPJKd+7cNn788OjdHvcqxXMUdSdknmy0qRUj7zh9nZKDUXKgKi4
 QKEhQQ9KM139booSsnx9MUu7OizkSEgdXuM/9485/t9X4PzdcOiZlS3OdhtgtC2oNOVO
 DQsQ==
X-Gm-Message-State: AFqh2koRuAHQs0lykE25OvNJ1pjqgy5TwqRw0smRngEaZfng8GrlWScM
 my4RLwhO0mUoLSJuMNEdISpK6hfJyKBdVz6kPi9fjg==
X-Google-Smtp-Source: AMrXdXvVqYBXE+hJ9b7YSEc2muX26rtwXJeHSCkz34eovdTPqEG7jDeQIgdO7eKutLnykzUqqBtiRDwJoRKQOLEeDNM=
X-Received: by 2002:a25:e648:0:b0:7c2:d9f1:3b04 with SMTP id
 d69-20020a25e648000000b007c2d9f13b04mr2486434ybh.516.1673873561962; Mon, 16
 Jan 2023 04:52:41 -0800 (PST)
MIME-Version: 1.0
References: <20230116115132.348961-1-konrad.dybcio@linaro.org>
In-Reply-To: <20230116115132.348961-1-konrad.dybcio@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 16 Jan 2023 14:52:30 +0200
Message-ID: <CAA8EJprNzLMnU7cguMit6Y4sgU0-SOkiiL+=s_BFBZiyvNvsAw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: msm/dsi: Don't require vdds-supply on 7nm PHY
To: Konrad Dybcio <konrad.dybcio@linaro.org>
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
Cc: freedreno@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonathan Marek <jonathan@marek.ca>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, andersson@kernel.org,
 krzysztof.kozlowski@linaro.org, Rob Herring <robh+dt@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, agross@kernel.org,
 dri-devel@lists.freedesktop.org, marijn.suijten@somainline.org,
 Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 16 Jan 2023 at 13:51, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> On some SoCs (hello SM6375) vdds-supply is not wired to any smd-rpm
> or rpmh regulator, but instead powered by the VDD_MX/mx.lvl line,
> which is voted for in the DSI ctrl node.

I think we should have an explicit `if compatible then required:
vdds-supply' clause. WDYT?

>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
> index 9c9184f94c44..8e9031bbde73 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
> @@ -48,7 +48,6 @@ required:
>    - compatible
>    - reg
>    - reg-names
> -  - vdds-supply
>
>  unevaluatedProperties: false
>
> --
> 2.39.0
>


-- 
With best wishes
Dmitry
