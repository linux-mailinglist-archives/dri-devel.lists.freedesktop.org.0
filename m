Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95B34A3F207
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2025 11:29:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EC7010E257;
	Fri, 21 Feb 2025 10:29:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk header.b="ENQumGOU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CAB010E24A
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 10:29:42 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-30615661f98so18624211fa.2
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 02:29:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google; t=1740133781; x=1740738581;
 darn=lists.freedesktop.org; 
 h=mime-version:user-agent:message-id:date:references:in-reply-to
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XBgTd9yS8bHj2inA4KCI/wGm8uZFJ13xmrkCLQobpyg=;
 b=ENQumGOUq9RFivLS65WjVjGQIVAfEDng0PLDKiZ1xrylVEz+0vd6YN9D8OZFnb9NkO
 GhRnpbEiNwQ5KWC/loPd/I+H9STkLALMgPR5GmrWHj3VvZWg9Ld+JrPwi06lC7n4aI6i
 7eyHo7mjf/Q1qak8YM3HwnO97kkQ8sdZywofI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740133781; x=1740738581;
 h=mime-version:user-agent:message-id:date:references:in-reply-to
 :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XBgTd9yS8bHj2inA4KCI/wGm8uZFJ13xmrkCLQobpyg=;
 b=wYu4RhzOSYjSAhZ2V3HvkVlzlXW1nXro2dnF+XSts/3hOaMV+eCwAg5+pQR0HW8LVC
 rZcQq/xXDGpL/TWn+GsxnO1fdhFzAGOoZQST5S5CYVfm5S2+/WOaO32l3f5AAkgWFmSF
 7OMC3cU66t1IfBwbmVAFXi/DLDF9/z8rILSUTPTMCPse7KIO576AugTRPgoVC4z4mEDN
 bc6O1oq31PNheeZFkn6KVqwooIAKAG4aFbBxbQTQ11v7s3tLwTb0KTPPdMlfbUV56lHZ
 AkbdFkrqiJ2UF0u4JvxOdepas2wKTe3iJrHM5/FIigYRKIhl4obp5Wh32gISAk99FA6H
 4a8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWFGCA2pC5eAM4yjp14f+hpLDZHMbebLYJWnAzwBX6k6PT3dN8/uaEi7UgXeEwkZAK9EGsvBkmf19A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxLCI0Xh3EPpLQh0HCk3rEbQHzcEVQx/ulbfYGWGyMvtOR+1okD
 u+u63tnEM9wzT+DQIQpXAsSbak07TiY2B/Fh213Rpgek8wMYkIYZV42G03ZCcFI=
X-Gm-Gg: ASbGncs6uxTTCmGhBqnuvzUNoR/fAyLc+Dszb4KbNFT+WXLL8BnjWsN7wQLJlUfvYUy
 V921MjJ+K8OnqN5miN0N1nfNnFlGJHMuAUdo6CTV55DzreNdW1onHHG+zalIAPijaBsS/GK+sLp
 ojl63fdfPMZHuDbsBGxr+DAO+RltQLgR7e4WBuHF3bugUUT5hu26FpgdRmYuDRf4oIkp2omCoDX
 hg7oFW5B7aB+IiEllNvv1vHSgx9IoG2ICGAMUk1SrNgDTJJwrRj0MOKEEM4qMBBTaYgIHxiX5cC
 D0JQQgJQ9/6xEzPJKKe3w+/ARw4=
X-Google-Smtp-Source: AGHT+IEUOdqdqFnuqPXA4cgWINcdgxUl8JQ3ygr09PQ43kzULiZT56Khi3z1J3sj7fkaU8oDV/YSHQ==
X-Received: by 2002:a05:651c:2120:b0:309:1f98:2848 with SMTP id
 38308e7fff4ca-30a598e2984mr10302661fa.19.1740133781115; 
 Fri, 21 Feb 2025 02:29:41 -0800 (PST)
Received: from localhost ([81.216.59.226]) by smtp.gmail.com with UTF8SMTPSA id
 38308e7fff4ca-30a449aa148sm8429891fa.109.2025.02.21.02.29.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2025 02:29:40 -0800 (PST)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk> 
To: Aditya Garg <gargaditya08@live.com>
Cc: "pmladek@suse.com" <pmladek@suse.com>,  "rostedt@goodmis.org"
 <rostedt@goodmis.org>,  "andriy.shevchenko@linux.intel.com"
 <andriy.shevchenko@linux.intel.com>,  "senozhatsky@chromium.org"
 <senozhatsky@chromium.org>,  "corbet@lwn.net" <corbet@lwn.net>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>,  "tzimmermann@suse.de"
 <tzimmermann@suse.de>,  "airlied@gmail.com" <airlied@gmail.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>,  "akpm@linux-foundation.org"
 <akpm@linux-foundation.org>,  "apw@canonical.com" <apw@canonical.com>,
 "joe@perches.com" <joe@perches.com>,  "dwaipayanray1@gmail.com"
 <dwaipayanray1@gmail.com>,  "lukas.bulwahn@gmail.com"
 <lukas.bulwahn@gmail.com>,  "sumit.semwal@linaro.org"
 <sumit.semwal@linaro.org>,  "christian.koenig@amd.com"
 <christian.koenig@amd.com>,  "kekrby@gmail.com" <kekrby@gmail.com>,
 "admin@kodeit.net" <admin@kodeit.net>,  Orlando Chamberlain
 <orlandoch.dev@gmail.com>,  "evepolonium@gmail.com"
 <evepolonium@gmail.com>,  "linux-doc@vger.kernel.org"
 <linux-doc@vger.kernel.org>,  "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>,  "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>,  "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>,  "linaro-mm-sig@lists.linaro.org"
 <linaro-mm-sig@lists.linaro.org>,  Hector Martin <marcan@marcan.st>,
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>,  "asahi@lists.linux.dev"
 <asahi@lists.linux.dev>,  Sven Peter <sven@svenpeter.dev>,  Janne Grunau
 <j@jannau.net>
Subject: Re: [PATCH v2 2/3] lib/vsprintf: Add support for generic FOURCCs by
 extending %p4cc
In-Reply-To: <C66F35BB-2ECC-4DB8-8154-DEC5177967ED@live.com> (Aditya Garg's
 message of "Thu, 20 Feb 2025 16:39:23 +0000")
References: <716BCB0A-785B-463A-86C2-94BD66D5D22E@live.com>
 <C66F35BB-2ECC-4DB8-8154-DEC5177967ED@live.com>
Date: Fri, 21 Feb 2025 11:29:40 +0100
Message-ID: <871pvrpp4b.fsf@prevas.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
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

On Thu, Feb 20 2025, Aditya Garg <gargaditya08@live.com> wrote:

> v2 -> Add this patch
>  Documentation/core-api/printk-formats.rst | 32 +++++++++++++++++++
>  lib/test_printf.c                         | 39 +++++++++++++++++++----
>  lib/vsprintf.c                            | 38 ++++++++++++++++++----

Yay! Thanks for remembering to include test cases.

>  
> diff --git a/lib/test_printf.c b/lib/test_printf.c
> index 59dbe4f9a..ee860327e 100644
> --- a/lib/test_printf.c
> +++ b/lib/test_printf.c
> @@ -776,21 +776,46 @@ static void __init fwnode_pointer(void)
>  	software_node_unregister_node_group(group);
>  }
>  
> +struct fourcc_struct {
> +	u32 code;
> +	const char *str;
> +};
> +
> +static void __init fourcc_pointer_test(const struct fourcc_struct *fc, size_t n,
> +				       const char *fmt)
> +{
> +	size_t i;
> +
> +	for (i = 0; i < n; i++)
> +		test(fc[i].str, fmt, &fc[i].code);
> +}
> +
>  static void __init fourcc_pointer(void)
>  {
> -	struct {
> -		u32 code;
> -		char *str;
> -	} const try[] = {
> +	struct fourcc_struct const try_cc[] = {

I know it matches the code it replaces, but kernel style seems to be
"const struct foo" rather than "struct foo const" (at around 130:1) -
just as you use in the new helper function.

Also, please consider changing the array, and the newly added instances,
to be static instead of automatic (our le32_to_cpu should be usable also
for static initializers).

This will conflict with the conversion-to-kunit which is in flight, but
the conflict should be trivial to resolve.

Rasmus
