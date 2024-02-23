Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B2E860F2C
	for <lists+dri-devel@lfdr.de>; Fri, 23 Feb 2024 11:25:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD4E410E0B7;
	Fri, 23 Feb 2024 10:25:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="biVoo5Gz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A951810E0B7
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Feb 2024 10:25:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 5904CCE2358;
 Fri, 23 Feb 2024 10:25:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B480C433F1;
 Fri, 23 Feb 2024 10:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708683924;
 bh=UAKXalfV4EJLOzKqZ5lgk5fK0b5rmyrMA6CAZBOKxdI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=biVoo5GzsSKQq0MtzS//PqdxLS7Dw3bUyd9gr//iCqEC7R8E5DJVHOA8SFJUkxNTb
 2KfFMB2yJtw9/J/3II6NcZkZPO15+ypEVQJp7g4/Gy1yodV5L69646k51/QITjZtb/
 bNKsS8Y5cjb47Rz6N43K2hBWzt7scl6PuH9BK2U8z3RxtYjqy4ZW1OrFbH1icMJS0f
 b4VpAMCAF99cRjuVOY27aylqpLptyuuFI0QMV1d7ETDxkZcpZYfUx7xRNV5AfSKWCH
 ZgTYlUdsbXYS4DIGa3JdN0jIl0Z4Pb062WwEigKSfNmTqR4VnuVjjdCv/+8BN5mlWh
 0Ct9HQdu9vktA==
Date: Fri, 23 Feb 2024 10:25:17 +0000
From: Lee Jones <lee@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Dharma.B@microchip.com, alexandre.belloni@bootlin.com,
 linux-pwm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Conor.Dooley@microchip.com, thierry.reding@gmail.com,
 krzysztof.kozlowski+dt@linaro.org, claudiu.beznea@tuxon.dev,
 Hari.PrasathGE@microchip.com, airlied@gmail.com,
 Manikandan.M@microchip.com, sam@ravnborg.org,
 u.kleine-koenig@pengutronix.de, devicetree@vger.kernel.org,
 conor+dt@kernel.org, tzimmermann@suse.de,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 linux-arm-kernel@lists.infradead.org, bbrezillon@kernel.org,
 linux-kernel@vger.kernel.org, krzysztof.kozlowski@linaro.org,
 daniel@ffwll.ch
Subject: Re: (subset) [linux][PATCH v6 3/3] dt-bindings: mfd: atmel,hlcdc:
 Convert to DT schema format
Message-ID: <20240223102517.GM10170@google.com>
References: <20240202001733.91455-1-dharma.b@microchip.com>
 <20240202001733.91455-4-dharma.b@microchip.com>
 <170738899221.920003.15342446791449663430.b4-ty@kernel.org>
 <cedecdb7-fe4a-42ea-9a11-faa82f84b57d@linaro.org>
 <ffd43756-b24e-4f19-be33-0e33047ad70c@microchip.com>
 <20240220082026.GG10170@google.com>
 <9dbfbeac-3a00-4571-95c0-83e4d47737c5@microchip.com>
 <20240222232118.GA3786028-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240222232118.GA3786028-robh@kernel.org>
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

On Thu, 22 Feb 2024, Rob Herring wrote:

> On Tue, Feb 20, 2024 at 08:30:38AM +0000, Dharma.B@microchip.com wrote:
> > Hi Lee,
> > 
> > On 20/02/24 1:50 pm, Lee Jones wrote:
> > > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > > 
> > > On Tue, 20 Feb 2024, Dharma.B@microchip.com wrote:
> > > 
> > >> Hi Krzysztof,
> > >>
> > >> On 12/02/24 3:53 pm, Krzysztof Kozlowski wrote:
> > >>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > >>>
> > >>> On 08/02/2024 11:43, Lee Jones wrote:
> > >>>> On Fri, 02 Feb 2024 05:47:33 +0530, Dharma Balasubiramani wrote:
> > >>>>> Convert the atmel,hlcdc binding to DT schema format.
> > >>>>>
> > >>>>> Align clocks and clock-names properties to clearly indicate that the LCD
> > >>>>> controller expects lvds_pll_clk when interfaced with the lvds display. This
> > >>>>> alignment with the specific hardware requirements ensures accurate device tree
> > >>>>> configuration for systems utilizing the HLCDC IP.
> > >>>>>
> > >>>>> [...]
> > >>>>
> > >>>> Applied, thanks!
> > >>>>
> > >>>> [3/3] dt-bindings: mfd: atmel,hlcdc: Convert to DT schema format
> > >>>>         commit: cb946db1335b599ece363d33966bf653ed0fa58a
> > >>>>
> > >>>
> > >>> Next is still failing.
> > >>>
> > >>> Dharma,
> > >>> You must explain and clearly mark dependencies between patches.
> > >>
> > >> I sincerely apologize for any confusion caused by the oversight. I have
> > >> organized the patches according to their dependencies in the patch
> > >> series, but unfortunately, I neglected to explicitly mention these
> > >> dependencies. I understand the importance of clear communication in our
> > >> collaborative efforts. Please feel free to provide guidance on how I can
> > >> assist you further in resolving this matter.
> > > 
> > > If this continues to be an issue, I can just remove the commit.
> > 
> > There won't be any issue if both pwm and display binding goes before the 
> > mfd binding.
> > 
> > Could you please pick the display binding as well?
> 
> As this is still not resolved, I've applied the display binding. Not 
> ideal, but should fix next.

Works for me.

-- 
Lee Jones [李琼斯]
