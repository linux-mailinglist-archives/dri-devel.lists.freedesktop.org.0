Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2062370035E
	for <lists+dri-devel@lfdr.de>; Fri, 12 May 2023 11:07:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 718FF10E655;
	Fri, 12 May 2023 09:07:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A105210E655
 for <dri-devel@lists.freedesktop.org>; Fri, 12 May 2023 09:07:47 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-24e5d5782edso9090135a91.0
 for <dri-devel@lists.freedesktop.org>; Fri, 12 May 2023 02:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683882466; x=1686474466;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oseHv6VTSzckslEr5MWLMD1wKR85pm76Ym5jt2vFoxI=;
 b=XjEIPEkNIvghUZ4sYuX1fCWrgg44BfoxhHVaks66vlF5xl5VUv4r3isABKr/LsYPYw
 Tly6RKPK9BcyMqYvoSOgRdb9WA1254+yurUnYVBO0DpOoyToddB4r3IDlbeJVvJS+aIS
 cIU73rW7ZyB8UfQOdcYe9RWtl8aAXPzz839ZP++4bXfB0lpVKXJehz/EqhRzVPYRv+B7
 z7mpm7xHQaI6a3VIN/7jkY+uvr6L4PuFjgQ3/VPChSlkqopIjEq5foFvjsooPNWZXn2w
 NREm8Inimbied+1qeFmwZQ/2mm1A2tVHyBhiD6Ze7c52BViC2yJfu7/XZ2TmVWhspGu9
 +Wyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683882466; x=1686474466;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oseHv6VTSzckslEr5MWLMD1wKR85pm76Ym5jt2vFoxI=;
 b=l/dgU6/VRscqcy5kFRCVsNz2DX3IkEuZOQ5j4hJpliJB+d2xb1U2m9u5L94BxtXCzN
 zXm5WTWy1phT8AUH/wYjVvwIFq8O0kI/USENhCDMx+cMmtXCSApEo76FR8+2siC1hQBx
 ixfG+mPmeLtsyztTBZExvd+e8hxH+lVj57X0u13Bs9Z81BVbETdIlQnW7Be3205o6I74
 l5AQmWxrr1KXvHvAHkuLMuv8ZD+7eOTEeZPVW2R5VmLTJHUfnbh/j2byHb4gKwYA58ou
 hfnlNaM6IR/2JCise7UDpxnowI0lSylXrJoBuFksCu+i38z1A9u/5STjfZ83v49nEHv4
 VVmw==
X-Gm-Message-State: AC+VfDwzGejQLCeiVtfg0obDWa1x8wPj6iahZz7krK4k97fbIVV+T9+1
 GW4ChjWPwzs9ENw5Mbb52S0=
X-Google-Smtp-Source: ACHHUZ7+b/oOCYYoASqforqMy2MxURpPVBmI0FXSJlR2iCNI8DK+oJQKKZTGyZQoOcDqitWf1y1ZzA==
X-Received: by 2002:a17:90a:b317:b0:250:78d0:f797 with SMTP id
 d23-20020a17090ab31700b0025078d0f797mr18003584pjr.41.1683882466461; 
 Fri, 12 May 2023 02:07:46 -0700 (PDT)
Received: from [192.168.43.80] (subs32-116-206-28-8.three.co.id.
 [116.206.28.8]) by smtp.gmail.com with ESMTPSA id
 cq2-20020a17090af98200b002508f0ac3edsm8373161pjb.53.2023.05.12.02.07.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 May 2023 02:07:46 -0700 (PDT)
Message-ID: <51c2577a-b9d9-4f6e-e79b-c2c324b72347@gmail.com>
Date: Fri, 12 May 2023 16:07:33 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 00/10] Treewide GPL SPDX conversion (love letter to Didi)
Content-Language: en-US
To: Jakub Kicinski <kuba@kernel.org>
References: <20230511133406.78155-1-bagasdotme@gmail.com>
 <20230511174105.63b7a6ae@kernel.org>
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <20230511174105.63b7a6ae@kernel.org>
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
 Pavel Machek <pavel@ucw.cz>, Robert Jarzmik <robert.jarzmik@free.fr>,
 Gaosheng Cui <cuigaosheng1@huawei.com>, Andy Gospodarek <andy@greyhouse.net>,
 Davidlohr Bueso <dave@stgolabs.net>,
 Linux Staging Drivers <linux-staging@lists.linux.dev>,
 Minghao Chi <chi.minghao@zte.com.cn>,
 Yang Yingliang <yangyingliang@huawei.com>,
 "Steven Rostedt \(Google\)" <rostedt@goodmis.org>,
 Archana <craechal@gmail.com>, Simon Horman <simon.horman@corigine.com>,
 Jacob Keller <jacob.e.keller@intel.com>, David Airlie <airlied@redhat.com>,
 Paolo Abeni <pabeni@redhat.com>, Guenter Roeck <linux@roeck-us.net>,
 Sam Creasey <sammy@sammy.net>,
 Linux Watchdog Devices <linux-watchdog@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Manivannan Sadhasivam <mani@kernel.org>,
 Jay Vosburgh <j.vosburgh@gmail.com>, Kalle Valo <kvalo@kernel.org>,
 Jan Kara <jack@suse.com>,
 Linux Kernel Actions <linux-actions@lists.infradead.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Karsten Keil <isdn@linux-pingi.de>, Deepak R Varma <drv@mailo.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>,
 Diederik de Haas <didi.debian@cknow.org>,
 Linux Networking <netdev@vger.kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Daniel Mack <daniel@zonque.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/12/23 07:41, Jakub Kicinski wrote:
> On Thu, 11 May 2023 20:33:56 +0700 Bagas Sanjaya wrote:
>> I trigger this patch series because of Didi's GPL full name fixes
>> attempt [1], for which all of them had been NAKed. In many cases, the
>> appropriate correction is to use SPDX license identifier instead.
>>
>> Often, when replacing license notice boilerplates with their equivalent
>> SPDX identifier, the notice doesn't mention explicit GPL version. Greg
>> [2] replied this question by falling back to GPL 1.0 (more precisely
>> GPL 1.0+ in order to be compatible with GPL 2.0 used by Linux kernel),
>> although there are exceptions (mostly resolved by inferring from
>> older patches covering similar situation).
> 
> Should you be CCing linux-spdx@ on this?

Oops, I forgot to Cc that list. Will do in v2.

-- 
An old man doll... just what I always wanted! - Clara

