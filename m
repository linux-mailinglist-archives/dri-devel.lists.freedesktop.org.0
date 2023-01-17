Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A0A66E5E8
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jan 2023 19:24:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A8C010E5AA;
	Tue, 17 Jan 2023 18:24:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DE0710E5AA;
 Tue, 17 Jan 2023 18:24:47 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id EE2DDB819A2;
 Tue, 17 Jan 2023 18:24:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52C8FC433F1;
 Tue, 17 Jan 2023 18:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673979884;
 bh=AHzeX7dhYVX8yBaB/Cs4tTTqnXDv+F8AxK25ujOVHVY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fum/BmfBmvu9u0Cmsn5P8M9R37HAr+Cxh3lNmmrJmFU57NmWoM5IMw/LguM844xjj
 AOUyzoUzqwFDwZsPBfFgix4jShTR0C7BSV8R7w+DBUoiC/84j7hiqeX9hujUBmPjJB
 c2sG9nkm6Oe/R4Jfdnhy5kqTarCQGe8xe2ez+MtrJubwCPAFAo4DtOu5XxstgYWTLG
 UY8/cLGXHAGznk77CwBLE+1XNa5xKrHUz0dxRXxHLsPYo822q+skb24JFALkguyNxt
 XK+u5CrFwq3CvdX8Ft7zs7I9wQnEM0/Tdcqo4sb7+BehwkbGWDqyerbtnxXZS2ONyY
 5wR4c7Qr7ej2g==
From: Bjorn Andersson <andersson@kernel.org>
To: devicetree@vger.kernel.org, dmitry.baryshkov@linaro.org, daniel@ffwll.ch,
 robh+dt@kernel.org, airlied@gmail.com, konrad.dybcio@somainline.org,
 agross@kernel.org, quic_khsieh@quicinc.com,
 krzysztof.kozlowski+dt@linaro.org, vkoul@kernel.org, swboyd@chromium.org,
 sean@poorly.run, dianders@chromium.org, robdclark@gmail.com,
 dri-devel@lists.freedesktop.org
Subject: Re: (subset) [PATCH v16 0/5] Add data-lanes and link-frequencies to
 dp_out endpoint
Date: Tue, 17 Jan 2023 12:24:29 -0600
Message-Id: <167397986258.2832389.13013328519954175656.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <1672163103-31254-1-git-send-email-quic_khsieh@quicinc.com>
References: <1672163103-31254-1-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: linux-arm-msm@vger.kernel.org, quic_sbillaka@quicinc.com,
 freedreno@lists.freedesktop.org, quic_abhinavk@quicinc.com,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 27 Dec 2022 09:44:58 -0800, Kuogee Hsieh wrote:
> Add DP both data-lanes and link-frequencies property to dp_out endpoint and support
> functions to DP driver.
> 
> Kuogee Hsieh (5):
>   arm64: dts: qcom: add data-lanes and link-freuencies into dp_out
>     endpoint
>   dt-bindings: msm/dp: add data-lanes and link-frequencies property
>   drm/msm/dp: parse data-lanes as property of dp_out endpoint
>   Add capability to parser and retrieve max DP link supported rate from
>        link-frequencies property of dp_out endpoint.
>   drm/msm/dp: add support of max dp link rate
> 
> [...]

Applied, thanks!

[1/5] arm64: dts: qcom: add data-lanes and link-freuencies into dp_out endpoint
      commit: 26c5aa54f5973a3b1181939811f231faa638332a

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
