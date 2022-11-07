Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D0061E8FA
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 04:12:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA2EF10E041;
	Mon,  7 Nov 2022 03:12:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C456110E041;
 Mon,  7 Nov 2022 03:12:43 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id ED5AA60BF0;
 Mon,  7 Nov 2022 03:12:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43BF4C433C1;
 Mon,  7 Nov 2022 03:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667790762;
 bh=wSGw+1ab0M0hKgWXdmnc430Sc24IHBbcUGFcWPL0QwM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XLX1Ki5lGjwO/KGG/AdqOInGVZX3fKiY2rjf8ytrME1jfDNeCnFBT1iS1Ghr5tciH
 CuOS5N07fJDCQQoQm6uw2blbs22bBjJXrLQMrE4pS8qsa6tgtHVw2ojirKKipczsd2
 F76nlTVsvvO7aduRjwkQvnstm8nWcG9svDOchNCqoCN5aVO96MekqDoUZEgAE51T/z
 S4DgBrCzzq36mo1vw0w2ufSO0y1ki7ILpsgGFhxzNnPqz20jhvP9kyF1wn+HDwjxAD
 6rpI3m8hXFXj97u55KSCW1u3iGme6GxPAfrdrOQt4v1sL0jDn9nmk7VuriboYvG9Uz
 bMQ1LyDnC0c/w==
From: Bjorn Andersson <andersson@kernel.org>
To: krzysztof.kozlowski+dt@linaro.org, dmitry.baryshkov@linaro.org,
 sean@poorly.run, Rob Herring <robh+dt@kernel.org>,
 quic_abhinavk@quicinc.com, konrad.dybcio@somainline.org,
 robdclark@gmail.com, Andy Gross <agross@kernel.org>
Subject: Re: (subset) [PATCH 0/2] arm: dts: qcom: rename HDMI PHY nodes
Date: Sun,  6 Nov 2022 21:12:00 -0600
Message-Id: <166779074251.500303.3874190524418032312.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220924094347.178666-1-dmitry.baryshkov@linaro.org>
References: <20220924094347.178666-1-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 24 Sep 2022 12:43:45 +0300, Dmitry Baryshkov wrote:
> Historically HDMI PHY device tree nodes used the hdmi-phy@ names.
> Replace them with generic phy@ names.
> 
> While there is no such requirement in the DT schema, it's worth doing
> that because:
> 
> 1) The recent qcom DT files already use just phy@ for most of PHY nodes
> 
> [...]

Applied, thanks!

[1/2] ARM: dts: qcom-apq8064: change HDMI PHY node name to generic one
      commit: 5743efe0e73e4e1c8d042e982e31bb8145e35baf

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
