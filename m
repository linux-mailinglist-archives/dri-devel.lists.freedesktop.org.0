Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2DC9584234
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jul 2022 16:52:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91C1210EE62;
	Thu, 28 Jul 2022 14:52:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C88610E643
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jul 2022 14:52:11 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id l22so2488799wrz.7
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jul 2022 07:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=mD3MJdwe1M/MeC+R1sdMr+F5YiHskPdcW+5CKgvwmK4=;
 b=iUGg/CrWW+MiUyA/mg1p5vzybXCg3jUouFcnlHWaVGqFxrhWwizVOpH2IkQW7szJma
 iOC8pfSoe7ZZfKyDF4gvUHQ1mUov9IdU4wV/+Mk1J7/6KN37cdUlC+pfFtyERNyzfFQj
 XuXVRdDr902PQSnkrr2MmHMUyQOnyMt+G6aCUtLTlLNZevb2z6wAE/CSG6KVdMXRmpm8
 ED78UkYZK4M8/tXowcNICLq+pGO/J8ezajSuCEvi2D0KxuSH13LKj59MYbAgyvHaYjcX
 0YwhkT39e7Dt+m1ZkNZv8VMP/qameaFdsVlmPPWo0SK5lvvQBzhpDyw+irGhUosn662C
 rCVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=mD3MJdwe1M/MeC+R1sdMr+F5YiHskPdcW+5CKgvwmK4=;
 b=I85i9WovGD6Sm7DKFPPmqUM1qHp8bQ4MV0DsdYityO0ScO3lBt8rau2Mo8o+7roMRh
 iUzxTt0tAuH6Ya5BjW4OiLVpoa5ajPMnUo7SSCi6EC2z8TV0GWlTjGdAQ9t/I4SiLKN1
 VduzPtuAwoCvziWwjEK04b7FOiNQuo0wa2Fy/jggEKZC+pxXCEmnRg8DszdFQJS352O8
 kd9MZE74s2tKu6dzWuX7BvucR+NfxH5EY+tzoT0AS07EKaCZIiPxtKllg22/+KFF34VL
 gh91pRZBs3w1QL9g7yczEtdpG/U5MyVrA8NDKXSy3utqHn24r2XLiyoCAh1mNQl5A2TY
 6SzQ==
X-Gm-Message-State: AJIora94E74Ns2kvo5aplzyKFKbKzhN0q+7goUadEOHfpJHdqibxzAw7
 /W721Lj4MLFwId3y6lQ6hJg=
X-Google-Smtp-Source: AGRyM1sGc5o3vzAllmoqiOc4kg6oAhY9pYH2gIOcTuw0tQ66DwxqCUNnE+4m3BL7R0boMJmgLYXsBg==
X-Received: by 2002:a05:6000:1f0e:b0:21e:87c9:6b55 with SMTP id
 bv14-20020a0560001f0e00b0021e87c96b55mr13834716wrb.326.1659019929483; 
 Thu, 28 Jul 2022 07:52:09 -0700 (PDT)
Received: from [0.0.0.0] ([185.246.188.60]) by smtp.gmail.com with ESMTPSA id
 q14-20020adff94e000000b0021d7b41255esm1122958wrr.98.2022.07.28.07.52.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Jul 2022 07:52:09 -0700 (PDT)
Message-ID: <30ce6f21-0a91-81cb-8b03-5acff17c59ee@gmail.com>
Date: Thu, 28 Jul 2022 17:52:04 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/2] efi: earlycon: Add support for generic framebuffers
 and move to fbdev subsystem
Content-Language: en-US
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20220728142824.3836-1-markuss.broks@gmail.com>
 <20220728142824.3836-3-markuss.broks@gmail.com> <YuKfnAjB4gV0ki4A@kroah.com>
From: Markuss Broks <markuss.broks@gmail.com>
In-Reply-To: <YuKfnAjB4gV0ki4A@kroah.com>
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

On 7/28/22 17:39, Greg Kroah-Hartman wrote:
> On Thu, Jul 28, 2022 at 05:28:19PM +0300, Markuss Broks wrote:
>> Add early console support for generic linear framebuffer devices.
>> This driver supports probing from cmdline early parameters
>> or from the device-tree using information in simple-framebuffer node.
>> The EFI functionality should be retained in whole.
>> The driver was disabled on ARM because of a bug in early_ioremap
>> implementation on ARM.
>>
>> Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
>> ---
>>   .../admin-guide/kernel-parameters.txt         |  12 +-
>>   MAINTAINERS                                   |   5 +
>>   drivers/firmware/efi/Kconfig                  |   6 +-
>>   drivers/firmware/efi/Makefile                 |   1 -
>>   drivers/firmware/efi/earlycon.c               | 246 --------------
>>   drivers/video/fbdev/Kconfig                   |  11 +
>>   drivers/video/fbdev/Makefile                  |   1 +
>>   drivers/video/fbdev/earlycon.c                | 301 ++++++++++++++++++
>>   8 files changed, 327 insertions(+), 256 deletions(-)
>>   delete mode 100644 drivers/firmware/efi/earlycon.c
>>   create mode 100644 drivers/video/fbdev/earlycon.c
> 
> That should be a rename, not a delete/create, right?

Should this change be split into two separate commits,
one for moving the file and the second for making changes?

> 
> thanks,
> 
> greg k-h

- Markuss
