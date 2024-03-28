Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31EB288FC7B
	for <lists+dri-devel@lfdr.de>; Thu, 28 Mar 2024 11:09:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA67610F4C7;
	Thu, 28 Mar 2024 10:09:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="H9bGvRGt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68ED210F4C7
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 10:09:36 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-34175878e3cso532372f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 03:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1711620574; x=1712225374;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=f5wMiw22c5vII85IvPgCG/zbOc7PIefhra+kZ3K8oIE=;
 b=H9bGvRGtCflwxNbBubnIQpoFtFwqBhpRd9a5MWrONW2WzvVg7QFBZzHt3EjxVxZvoT
 vfZia2tNx7eYHVjEX0RqWUHY52aP8hk2c/a9qeXJp4RHO/O2PeKRFZ3r+qV7lPWp2pTw
 k26puqjMW5I/VmyGt+vfyj/BSRxbbJdj9N7lzDf+fth67FTY6xPJCih9CIzG0NWG0fjl
 4Rup9Vw9FRP03GTN4Sjn/b4pgUinbqZFbFb59yXm+BGX2bBVDLp2WCqaiykX9KejzJtb
 JVDwVvqc08L4C4AHbJWlnf8lHu02HZ0Ey8d+h2rjWORWeqHIPgSlAk3k8rpOXXFQtsa9
 sMug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711620574; x=1712225374;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=f5wMiw22c5vII85IvPgCG/zbOc7PIefhra+kZ3K8oIE=;
 b=bv9pJyOrAu3mdGMNq6dK1IZqpriOee/t/dfRKXxs7niWYWIXdjwyTOUgaVX/npL9Rm
 3TxIGJnt3eTbUDcbTpMzjtSNcd5xHEIdQ6COVO4Gdap7uSbykS783MCPDYDX1ySwqm4L
 PkSaiwa9PihO7vqtxbcwtJAucZ6KJvNK5nrs/uxEgFei8gPRFnF9kG9aPJrwb53GvWBW
 f1cIQvZJzr4XP1UYc4/MSWzzqcVuIY8BlgLETjJGTe6f9upw7gqzMVhvPbWybX15LIuA
 sIvJkRJXivchZS1e1KlOi4BZxBNdQoQkfKjvXgeZpA57yBaiHQBUtXxRYAlsdVF8eYrf
 VRrA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUABAuyJ7IAJlYRU/uUBoCyczyOcov43YblFUZJP2TSD6bhFLKB9WN2kAeSX2ucUpdDZzQPycoX600di71Pq0Rd8egSK0MmNZbxsKh7tK3Z
X-Gm-Message-State: AOJu0Yxn+cSosZUdNQikORGwfBmzN7fOXT1i8M/xf7T5Oo00jbtundF9
 zJDVfutZ61TDDHRAWcZ/0ek0Q1EbLBdEwHbQWzjbT894IOs8lTc7zI6mhcm6f7A=
X-Google-Smtp-Source: AGHT+IFGHWYadDJCgABhwjbgmr/G/9ahD5CWJZRFUjAkHe014xq2ZOOYv0q270M74EFrQt4il5g9rw==
X-Received: by 2002:a5d:6d82:0:b0:33e:9292:b194 with SMTP id
 l2-20020a5d6d82000000b0033e9292b194mr2493550wrs.14.1711620574475; 
 Thu, 28 Mar 2024 03:09:34 -0700 (PDT)
Received: from [10.1.5.127]
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id
 ea2-20020a0560000ec200b003432d79876esm1316197wrb.97.2024.03.28.03.09.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Mar 2024 03:09:34 -0700 (PDT)
Message-ID: <4dba5a65-d1dc-4a80-bcaa-fe9ba02c5082@baylibre.com>
Date: Thu, 28 Mar 2024 11:09:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/18] Add audio support for the MediaTek Genio 350-evk
 board
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 Lee Jones <lee@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Conor Dooley
 <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-arm-kernel@lists.infradead.org, Takashi Iwai <tiwai@suse.com>,
 Jaroslav Kysela <perex@perex.cz>, Flora Fu <flora.fu@mediatek.com>,
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Nicolas Belin <nbelin@baylibre.com>, Fabien Parent <fparent@baylibre.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Will Deacon <will@kernel.org>
References: <20240226-audio-i350-v1-0-4fa1cea1667f@baylibre.com>
 <53671deb-9c11-43c1-8deb-93fe4708651a@collabora.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <53671deb-9c11-43c1-8deb-93fe4708651a@collabora.com>
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

Hi Angelo

On 26/02/2024 15:54, AngeloGioacchino Del Regno wrote:
> Il 26/02/24 15:01, Alexandre Mergnat ha scritto:
>> This serie aim to add the following audio support for the Genio 350-evk:
>> - Playback
>>    - 2ch Headset Jack (Earphone)
>>    - 1ch Line-out Jack (Speaker)
>>    - 8ch HDMI Tx
>> - Capture
>>    - 1ch DMIC (On-board Digital Microphone)
>>    - 1ch AMIC (On-board Analogic Microphone)
>>    - 1ch Headset Jack (External Analogic Microphone)
>>
>> Of course, HDMI playback need the MT8365 display patches [1] and a DTS
>> change documented in "mediatek,mt8365-mt6357.yaml".
>>
>> [1]: 
>> https://lore.kernel.org/all/20231023-display-support-v1-0-5c860ed5c33b@baylibre.com/
>>
>> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> 
> Actually, I am cooking a series (I'm finishing the testing....) that 
> brings quite
> a bit of cleanups in MTK ASoC, including the commonization of the 
> machine driver
> probe, with the dai-link DT nodes, and which also modernizes most of the 
> existing
> drivers to use that instead.
> 
> If you wait for a day or two, your mt8365-mt6357.c driver's probe 
> function can be
> shrunk to ~3 lines or something like that.. very easily :-)

Just to inform you. I'm aware of your serie. Currently, I've fixed my 
patches according to the comments. The next step will be to rebase my 
serie over yours and do the changes to be aligned with your new 
implementation.

I've planned to review your serie during my last task, but it seems 
already approved and already (partially) merged into linux-next, sorry.


-- 
Regards,
Alexandre
