Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D4627BDB7
	for <lists+dri-devel@lfdr.de>; Tue, 29 Sep 2020 09:13:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0D1F89F45;
	Tue, 29 Sep 2020 07:13:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16D5E6E0D0
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Sep 2020 17:35:04 +0000 (UTC)
Received: by mail-oi1-x243.google.com with SMTP id u126so2195168oif.13
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Sep 2020 10:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=cHeddmIby2Yg+GgQapoLIFLAlWUnpJGP7Gp7MUzz0bY=;
 b=DI6aNpIpT5iu4BF2iczg6Z7bBHuhKgv6+XFL2ut8XuYRWGXW5B/RNIxBre8iCn0o1Z
 AkQWDPpXIhpg7KFoNOrIsjuZRNSHCvg+prq+iQokg1q2asdc404Z9m5Er+5Utak6qeFj
 8anamImWkv14eFZkgDMtIBK00aZVySJEtcA9H1zefiumuQi+6AhCBCQnwQN57sexIZLm
 5/TCtOBxsXIeip6ri+Tnhe/a9aoSgmIw2f8r05sok0UdPNQDjFNBtxFIuT+2TWrbRIGp
 PbEO0C9fvf8Tgvk8uGH/vE2sZJUlgucOrcrtMsI/It29TCkJq3LLt+na15fQ13q9g/ng
 hZwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cHeddmIby2Yg+GgQapoLIFLAlWUnpJGP7Gp7MUzz0bY=;
 b=MdQLiArxa77IbLrFfZW7kyIIQT1riPZyTp7wQGGxPb65Fj/FkcGtP2+P7930QUvPI6
 KKTYoGjfgtvLDwCpcrhdPETcac4LGGwAUqB6r69mVjeDNAWkgvICqVUdS2meLbZSvqW4
 kZtGvgd5LYheKWEuoYvc/vso2S8eXHSUpeZPqe+7yzwXdmvEJGRdA9QngWN33kQ3RspU
 OKkDN/3J/WjPy8w0nUqbiRA6+XIi/sJz/BaYEQGEemuozuECgemVDTBP6hkzz4vdfNxS
 gqwn/SScM4g2U/J55h+afpN22gYf+FzrHw8Gm6ky7SJ9MmPvgpcsl7pH+fAhKdsOz83H
 arkw==
X-Gm-Message-State: AOAM531rGGgaewWxOxDG5a/SEL0RahJHm93P8LyMtGZVX1h7UyWQYmwD
 e1BgQB2YQZp4qChj/RWFPOBzJ+Qq7/LfsA==
X-Google-Smtp-Source: ABdhPJz3D+z1zDnELhofjOQVPb93zdmjz9/EG9DwISeTLP4F26JGh3F2E8SfbrvGye4DW8FgUwO4/Q==
X-Received: by 2002:aca:1806:: with SMTP id h6mr8849oih.88.1601314503350;
 Mon, 28 Sep 2020 10:35:03 -0700 (PDT)
Received: from nuclearis2-1.gtech (c-98-195-139-126.hsd1.tx.comcast.net.
 [98.195.139.126])
 by smtp.gmail.com with ESMTPSA id 68sm378448otw.3.2020.09.28.10.35.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Sep 2020 10:35:02 -0700 (PDT)
Subject: Re: [PATCH 1/2] drm/bridge: sii902x: Enable I/O and core VCC supplies
 if present
To: Sam Ravnborg <sam@ravnborg.org>
References: <20200924200507.1175888-1-mr.nuke.me@gmail.com>
 <20200926184919.GB98875@ravnborg.org>
From: "Alex G." <mr.nuke.me@gmail.com>
Message-ID: <9c3ce766-743c-705f-7926-21e753c2d02d@gmail.com>
Date: Mon, 28 Sep 2020 12:35:01 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200926184919.GB98875@ravnborg.org>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 29 Sep 2020 07:12:58 +0000
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
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Rob Herring <robh+dt@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 David Airlie <airlied@linux.ie>, Mark Brown <broonie@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/26/20 1:49 PM, Sam Ravnborg wrote:
> Hi Alexandru
> 
> On Thu, Sep 24, 2020 at 03:05:05PM -0500, Alexandru Gagniuc wrote:
>> On the SII9022, the IOVCC and CVCC12 supplies must reach the correct
>> voltage before the reset sequence is initiated. On most boards, this
>> assumption is true at boot-up, so initialization succeeds.
>>
>> However, when we try to initialize the chip with incorrect supply
>> voltages, it will not respond to I2C requests. sii902x_probe() fails
>> with -ENXIO.
>>
>> To resolve this, look for the "iovcc" and "cvcc12" regulators, and
>> make sure they are enabled before starting the reset sequence. If
>> these supplies are not available in devicetree, then they will default
>> to dummy-regulator. In that case everything will work like before.
>>
>> This was observed on a STM32MP157C-DK2 booting in u-boot falcon mode.
>> On this board, the supplies would be set by the second stage
>> bootloader, which does not run in falcon mode.
>>
>> Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
> 
> One nitpick here. The binding should be present in the tree before
> you start using it. So this patch should be applied after the binding.

It is :)
   * arch/arm/boot/dts/stm32mp15xx-dkx.dtsi

Alex

> One detail below - I think others have already commented on the rest.
[snip]
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
