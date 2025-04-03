Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B4CA7A7A8
	for <lists+dri-devel@lfdr.de>; Thu,  3 Apr 2025 18:14:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6B3710E269;
	Thu,  3 Apr 2025 16:14:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DRS71PKr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 034AC10E27E
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Apr 2025 16:14:07 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id
 d2e1a72fcca58-736c277331eso1309658b3a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Apr 2025 09:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743696847; x=1744301647; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=NsvCi3xr0wqbxukv6gNk2KWJs6cd/sHgcwpQSSqpQSc=;
 b=DRS71PKrwEQluznKaOh2KE0V0wN2oQSWROSu469ttEN//66dsvkNqKzJ63fa9Mc6eF
 60Y2Ehk916HVTkYX0fOuZigh8Sfg0ZlAmpKprIjyEPsllJY6ziSiMKMZA/daEiBu4hlg
 sxx30Gu6My8L1WufUxfiVtB3pPGO2VjXx+vxStt3jixcQwEWtN47aYsB3YTfcy19S3tE
 8JuwzwGqqte/jSo2aM0H7oDixh8MljEiJGLlvR+KgJm52Wx6E18z63UECqJ/Vs5DqXU5
 5OceonLnNw0fAcekasyykVUgn8qbZbhTRBFFLO/fVMZG9zPzlbdQWEzR5Z0zqhaZiyhq
 WqlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743696847; x=1744301647;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NsvCi3xr0wqbxukv6gNk2KWJs6cd/sHgcwpQSSqpQSc=;
 b=a1SJ/Qu4GUsJRtJoSMhPVnzNvxYg27BVgCIZ//lsI3w9rXdAvm4GfNQ4hLLhA/Itqm
 1O988T6k5Ne8hrY8jIh/yjuuEKTU5b3p7OdaovwNfGw+WdVO1vswiqWQUUkeQSf2qEKI
 huTDHy7KgQzfxZ5wCt0fvOp+9zx36bsbZlDP/o9+VlZYMIpGcai3rz70qZHqCAFsGWjj
 Au+ss0VKJI31fJoJsD6+NDJMivMQ9w6mxFoR0meayS2SYd8NMzrHx+0uryq+fcYIbpg9
 RxcFwNKUYNxms0g+MGwYAnfeudnuwP8BwH5F896bad9wiRFE29mIuHXoXKtGZTCTa3bY
 9vDQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCkLKr+pG1bBeVlRj6cMMR6ollSSWJZEjCkBADL1XSWLHkPpUlnyPwPPo9j4EjE9gj9NYgb1bWLRQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz4nkj4XJcUb8LJQjLU+uBV99qQmN3bB9mMn71pJKlNEJoG740y
 6xl1xLsq+9rGsiBzm6Ajzv9t6zQ0B+D4X4G4Z1NGn56p/5HseCdV
X-Gm-Gg: ASbGncsBi0tNbqi7uxcemxkVCaOoluzHGDAFnzUztnA+fixEdbRRynRO558SlTuZVse
 n0IvgnK0htQxSovawIASnH/Q0AbNjJBnN9WcHouef4lEQytAKdYrx2v5cN+dumFmolLz8DuFOYp
 Ax6c29ejAaFyjEI25L2tR7Da9dtKgtn/je3qAs8R0lJYg6cvVd2rljSQZs3VsYXegqpTT/mkM3i
 6UkTRBqPDK8P4NGhBQXAlXUDO2Ct25p9aaLvzEmMoFPfMQggFdGzmmEnnIly+Bpd6UPQpUkIxRQ
 ANCQizMCpHJoI/u/MUBR1aLpTe+2W99XwCULw5K27A8K
X-Google-Smtp-Source: AGHT+IGVU2+2TkhGwc9XcrbXTU+jprAkGrGQEy4B9m6YI+h73paRxRK7YqS+QjyFE8ZrGike3yIkRw==
X-Received: by 2002:a05:6a20:c886:b0:1ee:47e7:7e00 with SMTP id
 adf61e73a8af0-200f55ecf4dmr5333762637.13.1743696847264; 
 Thu, 03 Apr 2025 09:14:07 -0700 (PDT)
Received: from localhost ([216.228.125.129]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-af9bc3fd41dsm1416486a12.50.2025.04.03.09.14.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Apr 2025 09:14:06 -0700 (PDT)
Date: Thu, 3 Apr 2025 12:14:04 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Kuan-Wei Chiu <visitorckw@gmail.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>,
 David Laight <david.laight.linux@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Laurent.pinchart@ideasonboard.com, airlied@gmail.com,
 akpm@linux-foundation.org, alistair@popple.id.au,
 andrew+netdev@lunn.ch, andrzej.hajda@intel.com,
 arend.vanspriel@broadcom.com, awalls@md.metrocast.net, bp@alien8.de,
 bpf@vger.kernel.org, brcm80211-dev-list.pdl@broadcom.com,
 brcm80211@lists.linux.dev, dave.hansen@linux.intel.com,
 davem@davemloft.net, dmitry.torokhov@gmail.com,
 dri-devel@lists.freedesktop.org, eajames@linux.ibm.com,
 edumazet@google.com, eleanor15x@gmail.com,
 gregkh@linuxfoundation.org, hverkuil@xs4all.nl,
 jernej.skrabec@gmail.com, jirislaby@kernel.org, jk@ozlabs.org,
 joel@jms.id.au, johannes@sipsolutions.net, jonas@kwiboo.se,
 jserv@ccns.ncku.edu.tw, kuba@kernel.org, linux-fsi@lists.ozlabs.org,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-serial@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux@rasmusvillemoes.dk, louis.peens@corigine.com,
 maarten.lankhorst@linux.intel.com, mchehab@kernel.org,
 mingo@redhat.com, miquel.raynal@bootlin.com, mripard@kernel.org,
 neil.armstrong@linaro.org, netdev@vger.kernel.org,
 oss-drivers@corigine.com, pabeni@redhat.com,
 parthiban.veerasooran@microchip.com, rfoss@kernel.org,
 richard@nod.at, simona@ffwll.ch, tglx@linutronix.de,
 tzimmermann@suse.de, vigneshr@ti.com, x86@kernel.org
Subject: Re: [PATCH v3 00/16] Introduce and use generic parity16/32/64 helper
Message-ID: <Z-6zzP2O-Q7zvTLt@thinkpad>
References: <EB85C3C1-8A0D-4CB9-B501-BFEABDF3E977@zytor.com>
 <Z824SgB9Dt5zdWYc@visitorckw-System-Product-Name>
 <Z9CyuowYsZyez36c@thinkpad>
 <80771542-476C-493E-858A-D2AF6A355CC1@zytor.com>
 <Z9GtcNJie8TRKywZ@thinkpad>
 <Z9G2Tyypb3iLoBjn@visitorckw-System-Product-Name>
 <Z9KMKwnZXA2mkD2s@visitorckw-System-Product-Name>
 <Z+AlyB461xwMxMtG@visitorckw-System-Product-Name>
 <eec0dfd7-5e4f-4a08-928c-b7714dbc4a17@zytor.com>
 <Z+6dh1ZVIKWWOKaP@visitorckw-System-Product-Name>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z+6dh1ZVIKWWOKaP@visitorckw-System-Product-Name>
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

On Thu, Apr 03, 2025 at 10:39:03PM +0800, Kuan-Wei Chiu wrote:
> On Tue, Mar 25, 2025 at 12:43:25PM -0700, H. Peter Anvin wrote:
> > On 3/23/25 08:16, Kuan-Wei Chiu wrote:
> > > 
> > > Interface 3: Multiple Functions
> > > Description: bool parity_odd8/16/32/64()
> > > Pros: No need for explicit casting; easy to integrate
> > >        architecture-specific optimizations; except for parity8(), all
> > >        functions are one-liners with no significant code duplication
> > > Cons: More functions may increase maintenance burden
> > > Opinions: Only I support this approach
> > > 
> > 
> > OK, so I responded to this but I can't find my reply or any of the
> > followups, so let me go again:
> > 
> > I prefer this option, because:
> > 
> > a. Virtually all uses of parity is done in contexts where the sizes of the
> > items for which parity is to be taken are well-defined, but it is *really*
> > easy for integer promotion to cause a value to be extended to 32 bits
> > unnecessarily (sign or zero extend, although for parity it doesn't make any
> > difference -- if the compiler realizes it.)
> > 
> > b. It makes it easier to add arch-specific implementations, notably using
> > __builtin_parity on architectures where that is known to generate good code.
> > 
> > c. For architectures where only *some* parity implementations are
> > fast/practical, the generic fallbacks will either naturally synthesize them
> > from components via shift-xor, or they can be defined to use a larger
> > version; the function prototype acts like a cast.
> > 
> > d. If there is a reason in the future to add a generic version, it is really
> > easy to do using the size-specific functions as components; this is
> > something we do literally all over the place, using a pattern so common that
> > it, itself, probably should be macroized:
> > 
> > #define parity(x) 				\
> > ({						\
> > 	typeof(x) __x = (x);			\
> > 	bool __y;				\
> > 	switch (sizeof(__x)) {			\
> > 		case 1:				\
> > 			__y = parity8(__x);	\
> > 			break;			\
> > 		case 2:				\
> > 			__y = parity16(__x);	\
> > 			break;			\
> > 		case 4:				\
> > 			__y = parity32(__x);	\
> > 			break;			\
> > 		case 8:				\
> > 			__y = parity64(__x);	\
> > 			break;			\
> > 		default:			\
> > 			BUILD_BUG();		\
> > 			break;			\
> > 	}					\
> > 	__y;					\
> > })
> >
> Thank you for your detailed response and for explaining the rationale
> behind your preference. The points you outlined in (a)–(d) all seem
> quite reasonable to me.
> 
> Yury,
> do you have any feedback on this?
> Thank you.

My feedback to you:

I asked you to share any numbers about each approach. Asm listings,
performance tests, bloat-o-meter. But you did nothing or very little
in that department. You move this series, and it means you should be
very well aware of alternative solutions, their pros and cons.

Instead, you started a poll to pick the best solution. This is not
what I expected, and this is not how the best solution can be found.

To H. Peter and everyone:

Thank you for sharing your opinion on this fixed parity(). Your
arguments may or may not be important, depending on what existing
users actually need. Unfortunately, Kuan-Wei didn't collect
performance numbers and opinions from those proposed users.

I already told that, and I will say again: with the lack of any
evidence that performance and/or code generation is important here,
the best solution is one that minimizes maintainers' (my!) burden.

In other words, bool parity(unsigned long long). I'm OK to maintain
a macro, as well. I understand that more complicated solutions may be
more effective. I will take them only if they will be well advocated.

I hope this will help us to stop moving this discussion back and forth
and save our time, guys.

Thanks,
Yury
