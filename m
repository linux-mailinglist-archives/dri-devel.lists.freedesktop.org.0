Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D09025BF6AC
	for <lists+dri-devel@lfdr.de>; Wed, 21 Sep 2022 08:50:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBB5810E3B3;
	Wed, 21 Sep 2022 06:50:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6426110E856
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Sep 2022 06:50:35 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id x27so7719271lfu.0
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Sep 2022 23:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=B4QGcwwfcd5nEBk1LZ1jhRTqW0+plYNmqD6gtk/kzXI=;
 b=c18KG2gP8LFKNxUKRwMjOTpBf6C3XPqKcAokLtpt+wZ0WWB0XenCiCVkFI6o13v19d
 pt4KiyTbatiaENZatvzYqTJubBuUO6dNUkgxHYBzz1jAW6BUwLDDYLwrp80q7MizCiJ9
 x55Lanas9o0YZQ/8BehxS6gQ/n8wT27yMjCMNEnMSSlYUwaryGtIt8xB0PMAi17x0rVj
 H3mfzefjy9Y/gYcg8JykszV53slrUPzUNBzK2g95+ZZ8VkEnCs1b89sxqh4Y/TJazhCP
 p4a3GqvMamuYyeNltzBz+R0SXvi7SW0ud+++hATgjNqKSZm4yfnmROH//xm1gC/Aany0
 PPtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=B4QGcwwfcd5nEBk1LZ1jhRTqW0+plYNmqD6gtk/kzXI=;
 b=NNAbLZQy1eZDh2UQ/5CUvVr2BzRufpT/bABv9fmpszV92HOLxY3XgMWKUS0tdx9X/I
 9X9FrwfzyRHJaZMESYDozvyNXU8mEIkSV9j7bLjzhxfA8sYFR/vFLBIQX7ioxX4Puoo3
 swOpt1Plzqt5wR+cdDYLQ7o0t0LOEi76MXLytZjIyqRYBhr9Fn/9tTQ+DoadJgjNd/la
 X/IXsLFtpqxQhWWzEV8weUd4p1NBIG8NqJlTAOvorBAaxEcjUinRaSgK2SA2PlJ0m8uT
 qjmcmLKSMzLSP9TEsII3TtkOxMsZVGudamyAPq1qi/Ftsn66yPQnnSJI45raHdRrl5zQ
 5xzA==
X-Gm-Message-State: ACrzQf1PaRDP84Hw+JsYvGw4nvdVPL8SUaXM6CizlCX3MzadiYgqO/rm
 4eYtmQtzaLOVjOEGAQARHDCE4A==
X-Google-Smtp-Source: AMsMyM4ir3h1N37nTS6UTeTMVQ0MngI88i8qKzN921Vaj6amXbG4MaxmWT+wHUsI4dhq0o+IIVTf0A==
X-Received: by 2002:a05:6512:3f05:b0:497:9e06:255b with SMTP id
 y5-20020a0565123f0500b004979e06255bmr9094767lfa.175.1663743033679; 
 Tue, 20 Sep 2022 23:50:33 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 j9-20020a056512108900b00492e6642937sm299670lfg.200.2022.09.20.23.50.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Sep 2022 23:50:32 -0700 (PDT)
Message-ID: <b2ed17d2-5f7a-0173-63f3-1dabb181a632@linaro.org>
Date: Wed, 21 Sep 2022 08:50:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH V2 1/3] dt-bindings: vendor-prefixes: add NewVision vendor
 prefix
Content-Language: en-US
To: Chris Morgan <macroalpha82@gmail.com>, dri-devel@lists.freedesktop.org
References: <20220920145905.20595-1-macroalpha82@gmail.com>
 <20220920145905.20595-2-macroalpha82@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220920145905.20595-2-macroalpha82@gmail.com>
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
Cc: devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 airlied@linux.ie, Chris Morgan <macromorgan@hotmail.com>, robh+dt@kernel.org,
 thierry.reding@gmail.com, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 20/09/2022 16:59, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> NewVision (also sometimes written as New Vision) is a company based in
> Shenzen that manufactures ICs for controlling LCD panels.
> 
> https://www.newvisiondisplay.com/
> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
