Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A4C72EF2B
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jun 2023 00:27:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87FD310E3E4;
	Tue, 13 Jun 2023 22:27:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC13010E3E4
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 22:27:13 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B5F5F63B99;
 Tue, 13 Jun 2023 22:27:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C3AEC433CC;
 Tue, 13 Jun 2023 22:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686695232;
 bh=tRJQBbwZtaJ6NQT1/dC04nb57z6Mm49syrgZQgiFZKQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=X0pHg8OA3PIfY7MEpiGS4CnR5QMTkebIhMLdLJmHcRcpVHwREOR1oYpB7Wggf+kZw
 avODGCtlWEgJ4Y1b5LG31rvjyNps2PmPgKHclDT8EBRJ4K0TWlVvrrfYeAP4bfTuKS
 Wmq8In4o92ccnRshzFA4bCKgC/If8ceFCzCEWzWr7jKG4g025woNc7wDw5ZZUABIho
 awV0MmSL5+NGCve9LrduhLoQDS4DK1uQf19VDD4NIP7xk3uBuw23WSecOHoD+UIkiT
 /ju2/cYcamhhlwUk7qqik25+aRhWlb87XNJgR7in1HU0DUuq+ogDvZWIIMy2qGRbE9
 rrtnTp2wxtdlQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Artur Weber <aweber.kernel@gmail.com>, Lee Jones <lee@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>
Subject: Re: (subset) [PATCH v2 0/4] video: backlight: lp855x: modernize
 bindings
Date: Tue, 13 Jun 2023 15:30:10 -0700
Message-Id: <168669542896.1315701.6764382551599027707.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230519180728.2281-1-aweber.kernel@gmail.com>
References: <20230519180728.2281-1-aweber.kernel@gmail.com>
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
Cc: linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Andy Gross <agross@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 dri-devel@lists.freedesktop.org, Jonathan Hunter <jonathanh@nvidia.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 ~postmarketos/upstreaming@lists.sr.ht, Pavel Machek <pavel@ucw.cz>,
 linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org,
 Luca Weiss <luca@z3ntu.xyz>, linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 19 May 2023 20:07:24 +0200, Artur Weber wrote:
> Convert TI LP855X backlight controller bindings from TXT to YAML and,
> while we're at it, rework some of the code related to PWM handling.
> Also correct existing DTS files to avoid introducing new dtb_check
> errors.
> 
> Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
> 
> [...]

Applied, thanks!

[4/4] arm64: dts: adapt to LP855X bindings changes
      commit: ebdcfc8c42c2b9d5ca1b27d8ee558eefb3e904d8

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
