Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E9D2A4873E
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2025 19:05:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7940E10E1D3;
	Thu, 27 Feb 2025 18:05:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bpIIRULX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ED3810E1D3
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 18:05:33 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-220e83d65e5so24296625ad.1
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 10:05:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740679533; x=1741284333; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=WlMEi7Una8TwxGaYzKJCUvFP5cGs/B6xguOFMjaN1Ww=;
 b=bpIIRULXKfvNHNsltVgqyNrpgPXL088n6ugq+NkqAPACjYYW+Hy5yHxzeLv/jDpV4h
 cHkBJJ3ioW2MMyozMkORjoW+4F2C6b8AuWNtFoqwSeEzrEU9mAXArboisQddKZ3zNN5W
 Q//ajv49fzjLJOzwSHaBQfyy4DtrrFhXxRuLsUIN33GY8eDZbB82hO3J3HnhurCG6+bx
 TUxvjbFea5/A6rGO62wYKMvqJs8fFeaCG9dxaWdBe7LStPXK9pBU9XKzSiWowYkjs25d
 cRHalsFPilMcfJvjnonY8gFW3GmlgULmGNm6Wzq3uUDgyfRgN11j5ply7zTTJyjjTbKc
 OThw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740679533; x=1741284333;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WlMEi7Una8TwxGaYzKJCUvFP5cGs/B6xguOFMjaN1Ww=;
 b=Q0EV0qi2RcYz+rmmjaPByQh9F3SI/XZxs8m8qVupF/g2+6CAs83lwIY2f8hhkatQvV
 b+7iq7OlI1xvTmJ4W/ZM47xUmj4OF73Of8D3KIWBLhqiDox933i70VXekU0PUHmZheSE
 ipJe1uA8CrilBi0xTjMoIVJudN+c0wcovFPJo5VHX1MVi8TUa5qnmX/YC0lwLj7/JSdd
 xx6kRZQcP/s3Q8ePcC7BxvjZa5VUh1uEWCze6Kbfz73PHVgk9jG240zf/hPo+ZBjIPFN
 nRYv2q+/LUibOKhmKYjeCrZXPfaaZG8i0aRlSQdT+YzV+ZFboanqBhyxg7b31kcQxAWf
 EF0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWiMDl2Qp0OXOQHxzgHJGVF1I2dW0TAc0SvT6v8m1aqPoavxA8EVJHapEEdqSTkcGoCjXi4G4QN7P8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwrGG9d9SEQbuV2mFWs/GtYBb5xtrbRXhaCCkg19P94VVJ5cmcM
 obA9ypYVfAdhFG3odghopMIGK6WkVsM9GaBoJY06wCDlJCn3bHLI
X-Gm-Gg: ASbGnctOnQ+jNd3peczRhvQFjxxSWSRUTLfOxC3BQbUzhMXmdMEjxbmEeCqvYj+1dsh
 qpyFF0wL0JyY/COYI5NeYrQSfG/H/xxSRy5dDYfKDIeS6SzONhcZiy39AoE76MSiCVXTq/tEQBD
 KzQv6oXPNBlFHMmacIULZC/cEXoaEE0OW2cVVQToEuUXq6lUuXinTIVKSatXKKeL1CdmvJ+6viq
 CXU/PhEN83MBg+CBAf8xZrMbYnv06P55QDNSie8q2Y6yzexlauuUVTEmYuzq0wFv9J3ZqNyDdPm
 USsmtMUZlvEtHuW1ggsBnZxeiy9f88sHfIu3BFrkxAcEKBw5wg==
X-Google-Smtp-Source: AGHT+IEnEhzc2owT1KH+D6qO8Y01zbjbSELOHxZjQy0YabJgdb+peb2Mulxfa+PI8nU5R7zu0Cxkog==
X-Received: by 2002:a05:6a00:806:b0:732:2170:b6a3 with SMTP id
 d2e1a72fcca58-734ac44b986mr473864b3a.21.1740679532704; 
 Thu, 27 Feb 2025 10:05:32 -0800 (PST)
Received: from localhost (maglev-oncall.nvidia.com. [216.228.125.128])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-734a00600e1sm2015088b3a.171.2025.02.27.10.05.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2025 10:05:32 -0800 (PST)
Date: Thu, 27 Feb 2025 13:05:29 -0500
From: Yury Norov <yury.norov@gmail.com>
To: David Laight <david.laight.linux@gmail.com>
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
 jirislaby@kernel.org, akpm@linux-foundation.org, hpa@zytor.com,
 alistair@popple.id.au, linux@rasmusvillemoes.dk,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, kuba@kernel.org,
 linux-kernel@vger.kernel.org, linux-fsi@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
 oss-drivers@corigine.com, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
 brcm80211-dev-list.pdl@broadcom.com, linux-serial@vger.kernel.org,
 bpf@vger.kernel.org, jserv@ccns.ncku.edu.tw,
 Yu-Chun Lin <eleanor15x@gmail.com>
Subject: Re: [PATCH 02/17] bitops: Add generic parity calculation for u64
Message-ID: <Z8CpaaHv0ahHFVuK@thinkpad>
References: <20250223164217.2139331-1-visitorckw@gmail.com>
 <20250223164217.2139331-3-visitorckw@gmail.com>
 <Z7zIBwH4aUA7G9MY@thinkpad> <20250226222911.22cb0c18@pumpkin>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250226222911.22cb0c18@pumpkin>
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

On Wed, Feb 26, 2025 at 10:29:11PM +0000, David Laight wrote:
> On Mon, 24 Feb 2025 14:27:03 -0500
> Yury Norov <yury.norov@gmail.com> wrote:
> ....
> > +#define parity(val)					\
> > +({							\
> > +	u64 __v = (val);				\
> > +	int __ret;					\
> > +	switch (BITS_PER_TYPE(val)) {			\
> > +	case 64:					\
> > +		__v ^= __v >> 32;			\
> > +		fallthrough;				\
> > +	case 32:					\
> > +		__v ^= __v >> 16;			\
> > +		fallthrough;				\
> > +	case 16:					\
> > +		__v ^= __v >> 8;			\
> > +		fallthrough;				\
> > +	case 8:						\
> > +		__v ^= __v >> 4;			\
> > +		__ret =  (0x6996 >> (__v & 0xf)) & 1;	\
> > +		break;					\
> > +	default:					\
> > +		BUILD_BUG();				\
> > +	}						\
> > +	__ret;						\
> > +})
> > +
> 
> You really don't want to do that!
> gcc makes a right hash of it for x86 (32bit).
> See https://www.godbolt.org/z/jG8dv3cvs

GCC fails to even understand this. Of course, the __v should be an
__auto_type. But that way GCC fails to understand that case 64 is
a dead code for all smaller type and throws a false-positive 
Wshift-count-overflow. This is a known issue, unfixed for 25 years!

https://gcc.gnu.org/bugzilla/show_bug.cgi?id=4210
 
> You do better using a __v32 after the 64bit xor.

It should be an __auto_type. I already mentioned. So because of that,
we can either do something like this:

  #define parity(val)					\
  ({							\
  #ifdef CLANG                                          \
  	__auto_type __v = (val);			\
  #else /* GCC; because of this and that */             \
  	u64 __v = (val);			        \
  #endif                                                \
  	int __ret;					\

Or simply disable Wshift-count-overflow for GCC.

> Even the 64bit version is probably sub-optimal (both gcc and clang).
> The whole lot ends up being a bit single register dependency chain.
> You want to do:

No, I don't. I want to have a sane compiler that does it for me.

> 	mov %eax, %edx
> 	shrl $n, %eax
> 	xor %edx, %eax
> so that the 'mov' and 'shrl' can happen in the same clock
> (without relying on the register-register move being optimised out).
> 
> I dropped in the arm64 for an example of where the magic shift of 6996
> just adds an extra instruction.

It's still unclear to me that this parity thing is used in hot paths.
If that holds, it's unclear that your hand-made version is better than
what's generated by GCC.

Do you have any perf test?

Thanks,
Yury
