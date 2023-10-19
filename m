Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 987507CF8BB
	for <lists+dri-devel@lfdr.de>; Thu, 19 Oct 2023 14:28:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4515E10E0CE;
	Thu, 19 Oct 2023 12:27:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA60C10E0CE
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Oct 2023 12:27:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 10D2561052;
 Thu, 19 Oct 2023 12:27:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42E85C433C8;
 Thu, 19 Oct 2023 12:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1697718473;
 bh=o+SLMHbM3b4KJWGJ8NBC4IKXQx11TH3ol/WMx76KbuQ=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=OvzoOirf4oKfeLwF55oxfPT5FX6xkwQtXMIrat5FQNhVM212k4MBKanCDegSO/Qou
 wt3BitFJy6SfkKoL94TgboTUGjKcIHyuvCa7dCL/OA369MClGpyUpzjsO8qSkV6oFi
 kSDzXYMncbyrqmZJKHm4GTLLxp/555nPdF1j3JqIxhHf5AnUp8LBOVmYDkdxJ0Dq5i
 4ih2JTZNi13rutnOJ+dF/baOmRQLIq+xso3ng7kYWuh1KVrCzSAGxpD6RwoUcWwc8B
 +xyjAIhmWyniy/DDoUTXlWNovYtQSArMN2gFu1SgMo4XO3EyXzanhlLCjWj4FPQmVu
 vyu3594toMJFg==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>, 
 Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Flavio Suligoi <f.suligoi@asem.it>
In-Reply-To: <20231016150554.27144-1-f.suligoi@asem.it>
References: <20231016150554.27144-1-f.suligoi@asem.it>
Subject: Re: (subset) [PATCH v1] dt-bindings: backlight: add
 brightness-levels related common properties
Message-Id: <169771847099.2473402.8532120354222006296.b4-ty@kernel.org>
Date: Thu, 19 Oct 2023 13:27:50 +0100
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
Cc: devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 16 Oct 2023 17:05:54 +0200, Flavio Suligoi wrote:
> Both files pwm-backlight.yaml and led-backlight.yaml contain properties
> in common with each other, regarding the brightness levels:
> 
> - brightness-levels
> - default-brightness-level
> 
> These properties can then be moved to backlight/common.yaml.
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: backlight: add brightness-levels related common properties
      commit: d5272d39995f4150062a67e6f2cef556edece740

--
Lee Jones [李琼斯]

