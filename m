Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 464FEBE27D4
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 11:48:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B4E610E993;
	Thu, 16 Oct 2025 09:48:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="LY6pxnqu";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="iRCKiYjV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CA1F10E993
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 09:48:05 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4cnNRk5kTGz9tjH;
 Thu, 16 Oct 2025 11:48:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1760608082;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dDU4MHtIXNjqAS9JJD27/CnM+BvS39aAL00HB1wKmUs=;
 b=LY6pxnquYPZzf/vnpVqvwnv42pmxyX6hS/LsDWtU2B5JF97gz28NKgw1jRUUjFmYd0WhY4
 DhTdpjEhwlwi09VKAedBaCkcFWVxDpPVQBRvnyexpFgvr6thnM+qsFM/SXawGC24Snlkop
 BAlxbv5sxRJcOfBbSTOPE3I5IkN2mwUjqU7cMUagSLRmPbwbsde288GtVU5kgwWl8HpOMt
 guOm0DFxFFkYnqDc5YhclS3FSNnqn2mBeSvrLomnHRcn4bpZcLw3l6XGd3EqNTvCt/hEb/
 4ZXRIj0BaM9G+H8AA7kE358iZM8WoKe7Dyz9W4zW7/b2OscjuPZVdG6sXIfCIA==
Message-ID: <51ff107d-126d-4481-b94a-f614f31c7bb8@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1760608080;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dDU4MHtIXNjqAS9JJD27/CnM+BvS39aAL00HB1wKmUs=;
 b=iRCKiYjVaNQjr7ciL/76PHWjl/5d+opl6I8j9fSY+qFPEtSc5dnwYavGolev5MM93Ngcdu
 jI9veoq6Z/SRRV+gM+fLHysHUfIk4n6YOTzptX/Y5KOBvYVIGf9NxaiUXHF/VBNUqF8gta
 JygcaVjXZOjfL9Bz15/lXRRO2RvvdX8l2LnnxfYIjgc3KZJ6PtM5oWJKIAY3RpwBrlVJB7
 hELhC2z0tVptxe9FamxUsaGGnVtlkgWapRFm9F1p5+5PQGGCk+676DDTZJ4TEJKOh/H97j
 UhVs3Q/nD4Joq2xP7oZKdzJqq6GnWFwTGSgJupUhHQ04ka4rG1+CeIQwMtmcXQ==
Date: Thu, 16 Oct 2025 11:47:56 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v2 2/3] arm64: dts: renesas: r8a77960: Add GX6250 GPU node
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Adam Ford <aford173@gmail.com>, Conor Dooley <conor+dt@kernel.org>,
 David Airlie <airlied@gmail.com>, Frank Binns <frank.binns@imgtec.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Matt Coster <matt.coster@imgtec.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org
References: <20251015153952.185249-1-marek.vasut+renesas@mailbox.org>
 <20251015153952.185249-2-marek.vasut+renesas@mailbox.org>
 <CAMuHMdVdW+tMA1=g9D+BQV0fk0kis8FzyQgf7BpN-u=pi5eQfA@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CAMuHMdVdW+tMA1=g9D+BQV0fk0kis8FzyQgf7BpN-u=pi5eQfA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 6f731996ea0c40a0a5a
X-MBO-RS-META: oz5jm67tb1wz1eczi1ucb737inbcuyn3
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

On 10/16/25 10:22 AM, Geert Uytterhoeven wrote:

Hello Geert,

>> --- a/arch/arm64/boot/dts/renesas/r8a77960.dtsi
>> +++ b/arch/arm64/boot/dts/renesas/r8a77960.dtsi
>> @@ -2575,6 +2575,22 @@ gic: interrupt-controller@f1010000 {
>>                          resets = <&cpg 408>;
>>                  };
>>
>> +               gpu: gpu@fd000000 {
>> +                       compatible = "renesas,r8a7796-gpu",
>> +                                    "img,img-gx6250",
>> +                                    "img,img-rogue";
>> +                       reg = <0 0xfd000000 0 0x40000>;
>> +                       interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
>> +                       clocks = <&cpg CPG_CORE R8A7796_CLK_ZG>,
>> +                                <&cpg CPG_CORE R8A7796_CLK_S2D1>,
>> +                                <&cpg CPG_MOD 112>;
>> +                       clock-names = "core", "mem", "sys";
>> +                       power-domains = <&sysc R8A7796_PD_3DG_A>,
>> +                                       <&sysc R8A7796_PD_3DG_B>;
>> +                       power-domain-names = "a", "b";
>> +                       resets = <&cpg 112>;
> 
> status = "disabled"; ?

The GPU is always present in the SoC, similar to IPMMU/GIC/DMA/VSP/... 
which are also never disabled, do we want to disable the GPU by default 
and enable per-board ?

I would argue the GPU should be enabled by default, so the GPU driver 
can do a proper power management of the GPU. If firmware is missing, at 
least power it off on failed probe, if nothing else.

[...]
