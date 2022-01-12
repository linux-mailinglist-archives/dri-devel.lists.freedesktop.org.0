Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69DC948C5A9
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jan 2022 15:13:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BBE210F16E;
	Wed, 12 Jan 2022 14:13:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1BA610E927
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jan 2022 14:13:07 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id x6so8621151lfa.5
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jan 2022 06:13:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FZO7GH1VAP3gSHj6yutdiODbC5oJX0jySmLnQ+aEZjQ=;
 b=S2lAPi1WJQbC/HEbdwHo2alb0WAeNMwyaDCAGarVnoSS5VbXmaYWRaWxrj0uZRQym7
 WdaldxxcSmISYa/iiXZBt/xCXueESue0xrZafJxUG4F0h7YkK11dO5J1GK8jznyJIgA5
 lMUbY6uCQiBL1p0sZUSqdjVUFEx3D2XOlvlzAE8uqMmaK5Q1NyT9LiKtX2TYh/HHLhdj
 Okv9m+HMoxtHuRJ+MlOicPXiG/5hDrwkJGQ3CNUs2rILI6pmZVUfP69uESnIoUlmqKSq
 AJsER2ZAL3DYZ69rLSpg0cj+uzWjzYiT/T2I+XF5Q5IhTjRrlJnxsyDymywu9iDZ7iov
 UyXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FZO7GH1VAP3gSHj6yutdiODbC5oJX0jySmLnQ+aEZjQ=;
 b=2M3hpS+LvDd+VwNZIWFbVYFSiFXGl4iPGLzroGEE5yeC9llL1rEQ5djq6vMJ+ldcIe
 81sQ8g55z+s8q6ipse+oEhglt0ISxODByHI61BtAqrJcNsdTwhMJWGxfykXXAZ1Gcg7j
 hjdORpRK3EoraFKjeW5+bzM0AySGvU3Hl29bSkfzY0HYatPLkcxEX2erBV/Cqe7EL0Om
 2h42MleroGwLBiFckoEJqYOlPTnhhMvQ5lkFOudzdOa2HGTeD9thSbnOsrYe6S7gY7KJ
 4oM7ku/27fRkFeI4NJSRsEjjaptQHESoIfKGr52oOovC/qxENBJj4U70Ai7/zTdNMFEX
 adFw==
X-Gm-Message-State: AOAM531Ug/bw2vQn2HHK5Zss4Q+Mz01QrI7khNFkZ47lrfeOMOL7BtHs
 frM5f3mKkGrDCSOAgEPaUYo=
X-Google-Smtp-Source: ABdhPJy4lr99ztyBa2kSA3shxOrQgi4BCovoR/p0JF4BQpd8xxVBVzq3w2HMuEnQ81LnX0RG0k3PxA==
X-Received: by 2002:a05:6512:159d:: with SMTP id
 bp29mr3863011lfb.645.1641996785910; 
 Wed, 12 Jan 2022 06:13:05 -0800 (PST)
Received: from [192.168.2.145] (94-29-62-108.dynamic.spd-mgts.ru.
 [94.29.62.108])
 by smtp.googlemail.com with ESMTPSA id m1sm761824lfh.212.2022.01.12.06.13.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jan 2022 06:13:05 -0800 (PST)
Subject: Re: [PATCH v2 0/3] clk: Implement a clock request API
To: Maxime Ripard <maxime@cerno.tech>
References: <20210914093515.260031-1-maxime@cerno.tech>
 <a5400ae3-f181-91fc-bc35-db989584c70b@gmail.com>
 <20220112135147.dbkmsnlqyipq7urq@houat>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <d5dbdd71-d5db-53d1-176a-812c908f1abf@gmail.com>
Date: Wed, 12 Jan 2022 17:13:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220112135147.dbkmsnlqyipq7urq@houat>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: Emma Anholt <emma@anholt.net>, Dom Cobley <dom@raspberrypi.com>,
 Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Stephen Boyd <sboyd@kernel.org>, Mike Turquette <mturquette@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Phil Elwell <phil@raspberrypi.com>, David Airlie <airlied@linux.ie>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, linux-clk@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

12.01.2022 16:51, Maxime Ripard пишет:
> Hi Dmitry,
> 
> On Wed, Jan 12, 2022 at 04:28:41PM +0300, Dmitry Osipenko wrote:
>> 14.09.2021 12:35, Maxime Ripard пишет:
>>> Hi,
>>>
>>> This is a follow-up of the discussion here:
>>> https://lore.kernel.org/linux-clk/20210319150355.xzw7ikwdaga2dwhv@gilmour/
>>>
>>> This implements a mechanism to raise and lower clock rates based on consumer
>>> workloads, with an example of such an implementation for the RaspberryPi4 HDMI
>>> controller.
>>>
>>> There's a couple of things worth discussing:
>>>
>>>   - The name is in conflict with clk_request_rate, and even though it feels
>>>     like the right name to me, we should probably avoid any confusion
>>>
>>>   - The code so far implements a policy of always going for the lowest rate
>>>     possible. While we don't have an use-case for something else, this should
>>>     maybe be made more flexible?
>>
>> Hello Maxime,
>>
>> On NVIDIA Tegra we use interconnect framework for converting of
>> workload-based memory bandwidth requirement to the memory clock rate
>> [1]. All Tegra SoCs have two display controllers and other memory
>> clients, ICC takes care of summing and updating memory bandwidth for us,
>> which in the end results in a freq change of the shared memory controller.
>>
>> [1] https://git.kernel.org/linus/04d5d5df9
>>
>> Not so long time ago me and Thierry Reding were looking at yours v1 and
>> back then Thierry suggested that the same ICC approach might work for
>> yours case. I'm now looking at the v2 and yours discussion with Stephen
>> Boyd, and it appears that ICC is indeed what you really need. Have you
>> considered to use ICC?
> 
> The goals seem to be similar indeed, but most of these clocks feed some
> internal state machine in those devices and are not related to the
> memory bandwidth at all. So there's no real interconnect to model there :/

If you could convert resolution/pclk to BW and BW to the clock rates,
then it should be possible to model ICC. BW doesn't necessarily need to
be "memory" bandwidth, bandwidth is abstract value expressed in kbytes/sec.

The state machine will be ICC provider then, although you'll need to
model that machine as a separate device somehow. For example, on Tegra
we needed to specify clocks as separate devices to model GENPD [2][3].

[2]
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=b1bc04a2ac5

[3]
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/arch/arm/boot/dts/tegra30.dtsi?h=next-20220112#n394
