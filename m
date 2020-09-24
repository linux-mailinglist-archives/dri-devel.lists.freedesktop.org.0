Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 294C8278132
	for <lists+dri-devel@lfdr.de>; Fri, 25 Sep 2020 09:10:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 569D06EC1A;
	Fri, 25 Sep 2020 07:09:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E669D89A5E
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 20:34:06 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id n61so169592ota.10
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 13:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ehQMQDpfRuKgE9q3WkgCEw7GDoAOhOo3QuUUp/OPUqQ=;
 b=l312+u+7ga5J92oQ6XTu4UEadfft1HHNg8cWkHDfv1zdbNqUNoPaYJJf+u5myxV0ze
 NhB7GnffmjU6GM2/5X55WeGIODktQ6O6FmCo8F3UTN9IJtVE7NxD00no52Ng12M75Km0
 FIBHT+scEFtSSBIWf7qVEGVJxI1Ju9ltKeAFPQWvM8gXvlFoMsfvWIHpApaBsbGYIVru
 VYmj73BdUKflBMum1ph00dBuR5+gBntRrg6/ZG9gxNNBZU3Q5chIwW8YCtkTe6cuktJ2
 NEKqJ/me49prJuHwT6dMRKXGIRaG6jeuskOiW4JfyuFNjGPah4xM8pxuyFke4Z5S+OF1
 Jtcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ehQMQDpfRuKgE9q3WkgCEw7GDoAOhOo3QuUUp/OPUqQ=;
 b=dUd2cAetqukocE9ypmciqajgsSGEbhyVZUSdDNsfmnQw9aBUmSGsA8N3XujZcX4n4z
 lCMPCUgogC92DT/r/qfdVxD7dakapicB0MYz/1+UaAfnwol4dKWsI8OIww7c7PLN/WuP
 nhsO+tvbCn6qsa8kw6st99Gx74YGXkodooO4eCldgmstdUuLwYbpHtSIPHHLiceTJjl0
 WlwXt47Zz4BZfSTpuZQlHpfOtzBJ1lJ+abuvGaUyY6rPfIZv3HK6pfPcQ/4dInPr5gam
 GRwznw+pQiZymqtnpK3AiJuF+madJHR0eUvfL8Njh6eTrgv4aKjyzSpI+ReUO9cCaFiu
 RNKg==
X-Gm-Message-State: AOAM533409JHf/ZTX25DtJjoicc0rYmQmjg2c5BnXYrzWLP11sUjzWbH
 Mqm4XyC4pqTcnqDReC7PqUw=
X-Google-Smtp-Source: ABdhPJx2d9TJEBv6QBxIXw1aHF4k4DJ3YCNStZz1ImZ4Pxd88NKzog6I53M3G4zKwxUTDfWnZqDSVg==
X-Received: by 2002:a9d:75d1:: with SMTP id c17mr636430otl.59.1600979646227;
 Thu, 24 Sep 2020 13:34:06 -0700 (PDT)
Received: from nuclearis2-1.gtech (c-98-195-139-126.hsd1.tx.comcast.net.
 [98.195.139.126])
 by smtp.gmail.com with ESMTPSA id y84sm103879oia.10.2020.09.24.13.34.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Sep 2020 13:34:05 -0700 (PDT)
Subject: Re: [PATCH 1/2] drm/bridge: sii902x: Enable I/O and core VCC supplies
 if present
To: Fabio Estevam <festevam@gmail.com>
References: <20200924200507.1175888-1-mr.nuke.me@gmail.com>
 <CAOMZO5B4S3JCVQAi-y=vKaQv3AF6eXronTkmG_DZs_ALtEHtgA@mail.gmail.com>
From: "Alex G." <mr.nuke.me@gmail.com>
Message-ID: <4ea79371-8036-1e26-e1ba-1bb98d1e5410@gmail.com>
Date: Thu, 24 Sep 2020 15:34:04 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAOMZO5B4S3JCVQAi-y=vKaQv3AF6eXronTkmG_DZs_ALtEHtgA@mail.gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 25 Sep 2020 07:09:24 +0000
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Mark Brown <broonie@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/24/20 3:22 PM, Fabio Estevam wrote:
Hi Fabio,

> On Thu, Sep 24, 2020 at 5:16 PM Alexandru Gagniuc <mr.nuke.me@gmail.com> wrote:
> 
>> +       ret = regulator_enable(sii902x->cvcc12);
>> +       if (ret < 0) {
>> +               dev_err(dev, "Failed to enable cvcc12 supply: %d\n", ret);
>> +               regulator_disable(sii902x->iovcc);
>> +               return PTR_ERR(sii902x->cvcc12);
> 
> return ret;

Thank you for catching that. I will fix it in v2.

>>
>>          ret = regmap_write(sii902x->regmap, SII902X_REG_TPI_RQB, 0x0);
>> @@ -1012,11 +1052,11 @@ static int sii902x_probe(struct i2c_client *client,
>>          regmap_read(sii902x->regmap, SII902X_INT_STATUS, &status);
>>          regmap_write(sii902x->regmap, SII902X_INT_STATUS, status);
>>
>> -       if (client->irq > 0) {
>> +       if (sii902x->i2c->irq > 0) {
> 
> Unrelated change.
[snip]
>   Unrelated change.
[snip]
> Unrelated change.
[snip]
> Unrelated change.

The i2c initialization is moved into a separate function. Hence 'client' 
is no longer available. Instead, it can be accessed via 'sii902x->i2c'.

Alex
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
