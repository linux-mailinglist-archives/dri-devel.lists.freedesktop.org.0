Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B3054E53C
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 16:44:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4708112665;
	Thu, 16 Jun 2022 14:44:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E5F5112E76
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 14:44:49 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id q9so2171541wrd.8
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 07:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=aZrB3adH98zZgiXaq8Bh/9GJWNUDyfOL1k5/hjqAukY=;
 b=i7KdIrhqZdq6ZlMvRRYL6JqbqJtW+/N/SZB9K4+/MYCGxrYWeIriIbE86kg1pl0rMN
 RCUe624jCQwW36o/S+Ll1mlvj8GFzzMEExZX63UIsnVhROA8ZXzB/8+xDMt6QtiTtFMo
 3xKcZyau7piOLyjudAGwavEhIIF+g+xffLhG7AtZEmvtESzMzlVBRSqxxG+MkR+ZbFjS
 5BMl3ikDcuXVwDdmVkMLchBjQ8Oqr/GN+50rI8fYW+9f1uG63meRtT0CEKoFaqn4/0CQ
 d0IoRvwkQaxt0vtddiGgXqSbmdIsSbwMaXpnE4AISLFxJd0ITZwZKleop3v+MXNi/OWN
 fuJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=aZrB3adH98zZgiXaq8Bh/9GJWNUDyfOL1k5/hjqAukY=;
 b=ajWMfyQ7Scs1XIASAZSGt88oFWiNhaQA1m2OWxtxCb0Yis0FUh7PcLGJwlOfEjJO+d
 zKIptDsGPscRvUOKpqYHSBy1gLKMnPBJN6OS2uo5i01MvD9evHYs0lcQUF+jEtPXeAnX
 5L822vxuqdwTdAAD+nh7Qj4is8hWYlftMDJ0nrNgjQXjBmvxTMQE/+bWt/sOLxw8ink+
 NGVL+OGliq/SNEF8sglf2Ft0RkW62AjMdMRwzGiCuMcyBc591ZfUg68B70eQ44iMXKXY
 eiO0R6NnONnaTgdHr5snxC0mRs51EGoEOcs2XSp8izH6mL1JpjmsR5OSuKFhftui+ait
 3LSA==
X-Gm-Message-State: AJIora/aY/o2YLuZsYXKCkLT4nJ7x4s3tOgKhV9Mz7UT82LFWRslhDha
 5HqADbl9naAgqsK3JtyO9NepnF3sx3nelltrF8UHTQ==
X-Google-Smtp-Source: AGRyM1uNGC1zkDykBzIAEnHz1xG3XXKqONvzJxyE5WBpt+GrhUUUJ3azHm2m+15Ro8lnIo+h/CB5CZZaZaZHpWYltUA=
X-Received: by 2002:a5d:648e:0:b0:217:d2cb:d6b2 with SMTP id
 o14-20020a5d648e000000b00217d2cbd6b2mr4912385wri.433.1655390687611; Thu, 16
 Jun 2022 07:44:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220613171738.111013-1-jose.exposito89@gmail.com>
In-Reply-To: <20220613171738.111013-1-jose.exposito89@gmail.com>
From: David Gow <davidgow@google.com>
Date: Thu, 16 Jun 2022 22:44:36 +0800
Message-ID: <CABVgOSn3zAGsphdEpuevhTo1xoYqHWNF4qty=gR22LcRiUkz0A@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] KUnit tests for drm_format_helper
To: =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>, 
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <maira.canal@usp.br>, 
 Isabella Basso <isabbasso@riseup.net>, magalilemes00@gmail.com,
 tales.aparecida@gmail.com
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
Cc: dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Daniel Latypov <dlatypov@google.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, tzimmermann@suse.de,
 KUnit Development <kunit-dev@googlegroups.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 14, 2022 at 1:17 AM Jos=C3=A9 Exp=C3=B3sito <jose.exposito89@gm=
ail.com> wrote:
>
> Hello everyone,
>
> Here is the v3 of the series, including the documentation, previously
> sent as a standalone patch [1], and changes suggested during review.
>
> Thanks a lot,
> Jos=C3=A9 Exp=C3=B3sito
>

[+Ma=C3=ADra, Isabella, Tales, Magali for other drm,amdgpu,KUnit work.]

These seem pretty good to me, but I'd echo Javier's comments about
consistency with other DRM tests.

In particular, we now have three concurrently developed DRM-related
test suites, each doing things slightly differently:
- This series is putting tests in drm/kunit, and providing a
.kunitconfig in that directory,
- The selftest ports here[1] are putting tests in drm/tests, and
provide a separate Kconfig file, as well as a .kunitconfig
- And the AMDGPU tests[2] are doing something totally different, with
their own tests in drm/amd/display/amdgpu_dm/tests, which get compiled
directly into the amdgpu module (and, at present, can't be run at all
via kunit_tool)

Certainly the general DRM tests should be in the same place, and use
the same Kconfig entries, etc. A mix of the separate Kconfig file from
[1] (if there's enough benefit to having the ability to turn on and
off suites individually, which seems plausible) and the documentation
from this series seems good to me.

There's some basic guidelines around test nomenclature in
Documentation/dev-tools/kunit/style.rst[3], though all of these
patches seem pretty consistent with that. Either 'kunit' or 'tests'
would work as a directory name: given the AMDGPU patches are using
'tests', maybe that's easier to stick with.

Cheers,
-- David

[1]: https://lore.kernel.org/linux-kselftest/20220615135824.15522-1-maira.c=
anal@usp.br/
[2]: https://lore.kernel.org/dri-devel/20220608010709.272962-1-maira.canal@=
usp.br/
[3]: https://www.kernel.org/doc/html/latest/dev-tools/kunit/style.html
