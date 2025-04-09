Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDDD0A83053
	for <lists+dri-devel@lfdr.de>; Wed,  9 Apr 2025 21:21:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B78D010E6F2;
	Wed,  9 Apr 2025 19:21:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="IClTU/OV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CECB310E6F2
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Apr 2025 19:21:33 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id
 d2e1a72fcca58-736b350a22cso6478466b3a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Apr 2025 12:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744226493; x=1744831293; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=+fSnm+LAeRoIOsICdxC6XJUJVWVyIvXXXOFvA8oRabs=;
 b=IClTU/OV/rftUY3D/hg6DizhdRt4dQt2euZT7CBDy7uV6TxTi60BCHKPXaEUBQbTWM
 PJickmi8WrfMh4x71lewWDoO2KWcU0tl6jPvI96gbNTSsLTXMNRA2aEsuGEmMf3fpxs/
 JU0p6FU/cN28WI5SZCXMeyG1junsR7YkkoR21GryRgvYSFUcpzza2eNpzcWtc7q3YRTe
 G6uY7RVv0dCmJ5TpVGSWav3yaw31q7hHMfQH76ta25q1kHaJmVGigCUo4g36xvqD4+L6
 jm8IEUuQklXcy/fZAWyZ/XYpHr8Inphi6tWclDiQxnnuORYXqeWMg3D7rvqh/WEqS2do
 SZ3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744226493; x=1744831293;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+fSnm+LAeRoIOsICdxC6XJUJVWVyIvXXXOFvA8oRabs=;
 b=MeMlbbAXleP3EoeilIKQsaS6d88l/mEy9L1vmB/r2AaBqT2UeBhhjK5XN0mIHdzkFL
 tRpRppe2gHMEaSNM2Xk2AKC97xD0JmrcXNq4q0pKQn3smk06xLs/Y6SFQdEUtSnztKof
 AOcK9FbPRXGgL4lbYJVljBcCEgPpXiCaHxUifCk7+BaztKoS208+R2a3Ania4GsyfCIG
 rssNYhoL4VXohncbBoZxLxtbuuMjepkmrrpGw0WnTnnDIa43X/q+EchKWO6v2J4e2l24
 D459tlDgdTCiMEffquZb4lADrBJx/E2UChR/sR7+0UtJromE4/ej/biCtToAnFEy/71a
 YwHQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXR56hrXvF4682lxXc6Gp+g+EEy+1FHBzmXFUDe+4Efa1GuaJBmPZZPx4xQrpeG1KgHmSvqNithYZg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx8dMY7ekGLIShUtUBtLOwCs0mjoAoIRbkumshWK8m3P6h6R6qZ
 qJH+mEsKYOUnrN3fcxJng9TsH7ygYM6+BZ3fO3y35EppVQE6eaHK
X-Gm-Gg: ASbGncvOR4BRaNWBM/4O52V/TTe9BXCqZI3C83pTlneSJZsHwoNa++/AYeWZOlOoE7G
 YxBIf+fjLolK8WoNVJ8bIn5vhF63jib8l/ct5oEHvnxfT8CnsIYFVRzld1cfgYkH+2tQWPmzLn3
 JoshhqHBur4diIPbxidp07zGB38pxymK/wKq20uCA1boWb+j05Sh/bdSs89sYWnsbdwJGIZeZ6f
 e9qLgiHfW+onBOqHT+DBumm+X3psL/9uk9KPoKPJ7fpU6N/dC1C2I/xokT3YgL42kkCX3kIRWkp
 0ctJS4OO/e3As1D1Q6s2KU01dYiIEHGEADybdIgerpkZ+d2jDW8XnvE19L0aHdHGWMtE
X-Google-Smtp-Source: AGHT+IHAXQm8yqDVRx3hUkKcG0uQQDMrqQOD2SeunqXbiHMcL37CayQuCVkU18t9V7SBUxyy5kmIoQ==
X-Received: by 2002:a05:6a20:9c89:b0:1f5:873b:3d32 with SMTP id
 adf61e73a8af0-201695fb36dmr272504637.39.1744226492588; 
 Wed, 09 Apr 2025 12:21:32 -0700 (PDT)
Received: from visitorckw-System-Product-Name ([140.113.216.168])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73bb1e69376sm1726443b3a.165.2025.04.09.12.21.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Apr 2025 12:21:32 -0700 (PDT)
Date: Thu, 10 Apr 2025 03:21:21 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, Yury Norov <yury.norov@gmail.com>
Cc: Yury Norov <yury.norov@gmail.com>, tglx@linutronix.de, mingo@redhat.com,
 bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
 jk@ozlabs.org, joel@jms.id.au, eajames@linux.ibm.com,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 rfoss@kernel.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, dmitry.torokhov@gmail.com, mchehab@kernel.org,
 awalls@md.metrocast.net, hverkuil@xs4all.nl,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 louis.peens@corigine.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 parthiban.veerasooran@microchip.com, arend.vanspriel@broadcom.com,
 johannes@sipsolutions.net, gregkh@linuxfoundation.org,
 jirislaby@kernel.org, akpm@linux-foundation.org, jdelvare@suse.com,
 alexandre.belloni@bootlin.com, pgaj@cadence.com, hpa@zytor.com,
 alistair@popple.id.au, linux@rasmusvillemoes.dk,
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
Subject: Re: [PATCH v4 01/13] bitops: Change parity8() to parity_odd() with
 u64 input and bool return type
Message-ID: <Z/bIsT7RT1C7rGYC@visitorckw-System-Product-Name>
References: <20250409154356.423512-1-visitorckw@gmail.com>
 <20250409154356.423512-2-visitorckw@gmail.com>
 <Z_anYpZw_E8ehN21@yury>
 <Z/a7t1yATUXn11vD@visitorckw-System-Product-Name>
 <315b4c75-a596-4509-99f7-921ebda2fed9@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <315b4c75-a596-4509-99f7-921ebda2fed9@roeck-us.net>
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

On Wed, Apr 09, 2025 at 11:39:22AM -0700, Guenter Roeck wrote:
> On 4/9/25 11:25, Kuan-Wei Chiu wrote:
> > On Wed, Apr 09, 2025 at 12:59:14PM -0400, Yury Norov wrote:
> > > On Wed, Apr 09, 2025 at 11:43:44PM +0800, Kuan-Wei Chiu wrote:
> > > > Redesign the parity8() helper as parity_odd(), changing its input type
> > > > from u8 to u64 to support broader use cases and its return type from
> > > > int to bool to clearly reflect the function's binary output. The
> > > > function now returns true for odd parity and false for even parity,
> > > > making its behavior more intuitive based on the name.
> > > > 
> > > > Also mark the function with __attribute_const__ to enable better
> > > > compiler optimization, as the result depends solely on its input and
> > > > has no side effects.
> > > > 
> > > > While more efficient implementations may exist, further optimization is
> > > > postponed until a use case in performance-critical paths arises.
> > > > 
> > > > Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
> > > > Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
> > > > Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> > > > ---
> > > >   arch/x86/kernel/bootflag.c               |  4 ++--
> > > >   drivers/hwmon/spd5118.c                  |  2 +-
> > > >   drivers/i3c/master/dw-i3c-master.c       |  2 +-
> > > >   drivers/i3c/master/i3c-master-cdns.c     |  2 +-
> > > >   drivers/i3c/master/mipi-i3c-hci/dat_v1.c |  2 +-
> > > >   include/linux/bitops.h                   | 19 ++++++++++++-------
> > > >   6 files changed, 18 insertions(+), 13 deletions(-)
> > > > 
> > > > diff --git a/arch/x86/kernel/bootflag.c b/arch/x86/kernel/bootflag.c
> > > > index 73274d76ce16..86aae4b2bfd5 100644
> > > > --- a/arch/x86/kernel/bootflag.c
> > > > +++ b/arch/x86/kernel/bootflag.c
> > > > @@ -26,7 +26,7 @@ static void __init sbf_write(u8 v)
> > > >   	unsigned long flags;
> > > >   	if (sbf_port != -1) {
> > > > -		if (!parity8(v))
> > > > +		if (!parity_odd(v))
> 
> What is the benefit of this change all over the place instead of
> adding parity_odd() as new API and keeping the old one (just letting
> it call the new API) ?
> 
> A simple
> 
> static inline int parity8(u8 val)
> {
> 	return parity_odd(val);
> }
> 
> would have done the trick and be much less invasive.
> 
Yury has previously mentioned that adding multiple fixed-type parity
functions increases his maintenance burden. IIUC, he prefers having a
single interface in bitops.h rather than multiple ones.

He were reluctant to add three more functions like:

static inline bool parity16(u16 val)
{
    return parity8(val ^ (val >> 8));
}

static inline bool parity32(u32 val)
{
    return parity16(val ^ (val >> 16));
}

static inline bool parity64(u64 val)
{
    return parity32(val ^ (val >> 32));
}

But instead, we ended up with:

static inline bool parity(u64 val)
{
    val ^= val >> 32;
	val ^= val >> 16;
	val ^= val >> 8;
	val ^= val >> 4;
	return (0x6996 >> (val & 0xf)) & 1;
}

static inline bool parity8(u8 val)
{
    return parity_odd(val);
}

But in the end, we introduced both parity(u64) and parity8(u8), which,
IMHO, might be even more confusing than having consistent fixed-type
helpers.

Regards,
Kuan-Wei

