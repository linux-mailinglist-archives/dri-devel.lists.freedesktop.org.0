Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A6CD83AD4F
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jan 2024 16:29:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0F6010EA4D;
	Wed, 24 Jan 2024 15:29:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com
 [209.85.128.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B39410EA4D;
 Wed, 24 Jan 2024 15:29:00 +0000 (UTC)
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-6029b5946f5so5731667b3.1; 
 Wed, 24 Jan 2024 07:29:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706110080; x=1706714880; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=gxAN85gUI3DtBv5GX7Pwg8/v675qo3nL0TCB7s3sYeo=;
 b=lQzPUZGbsfE0oU/ch0+XUvCONhSO3z1kvotEeUu96P1FLo6FQBr9LYMbMKEVswSxs5
 8BvBF43/KcM6NAewM42jdcg3QzyMDZe4ugRZv0SaOHbWpolN1kWfpxfF/NJfl/kPFqb+
 tTP7n3YCfN7//Ld4VXwql9MmcqqsYQm9CjYxZDTroKhq4HhzzC3LgXPCwpXvFIaaWv67
 9k0WUs659a5cVX5bP5ibeFkg3DeNOHpM3C9QCoDn7Losvplkdm92HWr1OGqqtK82gtl5
 w4cGhA23ggyd4jp14siut2oi9jxfntUrW9e8uR9bcznW2f2996DzwWccwdVrFda2R6gN
 p3Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706110080; x=1706714880;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gxAN85gUI3DtBv5GX7Pwg8/v675qo3nL0TCB7s3sYeo=;
 b=vAZ/Zk3v6OrTgTMF1ddnTfmSXScBgYLl8+fGuuvxjvVgDdxMV2lP4c6zyGwdawg4a1
 P0kqigNTTorhBcUOPbtDk4dKlJCYPeUQkZeWgs2uHtvRogXjXJz5p0zjkgxuGOn+Vr34
 t/oSV/dKMk0hygxVTFu8AJKE/z3x8FCcXBMQ5Rv1N0shHqQgY+Sn6Z+1DEWtfTquvIca
 eiiVVe3Y8TRhi6oa2Yqbj9JKrOCD23K7c8ZuRbFQ//NbTsv4tVvR/3/6FNwHJ58kk9xS
 CF4P8eF5hqT30Ma/a+ff0+2ZTAbg59yUI6tZs42Ii6a9oDhWS1oBzoFMCrTwmz6VJveS
 kTTg==
X-Gm-Message-State: AOJu0YzqIorZcZDVvn/y+dXkbHwYCk9V2uH8mFNb6EW4I6ycd9XIx7vy
 I93ERpBuccjP8yDVjcEhtEzEOglcLkcIAzUY8rJ9SScgWGcfXWgm
X-Google-Smtp-Source: AGHT+IF+Nrdu9tGDR3beDItGL0E/OCg5dlfhAXrIkzQiMnlkPIfHnj8IoCqnWGxeMxmoNRKEWLNNSQ==
X-Received: by 2002:a81:a251:0:b0:5ed:b2a2:1279 with SMTP id
 z17-20020a81a251000000b005edb2a21279mr609856ywg.16.1706110079553; 
 Wed, 24 Jan 2024 07:27:59 -0800 (PST)
Received: from localhost ([2601:344:8301:57f0:abdb:7236:6977:9ab5])
 by smtp.gmail.com with ESMTPSA id
 l124-20020a0de282000000b005ff9dac3ff0sm652ywe.56.2024.01.24.07.27.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jan 2024 07:27:59 -0800 (PST)
Date: Wed, 24 Jan 2024 07:27:58 -0800
From: Yury Norov <yury.norov@gmail.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: Re: [PATCH 1/3] bits: introduce fixed-type genmasks
Message-ID: <ZbEsfl0tGLY+xJl0@yury-ThinkPad>
References: <20240124050205.3646390-1-lucas.demarchi@intel.com>
 <20240124050205.3646390-2-lucas.demarchi@intel.com>
 <87v87jkvrx.fsf@intel.com>
 <gvkvihpcc45275idrfukjqbvgem767evrux5sx5lnh5hofqemk@ppbkcauitvwb>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <gvkvihpcc45275idrfukjqbvgem767evrux5sx5lnh5hofqemk@ppbkcauitvwb>
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 24, 2024 at 08:03:53AM -0600, Lucas De Marchi wrote:
> On Wed, Jan 24, 2024 at 09:58:26AM +0200, Jani Nikula wrote:
> > On Tue, 23 Jan 2024, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> > > From: Yury Norov <yury.norov@gmail.com>
> > > 
> > > Generalize __GENMASK() to support different types, and implement
> > > fixed-types versions of GENMASK() based on it. The fixed-type version
> > > allows more strict checks to the min/max values accepted, which is
> > > useful for defining registers like implemented by i915 and xe drivers
> > > with their REG_GENMASK*() macros.
> > 
> > Mmh, the commit message says the fixed-type version allows more strict
> > checks, but none are actually added. GENMASK_INPUT_CHECK() remains the
> > same.
> > 
> > Compared to the i915 and xe versions, this is more lax now. You could
> > specify GENMASK_U32(63,32) without complaints.
> 
> Doing this on top of the this series:
> 
> -#define   XELPDP_PORT_M2P_COMMAND_TYPE_MASK            REG_GENMASK(30, 27)
> +#define   XELPDP_PORT_M2P_COMMAND_TYPE_MASK            REG_GENMASK(62, 32)
> 
> and I do get a build failure:
> 
> ../drivers/gpu/drm/i915/display/intel_cx0_phy.c: In function ‘__intel_cx0_read_once’:
> ../include/linux/bits.h:41:31: error: left shift count >= width of type [-Werror=shift-count-overflow]
>    41 |          (((t)~0ULL - ((t)(1) << (l)) + 1) & \
>       |                               ^~

I would better include this in commit message to avoid people's
confusion. If it comes to v2, can you please do it and mention that
this trick relies on shift-count-overflow compiler check?
 
Thanks,
Yury
