Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC23465505C
	for <lists+dri-devel@lfdr.de>; Fri, 23 Dec 2022 13:28:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3771610E18F;
	Fri, 23 Dec 2022 12:28:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C27110E18F
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Dec 2022 12:27:57 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id f20so4861012lja.4
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Dec 2022 04:27:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Xj0h1UvXLeR/eex6PTKB9DZNs+9G5xyM3xWNa8K5ugM=;
 b=LVIdk6TrKKlSvZo8iVD3a0bA9d19SbP3oHNkZjsLc3tBjzxgiKVndhqSUyNL1pVpNr
 Myo+oiz4zHQ3LHKK4ZXe1Qwg17chAhulJFM7s1mmk53GmGwGmeDjggDYoImc4bkCT3fj
 EpWqUhY3WimsAVy5QElfpe076EjHgNONFyMFkLjDp68q6HGn7ihadES3ZSLEf+C8QjUe
 zWtU3icpAPmhhyn0KtlqNmsxoUY56e/KbYvMN7nA27dns7Evb92WNnXnzN3UvrkGbCOG
 czJC8GIpvS7/0PaNy6XRgrre+u3mcq3AvNeejqGtcO6q+Bu1iwACcDG1bN6f/kr6Pqp3
 ONhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Xj0h1UvXLeR/eex6PTKB9DZNs+9G5xyM3xWNa8K5ugM=;
 b=dbIUYbLTntmtGUwnHNxdAM0FlZhTZaGvWVtFtxIpnmkY5sepnkjBYzSjY7MeCiQ9/B
 rNxQ55NOMWKjM0FIGJBiIDmCxhcRdKIKI9zTNk0xTZPjCa9jwH4R12P9WLvJEDj3pZZ0
 kTLPuIuRYD0d/LSKSxl4kLPWnORBBB5IotHmH9kuD730YQgbc09Oap1UX5rg2Oikm4DB
 mglvlKHW/yrQLGsc+PEn8rcsj9GY5b8EzpRlV58qGlzKvudvlTa29+DIsg2H0yPUplhx
 9vI/eeHkAJMh3MNE5V+NIylravUbRXX7lhs2pZXUTkXgVBCwquFxnEvj808FduA743Rz
 ky6g==
X-Gm-Message-State: AFqh2konHT9uDvEyFugn6/h66sWmWgyBzcxozB0Zxy6enqwvLHSa4Vvu
 gCqGLqlJE/Ug5VwJ4kWBDs8=
X-Google-Smtp-Source: AMrXdXvduFyoM6swUMGZRPtFEvufU7s44gxXlGnryOHSKInx0KTADxvAW9sGs9VUP+lWcbdCw6ZX4Q==
X-Received: by 2002:a05:651c:48e:b0:277:1888:cfb3 with SMTP id
 s14-20020a05651c048e00b002771888cfb3mr2368918ljc.16.1671798476039; 
 Fri, 23 Dec 2022 04:27:56 -0800 (PST)
Received: from [192.168.2.145] ([109.252.113.89])
 by smtp.googlemail.com with ESMTPSA id
 f3-20020a2eb5a3000000b00279e0b8bae7sm391459ljn.65.2022.12.23.04.27.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Dec 2022 04:27:55 -0800 (PST)
Message-ID: <67a5a826-5ba5-340b-cd80-2995e88d1790@gmail.com>
Date: Fri, 23 Dec 2022 15:27:54 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 21/21] staging: media: tegra-video: add tegra20 variant
Content-Language: en-US
From: Dmitry Osipenko <digetx@gmail.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
References: <20221128152336.133953-1-luca.ceresoli@bootlin.com>
 <20221128152336.133953-22-luca.ceresoli@bootlin.com>
 <30e6b040-aa82-f6a3-1ff6-baa2c0dcb0e2@gmail.com>
 <20221222100341.5882c19c@booty>
 <a64e2aea-2e06-a72e-5ced-a86de4458c61@gmail.com>
In-Reply-To: <a64e2aea-2e06-a72e-5ced-a86de4458c61@gmail.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: devicetree@vger.kernel.org, Richard Leitner <richard.leitner@skidata.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>, linux-tegra@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

23.12.2022 15:15, Dmitry Osipenko пишет:
> 22.12.2022 12:03, Luca Ceresoli пишет:
>> Hello Dmitry,
>>
>> On Wed, 21 Dec 2022 00:40:20 +0300
>> Dmitry Osipenko <digetx@gmail.com> wrote:
>>
>>> 28.11.2022 18:23, Luca Ceresoli пишет:
>>>> +static int tegra20_channel_capture_frame(struct tegra_vi_channel *chan,
>>>> +					 struct tegra_channel_buffer *buf)
>>>> +{
>>>> +	u32 value;
>>>> +	int err;
>>>> +
>>>> +	chan->next_out_sp_idx++;
>>>> +
>>>> +	tegra20_channel_vi_buffer_setup(chan, buf);
>>>> +
>>>> +	tegra20_vi_write(chan, TEGRA_VI_CAMERA_CONTROL, VI_CAMERA_CONTROL_VIP_ENABLE);
>>>> +
>>>> +	/* Wait for syncpt counter to reach frame start event threshold */
>>>> +	err = host1x_syncpt_wait(chan->out_sp, chan->next_out_sp_idx,
>>>> +				 TEGRA_VI_SYNCPT_WAIT_TIMEOUT, &value);  
>>>
>>> You're not using the "value" variable, it should be NULL.
>>
>> Ah, sure, good catch.
>>
>>> The "chan->out_sp" looks redundant, it duplicates the chan->mw_ack_sp.
>>
>> I agree it is redundant and can be improved.
>>
>>> AFAICS from the doc, T20 has two VI channels, and thus, two mw_ack_sp,
>>> like T210.
>>
>> I'm confused by this. In the current driver, each VI channel has an
>> array of 2 mw_ack_sp, the second of which is only used the ganged
>> CSI ports. I have no docs mentioning ganged ports so I don't know
>> exactly how they work and whether T20 might need more than 1 syncpt per
>> channel or not for CSI. Definitely when using VIP only one such syncpt
>> per each VI (or per each VIP, as per your reply to patch 1) is needed.
>>
>> Bottom line: I think I can simply remove the out_sp and in the VIP code
>> always use chan->mw_ack_sp[0], and document that it's what is called OUT
>> in VIP terms.
>>
>> Does this plan seem good?
> 
> Older Tegra VI doesn't have ganged ports, but two memory/CSI channels.
> It feels to me that Tegra VI can capture both channels independently,
> though downstream driver stack used only one of the channels, IIRC.
> 
> There is a VI header file from nvddk in downstream kernel, which is
> pretty much the doc by itself.
> 
> https://nv-tegra.nvidia.com/r/gitweb?p=linux-2.6.git;a=blob;f=arch/arm/mach-tegra/include/ap20/arvi.h;h=6ce52e8e9a7213e33466d34a71cf3af2b6944b8a;

Although, after a bit closer look, I see that there is only one port
selector there. Hence there only one port can be active at a time.
