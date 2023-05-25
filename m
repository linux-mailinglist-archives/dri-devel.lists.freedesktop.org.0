Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7831C710B31
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 13:37:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A5FE10E147;
	Thu, 25 May 2023 11:37:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AAA410E13B;
 Thu, 25 May 2023 11:37:13 +0000 (UTC)
Received: by mail-pg1-x52d.google.com with SMTP id
 41be03b00d2f7-52c30fa5271so883612a12.0; 
 Thu, 25 May 2023 04:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685014632; x=1687606632;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=bpoqTGANSvPTQ+4PNFj1GLF9MOcWPcMcj3p/SZnEbkM=;
 b=eIjOgio+ExogfDH2wSaqi+j5JxdcrsgldC9+BGYiEtJ2xmaiXbZuwYZS54QDo1wWjd
 F1ZGR0V9/CdATW8K1/uvthpJ/77byJ61spgB6QN4h1jAC1J38dcZZ8FmJtDroLxYl544
 hr8nuomXEv0Vq5LwPtdEHolGOuJp5uJn4W4IiPYzq53c/wUjd6jADzW9l4EZGzF5mgjQ
 WPJk46VOYGoCLOpUOHLqwFqRMesHq4ZAU8yoYN2u1RszgDvpcHQ5OCwbgOK6uaZxcxeA
 bUwl67mAPRPnO0gWan4vltL4heANh2FYcAxcDGfyfjdhWOuCXG3raVer/HB39RXr9D6V
 PuRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685014632; x=1687606632;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bpoqTGANSvPTQ+4PNFj1GLF9MOcWPcMcj3p/SZnEbkM=;
 b=ctBoKBtfHOn7ZqfoiNqM5fpthDn58wcNQszUBaE4/EY513szn5fDhfg5UiDclEx6IG
 dL3Mkj9Cc4EvzOe5sEWSx58rCgJ9QixRpdr/DfBcNm2MRilvthwCWcp9NyZl6SYy4kqa
 E6JHoxs/bRCCgjg7RlSJX+FfiAvAeShGFE6wUf76bZSWQSzSuq46RTWM+73/lyrFoR6W
 zLLAJRv71epNgsdwYUEoZgIGDMvuMR3DLggfywzA5MMW/1xRO/WDEeAsOlJPO3HTFxjp
 jKIEnB/LTzg5N9ybI6UWufd5snYuJdEUCyw0Xemq1Z/0FleFuRZnTysJW9nRCZTkR/iy
 ATig==
X-Gm-Message-State: AC+VfDw0zbkJpHZT87zHcJsbioGi8bc3yyQT8B7m5FgHEmO5EFSuur2f
 SLVv4eGVT0HjAM0sl8PaFBg=
X-Google-Smtp-Source: ACHHUZ46Pcklm9huaHbWugVZwP57r8I6MP0/aUVXPUVrhzGNExxVKfBuqyVYimUrxTpzefiM8MpHqw==
X-Received: by 2002:a17:902:e543:b0:1b0:26e:7648 with SMTP id
 n3-20020a170902e54300b001b0026e7648mr131472plf.11.1685014632421; 
 Thu, 25 May 2023 04:37:12 -0700 (PDT)
Received: from [192.168.43.80] (subs02-180-214-232-68.three.co.id.
 [180.214.232.68]) by smtp.gmail.com with ESMTPSA id
 j7-20020a17090276c700b0019c13d032d8sm1211419plt.253.2023.05.25.04.37.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 May 2023 04:37:11 -0700 (PDT)
Message-ID: <b34c7037-7f4b-e4bb-dac8-48bbbade327c@gmail.com>
Date: Thu, 25 May 2023 18:37:05 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: Fwd: absent both plymouth, and video= on linu lines, vtty[1-6]
 framebuffers produce vast raster right and bottom borders on the larger
 resolution of two displays
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>,
 Linux Framebuffer <linux-fbdev@vger.kernel.org>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Linux Nouveau/NVIDIA <nouveau@lists.freedesktop.org>,
 Linux Stable <stable@vger.kernel.org>
References: <e8f93560-a2f6-8e9f-031a-88d333482a31@gmail.com>
 <585f36f8-431a-e929-0a04-ffb65f02e9df@gmail.com>
Content-Language: en-US
In-Reply-To: <585f36f8-431a-e929-0a04-ffb65f02e9df@gmail.com>
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
Cc: Antonino Daplas <adaplas@gmail.com>, Karol Herbst <kherbst@redhat.com>,
 Helge Deller <deller@gmx.de>, Felix Miata <mrmazda@earthlink.net>,
 Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/25/23 17:55, Bagas Sanjaya wrote:
> On 5/25/23 17:52, Bagas Sanjaya wrote:
>> Hi,
>>
>> I notice a regression report on Bugzilla [1]. Quoting from it:
>>
>>> Original Summary:
>>> absent both plymouth, and video= on linu lines, vtty[1-6] framebuffers produce vast raster right and bottom borders on the larger resolution of two displays
>>>
>>> To reproduce:
>>> 1-connect two unequal native resolution displays to a Tesla or Firmi GPU
>>> 2-don't have plymouth in use (I don't ever have it installed, so don't know whether it impacts)
>>> 3-don't include e.g. video=1440x900@60 directive on Grub's linu lines
>>> 4-boot Tumbleweed or Fedora 38
>>> 5-switch to a vtty, e.g. Ctrl-Alt-F3
>>>
>>> Actual behavior:
>>> 1-Both displays utilize the resolution (same pixel grid) of the lower resolution display
>>> 2-Lower resolution display behaves as expected (light text on black background)
>>> 3-Higher resolution display uses same pixels as lower resolution display, with light text on black background, leaving right side and bottom raster instead of black
>>>
>>> Expected behavior:
>>> 1-Both displays utilize the resolution (same pixel grid) of the lower resolution display
>>> 2-Lower resolution display behaves as expected
>>> 3-Entire higher resolution display's background is black instead of portions in raster
>>>
>>> Workaround: add e.g. video=1440x900@60 to Grub's linu lines, which causes both displays to use the same nominal mode on the full display space.
>>>
>>> Typical other linu line options:
>>> noresume consoleblank=0 net.ifnames=0 ipv6.disable=1 preempt=full mitigations=none
>>>
>>> My Tesla has HDMI and DVI outputs, tested with 1920x1200 and 1680x1050 displays.
>>> My Fermi has dual DisplayPort, tested with 2560x1440 and 1680x1050 displays.
>>> Occurs Tumbleweed with 6.3.2 and 6.2.12 kernel-default, and with 6.2.15 on Fedora 38, and (partially with Tesla, right side only) with 6.2.12 and 6.3.3 on Mageia 9.
>>> Does not occur with 6.1.12 kernel-default on NVidia, or with AMD Caicos (Terascale2) GPU, or with Intel Eaglelake GPU.
>>> Tested only on legacy booting (no UEFI support).
>>> Others might describe what I call "raster" as multicolored snow.
>>
>> See bugzilla for the full thread and attached dmesg.
>>
>> Anyway, I'm adding it to regzbot:
>>
>> #regzbot introduced: v6.1.12..v6.2.12
>> #regzbot title: vast raster right and bottom borders on larger display (two displays with inequal resolution) unless forcing resolution with video= parameter
>>
> 
> Oops, I forget to add bugzilla link:
> 
> #regzbot introduced: v6.1.12..v6.2.12 https://bugzilla.kernel.org/show_bug.cgi?id=217479
> #regzbot from: Felix Miata <mrmazda@earthlink.net>
> 

Oops, again, I messed up the regzbot entry (reporter field still assigned
to me). Inconclusiving...

#regzbot inconclusive: Wrong reporter assigned (from: doesn't take effect)

Please ignore this thread as I will send a new one with proper regzbot
commands.

Thanks.

-- 
An old man doll... just what I always wanted! - Clara

