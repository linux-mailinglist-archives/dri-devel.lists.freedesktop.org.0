Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F9BA469D6
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 19:33:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5945B10E9B6;
	Wed, 26 Feb 2025 18:33:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="L0C7QTjs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8423110E9B6
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 18:33:23 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-22128b7d587so963375ad.3
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 10:33:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740594801; x=1741199601; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=8NV8NW5Mq8hnlsfnK7VYLX7Lb9iIPf134td0bPOEzZY=;
 b=L0C7QTjsIlJ+v+LEfqz6CrmAAM++oFzzAiaAaG5hvDxRQ+VwEgjq/NXNcLxdRIQZOr
 l4dEHYD/IVG3+lQyEIQEIwDmiG9aeJwa+Rsynb4aRa6Rj1EFGBw7GDTRurT6GeruqkmT
 7OHEQocsOs6z6iMYRKy5RFsKuxo4Flim3XCqBEMgo45BY5xVbKh6ytsJGu4WVODE1SPs
 ilF1kV9dRljVNLM+JBLT31/tjM/UA6ShOMKCqh0ft5HSQ9S4OG3TJrNcsF5rH3mgVwcd
 641/GdltNtIbnp8KvZaWPklz1DNDEvpBoSZ/q2DmSJc2bJxR5E5K5tkqrr8sa9mHZtaZ
 vSUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740594801; x=1741199601;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8NV8NW5Mq8hnlsfnK7VYLX7Lb9iIPf134td0bPOEzZY=;
 b=aPGyH2xFv4P1geyMtK0wZHtn/B7Tmiy/0Wbk4R+m1DSOHK+WQtbfnkpmOA8RmzLoIU
 xhTILVQ5bh5B/RWxDfqHD7UQk+O8BadVkVHtD36g7XJ7wzg68pDMXKJfdSEDZVMIDFaV
 U4ba92TPhoDYUow4fcrcsSpDW66hXccYvJxU20YLW/56lskOKe6WWkRBAT/oGa1zb4C/
 pje8fOd/ak/xExHuxIQf0cp6rdxE4YQcYZZAOSSCinPr8wE4fZUcyxW3+ovySGXlLZqZ
 Bp2b8VsiZ/Z9JAwvB3GjKuD7M+6XkKnda4ogdVvI+3SKMn4su2OYgcUx+6rL9pd4K35R
 qvEg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXWle5pFhG7XReL38hojAo8au2is3tYYGbVyfYFJoKvRsVtpMOMy5xBO9McoxtT3KXwT0VeapFHMho=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyxoAPqCWiS3EhWQrgRqjB4PTqMcmTa4TjkZIJywv0N1ZR377nV
 3FNFNWqWMCUE9s6PgGdCdlMorpy9g5DLcClqebXane1bH7dAAK/x
X-Gm-Gg: ASbGncvXkIZnGfpTxkXMeLCYWXR6cMwNPOvvS1BHvPs44/9WxaGzYPKB2tnQPSfrvks
 oyAMyRcbru6S9PLREPDaC9+/dFH+WWz9LABePrpMCyqKfdFT4t27+V4nOwwx2gLVOlf62y+jQFk
 FxPGROSCS3tDoVn8kuQueMVX8Jm3t+Sv99zPiLQHzXnp6YsjZFcc6yEH7ryoswjLMGALogK9fNo
 vE9yrG+Ig5LgnAq4GFlZBHq1dPrJpDNuHc3LVAhekL1c1rQ3YpShjM4tDbqFovidDeTs1BMTM20
 g66jshnA6x/QOFp4Kw1M1u1iorWjm3d9CvHh4vDRbDM6BEUJMA==
X-Google-Smtp-Source: AGHT+IEhO/8zynHAj/XQ8CfYcqOsDet7/XXIGYhA3zqO2mHTqzuioBsUax6Pz3NWu+JgRkwDnM6ajg==
X-Received: by 2002:a17:90b:2d88:b0:2ee:c918:cd60 with SMTP id
 98e67ed59e1d1-2fe7e33d442mr6780868a91.20.1740594801403; 
 Wed, 26 Feb 2025 10:33:21 -0800 (PST)
Received: from localhost (maglev-oncall.nvidia.com. [216.228.125.128])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2fe825eb82fsm1917776a91.32.2025.02.26.10.33.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2025 10:33:20 -0800 (PST)
Date: Wed, 26 Feb 2025 13:33:18 -0500
From: Yury Norov <yury.norov@gmail.com>
To: Jiri Slaby <jirislaby@kernel.org>
Cc: Kuan-Wei Chiu <visitorckw@gmail.com>, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
 x86@kernel.org, jk@ozlabs.org, joel@jms.id.au,
 eajames@linux.ibm.com, andrzej.hajda@intel.com,
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
 akpm@linux-foundation.org, hpa@zytor.com, alistair@popple.id.au,
 linux@rasmusvillemoes.dk, Laurent.pinchart@ideasonboard.com,
 jonas@kwiboo.se, jernej.skrabec@gmail.com, kuba@kernel.org,
 linux-kernel@vger.kernel.org, linux-fsi@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
 oss-drivers@corigine.com, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
 brcm80211-dev-list.pdl@broadcom.com, linux-serial@vger.kernel.org,
 bpf@vger.kernel.org, jserv@ccns.ncku.edu.tw,
 Yu-Chun Lin <eleanor15x@gmail.com>
Subject: Re: [PATCH 02/17] bitops: Add generic parity calculation for u64
Message-ID: <Z79ebv630yuNOJKV@thinkpad>
References: <20250223164217.2139331-1-visitorckw@gmail.com>
 <20250223164217.2139331-3-visitorckw@gmail.com>
 <Z7zIBwH4aUA7G9MY@thinkpad>
 <Z73FxIv353lbXO3A@visitorckw-System-Product-Name>
 <b5236ae4-7ebe-4a88-bbc9-3b9b3374de53@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b5236ae4-7ebe-4a88-bbc9-3b9b3374de53@kernel.org>
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

On Wed, Feb 26, 2025 at 08:14:14AM +0100, Jiri Slaby wrote:
> On 25. 02. 25, 14:29, Kuan-Wei Chiu wrote:
> > > +#define parity(val)					\
> > > +({							\
> > > +	u64 __v = (val);				\
> > > +	int __ret;					\
> > > +	switch (BITS_PER_TYPE(val)) {			\
> > > +	case 64:					\
> > > +		__v ^= __v >> 32;			\
> > > +		fallthrough;				\
> > > +	case 32:					\
> > > +		__v ^= __v >> 16;			\
> > > +		fallthrough;				\
> > > +	case 16:					\
> > > +		__v ^= __v >> 8;			\
> > > +		fallthrough;				\
> > > +	case 8:						\
> > > +		__v ^= __v >> 4;			\
> > > +		__ret =  (0x6996 >> (__v & 0xf)) & 1;	\
> > > +		break;					\
> > > +	default:					\
> > > +		BUILD_BUG();				\
> > > +	}						\
> > > +	__ret;						\
> > > +})
> > > +
> > > +#define parity8(val)	parity((u8)(val))
> > > +#define parity32(val)	parity((u32)(val))
> > > +#define parity64(val)	parity((u64)(val))
> > What do you think about using these inline functions instead of macros?
> > Except for parity8(), each function is a single line and follows the
> > same logic. I find inline functions more readable, and coding-style.rst
> > also recommends them over macros.
>
> Not in cases where macros are inevitable. I mean, do we need parityXX() for
> XX in (8, 16, 32, 64) at all? Isn't the parity() above enough for everybody?

The existing codebase has something like:

        int ret;

        ret = i3c_master_get_free_addr(m, last_addr + 1);
        ret |= parity8(ret) ? 0 : BIT(7)

So if we'll switch it to a macro like one above, it will become a
32-bit parity. It wouldn't be an error because i3c_master_get_free_addr()
returns an u8 or -ENOMEM, and the error code is checked explicitly. 

But if we decide to go with parity() only, some users will have to
call it like parity((u8)val) explicitly. Which is not bad actually.

> And if not, you can have all those parityXX() as inlines as you suggest, but
> also provide a macro such as the above to call (optimized) parityXX() as per
> datatype len.

Yes, if we need fixed-type parity's, they should all be one-liners
calling the same macro. Macros or inline functions - no preference for
me.

Thanks,
Yury
