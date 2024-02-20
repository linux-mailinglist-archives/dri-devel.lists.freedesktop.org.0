Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACFCB85B4D5
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 09:20:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1FA810E1C8;
	Tue, 20 Feb 2024 08:20:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Sct0qFh2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA53710E1C8
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 08:20:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id EB6FB61093;
 Tue, 20 Feb 2024 08:20:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D58EEC43390;
 Tue, 20 Feb 2024 08:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708417234;
 bh=juZHMPub+6tKnVZnQVFBOsW3YWxQA8WKPjGFSa0GHbY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Sct0qFh2rWejdiEQbEC6tLRbe7HazW5qJNEyUtkts70T7v+WRZg61N8mgfmRki2wM
 V9n+IqokA3A2LE6ONHEkz+pUJftPcUj5PjlIvEd7BRwT/UV5aZ1xEMwM52f+y8ODDU
 AyKCc7jxszLRM1tElkMjQhLXY2hZ6HIhJW3pEny/ImLQoE3rwliv2lqTMTr2FzF5b2
 W7DmNi2gP2iipx5YGrWC1mtiBRH7TWXECQAYpdwz4tEiyf9nc2YiA7q2Nvxoakm7fX
 TFuQSJrxkOXvXtXXgBV2J0aKyc4rri/5YPf5nDWOAI+G39NbTHZD7q8J566jbIoieo
 NpLLRjASlEg/w==
Date: Tue, 20 Feb 2024 08:20:26 +0000
From: Lee Jones <lee@kernel.org>
To: Dharma.B@microchip.com
Cc: krzysztof.kozlowski@linaro.org, sam@ravnborg.org, bbrezillon@kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, Nicolas.Ferre@microchip.com,
 alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de,
 linux-pwm@vger.kernel.org, Hari.PrasathGE@microchip.com,
 Manikandan.M@microchip.com, Conor.Dooley@microchip.com
Subject: Re: (subset) [linux][PATCH v6 3/3] dt-bindings: mfd: atmel,hlcdc:
 Convert to DT schema format
Message-ID: <20240220082026.GG10170@google.com>
References: <20240202001733.91455-1-dharma.b@microchip.com>
 <20240202001733.91455-4-dharma.b@microchip.com>
 <170738899221.920003.15342446791449663430.b4-ty@kernel.org>
 <cedecdb7-fe4a-42ea-9a11-faa82f84b57d@linaro.org>
 <ffd43756-b24e-4f19-be33-0e33047ad70c@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ffd43756-b24e-4f19-be33-0e33047ad70c@microchip.com>
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

On Tue, 20 Feb 2024, Dharma.B@microchip.com wrote:

> Hi Krzysztof,
> 
> On 12/02/24 3:53 pm, Krzysztof Kozlowski wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > 
> > On 08/02/2024 11:43, Lee Jones wrote:
> >> On Fri, 02 Feb 2024 05:47:33 +0530, Dharma Balasubiramani wrote:
> >>> Convert the atmel,hlcdc binding to DT schema format.
> >>>
> >>> Align clocks and clock-names properties to clearly indicate that the LCD
> >>> controller expects lvds_pll_clk when interfaced with the lvds display. This
> >>> alignment with the specific hardware requirements ensures accurate device tree
> >>> configuration for systems utilizing the HLCDC IP.
> >>>
> >>> [...]
> >>
> >> Applied, thanks!
> >>
> >> [3/3] dt-bindings: mfd: atmel,hlcdc: Convert to DT schema format
> >>        commit: cb946db1335b599ece363d33966bf653ed0fa58a
> >>
> > 
> > Next is still failing.
> > 
> > Dharma,
> > You must explain and clearly mark dependencies between patches.
> 
> I sincerely apologize for any confusion caused by the oversight. I have 
> organized the patches according to their dependencies in the patch 
> series, but unfortunately, I neglected to explicitly mention these 
> dependencies. I understand the importance of clear communication in our 
> collaborative efforts. Please feel free to provide guidance on how I can 
> assist you further in resolving this matter.

If this continues to be an issue, I can just remove the commit.

-- 
Lee Jones [李琼斯]
