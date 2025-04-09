Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEBB5A82EC9
	for <lists+dri-devel@lfdr.de>; Wed,  9 Apr 2025 20:33:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF96110E2D5;
	Wed,  9 Apr 2025 18:33:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="N0jSZ1UT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DC4F10E2D5
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Apr 2025 18:33:09 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-22438c356c8so70218335ad.1
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Apr 2025 11:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744223589; x=1744828389; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=pEZZtQmHxD6cS3JefhP/59PsGmANbj8tqGBgctIT62U=;
 b=N0jSZ1UTj2QwcviReuk9tsahR7s/Agm+2e4u+x+bbYNzZNq2X43PdObAmKkiV0FQuD
 vfISx0I+2UFfMq/HcRJCfXBH5ZIcr3hc53BTxwYM0Hu0ELrweO6iU1cAoIDLdZGJriy2
 8tKm9rQ63P7aY+jICJfHWAa96AacvIQxb8hKVVQwTwNeBIBfrGVyzivXFREQhFzvqbcs
 GKIUiL3TNOPCP1NqvUesnbpE/Rn9U9l7j94eacLuznJiE9PV5G++L53s4lN2xwsfcPrp
 7QLi8jTi7FLzFrkP6jik4Nc2d4NorJnCbOJvPNin4Ca9mwzu7Xgx5RDMnhjF2Ustq/ii
 LkKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744223589; x=1744828389;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pEZZtQmHxD6cS3JefhP/59PsGmANbj8tqGBgctIT62U=;
 b=SwB2cx0mBM/js7fusJqVsc4Idg+RkMR+Ysr3GRWcb3EMD7Uzpy+uOm1Fog+PnkEqJa
 Fx36lG+ce0iNlpuZ7oi2s1KsQ3gLbYD5tp3j4jpG75DMiRdMlyd5dBZBzpVWcY0Zprdp
 ksiQQC70ukSPZwA9bfDoF+xawvijrxrlWC7/hdQh2DAmz0Y6hAeaizdFkBxH0N86nLPy
 /mPlgDMyiG2VmRPTj35MgBlhBaXFPs4WTlkLQu6hl2nsInIgwWj9Wi+Br0tGNED7xksO
 cXmU4fMIlI8tYNn9GCAu9ZqHCvjj/Y2mQn4V3zncVAb054tlYRnGAW/WqyBDkeZ3CREw
 Yazw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVo7BpKm9G2kt7NcbPr7hukqIS+Z6AIT1EK7ewsFJJIyJtZZlYUTgq/IEHoqsKfwBp31kbxYc+vapQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwyihYjWO/vh7AG2xBZ21lnBgF9FaBFFyHb4krNbuUoIBDE+gLQ
 KXWnHf9RFZKlKl6FBespKBI0s+bQ0HyHPxs2WuBY1Hv3SXaazMNo
X-Gm-Gg: ASbGncvp/01a3KaZvOws2hZ7vtTs96J2LPCUnXg3bK4/2DrfxaaQs52CaUhY8tG9YEc
 3eqYjaD5ahRHMNshvOnSBXmerlf7u6sjrIMnZwFxuctF77tcpzpBFj7yxXQOBm27QcYQ5smfdzS
 cdcPBBeqegCvy43vbFrxqQQH7yBrybQnQLsrfuqwb/uii7aCu+k4YKNMAokJPH0LD0ON0moZcTx
 ezIXfhi15tOpTj8diXzGyQGiWLl1ryjkRDaz5yRDfuqNOfqgWAyKv/JP457BJ18HcAoSQtKuHdR
 5eIE0Ve8vrNn2jWEgJY0wWkLbiZJGtDgqbI2LNLF
X-Google-Smtp-Source: AGHT+IE8wK8xLsT0Kpo2+eqnCnHqRBL6GoNWR5XNtZUkQwRprgm7rO+knOmPkUYsLXDP1SYqhAYEsw==
X-Received: by 2002:a17:903:2f86:b0:224:10a2:cae1 with SMTP id
 d9443c01a7336-22ac2a25780mr61351915ad.37.1744223589016; 
 Wed, 09 Apr 2025 11:33:09 -0700 (PDT)
Received: from localhost ([216.228.127.131]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b02a0817f2dsm1575586a12.11.2025.04.09.11.33.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Apr 2025 11:33:08 -0700 (PDT)
Date: Wed, 9 Apr 2025 14:33:06 -0400
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
Subject: Re: [PATCH v4 00/13] Introduce parity_odd() and refactor redundant
 parity code
Message-ID: <Z_a9YpE46Xf8581l@yury>
References: <20250409154356.423512-1-visitorckw@gmail.com>
 <Z_amQp3gK5Dm8Qz3@yury>
 <Z/a5Qh/OeLT8JBS4@visitorckw-System-Product-Name>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z/a5Qh/OeLT8JBS4@visitorckw-System-Product-Name>
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

On Thu, Apr 10, 2025 at 02:15:30AM +0800, Kuan-Wei Chiu wrote:
> On Wed, Apr 09, 2025 at 12:54:35PM -0400, Yury Norov wrote:
> > On Wed, Apr 09, 2025 at 11:43:43PM +0800, Kuan-Wei Chiu wrote:
> > > Several parts of the kernel contain open-coded and redundant
> > > implementations of parity calculation. This patch series introduces
> > > a unified helper, parity_odd(), to simplify and standardize these
> > > cases.
> > > 
> > > The first patch renames parity8() to parity_odd(), changes its argument
> > 
> > Alright, if it's an extension of the area of applicability, it should be
> > renamed to just parity(). I already shared a table that summarized the
> > drivers authors' view on that, and they clearly prefer not to add the
> > suffix - 13 vs 2. The __builtin_parity() doesn't care of suffix as well. 
> > 
> > https://lore.kernel.org/all/Z9GtcNJie8TRKywZ@thinkpad/
> > 
> > Yes, the argument that boolean function should explain itself sounds
> > correct, but in this case, comment on top of the function looks enough
> > to me.
> > 
> > The existing codebase doesn't care about the suffix as well. If no
> > strong preference, let's just pick a short and sweet name?
> > 
> I don't have a strong preference for the name, but if I had to guess
> the return value from the function prototype, I would intuitively
> expect an int to return "0 for even and 1 for odd," and a bool to
> return "true for even, false for odd." I recall Jiri and Jacob shared
> similar thoughts, which is why I felt adding _odd could provide better
> clarity.

I think they said they are convinced that parity should return 1 for
odd because of folding and __builtin_parity() arguments.
 
> However, I agree that if the kernel doc comment is clear, it might not
> be a big issue. But David previously mentioned that he doesn't want to
> rely on checking the function's documentation every time while reading
> the code.

He's wrong. Kernel engineers _must_ read documentation, regardless.
 
> Regardless, I'm flexible as long as we all reach a consensus on the
> naming.
> 
> > > type from u8 to u64 for broader applicability, and updates its return
> > > type from int to bool to make its usage and return semantics more
> > > intuitive-returning true for odd parity and false for even parity. It
> > > also adds __attribute_const__ to enable compiler optimizations.
> > 
> > That's correct and nice, but can you support it with a bloat-o-meter's
> > before/after and/or asm snippets? I also think it worth to be a separate
> > patch, preferably the last patch in the series.
> > 
> I quickly tested it with the x86 defconfig, and it appears that the
> generated code doesn't change. I forgot who requested the addition
> during the review process, but I initially thought it would either
> improve the generated code or leave it unchanged without significantly
> increasing the source code size.

That's what I actually expected, but was shy to guess openly. :). It's
hard to imagine how compiler may improve code generation in this case...

This attribute is used when there's an asm block, or some non-trivial
function call. In this case, the function is self-consistent and makes
no calls. And you see, const annotation raises more questions than
solves problems. Let's drop it.

Thanks,
Yury
