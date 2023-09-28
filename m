Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ECED67B1F2B
	for <lists+dri-devel@lfdr.de>; Thu, 28 Sep 2023 16:03:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 062BC10E66C;
	Thu, 28 Sep 2023 14:03:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A59C10E66C
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Sep 2023 14:03:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 0462FB81C57;
 Thu, 28 Sep 2023 14:03:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 974D9C433C8;
 Thu, 28 Sep 2023 14:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695909809;
 bh=n2bDHzk2s5pAtaibWAwFVOIL4i6SiOY2rnYokEWoql0=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=D95uGPuTGA8Y7UqNsKhGsRlqlnJe4RWQUvfGWgj2Oiqdg81cL0lj4N5/qOxosGS35
 SvP2gCSX24agKDhZXJrfpkPsSjTQmB40EVJ4EVkP7NkUQsY4BPgIe3wQjm040jlvH9
 7KSxZJJNEynr3A/CTsxG65POGEpaTUUPDoCUTNEwR/NYAWcWz7PjargFlC8bomS/07
 QOmyZenXmNiowWfEP9W+UYLNLxGwU9ypIFHxP+chWW/UB+hylroPiHW6hC4VGjCd+g
 vDRDnfukLR8pou+/HDi5fcl4NxQ441P417cyMETI6OtkQUj2dlOT1x39xCMx0u9ATA
 5rE7iH3hJopKg==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>, 
 Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Flavio Suligoi <f.suligoi@asem.it>
In-Reply-To: <20230925122609.78849-1-f.suligoi@asem.it>
References: <20230925122609.78849-1-f.suligoi@asem.it>
Subject: Re: (subset) [PATCH v3 1/2] dt-bindings: backlight: Add MPS
 MP3309C
Message-Id: <169590980634.1618521.3566617275020298182.b4-ty@kernel.org>
Date: Thu, 28 Sep 2023 15:03:26 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.2
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
Cc: linux-fbdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 25 Sep 2023 14:26:08 +0200, Flavio Suligoi wrote:
> The Monolithic Power (MPS) MP3309C is a WLED step-up converter, featuring a
> programmable switching frequency to optimize efficiency.
> The brightness can be controlled either by I2C commands (called "analog"
> mode) or by a PWM input signal (PWM mode).
> This driver supports both modes.
> 
> For device driver details, please refer to:
> - drivers/video/backlight/mp3309c_bl.c
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: backlight: Add MPS MP3309C
      commit: 02c4e661658f73d3c266c68f89f0b14bd8ba6bd8

--
Lee Jones [李琼斯]

