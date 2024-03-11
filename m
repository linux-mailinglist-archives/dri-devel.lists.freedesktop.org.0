Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F5B877A63
	for <lists+dri-devel@lfdr.de>; Mon, 11 Mar 2024 05:36:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B114A10E0D7;
	Mon, 11 Mar 2024 04:36:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Hu2yRVqA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3587210E0D7
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Mar 2024 04:36:13 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id
 98e67ed59e1d1-299b818d63aso2670878a91.0
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Mar 2024 21:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710131772; x=1710736572; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
 :reply-to; bh=QiEYgTiVIfRWezz5AaQue6rBdCpnJEAVy8ZiGZDVI+E=;
 b=Hu2yRVqAAffAgodMHoMdR6PJ2eMwyWHL6/mxj9/JyyCa2zSOiT+CuSKATzhif5nyDH
 3Z4rP2tdQPdff8JUAT6mDn+0f26gifLUTsCfThMkmr/n6Kfa/N75iu7/ON+07f7ip1Kj
 OLauvYzAqm5WNw5kjwXriPYqY72AHBMs1uZr/dQic9Zdfc4W1mnzGBtx5by5aKaexv9L
 WHsTnz3i8oNiyByplfj0TufAnilV2GEAe5UE4xNJpgsX7oGPwM96UbeTOgZhIeAiydqG
 Wo9vmMqrTQviVegmCYV8K23arhnDwvQQCfiLibvjxhvSjj6SnAhpwjQDg6d0yyGWEM27
 Dung==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710131772; x=1710736572;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QiEYgTiVIfRWezz5AaQue6rBdCpnJEAVy8ZiGZDVI+E=;
 b=sSkTY5nxfDz1TFHLg3SuT4OkzK3hG+OkER1JOC3VsdoV9gK9+DOElAwbsSIb0a+OHE
 NV9bhE8tZkdS/0IC6se4ymkgpN2UMCGJsYc2r0G9zG+IFvEbO5xfasiAk2/Qveb+y7o5
 PHhJR6q3H3ZnECBf0CAWFqWs+VIInr/PmzlSlCLx+RJPRwhjQZMQl8TBvITKYUNUtQYt
 7eJQIClZrqU7EvzNh1iHHPANo24VExcRbq4/dMnv0Sexh3M51Z4Fv1D8388ONond8vxx
 r+jR2oAxHpsz8gwkCatY1pkoOPEErpvfS0b2LVFdejWPLQwc6D7/M2ZCpwrXthZC/SjX
 MKFA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXvW/6g0/E/NNJc4jK33mDq+IPSTZvwQEavFxzUjx0dxOh/M/NOhEKzYaDsnL0tGOnMZEwoncZB0payQBcbQKEuDUdXaaol+6vNelhqWmWJ
X-Gm-Message-State: AOJu0Yxg2XR1sNi+2dNhRLQ+ogmmOmx/snnok9K9WVu/efsKcnXRYj24
 dgdOpj0SPlJP3/4GmU+0IOFWff5cSM7UyNx/kW3Rx1qA9gYiUxfQ
X-Google-Smtp-Source: AGHT+IH+D9y4G7q+l3gX0afrHis3jTndC+4q6rRWXxESOkmoncT+9xkRPwtY2kgZHGqK0rqBuSHufw==
X-Received: by 2002:a17:90b:e8a:b0:29b:6cfb:14a6 with SMTP id
 fv10-20020a17090b0e8a00b0029b6cfb14a6mr8043401pjb.11.1710131772355; 
 Sun, 10 Mar 2024 21:36:12 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 q10-20020a170902e30a00b001d9aa663282sm3583751plc.266.2024.03.10.21.36.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Mar 2024 21:36:11 -0700 (PDT)
Date: Sun, 10 Mar 2024 21:36:10 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: linux-kselftest@vger.kernel.org
Cc: David Airlie <airlied@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Kees Cook <keescook@chromium.org>, Daniel Diaz <daniel.diaz@linaro.org>,
 David Gow <davidgow@google.com>, Arthur Grillo <arthurgrillo@riseup.net>,
 Brendan Higgins <brendan.higgins@linux.dev>,
 Naresh Kamboju <naresh.kamboju@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Maxime Ripard <mripard@kernel.org>,
 Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 kunit-dev@googlegroups.com, linux-arch@vger.kernel.org
Subject: Re: [RFC PATCH 0/5] Add support for suppressing warning backtraces
Message-ID: <d24f147c-a304-4395-aefc-bed7490278b6@roeck-us.net>
References: <20240305184033.425294-1-linux@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240305184033.425294-1-linux@roeck-us.net>
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

On Tue, Mar 05, 2024 at 10:40:28AM -0800, Guenter Roeck wrote:
> Some unit tests intentionally trigger warning backtraces by passing bad
> parameters to kernel API functions. Such unit tests typically check the
> return value from such calls, not the existence of the warning backtrace.
> 
> Such intentionally generated warning backtraces are neither desirable
> nor useful for a number of reasons.
> - They can result in overlooked real problems.
> - A warning that suddenly starts to show up in unit tests needs to be
>   investigated and has to be marked to be ignored, for example by
>   adjusting filter scripts. Such filters are ad-hoc because there is
>   no real standard format for warnings. On top of that, such filter
>   scripts would require constant maintenance.
> 
> One option to address problem would be to add messages such as "expected
> warning backtraces start / end here" to the kernel log.  However, that
> would again require filter scripts, it might result in missing real
> problematic warning backtraces triggered while the test is running, and
> the irrelevant backtrace(s) would still clog the kernel log.
> 
> Solve the problem by providing a means to identify and suppress specific
> warning backtraces while executing test code. Support suppressing multiple
> backtraces while at the same time limiting changes to generic code to the
> absolute minimum. Architecture specific changes are kept at minimum by
> retaining function names only if both CONFIG_DEBUG_BUGVERBOSE and
> CONFIG_KUNIT are enabled.
> 
> The first patch of the series introduces the necessary infrastructure.
> The second patch marks the warning message in drm_calc_scale() in the DRM
> subsystem as intentional where warranted. This patch is intended to serve
> as an example for the use of the functionality introduced with this series.
> The last three patches in the series introduce the necessary architecture
> specific changes for x86, arm64, and loongarch.
> 
> This series is based on the RFC patch and subsequent discussion at
> https://patchwork.kernel.org/project/linux-kselftest/patch/02546e59-1afe-4b08-ba81-d94f3b691c9a@moroto.mountain/
> and offers a more comprehensive solution of the problem discussed there.
> 
> Checkpatch note:
>   Remaining checkpatch errors and warnings were deliberately ignored.
>   Some are triggered by matching coding style or by comments interpreted
>   as code, others by assembler macros which are disliked by checkpatch.
>   Suggestions for improvements are welcome.
> 
> Some questions:
> 
> - Is the general approach promising ? If not, are there other possible
>   solutions ?
> - Function pointers are only added to the __bug_table section if both
>   CONFIG_KUNIT and CONFIG_DEBUG_BUGVERBOSE are enabled. This avoids image
>   size increases if CONFIG_KUNIT=n. Downside is slightly more complex
>   architecture specific assembler code. If function pointers were always
>   added to the __bug_table section, vmlinux image size would increase by
>   approximately 0.6-0.7%. Is the increased complexity in assembler code
>   worth the reduced image size ? I think so, but I would like to hear
>   other opinions.
> - There are additional possibilities associated with storing the bug
>   function name in the __bug_table section. It could be independent of
>   KUNIT, it could be a configuration flag, and/or it could be used to
>   display the name of the offending function in BUG/WARN messages.
>   Is any of those of interest ?
> 

I am ready to send a full version of this series with support for
all affected architectures. I am undecided if I should send it now,
based on v6.8, and send v2 after rebasing it to v6.9-rc1, or if I
should just wait for v6.9-rc1.

I understand that some maintainers dislike getting new patch series
while the commit window is is open. On the ther side, I tested the
series thoroughly on top of v6.8-rc7, and initial v6.9 release candidates
may have their own problems. Given that, I tend to send the series now.

Any thoughts ? Unless there is strong negative feedback, I'll likely
do that in a day or two.

Thanks,
Guenter
