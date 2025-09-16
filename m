Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D11B59CF0
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 18:07:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0EA810E389;
	Tue, 16 Sep 2025 16:07:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="pbAZ65/l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8199D10E389
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 16:07:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 283C244933;
 Tue, 16 Sep 2025 16:07:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AD51C4CEEB;
 Tue, 16 Sep 2025 16:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758038835;
 bh=51WcFBaGb8iVlN616QSXwpGIWaODtYoNiSjMhAkopiw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pbAZ65/lJeT66tC/tViEhpf2YdbqQy4lG+F6MPj0P3b/IXgYil+S+0iAH2BCTWDJM
 WBD3/QDwEWZZw68d+Eq71VOAeyrY2jbBfFu+srDWbGfifnDBKnm8hqzbNnXRCUM1sE
 VDI6xogZl1oRhWg55Zt5O9cvUm9Qq2EtxNxKwblGJqw96Y9QRkSUuJyZqctq7ZS6lu
 2i/Zs51S1Ex+IhqNHcHg8uvw5/Gm5FtmKIpufEMNegugO45PxpsoURM8RDAaNiIzbG
 2C4Tq/6mb3IafdN2UWGE7MvgXWYKOb2oxPROkU43vuQTkwJ/EA1sYd+JuzR8z/TeIU
 ccDikKXSTSCVQ==
Date: Tue, 16 Sep 2025 17:07:07 +0100
From: Lee Jones <lee@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Hans de Goede <hansg@kernel.org>,
 Aleksandrs Vinarskis <alex@vinarskis.com>,
 Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Jean-Jacques Hiblot <jjhiblot@traphandler.com>,
 Jacopo Mondi <jacopo@jmondi.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Daniel Thompson <danielt@kernel.org>, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, threeway@gmail.com,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v5 3/4] leds: led-class: Add devicetree support to
 led_get()
Message-ID: <20250916160707.GA3893363@google.com>
References: <20250910-leds-v5-0-bb90a0f897d5@vinarskis.com>
 <20250910-leds-v5-3-bb90a0f897d5@vinarskis.com>
 <20250911081540.GD9224@google.com>
 <b875f811-6371-4ff4-9cc2-a0a2c82a569c@kernel.org>
 <g7xkdervsknmcwjg4qgloj643b4itjlfeyiipvsrborszgrhlg@zrp65nvfueqk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <g7xkdervsknmcwjg4qgloj643b4itjlfeyiipvsrborszgrhlg@zrp65nvfueqk>
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

On Tue, 16 Sep 2025, Bjorn Andersson wrote:

> On Thu, Sep 11, 2025 at 11:01:00AM +0200, Hans de Goede wrote:
> > Hi Lee,
> > 
> > On 11-Sep-25 10:15 AM, Lee Jones wrote:
> > > On Wed, 10 Sep 2025, Aleksandrs Vinarskis wrote:
> > > 
> > >> From: Hans de Goede <hansg@kernel.org>
> > >>
> > >> Add 'name' argument to of_led_get() such that it can lookup LEDs in
> > >> devicetree by either name or index.
> > >>
> > >> And use this modified function to add devicetree support to the generic
> > >> (non devicetree specific) [devm_]led_get() function.
> > >>
> > >> This uses the standard devicetree pattern of adding a -names string array
> > >> to map names to the indexes for an array of resources.
> > >>
> > >> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> > >> Reviewed-by: Lee Jones <lee@kernel.org>
> > > 
> > > Remind me why this can't go in through LED again?
> > 
> > I don't think anyone has discussed how to merge this yet.
> > 
> > I believe that the LED tree is the correct tree to merge this
> > entire series through, once the DT bits have been reviewed.
> > 
> 
> Unless there are some strong reasons (that I'm failing to spot), we
> should merge the DeviceTree binding and implementation through the LED
> tree. Then I merge the DTS change through the Qualcomm DT tree once the
> bindings are available in linux-next.

1-3 have been applied to the LED tree already.

-- 
Lee Jones [李琼斯]
