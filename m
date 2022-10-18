Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B2F602256
	for <lists+dri-devel@lfdr.de>; Tue, 18 Oct 2022 05:14:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5864710E811;
	Tue, 18 Oct 2022 03:14:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EDBA10E811;
 Tue, 18 Oct 2022 03:14:44 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CA75CB81C68;
 Tue, 18 Oct 2022 03:14:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7520CC43144;
 Tue, 18 Oct 2022 03:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666062882;
 bh=8WKZ20RAWTE5YoQcJD/xMfKZZcR1MfURos6xAwcaDSc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=sm2jTcm8vnHWfUnN1EDRCzPlp45S9l+6EUY9Bwu4X6QqvApFRmORoCqJXT7XWJ1Ly
 uKh1W7mP3MaYrdgtfA7ET1m5x/vWGbXTJUq26xpoI7nM/W5hie1kqmJvTgkmPDbWTt
 6WQ6rdHvBMYdpnuZtBIXe972eymFkFi7zmKZiB/S+n7pYIDDOvpzC6wsURUM7ubVWt
 ZIXRTceWJJKXV212dxZnmNtKSy5fyQdMPOkatx2dmyua807CEvROnYREc7s+JsVuH9
 bBHvXEGmpmWQF0Yf1Aq+mxz2Ltv9Nd8+gDh7AIdzU4IdHjrZ/2Ec4oUrFADLDveGB0
 01xTXuV84o0bg==
From: Bjorn Andersson <andersson@kernel.org>
To: quic_rajeevny@quicinc.com, devicetree@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [v1] arm64: dts: qcom: sc7280: assign DSI clock source parents
Date: Mon, 17 Oct 2022 22:14:32 -0500
Message-Id: <166606235853.3553294.16555470123079506813.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <1662550553-28933-1-git-send-email-quic_rajeevny@quicinc.com>
References: <1662550553-28933-1-git-send-email-quic_rajeevny@quicinc.com>
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
Cc: quic_kalyant@quicinc.com, konrad.dybcio@somainline.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, quic_abhinavk@quicinc.com,
 agross@kernel.org, dmitry.baryshkov@linaro.org, sean@poorly.run
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 7 Sep 2022 17:05:53 +0530, Rajeev Nandan wrote:
> Assign DSI clock source parents to DSI PHY clocks.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sc7280: assign DSI clock source parents
      commit: 80edac18ac173f0f0130c2164f75ddadcd68fa7f

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
