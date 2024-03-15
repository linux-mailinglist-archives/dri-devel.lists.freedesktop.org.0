Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AEDB87D2E5
	for <lists+dri-devel@lfdr.de>; Fri, 15 Mar 2024 18:36:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB2F01123E0;
	Fri, 15 Mar 2024 17:36:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="GgKqFrxX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51E901123E0
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Mar 2024 17:36:24 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-2d204e102a9so28835061fa.0
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Mar 2024 10:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1710524183; x=1711128983;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4ec9RrIuQWFrWDmIdusRv4/vXGJuKnTeszoS+IpWRfc=;
 b=GgKqFrxXFvly37dqvowxeNp3Zhc19BHTL0bhQie4QA5fhll1+2gOygNLLFpVpQ9Z9k
 m08UHRKaUnGq3qKrdw53hAJYMXd4DAAnpXBMcDK+mf5NKqPpepq4sEIoRhEb8xQUqq6o
 o6qP+Kj94W3OOy0ndcCssu0S7j4Mej4+O68FqgXSbvsO7wcz1ydMquErzsunJv0lpNLl
 A+SCI5RS48loQC5Hb9eJWOoeuNFtw+c8Lmb17AmXxjUggpxEj3mOWjH5hpzG1ePefJ7d
 vayttM2YFQu52XaUTgdZcjkCLUlnnMfQiRK/ixfK9jb3dIetfjSg7Wv75lJyASsXjq31
 5rMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710524183; x=1711128983;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4ec9RrIuQWFrWDmIdusRv4/vXGJuKnTeszoS+IpWRfc=;
 b=Yzh/c9oZqcgupfElFgOZbUBDA5fiFssSzon0Bz8cn6d9BXNhocdVvNIwPSRr/gLiQy
 QtAWW3G6oEr3z2nc+VPn7TnF/6rrH+n0J8G2c13JnEmAI8TypdWQr01m8i/S9Q5KFYxR
 WIu8foiArCEiUSku+nbOcKI2cpgsxhaschUfrq/3FpnYnF9SrovVjdhvmdzsh9p7L+nB
 G5BI/bV1ddTdIlHjgfPSSmScT0hAt25maEbDNBULVfSuLANeQI0oJgbTrbapqnn00I0t
 QoZ0IAJzG5JYEXQzpujJV2HUOGCu8/HyzxWZ25xmpYmS7degXXRZv2ucJ8dhcUBakrPv
 hFwg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU0nkee1fd2uMVfLqnhWD/glqd1sF9H6DkxtSmWqrlwi5U6zYdkTlr2PN+pADALSlCQvDN0wvfdvC4ZviurKyUZM8VrQdAO8ZUBaPlVoVZw
X-Gm-Message-State: AOJu0YzFNeltY/LwS/MqvFmM0Co1+GQsvItiFL0Nw/eZ4st/qe1PXjQ2
 4OuNwpfK4ZPat7azU8sBBdXHAO+LQtHAVNEZppfNmDnCZhbq6VX4E/k1W6l5IMY=
X-Google-Smtp-Source: AGHT+IFk5NGPtCj8mXhvsYrdH1nre5XfSVGVRBDeRwQi7zLXGNIq4CodW9FczpHV1YSFYg82SuoADQ==
X-Received: by 2002:a05:651c:23a:b0:2d3:3b37:db78 with SMTP id
 z26-20020a05651c023a00b002d33b37db78mr3420227ljn.16.1710524182477; 
 Fri, 15 Mar 2024 10:36:22 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
 by smtp.gmail.com with ESMTPSA id
 ca18-20020a170906a3d200b00a469ebf37dfsm46312ejb.203.2024.03.15.10.36.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Mar 2024 10:36:21 -0700 (PDT)
Message-ID: <a9ad625a-c6fd-44f1-8776-aa5d54b448ae@baylibre.com>
Date: Fri, 15 Mar 2024 18:36:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/18] ASoC: codecs: mt6357: add MT6357 codec
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Lee Jones <lee@kernel.org>, Flora Fu <flora.fu@mediatek.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Nicolas Belin <nbelin@baylibre.com>
References: <20240226-audio-i350-v1-0-4fa1cea1667f@baylibre.com>
 <20240226-audio-i350-v1-12-4fa1cea1667f@baylibre.com>
 <9891855d-2284-42e4-9d3a-35ba406540e8@sirena.org.uk>
 <c441a132-b16b-4244-a712-8971c902d4d7@baylibre.com>
 <ff3d2db1-697b-42c6-a0f2-74276e9fc098@sirena.org.uk>
 <dda0e6ba-4538-47a0-95e9-6adcfd4169a7@baylibre.com>
 <0d31ffb2-9df5-4c3e-a728-902b71a1a713@sirena.org.uk>
 <fd53a0e7-fa70-4c0d-b578-393183487335@baylibre.com>
 <0a41b498-5cca-4487-a0e0-0df749f6e796@sirena.org.uk>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <0a41b498-5cca-4487-a0e0-0df749f6e796@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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



On 15/03/2024 16:15, Mark Brown wrote:
> On Fri, Mar 15, 2024 at 04:05:21PM +0100, Alexandre Mergnat wrote:
>> On 15/03/2024 15:30, Mark Brown wrote:
> 
>>>> Let me know, when you change de gain to do a ramp down (start from user gain
>>>> to gain=-40db), next time for the ramp up, how/where do you find the user
>>>> gain ?
> 
>>> In the register.  You only need to reset the gain to -40dB at the start
>>> of the ramp.
> 
>> Sorry but I don't understand your logic, I'm not able to implement it...
>> If I'm at -10dB and doing a ramp to reach -40dB, next time I will read the
>> register the value will be -40dB.
> 
> After we've done the ramp and turned the amplifier off we can just
> restore the desired value?  The hardware is not going to care what the
> volume is while it's not enabled.

If you do that, HP will be enabled at the saved gain, and after that you 
will do the ramp. To avoid pop, the driver should be rewrite to:

   Read gain in the reg and save it locally
   Set -40dB in the reg
   Enable HP
   Do ramp

And for the shutdown:

   Read gain in the reg and save it locally
   Do ramp
   Disable HP
   Set saved gain in the reg


To resume, that add 4 more steps to save 2 integers into the driver 
structure.

IMHO, I don't think it make the code more readable or optimized, but I 
don't have a strong opinion about that, so if you think it's better, I 
will change it.


> 
>> This implementation is also done in other MTK audio codec drivers.
> 
> Perhaps they should be updated too?
> 
>>>> When microphone isn't capturing, the gain read back from the register is
>>>> 0dB. I've put some logs in my code and do capture to show how it works:
> 
>>> Is this a property of the hardware or a property of your driver?
> 
>> At the end of the capture, the gain is set to 0dB by the driver.
>> At the start of the capture, the gain is set to the setup gain.
> 
> So that's a property of the driver then?

Yes

> 
>> AFAII from the comment in the code, it's done to avoid the "pop noises".
> 
> Yes, that's the usual reason to ramp gains.  Though if you've just
> copied the code without checking that it's needed it's possible that
> this is something that's been fixed in current hardware.

I did the test at 24dB with and without the "pop filter". Isn't big but 
I ear the pop at the start of the record without the "pop filter".

To be clear, the algo/behavior of this code is an implementation based 
on the 6k+ lines downstream code for this specific audio codec. But the 
shape/style is based on upstreamed drivers like mt6358.c.

-- 
Regards,
Alexandre
