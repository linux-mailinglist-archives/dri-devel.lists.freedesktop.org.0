Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F03B2E8B8
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 01:35:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D561B10E81B;
	Wed, 20 Aug 2025 23:35:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="sKcM1ibb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC91310E81B
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 23:35:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id E2C1061444;
 Wed, 20 Aug 2025 23:35:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36F06C4CEE7;
 Wed, 20 Aug 2025 23:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755732948;
 bh=y57OXA2qf0ImBgIAMIygDKuxGU0lido+XJCFV2fG2rs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sKcM1ibb8MR4oGQMr9Iti0vVq6ftAwMHTG7m7VQxgWzQIf+aJWsugCZci+v0gqIgN
 NThenXhxpwjRr3sjjWbs9s5fi4o8Q3MVZ4PK2pGvjgnY3E9/rTXKyCjKue+TwQLwvY
 4LcJbfkfPbafd/mauVtJXps5f89CcfL1RZ2UYpnQ8sW/ycGKfGSjZxyd87YYbnbV+U
 or0dwV6f3xxcVdEoggkerG69Ijm3Ufr6Mx9dEelBFTWLOmYD874mkcUj+Y0KtYd16D
 0p9e19/egc/sfba2OA9OFld/JbA+ZwCcAGFuEnaf5tWPZ1fGkAo2xIcyZDHLkdstfT
 psocEQxyqFI/A==
Date: Wed, 20 Aug 2025 18:35:42 -0500
From: Rob Herring <robh@kernel.org>
To: "Kumar, Udit" <u-kumar1@ti.com>
Cc: "Raghavendra, Vignesh" <vigneshr@ti.com>,
 Harikrishna Shenoy <h-shenoy@ti.com>, neil.armstrong@linaro.org,
 jessica.zhang@oss.qualcomm.com, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, krzk+dt@kernel.org, conor+dt@kernel.org,
 nm@ti.com, kristo@kernel.org, thierry.reding@gmail.com,
 sam@ravnborg.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 s-jain1@ti.com, devarsht@ti.com
Subject: Re: [RFC PATCH 1/3] devicetree: bindings: dsiplay: panel:
 panel-simple.yaml: Add Raspberry pi dsi panel compatible
Message-ID: <20250820233542.GA1691241-robh@kernel.org>
References: <20250818154746.1373656-1-h-shenoy@ti.com>
 <20250818154746.1373656-2-h-shenoy@ti.com>
 <06a9fa20-e45a-458c-971a-a6f0f1d08004@ti.com>
 <f2fff09a-376a-44b9-a421-13202b1079fb@ti.com>
 <0268561b-8a3b-4508-bd28-3b47f5a8b754@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0268561b-8a3b-4508-bd28-3b47f5a8b754@ti.com>
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

On Tue, Aug 19, 2025 at 11:22:42AM +0530, Kumar, Udit wrote:
> 
> On 8/19/2025 10:46 AM, Raghavendra, Vignesh wrote:
> > 
> > On 8/19/2025 10:24 AM, Kumar, Udit wrote:
> > > On 8/18/2025 9:17 PM, Harikrishna Shenoy wrote:
> > > > Add RPi DSI panel[0] as a valid compatible for simple-panel.
> > > > 
> > > > [0]: https://www.raspberrypi.com/products/raspberry-pi-touch-display/
> > $subject has typo s/dsiplay/display and s/dsi/DSI
> > (use a spellcheck with your editor).
> > 
> > Also follow the existing prefix convention for the file (run
> > git log --oneline to figure out the right prefix)
> > 
> > > > Signed-off-by: Harikrishna Shenoy <h-shenoy@ti.com>
> > > > ---
> > > >    .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
> > > >    1 file changed, 2 insertions(+)
> > > > 
> > > > diff --git a/Documentation/devicetree/bindings/display/panel/panel-
> > > > simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-
> > > > simple.yaml
> > > > index 1ac1f0219079..65f486f2bc9d 100644
> > > > --- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> > > > +++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> > > > @@ -268,6 +268,8 @@ properties:
> > > >          - rocktech,rk070er9427
> > > >            # Rocktech Display Ltd. RK043FN48H 4.3" 480x272 LCD-TFT panel
> > > >          - rocktech,rk043fn48h
> > > > +        # Raspberry, 7" dsi panel
> > > > +      - rpi,7inch-dsi
> > > Hello Hari,
> > > 
> > > Driver changes should come first to match new compatible before device
> > > tree changes.
> > No, there isnt a driver update that I can see in the current series. But
> 
> correct current series does not have driver changes.
> 
> I would expect driver changes as well, which should come before device tree.

If you rely on that, then you are likely breaking the ABI. Please don't 
submit any DT related patches until you understand that.

You must define the ABI first, then add users of that ABI. Users are 
both .dts files and drivers. It is that simple.

Rob
