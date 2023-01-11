Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A26B665E87
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 15:57:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D97110E755;
	Wed, 11 Jan 2023 14:57:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48D5810E754;
 Wed, 11 Jan 2023 14:57:12 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B998F61D4C;
 Wed, 11 Jan 2023 14:57:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2940DC433F2;
 Wed, 11 Jan 2023 14:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673449031;
 bh=mYNw1iEQYVCp6RrmRe30DB6Teu7zpACGkO9NWFvDUyo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=QaloOrONmjzv1NxnkIb/LFrLyvGzezX8IP6p+BTQwpjrgl1QKH4PNtYIph6Jnv0xy
 UqOi2i1ffFiBdoNLDsJU/yJRjn4S75GCJFPM+APpHSv8iwblX7qs0DwIJmVqMOQ9nd
 paa4QZw7H6L/ukm8SfqrMVRzDyuyvYwIGV5Agq7ONdhtiai7GwcH4fQa5PeL70rkYs
 BbPdVEUoOUGJvCXQ9g+u/QUYjT+E2l+aYeGrKLT3sU1Ya/8URcBmlRWw5u4YXSUjrF
 T4EfIVGYmI/YRxH3Asw5p1CtqiaEHckGigxorO6ARYWSTJlxmsu8+7ojwyblGxbtPD
 b0X+2109HR02Q==
Received: by mail-vs1-f52.google.com with SMTP id 3so15941846vsq.7;
 Wed, 11 Jan 2023 06:57:11 -0800 (PST)
X-Gm-Message-State: AFqh2krCQzCFeByovANEU66paHJTG/6dYZ+H1Spv/laMSeHkAqHUJ22t
 nBGwAFkzUVIOj/I+wcDs+7eOx/Wo3ndhZnwMRg==
X-Google-Smtp-Source: AMrXdXsFn/ZNP2w63VaXh+QFHScOBYUxYSxX/aRHG1VxYtf9ib6mpqOY1EwCEur2HVupJ0D2QHWb7s3fHG7o5hrVc/k=
X-Received: by 2002:a05:6102:3546:b0:3c8:a6ed:faa8 with SMTP id
 e6-20020a056102354600b003c8a6edfaa8mr9164668vss.85.1673449030052; Wed, 11 Jan
 2023 06:57:10 -0800 (PST)
MIME-Version: 1.0
References: <20221130135807.45028-1-konrad.dybcio@linaro.org>
In-Reply-To: <20221130135807.45028-1-konrad.dybcio@linaro.org>
From: Rob Herring <robh+dt@kernel.org>
Date: Wed, 11 Jan 2023 08:56:58 -0600
X-Gmail-Original-Message-ID: <CAL_JsqL4Wymiov3bgXBo+1RJeMMjJ_+iCCo7oboSmU8P+0ew4A@mail.gmail.com>
Message-ID: <CAL_JsqL4Wymiov3bgXBo+1RJeMMjJ_+iCCo7oboSmU8P+0ew4A@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: msm/dsi: Don't require vcca-supply on 14nm
 PHY
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
Cc: freedreno@lists.freedesktop.org, patches@linaro.org,
 linux-arm-msm@vger.kernel.org, andersson@kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Krishna Manikandan <quic_mkrishn@quicinc.com>,
 krzysztof.kozlowski+dt@linaro.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 devicetree@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 30, 2022 at 7:58 AM Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> On some SoCs (hello SM6115) vcca-supply is not wired to any smd-rpm
> or rpmh regulator, but instead powered by the VDD_MX line, which is
> voted for in the DSI ctrl node.
>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml | 1 -
>  1 file changed, 1 deletion(-)

What's the status of this patch? It is in linux-next already for some
time, but it needs to go into v6.2.

Rob
