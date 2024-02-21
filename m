Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B4685E8BB
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 21:04:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA02810E7D6;
	Wed, 21 Feb 2024 20:04:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="cmSN1dEW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com
 [209.85.166.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94C8210E7E3
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 20:04:25 +0000 (UTC)
Received: by mail-io1-f49.google.com with SMTP id
 ca18e2360f4ac-7c49c095eb3so271392539f.2
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 12:04:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1708545865; x=1709150665;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=HUxWnozNASldM6mLZUsm3giXihd3A7IaClJa0LXBxNU=;
 b=cmSN1dEWljwoycsZzXbXhVOZm+7ocrzx2YV6doAUdf6/VMahGJYb86Jn9K39JoCxNJ
 45n+8PE1OGA+P/c56DdqgPfvcI+4C4dLJtStz3vA35UwboAmGpAPnh1hsATycCfHBO8Y
 1+5shpqNN1s4nPK6IU1zKjDy+F44aN+/tCqtyaGpgcT2kWisgbsDDDK6Dg1B319QR0AM
 SCgeHRVLQNKek6vi6IMIiJJWl0bkLvkYG6zshZ5bglA+kCmjA7jwibQsRtO9ciGOLqtQ
 f3DQm2ao8T6Dsnuz4hwMGmIp6Oc4bHt0ykLJ8MsVcRNesLKQJjloVp7Yv2ZxQAnWFvfp
 2Q7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708545865; x=1709150665;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HUxWnozNASldM6mLZUsm3giXihd3A7IaClJa0LXBxNU=;
 b=saHaRGRXp40BuA/dekgne6D7GqLwMcnvMpshg2sonSHuhkJ1t7AVBSmDO3MZK6z5sn
 QGIdgdLt3ar0Gk0/EaEoYGI1IIpHV/hR2AsBispU0hNrBG2+bvNZSZkqKvAw+caBpOzo
 TZVi6PS05sBmua4czkyzudwJAhEiOcLyaMcfONGSgUPO/E8AS3ag6xb1F3V4Fm+95lNg
 oplgY5+45wE7RGHurHmvDZKAtQ/+g7Gk6omJBsC4CxLp6ngG4oegkVVWeRqVFrmQPdoy
 NX3UXdKvdfirl0X+3fkO5QduQRiLAIehNkiPrRNIzJ5UHneUiO2kcR4JVklExf25nFB7
 oWyQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8WpLfOIhHW8DGh5B3sftZNTeCGdoNEAu5gT8EFy6B430M0vqOdZAsBp8y+fTyqAMIMjx42xz5OFzrISBjhFIv5OIs2ggYf9yuC4wTZGFj
X-Gm-Message-State: AOJu0YwWUwTIUde6warSKrk8Phxqoskf55M6utHmHJYmQ0C2g5eFJ1Qa
 qMeFu4T0+Kcw6V0Z4eFoisINZmqYKpMTf8Zop9uojs5VR1naDSNCKxkTsFCxww==
X-Google-Smtp-Source: AGHT+IERZJoWhG4EWPF6TTNxmVzRySC9KGEbeq7lW206WSkBdenSx9MWqz5eGYR8XIoLVoQASwKcyw==
X-Received: by 2002:a5d:9b10:0:b0:7c7:6e49:2208 with SMTP id
 y16-20020a5d9b10000000b007c76e492208mr4170773ion.13.1708545864703; 
 Wed, 21 Feb 2024 12:04:24 -0800 (PST)
Received: from google.com (161.74.123.34.bc.googleusercontent.com.
 [34.123.74.161]) by smtp.gmail.com with ESMTPSA id
 dl5-20020a056638278500b004742837424fsm1881404jab.53.2024.02.21.12.04.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Feb 2024 12:04:23 -0800 (PST)
Date: Wed, 21 Feb 2024 20:04:21 +0000
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
Subject: Re: [PATCH 1/9] kunit: test: Log the correct filter string in
 executor_test
Message-ID: <20240221200421.us26bqteeihiwiwu@google.com>
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

Hi,

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

Reviewed-by: Justin Stitt <justinstitt@google.com>
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

Thanks
Justin
