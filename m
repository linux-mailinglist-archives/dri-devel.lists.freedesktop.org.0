Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 433BF4BEBDD
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 21:29:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98A8B10E1A7;
	Mon, 21 Feb 2022 20:29:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 057AF10E1A7
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 20:29:33 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id 29so6603317ljv.10
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 12:29:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=JX92JbueB/ws0+fnmetMx1WHpeM17m1CK4LnOHWhCBs=;
 b=AaELFfPYbaSEgQL3sit82AFMQEC70aaEiOn6I+yMOJTZBkMOEuiMH/JHAXJ2zdxl8o
 sJSesXuGvNJDPbEU9IliwLvyRQftpr5mXaJLzsXConS66fHFdO4EH2uanfRcot/CbDNv
 8lMSe6K56/ZGkS4QontcyjaYVKOwfvrMwr8NLCD1zOCL9h5Z7ML5FbUo65WSH3CupnQg
 qrv6KcicL6uU7X50JO/SIRNIVqMX98l2Oi0yAYWEVxLJmvaam35UEWu3W8qBunutqRap
 tl53TxQLhwRjrDgSSoY6+SglDBls6PcmMJK/Ov8h4rcZRKrr9vpBm+CxTnmPkbA7FQQE
 yxQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=JX92JbueB/ws0+fnmetMx1WHpeM17m1CK4LnOHWhCBs=;
 b=7/09thqFvcwBB7cYBCxkBEpTPHHVG9+dHJugwUBoQ2w+jAdeltcT0tDxyTKN6JqgCl
 LFhqoef4RtomKDCiE3HhPNum2AOOY4ajDFcrAEeYldBnP6gD42zZZuC8g3XQPcYaHr/3
 5lVWygBLxiG/Z6Fsqw5+RZfnECtZQrvkA64VL7fo0b3qfPihY/7togSrBG+VIfky25Ay
 OqjvkyH7RMUSquRCLT1N0mNsfeQ4l+7Bh34BUFjdup7FhLh8tbw6QNACWD2tgAcYyYaY
 I6tGvHL0qlGardRXnkkbbgZfYfniUVL2VQo+t7dg3c7AHSInINisDIZepQQXlQkp1Npm
 zXkA==
X-Gm-Message-State: AOAM533bR5L9RJycvZhtigMfZuCtjgncYJlzi6to2IAZ4NiUv3p+4atf
 XIYJf6hoj9E1XYdikCtqDGE=
X-Google-Smtp-Source: ABdhPJySwG73wg9/mu5qjE/fqxawciyyP3eUEsnZw/alxwOEuOw2/uDwn1KLy6B1b3mocJYO2CHG1w==
X-Received: by 2002:a2e:900a:0:b0:246:17bb:a771 with SMTP id
 h10-20020a2e900a000000b0024617bba771mr14727734ljg.363.1645475371346; 
 Mon, 21 Feb 2022 12:29:31 -0800 (PST)
Received: from [192.168.2.145] (109-252-138-165.dynamic.spd-mgts.ru.
 [109.252.138.165])
 by smtp.googlemail.com with ESMTPSA id m7sm1442377ljb.87.2022.02.21.12.29.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Feb 2022 12:29:30 -0800 (PST)
Message-ID: <c207663d-7d7e-6c10-6ee4-3dd0378181f9@gmail.com>
Date: Mon, 21 Feb 2022 23:29:30 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH libdrm v2 00/25] Update Tegra support
Content-Language: en-US
To: Mikko Perttunen <cyndis@kapsi.fi>,
 Thierry Reding <thierry.reding@gmail.com>
References: <20220217191625.2534521-1-thierry.reding@gmail.com>
 <ed92bf43-1df2-8059-5228-83b98d6bbfae@kapsi.fi>
From: Dmitry Osipenko <digetx@gmail.com>
In-Reply-To: <ed92bf43-1df2-8059-5228-83b98d6bbfae@kapsi.fi>
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

18.02.2022 12:31, Mikko Perttunen пишет:
> On 2/17/22 21:16, Thierry Reding wrote:
>> ...
> 
> Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
> 
> Left one cosmetic comment in the VIC4.0 patch, but overall looks OK. I
> think it would be fine to have some basic tests in libdrm as well.

There is a question about who is going to use this libdrm API. Are you
going to use it in the VAAPI driver?

Grate drivers can't use this API because:

1. More features are needed
2. There is no stable API
3. It's super painful to keep all drivers and libdrm in sync from a
packaging perspective.

It's much more practical nowadays to use DRM directly, without
SoC-specific libdrm API, i.e. to bundle that SoC-specific API within the
drivers.
