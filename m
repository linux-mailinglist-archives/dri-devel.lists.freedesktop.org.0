Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 63DFF3AD9AD
	for <lists+dri-devel@lfdr.de>; Sat, 19 Jun 2021 12:51:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72B836EAC4;
	Sat, 19 Jun 2021 10:51:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E1806EAC4;
 Sat, 19 Jun 2021 10:51:01 +0000 (UTC)
IronPort-SDR: v1E4xt88WKHLSgv6wgwz0tmB+ys8MEnaqX1n8D6FdbYFI3JZMi3gUtsEpt8/bNxNPAAwjAKTes
 i80+ZsKfHAXw==
X-IronPort-AV: E=McAfee;i="6200,9189,10019"; a="206484090"
X-IronPort-AV: E=Sophos;i="5.83,285,1616482800"; d="scan'208";a="206484090"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2021 03:51:00 -0700
IronPort-SDR: +Epd2JPzuQKVgIZ28P0AmJve4W21BtVRQil8JAZ4x25NaABZ5IMUN+kLfhxQCqkPHUVErydyTP
 YarFheC0k7yQ==
X-IronPort-AV: E=Sophos;i="5.83,285,1616482800"; d="scan'208";a="554979339"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2021 03:50:55 -0700
Received: from andy by smile with local (Exim 4.94.2)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1luYYs-003nwu-RM; Sat, 19 Jun 2021 13:50:50 +0300
Date: Sat, 19 Jun 2021 13:50:50 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Yury Norov <yury.norov@gmail.com>
Subject: Re: [PATCH 1/3] include/linux: move for_each_bit() macros from
 bitops.h to find.h
Message-ID: <YM3MCrveAlIa1TES@smile.fi.intel.com>
References: <20210618195735.55933-1-yury.norov@gmail.com>
 <20210618195735.55933-2-yury.norov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210618195735.55933-2-yury.norov@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: Wei Yang <richard.weiyang@linux.alibaba.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie <airlied@linux.ie>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, dri-devel@lists.freedesktop.org,
 "H. Peter Anvin" <hpa@zytor.com>, Marc Zyngier <maz@kernel.org>,
 x86@kernel.org, Ingo Molnar <mingo@redhat.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Guenter Roeck <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.com>,
 Alexey Klimov <aklimov@redhat.com>, etnaviv@lists.freedesktop.org,
 Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, David Woodhouse <dwmw@amazon.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 18, 2021 at 12:57:33PM -0700, Yury Norov wrote:
> for_each_bit() macros depend on find_bit() machinery, and so the
> proper place for them is the find.h header.

Fine with me.
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Signed-off-by: Yury Norov <yury.norov@gmail.com>
> ---
>  include/linux/bitops.h | 34 ----------------------------------
>  include/linux/find.h   | 34 ++++++++++++++++++++++++++++++++++
>  2 files changed, 34 insertions(+), 34 deletions(-)
> 
> diff --git a/include/linux/bitops.h b/include/linux/bitops.h
> index 26bf15e6cd35..31ae1ae1a974 100644
> --- a/include/linux/bitops.h
> +++ b/include/linux/bitops.h
> @@ -31,40 +31,6 @@ extern unsigned long __sw_hweight64(__u64 w);
>   */
>  #include <asm/bitops.h>
>  
> -#define for_each_set_bit(bit, addr, size) \
> -	for ((bit) = find_first_bit((addr), (size));		\
> -	     (bit) < (size);					\
> -	     (bit) = find_next_bit((addr), (size), (bit) + 1))
> -
> -/* same as for_each_set_bit() but use bit as value to start with */
> -#define for_each_set_bit_from(bit, addr, size) \
> -	for ((bit) = find_next_bit((addr), (size), (bit));	\
> -	     (bit) < (size);					\
> -	     (bit) = find_next_bit((addr), (size), (bit) + 1))
> -
> -#define for_each_clear_bit(bit, addr, size) \
> -	for ((bit) = find_first_zero_bit((addr), (size));	\
> -	     (bit) < (size);					\
> -	     (bit) = find_next_zero_bit((addr), (size), (bit) + 1))
> -
> -/* same as for_each_clear_bit() but use bit as value to start with */
> -#define for_each_clear_bit_from(bit, addr, size) \
> -	for ((bit) = find_next_zero_bit((addr), (size), (bit));	\
> -	     (bit) < (size);					\
> -	     (bit) = find_next_zero_bit((addr), (size), (bit) + 1))
> -
> -/**
> - * for_each_set_clump8 - iterate over bitmap for each 8-bit clump with set bits
> - * @start: bit offset to start search and to store the current iteration offset
> - * @clump: location to store copy of current 8-bit clump
> - * @bits: bitmap address to base the search on
> - * @size: bitmap size in number of bits
> - */
> -#define for_each_set_clump8(start, clump, bits, size) \
> -	for ((start) = find_first_clump8(&(clump), (bits), (size)); \
> -	     (start) < (size); \
> -	     (start) = find_next_clump8(&(clump), (bits), (size), (start) + 8))
> -
>  static inline int get_bitmask_order(unsigned int count)
>  {
>  	int order;
> diff --git a/include/linux/find.h b/include/linux/find.h
> index 6048f8c97418..4500e8ab93e2 100644
> --- a/include/linux/find.h
> +++ b/include/linux/find.h
> @@ -279,4 +279,38 @@ unsigned long find_next_bit_le(const void *addr, unsigned
>  #error "Please fix <asm/byteorder.h>"
>  #endif
>  
> +#define for_each_set_bit(bit, addr, size) \
> +	for ((bit) = find_first_bit((addr), (size));		\
> +	     (bit) < (size);					\
> +	     (bit) = find_next_bit((addr), (size), (bit) + 1))
> +
> +/* same as for_each_set_bit() but use bit as value to start with */
> +#define for_each_set_bit_from(bit, addr, size) \
> +	for ((bit) = find_next_bit((addr), (size), (bit));	\
> +	     (bit) < (size);					\
> +	     (bit) = find_next_bit((addr), (size), (bit) + 1))
> +
> +#define for_each_clear_bit(bit, addr, size) \
> +	for ((bit) = find_first_zero_bit((addr), (size));	\
> +	     (bit) < (size);					\
> +	     (bit) = find_next_zero_bit((addr), (size), (bit) + 1))
> +
> +/* same as for_each_clear_bit() but use bit as value to start with */
> +#define for_each_clear_bit_from(bit, addr, size) \
> +	for ((bit) = find_next_zero_bit((addr), (size), (bit));	\
> +	     (bit) < (size);					\
> +	     (bit) = find_next_zero_bit((addr), (size), (bit) + 1))
> +
> +/**
> + * for_each_set_clump8 - iterate over bitmap for each 8-bit clump with set bits
> + * @start: bit offset to start search and to store the current iteration offset
> + * @clump: location to store copy of current 8-bit clump
> + * @bits: bitmap address to base the search on
> + * @size: bitmap size in number of bits
> + */
> +#define for_each_set_clump8(start, clump, bits, size) \
> +	for ((start) = find_first_clump8(&(clump), (bits), (size)); \
> +	     (start) < (size); \
> +	     (start) = find_next_clump8(&(clump), (bits), (size), (start) + 8))
> +
>  #endif /*__LINUX_FIND_H_ */
> -- 
> 2.30.2
> 

-- 
With Best Regards,
Andy Shevchenko


