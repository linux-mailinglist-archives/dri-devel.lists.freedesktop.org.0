Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0236587D1
	for <lists+dri-devel@lfdr.de>; Thu, 29 Dec 2022 00:11:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AF8810E223;
	Wed, 28 Dec 2022 23:11:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay04.th.seeweb.it (relay04.th.seeweb.it [5.144.164.165])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ED4A10E223
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Dec 2022 23:10:59 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id D1053200C9;
 Thu, 29 Dec 2022 00:10:54 +0100 (CET)
Date: Thu, 29 Dec 2022 00:10:53 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Bjorn Andersson <andersson@kernel.org>
Subject: Re: [PATCH 2/3] arm64: dts: qcom: sm8150: Add DISPCC node
Message-ID: <20221228231053.46fclmazl5qrjbmo@SoMainline.org>
References: <20221212093315.11390-1-konrad.dybcio@linaro.org>
 <20221212093315.11390-2-konrad.dybcio@linaro.org>
 <20221228041658.hpmlspnhm2ssinai@builder.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221228041658.hpmlspnhm2ssinai@builder.lan>
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
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, krzysztof.kozlowski@linaro.org,
 agross@kernel.org, dri-devel@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-12-27 22:16:58, Bjorn Andersson wrote:
> On Mon, Dec 12, 2022 at 10:33:13AM +0100, Konrad Dybcio wrote:
> > [..]
> > +			power-domains = <&rpmhpd SM8150_MMCX>;
> > +			/* TODO: Maybe rpmhpd_opp_min_svs could work as well? */
> 
> The power-domain being not disabled should be sufficient for us to
> access the dispcc. Beyond that votes would be needed for particular
> frequencies, and that goes in the client nodes/opp-tables.
> 
> So you should be able to drop this comment and the required-opps.
> 
> Regards,
> Bjorn
> 
> > +			required-opps = <&rpmhpd_opp_low_svs>;

Tested the removal of this on Xperia 5, no regressions.

- Marijn
