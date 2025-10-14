Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEED0BDBB80
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 00:59:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85EEB10E130;
	Tue, 14 Oct 2025 22:59:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="lDEcy0Il";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="xUVFUheZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DF2610E130
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 22:59:54 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4cmV6J1LRGz9tvJ;
 Wed, 15 Oct 2025 00:59:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1760482792;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4hfowH2iHudGa0LkdrtS84kdcHbiN+9po/FhXQJzKNc=;
 b=lDEcy0IlAKe7LED+HzIzOHqp7CRKXKALzRrQvDKmrcT+wSLI8n83tfSuSjmrDfFXpayuFZ
 D/To6s3CvThP/7sijhPgJ0EAXtGCAvTCiKU0hr6VoOZ2EXwEd+pirxb2DYcmsWOwxuzKe7
 v2fyfqfHItH+5h09GPlqQAPfuAxAu2azo2UqNy56zXTOW4MqPFdpitQ2Xxx4iE9aNGqlC8
 nb8nbZLPr4IhuTRN8T7YfzqaTccW2zL4BslS3CNut000rO3wDjAN+VZeuR/mrLzeHKRzKc
 ypTa4p2sU3wR40taTxUJFxAGHWs3Yr4evv0CtGzFYK5qYoB/fC8RKzR3INpzsw==
Message-ID: <e93779e7-026b-4b48-9d9b-dfef3d953749@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1760482790;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4hfowH2iHudGa0LkdrtS84kdcHbiN+9po/FhXQJzKNc=;
 b=xUVFUheZfugfP5J1pOCixDTQUpRLR9ZwawCcYGvcbW0pX3TvbJAVoSQR0l//+64oGR/MuC
 blIqT6PMlEMDE32pIZjKikeZZZ6Esi+Tluf4fTwEaEqODCW8cHnbbowg5IEy5Pol3VmG/t
 wJdllMmbnaVfbRqAKkNHWe9SxD7JNhKUw1Iq4FYbKsa0Bd/x04aPTN5wXuX/CIicFhqQY2
 NXckdpuJlHBs606HssIwzgcfZWsjPuVfR2lY02+kbvVV2raxdD0+jRTlQzkqilhKH6y4h/
 TS/wUVguGXKs4890cebtTyZCBWI10ZFHQBYEgCllVDjVFIe98h00NosUuw2sug==
Date: Wed, 15 Oct 2025 00:59:45 +0200
MIME-Version: 1.0
Subject: Re: [PATCH 2/3] arm64: dts: renesas: r8a77960: Add GX6250 GPU node
To: Matt Coster <Matt.Coster@imgtec.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: Adam Ford <aford173@gmail.com>, Conor Dooley <conor+dt@kernel.org>,
 David Airlie <airlied@gmail.com>, Frank Binns <Frank.Binns@imgtec.com>,
 Alessio Belle <Alessio.Belle@imgtec.com>,
 Alexandru Dadu <Alexandru.Dadu@imgtec.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Rob Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
References: <20251013190210.142436-1-marek.vasut+renesas@mailbox.org>
 <20251013190210.142436-2-marek.vasut+renesas@mailbox.org>
 <d4ec2cc2-882a-4842-ad8c-42033ceb2bc7@imgtec.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <d4ec2cc2-882a-4842-ad8c-42033ceb2bc7@imgtec.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: ya4auwctb7mmsqbrry9umriad1d3o4wa
X-MBO-RS-ID: 34d82dfc4b4fa9568db
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

On 10/14/25 1:52 PM, Matt Coster wrote:

Hello Matt,

>> +++ b/arch/arm64/boot/dts/renesas/r8a77960.dtsi
>> @@ -2565,6 +2565,18 @@ gic: interrupt-controller@f1010000 {
>>   			resets = <&cpg 408>;
>>   		};
>>   
>> +		gpu: gpu@fd000000 {
>> +			compatible = "renesas,r8a77960-gpu",
>> +				     "img,img-gx6250",
>> +				     "img,img-rogue";
>> +			reg = <0 0xfd000000 0 0x40000>;
>> +			interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
>> +			clocks = <&cpg CPG_MOD 112>;
>> +			clock-names = "core";
>> +			power-domains = <&sysc R8A7796_PD_3DG_B>;
> 
> My comments here apply to the other dts patch (P3/3) as well since the
> integration appears to be identical between the two SoCs.
> 
> There are two power domains on this GPU and the SoC exposes both of
> them; no reason to fall back to the single-domain scheme here.
> 
> I know the sysc driver declares the dependency of _B on _A, but the dts
> shouldn't rely on that, so can we have:
> 
>     power-domains = <&sysc R8A7796_PD_3DG_A>, <&sysc R8A7796_PD_3DG_B>;
>     power-domain-names = "a", "b";

Both SoCs fixed in V2 , which I will post in a few days , thanks !

>> +			resets = <&cpg 112>;
> 
> Is this a reset line? Is it a clock?

This is a reset line. The MSTP controls both clocks and resets, but this 
particular phandle describes reset control.

> I see this pattern used throughout
> the Renesas dts, but I'm just thinking how this will interact with the
> powervr driver. The reset line is optional since some hardware
> integrations manage it for us during the power-up/down sequences, which
> appears to be the case here with the MSTP control (from my brief dig
> through the Renesas TRM).

As far as I can tell, the pvr_power.c toggles the IP reset after the IP 
clock were already enabled, so the IP should be correctly reset. What 
kind of problem do you expect ?

> Related, see my comments on the bindings patch (P1/3) about how clocks
> are wired up in this SoC.
I tried to reply to that one, hopefully it makes some sense.
