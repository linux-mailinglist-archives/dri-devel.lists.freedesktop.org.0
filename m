Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D863885C1A6
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 17:46:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3837310E3D7;
	Tue, 20 Feb 2024 16:46:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=z3ntu.xyz header.i=@z3ntu.xyz header.b="KycZigQU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1ECF10E3D7
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 16:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=z3ntu.xyz; s=s1;
 t=1708447534; bh=uPw+t+yyr5l3RfuJ+j4QxR6uN1Mq2rOau1muRGhJc4Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=KycZigQUMXyUgO/ZX1pwNs/h4N/p5iUVZ+Ez1ku4mVxBnPMAymiAu3PSAIG2LqEG6
 7Bt+7rBQf9ShkFg6bd76BMPxt4VXeHeYe/E85r4AJG2zZcXlm9x2GA0wKoj1v6NCv6
 QctnEHZnprqmKoaU8RxkTXVoLWvshdQWUcHd0zpA=
From: Luca Weiss <luca@z3ntu.xyz>
To: Daniel Thompson <daniel.thompson@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>, Andrew Morton <akpm@linux-foundation.org>,
 "G.Shark Jeong" <gshark.jeong@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maximilian Weigand <mweigand@mweigand.net>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 4/4] ARM: dts: qcom: msm8974-hammerhead: Hook up backlight
Date: Tue, 20 Feb 2024 17:45:32 +0100
Message-ID: <2444202.ElGaqSPkdT@g550jk>
In-Reply-To: <20240220141210.GG6716@aspen.lan>
References: <20240220-lm3630a-fixups-v1-0-9ca62f7e4a33@z3ntu.xyz>
 <20240220-lm3630a-fixups-v1-4-9ca62f7e4a33@z3ntu.xyz>
 <20240220141210.GG6716@aspen.lan>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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

On Dienstag, 20. Februar 2024 15:12:10 CET Daniel Thompson wrote:
> On Tue, Feb 20, 2024 at 12:11:22AM +0100, Luca Weiss wrote:
> > Connect the panel with the backlight nodes so that the backlight can be
> > turned off when the display is blanked.
> >
> > Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> 
> Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
> 
> 
> > ---
> >  arch/arm/boot/dts/qcom/qcom-msm8974-lge-nexus5-hammerhead.dts | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974-lge-nexus5-hammerhead.dts b/arch/arm/boot/dts/qcom/qcom-msm8974-lge-nexus5-hammerhead.dts
> > index 4aaae8537a3f..8eaa5b162815 100644
> > --- a/arch/arm/boot/dts/qcom/qcom-msm8974-lge-nexus5-hammerhead.dts
> > +++ b/arch/arm/boot/dts/qcom/qcom-msm8974-lge-nexus5-hammerhead.dts
> > @@ -182,7 +182,7 @@ &blsp2_i2c5 {
> >  	status = "okay";
> >  	clock-frequency = <355000>;
> >
> > -	led-controller@38 {
> > +	backlight: led-controller@38 {
> 
> Again... a minor nit regarding existing problems but this node doesn't
> follow the generic naming recommendations:
> https://devicetree-specification.readthedocs.io/en/stable/devicetree-basics.html#generic-names-recommendation

"led-controller" is listed on that page, or do you mean something else?

> 
> 
> Daniel.
> 




