Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE2985C321
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 18:57:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8A8010E509;
	Tue, 20 Feb 2024 17:57:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="blNdQetg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E24410E510;
 Tue, 20 Feb 2024 17:57:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C00156123E;
 Tue, 20 Feb 2024 17:57:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C9F7C433F1;
 Tue, 20 Feb 2024 17:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708451867;
 bh=8q9W3SBiK3mymIu4dCwTPCec/vRjsF4nmEK/7H3USs0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=blNdQetgFJ3Qq2EnaO28wLqmomewUPrIredj7lMOb/a7pRH9diwxZAQ54PloSFtEU
 QPrflNbc6141OFhJS3GMVP1BbSCZ2K2RjgWkLXU3RFkGTblFD5mjeSd15mntKpYmMm
 YgqGkJXO40otXuhe3Hq6IIi9KUEf8trWIaM0U2/8gW2ZM1vQLMmp7YtJFDdofjvU9L
 NswMBxkEkuXsSgnIymG5oZR2Mt3r0CN2Ts+Ijy9ZXOTd00mxH3zYnmmMHDKwOhP+l5
 lgfrYG162a0eAn5eQX+iYwpCcMQ0hNVGB9blw7kbN8EZ1r0I51668ik/g833FyelGF
 ZefxsdTOroRrw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Stephen Boyd <swboyd@chromium.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Subject: Re: [PATCH] arm64: dts: qcom: sm6115: fix USB PHY configuration
Date: Tue, 20 Feb 2024 11:57:38 -0600
Message-ID: <170845186089.159943.6090659606720475098.b4-ty@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240220173104.3052778-1-dmitry.baryshkov@linaro.org>
References: <20240220173104.3052778-1-dmitry.baryshkov@linaro.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Tue, 20 Feb 2024 19:31:04 +0200, Dmitry Baryshkov wrote:
> The patch adding Type-C support for sm6115 was misapplied. All the
> orientation switch configuration ended up at the UFS PHY node instead of
> the USB PHY node. Move the data bits to the correct place.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sm6115: fix USB PHY configuration
      commit: f176168bcb95bd1fdd32f5a794e68b7a36ac8740

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
