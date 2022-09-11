Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E93635B4C1B
	for <lists+dri-devel@lfdr.de>; Sun, 11 Sep 2022 06:51:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C587710E3B4;
	Sun, 11 Sep 2022 04:51:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C56210E3B4;
 Sun, 11 Sep 2022 04:51:22 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id bq23so9610819lfb.7;
 Sat, 10 Sep 2022 21:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:from:to:cc:subject:date;
 bh=XIY+68P3U22mQGsLLoSSFcg2zg1iq6nyQPz8fLaQ0oE=;
 b=KMFPIZg72ybP/U7EjC2ScfiAUimjnENQw0GEyTYJzmkUU52crQ6OHlLskmExR7NsSs
 eMY9SN0NOGAqyKnlGcCLLgdOs6Zjmj+OE9PviAhQdducKwbYV9wzHgn/rbq+7bGUx559
 NodqqgwDI1U8LSxxaSKvzGyevZmw4d85G43k+/QUsDCmQzdS/01OO6nGrrgv4o8ywLAS
 oZGLMbfaTaDk8ekJkgsUnobyUQLa71UK+15ACp1hxK9r8APUX/VCok+93Z33A1EZsq93
 n9631zSD2uMvomFLsW6aMIbP145LN5a+TL/DXeuW565iBiQ7pgoEkG9EPtVOin1SV0ul
 8gvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:x-gm-message-state:from:to:cc:subject:date;
 bh=XIY+68P3U22mQGsLLoSSFcg2zg1iq6nyQPz8fLaQ0oE=;
 b=OuuBk9NBZyuZJXyr6U2KQw87d7jI1EfvSBCJyKePEFbQLwlLLl4hpnIxceZBYkfyFe
 xp3WpSVMBb9bnKhbJ7eNSjR4PVlpRNKqbo1mLfodnw4S+dui1bZNa65QS7cWMq7eYYoE
 V9IOkwTwKEVTiK3ANfHBk+RLr9USqa4BQfNNBv/wJeL1YtX0iLZaVMUs43lfQCkq29fQ
 B9gZOG1KCCW65y/AdHDFp4fiAL3/RZqVCZdcOAeGloBu8JGYodaZ23OQoTW/W2zD8VTD
 83mem5fhxQhskyt57r65QhrRw3DC0qe+VxwpgS/dAEFgqqJJXi1riYQUf8dsi1cWqgS8
 +u4Q==
X-Gm-Message-State: ACgBeo1ggtkoLvu2OiunmkLZjwaMfGTpeEgRZmWJNgmypGjOI716b0QQ
 Cb8/R9DuWNOBg+x+MQ4rfgs=
X-Google-Smtp-Source: AA6agR4HaTIFXR95Cv35IjLjzgwZoQn9BgzbhDxW7IP1eMizctu6PfCBylwC524DiMtSVr18MWoAFw==
X-Received: by 2002:a05:6512:281a:b0:49a:4e46:34ff with SMTP id
 cf26-20020a056512281a00b0049a4e4634ffmr411587lfb.72.1662871880581; 
 Sat, 10 Sep 2022 21:51:20 -0700 (PDT)
Received: from ?IPV6:2a02:a31a:a240:1700:e929:c054:a46d:3844?
 ([2a02:a31a:a240:1700:e929:c054:a46d:3844])
 by smtp.googlemail.com with ESMTPSA id
 7-20020a2eb947000000b00268cfcf841asm46332ljs.56.2022.09.10.21.51.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 10 Sep 2022 21:51:20 -0700 (PDT)
From: Mateusz Kwiatkowski <kfyatek@gmail.com>
X-Google-Original-From: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
Message-ID: <c1d7ac5a-90bf-d6ea-ec77-ec7662482d2e@gmail.com>
Date: Sun, 11 Sep 2022 06:51:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.2
Subject: Re: [PATCH v2 10/41] drm/modes: Add a function to generate analog
 display modes
Content-Language: pl
To: Maxime Ripard <maxime@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech>
 <20220728-rpi-analog-tv-properties-v2-10-459522d653a7@cerno.tech>
 <242d272b-5b79-986c-9aaf-64e62f6b37ff@gmail.com>
 <20220905133755.gcmmntg3wnecyqjq@houat>
 <10ce686a-d7c8-9ce4-3979-735ad8eab3b5@gmail.com>
 <20220907143421.4iopqwhp3yfircsh@houat>
 <dc1d9499-d4d5-1032-f39f-d4ac4cbb8412@gmail.com>
 <20220909135444.5oi6oh6nqwuke3jl@houat>
 <79ab3fef-fdaa-e191-d839-4af88191e672@gmail.com>
In-Reply-To: <79ab3fef-fdaa-e191-d839-4af88191e672@gmail.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: Karol Herbst <kherbst@redhat.com>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Phil Elwell <phil@raspberrypi.com>, Emma Anholt <emma@anholt.net>,
 Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Ben Skeggs <bskeggs@redhat.com>,
 linux-sunxi@lists.linux.dev, Thomas Zimmermann <tzimmermann@suse.de>,
 intel-gfx@lists.freedesktop.org, Hans de Goede <hdegoede@redhat.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, linux-arm-kernel@lists.infradead.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> Yes, lines 0-23 is the entire blanking area. And the "back porch" in this
> context is everything from the start of the sync pulse to the start of active
> video. It's not just the equalizing pulses.

I meant "from the end of the sync pulse", obviously. Sorry about the slipup.
