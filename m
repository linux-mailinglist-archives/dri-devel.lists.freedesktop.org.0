Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B0FBF51A9
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 09:55:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D83810E044;
	Tue, 21 Oct 2025 07:55:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="IdiF6+Y9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEC3A10E044
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 07:55:32 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-6317348fa4fso897762a12.3
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 00:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761033331; x=1761638131; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UDT2YCTKVhWQzLZXmbHmhx5CBJhVxoIzObMnL9LgsZQ=;
 b=IdiF6+Y9ILt0xwh9rpDAazi8a2DtGUPx4iVuK2dDcRXCwdaN6i55MQWUgWhOjByPpv
 nDQ+4dxTpaw2eYMhsh4taJXDMnY911uJiBzgKq7MAKOL7NUqYFt7cauV1jVqVLG4RNYN
 H9EEc48ZpO77XakQh+O11mIsTCmvyV4RE3RV1/1PRn7mZPyjcYBQ3vwzMwTOWtAwXo0v
 GSLDhjaIrF3g2/skkncHXHLuVXc1wGabS7dyZhFJs/NwKfKUXmdGR4k99SA2B8Ma5hbv
 FjTt1tpzvUQMV8RZ0Tl9wO+SpSocd4A42Kk6iuicP2xxGwOdBrtOsFbnScV3JOZvwvKm
 ngcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761033331; x=1761638131;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UDT2YCTKVhWQzLZXmbHmhx5CBJhVxoIzObMnL9LgsZQ=;
 b=p5vGBwd0qBWJaXE0De10ns3sMorozRPvYBe7Cy4oi+e1f28jxxmJz0gnI9MlncjoYt
 a4AszvcHa/FLmtUVbl+FssR4qpSj4AtexuQbkeY+XKkDr0ype6M6Eo6URCqxzC3v0AMQ
 Zapkj0WN66EQlaq3Apf2e2DH2cua/ZONojg6vPp1B4Cd5XaEhR5PwLb4U0e2qd5XYwAY
 KQQL/Ns5Bg69e9ErD4quzzD8ABrtylFFE47FbpG6401HARNXpVcjGqmrAgsTDlIW7kKb
 IMSxCdsLDEMcf2BQbAA4FMFdLlZpxG2egTD620KWiT8DHN+hOSeP1qfCLqVoVVmxjLAy
 vpKg==
X-Gm-Message-State: AOJu0YzHnWfD/wg3OQK0x5ybJbXJtIwNKVH6HFa34wjt9pa6yashtsxv
 GfmN45CE8Y1v24OwuZuSuE+Gpv6OVSfY1NpvubAQs8YW+9xAi5mayppX
X-Gm-Gg: ASbGncsssJs+PXgQq3JbDu6ro/j/rTv+npBlghiVENqf/D6T1Jwg0GIVyeqOaf0DLZ8
 V1FxUeQW2aL1n4PJ914lodFVMMRi4mC8gDTPEg0jw+bOGkpe2R8gVeUKNyoc8cV3DT34dbMhUzt
 rBJsZ+JkAG6u2wQyHZXlOPnjLD+4F+2AiTV5SV+BcdMzvKo4b+esxuOdHBk+yzUcn0u5b4XjhYU
 RaVCBDRRD9BuKjopF4vUqjwcLvdAsPJ6heIGC9die5wDdDCqY0JGTwn8C6ocsh+D2J/0+gf6fos
 Kp4vR9RqAd13uR3z0Et164tzRCLubXAhWWpJsxhW1i70vwizuw7QGtEyaDHqdIwkpVkaW6rIx/7
 jURhJKcNLff5Ql+aeG4PyB69HvdeXi5eP8tSQdVntA8gTrb0e40/GTmdzVklNNleP5oBJChLgc0
 4Sb8MmBwm8KjMcJtKSzg==
X-Google-Smtp-Source: AGHT+IFXWmYLO1Aa5Kw3gLn2Us5/ulNstPgt+twYj6ayh+e2XP/zbYFG3ArVGNoGv4PQDRU/BmkoIg==
X-Received: by 2002:a05:6402:1d4f:b0:634:4e0:8377 with SMTP id
 4fb4d7f45d1cf-63d16aedfe1mr1304424a12.2.1761033331200; 
 Tue, 21 Oct 2025 00:55:31 -0700 (PDT)
Received: from [192.168.1.105] ([165.50.73.64])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-63c4945f1ffsm8869668a12.31.2025.10.21.00.55.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Oct 2025 00:55:30 -0700 (PDT)
Message-ID: <71bb9475-07ba-48a9-9fa4-76e18a310b3a@gmail.com>
Date: Tue, 21 Oct 2025 09:55:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/solomon: Use kmalloc_array() instead of kmalloc()
To: Javier Martinez Canillas <javierm@redhat.com>,
 Shuah Khan <skhan@linuxfoundation.org>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 david.hunter.linux@gmail.com, khalid@kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
References: <20251019145927.167544-1-mehdi.benhadjkhelifa@gmail.com>
 <2541f99c-1081-4253-ae58-97654694cd78@linuxfoundation.org>
 <e4f0290b-5d15-472f-acee-e1e1b0629ec0@gmail.com>
 <3f523293-8a8d-4136-b4bc-4ad0d4a50c59@linuxfoundation.org>
 <8dc12a18-58ee-4df6-a9f3-12d8c05a0954@gmail.com>
 <878qh4ae1i.fsf@ocarina.mail-host-address-is-not-set>
Content-Language: en-US
From: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
In-Reply-To: <878qh4ae1i.fsf@ocarina.mail-host-address-is-not-set>
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

On 10/21/25 8:51 AM, Javier Martinez Canillas wrote:
> Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com> writes:
> 
> Hello Mehdi,
> 
>> On 10/20/25 9:56 PM, Shuah Khan wrote:
> 
> [...]
> 
>>>> I have a raspberrypi zero 2 wh that i'm using in combination with the
>>>> ssd1306 OLED panel via I2C to test it's rendering and it's working
>>>> properly by using modetest and seeing no regressions or warnings in
>>>> dmesg.
>>>>
>>>
>>> Send v2 with all these details and why this change is needed
>>> in the first place.
>>>
>> Okay, I will do that as soon as possible.> When and how does this
>> potential problem trigger? Is this a
>>> theoretical or does this happen in this code path and how?
>>> Next time include all of these details people understand the
>>> problem better.
>>>
>> We'll do in the next iteration.Thanks
>>
> 
> A similar patch was posted by another developer a couple of weeks
> ago and is now queued already in the drm-misc-next branch:
> 
> https://cgit.freedesktop.org/drm/drm-misc/commit/?id=940dd88c5f5bdb1f3e19873a856a677ebada63a9
> 
Hello javier,

Thanks for the heads up. I will abort working on the patch.

Best Regards,
Mehdi Ben Hadj Khelifa
