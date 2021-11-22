Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 602DC458C55
	for <lists+dri-devel@lfdr.de>; Mon, 22 Nov 2021 11:33:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA6766EB80;
	Mon, 22 Nov 2021 10:33:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 752736EB80
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Nov 2021 10:33:39 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id bu18so78700031lfb.0
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Nov 2021 02:33:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=nrxZZZTUaK5PX2ySh0+vBqyiZXpekCDZnPCBfoLVNj8=;
 b=PBRfkEeYxsKR7JApIAGoA9f/5z9fI/wiXjTBCL/PUUL1M2yf5L99Ocjs/ID34wmvxa
 ccVyhqkPjMrZv4YC2K9g8y0Kl2IwE2TDrDfFwuKfwdYzl03rFrnAtp0KdET7oL4woquF
 ya5NXRIbVvBsW6inbrBMwE2COQ5KdwVw7H+8QvYJrKtyZLgPm2weo4ZK1YkCxrL1qFgZ
 g7TRwzqICHBaHaCME6zIkKdp59ENCOXAeiL/SyD0GjqLDrkNS4HPOQY71Qeuf5OZxcs/
 YXF6rI5t9FtGjjObSRj3mJ+MkWoQa+8wwxDn3fDsNmNj9e+vUt9IrL0w9IsjoNGc1Lf3
 6plw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nrxZZZTUaK5PX2ySh0+vBqyiZXpekCDZnPCBfoLVNj8=;
 b=tI4X/qqQ+GR2jYSY+FVQmDTsoHFs7MSMTzH2NGK6nPGw/GkBdADzLjbNPBCqaRh8jX
 d9XUrDw/e00LGphCoNdz4+NCtQ91+dJ+oz9o6+F7xRgIgKdepE16m6OsloVY8ZSQCa6S
 qEABX0lBRKStJGzUA4C4KOKQ5AQBFNGA12eHDGxnD9A6FJaxVWRAAT4l/oDdehKCx7xB
 B/9KbTwMiuR40LldsfTb8/EAnMsgD9VgS9zVciW4Kz9iRFI6QZqkY4N8Wusm7WN/cI9p
 HlS5qUObd6pb6IsOKhX8oLdvA7hJ2blEv2Ff+H1J9vg+PwdFHf7wBC84WUC1YZxOy9JJ
 TP/Q==
X-Gm-Message-State: AOAM532XpN4RTBjxWxHOFA2xrL3+TDVC51KQgnkemsr2fjsiT3D2tgV8
 wGwB546RKMATgmxQSjzDUv8=
X-Google-Smtp-Source: ABdhPJzZ/qm5LLGImo0I/3G8kIkfGaa7D9I8/JdE3U3vap72N3xDDHAzVRpK4BfX2bx0KTP6BS+BIA==
X-Received: by 2002:a2e:6a11:: with SMTP id f17mr49823727ljc.206.1637577217813; 
 Mon, 22 Nov 2021 02:33:37 -0800 (PST)
Received: from [192.168.2.145] (94-29-48-99.dynamic.spd-mgts.ru. [94.29.48.99])
 by smtp.googlemail.com with ESMTPSA id x4sm898633ljd.1.2021.11.22.02.33.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Nov 2021 02:33:36 -0800 (PST)
Subject: Re: [PATCH] i2c: tegra: Add ACPI support
To: Andy Shevchenko <andy.shevchenko@gmail.com>,
 Akhil R <akhilrajeev@nvidia.com>
References: <1637328734-20576-1-git-send-email-akhilrajeev@nvidia.com>
 <CAHp75Vfi5gw4jnJg2bmubKMB_H8s09PfNWVVZWwewuCnW5_+hg@mail.gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <f213eb06-7b07-b01b-786d-4435a59d4fc3@gmail.com>
Date: Mon, 22 Nov 2021 13:33:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAHp75Vfi5gw4jnJg2bmubKMB_H8s09PfNWVVZWwewuCnW5_+hg@mail.gmail.com>
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, linaro-mm-sig@lists.linaro.org,
 Laxman Dewangan <ldewangan@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 linux-i2c <linux-i2c@vger.kernel.org>,
 linux-tegra <linux-tegra@vger.kernel.org>, Jon Hunter <jonathanh@nvidia.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

19.11.2021 17:48, Andy Shevchenko пишет:
>> +       if (i2c_dev->nclocks == 0)
>> +               return;
> Why? Make clocks optional.

This check shouldn't be needed because both clk_disable() and
clk_bulk_unprepare() should handle NULL/zero clocks without problems.
