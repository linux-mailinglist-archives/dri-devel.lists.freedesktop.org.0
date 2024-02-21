Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D4A85DA05
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 14:26:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7A0D10E737;
	Wed, 21 Feb 2024 13:26:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EyVD50wP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E96A10E5FE;
 Wed, 21 Feb 2024 13:26:17 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id
 d2e1a72fcca58-6e47a104c2eso1244318b3a.2; 
 Wed, 21 Feb 2024 05:26:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708521977; x=1709126777; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
 :reply-to; bh=GOwKwIo9qeiCkgHyNiwGJN1M6e+EUTE46anx0P12eDw=;
 b=EyVD50wPVrz8HbgC2UtP82t0sc2ugtM9ih+jWSR1DjsVq3+SJFgPVwI5xZXm6g1+4f
 dOhZ6SaiZ1lC85GfTQdGJnnntY4dmBpyH4lIL+Zs4G9ofJvL59/xx4MqwjxfTQB5u+b8
 vC2JK7sf3VhBR/i/Hvum/hBJFGCnIQb9ca2NRDkp70jMOhTiisO5Prlk68vttWvPNjjQ
 IK2Ne1SqqJzznwx2up0Dxub4RpLAwbGsolhSEQ0ofbAtA0QVID6U9DSa2VeS5HKMH4xF
 /rW7Gea1wMjF8uj46VQypSM87ghaU90guxXn/hgit777iuZn/4Y+4KlVsgPWaVfGCFlD
 taGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708521977; x=1709126777;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GOwKwIo9qeiCkgHyNiwGJN1M6e+EUTE46anx0P12eDw=;
 b=K+GVpqNMqqzqz1lURMFlf5CrU7HIytFpqLtSpTS9f+fj7O0u5fTu05I6B/oavMJvBf
 eGKpJ5lTfYXSx1YgEL7VOO7GQwZ0+z/vWWMfTRxTB3AOgCgo+jTgdNbh5rj/+XPGmQ4t
 feOcnmkYn8yb56+QrBVWZf7V8SLbYYicZz3/5XWP/sbuveJewFxHZCi5CQ1IWeG/CTbO
 XHgDhs0ah5fqVHg0j+4Q4FL3AhNoWBIh/xyN00QRSRKmYcz4FZr/vww+udRGBInIF3wj
 4jwasdSugWbk+LucSV0gR53so5BpTHG5PSqoWzno9XDWc1gb55Xs6c4DiybiszbMwn4j
 faiQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWlUVejxYlTD7vtYO5HaLlw74luyJ46q/nPSKmmfJ2Ox4+5cTXzc/bAyIyp9Z3lhtjp3yO7KsjLryV4DmqPDpkExi1XWtgtvugf3qpcPxP/MLCC/3y4kAZZyf3w7KjLNOq1pL6sSOoiXVX9d5Hw4OI=
X-Gm-Message-State: AOJu0Yysfgpw0pbNP6ZKi9it1JsmliF7D5AOg6092S0q9EWN5sydMJAU
 jyj1X5lVnBWZOW6704EO4v765N4FkMOJOZM4t/bI7ymxACJkSRyk
X-Google-Smtp-Source: AGHT+IEpqgPN7zDMA7v77khmYtSnsGRumshpqIw6lmoY7DLU+j9Nal0lhvV42JBX7JUxiyCDJ01QUg==
X-Received: by 2002:a05:6a00:2196:b0:6e4:5dc0:233c with SMTP id
 h22-20020a056a00219600b006e45dc0233cmr11468603pfi.6.1708521976589; 
 Wed, 21 Feb 2024 05:26:16 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 n12-20020aa78a4c000000b006e46df9f1acsm5269415pfa.148.2024.02.21.05.26.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Feb 2024 05:26:16 -0800 (PST)
Date: Wed, 21 Feb 2024 05:26:15 -0800
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
Subject: Re: [PATCH 6/9] net: test: Fix printf format specifier in
 skb_segment kunit test
Message-ID: <1a85d2bf-e38c-4fa7-bfbe-c80148b50317@roeck-us.net>
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

Tested-by: Guenter Roeck <linux@roeck-us.net>

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
