Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0207D6723B3
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 17:42:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03C4510E7A4;
	Wed, 18 Jan 2023 16:42:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 015A210E7A4;
 Wed, 18 Jan 2023 16:42:23 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4D37C61157;
 Wed, 18 Jan 2023 16:42:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0827C433F1;
 Wed, 18 Jan 2023 16:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674060142;
 bh=lLru/ueyKXFJd97kgjfmvSzjxNHkeY2Xg+vEpCO45z0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=TiiCODxs7dUpZp3QKKA32T4j251CuP6Q4yvHvFaVWdQ8AD1cCPC7BGpgTglSAKZ66
 wp4LkYvCWgCVUQAK59gWlKVTC/AoRA8IsKsqPrJLxc+yaQ/gZ18daE5YOAI3hkORlH
 mTXqjGWw4ugkeVN8gNyKHkBhTaUAKNVuEzBO/6iKpHQLBJGDs+/cxWAfv9uMcNN5WK
 hLuysVqEoIvgkVPAb3eopqRv6IWSH9t+tWsrOs7MpRu/izDddiwyfydhKkDHkrjqlm
 8CQcuNJgmPbxziQTvxgXatsAgJuw/Zq3r6h5q3+YixVv4PG1wUjLd75b+fKQrjlhzX
 fXhR2Q/7nke3w==
Received: by mail-vs1-f53.google.com with SMTP id i188so36316237vsi.8;
 Wed, 18 Jan 2023 08:42:22 -0800 (PST)
X-Gm-Message-State: AFqh2krYhx8RqlZarncF0b1f7bpr76ESvHWyQicC6wlTmcAHCRmDSQTQ
 FGvKSY1upwT7LF/6gG0mX2157xIUDYkxurCTFg==
X-Google-Smtp-Source: AMrXdXs02ooa1JazZ/NMbxjasnSaPRPt3yvvlORq6f5Ei4Us34TTHAxwXTd5eSYHc5K2XU64xoQEMfgDmfg/lpSYEWQ=
X-Received: by 2002:a05:6102:5490:b0:3b5:1fe4:f1c2 with SMTP id
 bk16-20020a056102549000b003b51fe4f1c2mr1050100vsb.0.1674060141574; Wed, 18
 Jan 2023 08:42:21 -0800 (PST)
MIME-Version: 1.0
References: <20230118032432.1716616-1-dmitry.baryshkov@linaro.org>
 <20230118032432.1716616-5-dmitry.baryshkov@linaro.org>
 <167406005824.137582.10336637561777246237.robh@kernel.org>
In-Reply-To: <167406005824.137582.10336637561777246237.robh@kernel.org>
From: Rob Herring <robh+dt@kernel.org>
Date: Wed, 18 Jan 2023 10:42:10 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+_SNyZXihPr9aS-pw1YC+fNNYfc2J-S4vx5+Fhs+k+FA@mail.gmail.com>
Message-ID: <CAL_Jsq+_SNyZXihPr9aS-pw1YC+fNNYfc2J-S4vx5+Fhs+k+FA@mail.gmail.com>
Subject: Re: [PATCH 4/4] dt-binbings: display/msm: dsi-controller-main: add
 missing supplies
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 freedreno@lists.freedesktop.org, Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 18, 2023 at 10:41 AM Rob Herring <robh@kernel.org> wrote:
>
>
> On Wed, 18 Jan 2023 05:24:32 +0200, Dmitry Baryshkov wrote:
> > Describe DSI supplies used on apq8064 (vdda-supply) and msm8994/96
> > (vcca-supply).
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  .../bindings/display/msm/dsi-controller-main.yaml         | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
>
> Acked-by: Rob Herring <robh@kernel.org>

That is, with the typo in the subject fixed.
