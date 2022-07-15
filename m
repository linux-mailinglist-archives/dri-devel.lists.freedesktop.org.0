Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 612D9575861
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jul 2022 02:03:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86A6E10F7D6;
	Fri, 15 Jul 2022 00:03:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2394F10EC76
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jul 2022 00:03:21 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id b11so6183654eju.10
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jul 2022 17:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=fwraHTEP/uVZ9KCal2b2vqb8PKwKxo0TpTT7XGDLLZE=;
 b=Ew35vEVTCjHoWMpCvupFCvQMugpO31WL5+yFBGY/4vLy9c/2lHjyL0Qakj48tSo9RH
 hNkYdoFnwqRm4CGjLZBjKauF7HwHfGWwdC13A/boMmvLWcnyhh4i8G2eTmOcyNcmBCFQ
 yeSO6zvaQfPtjU23hSBzdEcTDEiS8BtsYVkCCVOdpnAfS95Xcqd83tRWzemWJYIVF0uG
 FsiLzam4+8VzlAhRc7TuzkTn0CgKium3YJ5axjlQyy4I5FFW0C5IhyyBw1NQz2Wo3RTh
 41K8Z0Qz6lO5I0SEC11jKfeGJAfHpc1G123IAYHpBuyPwj8qBz3lhqSa+BaX0q9QQqha
 KXIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=fwraHTEP/uVZ9KCal2b2vqb8PKwKxo0TpTT7XGDLLZE=;
 b=kXZrk0C35Fx4utSbxC6Pwc36LOFT7PHqtAXS92DsQ1Mxhf5qg3omjpC6Dd1WHs2LEv
 pPXKyJLUCazzaDBIpm9YsiVUM4Z0msftvzrcyJqApyDV8AYoqs7Cks2w64Y2LXg/B42n
 D9OD+J8oJcCLOgGvXhb7/EGqtx0TtpfOXGt6MQgsO1bUQAFBodOpSNmxHCyP5gTXtKXF
 03bWvlyqcf65B9qII5m1vX4Nu8VJWxEMWdfhb7UuHwC4ByWR2FBhsRtQTBsQ48NWxG3T
 j9ci96ui3L36h5ksfH3n+LWPd0bFMArLC1eH2XzLlQBdJKzGpxN0Qb/ABBxJvHDb3L4j
 wVQA==
X-Gm-Message-State: AJIora9Zr4k2KV3UqvZv9yLx9iJUMfRutng9p7jfteOjp3IXe5t99tg6
 nxSLGsjo1VHJ/TmXGfbYVzJvog3G1bWLEJtgPTdAEA==
X-Google-Smtp-Source: AGRyM1vbY7PEy17UlotgKN0DNZJDJvWNMdNGydoLgQZD6KQsvix4dz1Cwf5HUOIEMKSPpgkaLf+4J5OUcADUQzkaZiY=
X-Received: by 2002:a17:907:2718:b0:72b:6b65:37dc with SMTP id
 w24-20020a170907271800b0072b6b6537dcmr10960045ejk.425.1657843399208; Thu, 14
 Jul 2022 17:03:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220708203052.236290-1-maira.canal@usp.br>
 <20220708203052.236290-5-maira.canal@usp.br>
 <20220714235137.GA485839@roeck-us.net>
In-Reply-To: <20220714235137.GA485839@roeck-us.net>
From: Daniel Latypov <dlatypov@google.com>
Date: Thu, 14 Jul 2022 17:03:07 -0700
Message-ID: <CAGS_qxrhy3=pST9f85fvxubKQShOq1XF6ZHALzMhXDOf5gnaUg@mail.gmail.com>
Subject: Re: [PATCH v5 4/9] drm: selftest: convert drm_format selftest to KUnit
To: Guenter Roeck <linux@roeck-us.net>
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
 michal.winiarski@intel.com, =?UTF-8?B?TWHDrXJhIENhbmFs?= <maira.canal@usp.br>,
 linux-kernel@vger.kernel.org, leandro.ribeiro@collabora.com,
 Thomas Zimmermann <tzimmermann@suse.de>, tales.aparecida@gmail.com,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 14, 2022 at 4:51 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On Fri, Jul 08, 2022 at 05:30:47PM -0300, Ma=C3=ADra Canal wrote:
> > Considering the current adoption of the KUnit framework, convert the
> > DRM format selftest to the KUnit API.
> >
> > Tested-by: David Gow <davidgow@google.com>
> > Acked-by: Daniel Latypov <dlatypov@google.com>
> > Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> > Signed-off-by: Ma=C3=ADra Canal <maira.canal@usp.br>
>
> This patch results in:
>
> Building powerpc:allmodconfig ... failed
> --------------
> Error log:
> drivers/gpu/drm/tests/drm_format_test.c: In function 'igt_check_drm_forma=
t_min_pitch':
> drivers/gpu/drm/tests/drm_format_test.c:271:1: error: the frame size of 3=
712 bytes is larger than 2048 bytes
>
> presumably due to function nesting.

This can happen when there's a lot of KUNIT_EXPECT_* calls in a single func=
tion.
See [1] for some related context.
There were a number of patches that went into 5.18 ([2] and others) to
try and mitigate this, but it's not always enough.

Ideally the compiler would see that the stack-local variables used in
these macros don't need to stick around, but it doesn't always
happen...
One workaround would be to split up the test case functions into smaller ch=
unks.

[1] https://lore.kernel.org/linux-kselftest/20210929212713.1213476-1-brenda=
nhiggins@google.com/
[2] https://lore.kernel.org/linux-kselftest/20220113165931.451305-1-dlatypo=
v@google.com/

Daniel
