Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC585F4C5D
	for <lists+dri-devel@lfdr.de>; Wed,  5 Oct 2022 01:04:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A56AE10E147;
	Tue,  4 Oct 2022 23:04:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay01.th.seeweb.it (relay01.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BBCB10E2D7
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Oct 2022 23:04:39 +0000 (UTC)
Received: from SoMainline.org (94-209-172-39.cable.dynamic.v4.ziggo.nl
 [94.209.172.39])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 9A7A01F557;
 Wed,  5 Oct 2022 01:04:32 +0200 (CEST)
Date: Wed, 5 Oct 2022 01:04:31 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v3 2/2] drm/msm/dsi: Add phy configuration for QCM2290
Message-ID: <20221004230431.y44mek7i7tyixpb7@SoMainline.org>
References: <20220924121900.222711-1-dmitry.baryshkov@linaro.org>
 <20220924121900.222711-3-dmitry.baryshkov@linaro.org>
 <20221001160054.gmrlnjvdwyn5ttzw@SoMainline.org>
 <CAA8EJpqX0PVkx9TWYHAHT-Rvne_9nzVnV-xcsHWYB0VTs6oRbA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJpqX0PVkx9TWYHAHT-Rvne_9nzVnV-xcsHWYB0VTs6oRbA@mail.gmail.com>
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
Cc: devicetree@vger.kernel.org, Loic Poulain <loic.poulain@linaro.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, Andy Gross <agross@kernel.org>,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-10-04 17:29:32, Dmitry Baryshkov wrote:
> On Sat, 1 Oct 2022 at 19:00, Marijn Suijten
> <marijn.suijten@somainline.org> wrote:
> > [..]
> > For sm6125 we also need this exact io_start (and a single PHY), do you
> > think it makes sense to add a compatible that reuses the same struct (I
> > can do that in a folloup patch) and/or generalize this struct (name)?
> >
> > However, our regulator setup appears to be different.  I recall not
> > finding any `vcca` supply in my downstream sources, and had this in my
> > notes for a similar dsi_phy_14nm.c patch:
> >
> >     sm6125 uses an RPM regulator
> >
> > https://github.com/sonyxperiadev/kernel/blob/f956fbd9a234033bd18234d456a2c32c126b38f3/arch/arm64/boot/dts/qcom/trinket-sde.dtsi#L388
> 
> I'd prefer a separate config for sm6125. This way you would be able to
> add voting on the MX domain if required.

Ack, I'll queue up a patch series for this SoC, with a dt-bindings patch
that makes the vcca register optional for the sm6125 compatible.

- Marijn
