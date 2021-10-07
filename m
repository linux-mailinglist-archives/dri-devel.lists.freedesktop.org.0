Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8EE4250D7
	for <lists+dri-devel@lfdr.de>; Thu,  7 Oct 2021 12:16:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0B8A6F3C0;
	Thu,  7 Oct 2021 10:16:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C57796F3C0;
 Thu,  7 Oct 2021 10:16:31 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id r10so17439440wra.12;
 Thu, 07 Oct 2021 03:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1gYAE2vWPz0MbraCtd8aQQgWxPLZqacAtSV7iYxbEtQ=;
 b=EbdSYwqx3mHUc7kNlSYIJXdd6OTrPllHE9Wd8JhKhMNbu0hEFfGYAtI3UQ+Pa8yoxe
 KC6ZA+SRfrhiNSnvdR1W5txmyvjKgQvkbk1BLqqkTs+K//aTJl1BC53AzkNZPhHbj4Cj
 VWgCh+lDEedu1+BOMFt+UONsQg1FM8vjKTnvIKmXXQWDTgoWbkxMB4jvRxpk6o171WAf
 7yV0zS2NI9Dh92/WE2viXUmxxoDadKN91gTfU54gtNyqhDdPq0E8yiM+a0umZ7edr7Md
 lYfQC/RDsM6EOXB2s2fEJXkO/JIdRMVGLNaSrQs4xC7/Oq7vpju5VBSAX8hs1jbHr6pe
 U5RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1gYAE2vWPz0MbraCtd8aQQgWxPLZqacAtSV7iYxbEtQ=;
 b=7BuDoFPgmoSodj9kdt+ZihDo1SioDxGX7ewl/9KN+ShmCfeWauHHz71xbsWEC9Rlu3
 Flv06KvahBApTjiXkKrsR9vXmIzQjFAMm8M5JcXLFfH1Nokne4b/l0IDu3k0+NZRQ2Km
 L3wpDmTDUHj32qsuQflnDLonFRzXIFj7yO4heO9vXTLFW6dEJFn6wEQEbTz8wBi5WSxH
 PhmcgaTV9umTLTz/QGk1gZ884/QzehZxNkJ8+tCgLQdrwjniBC9eomNMo+gsntrr8i+P
 970xWTecutfOQi6h4UH31jt8jY7fX8dzLYDyUuJhFekUqw1V/Vs7WLhgaJsd9hSM5RS/
 Y0Bg==
X-Gm-Message-State: AOAM530Bt3tGEmsA2apK0Lt5an7KE4XCE/IFR/4hi5dciH1O4QYUuJ9Q
 tH1JbsTRFAVJdx9JG/QL5OQ=
X-Google-Smtp-Source: ABdhPJyO84sEJgEs46P+YCpyCH8r2D08a2F9o/3ytykleY8cSd00FUEVVOpPAaOOAp7N04KX5vUOtQ==
X-Received: by 2002:a1c:f302:: with SMTP id q2mr3697177wmq.56.1633601790274;
 Thu, 07 Oct 2021 03:16:30 -0700 (PDT)
Received: from [192.168.0.14]
 (095160158079.dynamic-2-waw-k-4-2-0.vectranet.pl. [95.160.158.79])
 by smtp.gmail.com with ESMTPSA id e8sm9576415wrg.48.2021.10.07.03.16.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Oct 2021 03:16:29 -0700 (PDT)
Subject: Re: [PATCH v2 00/34] component: Make into an aggregate bus
To: Stephen Boyd <swboyd@chromium.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Arnd Bergmann <arnd@arndb.de>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Chen Feng <puck.chen@hisilicon.com>, Chen-Yu Tsai <wens@csie.org>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Emma Anholt <emma@anholt.net>,
 =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>,
 Inki Dae <inki.dae@samsung.com>, James Qian Wang <james.qian.wang@arm.com>,
 Jaroslav Kysela <perex@perex.cz>, Joerg Roedel <joro@8bytes.org>,
 John Stultz <john.stultz@linaro.org>,
 Joonyoung Shim <jy0922.shim@samsung.com>, Jyri Sarha <jyri.sarha@iki.fi>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-fbdev@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-pm@vger.kernel.org, Liviu Dudau <liviu.dudau@arm.com>,
 Lucas Stach <l.stach@pengutronix.de>, Mark Brown <broonie@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Neil Armstrong
 <narmstrong@baylibre.com>, Paul Cercueil <paul@crapouillou.net>,
 Philipp Zabel <p.zabel@pengutronix.de>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Russell King <rmk+kernel@arm.linux.org.uk>, Sandy Huang
 <hjc@rock-chips.com>, Saravana Kannan <saravanak@google.com>,
 Sebastian Reichel <sre@kernel.org>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Takashi Iwai <tiwai@suse.com>, Tian Tao <tiantao6@hisilicon.com>,
 Tomas Winkler <tomas.winkler@intel.com>, Tomi Valkeinen <tomba@kernel.org>,
 Will Deacon <will@kernel.org>, Xinliang Liu <xinliang.liu@linaro.org>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>, Yong Wu <yong.wu@mediatek.com>
References: <20211006193819.2654854-1-swboyd@chromium.org>
From: Andrzej Hajda <andrzej.hajda@gmail.com>
Message-ID: <5d3f4343-da38-04b4-fdb9-cb2dd4983db2@gmail.com>
Date: Thu, 7 Oct 2021 12:16:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211006193819.2654854-1-swboyd@chromium.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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

Hi Stephen,

On 06.10.2021 21:37, Stephen Boyd wrote:
> This series is from discussion we had on reordering the device lists for
> drm shutdown paths[1]. I've introduced an 'aggregate' bus that we put
> the aggregate device onto and then we probe the aggregate device once
> all the components are probed and call component_add(). The probe/remove
> hooks are where the bind/unbind calls go, and then a shutdown hook is
> added that can be used to shutdown the drm display pipeline at the right
> time.
> 
> This works for me on my sc7180 board. I no longer get a warning from i2c
> at shutdown that we're trying to make an i2c transaction after the i2c
> bus has been shutdown. There's more work to do on the msm drm driver to
> extract component device resources like clks, regulators, etc. out of
> the component bind function into the driver probe but I wanted to move
> everything over now in other component drivers before tackling that
> problem.


As I understand you have DSI host with i2c-controlled DSI bridge. And 
there is an issue that bridge is shutdown before msmdrm. Your solution 
is to 'adjust' device order on pm list.
I had similar issue and solved it locally by adding notification from 
DSI bridge to DSI host that is has to be removed: mipi_dsi_detach, this 
notification escalates in DSI host to component_del and this allow to 
react properly.

Advantages:
- it is local (only involves DSI host and DSI device),
- it does not depend on PM internals,
- it can be used in other scenarios as well - unbinding DSI device driver

Disadvantage:
- It is DSI specific (but this is your case), I have advertised some 
time ago more general approach [1][2].

[1]: https://static.sched.com/hosted_files/osseu18/0f/deferred_problem.pdf
[2]: https://lwn.net/Articles/625454/


Regards
Andrzej
