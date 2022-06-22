Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAFE15551E6
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 19:07:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F12510E5D8;
	Wed, 22 Jun 2022 17:06:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDB5110EB1A
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 17:06:55 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id z19so7963986edb.11
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 10:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=OqqiTD3gLybHOW4I6TLL5midAVTZ5DMLmHGaa4oXrwI=;
 b=LViXX25+dhqxoIkD3PVPh5xlkUUjEcGqJEAQ2qrZky+J2zu84mwCgGHlmhvMlgCsTZ
 /7+K0OsGs4c0r6Nxx1W3q3XWLkYo5PiFTkwvQoGEnBfp/rYyu9VMlF54QnNBcW6gxmeg
 udE1bX3CTw4mk+szaqUlm7iwY6sxk/Fp1YqJoi3c8VLcRlDc/GekR6NuuTqB5VoMO1dv
 RlTU9nDiD5VtqIMUKnNVdUrBu38/HydLxExUxcu7/Y4L75O1AA+/QDUzPv1hNPdlzD7Y
 R0gs5JfrNdgn6vrpQuSabxnMwLLVOxHRrZmJRtT1JLDE8OvV1VaUVKyjabfpdU8pgg0B
 PBpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=OqqiTD3gLybHOW4I6TLL5midAVTZ5DMLmHGaa4oXrwI=;
 b=HAraNBm503LxrCceUoF+HzjcbPCCHPbUj7YpvC4jMbC4cJmd7hNgtJ+EUFkxI3e9Gl
 vX3BgNgl6B54u6fUV3myRo/MqSbxOlQ07VzrL51XIP4iyk+nC+ZnDvjq3AmeHy02kj5T
 n+gMeOt/9HE29lX5t1oM+abaj4AVXxx+gnwqetVGtVoHp6kvjp9TjacFpCQf4f36URbR
 D1FDztGHkRgk+NpWcMjMZr4ZT4YjQLu54zfCSsImvNVqsShw6n7XyKNuK0Ud+IGYuzPu
 /x9pF4HzVuP3BLDpk0Ne8pD8pxsXV7l5nKWJ2mf5NrCJzgsclh90FmtyKK+qxZbuapy6
 bnXA==
X-Gm-Message-State: AJIora9JntBjS2NzJ+W083zkm5AqWuVUA6ZAqo1RhaWi9pnJkIQ/rHf2
 vMEJgK5/F4harJposX5uWDuunY3s15B4pY6vAFk1Lg==
X-Google-Smtp-Source: AGRyM1s9NziaB5rFGJn8nlqg9mHNGM6U4u3m7TD4UXdULiRqF9kKHp+l0vbLc2Qiez8orLLht/Ury4IBWPhFVGR8TKU=
X-Received: by 2002:a05:6402:438a:b0:435:bc23:d615 with SMTP id
 o10-20020a056402438a00b00435bc23d615mr2590960edc.283.1655917614113; Wed, 22
 Jun 2022 10:06:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220621200926.257002-1-maira.canal@usp.br>
 <20220621200926.257002-5-maira.canal@usp.br>
In-Reply-To: <20220621200926.257002-5-maira.canal@usp.br>
From: Daniel Latypov <dlatypov@google.com>
Date: Wed, 22 Jun 2022 10:06:42 -0700
Message-ID: <CAGS_qxrynX=q7ZVmFSm-HO-3r3wGVnXMXVMejM3-ONvyJUrrPg@mail.gmail.com>
Subject: Re: [PATCH v2 4/9] drm: selftest: convert drm_format selftest to KUnit
To: =?UTF-8?B?TWHDrXJhIENhbmFs?= <maira.canal@usp.br>
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
Cc: siqueirajordao@riseup.net, David Airlie <airlied@linux.ie>,
 brendanhiggins@google.com, dri-devel@lists.freedesktop.org,
 linux-kselftest@vger.kernel.org, n@nfraprado.net,
 Isabella Basso <isabbasso@riseup.net>, andrealmeid@riseup.net,
 magalilemes00@gmail.com, Javier Martinez Canillas <javierm@redhat.com>,
 mwen@igalia.com, David Gow <davidgow@google.com>,
 Shuah Khan <skhan@linuxfoundation.org>, kunit-dev@googlegroups.com,
 michal.winiarski@intel.com, tales.aparecida@gmail.com,
 linux-kernel@vger.kernel.org, leandro.ribeiro@collabora.com,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 21, 2022 at 1:10 PM Ma=C3=ADra Canal <maira.canal@usp.br> wrote=
:
>
> Considering the current adoption of the KUnit framework, convert the
> DRM format selftest to the KUnit API.
>
> Tested-by: David Gow <davidgow@google.com>
> Signed-off-by: Ma=C3=ADra Canal <maira.canal@usp.br>

Acked-by: Daniel Latypov <dlatypov@google.com>

Overall looks good from the KUnit side, just a few general suggestions belo=
w.

FYI, the warning email from kernel-test-robot is basically saying that
the compiler is not optimizing away the temporary variables internally
created in KUNIT_EXPECT_*.
So having too many KUNIT_EXPECT_.* in a single function is the trigger.
The main workaround you'd have is to split up the test into more test funct=
ions.
(I don't know if that's actually worth doing)

> +static void igt_check_drm_format_block_width(struct kunit *test)
> +{
> +       const struct drm_format_info *info =3D NULL;
> +
> +       /* Test invalid arguments */
> +       KUNIT_EXPECT_FALSE(test, drm_format_info_block_width(info, 0));
> +       KUNIT_EXPECT_FALSE(test, drm_format_info_block_width(info, -1));
> +       KUNIT_EXPECT_FALSE(test, drm_format_info_block_width(info, 1));

Hmm, I think one of these two would be clearer here:
KUNIT_EXPECT_EQ(test, drm_format_info_block_width(info, 0), 0);
KUNIT_EXPECT_EQ(test, 0, drm_format_info_block_width(info, 0));

I think this helps test readability (giving hints about the types) and
gives better error messages, more on that below.

The problem with using the boolean expectations is that given
  int foo =3D 2;
  KUNIT_EXPECT_FALSE(test, foo);
KUnit will only print out
    Expected foo to be false, but is true

Using EXPECT_EQ(foo, 0), we'd get
    Expected foo =3D=3D 0, but
        foo =3D=3D 2

Knowing exactly what the offending return value was can help debug
test failures a bit faster.

> +
> +       /* Test 1 plane format */
> +       info =3D drm_format_info(DRM_FORMAT_XRGB4444);
> +       KUNIT_EXPECT_TRUE(test, info);

FYI, you can now instead write
  KUNIT_EXPECT_NOT_NULL(test, info);
this new macro was merged into 5.19-rc1.
