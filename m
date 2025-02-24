Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB73EA420BA
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 14:34:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 284438924F;
	Mon, 24 Feb 2025 13:34:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="iwbbTVh6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7584F8924F
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 13:34:38 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-43690d4605dso26967085e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 05:34:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740404076; x=1741008876; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OAg+3nWpCX28gp0yop3cTi7eprtgpHgYieQoEXp/Zxw=;
 b=iwbbTVh6YOEhSZjy5hIjN3OJfM5goV24xCILX+lkoO84GnpbgwzafvuEhXu9Qv0lsc
 x4ULFjx+54wA54RUixtZ53Kp+wNSSIowKR0DA4hGFA/0RCRLaYCbB2xU3NNBp3UMrdvI
 362LdyyJQOAJm4EHMti2YBmvhqDeFYQlkEzdisWJ96yOzNkFI7r+PLI4paLN2XstCBqS
 GWrziXfjChzt2HJeBSSiHLYcNxDVyIOSnK+alShtL3HDN+Y8jiN/UfBn43ugFg0eJtRp
 oFSPK42H9S0SMwZnqUCSfiKNvRoksEBmOZnnx7OgMqZin5V9q/wlPHZk0tI3Mgw68B3D
 jRKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740404076; x=1741008876;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OAg+3nWpCX28gp0yop3cTi7eprtgpHgYieQoEXp/Zxw=;
 b=qJq0QiHddlqZ5Tb45CosZxzfhgFBHx42PXzW8spjv5OOOVl9EUg27KZecTj+M2nlmc
 0Uq4pafQFRJqFk+6bJUNjE+BFMQQYRuv4fJjQeul2waAXH0NUx6QHkCwuJw0MyEPbfjC
 uHtASGYmB7iPg45MxliiZOUrZ8VYjuyTgl8QeviIyUsSsPU3aUnxoERAaP3q8cmnk/Bv
 w5ALL7qZ5yKKWNkMnpDkSPv+aL8HnTRKv2TtI5+Zc4MvcfQibudpuaMbK7v2OtBzTdkE
 gmdGkZxLXB5zaoFaq5OYhBwTmbqFfRVKjq0gW0Bq9yUeEHMeNKZPsmai4ORs2KUqWlqM
 KLBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYBbe7/CCyFUiBEFoKJf6AilArnhM9O5ejvh7MxZGbUil54EBa3I3+NvcSaYgzkc16+mc6Fl6EITI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxQ4/f4U2v7L7nFcZJ1YbiBmZqI2a0JvHIRhSybqiWkr5B4TksQ
 SrnEpS4FKCi6/wYnYfojHLDukBQPLVb/Il0utvihKfnjv8uQLuUH
X-Gm-Gg: ASbGnctJAg9HA8UvMWO+A6SG9uAIOwdZi23juQXoib744DdiGzExuOk+OMPspHvzoJM
 15iR2E8H0r0LBT68ZQrM5dJCdCiNMB3q62aTZXPF6EkmdGHvY5GGFJO/zOpluMlbpILvhdlIU+1
 L9yk/fVBKWZFNfkp6UJWWh2DDg7d9yP95CfE5/XctUzzZX3JPGmNbSg8YGo+qT2U+ULL8gTfwAO
 AEMElLnTKfs5X+0FTctRRlSVZvEx25YDS9Rpypp2esDGmF9OGYLMyB6/VzgF2N1yCyjl697R7P2
 fiVyRGGbqd/oMJyQee61jAu3wSXWWi+XttUsSBAGAJYeb+i9XI6Vuq7RqRqgCa+g
X-Google-Smtp-Source: AGHT+IHAk3Wvwyk1vqkRenvO3RPC8nmIGBVFBN9gj/vKmwdIoVhq2/WUUPGNh8lDJR1/QVDS5j7zIQ==
X-Received: by 2002:a05:6000:144a:b0:38f:4d40:358 with SMTP id
 ffacd0b85a97d-38f6e7587c5mr11099286f8f.9.1740404075459; 
 Mon, 24 Feb 2025 05:34:35 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f74817cbdsm9492882f8f.68.2025.02.24.05.34.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2025 05:34:35 -0800 (PST)
Date: Mon, 24 Feb 2025 13:34:31 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Jiri Slaby <jirislaby@kernel.org>
Cc: Kuan-Wei Chiu <visitorckw@gmail.com>, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
 x86@kernel.org, jk@ozlabs.org, joel@jms.id.au, eajames@linux.ibm.com,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, dmitry.torokhov@gmail.com,
 mchehab@kernel.org, awalls@md.metrocast.net, hverkuil@xs4all.nl,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 louis.peens@corigine.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com,
 parthiban.veerasooran@microchip.com, arend.vanspriel@broadcom.com,
 johannes@sipsolutions.net, gregkh@linuxfoundation.org,
 yury.norov@gmail.com, akpm@linux-foundation.org, hpa@zytor.com,
 alistair@popple.id.au, linux@rasmusvillemoes.dk,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, kuba@kernel.org, linux-kernel@vger.kernel.org,
 linux-fsi@lists.ozlabs.org, dri-devel@lists.freedesktop.org,
 linux-input@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mtd@lists.infradead.org, oss-drivers@corigine.com,
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com,
 linux-serial@vger.kernel.org, bpf@vger.kernel.org, jserv@ccns.ncku.edu.tw,
 Yu-Chun Lin <eleanor15x@gmail.com>
Subject: Re: [PATCH 02/17] bitops: Add generic parity calculation for u64
Message-ID: <20250224133431.2c38213f@pumpkin>
In-Reply-To: <bde62fee-4617-4db7-b92c-59fb958c4ca6@kernel.org>
References: <20250223164217.2139331-1-visitorckw@gmail.com>
 <20250223164217.2139331-3-visitorckw@gmail.com>
 <bde62fee-4617-4db7-b92c-59fb958c4ca6@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 24 Feb 2025 08:09:43 +0100
Jiri Slaby <jirislaby@kernel.org> wrote:

> On 23. 02. 25, 17:42, Kuan-Wei Chiu wrote:
> > Several parts of the kernel open-code parity calculations using
> > different methods. Add a generic parity64() helper implemented with the
> > same efficient approach as parity8().
> > 
> > Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
> > Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
> > Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> > ---
> >   include/linux/bitops.h | 22 ++++++++++++++++++++++
> >   1 file changed, 22 insertions(+)
> > 
> > diff --git a/include/linux/bitops.h b/include/linux/bitops.h
> > index fb13dedad7aa..67677057f5e2 100644
> > --- a/include/linux/bitops.h
> > +++ b/include/linux/bitops.h
> > @@ -281,6 +281,28 @@ static inline int parity32(u32 val)
> >   	return (0x6996 >> (val & 0xf)) & 1;
> >   }
> >   
> > +/**
> > + * parity64 - get the parity of an u64 value
> > + * @value: the value to be examined
> > + *
> > + * Determine the parity of the u64 argument.
> > + *
> > + * Returns:
> > + * 0 for even parity, 1 for odd parity
> > + */
> > +static inline int parity64(u64 val)
> > +{
> > +	/*
> > +	 * One explanation of this algorithm:
> > +	 * https://funloop.org/codex/problem/parity/README.html
> > +	 */
> > +	val ^= val >> 32;  
> 
> Do we need all these implementations? Can't we simply use parity64() for 
> any 8, 16 and 32-bit values too? I.e. have one parity().

I'm not sure you can guarantee that the compiler will optimise away
the unnecessary operations.

But:
static inline int parity64(u64 val)
{
	return parity32(val ^ (val >> 32))
}

should be ok.
It will also work on x86-32 where parity32() can just check the parity flag.
Although you are unlikely to manage to use the the PF the xor sets.

	David

> 
> > +	val ^= val >> 16;
> > +	val ^= val >> 8;
> > +	val ^= val >> 4;
> > +	return (0x6996 >> (val & 0xf)) & 1;
> > +}
> > +
> >   /**
> >    * __ffs64 - find first set bit in a 64 bit word
> >    * @word: The 64 bit word  
> 
> 

