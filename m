Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3ADD7157D2
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 10:01:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C015310E36E;
	Tue, 30 May 2023 08:01:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C07210E36E
 for <dri-devel@lists.freedesktop.org>; Tue, 30 May 2023 08:01:51 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3f6094cb2d2so42995265e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 30 May 2023 01:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685433710; x=1688025710;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=j1K+SN90yu6GVNFzY/ynyoEBrXtMpQCEy39+3j7Gsoo=;
 b=j6dw88xQf9k7F1V+LU60cf/re3KpD6D+fW+DuVMLwRgTmhtgvGBkxbQlIeTmZKtmmr
 zCM3GqaerO/6z26xHJaQYLx+BGboERMLqQD6jCUU/eCovKr0uMeaComrQU5hNjbXthEg
 ZmN+iasm1ETNVdligfCV3KxuBLgHxcv/DfDaSD0Iy2SCptARZQGpZGo3myQ8ifjWCREO
 U5CrEpbdpYipdluUtg/bLcVvJy7CLTIwnt7KGo6u8uju/z/WM5lUfbRLeE7M0ryQPM5N
 +LsYGB8b/r2Grt/yuYFDDvwqXLH0CadCh5FxvSm5GqDLKJQ+oiYzzMO1x0VzuhiM8417
 VpCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685433710; x=1688025710;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=j1K+SN90yu6GVNFzY/ynyoEBrXtMpQCEy39+3j7Gsoo=;
 b=HD/Z4WnW7wkzmi5ex61Yv4ge3dQHBHayaUbN3+w+IdoNLfj3tCQfCcjLETGXOcgMPX
 KZUQd6Uhc5BfECb7nd1NHDsBCKGJJQFUX7ZasHK4CKN/k/ONAn6GyairLXofncmKlya7
 TluitLZAylQFsrSST2KBF4F90Vw/ZyUnZij/6Zt08wdbvCa2cOsV4pLrnrCrqZAPNnEs
 nHxgQS9pinZLIF2G0oLDA8HFn1MVzgG7hlEcq5B5bDM9ytLyrqqIJQFNMuEtN6Zhea41
 ohXLt4PgN/0Ka4oGm2jSBXk5dXlWZr4aO9gUfTZxDuWvX4GXvzndfnx2v2hu0H6yd68e
 mKxA==
X-Gm-Message-State: AC+VfDykTYdfKqCdInr/62pNcau3Kq/uZDOKmA9hjRFegZXy6/PhqIMM
 2k3LajQVtZ2JhLQRUR32kfPM7Q==
X-Google-Smtp-Source: ACHHUZ5M8En45/6tBUvjo3i971gc63XBq54RnLe8ykSVS26PwEsEHPaJ1bHuRb+HD8LOEkdWqYHFFg==
X-Received: by 2002:a7b:cbc8:0:b0:3f6:1a9:b9db with SMTP id
 n8-20020a7bcbc8000000b003f601a9b9dbmr820957wmi.21.1685433709934; 
 Tue, 30 May 2023 01:01:49 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:4294:2221:d2df:9e87?
 ([2a01:e0a:982:cbb0:4294:2221:d2df:9e87])
 by smtp.gmail.com with ESMTPSA id
 p23-20020a05600c205700b003f42314832fsm16526895wmg.18.2023.05.30.01.01.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 May 2023 01:01:49 -0700 (PDT)
Message-ID: <ba2c5887-a046-c5c6-4bc0-98549003c244@linaro.org>
Date: Tue, 30 May 2023 10:01:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH V8 0/7] drm: bridge: samsung-dsim: Support variable
 clocking
Content-Language: en-US
To: Adam Ford <aford173@gmail.com>
References: <20230526030559.326566-1-aford173@gmail.com>
 <168508573345.1449766.11809947722851001124.b4-ty@linaro.org>
 <cd3c7cca-9edd-ca16-8376-e3ba924eaa30@linaro.org>
 <CAHCN7xK8R72eTTenp4UeuOKT7NojKDC9_ReWa0HLexzqo9E6UQ@mail.gmail.com>
Organization: Linaro Developer Services
In-Reply-To: <CAHCN7xK8R72eTTenp4UeuOKT7NojKDC9_ReWa0HLexzqo9E6UQ@mail.gmail.com>
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
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Robert Foss <rfoss@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, aford@beaconembedded.com,
 dri-devel@lists.freedesktop.org,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Rob Herring <robh+dt@kernel.org>, Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 26/05/2023 16:04, Adam Ford wrote:
> On Fri, May 26, 2023 at 2:24 AM Neil Armstrong
> <neil.armstrong@linaro.org> wrote:
>>
>> On 26/05/2023 09:22, Neil Armstrong wrote:
>>> Hi,
>>>
>>> On Thu, 25 May 2023 22:05:52 -0500, Adam Ford wrote:
>>>> This series fixes the blanking pack size and the PMS calculation.  It then
>>>> adds support to allows the DSIM to dynamically DPHY clocks, and support
>>>> non-burst mode while allowing the removal of the hard-coded clock values
>>>> for the PLL for imx8m mini/nano/plus, and it allows the removal of the
>>>> burst-clock device tree entry when burst-mode isn't supported by connected
>>>> devices like an HDMI brige.  In that event, the HS clock is set to the
>>>> value requested by the bridge chip.
>>>>
>>>> [...]
>>>
>>> Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)
>>>
>>> [1/7] drm: bridge: samsung-dsim: fix blanking packet size calculation
>>>         https://cgit.freedesktop.org/drm/drm-misc/commit/?id=a617b33f7e513f25becf843bc97f8f1658c16337
>>> [2/7] drm: bridge: samsung-dsim: Fix PMS Calculator on imx8m[mnp]
>>>         https://cgit.freedesktop.org/drm/drm-misc/commit/?id=54f1a83c72250b182fa7722b0c5f6eb5e769598d
>>> [3/7] drm: bridge: samsung-dsim: Fetch pll-clock-frequency automatically
>>>         https://cgit.freedesktop.org/drm/drm-misc/commit/?id=33d8d14c83bf67aa0d262961a6fda9c40f3c1052
>>> [4/7] drm: bridge: samsung-dsim: Select GENERIC_PHY_MIPI_DPHY
>>>         https://cgit.freedesktop.org/drm/drm-misc/commit/?id=171b3b1e0f8b8c894f2388e1cf765a56f831ee5e
>>> [5/7] drm: bridge: samsung-dsim: Dynamically configure DPHY timing
>>>         https://cgit.freedesktop.org/drm/drm-misc/commit/?id=89691775f5735fca9dc40e119edcbb52a25b9612
>>> [6/7] drm: bridge: samsung-dsim: Support non-burst mode
>>>         https://cgit.freedesktop.org/drm/drm-misc/commit/?id=bb0e13b9e223b218c9f242f8d340a332b4381042
>>> [7/7] dt-bindings: bridge: samsung-dsim: Make some flags optional
>>>         https://cgit.freedesktop.org/drm/drm-misc/commit/?id=cfaf76d349837f695c8aa6d7077847fec4231fe5
>>>
>>
>> OK I made a bad manipulation, I applied patch 7 without review... I'll send a revert patch.
> 
> Sorry, I didn't mean to complicate things by adding the binding patch.
> I added a note in the cover letter to indicate it, but I also
> recognize that it contradicted my earlier email.

No problem :-)

Neil

> 
> adam
>>
>> Neil

