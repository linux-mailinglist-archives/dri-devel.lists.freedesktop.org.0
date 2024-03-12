Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C1F8796EF
	for <lists+dri-devel@lfdr.de>; Tue, 12 Mar 2024 15:55:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9882112BB7;
	Tue, 12 Mar 2024 14:55:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="W0mq3kG8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63453112BB7
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Mar 2024 14:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1710255297;
 bh=PRWIirwilphIw4zcMNTt1c46izhHLa0/pjMpYw4ic/o=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=W0mq3kG86LmhXg334vp1B8RhZDdbMeVpYdLAytnolcZyjPNfr2kXn9W5lEeixOCCK
 0KmgcInRX8B+FH1LhTbg2EK9zAnwoD7fQt1o7szRtSJduS5tr418smUTWytNHSsx9c
 A/8oELBaufMoRsGYc1EXP6BDAttBKUC6Y2dAy3f5JtztfuvHKt2VXujhe3zz2iynMN
 y7SYzLBUDaM7HX7tmyEVt7ss7JCHiJFfChIBbyUG6hZTcEi7DWN1evdnztmYn2wV0j
 EHH1e+uQBe13DRKMp537t6nk1gMuORiF+BfV/eAqHJxgQL/PllwTWlOh+cBvFWED4M
 EPNrpYnulqzZw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 197EA37811D4;
 Tue, 12 Mar 2024 14:54:56 +0000 (UTC)
Message-ID: <4572ff92-ca26-4e61-a756-b9456896faef@collabora.com>
Date: Tue, 12 Mar 2024 15:54:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/18] ASoC: codecs: mt6357: add MT6357 codec
Content-Language: en-US
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: Flora Fu <flora.fu@mediatek.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Takashi Iwai <tiwai@suse.com>,
 Jaroslav Kysela <perex@perex.cz>, Will Deacon <will@kernel.org>,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Nicolas Belin <nbelin@baylibre.com>
References: <20240226-audio-i350-v1-0-4fa1cea1667f@baylibre.com>
 <20240226-audio-i350-v1-12-4fa1cea1667f@baylibre.com>
 <1641a853-88cb-43a8-bb95-653f5329a682@collabora.com>
 <253b4b6c-d8ba-40a3-adbb-4455af57d780@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <253b4b6c-d8ba-40a3-adbb-4455af57d780@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Il 12/03/24 15:50, Alexandre Mergnat ha scritto:
> 
> 
> On 26/02/2024 16:25, AngeloGioacchino Del Regno wrote:
>>> +    if (enable) {
>>> +        /* set gpio mosi mode */
>>> +        regmap_write(priv->regmap, MT6357_GPIO_MODE2_CLR, GPIO_MODE2_CLEAR_ALL);
>>> +        regmap_write(priv->regmap, MT6357_GPIO_MODE2_SET, 
>>> GPIO8_MODE_SET_AUD_CLK_MOSI |
>>> +                                  GPIO9_MODE_SET_AUD_DAT_MOSI0 |
>>> +                                  GPIO10_MODE_SET_AUD_DAT_MOSI1 |
>>> +                                  GPIO11_MODE_SET_AUD_SYNC_MOSI);
>>
>> Are you sure that you need to write to MODE2_SET *and* to MODE2?!
> 
> This is downstream code and these registers aren't in my documentation.
> I've removed the MODE2_SET write and test the audio: it's still working.
> 
> So I will keep the spurious write removed for v2. :)
> 

Usually, MediaTek registers are laid out like "REG" being R/legacy-W and
"REG_SET/CLR" for setting and clearing bits in "REG" internally, and that
might account for internal latencies and such.

Can you please try to remove the MODE2 write instead of the MODE2_SET one
and check if that works?

You're already using the SETCLR way when manipulating registers in here,
so I would confidently expect that to work.

Cheers,
Angelo
