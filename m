Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6053D85D9FD
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 14:26:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BB5C10E732;
	Wed, 21 Feb 2024 13:25:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="X4Ia6ZIL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F36BD10E732;
 Wed, 21 Feb 2024 13:25:58 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id
 d2e1a72fcca58-6e471caaa71so1798183b3a.2; 
 Wed, 21 Feb 2024 05:25:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708521958; x=1709126758; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
 :reply-to; bh=0Kt4DQtLokPYkv4wG5VaIf0hlu8PH+a30q0oFCSdLWw=;
 b=X4Ia6ZILa/5CPP81vr2T2hkLWb7zltnku/l+dwmhMLWzYc2zz/a3G6jKmzRWYNkUgy
 intLgeX7iqDQa7JY/TXs3rqWcPCysjGuams6CNWsKUbkv1t0BwetRmBW4cx+2nXF5DTq
 Rd5MJ2YZPM35xXozHVc1RJ+3CrqwhWvOZXlKNPHuX4fPSHkB5ZMXDWtutBxde2YsEomP
 hbWJ1942O74c7Hnlfv4NoD940KdZNYlNkB8rfmQpc5Otwr+/vTY3cW7JJ9DoKmMA5pdZ
 Zf/lxQKmb4sIqpb1W2cYMbnx/N0v1ehT9VvTy0qFpvgUdkEtm84G7uOd9o6Cdef+ahb9
 ElZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708521958; x=1709126758;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0Kt4DQtLokPYkv4wG5VaIf0hlu8PH+a30q0oFCSdLWw=;
 b=caFE1tSkebFznPWrkGiqfDVVsZ3VgvlL6gIexZpFdv6PBPHm2sNjRYvdnVovjoFhQ0
 ytSFsS3LEvYSUAEMfFkMk8j2fb/mdLPxrZzxaeqqSD7iwPss9DR5xUq/OQI9t7YCfHGC
 gwr3pipGazYmXCUqUdVq2W6GEPXo+WlSVBu2LM2hXoTB0Duop8bLQjiTaWf8juFkeXLd
 ziK/AdsqLRY1U/rn3Jxlzn1qQYFdjbzVZ3HDJCJ4Rl0pvPPm8tvpjHbfediFylIJ1auG
 hHA3wra7kDY6N6wJYR6Rukm83y7ixrKOgfB07XNnVJdqSvlj81ah3NotBascohOc1T2K
 DcgQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVFti4NbOh+prOU8VO6dDNuZS/betxPRdXwF7IcB6rIIdT9pM+cjxjcQMf3LosrqjrvHlg3l9hPyTobAaNk50OvJRJoqL5/awFRAWDKk8eqw2rHNKOw8ryQShrvUXjBECq9ec6AloDeq8/i6dNhFts=
X-Gm-Message-State: AOJu0YyjfCenafUXHjejxq1U6/6iGFh256/F4HszY82p6rKbJBWXN9hA
 iilmMRO56AU4bKVuGEq9hbWz6YFvNwtKfNnyvd16+hPyzMaq2xqW
X-Google-Smtp-Source: AGHT+IG5kyIHO4GYkBIFrd944IQCsvluBVVm5K3A7XIKl/XEjSlVsogI7UiVFdKhmV+8aF6TpJ3Ocg==
X-Received: by 2002:a05:6a20:2d08:b0:19c:678d:c1c with SMTP id
 g8-20020a056a202d0800b0019c678d0c1cmr18117836pzl.37.1708521958464; 
 Wed, 21 Feb 2024 05:25:58 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 l11-20020a17090aaa8b00b0029929ec25fesm1716436pjq.27.2024.02.21.05.25.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Feb 2024 05:25:58 -0800 (PST)
Date: Wed, 21 Feb 2024 05:25:56 -0800
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
Subject: Re: [PATCH 4/9] time: test: Fix incorrect format specifier
Message-ID: <64512797-41d5-4a40-81f5-5b17c8b7bccd@roeck-us.net>
References: <20240221092728.1281499-1-davidgow@google.com>
 <20240221092728.1281499-5-davidgow@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240221092728.1281499-5-davidgow@google.com>
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

On Wed, Feb 21, 2024 at 05:27:17PM +0800, David Gow wrote:
> 'days' is a s64 (from div_s64), and so should use a %lld specifier.
> 
> This was found by extending KUnit's assertion macros to use gcc's
> __printf attribute.
> 
> Fixes: 276010551664 ("time: Improve performance of time64_to_tm()")
> Signed-off-by: David Gow <davidgow@google.com>

Tested-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  kernel/time/time_test.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/kernel/time/time_test.c b/kernel/time/time_test.c
> index ca058c8af6ba..3e5d422dd15c 100644
> --- a/kernel/time/time_test.c
> +++ b/kernel/time/time_test.c
> @@ -73,7 +73,7 @@ static void time64_to_tm_test_date_range(struct kunit *test)
>  
>  		days = div_s64(secs, 86400);
>  
> -		#define FAIL_MSG "%05ld/%02d/%02d (%2d) : %ld", \
> +		#define FAIL_MSG "%05ld/%02d/%02d (%2d) : %lld", \
>  			year, month, mdday, yday, days
>  
>  		KUNIT_ASSERT_EQ_MSG(test, year - 1900, result.tm_year, FAIL_MSG);
> -- 
> 2.44.0.rc0.258.g7320e95886-goog
> 
