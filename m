Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B27F085DA12
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 14:26:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03A5110E741;
	Wed, 21 Feb 2024 13:26:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="iHp3azn1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C548B10E743;
 Wed, 21 Feb 2024 13:26:47 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id
 98e67ed59e1d1-29951f5c2e7so2243503a91.1; 
 Wed, 21 Feb 2024 05:26:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708522007; x=1709126807; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
 :reply-to; bh=FIcGpMiTUFuShIJcNZW3Z6nnK/vjwEkJ2H69Fs4AHDY=;
 b=iHp3azn1cnsBBc6Fzo9UVsU5o3VVWDc7bC9FicYOll/RcYhExHHT+RF6efGW+zBvsU
 F5XyNWwtXzypY85Ud0l+xhVaOLuW8fCPpg/T70uYbt9iByq3orvOnq1HtGIqW/DKkGs+
 J2/N9XzibUILfD/mjhacIun01KetBa1TBaPCoD7QmyHkMhwHse6XlklUHKylsKR5P8j9
 7mwIabPAo/djcDoGdEu7d2Uk70GjuVeXLmlT4H6uJeTOxJ5hf25M0cRXVu2OyNc0mfpJ
 PpXoZybwuJDYMUhEsLl88qdTL+sDjoM9XSlqj/I6QxFpRr96DNyaN6WZqp5kELj76Ugz
 l0bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708522007; x=1709126807;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FIcGpMiTUFuShIJcNZW3Z6nnK/vjwEkJ2H69Fs4AHDY=;
 b=jHDTMaPF8hDzBievkSU/uftOA4JIaVrDC1lkh9JJLKBs29ydI4WiR02bxj54I2jmhD
 wkSRgW84vRXNrahxP2YbiDqJamFStSjsLJX0gVjWPtCnf++G37MSMeS+thQQOCd8VctN
 OJgwOvSQzOvqMtEdsYnNgiPLXpQFNF8O6Cgp6N590WYmIzWkkUaIakw+p0S/i534IbqD
 CFoa8EVjhKNiaYzY3GeeFmYAFk5N5kLdv7qQZ4yk7WoBmJHNpWa0Kd8au70Rjmt/O1vW
 9kOD9E5rNMajk8K+mhMheooZOCY9rDdA65g562B3jILXBvMmx+lmi3MzprQEdFQolydZ
 Digw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4hf7WSCbZ0u+YHheOgtte/GypzYj2L1pLR0hCWl8HYONTqStjnvuDH/6gMsbR1kdPMEH1PNR3DdX5XPU4Uv4X8HvSH7KOHb2KBS2eWyPyEzIIacPvijPNEAvgNzFjJFN8R0aevLtHsQMdKUCw+wg=
X-Gm-Message-State: AOJu0YypNdItlmb711aVhdx1gd1SObgrJ0/P6DAWRoAAB+mtNdQPF32O
 hEyNIm1nGThzqUpNdAX7EnoYUwZkYYx3eTYdOxkLF76g45KSJnYI
X-Google-Smtp-Source: AGHT+IFE0VdYohKERbDpngNjL2p6AnzRx2gY/8gsbGjsig+sWD9GvuWZ3WTfrhlLRHdoubZSLlvgUQ==
X-Received: by 2002:a17:90b:3b50:b0:299:6c4a:c5f0 with SMTP id
 ot16-20020a17090b3b5000b002996c4ac5f0mr8381795pjb.9.1708522007304; 
 Wed, 21 Feb 2024 05:26:47 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 h23-20020a17090aea9700b00298c633bd5fsm1699769pjz.30.2024.02.21.05.26.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Feb 2024 05:26:46 -0800 (PST)
Date: Wed, 21 Feb 2024 05:26:45 -0800
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
Subject: Re: [PATCH 9/9] kunit: Annotate _MSG assertion variants with gnu
 printf specifiers
Message-ID: <678b4b1b-6319-448b-b6a7-7692b368bf31@roeck-us.net>
References: <20240221092728.1281499-1-davidgow@google.com>
 <20240221092728.1281499-10-davidgow@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240221092728.1281499-10-davidgow@google.com>
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

On Wed, Feb 21, 2024 at 05:27:22PM +0800, David Gow wrote:
> KUnit's assertion macros have variants which accept a printf format
> string, to allow tests to specify a more detailed message on failure.
> These (and the related KUNIT_FAIL() macro) ultimately wrap the
> __kunit_do_failed_assertion() function, which accepted a printf format
> specifier, but did not have the __printf attribute, so gcc couldn't warn
> on incorrect agruments.
> 
> It turns out there were quite a few tests with such incorrect arguments.
> 
> Add the __printf() specifier now that we've fixed these errors, to
> prevent them from recurring.
> 
> Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
> Signed-off-by: David Gow <davidgow@google.com>

Tested-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  include/kunit/test.h | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/include/kunit/test.h b/include/kunit/test.h
> index fcb4a4940ace..61637ef32302 100644
> --- a/include/kunit/test.h
> +++ b/include/kunit/test.h
> @@ -579,12 +579,12 @@ void __printf(2, 3) kunit_log_append(struct string_stream *log, const char *fmt,
>  
>  void __noreturn __kunit_abort(struct kunit *test);
>  
> -void __kunit_do_failed_assertion(struct kunit *test,
> -			       const struct kunit_loc *loc,
> -			       enum kunit_assert_type type,
> -			       const struct kunit_assert *assert,
> -			       assert_format_t assert_format,
> -			       const char *fmt, ...);
> +void __printf(6, 7) __kunit_do_failed_assertion(struct kunit *test,
> +						const struct kunit_loc *loc,
> +						enum kunit_assert_type type,
> +						const struct kunit_assert *assert,
> +						assert_format_t assert_format,
> +						const char *fmt, ...);
>  
>  #define _KUNIT_FAILED(test, assert_type, assert_class, assert_format, INITIALIZER, fmt, ...) do { \
>  	static const struct kunit_loc __loc = KUNIT_CURRENT_LOC;	       \
> -- 
> 2.44.0.rc0.258.g7320e95886-goog
> 
