Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B0B83233A
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jan 2024 03:03:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B0C510E09F;
	Fri, 19 Jan 2024 02:03:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com
 [209.85.219.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBB5A10E09F;
 Fri, 19 Jan 2024 02:03:00 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id
 3f1490d57ef6-dc256e97e0aso244503276.2; 
 Thu, 18 Jan 2024 18:03:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705629720; x=1706234520; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=9UL4ovdZqy7pqFm08qbXwQcz8rBwgeWh/wVxSrYGEaQ=;
 b=nk+MjAQUHM+zbxcIrgRvtlSRBmsKymn3RrUpryiekhyKvssI1dL9Na7EZhvh68sVl5
 VzjYkIOy8Ay3mhhr41Jwp8GVWCkF2YMtdFySJoIVAKu5SqcZXlqiQbsly5XxJmEYxS0l
 Ou6pxVU5tcUz6MCPNS0CbmODhVS/GcoFq8T6IkPxIdkmrmG2LaSjr1Z8/Ji+hoSj7DWU
 hC/bOdgVJoySMiBQWc8e3nIXU9Q1/kZQnfy8REUTSRCgC+SUfsuVNM9VkGAixeSPqLJa
 3ulHclj2P5g/Q26tDjbD35Z6Ro6EOVuXdw2YLSX8JydlSjxjXuOvgG9ysnJlaSMhl6My
 BuIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705629720; x=1706234520;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9UL4ovdZqy7pqFm08qbXwQcz8rBwgeWh/wVxSrYGEaQ=;
 b=tGCUyiuH/vxLXORMe8VdX68aGKqxaKesZc7Syf0MZDkL23YObV9MbrJQphQY1pg5x0
 WRYWNzbU318/k/DY0M61rnaLOS5TJXULAiElsEyuosaPHU+FzPo3FRWlkbkf4gdJexZa
 seiGDeDuEeJu4zD2o3lr1+DMiDrJO4vjOLo27ESY8gaVFRQh+NPdF6LlxYQ5Pqb3XfHC
 JYIQrLdnXBdl3yZqhNMEcaFHUv+Q6yDYEKOS50Qh1JQjH6CDEIFG6KkuYAq2M88XwiSU
 2dyaRMPCw/cVVLyDzywVUdXLus43stQGMmJ6pm/GL9GK8FwILIzLa3rK0d0WBbJ+FTLA
 2+2w==
X-Gm-Message-State: AOJu0Yweisc1RBymgj25Y2dRo2eFPOJ9bcTPMUnM1q8rsILmFxQt9Nre
 rLL/xV+pv9LoQKqznuaHb1APzn/hWyTqPGncrncP32TDqt9CaVrF
X-Google-Smtp-Source: AGHT+IG7JQ2tL8aWjeUHeYlWG31vdKxDYL0jEF5eQRQ9/uYReJn96n+BQ3e84rd83trDzvtCTtI1+w==
X-Received: by 2002:a25:acc8:0:b0:dc2:1bc4:e06b with SMTP id
 x8-20020a25acc8000000b00dc21bc4e06bmr1599993ybd.51.1705629719588; 
 Thu, 18 Jan 2024 18:01:59 -0800 (PST)
Received: from localhost ([2601:344:8301:57f0:b45f:9648:c2e:2e36])
 by smtp.gmail.com with ESMTPSA id
 n17-20020a259f11000000b00d677aec54ffsm6231517ybq.60.2024.01.18.18.01.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jan 2024 18:01:59 -0800 (PST)
Date: Thu, 18 Jan 2024 18:01:58 -0800
From: Yury Norov <yury.norov@gmail.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: Re: Re: [Intel-xe] [PATCH 2/3] linux/bits.h: Add fixed-width
 GENMASK and BIT macros
Message-ID: <ZanYFqS7YrVYQsjB@yury-ThinkPad>
References: <20230509051403.2748545-1-lucas.demarchi@intel.com>
 <20230509051403.2748545-3-lucas.demarchi@intel.com>
 <ZJOwC5LIEySpduQJ@yury-ThinkPad>
 <4ezps56sdj7fmr27ivkaqjakv4ex46f5cvmy6oqr3z6gkhiorl@us4qd53jzq34>
 <Zamcu7tts8mqX0b4@yury-ThinkPad>
 <clamvpymzwiehjqd6jhuigymyg5ikxewxyeee2eae4tgzmaz7u@6rposizee3t6>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <clamvpymzwiehjqd6jhuigymyg5ikxewxyeee2eae4tgzmaz7u@6rposizee3t6>
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
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, Kevin Brodsky <kevin.brodsky@arm.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, Thomas Gleixner <tglx@linutronix.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 18, 2024 at 05:25:00PM -0600, Lucas De Marchi wrote:
> SA2PR11MB4874
> X-OriginatorOrg: intel.com
> Status: RO
> Content-Length: 6257
> Lines: 150
> 
> On Thu, Jan 18, 2024 at 01:48:43PM -0800, Yury Norov wrote:
> > On Thu, Jan 18, 2024 at 02:42:12PM -0600, Lucas De Marchi wrote:
> > > Hi,
> > > 
> > > Reviving this thread as now with xe driver merged we have 2 users for
> > > a fixed-width BIT/GENMASK.
> > 
> > Can you point where and why?
> 
> See users of REG_GENMASK and REG_BIT in drivers/gpu/drm/i915 and
> drivers/gpu/drm/xe. I  think the register definition in the xe shows it
> in a good way:
> 
> 	drivers/gpu/drm/xe/regs/xe_gt_regs.h
> 
> The GPU registers are mostly 32-bit wide. We don't want to accidently do
> something like below (s/30/33/ added for illustration purposes):
> 
> #define LSC_CHICKEN_BIT_0                       XE_REG_MCR(0xe7c8)
> #define   DISABLE_D8_D16_COASLESCE              REG_BIT(33)
> 
> Same thing for GENMASK family of macros and for registers that are 16 or
> 8 bits. See e.g. drivers/gpu/drm/i915/display/intel_cx0_phy_regs.h
> 
> 
> > 
> > > On Wed, Jun 21, 2023 at 07:20:59PM -0700, Yury Norov wrote:
> > > > Hi Lucas, all!
> > > >
> > > > (Thanks, Andy, for pointing to this thread.)
> > > >
> > > > On Mon, May 08, 2023 at 10:14:02PM -0700, Lucas De Marchi wrote:
> > > > > Add GENMASK_U32(), GENMASK_U16() and GENMASK_U8()  macros to create
> > > > > masks for fixed-width types and also the corresponding BIT_U32(),
> > > > > BIT_U16() and BIT_U8().
> > > >
> > > > Can you split BIT() and GENMASK() material to separate patches?
> > > >
> > > > > All of those depend on a new "U" suffix added to the integer constant.
> > > > > Due to naming clashes it's better to call the macro U32. Since C doesn't
> > > > > have a proper suffix for short and char types, the U16 and U18 variants
> > > > > just use U32 with one additional check in the BIT_* macros to make
> > > > > sure the compiler gives an error when the those types overflow.
> > > >
> > > > I feel like I don't understand the sentence...
> > > >
> > > > > The BIT_U16() and BIT_U8() need the help of GENMASK_INPUT_CHECK(),
> > > > > as otherwise they would allow an invalid bit to be passed. Hence
> > > > > implement them in include/linux/bits.h rather than together with
> > > > > the other BIT* variants.
> > > >
> > > > I don't think it's a good way to go because BIT() belongs to a more basic
> > > > level than GENMASK(). Not mentioning possible header dependency issues.
> > > > If you need to test against tighter numeric region, I'd suggest to
> > > > do the same trick as  GENMASK_INPUT_CHECK() does, but in uapi/linux/const.h
> > > > directly. Something like:
> > > >        #define _U8(x)		(CONST_GT(U8_MAX, x) + _AC(x, U))
> > > 
> > > but then make uapi/linux/const.h include linux/build_bug.h?
> > > I was thinking about leaving BIT() define where it is, and add the
> > > fixed-width versions in this header. I was thinking uapi/linux/const.h
> > > was more about allowing the U/ULL suffixes for things shared with asm.
> > 
> > You can't include kernel headers in uapi code. But you can try doing
> > vice-versa: implement or move the pieces you need to share to the
> > uapi/linux/const.h, and use them in the kernel code.
> 
> but in this CONST_GE() should trigger a BUG/static_assert
> on U8_MAX < x. AFAICS that check can't be on the uapi/ side,
> so there's nothing much left to change in uapi/linux/const.h.
> 
> I'd expect drivers to be the primary user of these fixed-width BIT
> variants, hence the proposal to do  in include/linux/bits.h.
> Ssomething like this WIP/untested diff (on top of your previous patch):
> 
> 
> diff --git a/include/linux/bits.h b/include/linux/bits.h
> index cb94128171b2..409cd10f7597 100644
> --- a/include/linux/bits.h
> +++ b/include/linux/bits.h
> @@ -24,12 +24,16 @@
>  #define GENMASK_INPUT_CHECK(h, l) \
>  	(BUILD_BUG_ON_ZERO(__builtin_choose_expr( \
>  		__is_constexpr((l) > (h)), (l) > (h), 0)))
> +#define BIT_INPUT_CHECK(type, b) \
> +	((BUILD_BUG_ON_ZERO(__builtin_choose_expr( \
> +		__is_constexpr(b), (b) >= BITS_PER_TYPE(type), 0))))
>  #else
>  /*
>   * BUILD_BUG_ON_ZERO is not available in h files included from asm files,
>   * disable the input check if that is the case.
>   */
>  #define GENMASK_INPUT_CHECK(h, l) 0
> +#define BIT_INPUT_CHECK(type, b) 0
>  #endif
>  #define __GENMASK(t, h, l) \
> @@ -44,4 +48,9 @@
>  #define GENMASK_U32(h, l)	__GENMASK(u32, h, l)
>  #define GENMASK_U64(h, l)	__GENMASK(u64, h, l)
> +#define BIT_U8(b)		(u8)(BIT_INPUT_CHECK(u8, b) + BIT(b))
> +#define BIT_U16(b)		(u16)(BIT_INPUT_CHECK(u16, b) + BIT(b))
> +#define BIT_U32(b)		(u32)(BIT_INPUT_CHECK(u32, b) + BIT(b))
> +#define BIT_U64(b)		(u64)(BIT_INPUT_CHECK(u64, b) + BIT(b))

Can you add some vertical spacing here, like between GENMASK and BIT
blocks?

> +
>  #endif	/* __LINUX_BITS_H */
> 
> > 
> > In the worst case, you can just implement the macro you need in the
> > uapi header, and make it working that way.
> > 
> > Can you confirm that my proposal increases the kernel size? If so, is
> > there any way to fix it? If it doesn't, I'd prefer to use the
> > __GENMASK() approach.
> 
> I agree on continuing with your approach. The bloat-o-meter indeed
> showed almost no difference. `size ....i915.o`  on the other hand
> increased, but then decreased when I replaced our current REG_GENMASK()
> implementation to reuse the new GENMASK_U*()
> 
> 	$ # test-genmask.00: before any change
> 	$ # test-genmask.01: after your patch to GENMASK
> 	$ # test-genmask.01: after converting drivers/gpu/drm/i915/i915_reg_defs.h
> 	    to use the new macros
> 	$ size build64/drivers/gpu/drm/i915/i915.o-test-genmask.*
> 	   text    data     bss     dec     hex filename
> 	4506628  215083    7168 4728879  48282f build64/drivers/gpu/drm/i915/i915.o-test-genmask.00
> 	4511084  215083    7168 4733335  483997 build64/drivers/gpu/drm/i915/i915.o-test-genmask.01
> 	4493292  215083    7168 4715543  47f417 build64/drivers/gpu/drm/i915/i915.o-test-genmask.02
> 
> 	$ ./scripts/bloat-o-meter  build64/drivers/gpu/drm/i915/i915.o-test-genmask.0[01]
> 	add/remove: 0/0 grow/shrink: 2/1 up/down: 4/-5 (-1)
> 	Function                                     old     new   delta
> 	intel_drrs_activate                          399     402      +3
> 	intel_psr_invalidate                         546     547      +1
> 	intel_psr_flush                              880     875      -5
> 	Total: Before=2980530, After=2980529, chg -0.00%
> 
> 	$ ./scripts/bloat-o-meter  build64/drivers/gpu/drm/i915/i915.o-test-genmask.0[12]
> 	add/remove: 0/0 grow/shrink: 0/0 up/down: 0/0 (0)
> 	Function                                     old     new   delta
> 	Total

OK then. With the above approach, fixed-type BIT() macros look like wrappers
around the plain BIT(), and I think, we can live with that.

Can you  send all the material as a proper series, including my
GENMASK patch, your patch above and a patch that switches your driver
to using the new API? I'll take it then in bitmap-for-next when the
merge window will get closed.

Thanks,
Yury
