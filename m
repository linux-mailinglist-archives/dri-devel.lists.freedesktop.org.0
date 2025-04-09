Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD95A82D1C
	for <lists+dri-devel@lfdr.de>; Wed,  9 Apr 2025 19:03:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D50D10E220;
	Wed,  9 Apr 2025 17:03:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cYntKfl1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C0D510E040
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Apr 2025 17:03:46 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id
 d2e1a72fcca58-736e52948ebso8216458b3a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Apr 2025 10:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744218226; x=1744823026; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=gduFr9psKq3/rFKzYti1e6w9zW9vBtwhKjWFoDD4Umw=;
 b=cYntKfl1egjlKwszC5k3FHOjz4UTSGRX90FYFsUYPBN6X+LxbyKuRvtRnLEKC9kQfO
 za6sKhAwo6K7370nT7dXrXWhBrMSthHKJ2h+UidzvqFzFWaSnDxN4C3wxl/rIxheEeL6
 jR+rs9yEPYLUpdY3J4ASIzrPc1DVFPPYIr9Jo7OZqQ/JiH2DbRT0sSBVaD0lXTfPqRLv
 gn8f+kHQTObXxrnxPjRwHcdMvlrrz4VkuU72sEr6hprB+HE3l6uoGBQ5NPFBYyoyJZBm
 m8I3iDm/FHgBWMLWjxbxzPq2STh+yeJhEHwtH3v2CApsVhEWIgMDn9NTCFu7RjeDN+1S
 9YUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744218226; x=1744823026;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gduFr9psKq3/rFKzYti1e6w9zW9vBtwhKjWFoDD4Umw=;
 b=HEcrRDb+X4Ku8VUaLkVEkbtZ7JmeF65DeFi4cn+sEVTbCi5KetWEKZMIdUDthrP5Lw
 14K8HhQKudT+JDcKiDyunjQBVbZgxfTN0q8qw3kl3vRDGOwXTz2T2tMOs1dD1jZ9svXJ
 apVl+a+6ENgMUyT6cfdaJkgqzQFTNpZmRqppT7PKq3gRk5+v354Aw0EgRUBPo0bj7SV8
 910vmSkDpHf1CFkVlUeW5shRVL05tRsjBIrTq0aKZslwDcrFWvZ6FgNrgslE2e276fp7
 cLd3YN7EQvLNgkqIdwTw0eLS+AWABU6rRJls2FibjUJpvbg1ZCh/XZmhZJUfVDtHwzgn
 NcqQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVelIY8hyVBeB8JFdxJgRLzbtQIR3nKPxjOX1shMfh3cWQ9issNczpHjIeuezgjjT6bWaKYPx1xsBw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxbV+4oiZOkdMr0xRBTYEJjYEafV8MtDaTRiT9xanpvYuoo864C
 b91qdrsZ6Lz5Bx6y+HkKn/qsbUmcBtJjhdNjTuL663+LwaKIam5x
X-Gm-Gg: ASbGnctQO9KbhLdLGAq1F0noxEnimMzQ0idMJBKtMFVNtAPNJ0URsHSNQRipF5eiAWB
 lxXUDv/NRQGNimo++s4ZiQjESOV3gHnqq3o7JpiBAZNI2WY0VB2I3cOTZkunJ3t8/e7V7LIrw0T
 iTNFKViq7mnF9TZrFBFWevks0W6BA6sDzaqwqI6d1zQK9q7HQ95i2JXp7GsuofRQFIsPzPU6MXs
 2TupgaBif2dStl9kETC/u/+zRn7IlCY4D1SssDowkkvPYmZIQNzC4PjG0vJN/2d43ZwmNsBY45C
 sERmxfnEnp53aBuRpz0JZ4/wzrqZKYWPDW3fhcBR
X-Google-Smtp-Source: AGHT+IFo/aQceu0toKb44OYHKBYM0JofkQ3whuz+MJluns/fIT/s5YOPql0qpyNQQjmA8CWqrkcceg==
X-Received: by 2002:a05:6a00:2408:b0:730:95a6:3761 with SMTP id
 d2e1a72fcca58-73bae496ce6mr5244634b3a.3.1744218225458; 
 Wed, 09 Apr 2025 10:03:45 -0700 (PDT)
Received: from localhost ([216.228.127.131]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73bb1d54d32sm1590079b3a.72.2025.04.09.10.03.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Apr 2025 10:03:44 -0700 (PDT)
Date: Wed, 9 Apr 2025 13:03:42 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Kuan-Wei Chiu <visitorckw@gmail.com>
Cc: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, jk@ozlabs.org,
 joel@jms.id.au, eajames@linux.ibm.com, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dmitry.torokhov@gmail.com, mchehab@kernel.org,
 awalls@md.metrocast.net, hverkuil@xs4all.nl,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 louis.peens@corigine.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 parthiban.veerasooran@microchip.com, arend.vanspriel@broadcom.com,
 johannes@sipsolutions.net, gregkh@linuxfoundation.org,
 jirislaby@kernel.org, akpm@linux-foundation.org, jdelvare@suse.com,
 linux@roeck-us.net, alexandre.belloni@bootlin.com, pgaj@cadence.com,
 hpa@zytor.com, alistair@popple.id.au, linux@rasmusvillemoes.dk,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, kuba@kernel.org,
 linux-kernel@vger.kernel.org, linux-fsi@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
 oss-drivers@corigine.com, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
 brcm80211-dev-list.pdl@broadcom.com, linux-serial@vger.kernel.org,
 bpf@vger.kernel.org, jserv@ccns.ncku.edu.tw, Frank.Li@nxp.com,
 linux-hwmon@vger.kernel.org, linux-i3c@lists.infradead.org,
 david.laight.linux@gmail.com, andrew.cooper3@citrix.com,
 Yu-Chun Lin <eleanor15x@gmail.com>
Subject: Re: [PATCH v4 02/13] media: media/test_drivers: Replace open-coded
 parity calculation with parity_odd()
Message-ID: <Z_aobrK3t7zdwZRK@yury>
References: <20250409154356.423512-1-visitorckw@gmail.com>
 <20250409154356.423512-3-visitorckw@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409154356.423512-3-visitorckw@gmail.com>
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

On Wed, Apr 09, 2025 at 11:43:45PM +0800, Kuan-Wei Chiu wrote:
> Refactor parity calculations to use the standard parity_odd() helper.
> This change eliminates redundant implementations.
> 
> Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
> Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
> Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> ---
>  drivers/media/test-drivers/vivid/vivid-vbi-gen.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/test-drivers/vivid/vivid-vbi-gen.c b/drivers/media/test-drivers/vivid/vivid-vbi-gen.c
> index 70a4024d461e..5e1b7b1742e4 100644
> --- a/drivers/media/test-drivers/vivid/vivid-vbi-gen.c
> +++ b/drivers/media/test-drivers/vivid/vivid-vbi-gen.c
> @@ -5,6 +5,7 @@
>   * Copyright 2014 Cisco Systems, Inc. and/or its affiliates. All rights reserved.
>   */
>  
> +#include <linux/bitops.h>
>  #include <linux/errno.h>
>  #include <linux/kernel.h>
>  #include <linux/ktime.h>
> @@ -165,12 +166,7 @@ static const u8 vivid_cc_sequence2[30] = {
>  
>  static u8 calc_parity(u8 val)
>  {
> -	unsigned i;
> -	unsigned tot = 0;
> -
> -	for (i = 0; i < 7; i++)
> -		tot += (val & (1 << i)) ? 1 : 0;
> -	return val | ((tot & 1) ? 0 : 0x80);
> +	return val | (parity_odd(val) ? 0 : 0x80);

So, if val == 0 than parity_odd(val) is also 0, and this can be
simplified just to:
        return parity(val) ? 0 : 0x80;
Or I miss something?

>  }
>  
>  static void vivid_vbi_gen_set_time_of_day(u8 *packet)
> -- 
> 2.34.1
