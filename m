Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3458FA82E89
	for <lists+dri-devel@lfdr.de>; Wed,  9 Apr 2025 20:23:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18B7E10E724;
	Wed,  9 Apr 2025 18:23:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Oa2HCsIE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 172FF10E724
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Apr 2025 18:23:21 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-22928d629faso74287325ad.3
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Apr 2025 11:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744223000; x=1744827800; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=WYzoH1Uwhcqg2+qDINtEMV7dZsf/NWh1BI5tm3o/1uQ=;
 b=Oa2HCsIE5wFw/yLJuer1yWDrbiIeK60MONWPaCYd75adHzWCF1AS0ZnC5f+nG60bfI
 KDwJeV0t4y/sLBwjDNjELoJs/DLaff/J0awqxHbqxJfaVSk8tUv/tqMGqRKNfo6vdr7M
 kV+c8G/O2EAYXc/MrL2SXBr1g9hOah4Fl4M86PQWbAXlVIsU26WXlldQs604263ubadB
 +Zvgr3ClRZdIHfry3AJLsMu1a7ppCdHJE/mYonDuSqCWkWgqfNVJSlN/3oUFAEoQlch6
 YRlVge7q5ryK4JGbIxwFBAdg0N9Vnd2e1iVr/Lz+//JVcKygXWJNw2W4IIvD2sv2y9id
 nqWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744223000; x=1744827800;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WYzoH1Uwhcqg2+qDINtEMV7dZsf/NWh1BI5tm3o/1uQ=;
 b=P0BmWo5EQ3r2lUcSgnN7lp7dfC6HB15CxNvfN3dzgXgrVWILKiZU8DrI228oiXgg5y
 9vDf9zReme55fR89P+VjPPNR6v6yb5F7HBoLtsMaET0L9y7Xi1C/te1D9AbMmB3GNdJ1
 aZbazPQ0rwFn25DYMZ3cnw1dLrivdljh0vPmV04YX9El4jV8vEudVIffbjW+DcZKlDRS
 Bl2nkrAAadw11tC7ItcoOjHOZH2Y+Cy2rGusxIjbgFQCvk+VjnQ67rVoAMs+LlX/+Z3z
 LvbfSvZyYexrguvaypBXcSpBX8Sl1t1YHFF6L9hwPx3Yc49rhBHyU2JeJFyNjqW/ekBR
 400g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUEztUFpFdJFaju3JP0pmeuS27YrSF08AXDh0xoqWEAFm0xBlsdkH0/PM8OdlOMlbat3lWwflLuwWI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxKclEsX5HDaTNWp9M6HGwbE7Bem3i7Rs7o70l+pR61ErxdXYn+
 UKryUOnkHSHjo5kozd09Uu3XIsYnDavFoZjkGfpEbm4zPlb/BPP6
X-Gm-Gg: ASbGncuIZwR7ApYPyafISFXLqQns4S0zKn4JHvaFeTV0Us1Y/ZxtBNo93V/9zCilCoZ
 l5Ij1NaZIla+oz7Vu8K7CD7OwJt4t/cR7WN+hvLP6WDdlLSq/+7mt62O4aF7xWScCG2x2VDDc3W
 joWKPc8D98MVaq2ts9Tx4OjK7Kkl1s6lPQkidFZNBNl7HZ0dmykWne9c+3tF/FjrtdSG6L8bNSX
 qZjYJRXy1b55P6ajAySidQJxR9w1uGmd0CxMXn8pyQS/CV8o3v7y+UkVXaXhcg3FwvdFG15Y2Ex
 Nvbo/cjE8jwChw6qWrwXlTAQ8PJoa34zDkkNMiQ5jKSJz9fDGRNUsOvurMwttV2W1MbU
X-Google-Smtp-Source: AGHT+IFJTXcO6iff2D3m6F14Oejj60CpisJRfAo2/LdtyKFQF1rTvBeD9sWDrAGl2dH2tL/2lZXd/A==
X-Received: by 2002:a17:903:2441:b0:223:2361:e855 with SMTP id
 d9443c01a7336-22ac2a1aefemr59522875ad.39.1744223000437; 
 Wed, 09 Apr 2025 11:23:20 -0700 (PDT)
Received: from visitorckw-System-Product-Name ([140.113.216.168])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73bb1e6b8ebsm1679194b3a.180.2025.04.09.11.23.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Apr 2025 11:23:19 -0700 (PDT)
Date: Thu, 10 Apr 2025 02:23:09 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: Yury Norov <yury.norov@gmail.com>
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
Message-ID: <Z/a7DecDljuLtKeS@visitorckw-System-Product-Name>
References: <20250409154356.423512-1-visitorckw@gmail.com>
 <20250409154356.423512-3-visitorckw@gmail.com>
 <Z_aobrK3t7zdwZRK@yury>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_aobrK3t7zdwZRK@yury>
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

On Wed, Apr 09, 2025 at 01:03:42PM -0400, Yury Norov wrote:
> On Wed, Apr 09, 2025 at 11:43:45PM +0800, Kuan-Wei Chiu wrote:
> > Refactor parity calculations to use the standard parity_odd() helper.
> > This change eliminates redundant implementations.
> > 
> > Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
> > Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
> > Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> > ---
> >  drivers/media/test-drivers/vivid/vivid-vbi-gen.c | 8 ++------
> >  1 file changed, 2 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/media/test-drivers/vivid/vivid-vbi-gen.c b/drivers/media/test-drivers/vivid/vivid-vbi-gen.c
> > index 70a4024d461e..5e1b7b1742e4 100644
> > --- a/drivers/media/test-drivers/vivid/vivid-vbi-gen.c
> > +++ b/drivers/media/test-drivers/vivid/vivid-vbi-gen.c
> > @@ -5,6 +5,7 @@
> >   * Copyright 2014 Cisco Systems, Inc. and/or its affiliates. All rights reserved.
> >   */
> >  
> > +#include <linux/bitops.h>
> >  #include <linux/errno.h>
> >  #include <linux/kernel.h>
> >  #include <linux/ktime.h>
> > @@ -165,12 +166,7 @@ static const u8 vivid_cc_sequence2[30] = {
> >  
> >  static u8 calc_parity(u8 val)
> >  {
> > -	unsigned i;
> > -	unsigned tot = 0;
> > -
> > -	for (i = 0; i < 7; i++)
> > -		tot += (val & (1 << i)) ? 1 : 0;
> > -	return val | ((tot & 1) ? 0 : 0x80);
> > +	return val | (parity_odd(val) ? 0 : 0x80);
> 
> So, if val == 0 than parity_odd(val) is also 0, and this can be
> simplified just to:
>         return parity(val) ? 0 : 0x80;
> Or I miss something?
>
If val == 0x01, the return value of calc_parity() will remain 0x01.
If changed to return parity_odd(val) ? 0 : 0x80;, the return value will
be changed to 0x00.

Regards,
Kuan-Wei

> >  }
> >  
> >  static void vivid_vbi_gen_set_time_of_day(u8 *packet)
> > -- 
> > 2.34.1
