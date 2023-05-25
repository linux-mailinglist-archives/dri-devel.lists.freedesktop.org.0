Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA249710FC3
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 17:39:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D50C610E181;
	Thu, 25 May 2023 15:39:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0BC010E181
 for <dri-devel@lists.freedesktop.org>; Thu, 25 May 2023 15:39:02 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3f6dfc4e01fso5551595e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 25 May 2023 08:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685029141; x=1687621141;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=e5MsIAMoJVar8Zj7rADk8UannLcUgUHv/XJnO8fuyYI=;
 b=eOLcsLkyESvvG3aMyrGh7ie/Y2rSj5chRxW+yOYyku20HOX42lFDWAikOONenaTKtQ
 98J+LRq5wIKaEY30zfpmbprkS5bXV+0h9FlxEu/FGfKfGBDeHI4FoJqMtlnELBbjZFnP
 XEQzYuaz/TTzTgt+ENbdDFuvjpM2juM3oTjQpMxF8XAmRPDtA4OLbueJhdc0b1cxt9z9
 Tdq+3Q0d2yK5d6NWiYPo8TRlp+QZKhfWTLyo8C2+Vgu5rwXp0BfYq0epdE/gPLFKOQ3H
 Gw0CuS2zQ5h/3j4NdhUD3pn+qlA0+ZtmACvc1H8dhj8YFiL0EndDHT63H58cEM21k4XK
 bd7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685029141; x=1687621141;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=e5MsIAMoJVar8Zj7rADk8UannLcUgUHv/XJnO8fuyYI=;
 b=JH0sy5cVbPXdy8qZVfpQnCcAGGi3ps3HZFvzABQdCwFk9Ssxt1hNjkYesOrdbRcYTW
 pOf+jyWIkHbsMpIwDt5Ape7CvXSfQw+ekq3uykRr9ffFdkJqgkwtKXhstt8exxVhXkSQ
 SnynIjNzoyEGcgEggBsJDpmshZIpitxRrqH0hXjAmCrEc8oQOhGNh2bsNJy2TR6b/JUj
 wFnKANs6dK8VhVbKwmFufUJ2OIr8/JB+h/phg7Ol9QCmouPROjGchv/+aE5WKV5mVPy+
 +DhVg1zWshbMlaIl7ADlPKmex87j8PnauGc9CXjqxTdv8K6DmVJWziTVnCm5MTr7Ur7k
 uP0w==
X-Gm-Message-State: AC+VfDz4Egw6qUjqNmhNjPVzyGABYouvO5rdJyMIfHWWFvxUDO0OlgM+
 ydbHyavYKpWgSY3My6GxyisXOC6GPpplu0CcVzFtmA==
X-Google-Smtp-Source: ACHHUZ7RcZZc9uwnUpx72FTFYuDnECqOlRd6TRRbs+KFyMpHIOiDmbB6Jg9nOuBTN9bsYAwBbdcnYA==
X-Received: by 2002:a05:600c:2119:b0:3f6:468:79b8 with SMTP id
 u25-20020a05600c211900b003f6046879b8mr3463927wml.22.1685029140748; 
 Thu, 25 May 2023 08:39:00 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:5cdb:105b:7481:b0e6?
 ([2a01:e0a:982:cbb0:5cdb:105b:7481:b0e6])
 by smtp.gmail.com with ESMTPSA id
 o10-20020a1c750a000000b003f4248dcfcbsm6106829wmc.30.2023.05.25.08.38.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 May 2023 08:39:00 -0700 (PDT)
Message-ID: <8c65c5c3-0415-78c0-4585-df94a532a04e@linaro.org>
Date: Thu, 25 May 2023 17:38:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH V7 0/6] drm: bridge: samsung-dsim: Support variable
 clocking
Content-Language: en-US
To: Adam Ford <aford173@gmail.com>, Fabio Estevam <festevam@gmail.com>
References: <20230518230626.404068-1-aford173@gmail.com>
 <CAOMZO5DBefFuLWi39txu2RiU5vdHVx-0T48Fua6M5Y6Fr9PGNg@mail.gmail.com>
 <CAHCN7xLqmMPtnHTVbApyYxY2tx97oRjsk_51abdDcZkOJmA=Tw@mail.gmail.com>
 <CAHCN7xJTWqf_qfaZge4GpKuuzPE_OC-Kx7hBd_hFLOchH=Ef0g@mail.gmail.com>
 <CAOMZO5Csjx17kfkxN1xMLuCg+-J0v6rjiuvaK-ZktXO50ZTuSw@mail.gmail.com>
 <CAHCN7xL2GWLTwMttCha=b9_W0nE5aimCQ08YJFrCF5vNZUOL7Q@mail.gmail.com>
Organization: Linaro Developer Services
In-Reply-To: <CAHCN7xL2GWLTwMttCha=b9_W0nE5aimCQ08YJFrCF5vNZUOL7Q@mail.gmail.com>
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
Reply-To: neil.armstrong@linaro.org
Cc: Jagan Teki <jagan@amarulasolutions.com>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org,
 aford@beaconembedded.com, Frieder Schrempf <frieder.schrempf@kontron.de>,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 24/05/2023 14:49, Adam Ford wrote:
> On Wed, May 24, 2023 at 7:45 AM Fabio Estevam <festevam@gmail.com> wrote:
>>
>> Hi Adam,
>>
>> On Tue, May 23, 2023 at 8:49 PM Adam Ford <aford173@gmail.com> wrote:
>>
>>> Inki,
>>>
>>> I haven't heard back from you on whether or not you want the bindings
>>> patch to be included with me resending the series as V7 or if you're
>>> OK with a single, stand-alone patch.
>>> Will you let me know?  I have the patch standing by waiting for
>>> instructions.  If you're not the right person to ask, please let me
>>> know who the right person is.
>>
>> Neil has also been collecting samsung-dsim patches. Maybe he can clarify.
> 
> If it matters, my preference all along was to do the bindings as a
> separate thing once the driver updates were merged into the tree.
> Since the bindings can be done in different ways, I was hoping to have
> a separate discussion on the right way to do the bindings. If they
> need to be part of the series, I can do that.

If you don't introduce compatibles, no need to send bindings, it can
be send separately.

Can I apply this serie and 20230503163313.2640898-2-frieder@fris.de ? seems all has been reviewed.

Neil

> 
> adam

