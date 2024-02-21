Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7FB285EA6B
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 22:26:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6D6C10E4D7;
	Wed, 21 Feb 2024 21:26:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="QsARzQ7B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com
 [209.85.166.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFCC710E4D7
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 21:26:28 +0000 (UTC)
Received: by mail-il1-f179.google.com with SMTP id
 e9e14a558f8ab-3650df44657so16726395ab.0
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 13:26:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1708550788; x=1709155588;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ei6xuNgF/xoTMzRe+RBiR7YMpzO4E4Wmr5k4IfUD1BE=;
 b=QsARzQ7BujHWULGsClKw3DMHY/bOWo1z4NZT56AovlxtleTfF1qM+QEXLeQD+VYZth
 07t+p9MT8U2IjxKlueatCTyeL5mCr1dDjnPCkvvmN/7GkfHPsEY23zPT7HYfQC1YZMKD
 s5Mt+QbaTwK+vcRLrmFpxnG57+5FIMbQ7rlWcU80yBHQHtjHeoOoC9n86heqzhX+a5nR
 wO9ZsVj0nsn6At5tL6n7rhKSB7mAG72yUZoDm2OwfZbz7s163xeNMYGMBytaCmBFBRoy
 yvuD5JNxVVHMmGTxh9L333+/lanuOxuNVAeJlL3F6MlgSSWL9TLzT8yhpMGdefo1+mle
 WcqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708550788; x=1709155588;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ei6xuNgF/xoTMzRe+RBiR7YMpzO4E4Wmr5k4IfUD1BE=;
 b=wZWsWWDIR2qxKqBoGUA9f4SPdP7vot4eEV1gWyfPGZWU0EbbuE9bIG6p8wbcvPlZ3V
 YdgoDSHPQFDl9vdH5MUlg6541hagBL1uBFE8AynHjtAZLha9PA1EtXpOc0pCzaH9/5af
 KMLh6zuBQopXyrZwrTDD/s/rOFkqkUE5SAitYEsjsIBysrIUV3aScQVYACifxicOpRuz
 IM08XgV8QXslJJHxyroeG2OOjDXRAxsyCVbAKpGnKn/5G8I9wA0bLryiGy+aFZWQJN3x
 EIx3wqsJPTqXQDY6/yjykQbHOMzqVegXPmtSlJ60i0CYPH4NsQccXkO4vD5jrO6HqIyA
 8v7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXNSy4HB4jSlUmV/7dI161lPqXHW8Sbvhbc4N8pKXOLbWqxgAxX8vJYsrgWEZZanJ6KWkOMXYx35O13VIIJjNP5msfi3+3AhZEuzzthKa8u
X-Gm-Message-State: AOJu0YwOBPYuQZFQwh9GpMfhmH67fh0xjtVctQTwKuVGQS1OF7F53Mdv
 34CY+h/FEszF3tYKudr3L+EXgiUSVEXfgViZqbdkGaz3hYpwhBA8s2eu3mTwNg==
X-Google-Smtp-Source: AGHT+IE94cj8KTh5vsD6rggbO3A8K/diAIkIrFg2CCSYRvCxTJhEhQffit7CiRPnd2AjVYaPB7SsEQ==
X-Received: by 2002:a05:6e02:4cd:b0:365:b29:3fda with SMTP id
 f13-20020a056e0204cd00b003650b293fdamr16002018ils.24.1708550787816; 
 Wed, 21 Feb 2024 13:26:27 -0800 (PST)
Received: from google.com (161.74.123.34.bc.googleusercontent.com.
 [34.123.74.161]) by smtp.gmail.com with ESMTPSA id
 o16-20020a056e02069000b00362759b0e4asm3592139ils.32.2024.02.21.13.26.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Feb 2024 13:26:27 -0800 (PST)
Date: Wed, 21 Feb 2024 21:26:24 +0000
From: Justin Stitt <justinstitt@google.com>
To: David Gow <davidgow@google.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Guenter Roeck <linux@roeck-us.net>, Rae Moar <rmoar@google.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Kees Cook <keescook@chromium.org>,
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Willem de Bruijn <willemb@google.com>, Florian Westphal <fw@strlen.de>,
 Cassio Neri <cassio.neri@gmail.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Arthur Grillo <arthur.grillo@usp.br>,
 Brendan Higgins <brendan.higgins@linux.dev>,
 Daniel Latypov <dlatypov@google.com>,
 Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@gmail.com>,
 Maxime Ripard <mripard@kernel.org>,
 "David S . Miller" <davem@davemloft.net>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-xe@lists.freedesktop.org, linux-rtc@vger.kernel.org,
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
 linux-hardening@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH 6/9] net: test: Fix printf format specifier in
 skb_segment kunit test
Message-ID: <20240221212624.w4r2w6acijkwn7qg@google.com>
References: <20240221092728.1281499-1-davidgow@google.com>
 <20240221092728.1281499-7-davidgow@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240221092728.1281499-7-davidgow@google.com>
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

Hi,

On Wed, Feb 21, 2024 at 05:27:19PM +0800, David Gow wrote:
> KUNIT_FAIL() accepts a printf-style format string, but previously did
> not let gcc validate it with the __printf() attribute. The use of %lld
> for the result of PTR_ERR() is not correct.
>
> Instead, use %pe and pass the actual error pointer. printk() will format
> it correctly (and give a symbolic name rather than a number if
> available, which should make the output more readable, too).
>
> Fixes: b3098d32ed6e ("net: add skb_segment kunit test")
> Signed-off-by: David Gow <davidgow@google.com>

Looks good.

For those wondering, %pe has a special meaning in the kernel which can
be seen in lib/vsprintf.c.

Reviewed-by: Justin Stitt <justinstitt@google.com>
> ---
>  net/core/gso_test.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/net/core/gso_test.c b/net/core/gso_test.c
> index 4c2e77bd12f4..358c44680d91 100644
> --- a/net/core/gso_test.c
> +++ b/net/core/gso_test.c
> @@ -225,7 +225,7 @@ static void gso_test_func(struct kunit *test)
>
>  	segs = skb_segment(skb, features);
>  	if (IS_ERR(segs)) {
> -		KUNIT_FAIL(test, "segs error %lld", PTR_ERR(segs));
> +		KUNIT_FAIL(test, "segs error %pe", segs);
>  		goto free_gso_skb;
>  	} else if (!segs) {
>  		KUNIT_FAIL(test, "no segments");
> --
> 2.44.0.rc0.258.g7320e95886-goog
>

Thanks
Justin
