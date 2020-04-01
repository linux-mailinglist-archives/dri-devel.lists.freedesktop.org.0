Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18AC219AD86
	for <lists+dri-devel@lfdr.de>; Wed,  1 Apr 2020 16:14:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96FA36E945;
	Wed,  1 Apr 2020 14:14:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lb1-smtp-cloud8.xs4all.net (lb1-smtp-cloud8.xs4all.net
 [194.109.24.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97F566E8DA
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Apr 2020 14:14:01 +0000 (UTC)
Received: from [192.168.2.10] ([46.9.234.233])
 by smtp-cloud8.xs4all.net with ESMTPA
 id Je7rjWPinBr2bJe7vjkqWT; Wed, 01 Apr 2020 16:13:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
 t=1585750439; bh=4Z1xsv5MJPNLqbY2JbEN3CWbNZXwsTFDoO6fRUQq8Z8=;
 h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
 Subject;
 b=IyNSd6itD/wGS7WzJWs/dM4HUrhm4dr8re8yF3KX4FCoMbbHfexrnHpYLL/AqOn15
 7Lfo2bscJ5Tv+wtt0xoYuI0IbfO9NGo00WyjUGXOuMePe19bSb+rcaPnHd3sLipLQg
 5WTK2oPH6Q3jLG8+EpWuCh+vD3EFZdkq95zWUJZ68iSo1U9Jx1dm0Yv4U/LKEniKLv
 USlJDTN5j3fjSech4lWAie2R6+CcS+eDMlV09WLUE86/Pp4Rm1ejPnuKuhAS67NZsK
 COwfjQx3JKInzAy8KrHtdfsO/atELkmg3UgVeybrFuPhGh3QnzHe8CcJzDuREe1z7X
 U7R0WvPawuwTg==
Subject: Re: [PATCH 1/1] lib/vsprintf: Add support for printing V4L2 and DRM
 fourccs
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Petr Mladek <pmladek@suse.com>
References: <20200401140522.966-1-sakari.ailus@linux.intel.com>
From: Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <080ddddf-717e-61dc-8522-fbdbe52da94a@xs4all.nl>
Date: Wed, 1 Apr 2020 16:13:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200401140522.966-1-sakari.ailus@linux.intel.com>
Content-Language: en-US
X-CMAE-Envelope: MS4wfMk1IXknwDM4YmvP/lQa3Wn+ijgDMHwhGqoI8aB+utiUiu9Lnc6n4h2UYXu7wz51oBsvbGHGG9TYwjhRmL+0U2byi27gti5Dkl55B8z7c+AVv/Q9XHj1
 o/WnC3Z/PeC0XuFKPI6wwfAhSw0G1DoS9bvK6u0X80y37pJZKxeeRwud/rg0zhMTw4O5OXrISijVnxaVcTi4HtTe0MNdDvmnfWuChnnJFTZ106nv/u6n5/9X
 lMlaHzccOrMOEYV7bCN+/KXb5yNzJcuI/8XsdTD+bjwK+BFN0AaoM0E/ek4zTkHj1Po4DKYE3oSUu+8q7AFoqQtEfRRquooJP7G7QuRmKa3XFvDz08P4XwWf
 x+YpcqQfYb8iFogqPzJVZ92BU/oVR83DeurZ80tQvCmYccUbqZVBvsAHbUGAlBTc9/MH4ygNdo8EamET9yVN5wlRVj4Xb5W6LFrq59KhLOq4KAi9m7IU65vA
 2FO9WahGnoWuDUL/ObJyXeILYTKOF4oiV1ULv5cUH98wdR1BcfJdlBDcWed+zhkFcO1rIUePwIZzZNv1oX1qEqoAAg2KknknJiVIJPWxNfUcUbD+lfFSjjHc
 BAk=
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
Cc: mchehab@kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>, laurent.pinchart@ideasonboard.com,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/1/20 4:05 PM, Sakari Ailus wrote:
> Add a printk modifier %ppf (for pixel format) for printing V4L2 and DRM
> pixel formats denoted by 4ccs. The 4cc encoding is the same for both so
> the same implementation can be used.
> 
> Suggested-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  Documentation/core-api/printk-formats.rst | 11 +++++++++
>  lib/vsprintf.c                            | 29 +++++++++++++++++++++++
>  2 files changed, 40 insertions(+)
> 
> diff --git a/Documentation/core-api/printk-formats.rst b/Documentation/core-api/printk-formats.rst
> index 8ebe46b1af39..b6249f513c09 100644
> --- a/Documentation/core-api/printk-formats.rst
> +++ b/Documentation/core-api/printk-formats.rst
> @@ -545,6 +545,17 @@ For printing netdev_features_t.
>  
>  Passed by reference.
>  
> +V4L2 and DRM fourcc code (pixel format)
> +---------------------------------------
> +
> +::
> +
> +	%ppf
> +
> +Print a 4cc code used by V4L2 or DRM.

FourCC appears to be the more-or-less official name (https://en.wikipedia.org/wiki/FourCC)

I would explain about the -BE suffix for bigendian fourcc variants.

> +
> +Passed by reference.
> +
>  Thanks
>  ======
>  
> diff --git a/lib/vsprintf.c b/lib/vsprintf.c
> index 7c488a1ce318..b39f0ac317c5 100644
> --- a/lib/vsprintf.c
> +++ b/lib/vsprintf.c
> @@ -1721,6 +1721,32 @@ char *netdev_bits(char *buf, char *end, const void *addr,
>  	return special_hex_number(buf, end, num, size);
>  }
>  
> +static noinline_for_stack
> +char *pixel_format_string(char *buf, char *end, const u32 *fourcc,
> +			  struct printf_spec spec, const char *fmt)
> +{
> +	char ch[2] = { 0 };

This can just be '{ };'

> +	unsigned int i;
> +
> +	if (check_pointer(&buf, end, fourcc, spec))
> +		return buf;
> +
> +	switch (fmt[1]) {
> +	case 'f':
> +		for (i = 0; i < sizeof(*fourcc); i++) {
> +			ch[0] = *fourcc >> (i << 3);

You need to AND with 0x7f, otherwise a big endian fourcc (bit 31 is set)
will look wrong. Also, each character is standard 7 bit ascii, bit 7 isn't
used except to indicate a BE variant.

> +			buf = string(buf, end, ch, spec);
> +		}
> +
> +		if (*fourcc & BIT(31))
> +			buf = string(buf, end, "-BE", spec);
> +
> +		return buf;
> +	default:
> +		return error_string(buf, end, "(%pp?)", spec);
> +	}
> +}
> +
>  static noinline_for_stack
>  char *address_val(char *buf, char *end, const void *addr,
>  		  struct printf_spec spec, const char *fmt)
> @@ -2131,6 +2157,7 @@ char *fwnode_string(char *buf, char *end, struct fwnode_handle *fwnode,
>   *       correctness of the format string and va_list arguments.
>   * - 'K' For a kernel pointer that should be hidden from unprivileged users
>   * - 'NF' For a netdev_features_t
> + * - 'pf' V4L2 or DRM pixel format.

I'd say 'FourCC format' instead of 'pixel format'.

>   * - 'h[CDN]' For a variable-length buffer, it prints it as a hex string with
>   *            a certain separator (' ' by default):
>   *              C colon
> @@ -2223,6 +2250,8 @@ char *pointer(const char *fmt, char *buf, char *end, void *ptr,
>  		return restricted_pointer(buf, end, ptr, spec);
>  	case 'N':
>  		return netdev_bits(buf, end, ptr, spec, fmt);
> +	case 'p':
> +		return pixel_format_string(buf, end, ptr, spec, fmt);
>  	case 'a':
>  		return address_val(buf, end, ptr, spec, fmt);
>  	case 'd':
> 

Regards,

	Hans
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
