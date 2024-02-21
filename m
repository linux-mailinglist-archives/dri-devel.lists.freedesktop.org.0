Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA2985D9F6
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 14:25:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7330910E730;
	Wed, 21 Feb 2024 13:25:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KX0+GIxl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AD6E10E5FE;
 Wed, 21 Feb 2024 13:25:30 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-1d953fa3286so44492135ad.2; 
 Wed, 21 Feb 2024 05:25:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708521929; x=1709126729; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
 :reply-to; bh=OI7tqbj6mWKb61MysMY2DivYivNGwAjWTxPQEZuJVHY=;
 b=KX0+GIxltGnvHJoVmtgorlL2xtRfrrgsE2f9+WBFre7w9/p7jo/DDDIhbfzhQgxlyE
 bzzcSz6g2tiY/r2VAiBRA7MeXI2Itio7PjWl5s5PWqJ/JpXEHCMtH7KJ6uEAShImkCH1
 ALN5GdVj9O08nM1Z1s5NI86RAt2FGWt6JsO6SdHBqWR8WL/xOdBTWFxZODia4JWrg95i
 irOoMXMD3qVY6fWz7Q8/jCV/17FGmpp3IvOKjKSr4W+0PY0mwfINDdoVc16liHvJ+i0o
 ydgJ2krGuvYYvDRDFdkUitJlwVZhuxXHrNyX/w0uIo0klfNv2fvkitr3CgSe2X6Z+W7I
 Zwqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708521929; x=1709126729;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OI7tqbj6mWKb61MysMY2DivYivNGwAjWTxPQEZuJVHY=;
 b=lKfwqyAkQMiLsFK2dJCaFqXHqYBYbiycr4wRbOumPVypmcUZqYRC7Fa0vaVBqPZpp0
 NLvD5IMzl6MX84Jkkz/QmjwD7obJVNVfmcxJBJQbBIbpeHSWAyHuNbEb76OHOUrpdXwG
 5OI6SfrwSGCZWsPbHAkZcIL8A2rtWPzpI5crM4OuZHbX8JeJF8LUah8O2kmxAT0X7kFT
 ewgVvBJBKWD3fNd3L+YpBSVx0i9uBSVshcUkzTe9ZUyr0FY2rWnx6a+KqLOlJrB/Q34b
 KTptEwGMpnppVK9t6m/Lc6sFONWheiBo61qPQkfxlQvj7xGq7Q8BPxa8iPwm0av8AOz8
 SL3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXvkFHXxBYLXQOyJFa/FcNYNP2BpiEbm021tIhNcAt5hixyFGto+7PofSwIr1GANlp3npLhdC89xdkPartRnAgLFRrrQXa2LWHIgtaIUfWAUhmRHIYa6wP7QgE/ZPp/2dOIoFgth+TVmCC0bLUJrIo=
X-Gm-Message-State: AOJu0YytPoLPjcl8JFY4TONswmOF+NKy+Fe8YliUHEIjScKq7RT2QfGH
 yVwZrL+XAR5w6gjSg1QVYShPCVmk1qASdITFxTDDEhboTMaEWnXq
X-Google-Smtp-Source: AGHT+IHg9MoLpqgIlSHX+Evp1yAd6u93J1yLlc8YUipHUrY6efz32qYsKutsv5edzLysx+zDmmo/rg==
X-Received: by 2002:a17:90a:dd82:b0:299:5186:1989 with SMTP id
 l2-20020a17090add8200b0029951861989mr10159029pjv.37.1708521929579; 
 Wed, 21 Feb 2024 05:25:29 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 ds15-20020a17090b08cf00b002992cf08af0sm1359109pjb.23.2024.02.21.05.25.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Feb 2024 05:25:28 -0800 (PST)
Date: Wed, 21 Feb 2024 05:25:27 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: David Gow <davidgow@google.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Shuah Khan <skhan@linuxfoundation.org>, Rae Moar <rmoar@google.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Kees Cook <keescook@chromium.org>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
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
Subject: Re: [PATCH 1/9] kunit: test: Log the correct filter string in
 executor_test
Message-ID: <8cfc6a3e-e618-4ddd-adca-4d6bf81a5e17@roeck-us.net>
References: <20240221092728.1281499-1-davidgow@google.com>
 <20240221092728.1281499-2-davidgow@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240221092728.1281499-2-davidgow@google.com>
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

On Wed, Feb 21, 2024 at 05:27:14PM +0800, David Gow wrote:
> KUnit's executor_test logs the filter string in KUNIT_ASSERT_EQ_MSG(),
> but passed a random character from the filter, rather than the whole
> string.
> 
> This was found by annotating KUNIT_ASSERT_EQ_MSG() to let gcc validate
> the format string.
> 
> Fixes: 76066f93f1df ("kunit: add tests for filtering attributes")
> Signed-off-by: David Gow <davidgow@google.com>

Tested-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  lib/kunit/executor_test.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/kunit/executor_test.c b/lib/kunit/executor_test.c
> index 22d4ee86dbed..3f7f967e3688 100644
> --- a/lib/kunit/executor_test.c
> +++ b/lib/kunit/executor_test.c
> @@ -129,7 +129,7 @@ static void parse_filter_attr_test(struct kunit *test)
>  			GFP_KERNEL);
>  	for (j = 0; j < filter_count; j++) {
>  		parsed_filters[j] = kunit_next_attr_filter(&filter, &err);
> -		KUNIT_ASSERT_EQ_MSG(test, err, 0, "failed to parse filter '%s'", filters[j]);
> +		KUNIT_ASSERT_EQ_MSG(test, err, 0, "failed to parse filter from '%s'", filters);
>  	}
>  
>  	KUNIT_EXPECT_STREQ(test, kunit_attr_filter_name(parsed_filters[0]), "speed");
> -- 
> 2.44.0.rc0.258.g7320e95886-goog
> 
