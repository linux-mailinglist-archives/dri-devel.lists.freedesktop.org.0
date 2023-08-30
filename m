Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C42B478E0D4
	for <lists+dri-devel@lfdr.de>; Wed, 30 Aug 2023 22:41:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C8D710E5CE;
	Wed, 30 Aug 2023 20:41:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58A0910E5CE
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Aug 2023 20:41:07 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-52bd9ddb741so81049a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Aug 2023 13:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693428065; x=1694032865; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Azrcvh3Xm9QAv3KS+sbhE3nUaOx631s9JxOEhZkx68I=;
 b=ZN62jgCN/NlgfKgl7qH3mAhsmp2DYd4W/IzkrT2tN2BD2isKGj2nn+znglM0yT55cj
 u68BQAvA3lPi0rTlPhHUSl3e9HorcdAUsiRcUkz+rZm16X/JSgLQY6e83oFuldI5JDB9
 Y1CjUwJ8rmcyP/0dZcbgBc8CcgZsRI4/cc4PX4pOT/Py6+AMW08JRintGnSevRckrDoU
 OXaHhJWQaMeGAEI7ul9Y8oP1X/OeFj20vT82I5vm6dTwoWYVyT6wRsQW45/Fs57LWWiY
 AH8kfH0Y8QDeNb+XAopEHOtnP1f4Ukq0iJaBboEViNyD+e8zoHvydMJabYpVSnCpKXkf
 UEsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693428065; x=1694032865;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Azrcvh3Xm9QAv3KS+sbhE3nUaOx631s9JxOEhZkx68I=;
 b=XtdRFFnSVTOWOzr/Bdmyl+PHgHVjpTt+vQemgXcUJqt/nP9BsuQgvfyWQ7aUbubz5D
 b8+aRnW71Bkg0K8i2fsfNlDhOOK+WEyodVLWjCRV8dqaFYk+eyE6U6skRR3G5elukhzu
 I6jP9qeXfYM9YAxprWMDlk+llahUJ9M/fR/OA0I5+7/Oaaw/YxIv1bhr0ajs6/ubPcIO
 16NoWRJAJFaz5heSEDd+9UOCxxarGx21oddyyiupiPmRAW9jtV9fgV/CPFroqoldu/34
 J1aI7OVFFk4S+GJjwSFg6S7GOO/OQ3CGcFWCH9EEOYnNuekwyogi9WKNQD46qKPdbW5q
 uhdQ==
X-Gm-Message-State: AOJu0YwjclOSb4JpZZk5PxcZlRrhDwC293c4KTMrHeR7rApIpQTWnMWc
 aBMLDZnNJqQXQIWQa4To+FM=
X-Google-Smtp-Source: AGHT+IEHUORUn3WLSciL0S67Vpjv08aQSyPEMwLH9cCFScAo9T0V0zqytkD+TwxL/5lwnVRUg1fjFQ==
X-Received: by 2002:a17:907:2cd4:b0:9a2:232f:6f85 with SMTP id
 hg20-20020a1709072cd400b009a2232f6f85mr2670691ejc.52.1693428065320; 
 Wed, 30 Aug 2023 13:41:05 -0700 (PDT)
Received: from ?IPV6:2a02:908:8b3:1840:e50d:f71d:495d:402d?
 ([2a02:908:8b3:1840:e50d:f71d:495d:402d])
 by smtp.gmail.com with ESMTPSA id
 i27-20020a1709063c5b00b009928b4e3b9fsm7558138ejg.114.2023.08.30.13.41.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Aug 2023 13:41:04 -0700 (PDT)
Message-ID: <b5f84da6-8826-69d3-6617-6d2593a54897@gmail.com>
Date: Wed, 30 Aug 2023 22:41:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Maxim Schwalm <maxim.schwalm@gmail.com>
Subject: Re: [PATCH v3 00/12] drm/bridge: tc358768: Fixes and timings
 improvements
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
References: <20230822-tc358768-v3-0-c82405dac0c1@ideasonboard.com>
 <6ecafdd1-e60a-afe6-ea2f-adab168d22fe@ideasonboard.com>
Content-Language: en-US
In-Reply-To: <6ecafdd1-e60a-afe6-ea2f-adab168d22fe@ideasonboard.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Aradhya Bhatia <a-bhatia1@ti.com>, Jonas Karlman <jonas@kwiboo.se>,
 =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Thierry Reding <treding@nvidia.com>,
 Francesco Dolcini <francesco@dolcini.it>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi,

On 29.08.23 08:27, Tomi Valkeinen wrote:
> Hi Maxim,
> 
> On 22/08/2023 19:19, Tomi Valkeinen wrote:
>> This series contains various fixes and cleanups for TC358768. The target
>> of this work is to get TC358768 working on Toradex's AM62 based board,
>> which has the following display pipeline:
>>
>> AM62 DPI -> TC358768 -> LT8912B -> HDMI connector
>>
>> The main thing the series does is to improve the DSI HSW, HFP and VSDly
>> calculations.
>>
>>   Tomi
> 
> Does this version work for you? Can I add your tested-by?

Yes, this series does work fine on the Asus TF700T, so:

Tested-by: Maxim Schwalm <maxim.schwalm@gmail.com> # Asus TF700T

Aside from the TF700T, I have a different kind of tablet, which also has
a TC358768/TC358778 bridge, but it's not running a mainline kernel yet.
So, unfortunately, I can't tell how this patchset fares on it at this
time.

Best regards,
Maxim
