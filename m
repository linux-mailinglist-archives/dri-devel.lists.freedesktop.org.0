Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E4A70163E
	for <lists+dri-devel@lfdr.de>; Sat, 13 May 2023 12:53:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4660610E030;
	Sat, 13 May 2023 10:53:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE02910E030
 for <dri-devel@lists.freedesktop.org>; Sat, 13 May 2023 10:53:05 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-6436e075166so8184900b3a.0
 for <dri-devel@lists.freedesktop.org>; Sat, 13 May 2023 03:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683975184; x=1686567184;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rzFzuKHL70sf9cOT0w+52R5CvyI+BtqNEu3+iLD0/xM=;
 b=KiRutVUHBs5oUxLaT6583AIlvZ1wM62Gaibg6ABRHB+EHssWBsNvDmr3LmIXMEoH2N
 GVGjLZ7kpXcwictVoObqHKVXfmMChFRDZKcFopUdeDWXf+rqctX+fYXExdpK3BwtWNQE
 6hpIt8QKtWwJBCyna2FR6m1WiSSC1e5F32aLZoUMDZk3T7BaWRH9Ltr6OJmDEdMfWX9s
 e13QeD3phgr5WfRToH69Bl146cfQyz+4DWY+H9HbLZnjtnYwvns2nITozZ1JLqFg/xAm
 i/WzWpzEWAIlhXjh/j3xi4q7Ct4F5RD81VSYeF8KwsYRLGEzddH112GszCUM1lHzBxB5
 wnWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683975184; x=1686567184;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rzFzuKHL70sf9cOT0w+52R5CvyI+BtqNEu3+iLD0/xM=;
 b=EczsT8nADI/RhascurmHuIxvzbA+Mb0ajW9QMqLDo9X9n27yluk3UuW2X2yowVrgEu
 QNd7IzK4uSxzXi30o07LAuV+KZXcfD8VoAZXt5UCq0Sdzqle85oxH0hSGqBo4gu9xoos
 cEy8648o9OvDlRpnHrXohyFl0uXhLoUJbGL01aeAhHrM30nwdp8d0l2YdJhfbt6xs7GO
 5JW4yBqFe2W+pp1SqoM4XFjXK266/kBobcOFCb0F+3Uy4C2zKKCGFdwfUOnRKNtChT0Z
 zGXF4wBan0rs38K28wWj3YVqZRZh+Oo46oQoVL7/ciPD8ux1AUKpY8+MXEvpj1CQ/MUv
 xM0Q==
X-Gm-Message-State: AC+VfDwtijta/BxgkQtXxiZTvy4XIi2VJ3ESAdFTtAoU2/bJYBuV09ED
 3u4XZOLKbr2AcMhbeRbgth0=
X-Google-Smtp-Source: ACHHUZ5DBzqowpkp4ezU81PkyI2h2pcFK4NVjpo+XXCJnf4Zf6G4lAY1tlwtETFrSiB8n9wL7y9kbw==
X-Received: by 2002:a17:902:fa0f:b0:1a9:8ff5:af43 with SMTP id
 la15-20020a170902fa0f00b001a98ff5af43mr25437354plb.18.1683975184372; 
 Sat, 13 May 2023 03:53:04 -0700 (PDT)
Received: from [192.168.43.80] (subs02-180-214-232-69.three.co.id.
 [180.214.232.69]) by smtp.gmail.com with ESMTPSA id
 f12-20020a170902684c00b001ac69bdc9d1sm9637182pln.156.2023.05.13.03.52.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 May 2023 03:53:03 -0700 (PDT)
Message-ID: <ef31b33f-8e66-4194-37e3-916b53cf7088@gmail.com>
Date: Sat, 13 May 2023 17:52:51 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 08/10] drivers: watchdog: Replace GPL license notice
 with SPDX identifier
Content-Language: en-US
To: Richard Fontana <rfontana@redhat.com>
References: <20230512100620.36807-1-bagasdotme@gmail.com>
 <20230512100620.36807-9-bagasdotme@gmail.com>
 <CAC1cPGy=78yo2XcJPNZVvdjBr2-XzSq76JrAinSe42=sNdGv3w@mail.gmail.com>
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <CAC1cPGy=78yo2XcJPNZVvdjBr2-XzSq76JrAinSe42=sNdGv3w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Simon Horman <simon.horman@corigine.com>,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 Eric Dumazet <edumazet@google.com>, Jonas Jensen <jonas.jensen@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Andy Gospodarek <andy@greyhouse.net>,
 Sylver Bruneau <sylver.bruneau@googlemail.com>, Marc Zyngier <maz@kernel.org>,
 Linux Staging Drivers <linux-staging@lists.linux.dev>,
 Linux SPDX Licenses <linux-spdx@vger.kernel.org>,
 Oleg Drokin <green@crimea.edu>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Andrey Panin <pazke@donpac.ru>,
 Guenter Roeck <linux@roeck-us.net>, Sam Creasey <sammy@sammy.net>,
 Linux Watchdog Devices <linux-watchdog@vger.kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Jay Vosburgh <j.vosburgh@gmail.com>,
 Jan Kara <jack@suse.com>,
 Linux Kernel Actions <linux-actions@lists.infradead.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Andrew Sharp <andy.sharp@lsi.com>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Ray Lehtiniemi <rayl@mail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Alan Cox <alan@linux.intel.com>, Alessandro Zummo <a.zummo@towertech.it>,
 Karsten Keil <isdn@linux-pingi.de>, Linux Networking <netdev@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>,
 Denis Turischev <denis@compulab.co.il>,
 Diederik de Haas <didi.debian@cknow.org>,
 Philippe Ombredanne <pombredanne@nexb.com>,
 "David S. Miller" <davem@davemloft.net>, Daniel Mack <daniel@zonque.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/12/23 19:46, Richard Fontana wrote:
> On Fri, May 12, 2023 at 6:07 AM Bagas Sanjaya <bagasdotme@gmail.com> wrote:
> 
> 
>> diff --git a/drivers/watchdog/sb_wdog.c b/drivers/watchdog/sb_wdog.c
>> index 504be461f992a9..822bf8905bf3ce 100644
>> --- a/drivers/watchdog/sb_wdog.c
>> +++ b/drivers/watchdog/sb_wdog.c
>> @@ -1,3 +1,4 @@
>> +// SPDX-License-Identifier: GPL-1.0+
>>  /*
>>   * Watchdog driver for SiByte SB1 SoCs
>>   *
>> @@ -38,10 +39,6 @@
>>   *     (c) Copyright 1996 Alan Cox <alan@lxorguk.ukuu.org.uk>,
>>   *                                             All Rights Reserved.
>>   *
>> - *     This program is free software; you can redistribute it and/or
>> - *     modify it under the terms of the GNU General Public License
>> - *     version 1 or 2 as published by the Free Software Foundation.
> 
> Shouldn't this be
> // SPDX-License-Identifier: GPL-1.0 OR GPL-2.0
> (or in current SPDX notation GPL-1.0-only OR GPL-2.0-only) ?
> 

Nope, as it will fail spdxcheck.py. Also, SPDX specification [1]
doesn't have negation operator (NOT), thus the licensing requirement
on the above notice can't be expressed reliably in SPDX here.

[1]: https://spdx.github.io/spdx-spec/v2.3/SPDX-license-expressions/

-- 
An old man doll... just what I always wanted! - Clara

