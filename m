Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF5149317F
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jan 2022 00:59:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E92C10F0B0;
	Tue, 18 Jan 2022 23:58:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F0E210F0AF
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jan 2022 23:58:55 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id c24so378054edy.4
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jan 2022 15:58:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=5f1ekx32GWBGNlV6ybwLRE+uizOl0cg+1caeiV69PeY=;
 b=ovHB0TvGd1pVYqqOh0TxwkqGL4ShREhvUg2/MQsJ2CY6hcvk5bYletb8ZgCGFhv5Dz
 5YxbjUsLWYbkHiIi9Vn2l942jvQZNqe6TB0/Nq8qL09KEYYAcBd1aMM07ugOKweS1m4P
 L6YUh+gESDqZqydGmvrUNqo3Y13IAckHuR67e4EZlT2QdBrVI5s+7KpH3EPePgX+Quyv
 Of49Hlz5M2dbpyLQFByLkkZmZhmpoW+doGOYTdESe1E6sMcu0aMkQfmrDyacviSxhDel
 7Tp0B6JnuOisAo8HSSCGVudduPoZfRniJZqVh577xAdcO0JARzA0ysGOSwDUMVZ7SBf7
 ExDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5f1ekx32GWBGNlV6ybwLRE+uizOl0cg+1caeiV69PeY=;
 b=IZTBWSnGqtpC3N1mw3R0FFMm9HquPqfx7vn9tSaDbzbmT7Mrz3fIhmzzsSllySBrMl
 N+guWkziMbxkqMUKoQ223lRzBek+F/oAmXlosg/AwD0j6Sg0Wx2fYkSTOHKN51MQ+Vkb
 Zv5QDFg7+EnAAPavse0KwLVvGSHzqMjVBljZXzrkHcslxUpB45WCup8WGI1NYfPrN5e5
 MSYz1rRNW1IPo6ya61EO5NBON8BtxuZt+0mEOIQtw169OGaLXIJ6LnaUqD9a23IonY6q
 wynxBuXFhZbaPsjgoMElRJ4VA1Say4jbd/QV2b0x3vL6Z7ZqoZwYQr3jLee2Vo3PjcMY
 hLag==
X-Gm-Message-State: AOAM532AonVWG/TP7k3N4VAgaEaJ7BAdieEpjLs2f8gVCsjWLf8HNmL1
 Kcg1jqglsd2law6r3VRyBTZbEBXlzexWcymIV4hk8g==
X-Google-Smtp-Source: ABdhPJwtJHei5wgJ05UkDl5MUHlrNFHCoSJEnJXPA/7TO2IB2GMZSMMQDiD+Cwo93X/Kl7rHykwfNHyKBo8URvdopTw=
X-Received: by 2002:a17:907:6da4:: with SMTP id
 sb36mr21779591ejc.542.1642550333765; 
 Tue, 18 Jan 2022 15:58:53 -0800 (PST)
MIME-Version: 1.0
References: <20220117232259.180459-1-michal.winiarski@intel.com>
In-Reply-To: <20220117232259.180459-1-michal.winiarski@intel.com>
From: Daniel Latypov <dlatypov@google.com>
Date: Tue, 18 Jan 2022 15:58:41 -0800
Message-ID: <CAGS_qxrL8Ey8sq3Mk586dBQtdkAMK9WbeTKC3OGL6r09uEwEKA@mail.gmail.com>
Subject: Re: [RFC 00/10] drm: selftests: Convert to KUnit
To: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>
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
Cc: linux-kselftest@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Brendan Higgins <brendanhiggins@google.com>,
 dri-devel@lists.freedesktop.org, Arkadiusz Hiler <arek@hiler.eu>,
 Petri Latvala <petri.latvala@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

 change
On Mon, Jan 17, 2022 at 3:24 PM Micha=C5=82 Winiarski
<michal.winiarski@intel.com> wrote:
>
> KUnit unifies the test structure and provides helper tools that simplify
> the development. Basic use case allows running tests as regular processes=
,
> leveraging User Mode Linux.
> For example, to execute all DRM unit tests:
> ./tools/testing/kunit/kunit.py run --kunitconfig=3Ddrivers/gpu/drm
> (the tool also allows using QEMU instead of UML by adding e.g. --arch=3Dx=
86_64)
>
> For developers - it means that it's easier to run unit tests on the devel=
opment
> machine, tightening the feedback loop. When using UML, it also simplifies=
 using

Nice, it's neat to see --kunitconfig being useful for having
one-liners for running tests.

> gdb for debug (since the kernel is just a regular process).

Anecdotally, I hear from davidgow@google.com that using gdb and UML
together isn't the nicest experience because of all the SIGSEGV flying
around when emulating paging.
So I'm a bit doubtful about this particular statement, but if you have
tried it out and it works well, then that's good too.

I just think the primary benefit of UML is faster compilation and it
being somewhat lighter than bringing up a VM.

> For CI systems - DRM tests can be moved from being executed on device und=
er
> test (that's also running IGTs and so on) to being executed on buildsyste=
m
> during build (just like checkpatch.pl).
>
> All tests were renamed - IGT prefix is no longer used.
>
> Compared to selftests executed by CI using IGT, there's one functional
> regression - KUnit test runner is not catching WARNs.
> To solve this, we could either go in the similar direction that UBSAN wen=
t in:
> 1195505 ("kunit: ubsan integration")

Is the suggestion that all WARN's fail the current KUnit test?
I don't think we can do that.

Some KUnit tests will explicitly want to trigger error paths, so we
could have a lot of false positives.

An alternative is that we can apply the 1195505 to the code paths
we're interested in, e.g.

#include <kunit/test-bug.h>
if (bad_thing()) {
  kunit_fail_current_test("bad_thing happened");
}


I don't have the context to know how cumbersome this would be for the
DRM tests though.
If the answer is we want to catch any and all warnings, then we'd
perhaps want to add something to the tests themselves. And maybe we
should implement that as a KUnit library helper function so that other
tests can use it as well.

> Or we could expand the test runner to catch WARN signature in dmesg.

Ditto from the above, I think we'd wrongly mark some tests as failed
for intentional warnings.

>
> Pastebin to preview the output and execution times:
> https://gitlab.freedesktop.org/-/snippets/4139

I see these take 17-18s to exec the tests in the example snippets.
FYI, if you're not already trying this on top of 5.16, there's recent
changes to make the parsed output more fully realtime as well.
So hopefully that should increase the usability of these tests a bit furthe=
r.

I only mention that since I wasn't able to apply this series without
conflicts on top of v5.16.

>
> -Micha=C5=82
>
> Micha=C5=82 Winiarski (10):
>   drm: test-drm_cmdline_parser: Convert to KUnit
>   drm: test-drm_plane_helper: Convert to KUnit
>   drm: test-drm_format: Convert to KUnit
>   drm: test-drm_framebuffer: Convert to KUnit
>   drm: test-drm_damage_helper: Convert to KUnit
>   drm: test-drm_dp_mst_helper: Convert to KUnit
>   drm: test-drm_rect: Convert to KUnit
>   drm: test-drm_mm: Convert to KUnit
>   drm: selftests: Convert to KUnit
>   drm: test: Simplify testing on UML with kunit.py
>
>  drivers/gpu/drm/.kunitconfig                  |    3 +
>  drivers/gpu/drm/Kconfig                       |   22 +-
>  drivers/gpu/drm/Makefile                      |    2 +-
>  drivers/gpu/drm/i915/Kconfig.debug            |    1 -
>  drivers/gpu/drm/selftests/Makefile            |    7 -
>  .../gpu/drm/selftests/drm_cmdline_selftests.h |   68 -
>  drivers/gpu/drm/selftests/drm_mm_selftests.h  |   28 -
>  .../gpu/drm/selftests/drm_modeset_selftests.h |   40 -
>  drivers/gpu/drm/selftests/drm_selftest.c      |  109 -
>  drivers/gpu/drm/selftests/drm_selftest.h      |   41 -
>  .../drm/selftests/test-drm_cmdline_parser.c   | 1141 --------
>  .../drm/selftests/test-drm_damage_helper.c    |  667 -----
>  .../drm/selftests/test-drm_dp_mst_helper.c    |  273 --
>  drivers/gpu/drm/selftests/test-drm_format.c   |  280 --
>  drivers/gpu/drm/selftests/test-drm_mm.c       | 2487 -----------------
>  .../drm/selftests/test-drm_modeset_common.c   |   32 -
>  .../drm/selftests/test-drm_modeset_common.h   |   52 -
>  .../gpu/drm/selftests/test-drm_plane_helper.c |  223 --
>  drivers/gpu/drm/selftests/test-drm_rect.c     |  223 --
>  drivers/gpu/drm/test/Makefile                 |    7 +
>  .../gpu/drm/test/test-drm_cmdline_parser.c    | 1027 +++++++
>  drivers/gpu/drm/test/test-drm_damage_helper.c |  667 +++++
>  drivers/gpu/drm/test/test-drm_dp_mst_helper.c |  429 +++
>  drivers/gpu/drm/test/test-drm_format.c        |  356 +++
>  .../test-drm_framebuffer.c                    |  109 +-
>  drivers/gpu/drm/test/test-drm_mm.c            | 2426 ++++++++++++++++
>  drivers/gpu/drm/test/test-drm_plane_helper.c  |  312 +++
>  drivers/gpu/drm/test/test-drm_rect.c          |  249 ++
>  drivers/video/Kconfig                         |    4 +
>  29 files changed, 5558 insertions(+), 5727 deletions(-)
>  create mode 100644 drivers/gpu/drm/.kunitconfig
>  delete mode 100644 drivers/gpu/drm/selftests/Makefile
>  delete mode 100644 drivers/gpu/drm/selftests/drm_cmdline_selftests.h
>  delete mode 100644 drivers/gpu/drm/selftests/drm_mm_selftests.h
>  delete mode 100644 drivers/gpu/drm/selftests/drm_modeset_selftests.h
>  delete mode 100644 drivers/gpu/drm/selftests/drm_selftest.c
>  delete mode 100644 drivers/gpu/drm/selftests/drm_selftest.h
>  delete mode 100644 drivers/gpu/drm/selftests/test-drm_cmdline_parser.c
>  delete mode 100644 drivers/gpu/drm/selftests/test-drm_damage_helper.c
>  delete mode 100644 drivers/gpu/drm/selftests/test-drm_dp_mst_helper.c
>  delete mode 100644 drivers/gpu/drm/selftests/test-drm_format.c
>  delete mode 100644 drivers/gpu/drm/selftests/test-drm_mm.c
>  delete mode 100644 drivers/gpu/drm/selftests/test-drm_modeset_common.c
>  delete mode 100644 drivers/gpu/drm/selftests/test-drm_modeset_common.h
>  delete mode 100644 drivers/gpu/drm/selftests/test-drm_plane_helper.c
>  delete mode 100644 drivers/gpu/drm/selftests/test-drm_rect.c
>  create mode 100644 drivers/gpu/drm/test/Makefile
>  create mode 100644 drivers/gpu/drm/test/test-drm_cmdline_parser.c
>  create mode 100644 drivers/gpu/drm/test/test-drm_damage_helper.c
>  create mode 100644 drivers/gpu/drm/test/test-drm_dp_mst_helper.c
>  create mode 100644 drivers/gpu/drm/test/test-drm_format.c
>  rename drivers/gpu/drm/{selftests =3D> test}/test-drm_framebuffer.c (91%=
)
>  create mode 100644 drivers/gpu/drm/test/test-drm_mm.c
>  create mode 100644 drivers/gpu/drm/test/test-drm_plane_helper.c
>  create mode 100644 drivers/gpu/drm/test/test-drm_rect.c
>
> --
> 2.34.1
>
