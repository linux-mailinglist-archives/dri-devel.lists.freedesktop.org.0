Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 505FDA48AEC
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2025 22:57:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 107F810EBA4;
	Thu, 27 Feb 2025 21:57:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jeoc1DCF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B36D010EB99
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 21:57:48 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-43998deed24so14228245e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 13:57:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740693465; x=1741298265; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yMuX81k7SiNTHz2+bDlgy5RWfBuIrQmuJh6Y3XOI5k0=;
 b=jeoc1DCFht/prkVksTjvKA8g7bocGQ/Dip9lsfm8zCh9a2y8chpqQsoTTr2is1pFdY
 biMnKXNyA8DBOJNPfAlN8we/bIAJYLEgfIB5290QD6qYNu813lKoknR6lAGMTJyyowey
 9gJHch2PsOJFYexv+/bAs36ErpIN7FNrsZ6R/xrSSCXDKyKJRrfmx60rc/RsCCbrlDfZ
 iIvZ1axH3C2/AQJS8kQybEQ7JJ+sX6iY9NPMY/Q1cfV6ggUnHRtjqKqZyCpy6Uex+d1w
 iEVZu+5PuFyfD21jC4a27jk3Bs0u5as92qccLibWqt3Y9pWu/J7CHCi/q06usCw39qXi
 XxjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740693465; x=1741298265;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yMuX81k7SiNTHz2+bDlgy5RWfBuIrQmuJh6Y3XOI5k0=;
 b=CV0QKylAwjuFytJwCLCmTHzdipPCRZUnltCyqjajxb7+OTT9IzEcPr2WOFB0UoYNmq
 vq8hU/BgBLdImmaspXda2XQXuOl8wk5rXFYvPm2kkG3FD+gCMfK37r3eKBJdJdw8Xd2C
 qt2SU7UZD9E3Uyi4EQ5ggzGKtNp8Y3FtsFmrB2Z0ZzWRmbD5CIoCutXy24AbmQNVURa5
 TAzueWiYztNifPWcr2ixlKetz7EFcGT0JQuV8U7GkShanlwS+pgIJ+l23NDcQLt8L3os
 Idi75xhIBnYiPBT7Qsds1IatxPf2dsYOoIT5BfbDxVi4i6jeFzKHK4S6LdzDhUR9behM
 IfAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkeNGHVdz1/7zQE8NaX+w/c6Dn5dTZmDj709KHvWAG/ffWg4YFW5JyF3XTf9i3KAbRfDMbz33cdr4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy96pyB4WlWMgR3mgmh1naBchte/8oLuQspjUHYV2ncBiFlULQE
 6JB66hvOOMLUF7biiUw2duO+OfQIjkg41CMsipiYJ1GnAUKLyUIJ
X-Gm-Gg: ASbGncuRMCJNSsCYGbjl8ZSVtTEgT/3RwYEnkj0BKMf6vQGT5kIWWcwM+nlN8dPPMYv
 IR3HM2xh5GLtxGAxrLaBGWOpJmqDeDcSNqMBtUFX+zNJPg6pfZjPXxENsBtaoD9YeU4hdlAoyhC
 S/AmcKlzyL9Z2DZNQ4hPkqIuMB5CynRLRNRAkI1NDYBqj/uP97sCW6tABLZ263JMHVhxnvhCp/k
 WCCYk7dlaheL3/LsTeKtURLm8K4k4T/aR3GjUB7d/EI+/BReaUbvrIfj29GcHHjg2doaudzfIF1
 VM2NWSyoJNiej6ct6WwVVjlupNAlhGDKDV3WpqBR40PIP0dmRe5ej+J8A9ATB8j6
X-Google-Smtp-Source: AGHT+IEhn6JpdK4VbGGBYqWA0Kpl3+orzugSC/uMKlJ9X/pPv2vI6Oa6V51Yx+DCCez80jfd4SeOMA==
X-Received: by 2002:a05:600c:1912:b0:439:a1b8:a246 with SMTP id
 5b1f17b1804b1-43ba66f9643mr7425895e9.8.1740693464406; 
 Thu, 27 Feb 2025 13:57:44 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43b7370372dsm35525085e9.11.2025.02.27.13.57.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2025 13:57:43 -0800 (PST)
Date: Thu, 27 Feb 2025 21:57:41 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Yury Norov <yury.norov@gmail.com>
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
 jirislaby@kernel.org, akpm@linux-foundation.org, hpa@zytor.com,
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
Message-ID: <20250227215741.1c2e382f@pumpkin>
In-Reply-To: <Z8CpaaHv0ahHFVuK@thinkpad>
References: <20250223164217.2139331-1-visitorckw@gmail.com>
 <20250223164217.2139331-3-visitorckw@gmail.com>
 <Z7zIBwH4aUA7G9MY@thinkpad> <20250226222911.22cb0c18@pumpkin>
 <Z8CpaaHv0ahHFVuK@thinkpad>
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

On Thu, 27 Feb 2025 13:05:29 -0500
Yury Norov <yury.norov@gmail.com> wrote:

> On Wed, Feb 26, 2025 at 10:29:11PM +0000, David Laight wrote:
> > On Mon, 24 Feb 2025 14:27:03 -0500
> > Yury Norov <yury.norov@gmail.com> wrote:
> > ....  
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
> > 
> > You really don't want to do that!
> > gcc makes a right hash of it for x86 (32bit).
> > See https://www.godbolt.org/z/jG8dv3cvs  
> 
> GCC fails to even understand this. Of course, the __v should be an
> __auto_type. But that way GCC fails to understand that case 64 is
> a dead code for all smaller type and throws a false-positive 
> Wshift-count-overflow. This is a known issue, unfixed for 25 years!

Just do __v ^= __v >> 16 >> 16

> 
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=4210
>  
> > You do better using a __v32 after the 64bit xor.  
> 
> It should be an __auto_type. I already mentioned. So because of that,
> we can either do something like this:
> 
>   #define parity(val)					\
>   ({							\
>   #ifdef CLANG                                          \
>   	__auto_type __v = (val);			\
>   #else /* GCC; because of this and that */             \
>   	u64 __v = (val);			        \
>   #endif                                                \
>   	int __ret;					\
> 
> Or simply disable Wshift-count-overflow for GCC.

For 64bit values on 32bit it is probably better to do:
int p32(unsigned long long x)
{
    unsigned int lo = x;
    lo ^= x >> 32;
    lo ^= lo >> 16;
    lo ^= lo >> 8;
    lo ^= lo >> 4;
    return (0x6996 >> (lo & 0xf)) & 1;
}
That stops the compiler doing 64bit shifts (ok on x86, but probably not elsewhere).
It is likely to be reasonably optimal for most 64bit cpu as well.
(For x86-64 it probably removes a load of REX prefix.)
(It adds an extra instruction to arm because if its barrel shifter.)


> 
> > Even the 64bit version is probably sub-optimal (both gcc and clang).
> > The whole lot ends up being a bit single register dependency chain.
> > You want to do:  
> 
> No, I don't. I want to have a sane compiler that does it for me.
> 
> > 	mov %eax, %edx
> > 	shrl $n, %eax
> > 	xor %edx, %eax
> > so that the 'mov' and 'shrl' can happen in the same clock
> > (without relying on the register-register move being optimised out).
> > 
> > I dropped in the arm64 for an example of where the magic shift of 6996
> > just adds an extra instruction.  
> 
> It's still unclear to me that this parity thing is used in hot paths.
> If that holds, it's unclear that your hand-made version is better than
> what's generated by GCC.

I wasn't seriously considering doing that optimisation.
Perhaps just hoping is might make a compiler person think :-)

	David

> 
> Do you have any perf test?
> 
> Thanks,
> Yury

