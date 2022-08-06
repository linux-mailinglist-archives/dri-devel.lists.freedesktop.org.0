Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2514358B6F6
	for <lists+dri-devel@lfdr.de>; Sat,  6 Aug 2022 18:36:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AC2611B467;
	Sat,  6 Aug 2022 16:32:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76910113C5C
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Aug 2022 16:26:26 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id x21so6746493edd.3
 for <dri-devel@lists.freedesktop.org>; Sat, 06 Aug 2022 09:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=ORTACdD1UW9t4Zw+2hPKbY3+gRbBdfvtSFXUJvzJI0g=;
 b=gKqaCN0iMjSZA6LUkwAJEZ4Tct5Zbw0Py7JVP0F55ez3/3bnw5zck2VnzIBkF6zCSR
 iFpBJ4WCt5no7HkW4DDiTSc+NvQjHog77T/RctapssG8fPsFmYAmiIkMqjNzBFM35SYD
 bb1zMd6OHg9N6JjuHUcPGY/tSWDD2zizDGid9Z+EIsWFMSD6oOQKBgHh+5iH33Ox4fNR
 eiAXn7PGctPdoT9zTGnrT1rFeWWSEI2ewhTgyzuac83DOpbC9ln+lYJQReP1doiv8kV5
 0X1ngZ6F4qlgUW/UBp6kamtPZAQbx8A51zga2Kx782KDHiT3wiPsEElpPSfa7SGiMTz3
 0agA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=ORTACdD1UW9t4Zw+2hPKbY3+gRbBdfvtSFXUJvzJI0g=;
 b=1d0rRc3YzsldfvCwMsK1sZuterkFQgjFF5Trzp3hE/55ikiSd7j5iJTuTmWiPSTuai
 izOyJ7p/yFsit1E32qcvXMQ6Sy4SZsPajPFJ2ZXP3caJq4+B0o9hafDbOVmySFhai8c0
 iy9aqqbYUYBSC3l6uI2ZHKhaf/4nG+A996uyaJvpnAT7d/PnVHkS9AH6BAHohZ4pNEvG
 VfLbaldNVK6obJiMkyKTsv7EpJyvOOz/YxbROvtKKfETZ+jfKMoND4vq9HFwT8nZOKit
 PQFnKynMfslb0acnX0IfGOimlbFcbD1I8yaZzizz3cOXm1Ea5HsFQXehaDr/uj0B04AS
 bZfg==
X-Gm-Message-State: ACgBeo2+i80rh9E1Fs1t7KqaQMSRSAP2kLugHwiykYDf4/ocq+ZcLjJs
 hBqdJwboD4NNDbccrI5JN1s=
X-Google-Smtp-Source: AA6agR7+6RjICx//F5Wg18tQ05niWDE34yGNmMysb+FYhy/e2rrFtB5IKDoqwlj03I0XZsw2ObdVYA==
X-Received: by 2002:a05:6402:190b:b0:43d:d001:2cce with SMTP id
 e11-20020a056402190b00b0043dd0012ccemr11094395edz.326.1659803184703; 
 Sat, 06 Aug 2022 09:26:24 -0700 (PDT)
Received: from [192.168.3.10] (tor-exit-50.for-privacy.net. [185.220.101.50])
 by smtp.gmail.com with ESMTPSA id
 e12-20020a50fb8c000000b0043a78236cd2sm1663625edq.89.2022.08.06.09.26.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 06 Aug 2022 09:26:24 -0700 (PDT)
Message-ID: <27b40940-b8a7-2755-1ef5-e97d6b35dd2a@gmail.com>
Date: Sat, 6 Aug 2022 19:26:07 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/2] efi: earlycon: Add support for generic framebuffers
 and move to fbdev subsystem
Content-Language: en-US
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20220728142824.3836-1-markuss.broks@gmail.com>
 <20220728142824.3836-3-markuss.broks@gmail.com> <YuKfnAjB4gV0ki4A@kroah.com>
 <30ce6f21-0a91-81cb-8b03-5acff17c59ee@gmail.com> <YuKkxb7u3piHytJ8@kroah.com>
From: Markuss Broks <markuss.broks@gmail.com>
In-Reply-To: <YuKkxb7u3piHytJ8@kroah.com>
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
Cc: linux-fbdev@vger.kernel.org, linux-efi@vger.kernel.org,
 linux-doc@vger.kernel.org, Tony Lindgren <tony@atomide.com>,
 dri-devel@lists.freedesktop.org, Wei Ming Chen <jj251510319013@gmail.com>,
 phone-devel@vger.kernel.org, Jiri Slaby <jirislaby@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Jonathan Corbet <corbet@lwn.net>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Javier Martinez Canillas <javierm@redhat.com>, linux-serial@vger.kernel.org,
 Borislav Petkov <bp@suse.de>, Kees Cook <keescook@chromium.org>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 ~postmarketos/upstreaming@lists.sr.ht,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Michal Suchanek <msuchanek@suse.de>, Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>, Helge Deller <deller@gmx.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Greg,

On 7/28/22 18:01, Greg Kroah-Hartman wrote:
> On Thu, Jul 28, 2022 at 05:52:04PM +0300, Markuss Broks wrote:
>> Hi Greg,
>>
>> On 7/28/22 17:39, Greg Kroah-Hartman wrote:
>>> On Thu, Jul 28, 2022 at 05:28:19PM +0300, Markuss Broks wrote:
>>>> Add early console support for generic linear framebuffer devices.
>>>> This driver supports probing from cmdline early parameters
>>>> or from the device-tree using information in simple-framebuffer node.
>>>> The EFI functionality should be retained in whole.
>>>> The driver was disabled on ARM because of a bug in early_ioremap
>>>> implementation on ARM.
>>>>
>>>> Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
>>>> ---
>>>>    .../admin-guide/kernel-parameters.txt         |  12 +-
>>>>    MAINTAINERS                                   |   5 +
>>>>    drivers/firmware/efi/Kconfig                  |   6 +-
>>>>    drivers/firmware/efi/Makefile                 |   1 -
>>>>    drivers/firmware/efi/earlycon.c               | 246 --------------
>>>>    drivers/video/fbdev/Kconfig                   |  11 +
>>>>    drivers/video/fbdev/Makefile                  |   1 +
>>>>    drivers/video/fbdev/earlycon.c                | 301 ++++++++++++++++++
>>>>    8 files changed, 327 insertions(+), 256 deletions(-)
>>>>    delete mode 100644 drivers/firmware/efi/earlycon.c
>>>>    create mode 100644 drivers/video/fbdev/earlycon.c
>>>
>>> That should be a rename, not a delete/create, right?
>>
>> Should this change be split into two separate commits,
>> one for moving the file and the second for making changes?
> 
> Git will show a rename and modification properly, if you use -M to git
> format-patch, so it should be fine.

It appears that there are so many changes Git would refuse to make it a 
"move" no matter what I do. What should be done here: should it be two 
separate commits for move/change or should it just be kept as delete/create?

- Markuss
