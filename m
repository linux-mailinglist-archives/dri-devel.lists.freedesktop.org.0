Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E751485E90C
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 21:29:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7640910E7EB;
	Wed, 21 Feb 2024 20:29:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="DwG2wVva";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
 [209.85.160.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A4F310E7EB
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 20:29:55 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id
 d75a77b69052e-42e2507c6e1so58951cf.1
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 12:29:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1708547394; x=1709152194;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8iAiTEgCppjIE3t1disnBeWTtqYJCr/gkvmRX972lsA=;
 b=DwG2wVvaIIfekGQBpclQsvvCl+OTnwWYIXSuPzAGO7H7j/bwGVJsLkAU44AnYo+X7A
 WQCnDrjUev1MeyBcV7Q4GSMxcGqzqwbFXbrT4P/rL/EzuJBTxNE8E5g9ekUGH2WIYAhD
 3awGR+NYucmEYWgoXf3DzYfH4p21S2d1hFi838E9f7YdKZNU0E0l+RK1WwvqHLB/ySRb
 +okWYZ9/2S6F6yLd9pvkCshz++n3wlnXXaPTCGgZqwKakvD1CamHRNnslchkGgRYnfL6
 iDWAnkwPvDdVnA/TfXUxLgJq3tXYKb05UwG4zmZBZPbaKnhFWLBh6D3VF/d3AblNgbgI
 do2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708547394; x=1709152194;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8iAiTEgCppjIE3t1disnBeWTtqYJCr/gkvmRX972lsA=;
 b=ZOfAoA0jL7EoQqAaT1HYe3krbg9N/8w8Pcb1Fa/O1bQeCoQzo/fr1iorDnpPP8u51J
 YukNMfxnd49/brYr6C8Uxs8oZSIooMYOikVKapVWdK3jSpatTUZ20SKhhcahfQW7fWGx
 RzMS3svoLoo9gJOYHL+Zn+2UK+76lRPRNReEmNPYXjg4NjKQ8m1SeUn5pyO9GTRQ14hZ
 qM/jW/S7zNFas0ZZEzVZwdoydXoSMrLy65YNP+Ip9ns/sx4jNiUqMEXcS/9DJlsrtLg+
 zq48i5ixwbX3C/qpW01icOKwst+B+vCfwhdF6dk7x79tp0BvLzaw1g4j0Ph9GSrptyqy
 fX2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVzArd74DksqLJlVWVxLws6ZFkyaB4fyvNIQQUAm2v6DixxdNHgJyy41PbRqI6L3v48PuV8WvDWHduPi21xTWuIwaX2mLOqAHTpBa+a7qYc
X-Gm-Message-State: AOJu0Yx85wvVM+9N9+/HIDiTbI4dUb7jzAfswd4JgNhwPe0n8K9NUbk6
 JIxcetrVxsqdJ8wyKcWZO3oI3xIp4sGSwzQe1zu5I46LaojiwHmmZJQ3Ary29pK0imUzoV8ba+v
 wq/Y6uG2ZTCR75fqzau17MjuW+NGCS2E3I5SQ
X-Google-Smtp-Source: AGHT+IHkUH8682wBjX2MlXCiKDKRKTZ78A7IDkSZwKh62FAeHimOB2zWqCHjoUmuvZXD72aiFX0+O0WGwp10g7NziwQ=
X-Received: by 2002:ac8:4907:0:b0:42e:660:eb8d with SMTP id
 e7-20020ac84907000000b0042e0660eb8dmr285459qtq.5.1708547393077; Wed, 21 Feb
 2024 12:29:53 -0800 (PST)
MIME-Version: 1.0
References: <20240221092728.1281499-1-davidgow@google.com>
 <20240221092728.1281499-2-davidgow@google.com>
In-Reply-To: <20240221092728.1281499-2-davidgow@google.com>
From: Daniel Latypov <dlatypov@google.com>
Date: Wed, 21 Feb 2024 12:29:38 -0800
Message-ID: <CAGS_qxpyNVqigHB+kS-1xqzR4BAOQXoMSNS+d5khkLYrkpmOgA@mail.gmail.com>
Subject: Re: [PATCH 1/9] kunit: test: Log the correct filter string in
 executor_test
To: David Gow <davidgow@google.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Shuah Khan <skhan@linuxfoundation.org>, 
 Guenter Roeck <linux@roeck-us.net>, Rae Moar <rmoar@google.com>, 
 Matthew Auld <matthew.auld@intel.com>, 
 Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Kees Cook <keescook@chromium.org>,
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 Willem de Bruijn <willemb@google.com>, Florian Westphal <fw@strlen.de>,
 Cassio Neri <cassio.neri@gmail.com>, 
 Javier Martinez Canillas <javierm@redhat.com>,
 Arthur Grillo <arthur.grillo@usp.br>, 
 Brendan Higgins <brendan.higgins@linux.dev>, Stephen Boyd <sboyd@kernel.org>, 
 David Airlie <airlied@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
 "David S . Miller" <davem@davemloft.net>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, intel-xe@lists.freedesktop.org, 
 linux-rtc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 kunit-dev@googlegroups.com, linux-hardening@vger.kernel.org, 
 netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Wed, Feb 21, 2024 at 1:28=E2=80=AFAM David Gow <davidgow@google.com> wro=
te:
>
> KUnit's executor_test logs the filter string in KUNIT_ASSERT_EQ_MSG(),
> but passed a random character from the filter, rather than the whole
> string.

Note: it's worse than that, afaict.

It's printing from a random bit of memory.
I was curious about this, so I found under UML, the string I got was
always "efault)" if I make it fail for j=3D0.

>
> This was found by annotating KUNIT_ASSERT_EQ_MSG() to let gcc validate
> the format string.
>
> Fixes: 76066f93f1df ("kunit: add tests for filtering attributes")
> Signed-off-by: David Gow <davidgow@google.com>

Reviewed-by: Daniel Latypov <dlatypov@google.com>

> ---
>  lib/kunit/executor_test.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/lib/kunit/executor_test.c b/lib/kunit/executor_test.c
> index 22d4ee86dbed..3f7f967e3688 100644
> --- a/lib/kunit/executor_test.c
> +++ b/lib/kunit/executor_test.c
> @@ -129,7 +129,7 @@ static void parse_filter_attr_test(struct kunit *test=
)
>                         GFP_KERNEL);
>         for (j =3D 0; j < filter_count; j++) {
>                 parsed_filters[j] =3D kunit_next_attr_filter(&filter, &er=
r);
> -               KUNIT_ASSERT_EQ_MSG(test, err, 0, "failed to parse filter=
 '%s'", filters[j]);
> +               KUNIT_ASSERT_EQ_MSG(test, err, 0, "failed to parse filter=
 from '%s'", filters);

note: if there is a v2, it might be nice to include `j` in the message.
