Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE8DD5AD608
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 17:18:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A861E10E417;
	Mon,  5 Sep 2022 15:18:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A17A210E411
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 15:18:38 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id EE473B811F3;
 Mon,  5 Sep 2022 15:18:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD902C433C1;
 Mon,  5 Sep 2022 15:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1662391115;
 bh=OYPiTnXo7bb7hJwVSPWes/+Nq+zYOTrTHyss+h6VYo4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SDxfRg7k2JMjGFkMn8+/LTZSQNlWWnzMBv8TiM+aZG8WfpCklOb/zYAqZM4XE+fpY
 rs2rNTcqypi/Ymx66IECFIq8P0LnEAeumaycw1PLF94hacP8yD68/JeeoptW5Lx5Vl
 57nufRRk4GhwDzlKg7oQMkrAgFpjFa1ZtYo0fvLh0XnVE5uTfTSh5+kjy7DoDp/wOY
 xqntjmtzikCy2OmKXCYmmlAohAO13PluvsZ8YxrWTYJey/1rAIgZG58iRjY3eGIGLB
 1Fwo6+Ls6SieLxlyJ4ygC8DlLJX7pxvZm78wBH1qEClQCJdIiEF/JnguTag1WzkZLm
 04sga6uQd9+uA==
Date: Mon, 5 Sep 2022 16:18:12 +0100
From: Lee Jones <lee@kernel.org>
To: ChiaEn Wu <peterwu.pub@gmail.com>
Subject: Re: [PATCH v9 04/10] dt-bindings: backlight: Add MediaTek MT6370
 backlight
Message-ID: <YxYSDSlnOELL2mPF@google.com>
References: <20220830034042.9354-2-peterwu.pub@gmail.com>
 <20220830034042.9354-5-peterwu.pub@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220830034042.9354-5-peterwu.pub@gmail.com>
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
Cc: linux-fbdev@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 alice_chen@richtek.com, linux-iio@vger.kernel.org, broonie@kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 cy_huang@richtek.com, pavel@ucw.cz, linux-leds@vger.kernel.org,
 daniel.thompson@linaro.org, deller@gmx.de, linux-pm@vger.kernel.org,
 andy.shevchenko@gmail.com, devicetree@vger.kernel.org,
 mazziesaccount@gmail.com, szunichen@gmail.com, chiaen_wu@richtek.com,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 andriy.shevchenko@linux.intel.com, linux-arm-kernel@lists.infradead.org,
 jingoohan1@gmail.com, sre@kernel.org, robh+dt@kernel.org, jic23@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 30 Aug 2022, ChiaEn Wu wrote:

> From: ChiYuan Huang <cy_huang@richtek.com>
> 
> Add MT6370 backlight binding documentation.
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>
> ---
>  .../leds/backlight/mediatek,mt6370-backlight.yaml  | 121 +++++++++++++++++++++
>  1 file changed, 121 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/backlight/mediatek,mt6370-backlight.yaml

Applied, thanks.

-- 
Lee Jones [李琼斯]
