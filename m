Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B12F1B7FDD
	for <lists+dri-devel@lfdr.de>; Fri, 24 Apr 2020 22:09:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DAA76EB18;
	Fri, 24 Apr 2020 20:08:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60B376E043
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Apr 2020 17:07:31 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id e26so11338149wmk.5
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Apr 2020 10:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=pNg7ONatcx0tvdnMJvHWn8buU8bELK0ZoEzKLC3RkrU=;
 b=Z4mN1LorXe2GM36jqQm7NtzdCnaRpU0Csh+HAxCuycpzXjsiwupEy003zAW9zlNzoa
 BSUR6yFaScZlsGXZiHvScU7mokPg6cjonkYIKU+ZIiEjk2p5/jhsHI0V2wgPYFhSnO9S
 ORcIVXU5RUAc9mhFXNFqhyoyaayDRvufCJhY2mX1mEduR66TBnM4FPwh+GladDpJGbMo
 7qcrn9+35jo2iACZBEnpZhDY8RJIzJRrArtYlmXjZesr0y/rs9vc9Q7rBGdq02+OYvPm
 P3R/Ki/haSJ/igYDSTxMtaj/PPz4qsBuWi2+t1qJoibNTQfrz5LhmTHeVVGUPqMACYb6
 s0JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pNg7ONatcx0tvdnMJvHWn8buU8bELK0ZoEzKLC3RkrU=;
 b=QFlyQCVF4ayV6ptREdM3YTcbIZIai36ciUWoqJ7dBHxVgh4y8UlsuV3ayeDDyedxht
 rloSIHnDS6Yt0wIANb8PCGnYZdUmfibNgniPfkt1JiburAw86VHBSzh9MppH/7NZzgsb
 6sNnT1NkXuRi0reuGHz67kTpRc9Ni8ejehXLyvhx23mppk5oebOR9uO0bTreLBYl9H6P
 /14tXrS0/tHYjvHtPr/7uyfJE95yqkIcTgCvhgtl8fG4hU+urN3HY10bAbgf34Pwckfx
 Qtwe7HTmS1yFu8fd+q7c24VCIX1qEU28jfbwqescOhduwYj7D7E31+Os/QrV+/Q4uvo5
 FWqg==
X-Gm-Message-State: AGi0PuYF6OYy1Ai4DvdGCNPDgqtxW7Tz4Rrt9TTn61e5qJO3UzvapW9l
 ll3vAsR5S+windz8ef9SeZo=
X-Google-Smtp-Source: APiQypLZO4MExFdKMNKjUrrFilmlGS8Q/GGA4PlaU3k8a0ak1a7T/J3DeClcdV59/IjrALJ7MYYFkA==
X-Received: by 2002:a7b:c390:: with SMTP id s16mr10817388wmj.14.1587748049944; 
 Fri, 24 Apr 2020 10:07:29 -0700 (PDT)
Received: from [10.230.188.26] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id g69sm3827549wmg.17.2020.04.24.10.07.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Apr 2020 10:07:29 -0700 (PDT)
Subject: Re: [PATCH v2 01/91] i2c: brcmstb: Allow to compile it on BCM2835
To: Wolfram Sang <wsa@the-dreams.de>, Maxime Ripard <maxime@cerno.tech>
References: <cover.d1e741d37e43e1ba2d2ecd93fc81d42a6df99d14.1587742492.git-series.maxime@cerno.tech>
 <c8c666eb5c82dcb73621930b3fedf5814792bf1a.1587742492.git-series.maxime@cerno.tech>
 <20200424161353.GA4487@kunai>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <bedfe073-6ff4-69ee-fe39-d5802cc3ecfd@gmail.com>
Date: Fri, 24 Apr 2020 10:07:25 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Firefox/68.0 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200424161353.GA4487@kunai>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 24 Apr 2020 20:08:26 +0000
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
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Kamal Dasu <kdasu.kdev@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-i2c@vger.kernel.org,
 bcm-kernel-feedback-list@broadcom.com,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 4/24/2020 9:13 AM, Wolfram Sang wrote:
> 
>>  config I2C_BRCMSTB
>>  	tristate "BRCM Settop/DSL I2C controller"
>> -	depends on ARCH_BRCMSTB || BMIPS_GENERIC || ARCH_BCM_63XX || \
>> -		   COMPILE_TEST
>> +	depends on ARCH_BCM2835 || ARCH_BRCMSTB || BMIPS_GENERIC || \
>> +		   ARCH_BCM_63XX || COMPILE_TEST
> 
> Isn't there something like ARCH_BROADCOM which we could use here instead
> of adding each and every SoC?

If you are worried about this list growing bigger, I do not think this
is going to happen beyond this changeset (famous last words).

There is no ARCH_BROADCOM because there is typically very little
commonality between SoC architectures within various Broadcom business
units (left hand is not supposed to talk to the right hand) with the
exception of a few peripherals that have been historically shared (NAND,
SPI, XHCI, Ethernet PHYs/switches, etc. etc. This I2C controller
historically came from the STB business unit, which given the market
space has also engineered its own HDMI core and naturally incorporated
the I2C core it already had into the HDMI core. Up until 2711, that HDMI
core was not used by the 283x family at all.
-- 
Florian
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
