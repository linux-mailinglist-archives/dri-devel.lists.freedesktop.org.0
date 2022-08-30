Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A41325A6F2A
	for <lists+dri-devel@lfdr.de>; Tue, 30 Aug 2022 23:31:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4200510E1BA;
	Tue, 30 Aug 2022 21:31:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDCE310E1DE
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Aug 2022 21:31:27 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id k22so12709535ljg.2
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Aug 2022 14:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:from:to:cc;
 bh=ycOUS51f/+hxr26Bfki5rqNC0+Cghd136Ub/gFA0SaA=;
 b=kSqNn3A96fFfYAvZMnZM6fCkCnjNdGOAfgbjh9xsCUhPlw304ML9UOEGEq0noWgIeP
 e8mzpa9LJOTPz3mo314puee4Fei78Xd3dwfhduIl+R9me/flZOEnbstk45R5T8xMBH5j
 qj1SBot1DkuqGKcyF7RI8id8AqXjy7LQG9OWw/dcdOmtkhYzextF2jhnGSmja1hGlzqs
 8uFyhJM+XooSUzJnWBsnt2T9p8alpMeedc8qVliCE16DCl0Nea+DeCk5ybxPVZk/RlN9
 3wS6qGlyAK0i3imci6ec/k3ZZuvuHvx8V/aL+wP4XOiVLZG8emIw8ni+mIZBgQVmJWF/
 gsLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:x-gm-message-state:from:to:cc;
 bh=ycOUS51f/+hxr26Bfki5rqNC0+Cghd136Ub/gFA0SaA=;
 b=aCZQR7IFzK7sow8VH2tIE29wOSJv9C/U6wUlMC8+EbtSsCiWNPOMMrHx4vWLFqgDRy
 ek3L+mEjvjmAJCJwYmjn1WsTPoYDt6Cm/D+zImAVaADWGKEVrwalqQL9Zg0VwMh8oCha
 6BZ4P7iiQW3MrTcSOv82VfdF5LNQZFoXsppRLM/yyL6hCTwg5hr7aOtr2NoTkh+58Q3Q
 vXZ+rIR9ZUsuTFjnGjtyl7KCVT71s1IBtESnHf/cH5hMk9hASzNfJoY9qi85OLN76Om5
 ISSbTbLHxVQpYcsQnFO3YkgzOZeFZbN1lJakydpus2EThbZ8p1XZ2dZPedQ3y6HE/0ZA
 VMlA==
X-Gm-Message-State: ACgBeo2w6vMvkysU/bXuolPshUMQ7H3LOY5/rkwUteaofEjdzEJVRa6g
 Vkwm7fkevTr5qWalN7f4egk=
X-Google-Smtp-Source: AA6agR4S4WuypWhRAErxoi920Fo8fv4SJcbnBpQK5wzzMSWUXZMHydNeVYFmYA2Bqfe1pnKLfGrkYg==
X-Received: by 2002:a05:651c:507:b0:25e:73af:1661 with SMTP id
 o7-20020a05651c050700b0025e73af1661mr8063374ljp.195.1661895086153; 
 Tue, 30 Aug 2022 14:31:26 -0700 (PDT)
Received: from ?IPV6:2a02:a31a:a240:1700:d40b:b088:5bfe:3b81?
 ([2a02:a31a:a240:1700:d40b:b088:5bfe:3b81])
 by smtp.googlemail.com with ESMTPSA id
 x7-20020a056512078700b0048b0aa2f87csm1733424lfr.181.2022.08.30.14.31.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Aug 2022 14:31:25 -0700 (PDT)
From: kFYatek <kfyatek@gmail.com>
X-Google-Original-From: kFYatek <kfyatek+publicgit@gmail.com>
Message-ID: <a2ebfb0b-7b54-8059-036b-7aa1bdf4dd78@gmail.com>
Date: Tue, 30 Aug 2022 23:31:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.0
Subject: Re: [PATCH v1 00/35] drm: Analog TV Improvements
Content-Language: pl
To: Dom Cobley <dom@raspberrypi.com>
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
 <987d6114-5fcb-d668-3b0d-ad6d8723dfdb@tronnes.org>
 <20220822074800.qzyctchqn5usr55g@houat>
 <9a15b1cf-692c-1b0d-02a6-316cbd954525@gmail.com>
 <20220825155506.wqurh5r752qfufqs@houat>
 <18737c8a-78f4-5b9f-aea2-588bc65c13d9@gmail.com>
 <9d9ba040-99d7-25cb-ba10-1c132d7f7663@gmail.com>
 <CANUESCG22TrxasYoE2U0OJ7TVzNAcs_9zkuAfBQfZrEbM4h9dg@mail.gmail.com>
In-Reply-To: <CANUESCG22TrxasYoE2U0OJ7TVzNAcs_9zkuAfBQfZrEbM4h9dg@mail.gmail.com>
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
Cc: Emma Anholt <emma@anholt.net>, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Phil Elwell <phil@raspberrypi.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Samuel Holland <samuel@sholland.org>, Kevin Hilman <khilman@baylibre.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-sunxi@lists.linux.dev,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Maxime Ripard <maxime@cerno.tech>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

W dniu 26.08.2022 o 16:56, Dom Cobley pisze:
> On Fri, 26 Aug 2022 at 05:08, Mateusz Kwiatkowski <kfyatek@gmail.com> wrote:
>> - Commenting out the pm_runtime_put() / pm_runtime_get_sync() calls in vc4_vec.c
>> - Reverting this PR by Dom Cobley a.k.a. popcornmix:
>>    https://github.com/raspberrypi/linux/pull/4639
>>
>> Either of these approaches makes VEC mode switching work again. Obviously
>> neither is appropriate for a permanent solution.
> Might be worth trying the latest rpi-update firmware.
> There was a change that affects restoring PIXEL/VEC clocks after a
> power domain cycle.
> There is also a fix for a USB boot breakage.
>
> If you still have an issue that occurs in downstream pi tree but not
> upstream, then create a linux github issue.

Hi Dom,

I just tested the 868f1cf firmware and its associated kernel, and everything
works like a charm for me, both USB boot and VEC power management.

Thanks!

