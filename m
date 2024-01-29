Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E7E840967
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jan 2024 16:12:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A385E10F750;
	Mon, 29 Jan 2024 15:12:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com
 [209.85.219.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADC9810F15C;
 Mon, 29 Jan 2024 15:12:20 +0000 (UTC)
Received: by mail-yb1-f176.google.com with SMTP id
 3f1490d57ef6-dc64926af85so2204533276.0; 
 Mon, 29 Jan 2024 07:12:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706541080; x=1707145880; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=UyBI2+8L21ywPJPux+Uv+p4ig16OrBVzk8ATobFMmGw=;
 b=XVg6oY93kT6+GSivGj7ybYP3z24Xusqd4gBebw7UYa+hRWXrkEXrMuh3ZNl6AJaQH5
 h1NhlKs3El2qaYUJsDtXAWkKUViGvYeVUy3g2ZAjq6Wd8toBD98Jwwow7Ewlt7yMTJKX
 3MvegCZ68+XcBaG4cUV7s59+2Flg0QNRCxr64s/UyVPBp4O/x5CpH+s9FRyQu7EGU9LJ
 wcuEpsWx/aiySoSNegvHz1T9xJFZ1eu9k2b44tv2vqxeSUjWMFdlLfPEkQ9HZrp70T57
 1lkBI2is37g1N83D8dKokVmNiTLaOiT9OsjzyLbO2qBbEgdX+pfvh0BcR7duHkw0vtdJ
 aVRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706541080; x=1707145880;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UyBI2+8L21ywPJPux+Uv+p4ig16OrBVzk8ATobFMmGw=;
 b=gc4T41gUc8m+s+1vFYWyRMj1J3enUir0ruwOolcD6PJsEGHwp5ZI5kw6ix2r2LQCLk
 dqItm+j6pJBH9KJ4y36L4+042AnlBQzkbWP5PGrVm7jIVbK9xWM/k8Z4p29jp0s4g4jZ
 M1gI10YLokEhaVaxrJXvQbgbkgOVI2PRxCmcg1srFpTLQKSexu35EJOFuR8A9NiFp/cX
 0A+9B9MgVTHRSffZtS6tUzv7g4Y9yP7usnk6U4RUeRZtZ/2DwnSn9HZR/NU0DGy8DTLA
 OY03Ers0CAsBIVlmd/1Lqohmu5P4NDT7vqArLmnPjR6zaejim6N9meJfbZ0ZaMAttFZw
 ntFw==
X-Gm-Message-State: AOJu0YzdmI52JgsF9TwJxWLEJEq90TLTpbqGekFyWGxpSpQmnS0s1wDf
 nUjF5My8bHtrG5a6s1AvHmJfXaMy6x6Bm54Hl8FcOWiTXaaGJ+Ak
X-Google-Smtp-Source: AGHT+IH6s9vU8wXBWDMvXY5IJ1/1w2lOaFFb2+TzOnPFlDReNgorwWtIdEbPiAsxJhHbD0OsJTnBwg==
X-Received: by 2002:a5b:87:0:b0:dc2:2b1a:7246 with SMTP id
 b7-20020a5b0087000000b00dc22b1a7246mr2822490ybp.123.1706541078294; 
 Mon, 29 Jan 2024 07:11:18 -0800 (PST)
Received: from localhost ([2601:344:8301:57f0:6dcf:e3a4:263a:17d6])
 by smtp.gmail.com with ESMTPSA id
 u100-20020a25ab6d000000b00dc22fa579c5sm2320375ybi.45.2024.01.29.07.11.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jan 2024 07:11:17 -0800 (PST)
Date: Mon, 29 Jan 2024 07:11:17 -0800
From: Yury Norov <yury.norov@gmail.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: Re: Re: [PATCH 1/3] bits: introduce fixed-type genmasks
Message-ID: <ZbfAFZ4J5Gncb/xc@yury-ThinkPad>
References: <20240124050205.3646390-1-lucas.demarchi@intel.com>
 <20240124050205.3646390-2-lucas.demarchi@intel.com>
 <87v87jkvrx.fsf@intel.com>
 <gvkvihpcc45275idrfukjqbvgem767evrux5sx5lnh5hofqemk@ppbkcauitvwb>
 <ZbEsfl0tGLY+xJl0@yury-ThinkPad>
 <yro4nl7ryt6ckxpkctkaao6sd7j4533w2u66ae4kecpu6riszl@lj5sspyvapwq>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <yro4nl7ryt6ckxpkctkaao6sd7j4533w2u66ae4kecpu6riszl@lj5sspyvapwq>
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
Cc: intel-gfx@lists.freedesktop.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 29, 2024 at 08:49:35AM -0600, Lucas De Marchi wrote:
> On Wed, Jan 24, 2024 at 07:27:58AM -0800, Yury Norov wrote:
> > On Wed, Jan 24, 2024 at 08:03:53AM -0600, Lucas De Marchi wrote:
> > > On Wed, Jan 24, 2024 at 09:58:26AM +0200, Jani Nikula wrote:
> > > > On Tue, 23 Jan 2024, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> > > > > From: Yury Norov <yury.norov@gmail.com>
> > > > >
> > > > > Generalize __GENMASK() to support different types, and implement
> > > > > fixed-types versions of GENMASK() based on it. The fixed-type version
> > > > > allows more strict checks to the min/max values accepted, which is
> > > > > useful for defining registers like implemented by i915 and xe drivers
> > > > > with their REG_GENMASK*() macros.
> > > >
> > > > Mmh, the commit message says the fixed-type version allows more strict
> > > > checks, but none are actually added. GENMASK_INPUT_CHECK() remains the
> > > > same.
> > > >
> > > > Compared to the i915 and xe versions, this is more lax now. You could
> > > > specify GENMASK_U32(63,32) without complaints.
> > > 
> > > Doing this on top of the this series:
> > > 
> > > -#define   XELPDP_PORT_M2P_COMMAND_TYPE_MASK            REG_GENMASK(30, 27)
> > > +#define   XELPDP_PORT_M2P_COMMAND_TYPE_MASK            REG_GENMASK(62, 32)
> > > 
> > > and I do get a build failure:
> > > 
> > > ../drivers/gpu/drm/i915/display/intel_cx0_phy.c: In function ‘__intel_cx0_read_once’:
> > > ../include/linux/bits.h:41:31: error: left shift count >= width of type [-Werror=shift-count-overflow]
> > >    41 |          (((t)~0ULL - ((t)(1) << (l)) + 1) & \
> > >       |                               ^~
> > 
> > I would better include this in commit message to avoid people's
> > confusion. If it comes to v2, can you please do it and mention that
> > this trick relies on shift-count-overflow compiler check?
> 
> either that or an explicit check as it was suggested. What's your
> preference?

Let's put a comment in the code. An argument that shift-count-overflow
may be disabled sounds more like a speculation unless we have a solid
example of a build system where the error is disabled for a good sane
reason, but possible GENMASK() overflow is still considered dangerous.

GENMASK() is all about bit shifts, so shift-related error is something
I'd expect when using GENMASK().

Also, the macro is widely used in the kernel:

        yury:linux$ git grep GENMASK | wc -l
        26879

Explicit check would add pressure on the compiler for nothing. 

Thanks,
Yury
