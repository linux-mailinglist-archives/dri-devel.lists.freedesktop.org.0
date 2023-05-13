Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E3EB7015A2
	for <lists+dri-devel@lfdr.de>; Sat, 13 May 2023 11:25:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A71E110E04A;
	Sat, 13 May 2023 09:25:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E935110E04A
 for <dri-devel@lists.freedesktop.org>; Sat, 13 May 2023 09:25:11 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1aaef97652fso75324615ad.0
 for <dri-devel@lists.freedesktop.org>; Sat, 13 May 2023 02:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683969911; x=1686561911;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SlCH0G2m8kRJpvkxVEbC2XIL/mZruz0Jkv7EOy6aMxk=;
 b=fhQmRZtAHOH36wyJU2rlLs/w4OhknwgCOTsAGH2bgx5fytY08pzzIFphrFGUASWOq4
 OJdOATuTGchZKM4Uo+PM0gi4v5ssEvxQhbP9KKE13C8v98wtMD+0EMeZmXHJisssn9sc
 7wGGpl0vvH/oFaYAgkHUwbLvVLaE0veCNt8KAH1NSlY0Ed94HnOpf02KjqHMKTPNVWsf
 lMUUQdgfMZhaDM5dvZ4gH8K/KW3Wyksje5KN4bUk6rttnH8+qeZslb3Bvhz7270CMq2l
 WdoKImJ+rRYO0op8mHBawLeEcMBCh9GypjQC/Wdr3VxZSQh9TBvdN/qnGyyB1EcUBmob
 2ZRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683969911; x=1686561911;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SlCH0G2m8kRJpvkxVEbC2XIL/mZruz0Jkv7EOy6aMxk=;
 b=MVcYgV/CNEq9IBf1pcz6LCwDvhLHOXgJuzJkUA2avhbkDevB270le8hqRZMA4yQd1D
 Zlo4Lg+Y8hsNC+OTa/alXsBXMIsS7Y6I0D64uTYsaU6UeBrVvbZJp6wGoSUoMZ5hB+iG
 prJBouhkmyO/bdbduZ9YT6OdHBUvT20jFjP/tzYYQ4P3SVh/QnuPCRzjIx4tfrS+g3ch
 bPRs7xOjpdRdHRk/kc6iHiJ+QyPIj1dX3Q8kgpa3/nQwynLV+yq7jXQmANHbq6iJ4ho3
 n4bhClpuy+dMNwMV+6IlWoRoYinR3ixe1T6boI9m6Sry4WDm0d3EjCg3OVDr/EPvIpFw
 SV1w==
X-Gm-Message-State: AC+VfDzN5y76pvDkxUtPv136/FPBzCtrIL+R53ywh6s741mY/dZCTLmV
 OZpzyIhZEjUtGtXOEFEfY08=
X-Google-Smtp-Source: ACHHUZ7LknF76h0kIjVXmGlmqNXZ+WVcST0A5b/F7jca+bKv9M+VoFiYWPkLa51Ng/PS0qu7yYpFQg==
X-Received: by 2002:a17:903:338e:b0:1a9:8ba4:d0d3 with SMTP id
 kb14-20020a170903338e00b001a98ba4d0d3mr24277429plb.8.1683969911004; 
 Sat, 13 May 2023 02:25:11 -0700 (PDT)
Received: from [192.168.43.80] (subs02-180-214-232-69.three.co.id.
 [180.214.232.69]) by smtp.gmail.com with ESMTPSA id
 d13-20020a170902728d00b001a217a7a11csm6335741pll.131.2023.05.13.02.25.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 May 2023 02:25:10 -0700 (PDT)
Message-ID: <e53ccc96-49f5-6e01-6edf-d44b1cff405f@gmail.com>
Date: Sat, 13 May 2023 16:25:01 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 00/10] Treewide GPL SPDX conversion and cleanup (in
 response to Didi's GPL full name fixes)
Content-Language: en-US
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20230512100620.36807-1-bagasdotme@gmail.com>
 <2023051243-bunch-goliath-7380@gregkh>
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <2023051243-bunch-goliath-7380@gregkh>
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
 Dominik Brodowski <linux@dominikbrodowski.net>,
 Eric Dumazet <edumazet@google.com>, Robert Jarzmik <robert.jarzmik@free.fr>,
 Andy Gospodarek <andy@greyhouse.net>,
 Linux Staging Drivers <linux-staging@lists.linux.dev>,
 Linux SPDX Licenses <linux-spdx@vger.kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Guenter Roeck <linux@roeck-us.net>, Sam Creasey <sammy@sammy.net>,
 Linux Watchdog Devices <linux-watchdog@vger.kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Jay Vosburgh <j.vosburgh@gmail.com>,
 Jan Kara <jack@suse.com>,
 Linux Kernel Actions <linux-actions@lists.infradead.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Karsten Keil <isdn@linux-pingi.de>, Linux Networking <netdev@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>,
 Diederik de Haas <didi.debian@cknow.org>,
 Philippe Ombredanne <pombredanne@nexb.com>,
 "David S. Miller" <davem@davemloft.net>, Daniel Mack <daniel@zonque.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/12/23 18:23, Greg Kroah-Hartman wrote:
> I'm glad to take these types of changes through the SPDX tree, but
> please break them up into smaller changes that show the justification
> for each type of change in each subsystem, so that we can evaluate them
> on an individual basis.  As you did here, you are lumping things
> together only by the existance of the file in the tree, not by the
> logical type of change happening, which isn't ok.
> 
> Also, you can send them as subsystem-specific series, so as to not have
> to cross-post all of the changes all over the place.  I doubt the drm
> developers care about ethernet driver license issues :)
> 

OK, thanks!

-- 
An old man doll... just what I always wanted! - Clara

