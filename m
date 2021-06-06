Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DCA039D1F2
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jun 2021 00:40:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F2C26E054;
	Sun,  6 Jun 2021 22:40:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFB206E054
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Jun 2021 22:40:09 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id n17so2325424ljg.2
 for <dri-devel@lists.freedesktop.org>; Sun, 06 Jun 2021 15:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1GGJToq6i4FyeVRgJK+tocSjb9/+pC5ZQ5M4IXJpq6o=;
 b=Mem2B/UUWNTL5KuAVNcaL+JsgqvSnNRdJmEc38/EL5Bd7Z2BKqK9r1EKj8Sj457dyO
 iU4G5KCRV5XLcqfZQScec5zKVJilmpzfesbGYHQAAx0wZ6PP2Gg5NI/c5BO6h4JqJS2g
 ZtpTL8R9ZCuPEhq3OtDeO5wQFRh88cSWcmnwsiG2He/FErIA/Fhp+iFz/mXJ31TF1Jrr
 11pFrQHZtZzv07LhoJblgiaqh8P/f1+Lbq/FkOjdRpkKOhTMIoPUO+wDR+wFM7D47Fb1
 Uatr90zTItMQHqKNlDGTFwdbhQwgLTIKhGH/yY1Ceju2E6wSAqtlSivrUXYcFiW5vTQ6
 R8Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1GGJToq6i4FyeVRgJK+tocSjb9/+pC5ZQ5M4IXJpq6o=;
 b=N8j3U4r6YhFof8WSG/tsCefJ6cVYJEOfhxBicOLs8rAL8epS0ImeGbIlFadx0yq5PY
 eGm5zGcFGjfjvpQGRUpRQf3v3hcLtW6cZjMRE2Qf6PA5Mh0qfNRqWUeLKoK6tMjdw5uD
 Aex+K3BHVgNtPtHFgHvwq8w2DOS0c4asHNFxl2yBI+9efarjG9p96AMTnDeCvAa2pTBp
 v/jP9Y4FtxXWMS/SctqBknLVv5GRWAbL3qIc1rj9fFR5zfRn4w2PGW+lgc8kCyUc/I/+
 Ha7mGta7fNA0KkevqauuZanV43hHuNP5u8ZBPYsfJH0+xJcera0nbhu7btXZJN78lA+Q
 x13A==
X-Gm-Message-State: AOAM531+Bd2nNCEHfa4qCyWrx5G6oQvp+/wHuRy0imSG57vMi0UBElLo
 KDm4SnzmVG8k9ljppiUndWE=
X-Google-Smtp-Source: ABdhPJyMQu9/FcrHkV8dRQItFculAkw1RXMxChQnHeiFJuNFbl7PO6XBoALQ1s94VBaENxwY6u/FNQ==
X-Received: by 2002:a2e:7018:: with SMTP id l24mr12562657ljc.12.1623019208259; 
 Sun, 06 Jun 2021 15:40:08 -0700 (PDT)
Received: from [192.168.2.145] (94-29-51-134.dynamic.spd-mgts.ru.
 [94.29.51.134])
 by smtp.googlemail.com with ESMTPSA id q184sm1728861ljb.54.2021.06.06.15.40.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Jun 2021 15:40:07 -0700 (PDT)
Subject: Re: [PATCH v18 0/2] Add memory bandwidth management to NVIDIA Tegra
 DRM driver
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
References: <20210601042108.1942-1-digetx@gmail.com>
Message-ID: <8accfe1e-fc48-21ca-f7c6-bd2d60162e6d@gmail.com>
Date: Mon, 7 Jun 2021 01:40:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210601042108.1942-1-digetx@gmail.com>
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

01.06.2021 07:21, Dmitry Osipenko пишет:
> This series adds memory bandwidth management to the NVIDIA Tegra DRM driver,
> which is done using interconnect framework. It fixes display corruption that
> happens due to insufficient memory bandwidth.
> 
> Changelog:
> 
> v18: - Moved total peak bandwidth from CRTC state to plane state and removed
>        dummy plane bandwidth state initialization from T186+ plane hub. This
>        was suggested by Thierry Reding to v17.
> 
>      - I haven't done anything about the cursor's plane bandwidth which
>        doesn't contribute to overlapping bandwidths for a small sized
>        window because it works okay as-is.

Thierry, will you take these patches for 5.14?
