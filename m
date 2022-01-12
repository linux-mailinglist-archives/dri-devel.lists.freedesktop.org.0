Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB2648BFBC
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jan 2022 09:19:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BC6B11242A;
	Wed, 12 Jan 2022 08:19:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F9411126EA
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jan 2022 08:19:38 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id a5so2705650wrh.5
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jan 2022 00:19:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=N65x+okBqwUwEt3rIQ+NIW+LytKbN9dsX1fy1vfrCfI=;
 b=SW98+bEGXg9kLnzJ/Wwc1NHVh8cpZxfiyWuV2nGuJ74fgv45ymJw6JemuQAKIArNtE
 5DG1Lvl/4pk6ePJLHplSmtJIGixksULeN7oycvXq0sRHaw/4lS/qVfJAvoc8aJzPYJrI
 bu99OyB1WGiRnjZ8R698wf4TY0nB6PSdMvu0I0WVoj9h9PvxXwNW4SXrQXAaDcFLOauK
 oksO6kEvCFpQXgxhIYdwL8HhuTJcxAZwjAnsbsKzbGn6ZPbWputKpy32zfY0Dc8P8gcT
 5Y4Kkf1SoAroY0F0bMlIoGFd5/EqnI63psov11WvPWXEj0TAeGUeO2GO9FaqWwlkQb/C
 ltAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=N65x+okBqwUwEt3rIQ+NIW+LytKbN9dsX1fy1vfrCfI=;
 b=6lvqp3biFH9FNMoxGduG33i4IBeIdZ1g8uQ6V9VC2AhaKJpywLjqKXmffFp//EkIMf
 4LDRyroBvKPY4b48sJa+X8BD2eiaVnO/tKvTUgWcwR6ae0yWejswx64YcopbGzoM4fQB
 583t1ESeVKpVc7dTg91NcRZP88xrvrsMgczZNDos8u7RumHALl/09oSuDcA7SHzs1gGB
 pbDUD1ne3vracNAfI5fGApJPHYYnaNUQrpcMTILtv9Gex3ZncMXd0cRZxJ5+I6MCPVaw
 pryc+19PX4NdjGQ5WWII2rMYui41Fin4IPhFRFskoTLNvDL1uzP1HlK2pC8lpJ5AElFj
 Bsww==
X-Gm-Message-State: AOAM530yOLyROqCWaoUffveKQzGkDMQ080x0TlB9eN4H2ZIYds02ICFQ
 H9vTkddChDuzerymphslr5M3ersQMP00lg==
X-Google-Smtp-Source: ABdhPJyuElpnJODcDGKEk++EbHO+Un+WeepU7Q/OryifjLA3PhxRGHAWWF2yBRHvGTJDk1mAUoD/sA==
X-Received: by 2002:a5d:584b:: with SMTP id i11mr6667217wrf.433.1641975576862; 
 Wed, 12 Jan 2022 00:19:36 -0800 (PST)
Received: from ?IPv6:2001:861:44c0:66c0:381b:6e50:a892:5269?
 ([2001:861:44c0:66c0:381b:6e50:a892:5269])
 by smtp.gmail.com with ESMTPSA id i8sm14694212wry.108.2022.01.12.00.19.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jan 2022 00:19:35 -0800 (PST)
Subject: Re: [PATCH 6/6] drm/meson: add support for MIPI-DSI transceiver
To: Jagan Teki <jagan@amarulasolutions.com>
References: <20200907081825.1654-1-narmstrong@baylibre.com>
 <20200907081825.1654-7-narmstrong@baylibre.com>
 <CAMty3ZBEmafG8LS_yv4eektvUoHwYFoV=-8wohUXgsvpRbZqtA@mail.gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <70d1af3f-bc00-4afd-1157-1cf70d3b2c88@baylibre.com>
Date: Wed, 12 Jan 2022 09:19:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAMty3ZBEmafG8LS_yv4eektvUoHwYFoV=-8wohUXgsvpRbZqtA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
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
Cc: linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 12/01/2022 08:24, Jagan Teki wrote:
> Hi Neil,
> 
> On Mon, Sep 7, 2020 at 1:48 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>>
>> The Amlogic AXg SoCs embeds a Synopsys DW-MIPI-DSI transceiver (ver 1.21a), with a custom
>> glue managing the IP resets, clock and data input similar to the DW-HDMI Glue on other
>> Amlogic SoCs.
>>
>> This adds support for the Glue managing the transceiver, mimicing the init flow provided
>> by Amlogic to setup the ENCl encoder, the glue, the transceiver, the digital D-PHY and the
>> Analog PHY in the proper way.
>>
>> The DW-MIPI-DSI transceiver + D-PHY are directly clocked by the VCLK2 clock, which pixel clock
>> is derived and feeds the ENCL encoder and the VIU pixel reader.
>>
>> An optional "MEAS" clock can be enabled to measure the delay between each vsync feeding the
>> DW-MIPI-DSI transceiver.
>>
>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>> ---

[..]

>> +
>> +static const struct component_ops meson_dw_mipi_dsi_ops = {
>> +       .bind   = meson_dw_mipi_dsi_bind,
>> +       .unbind = meson_dw_mipi_dsi_unbind,
>> +};
> 
> Do you thought of non-component based meson DSI like STM DSI? It
> require changes from meson drm but just to understand if you have any
> such plan.

I have no such plans for now, note this serie has been rewritten at [1] but still
with based with components.

If worth it, the plan is to get it with components and than yes if it's simpler
drop components completely.

I'll have a look at how ST does

Neil

[1] https://lore.kernel.org/r/20220107145515.613009-1-narmstrong@baylibre.com

> 
> Thanks,
> Jagan.
> 

