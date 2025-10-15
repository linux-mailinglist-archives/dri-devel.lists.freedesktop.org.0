Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0861BDF166
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 16:33:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA96110E811;
	Wed, 15 Oct 2025 14:33:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="I2lRGJfq";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="I/Fcsian";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 568A110E811
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 14:33:35 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4cmtqd6zFXz9tTj;
 Wed, 15 Oct 2025 16:33:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1760538814;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KoAAYwwSkct1dybDxwgNyk2Rm0SbhKgSXVNFxBcKatM=;
 b=I2lRGJfqsloGT2SHdY2M8bMV7/q4Pr59f484nUVBeklXjYgpLKNPtR3atxbCXVW/1M6/d1
 //HA5XXVaNuD2b6Enca6KnfDPJxqBmUJVqa4NOLPhPFCNkGxeddmE1IsXzMp3cd3fDxZa9
 4Wf2yOBB5cqHG01UPn+ngvQ1D/DdhFnwzrgHDLLlrUCNHJ2+CF+eucPncmiU2dFK1Xd5zj
 1bqiFG5NNt+0uzUK50KJiBMdN5ZwIGz4mp4wdPyVgLVCJat/0ddlHGrXzVsca75CD+dH9o
 jexbeP8s6jXf3KHK5o6c3HwCeYSfw964x6dFHgdaUjHVmUad+JjZ9p3epDuIHA==
Message-ID: <78249155-c90a-4c33-8caa-d79d83171551@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1760538811;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KoAAYwwSkct1dybDxwgNyk2Rm0SbhKgSXVNFxBcKatM=;
 b=I/FcsianBv0Nxyf1djQKC/ndDM6D04GOPsXWCbJsRR8sd9AASeOicPZ6iFlUcdZQ5lOzOD
 Ja5w1TTbFN+8hn/CISsFQbHxB7aDwsVIp1/ltJEvascotKjnWLppiDSkL0ALI5UeGqpeDJ
 VjQca0ofS305cN2uQPwlJRtSOCiviTS/QR5G0ui17dOZgAUEzdgfYD5NVntVYPWcw21Pz1
 6LzaB30f84Cgzsz1dU5n4QmbfXG9yQpY+e8Jtp/H2lEvSCoD+car8jueuek8SJfo4QkP1S
 Yqi8gLvqHlDHg9MF2IAX9amcKfIRtY0TXLBtsfkM2aIM04bBzGFYS5+lLWccYA==
Date: Wed, 15 Oct 2025 16:32:24 +0200
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
 <e93779e7-026b-4b48-9d9b-dfef3d953749@mailbox.org>
 <dd7e09c7-995f-4ef9-a5bc-ff6c8be64ae1@imgtec.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <dd7e09c7-995f-4ef9-a5bc-ff6c8be64ae1@imgtec.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: c1dy1jmb5s88yb7q9s43rwqiniopzzh7
X-MBO-RS-ID: fb5ef80d27592a90e0c
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

On 10/15/25 12:55 PM, Matt Coster wrote:

Hello Matt,

>>> I see this pattern used throughout
>>> the Renesas dts, but I'm just thinking how this will interact with the
>>> powervr driver. The reset line is optional since some hardware
>>> integrations manage it for us during the power-up/down sequences, which
>>> appears to be the case here with the MSTP control (from my brief dig
>>> through the Renesas TRM).
>>
>> As far as I can tell, the pvr_power.c toggles the IP reset after the
>> IP clock were already enabled, so the IP should be correctly reset.
>> What kind of problem do you expect ?
> 
> I think I'm just being paranoid about the weirdness (to me at least) of
> having one device be treated as both clock and reset line. Assuming this
> is tested as working, I'm okay with it, especially as it seems to be the
> norm for Renesas.

The combined clock/reset IP is not limited to renesas SoCs, there are 
other SoCs which do the same thing (Allwinner "ccu", Marvell PXA 
"soc_clocks" , nVidia Tegra "car", Qualcomm "gcc", Rockchip "cru", to 
name a few). Usually the registers which control clock and resets are 
shared in the same IP, but they control different (possibly related) 
signals in the SoC.

>>> Related, see my comments on the bindings patch (P1/3) about how clocks
>>> are wired up in this SoC.
>> I tried to reply to that one, hopefully it makes some sense.
> 
> Looks like we've figured it out there, thanks for your comments!

Likewise, thank you for sharing the clocking details.

-- 
Best regards,
Marek Vasut
