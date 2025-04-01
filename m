Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC255A781A9
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 19:50:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9745D10E64B;
	Tue,  1 Apr 2025 17:50:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="S34CMq7U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF77F10E63E;
 Tue,  1 Apr 2025 17:50:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 5BB3843747;
 Tue,  1 Apr 2025 17:50:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0459C4CEE4;
 Tue,  1 Apr 2025 17:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743529813;
 bh=5w1rWSu4FoKgUz0ufLzbenr7Kw901BbMLrngbLFGrlo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=S34CMq7U+GwwfKhxHN1rfUSV9PEggYUCsmRvaCbOFa/6taOyTRfF4zT1Oba3Mrc2E
 xEsM/EsBr7H0Wuoshsfs7Lj6VhykH1TXb8nb/2vO/MGIDAc4p33l06ncFTS5ea1l/N
 VO3XWs9ZN3yEdbeFBahpMB6BUSYFAO++2F8sgAnv3USP6sv1M/t/yRbBaGuWdNteQO
 ufx4Jn7zqD9KKFWJJxA80ZXIqMNdVT5tMxNzBRCBTOKaWJsM0Y0lftfg3iGGLC1xAP
 Bh55HS0fAPOzMFxQA2ESasrNXA1WD0OBY5WVYzmkbJ8P45FX+WDB4v6V89/IMvjxgQ
 WzM6a3Zj6C2aA==
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-30bfb6ab47cso55844141fa.3; 
 Tue, 01 Apr 2025 10:50:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUq6FSBFZdEQxxggOg0oLOgL6cqa9VSwQlq9RBjYsJWJ4EUPTKb46fFfZ7fB+3Fd1SIpxjYfgi6pBTJ@lists.freedesktop.org,
 AJvYcCW+n9LVAddm9ahrKwWfvTivtL+RpKfJS7E+nMXKnTz7tjXeSc3zOS5jk3x6WdjjfzjIz4O0UvYpDi4=@lists.freedesktop.org,
 AJvYcCWjF4X9xwhpbvErSPhd0LA5cjyKPPVdsLsVO0kAykEv1QX1qCij/jS5F/gUBkqBIMOkNvTkXCOcyaA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx7anETDryrL7oJTQxyb8dASIYmznr9iVWv5sRJTvmpmQtfkABM
 wiljYxBU5D4ENMgm1cr7ZWWgodXfC4ZdYd7wrlByr2d9wlUcvPpDh7paz4e0E+3JL8k6CJsWIug
 JCYPWmg8JseJ3y58j6iiK4dWmicU=
X-Google-Smtp-Source: AGHT+IGkYmWarqLME3M5HUIsQ/RX+P/5BKahl7gfF2DogfQq8fD0ENinrg/PiXRnlDNAOxCWg2EL+7CI4PMqzlSG+Eg=
X-Received: by 2002:a2e:9fcb:0:b0:30b:9813:b010 with SMTP id
 38308e7fff4ca-30de0349ecbmr48182701fa.31.1743529812331; Tue, 01 Apr 2025
 10:50:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250401121830.21696-1-jani.nikula@intel.com>
 <20250401121830.21696-5-jani.nikula@intel.com>
In-Reply-To: <20250401121830.21696-5-jani.nikula@intel.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 2 Apr 2025 02:49:35 +0900
X-Gmail-Original-Message-ID: <CAK7LNATBy2NwnZ73ihzuD+LMg44abo0JOz6RrU2saH7+Ofnz7Q@mail.gmail.com>
X-Gm-Features: AQ5f1JqXPpYsKshoJPHuR6f9NFVrbpHQ-JH5po56qE-Fc4aHML7godt8OXSg-vY
Message-ID: <CAK7LNATBy2NwnZ73ihzuD+LMg44abo0JOz6RrU2saH7+Ofnz7Q@mail.gmail.com>
Subject: Re: [PATCH 4/5] kbuild: hdrtest: place header test files in .hdrtest
 subdirectories
To: Jani Nikula <jani.nikula@intel.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-kbuild@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org
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

On Tue, Apr 1, 2025 at 9:19=E2=80=AFPM Jani Nikula <jani.nikula@intel.com> =
wrote:
>
> The header tests track whether headers have been checked using empty
> *.hdrtest files in the build tree. This pollutes the build directories,
> as the files live in the same "name space" as the real output files,
> messing with TAB completion among other things.
>
> Hide the disgusting turds by placing them in .hdrtest subdirectories.
>
> Note that it would be somewhat nicer to have the basename of the
> .hdrtest files be dot-prefixed instead of using subdirectories. However,
> it's challenging to come up with a pattern rule for that, as we can list
> headers to test in the subdirectories of $(src) too, without requiring
> Makefiles and kbuild to descend to each of them.
>
> Reported-by: Linus Torvalds <torvalds@linux-foundation.org>
> Closes: https://lore.kernel.org/r/CAHk-=3DwjMrqzuUmH-mFbR_46EWEFS=3DbB=3D=
J7h9ABMVy56Vi81PKQ@mail.gmail.com
> Fixes: fcbb8461fd23 ("kbuild: remove header compile test")
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>
> ---


Linus did not mention anything bad for usr/include/.

This crap is unneeded.

NACK.






>
> Cc: linux-kbuild@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: intel-xe@lists.freedesktop.org
> Cc: intel-gfx@lists.freedesktop.org
> ---
>  usr/include/Makefile | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/usr/include/Makefile b/usr/include/Makefile
> index e3d6b03527fe..4fb574fd3fec 100644
> --- a/usr/include/Makefile
> +++ b/usr/include/Makefile
> @@ -71,7 +71,7 @@ endif
>  # asm-generic/*.h is used by asm/*.h, and should not be included directl=
y
>  no-header-test +=3D asm-generic/%
>
> -always-y :=3D $(patsubst $(obj)/%.h,%.hdrtest, $(shell find $(obj) -name=
 '*.h' 2>/dev/null))
> +always-y :=3D $(patsubst $(obj)/%.h,.hdrtest/%.hdrtest, $(shell find $(o=
bj) -name '*.h' 2>/dev/null))
>
>  # Include the header twice to detect missing include guard.
>  quiet_cmd_hdrtest =3D HDRTEST $<
> @@ -81,7 +81,7 @@ quiet_cmd_hdrtest =3D HDRTEST $<
>                 $(PERL) $(src)/headers_check.pl $(obj) $<; \
>                 touch $@
>
> -$(obj)/%.hdrtest: $(obj)/%.h FORCE
> +$(obj)/.hdrtest/%.hdrtest: $(obj)/%.h FORCE
>         $(call if_changed_dep,hdrtest)
>
>  # Since GNU Make 4.3, $(patsubst $(obj)/%/,%,$(wildcard $(obj)/*/)) work=
s.
> --
> 2.39.5
>


--
Best Regards
Masahiro Yamada
