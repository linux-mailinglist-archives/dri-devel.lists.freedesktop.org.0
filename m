Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB23E3AE224
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jun 2021 06:19:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7239A89D64;
	Mon, 21 Jun 2021 04:19:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4783D89D56
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 04:19:18 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id a11so14788567lfg.11
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Jun 2021 21:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wQR1d2nXINli2r0qWQEuIxhuaXFegPwICSdu1LOWBLE=;
 b=uNpS/WQe1u+O6GqY5APACmNIY2oeqiUgN0TFZtOxj3s48jAs5D+LVEFsvt4M9LKA5z
 n47Hjd1t7EA4wVIbqBFEKILxxxASWnEw/9ld9AWhBk27xD0bp+/eErNY12LNukTPiUow
 IP4BBVo/Q4JFxtX4GCFIqsZATynHgYOVnMrFNbN+ml6j9fmZ7YXOVvuhrSjyBmf3wlWN
 S+lP3Tl7ny0OyhEOAi9TtDy8Y9RoV5jB42+Zp/Ij4JdXcEiH3u+Ap4fn2TPSl4+X/ogz
 n49TptyMuLkSW6rBCNf/Q5oSnIDQoS0Nqg+Iuos3Xnk5yvMAKB+rHOHp7B5m46g+/z/w
 2oBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wQR1d2nXINli2r0qWQEuIxhuaXFegPwICSdu1LOWBLE=;
 b=pWqnlo9hCblWdNqHgh/aknSgEbKcS1KJ/QRIPHSmFTIELZAnf8IQfzYXY0LRpSu3Ww
 6hNKtHKLglYCN16EdRGTYQ6MT7D0k6kKh6bTrr1qcSYjorLoSkAXVdXkNZECyQL1t4d2
 CRA3XQ+NQb72uCouW+W8LH7B+2EIb2anj056CCcmMIjToE9dmo8tjXOKeWEXF5QDb2Ss
 XSClDjbc1c1C64SeaYuIzlcS156tshxtHJTDnP/sNE8fqFpHgH1PTR9yRCJx8fVEhTH6
 ad/XBh1gkdqHJ3YAs5SpQRNb0hgEZ0xtJA04BLoPb/uwHeC8iZGpREl39J6ScM+y+dKV
 lGNQ==
X-Gm-Message-State: AOAM5302Sw1oPkG1k4TFT29Q4DIohIBIjcM4d5IBXI6lyQrfHiLkMVSQ
 xTPEHygdP42P4otAgIEKsc0=
X-Google-Smtp-Source: ABdhPJyc6b/ECLFi440OkwjYkmEOdtosozafVaK6tDf8W90rbWwATVxHsEuxNbPY8Gh39qOuSQaFJg==
X-Received: by 2002:a19:c4b:: with SMTP id 72mr12696790lfm.15.1624249156706;
 Sun, 20 Jun 2021 21:19:16 -0700 (PDT)
Received: from [192.168.2.145] (94-29-29-31.dynamic.spd-mgts.ru. [94.29.29.31])
 by smtp.googlemail.com with ESMTPSA id 140sm2014922ljj.124.2021.06.20.21.19.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 20 Jun 2021 21:19:16 -0700 (PDT)
Subject: Re: [PATCH v18 0/2] Add memory bandwidth management to NVIDIA Tegra
 DRM driver
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
References: <20210601042108.1942-1-digetx@gmail.com>
 <8accfe1e-fc48-21ca-f7c6-bd2d60162e6d@gmail.com>
Message-ID: <50912a57-aa43-58b0-02d2-6928578d6286@gmail.com>
Date: Mon, 21 Jun 2021 07:19:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <8accfe1e-fc48-21ca-f7c6-bd2d60162e6d@gmail.com>
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
Cc: linux-pm@vger.kernel.org, Nicolas Chauvet <kwizart@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Matt Merhar <mattmerhar@protonmail.com>, Peter Geis <pgwipeout@gmail.com>,
 linux-tegra@vger.kernel.org,
 =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

07.06.2021 01:40, Dmitry Osipenko пишет:
> 01.06.2021 07:21, Dmitry Osipenko пишет:
>> This series adds memory bandwidth management to the NVIDIA Tegra DRM driver,
>> which is done using interconnect framework. It fixes display corruption that
>> happens due to insufficient memory bandwidth.
>>
>> Changelog:
>>
>> v18: - Moved total peak bandwidth from CRTC state to plane state and removed
>>        dummy plane bandwidth state initialization from T186+ plane hub. This
>>        was suggested by Thierry Reding to v17.
>>
>>      - I haven't done anything about the cursor's plane bandwidth which
>>        doesn't contribute to overlapping bandwidths for a small sized
>>        window because it works okay as-is.
> 
> Thierry, will you take these patches for 5.14?
> 

The display controller does _NOT_WORK_ properly without bandwidth
management. Can we get this patch into 5.14? What is the problem?
