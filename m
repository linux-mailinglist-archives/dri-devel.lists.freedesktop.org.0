Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 018232AB2D2
	for <lists+dri-devel@lfdr.de>; Mon,  9 Nov 2020 09:52:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 501EE896D8;
	Mon,  9 Nov 2020 08:52:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BAA889385
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Nov 2020 04:43:57 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id z1so4105061plo.12
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Nov 2020 20:43:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=VeSMAdUpVTWg5rlPdJVG8pxSdZtExYB1iM9sVnjYDNg=;
 b=eJHm3TiHV/0XNoAZ9ieRJhgkcSnJxiDmzQgtmuC631IsES0yYbO7cCylVd6eMw/FxM
 2w0vktpK/2bR+J/jtgktx+Gr2a5E4WIjVPPQB3qrivVht7W81PPT0kSZWbO/ezBP4oh3
 AFt2l3D8uFT0Of/uJ0JN25E9sZwm+T3B9NQeva8HaVvfnqFTqppTyoIAHyZfRITVb3Tk
 M+XSs405RTTGa0ZBepic36+ge8Bgo4FFga4GyIa7E9+utyyAeorXLVKT0/zgejtt2kbD
 UaAyk8u3UMl16KNlB69cPX6b6RoOVz7YMyNvMFsZ6hY2VeKwMUlf+tOPFXVnfhIgA/En
 +CnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=VeSMAdUpVTWg5rlPdJVG8pxSdZtExYB1iM9sVnjYDNg=;
 b=uBAYh5LuOJhyvrnzde1K+A9+rZU8LhwQQJjV9osOXwxz2uzBDggO1AEaxySrirWAMM
 vHfwE1QZ3Sspxc6FHQKrW7Oj4HGbkSyKIbR6Rh3GMe+6GieiEJc8ZTEOM+8rtNsJpaUm
 tXLr0S0mFPcT3jmQlpkgMHu9QKjMPrZZVOCdTyyz8/Bv9aWU0RpfvJB1yFTs9bfOJJYk
 diwuwgfJy4KPZ+kxq7BoHN/y1QVIcUK/dCRu+b66cU0a5C/dGfug1secXfGc++20/Fnn
 fR+d4FaKrFdJp8U8cNsCv8E9n3GgQJy91QQoMQVoJRjmlGEUH3NjHTNhEv05NytjmYgc
 uKMA==
X-Gm-Message-State: AOAM531HtDdKI4DhyRwa7lLoihWo9omZCGYn/WUwf3duYO+i4Uf7cN/8
 nwfB+FI82LU+xbYYXJFowueCRw==
X-Google-Smtp-Source: ABdhPJyHC9U/PvJR88Atd3LH5AQkxzAqN7kL/8313M8l8h0a50sg7VR+oZ4WDuMbbCMOzGA5AzJtTw==
X-Received: by 2002:a17:902:b58a:b029:d7:d45c:481c with SMTP id
 a10-20020a170902b58ab02900d7d45c481cmr6521527pls.55.1604897036736; 
 Sun, 08 Nov 2020 20:43:56 -0800 (PST)
Received: from localhost ([122.172.12.172])
 by smtp.gmail.com with ESMTPSA id m11sm8962236pgs.56.2020.11.08.20.43.55
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 08 Nov 2020 20:43:55 -0800 (PST)
Date: Mon, 9 Nov 2020 10:13:54 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1 00/30] Introduce core voltage scaling for NVIDIA
 Tegra20/30 SoCs
Message-ID: <20201109044354.ljd5pomhob6b7u5v@vireshk-i7>
References: <20201104234427.26477-1-digetx@gmail.com>
 <CAPDyKFr7qTU2RPhA_ZrbCayoTTNUEno1zdmvmv+8HBe-Owrfeg@mail.gmail.com>
 <cd147ab0-1304-a491-7a56-ee6199c02d32@gmail.com>
 <2716c195-083a-112f-f1e5-2f6b7152a4b5@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2716c195-083a-112f-f1e5-2f6b7152a4b5@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
X-Mailman-Approved-At: Mon, 09 Nov 2020 08:52:30 +0000
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
Cc: Peter Chen <Peter.Chen@nxp.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 DTML <devicetree@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Thierry Reding <thierry.reding@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 driverdevel <devel@driverdev.osuosl.org>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Nicolas Chauvet <kwizart@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Alan Stern <stern@rowland.harvard.edu>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 linux-pwm@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 linux-tegra <linux-tegra@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux USB List <linux-usb@vger.kernel.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Peter Geis <pgwipeout@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08-11-20, 15:19, Dmitry Osipenko wrote:
> I took a detailed look at the GENPD and tried to implement it. Here is
> what was found:
> 
> 1. GENPD framework doesn't aggregate performance requests from the
> attached devices. This means that if deviceA requests performance state
> 10 and then deviceB requests state 3, then framework will set domain's
> state to 3 instead of 10.

It does. Look at _genpd_reeval_performance_state().

-- 
viresh
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
