Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF3D860437
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 21:59:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F57C10EA89;
	Thu, 22 Feb 2024 20:59:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="ukk/Gg6u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
 [209.85.160.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5F7110EA89
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 20:59:07 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id
 d75a77b69052e-42e2507c6e1so82291cf.1
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 12:59:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1708635546; x=1709240346;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/zEWuRWWHcJcQcinmF9Ig0PacXm/lMdwIIHptRGDzpU=;
 b=ukk/Gg6uNVqNsmOWXogD8S2wq1BP/6Okxs0rBJvOsUkDAo/w0HfkJ9KypDiC5AJAzg
 Sn0zFckCDvaEpZm3goHaDNQrgMRrmlnQBtne1xQmbw+QI+pBc1LwLXKB3EAJivuDXtMD
 yXSy3PgH4TECu503IhaZM9/2DBY+wTNVBlLjl1lKlR6HRgM8OlakIzBXWffox6D9dBXT
 Sf7+jTczkKeGrS5Sn7TI3KT4DZjkhC99bEqscQ3m2G4NGcpAEntIJQoTNpyq550KQl+m
 YRayHyTHKJFJLSnq9mEcZAznwaIplRnTRtF6Bgvz/6E62WXS7HZQFkKrcDT6G1AvwrHy
 OiVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708635546; x=1709240346;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/zEWuRWWHcJcQcinmF9Ig0PacXm/lMdwIIHptRGDzpU=;
 b=u6+vcz3hSB6r8p+3k0S62x21f3q8uvfW3y3FI389M7O41czYQLJcH28blQF9cf4uAs
 ZpFakFzNWaMBeJUOdSPzuaL+OxbaL+kwQvR9QDRAOC4/MfAlV6AppD2clV5Gn9JAmMAu
 v57Cg4WvNEQuTP3m5mZOS1Aq23vGvXnwqGtNQcfJ4dh/sJr916y/kdNhCLSddzaWVx45
 nqnbDfqLabpyGVKkX5VKqOaj3mbCzREC3V378MgZTcUMeWP9MF17RY/cRb53Z1ekbb/j
 vuBSXwCE8mDdQr6JxLdNCOQNWxKzxOzKaucvb7Tc1lDpjTVP8Z3IQ/PFRr8HYyBjBinB
 EFrQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUwIcFAYiS4fjULAWoOklI7HyvS229LbCfntbQwtgJ6Pk1ZDjWIAKna586Ell1/aq0MzjgEtZUo5tTrlBu6Ye1aTXeukVkEjsOaDcj+qPfO
X-Gm-Message-State: AOJu0YxbDsBeqqBJJCdmK1u37DPaii8ubuX9DNK9Aba90R3UYGqUMdJA
 eLQto0rnCJZv1/pVfWIjl7XH3tNsB2PPdMCAzR0+om1FGoZwm8Io7hNI4XbcDH5BgH4yuttKS3i
 3+8cxjsPqLAjC1H+aplaotc0ktU6+Cwt4szY4
X-Google-Smtp-Source: AGHT+IFSpfaLdIKihK3iEVOja+3Eqku3dKQtV6o3yrUl8zcXbBHUkfm22S3h1VkUJApYDgRUGbJE0TXcXoTj3FcGfX4=
X-Received: by 2002:ac8:7643:0:b0:42e:1260:c4e6 with SMTP id
 i3-20020ac87643000000b0042e1260c4e6mr732606qtr.10.1708635546371; Thu, 22 Feb
 2024 12:59:06 -0800 (PST)
MIME-Version: 1.0
References: <20240221092728.1281499-1-davidgow@google.com>
 <20240221092728.1281499-2-davidgow@google.com>
In-Reply-To: <20240221092728.1281499-2-davidgow@google.com>
From: Rae Moar <rmoar@google.com>
Date: Thu, 22 Feb 2024 15:58:54 -0500
Message-ID: <CA+GJov6GyU0t0D5quhroCgEQOJgk0PCjVn5LROifBcNMx-ovcQ@mail.gmail.com>
Subject: Re: [PATCH 1/9] kunit: test: Log the correct filter string in
 executor_test
To: David Gow <davidgow@google.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Shuah Khan <skhan@linuxfoundation.org>, 
 Guenter Roeck <linux@roeck-us.net>, Matthew Auld <matthew.auld@intel.com>, 
 Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Kees Cook <keescook@chromium.org>,
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 Willem de Bruijn <willemb@google.com>, Florian Westphal <fw@strlen.de>,
 Cassio Neri <cassio.neri@gmail.com>, 
 Javier Martinez Canillas <javierm@redhat.com>,
 Arthur Grillo <arthur.grillo@usp.br>, 
 Brendan Higgins <brendan.higgins@linux.dev>,
 Daniel Latypov <dlatypov@google.com>, 
 Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, 
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

On Wed, Feb 21, 2024 at 4:28=E2=80=AFAM David Gow <davidgow@google.com> wro=
te:
>
> KUnit's executor_test logs the filter string in KUNIT_ASSERT_EQ_MSG(),
> but passed a random character from the filter, rather than the whole
> string.
>
> This was found by annotating KUNIT_ASSERT_EQ_MSG() to let gcc validate
> the format string.
>
> Fixes: 76066f93f1df ("kunit: add tests for filtering attributes")
> Signed-off-by: David Gow <davidgow@google.com>

Hello!

This change looks good to me. Thanks for fixing this mistake.

Thanks!
-Rae

Reviewed-by: Rae Moar <rmoar@google.com>

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
>         }
>
>         KUNIT_EXPECT_STREQ(test, kunit_attr_filter_name(parsed_filters[0]=
), "speed");
> --
> 2.44.0.rc0.258.g7320e95886-goog
>
