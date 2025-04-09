Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA84A82F9F
	for <lists+dri-devel@lfdr.de>; Wed,  9 Apr 2025 20:56:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D17210E20D;
	Wed,  9 Apr 2025 18:56:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Z/wqDGMu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 857F110E20D
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Apr 2025 18:56:52 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id
 98e67ed59e1d1-301918a4e1bso5055035a91.1
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Apr 2025 11:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744225012; x=1744829812; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=H44gXeIcAME6+J3Fln1VrlgyA4FgneecNdZbE5MtilQ=;
 b=Z/wqDGMuYDNJS/Q5Yzg0uINLm/CnOIAZfHiAfo12/D18sPsaTFbJAh0JPDnjJ9ZZDA
 436vF9IclU7NFMlzw8i5puJTDtT6s53bPbRvSmTBCZL5azRW7U1pDOwaY+HULWkKFbSh
 jurZX2KsF3lul7kFCRnpuvMR1ft9YhshWgu41T8xO5/2thoXBJrifxJ1AZHuNhtvVppG
 63qwpiCoHgUNmRMQRb1d/3+F4h7vA4ABEmQwsvdsPrv46bVs6BHuESSeDgHU249iluJB
 Kr/567VcQGcY9ZAyfn6LyRsI+WCQqvZ/mgdbi1osY+a06ALF3l31HpBMeX2wkbxZBCNz
 PXpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744225012; x=1744829812;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=H44gXeIcAME6+J3Fln1VrlgyA4FgneecNdZbE5MtilQ=;
 b=mcojAU81ZsXjySJWeowD712B+nFFKdgktgVJi5sMpYCnPwBjcx5eii8eD5OCoBt/9C
 1VYGqec95B8o2LNBhJWoH2aagNq7zXIeCdrQIMKkF7K4odRzcyW48vw0Em6K3L/owr+V
 ZFrCR7KAsjc24XjTzOJQaEJOyHHsn2fT5JIxg2lfds+Fr9cXmlfjUnnXW0vNWg2XowrM
 errJUYbf0x+lBXtLpCv5z2ZclU4Wv1ZLFhWo1qBn5qTqCLkBN26aeofOw/AiLoDqPkGD
 /ana61KHVUg59MPjT/dLfUsR4ciq4QBSHTi0NcSB6jX9oYrA9KmTrhB1K6YoABemh0Ve
 TkXg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWfb0FsBaNVleMhahcZAnjA6qk/mDEe2nJFny2f5Km258CCRTLPC3CgN3ygZulIiyTN+I62b50MK4g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzhWDVY+ZrvomCZrWwWAnRoEKyhXkkQT0Nj82+IiGljolLAF6A9
 5JKs2AWCSv2UIAqQH0HhRTMnfFaC6mm5GdT3CXlC3I23xUQ4RQGn
X-Gm-Gg: ASbGncu152m2IUnVWRl4832JV/mybpTrTBJ7Ka3O4qD7stI57Ng1Y2MaTu8RQX7dQBK
 wUuPCgQX87COP5NXHtvXcnQp/tqOs87DAI5mQOndjwlmXtCWcKaLQHJ0sx+E5d9n/VJXVzXkoww
 PhlT0lH2zfDw/VCaA0PSI+iBYy2W6lVXDAGfSRt5GazZyblmehxeMoRK/qMSziupyobh1RiVUMl
 P4VWCwpWehqauByIdVNx7bAvVpQ0MaRASVis83IgDndLXWCgwoW7rVpq8Ep2a1CE/kNoNgBqdTj
 dQo9PsESiw/KrZaYy+jgSvJ3zlc7ohC//SfJkqVOObSxS4wYqj8k6VcT9MCudNjD4v944+uKqM/
 BoKE=
X-Google-Smtp-Source: AGHT+IEU+9HbHaJYQfODCw2wi9ncyjloO96dCdgihc1EFdOo4Cq2cGK7FSRZJO7xATXKowJYXeayuQ==
X-Received: by 2002:a17:90b:53c8:b0:2ee:cded:9ac7 with SMTP id
 98e67ed59e1d1-30718b83034mr84933a91.20.1744225011817; 
 Wed, 09 Apr 2025 11:56:51 -0700 (PDT)
Received: from visitorckw-System-Product-Name ([140.113.216.168])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-306dd12b4d5sm2218595a91.25.2025.04.09.11.56.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Apr 2025 11:56:51 -0700 (PDT)
Date: Thu, 10 Apr 2025 02:56:41 +0800
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
Message-ID: <Z/bC6cygo0hem5IO@visitorckw-System-Product-Name>
References: <20250409154356.423512-1-visitorckw@gmail.com>
 <20250409154356.423512-3-visitorckw@gmail.com>
 <Z_aobrK3t7zdwZRK@yury>
 <Z/a7DecDljuLtKeS@visitorckw-System-Product-Name>
 <Z_a_PzmNnvC2z7se@yury>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_a_PzmNnvC2z7se@yury>
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

On Wed, Apr 09, 2025 at 02:41:03PM -0400, Yury Norov wrote:
> On Thu, Apr 10, 2025 at 02:23:09AM +0800, Kuan-Wei Chiu wrote:
> > On Wed, Apr 09, 2025 at 01:03:42PM -0400, Yury Norov wrote:
> > > On Wed, Apr 09, 2025 at 11:43:45PM +0800, Kuan-Wei Chiu wrote:
> > > > Refactor parity calculations to use the standard parity_odd() helper.
> > > > This change eliminates redundant implementations.
> > > > 
> > > > Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
> > > > Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
> > > > Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> > > > ---
> > > >  drivers/media/test-drivers/vivid/vivid-vbi-gen.c | 8 ++------
> > > >  1 file changed, 2 insertions(+), 6 deletions(-)
> > > > 
> > > > diff --git a/drivers/media/test-drivers/vivid/vivid-vbi-gen.c b/drivers/media/test-drivers/vivid/vivid-vbi-gen.c
> > > > index 70a4024d461e..5e1b7b1742e4 100644
> > > > --- a/drivers/media/test-drivers/vivid/vivid-vbi-gen.c
> > > > +++ b/drivers/media/test-drivers/vivid/vivid-vbi-gen.c
> > > > @@ -5,6 +5,7 @@
> > > >   * Copyright 2014 Cisco Systems, Inc. and/or its affiliates. All rights reserved.
> > > >   */
> > > >  
> > > > +#include <linux/bitops.h>
> > > >  #include <linux/errno.h>
> > > >  #include <linux/kernel.h>
> > > >  #include <linux/ktime.h>
> > > > @@ -165,12 +166,7 @@ static const u8 vivid_cc_sequence2[30] = {
> > > >  
> > > >  static u8 calc_parity(u8 val)
> > > >  {
> > > > -	unsigned i;
> > > > -	unsigned tot = 0;
> > > > -
> > > > -	for (i = 0; i < 7; i++)
> > > > -		tot += (val & (1 << i)) ? 1 : 0;
> > > > -	return val | ((tot & 1) ? 0 : 0x80);
> > > > +	return val | (parity_odd(val) ? 0 : 0x80);
> > > 
> > > So, if val == 0 than parity_odd(val) is also 0, and this can be
> > > simplified just to:
> > >         return parity(val) ? 0 : 0x80;
> > > Or I miss something?
> > >
> > If val == 0x01, the return value of calc_parity() will remain 0x01.
> > If changed to return parity_odd(val) ? 0 : 0x80;, the return value will
> > be changed to 0x00.
> 
> Sorry, I meant
>         return val ? 0 : 0x80;
> 
> This 'val | (parity_odd(val)' is only false when val == 0, right?
> When val != 0, compiler will return true immediately, not even calling
> parity().
>
I'm still confused.

Maybe you're interpreting the code as:

	(val | parity(val)) ? 0 : 0x80

But what we're trying to do is:

	val | (parity(val) ? 0 : 0x80)

So, for example, if val == 0x06, the return value will be 0x86.
Only returning 0 or 0x80 seems wrong to me.
Or did I misunderstand something?

Regards,
Kuan-Wei

> I think we need a comment from authors.
