Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE94558426B
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jul 2022 16:58:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF7D310ECF0;
	Thu, 28 Jul 2022 14:58:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DFAD10FFF0
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jul 2022 14:58:22 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id fy29so3566327ejc.12
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jul 2022 07:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=tTSXNaw/6JZLwn2P0PGnuQ0WLB4Qu3elZxHzblM8fpU=;
 b=c1vY1amK3SSb5Sk378Tzj2r3I4dfUYqRyR9XZ9mgTFi9sNzZ23GuRdYijNYiu2eX53
 fdsboL/PunLjY5acbyZT/0UEAs/liP15aCEuppzTzwjXwLcsMMG5jUeuBECGpO9nnuUX
 zXpoNt5vlZnf/4pVrX/7785OC8FVRcxwc0TqmFIbS3cqjDUejPDzp/8oEdwWPd363GbD
 0+UmnBhekSdZkddQnF1bwWpmJ7EQAIdBvhqlsKgwl01vpePNvsgcCfHirsTZTdhj3Ady
 NAWy/pA/+lGohtpaER7TXv1dWORYSk4JeTwNjJx2pzEAFaZ8Yj+Nqowj9RPJbPa7Qiaw
 HazQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=tTSXNaw/6JZLwn2P0PGnuQ0WLB4Qu3elZxHzblM8fpU=;
 b=JPl3ALoULRU6u/jAqNdm5TYWK6WCV15TQJc4mM9Vrz7hwtql14CcUy0nju7njiGx5e
 z5HZSzIzgBizp+2ayCvDScVPotYF9chDmLCGOTG9t9dzKc18r1/ffaWa6hpehXlVc1Eo
 Pf/0jMUFQBCjQLUzIGlFBt20r0Wl1VzZ+9x0YI0Aw/ojwsuYWT8mcv7+HdQWa2Ir3KHF
 1StsIY+vldfwE/8/RFBL4LIwyV4wbZav4Px7BDYHLRaMIX5TQyX6HJm6EmgkGU1Ftvtr
 kVzAOUhqSvTJSMB26Wq9QQ0AoYzDy813I1N3067SbYqkvIf7BsWrnS58SLnq123aa99h
 D5fw==
X-Gm-Message-State: AJIora+HLIKoVZeg+kY9yBj9RUBEqA0o9Ab5lSxJAJdFvUF/Yadlp4H4
 vBa5rQTIHP0fneAms1LX7ek=
X-Google-Smtp-Source: AGRyM1upxJMWgGwceVicP+qb2cN5gr+enz0dwc0rY8PAmdQ62kOzzpZJEXUWQxNPjQhxhTMGjnE7kA==
X-Received: by 2002:a17:907:6818:b0:72b:5bac:c3a3 with SMTP id
 qz24-20020a170907681800b0072b5bacc3a3mr20623516ejc.139.1659020301357; 
 Thu, 28 Jul 2022 07:58:21 -0700 (PDT)
Received: from [0.0.0.0] (tor-exit-60.for-privacy.net. [185.220.101.60])
 by smtp.gmail.com with ESMTPSA id
 cq3-20020a056402220300b0043bc300c499sm827109edb.79.2022.07.28.07.58.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Jul 2022 07:58:21 -0700 (PDT)
Message-ID: <8e694cb6-c3dc-74e3-6804-fc532f108523@gmail.com>
Date: Thu, 28 Jul 2022 17:57:58 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/2] efi: earlycon: Add support for generic framebuffers
 and move to fbdev subsystem
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>
References: <20220728142824.3836-1-markuss.broks@gmail.com>
 <20220728142824.3836-3-markuss.broks@gmail.com>
 <CAK8P3a2fZ9O6vSEyxY1KW71pG_Oyvwxp3zTbW2GuaSD6aj+Qfw@mail.gmail.com>
From: Markuss Broks <markuss.broks@gmail.com>
In-Reply-To: <CAK8P3a2fZ9O6vSEyxY1KW71pG_Oyvwxp3zTbW2GuaSD6aj+Qfw@mail.gmail.com>
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 linux-efi <linux-efi@vger.kernel.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Tony Lindgren <tony@atomide.com>, dri-devel <dri-devel@lists.freedesktop.org>,
 Wei Ming Chen <jj251510319013@gmail.com>, phone-devel@vger.kernel.org,
 Jiri Slaby <jirislaby@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 Borislav Petkov <bp@suse.de>, Kees Cook <keescook@chromium.org>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 ~postmarketos/upstreaming@lists.sr.ht,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Michal Suchanek <msuchanek@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>, Helge Deller <deller@gmx.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Arnd,

On 7/28/22 17:48, Arnd Bergmann wrote:
> On Thu, Jul 28, 2022 at 4:28 PM Markuss Broks <markuss.broks@gmail.com> wrote:
>>
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
> 
> It looks like this is not actually related to fbdev, and since drivers are
> moving from fbdev/simplefb towards drm/simpledrm, maybe it would be
> better to put this into either drivers/gpu/drm/tiny/ or possibly
> drivers/video/console to let this be used without enabling fbdev?

Ideally this shouldn't depend on anything, because it isn't utilizing 
any of fbdev code and won't be utilizing any of drm/console code. I 
agree that either of those would be a better place for it, but which one 
do you think would suit more for this driver?

> 
>          Arnd

- Markuss
