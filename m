Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2163A700353
	for <lists+dri-devel@lfdr.de>; Fri, 12 May 2023 11:06:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E30A10E64A;
	Fri, 12 May 2023 09:06:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF85210E64A
 for <dri-devel@lists.freedesktop.org>; Fri, 12 May 2023 09:06:08 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-6434e65d808so10274544b3a.3
 for <dri-devel@lists.freedesktop.org>; Fri, 12 May 2023 02:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683882368; x=1686474368;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BUkwR5dAglmPcY5nHDbrbDUmEm/Czvqol0O0KFuiob8=;
 b=EsOpvrz8oFiaamtTwXnlCFLbdqUpYc15ryzTzPnULkAUJ5PsxIC2FamepHTQ9vxJUo
 7hiFmErMgyPGoSAse+smqWasoWMlfVSh9GD2osKdeABJHg67mA/iS8vuIoGsYTfrBRPr
 5WH6Dw5j5eH+bxMRz4bxS0CwpwjCN4Qqw/CB/ON2fcHX3iht/v64JwKi8JHqb2vltP3z
 LogBmtroPw5FGg3+H9+h0WXdJKJsbQaY6sUo8vQkr+LpWZmk7bZT0gatzGfQFcbJiJo9
 k1j0c1nZZLck2LHRMCfiuE+xDGZtdcpoZubsCR3JCv27zPXiBadfozdQhAc1w7smV2PR
 uBZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683882368; x=1686474368;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BUkwR5dAglmPcY5nHDbrbDUmEm/Czvqol0O0KFuiob8=;
 b=RWHKqhcGZgUGv068vENAkqwPw0dGb9NFKlxiqnb8SidOZ55/NDfDAStKsNbyjNK1Ww
 avAmulckGAdd1RfUChvuzJ/v32oHHo2mK4z5pGy4qWWh6SrvaOMFSq5knU7hJu8A2E0h
 Q5/X7lE/hH1Q6nn9b/zPaHYHfowgXc/Lz4GCeeN1CANJpEN+YgpOlIv3lEibabZ8v3Bs
 1xYnMJ3n2LNccFhdWeK+fppVCLQo15Msv9UUP9JwFW0T+IK5W+DConD7u4E2Mwo6CgwF
 0GAxvC9YDrINdOkqGoMlabTU71MGqweGX1goYZWAC0Xut2FwlHwI2u5rgy/5WV0gmI9f
 echg==
X-Gm-Message-State: AC+VfDxwDPL16ZZ/9D2hzJHzEJUqD+FiB97z8uEkzJii8MoP3ZSXP05b
 Bt2vGNA/3c/cqChMHM3fWQI=
X-Google-Smtp-Source: ACHHUZ4DD4qzlVtl1MATp+SSQ4wN/DopjFHr357B6Org73qjEYGN3SP7rZVm5nzvAwWRUD4DmIZ0jQ==
X-Received: by 2002:a05:6a00:1747:b0:644:ad29:fd5a with SMTP id
 j7-20020a056a00174700b00644ad29fd5amr27781559pfc.21.1683882367855; 
 Fri, 12 May 2023 02:06:07 -0700 (PDT)
Received: from [192.168.43.80] (subs32-116-206-28-8.three.co.id.
 [116.206.28.8]) by smtp.gmail.com with ESMTPSA id
 a4-20020a62bd04000000b006413d1dc4adsm6584368pff.110.2023.05.12.02.05.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 May 2023 02:06:07 -0700 (PDT)
Message-ID: <2883e834-eccd-937e-0f3e-2d787994d4cf@gmail.com>
Date: Fri, 12 May 2023 16:05:52 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 08/10] drivers: watchdog: Replace GPL license notice with
 SPDX identifier
To: Guenter Roeck <linux@roeck-us.net>
References: <20230511133406.78155-1-bagasdotme@gmail.com>
 <20230511133406.78155-9-bagasdotme@gmail.com>
 <46c263f6-dd9c-408c-b3e0-bfb2676c6505@roeck-us.net>
Content-Language: en-US
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <46c263f6-dd9c-408c-b3e0-bfb2676c6505@roeck-us.net>
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 Dan Carpenter <error27@gmail.com>, Tom Rix <trix@redhat.com>,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Eric Dumazet <edumazet@google.com>, Viresh Kumar <viresh.kumar@linaro.org>,
 Pavel Machek <pavel@ucw.cz>, Jonas Jensen <jonas.jensen@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Gaosheng Cui <cuigaosheng1@huawei.com>, Andy Gospodarek <andy@greyhouse.net>,
 Sylver Bruneau <sylver.bruneau@googlemail.com>,
 Davidlohr Bueso <dave@stgolabs.net>, Marc Zyngier <maz@kernel.org>,
 Linux Staging Drivers <linux-staging@lists.linux.dev>,
 Minghao Chi <chi.minghao@zte.com.cn>,
 Yang Yingliang <yangyingliang@huawei.com>,
 "Steven Rostedt \(Google\)" <rostedt@goodmis.org>,
 Archana <craechal@gmail.com>, Simon Horman <simon.horman@corigine.com>,
 Jacob Keller <jacob.e.keller@intel.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Andrey Panin <pazke@donpac.ru>,
 Sam Creasey <sammy@sammy.net>,
 Linux Watchdog Devices <linux-watchdog@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Manivannan Sadhasivam <mani@kernel.org>,
 Jay Vosburgh <j.vosburgh@gmail.com>, Kalle Valo <kvalo@kernel.org>,
 Jan Kara <jack@suse.com>,
 Linux Kernel Actions <linux-actions@lists.infradead.org>,
 Oleg Drokin <green@crimea.edu>, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Andrew Sharp <andy.sharp@lsi.com>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Ray Lehtiniemi <rayl@mail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Alessandro Zummo <a.zummo@towertech.it>, Karsten Keil <isdn@linux-pingi.de>,
 Deepak R Varma <drv@mailo.com>, Linux Networking <netdev@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>,
 Denis Turischev <denis@compulab.co.il>,
 Diederik de Haas <didi.debian@cknow.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "David S. Miller" <davem@davemloft.net>, Daniel Mack <daniel@zonque.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/11/23 22:08, Guenter Roeck wrote:
>> +/* SPDX-License-Identifier: GPL-2.0-only */
> 
> This was supposed to be a C++ style comment for C source files.
> Has the rule changed ?
> 

Oops, I don't see checkpatch. Will fix.

>> +/* SPDX-License-Identifier: GPL-2.0-only */
> 
> The text below suggests that this should be GPL1+.
> 

OK, will fix.

Thanks for review!

-- 
An old man doll... just what I always wanted! - Clara

