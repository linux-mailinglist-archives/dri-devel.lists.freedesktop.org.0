Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1824644B30
	for <lists+dri-devel@lfdr.de>; Tue,  6 Dec 2022 19:20:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04EB510E33D;
	Tue,  6 Dec 2022 18:20:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04F7210E33D
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Dec 2022 18:20:18 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 48BF26185C;
 Tue,  6 Dec 2022 18:20:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03550C43159;
 Tue,  6 Dec 2022 18:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1670350817;
 bh=XoqOWA7atyu7exW3K4w+tqmSMBPEgARiYKXRQvMreK8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ItQR7CKZY8M/6R/UBSiXpoqItoWlCHnqpg90mN4zS+vLdqU5sxFwQzfRajbs+i+gk
 QXfEcIH+S3nWJgYgB345O+Uz+stlgSGWyX3xdh14iXUk4fX/0AaLr+dtMAAFmXOF10
 Eg+4twP7ztmoi6AET+cQvTz+eTEHTDCzzsahIbzv1upKO0TfDy3PMCV080jvMG29cq
 wYho3W0UK2dU4ZjDfa51CrmXFFazv1YJ31cb8Q1JAZyZLGm+rBe0X8D79UE30iKSif
 xN1QvFAMEgSxDiL1hWqjHuvvORUh73esB+NXShp630nlfaIU3wAmO5rOCdYPooDggN
 30QZNSzMD/z8w==
From: Bjorn Andersson <andersson@kernel.org>
To: linux-arm-msm@vger.kernel.org,
	Luca Weiss <luca@z3ntu.xyz>
Subject: Re: (subset) [PATCH v3 1/2] dt-bindings: backlight: qcom-wled: Add
 PMI8950 compatible
Date: Tue,  6 Dec 2022 12:19:22 -0600
Message-Id: <167035076359.3155086.6360460042390908299.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20221101161801.1058969-1-luca@z3ntu.xyz>
References: <20221101161801.1058969-1-luca@z3ntu.xyz>
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
Cc: devicetree@vger.kernel.org, daniel.thompson@linaro.org,
 kgunda@codeaurora.org, pavel@ucw.cz, jingoohan1@gmail.com, lee@kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 krzysztof.kozlowski+dt@linaro.org, phone-devel@vger.kernel.org,
 linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 1 Nov 2022 17:17:59 +0100, Luca Weiss wrote:
> Document the compatible for the wled block found in PMI8950.
> 
> 

Applied, thanks!

[2/2] arm64: dts: qcom: Add configuration for PMI8950 peripheral
      commit: 0d97fdf380b478c358c94f50f1b942e87f407b9b

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
