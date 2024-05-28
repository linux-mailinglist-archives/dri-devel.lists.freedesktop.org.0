Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C758D1299
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2024 05:33:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E11310EECB;
	Tue, 28 May 2024 03:33:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TEJ6271u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89A6F10EECB
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 03:33:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 40D73CE1178;
 Tue, 28 May 2024 03:32:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C56E5C4AF07;
 Tue, 28 May 2024 03:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1716867177;
 bh=p0xyb7fqak+0yHFBMltmTH/YOTsYExkhQUF1Aa7Y7jw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TEJ6271ulxaWFPUetfpguvjPL1Kc9dGTgEgdxoJKkcZgP+OCB4DYuc+zLy/cfHChU
 OdcZUCnh+2A9WYYFOVTcp4r+KBuarX1L5LB2cugyeKwh3wvSAcw1YZFIH0Y2tFATwQ
 /1XNSSCTBVTMaUSrcMKox5xr3AUqzgs+mYI6nLWfsS4TPs0CO8KU7EmMVphlkEd70H
 pdjffoqxc6ervpAJIu5d01jz0PaQuxJL7rWqs0bvx4qRFxplRCKrnkWoUt9IWLby+j
 IT6OGMfljVNPKOkx1sHhVlaLlLbn7bbKFRYlL6BseD+kNob8p7h6aP8zxjj9pc0/gU
 cmoRbCuJAGs9Q==
From: Bjorn Andersson <andersson@kernel.org>
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Andrew Morton <akpm@linux-foundation.org>,
 "G.Shark Jeong" <gshark.jeong@gmail.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maximilian Weigand <mweigand@mweigand.net>, Luca Weiss <luca@z3ntu.xyz>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH 0/4] Various fixes for the lm3630a backlight
 driver
Date: Mon, 27 May 2024 22:32:19 -0500
Message-ID: <171686715165.523693.10910758933738092076.b4-ty@kernel.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240220-lm3630a-fixups-v1-0-9ca62f7e4a33@z3ntu.xyz>
References: <20240220-lm3630a-fixups-v1-0-9ca62f7e4a33@z3ntu.xyz>
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


On Tue, 20 Feb 2024 00:11:18 +0100, Luca Weiss wrote:
> On the MSM8974 Nexus 5 and OnePlus One phones (latter doesn't have
> display upstream) the display backlight was turning off whenever you
> would write a brightness to sysfs since a recent commit to the driver
> (kernel v6.5).
> 
>   backlight: lm3630a: Turn off both led strings when display is blank
> 
> [...]

Applied, thanks!

[4/4] ARM: dts: qcom: msm8974-hammerhead: Hook up backlight
      commit: e23dfb4ee30a120a947abb94a718ccc1eb5f87ff

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
