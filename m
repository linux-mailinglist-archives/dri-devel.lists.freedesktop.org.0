Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A404CA42878
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 17:56:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CDCA10E478;
	Mon, 24 Feb 2025 16:56:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TbnEykGJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9BFE10E478
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 16:56:42 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-219f8263ae0so97748265ad.0
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 08:56:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740416202; x=1741021002; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=uiOFRZn2H6lerxDkJoj1wxqiGhkAtJgTGIELTuQhums=;
 b=TbnEykGJARsxowyaXb1xP9aEqjj9F+pq8NTGeAqsURO+xuagx5NAhOTwoRIaoo+iwx
 /7CnX8TMH6yVKkkGt7i8iBOqsGy4sqGZ9PhD0mRGbhRW3bh4dB3bqNcfEyR834Greb+6
 d9vorv099D2owI1f7UCLPCxJSlQ3YGlOpQzk8g2ZlPPekUWz+y63xk/NLYYdExutfh/w
 UbfVqngNc0EGvBhiHI8+MgIT3XcsHtMeE3XnI2ZYqLhspSdFGtBqsghQSs6lVqtM/Qkj
 IdsIFcaF138tywQGsYH76tL4jwq3KZrxiUrzTqWgXQqeRDHubpIlrZvOeeVzQeew0H4d
 1M8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740416202; x=1741021002;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uiOFRZn2H6lerxDkJoj1wxqiGhkAtJgTGIELTuQhums=;
 b=L9jBt2dsZJHqWQfjlEkcSO851eqnCVi5E9+A0dBrQ/Gtaw54mxAD8XlZBHcD7BsuVE
 +9itPinViHaJz5Jz0SEmhanOePPL0FeeZFSupX+I9G8FvLeObybYsA3loYUTNDblUo6r
 aq47wWmqG1Eq79WFN/gGtyB7d/T+ke0oSLiNSqw30eXPV53j/klXItqPi/QXGOvTKv5V
 +Q85aUY86lcRwskjITAzbEcxezA87qvsaNfMf0BaZCb4KZuo4b6O/JYNgQewCJVKjQrp
 O/Un7jKIQj9XRezaEm1NqI2U7UKIX31zbsBhxTIpKyLd4uipydSfeD2aKab70yz52zw7
 3r1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVyuyjzfhra6MHcHCryTaDgWiTUEDfa7ka8JMPBieDd/RaqBKDVv7IXR0J6Ss6l9IDla7IiS5uGcvs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwH/Tm4Ug45smeqNCEbjqgTWfBBz0c5g4+LubNLg7eAk3V+dqW+
 vZpqDd6KMu2lOkS77iMBRP18NXAL8kpZyt5RMRoFfx+vNmrc7f4Q
X-Gm-Gg: ASbGncuQFMBJ8BTCzPZnhl3055zjHEy51xFb5vOuWVaeurbI8nhmapQX/YzlZtmJ7jd
 RFtuQX8JJHeY3h/geVZh9qVXWHEB1x/wOs5NEj1+7kjxgDcKYpCwSbr44SMicwDOWFiErGloOep
 tQEgE1PZMQ4p3yORgi4mabYNMAltygQcIyU3M3TwifxjwRKyZUtZrlWS6dYFyVOjitxE218QCRT
 CoEpUOqt+aBBofhHkRpFjFcYXp7AQBNA+iocnVtUQSohignuLO44QIWihr/LSCx1Ab0FOUdKiDk
 PrN5hSItOPkWuKlCIRSsgMfKoNgg
X-Google-Smtp-Source: AGHT+IFVgQBLmZYFNL+ZV4HrxXg4lZgXZnXGnGr0U7DF5esCoQcIST0NuWk3m7oQnTUJjc9HIW9Ozw==
X-Received: by 2002:a17:902:d492:b0:220:c63b:d93c with SMTP id
 d9443c01a7336-221a11b9493mr230835105ad.44.1740416201946; 
 Mon, 24 Feb 2025 08:56:41 -0800 (PST)
Received: from eleanor-wkdl ([140.116.96.203])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-220d534afadsm185140065ad.26.2025.02.24.08.56.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2025 08:56:41 -0800 (PST)
Date: Tue, 25 Feb 2025 00:56:29 +0800
From: Yu-Chun Lin <eleanor15x@gmail.com>
To: David Laight <david.laight.linux@gmail.com>
Cc: Jiri Slaby <jirislaby@kernel.org>, Kuan-Wei Chiu <visitorckw@gmail.com>,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
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
 yury.norov@gmail.com, akpm@linux-foundation.org, hpa@zytor.com,
 alistair@popple.id.au, linux@rasmusvillemoes.dk,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, kuba@kernel.org,
 linux-kernel@vger.kernel.org, linux-fsi@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
 oss-drivers@corigine.com, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
 brcm80211-dev-list.pdl@broadcom.com, linux-serial@vger.kernel.org,
 bpf@vger.kernel.org, jserv@ccns.ncku.edu.tw
Subject: Re: [PATCH 02/17] bitops: Add generic parity calculation for u64
Message-ID: <Z7ykvf1g03XDLXKc@eleanor-wkdl>
References: <20250223164217.2139331-1-visitorckw@gmail.com>
 <20250223164217.2139331-3-visitorckw@gmail.com>
 <bde62fee-4617-4db7-b92c-59fb958c4ca6@kernel.org>
 <20250224133431.2c38213f@pumpkin>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250224133431.2c38213f@pumpkin>
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

On Mon, Feb 24, 2025 at 01:34:31PM +0000, David Laight wrote:
> On Mon, 24 Feb 2025 08:09:43 +0100
> Jiri Slaby <jirislaby@kernel.org> wrote:
> 
> > On 23. 02. 25, 17:42, Kuan-Wei Chiu wrote:
> > > Several parts of the kernel open-code parity calculations using
> > > different methods. Add a generic parity64() helper implemented with the
> > > same efficient approach as parity8().
> > > 
> > > Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
> > > Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
> > > Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> > > ---
> > >   include/linux/bitops.h | 22 ++++++++++++++++++++++
> > >   1 file changed, 22 insertions(+)
> > > 
> > > diff --git a/include/linux/bitops.h b/include/linux/bitops.h
> > > index fb13dedad7aa..67677057f5e2 100644
> > > --- a/include/linux/bitops.h
> > > +++ b/include/linux/bitops.h
> > > @@ -281,6 +281,28 @@ static inline int parity32(u32 val)
> > >   	return (0x6996 >> (val & 0xf)) & 1;
> > >   }
> > >   
> > > +/**
> > > + * parity64 - get the parity of an u64 value
> > > + * @value: the value to be examined
> > > + *
> > > + * Determine the parity of the u64 argument.
> > > + *
> > > + * Returns:
> > > + * 0 for even parity, 1 for odd parity
> > > + */
> > > +static inline int parity64(u64 val)
> > > +{
> > > +	/*
> > > +	 * One explanation of this algorithm:
> > > +	 * https://funloop.org/codex/problem/parity/README.html
> > > +	 */
> > > +	val ^= val >> 32;  
> > 
> > Do we need all these implementations? Can't we simply use parity64() for 
> > any 8, 16 and 32-bit values too? I.e. have one parity().
> 
> I'm not sure you can guarantee that the compiler will optimise away
> the unnecessary operations.

Hi Jiri and David,

Unless we can be certain about the compiler's optimization behavior, we
prefer to follow an approach similar to hweight, distinguishing
implementations based on different bit sizes.

> 
> But:
> static inline int parity64(u64 val)
> {
> 	return parity32(val ^ (val >> 32))
> }
> 
> should be ok.

We will adopt this approach, as it is indeed more concise.

Thank you all for your feedback.

Best regards,

Yu-Chun Lin

> It will also work on x86-32 where parity32() can just check the parity flag.
> Although you are unlikely to manage to use the the PF the xor sets.
> 
> 	David
> 
> > 
> > > +	val ^= val >> 16;
> > > +	val ^= val >> 8;
> > > +	val ^= val >> 4;
> > > +	return (0x6996 >> (val & 0xf)) & 1;
> > > +}
> > > +
> > >   /**
> > >    * __ffs64 - find first set bit in a 64 bit word
> > >    * @word: The 64 bit word  
> > 
> > 
> 
