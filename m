Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B78639C6A
	for <lists+dri-devel@lfdr.de>; Sun, 27 Nov 2022 19:39:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19A0D10E0D8;
	Sun, 27 Nov 2022 18:39:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52A9B10E0D8
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Nov 2022 18:38:58 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id b12so13696179wrn.2
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Nov 2022 10:38:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:subject:from:content-language:to
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vwq6qFXHDqhBsWvFmy1SXCyyt9IdJPeKBESzC1OXL/Y=;
 b=Z/MppwYXQxgrZHk8hHpXd1gorWFOw7KyGzwO7v9GtL8PFnia9r4TrFsXu5s2cW1K7S
 Wz1QDnYblZ1EsVfnexc+aWhrJWLNVqBDvUAQIleZVgvnNORlcKYoHnJaYXjEjFdu/yXi
 dcSslwdxjm2zlaXfMgd8mOLh+DU5yTYK8qnJbNCrCdWTy1s8iyT1F8VmWNOgryj+w5Xv
 oss2nhxQC0Ih808G59/Pe8QkPpaDafdwNu5lbNM3h4eyjia9voKOdhiYMpgRRIfbDhj8
 cvWlELcetnep/UNy1dg46Dntr3ySb+U5MXnL2bpKXs5KRs/pyKq+oK9jfVOYA+MK+g2G
 gpwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:subject:from:content-language:to
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=vwq6qFXHDqhBsWvFmy1SXCyyt9IdJPeKBESzC1OXL/Y=;
 b=io9rbwYc5LmY7ySUncdxjIS1dsy9oXhTklnPqKbyaA0wtzV6/2e3QbuDdJhOeYSBUh
 u0ZNoJkKcQbdjzvbBaFQCSoQdJSf+7Fkv2uqy48Xhime6l/Av1bPVRW4vVN8mMaNGVA+
 tyvDbd+5CVtk7jsS17VwlL3osYWf2XHHPEsii2n3TlazSVrrrWV53Tj2AzOBQ5ns221B
 k1ilTsdtxVDj872w8f2qexASjGsnOyGF4vazJ91AxftCEswMQPR6Nb9IPbn+C0cm3r3d
 HV8JPuzZL6JnS0NqrG4BP52oOYnCNHbri4qRyw2BaIC79Y6kFyK5fYdLD6xXf0PnLpKo
 Uq0w==
X-Gm-Message-State: ANoB5pl4kD8Cf+EaHq0xd5hG5/0vZx1vMvfAlbTxDXdj0eHSmJqgaUkz
 fOLEbmV5PP2hIzEvK1BKgyhQXS1rax8=
X-Google-Smtp-Source: AA0mqf4d8vZfV8vXarzLjWNV7cMyUW7YDzlTpzmWv/RCFjU4yRQrYawoqSOIsa/i5svCwtiLbo5Rhw==
X-Received: by 2002:a5d:69c5:0:b0:242:17a6:8ed with SMTP id
 s5-20020a5d69c5000000b0024217a608edmr765059wrw.176.1669574336239; 
 Sun, 27 Nov 2022 10:38:56 -0800 (PST)
Received: from [192.168.1.5] ([88.157.25.241])
 by smtp.gmail.com with ESMTPSA id
 g6-20020adffc86000000b00241c4bd6c09sm8805731wrr.33.2022.11.27.10.38.55
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Nov 2022 10:38:55 -0800 (PST)
Message-ID: <2ba015bc-9d8b-f4d7-dc96-24003be51ec9@gmail.com>
Date: Sun, 27 Nov 2022 18:38:54 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
To: dri-devel@lists.freedesktop.org
Content-Language: pt_PT, en-GB
From: Rui Oliveira <ruimail24@gmail.com>
Subject: Help with LCD panel driver for sunxi embedded device: Jinglitai
 JLT4013A
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

First of all, let me say I'm new to this, so please bear with me.

Here's the situation:

I have a radio [1] that runs a Linux OS over an AllWinner SoC. Pretty 
much everything hardware-wise is on the mainline kernel, except for the 
LCD panel driver. As (surprise, surprise), the vendor wouldn't comply 
with their GPL mandate of sharing the kernel sources, I wrote the panel 
driver. This is my first driver. I wrote it by looking at similar code 
and with some help from Ghidra.

In [2] you can find the repository with my driver. Yes, it's 
out-of-tree, but it simplified my usage with Buildroot, with my repo 
available in [3].

My main problem right now is that while I can boot the image I 
configured, the panel doesn't display a thing. It does turn on the 
backlight tho.

I tried writing random garbage to `/dev/fb0` directly, I tried running 
`kmscube`... Nothing...

In [4] you can find the boot log as of now. It also shows some error 
messages when I try to run `kmscube` on L308. Please look at lines 
256-266, 272-276, and 309. Many of those messages are `printk` calls in 
my code (that I added to try and debug this).

Additional info: Buildroot uses mainline kernel. Latest version is using 
5.17, and you can find the kernel defconfig in [3], under 
br2_external/board/X6100/linux/sun8i-r16-x6100_defconfig.

The driver is currently being loaded via `modprobe` but I have tried 
just making it a *.patch file for the kernel, with same results.

The only significant differences from my driver to the vendor's is that 
they have a `st7701s_enable()` and a `st7701s__disable()` that do 
nothing and just return 0. I just didn't write these functions and 
didn't add them to `static struct spi_driver jlt4013a_driver`. I suppose 
that's not really what's making the difference? For completeness, they 
use the `st7701s_` prefix because that's the controller on the panel.

Anything, if you have any pointers of how can I do more than just have a 
panel with a backlight now, I'd appreciative all the help. I'm on the 
IRC OFTC channel #dri-devel as LordKalma, and I have a bouncer, so I'm 
always on and logging. Feel free to contact me there as well.

Thank you!

[1] https://www.radioddity.com/products/xiegu-x6100
[2] https://github.com/ruilvo/panel-jinglitai-jlt4013a
[3] https://github.com/ruilvo/AetherX6100
[4] 
https://gist.github.com/ruilvo/60fa52113cad7ecbd61a07c284f81fc5#file-bootlog-txt

