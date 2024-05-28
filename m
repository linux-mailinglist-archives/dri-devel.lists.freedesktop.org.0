Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7959F8D1A6F
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2024 13:58:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B35510E291;
	Tue, 28 May 2024 11:58:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="S0ZIRIB3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8214A10E00A
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 11:39:58 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-2e95a883101so8375291fa.3
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 04:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1716896396; x=1717501196;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=th66Q1ugnjSwGLyeMw+7hKcvbcnCufiHIAVHPy+CA48=;
 b=S0ZIRIB3ORyQiy12QNSsB3P/YPjgquAwIe89tweaQgXWQe98glu569CrAlZoucpLb+
 Vap9P92xucq8oWKR67TIcsMm+YinHI7GaSDJyNFDSKWN5L4PYcb3QharPYeTRwmWoQ60
 +9vyfggb408JBJ9dEFK6LZHVAWIN+yJLnn0fBQgcT9TRWfpdzA/Wk0Wjr4AnQTV16MH2
 axBuMf8nD8bbwAUOWioIaWKil+gtCHSFrpOreNcHiwuFr8zLMUdSfPCsS5AGES1vR5DM
 RB4qQkrH0P5OiujGZ1AzlEHojwPq8m+Ej2vP3uzyQa8qKX4Vj59yNYt6A/8z7hs9aHKW
 RKbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716896396; x=1717501196;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=th66Q1ugnjSwGLyeMw+7hKcvbcnCufiHIAVHPy+CA48=;
 b=HbRVVjb8C5BxPmpL6AnzLMUrzrcu8+MX6G/MdnTO4TWB7Hm3CbzPxGlRr0pG/rIxMM
 QA366VYlTo+yeI6AqB1IHUPKel7E48wOoSwYxeXJMZ6WiZIU2wRKETU1NcAbtfMeMygU
 oIfFiwdCIwrM63xGCVJ/DfwlkyutVJe7SZkTUzyWIyGIR07veF8fDhy6z1kzn6j2rjl/
 2RDhcrqzrQRdHX7CnPdX6mkWiVuV2EukTuFVZq/FjCWTD2iufP/94izUzuXshfW16tHQ
 xyjalpH72emVyWB45yq4mwaVwWZ4ElADo+VSyu+i0c7+58Zfzk5Ojy1nVQzrTcW0aUI+
 wh5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUajnVe2fizFLHZ9UE/mHb9w1sK+GW2KTricjZ4CR3kUzc3eE4ROs5aUPw0piA/OwqKjDLZyYBj55E8J/U4xAGFuSESCE7aFNTdNXoUN7Aw
X-Gm-Message-State: AOJu0Yw5oexXdnVppybUEevX8OlabvOhSIHQCuRiO1uYh2pEHbNMBkcu
 /Z2Bru2KRymYHC8lurf7UlNbPj6X5aTEUqafyJQmF/UlqL3lN/A769QMp8nlEw==
X-Google-Smtp-Source: AGHT+IFcUsJILpChNSEawvm1bH0LaXjeYVrJMaNE8wlaVJwduC/IGTGGrauWDqVxvhWA5Y9p7kM6Fw==
X-Received: by 2002:a2e:900a:0:b0:2e6:dc4a:758f with SMTP id
 38308e7fff4ca-2e95b0c99d0mr79515771fa.24.1716896396196; 
 Tue, 28 May 2024 04:39:56 -0700 (PDT)
Received: from [192.168.108.89] (freebox.vlq16.iliad.fr. [213.36.7.13])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3557a08a8bcsm11480808f8f.44.2024.05.28.04.39.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 May 2024 04:39:55 -0700 (PDT)
Message-ID: <6d2789e1-b14a-4b65-95ce-60d23e49465e@freebox.fr>
Date: Tue, 28 May 2024 13:39:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drm/bridge: simple-bridge: Add support for TI TDP158
To: Maxime Ripard <mripard@kernel.org>
Cc: Marc Gonzalez <marc.w.gonzalez@free.fr>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bryan O Donoghue <bryan.odonoghue@linaro.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>
References: <d3de652f-ce89-4f57-b900-07b11f8bf8f9@free.fr>
 <20240528-potoo-of-pragmatic-tempering-df08f1@houat>
 <0cd0136a-bbaf-482f-8e81-a858a6cdce2e@freebox.fr>
 <20240528-prophetic-masterful-hyrax-563f82@houat>
Content-Language: en-US, fr
From: Arnaud Vrac <avrac@freebox.fr>
In-Reply-To: <20240528-prophetic-masterful-hyrax-563f82@houat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 28 May 2024 11:57:26 +0000
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

On 28/05/2024 11:17, Maxime Ripard wrote:
> On Tue, May 28, 2024 at 10:05:50AM GMT, Arnaud Vrac wrote:
>> On 28/05/2024 09:43, Maxime Ripard wrote:
>>> Hi,
>>>
>>> On Mon, May 27, 2024 at 06:03:56PM GMT, Marc Gonzalez wrote:
>>>> From: Arnaud Vrac <avrac@freebox.fr>
>>>>
>>>> The TI TDP158 is an AC-Coupled HDMI signal to TMDS Redriver supporting
>>>> DVI 1.0 and HDMI 1.4b and 2.0b output signals.
>>>>
>>>> Since it's an I2C-programmable bridge, it could have a proper driver,
>>>> but the default settings work fine, thus simple bridge is sufficient.
>>>
>>> No it doesn't. That bridge supports HDMI 2.0 which means you'll need to
>>> change the TMDS clock ratio when programming a TMDS character rate
>>> higher than 340MHz. And you'll need hotplug support to deal with it
>>> properly too.
>>>
>>> So sorry, you need a real driver there.
>>
>> Hello, this is an HDMI redriver, which simply cleans up the HDMI
>> signal, so no programming is needed to support HDMI 2.0.
> 
> I mean, if I'm to trust the datasheet, it is more complicated than that.
> It snoops the DDC bus so it can update the TMDS clock ratio bit if it's
> sent on its input side, but that wouldn't happen with DP for example.
> 

That's a use case we can't test and will never use as a device integrator, unfortunately.

To support our simple HDMI redriver use case, would it be ok to write a driver just handling power up with documented bindings with the chip default settings ? Someone with an actual need for more specific setups could then implement the additional code needed to support that. The bindings could be extended without breaking compatibility.

Regards,
-Arnaud
