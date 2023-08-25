Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 883F6788BB9
	for <lists+dri-devel@lfdr.de>; Fri, 25 Aug 2023 16:30:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D59E510E6AC;
	Fri, 25 Aug 2023 14:30:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D48910E6AC
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Aug 2023 14:30:31 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-51e2a6a3768so1462355a12.0
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Aug 2023 07:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692973829; x=1693578629;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+TKRKdJyVPQnXrud/UFhZyJn/bFLsStYMULRC9lmJOg=;
 b=OQXrYSh/ZTaRcrWWA0vglXPp3TlsL1Ma7vpCxlFdwF1lEPdbMdGQ/tKMaMonLuwtO5
 JABJFdxaAHTAHmpQ686SHGkxHl979MSfAFLV+3B5HIinjzcPUGnuPBGRlMn6pbEscsw4
 b0PqksMuIqStaAEvnyVczSfPUB69oWqBDHLqH0RNamea7U8iC2tZ6nNFXK2HuYAt/32n
 2kynjPi6lEJRwFgree9ATo/CaHaPlGM78Qu24dsK7wKNCKVFgt5H/HBeLRbk++6K2c1l
 0MoGgedsO6+4cm5hC27BUve7gq5G1M1pu2ApSyFKqsJXzh2yWo+9u/FQYYSPKg4EXygz
 Vhkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692973829; x=1693578629;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+TKRKdJyVPQnXrud/UFhZyJn/bFLsStYMULRC9lmJOg=;
 b=P6Q0Iz3WAPoMesuB2W7ogTabHIVdfP3QCCdP3gHHrxFQHyZQ7fmj0FcqZr1ptL8DvY
 JRyobtry4NXmzGLo6XGvxtgfyRkMe5wR3QnZ1itp6O1bK33vJGcQTN8MEBrK+Vl3xbFn
 s3hGx4RP4/MdPL/r/yg7Wm5CIsf7z9wZiQoKuW9OkUmV8REhS5FPa8a833zv2oRpvPkj
 c7lWEmuY8LsX8/dhqSiFFE20Wq9htXVfFg3jULXUtQLOq5Ctz94XyWDBXwaLR9Ay+HJx
 tga4fgKXtyBSLiIs+IcLUd/9xEcRZAYewm1EwNgoq6Az/eylpAnBecDIPpHLxHcX6OgE
 +nbg==
X-Gm-Message-State: AOJu0YxrpDuwM0KYMjQpFlKWdPKEFa07jK+iI4qVkRCQ9SrhoOnW7kUH
 /zna7VMFWFHjqeq91hzJDcJbVlVmmoWrDB6WZQY=
X-Google-Smtp-Source: AGHT+IEES/Rzsyvr1JvufABrAQWEAlPgt7MuBwIREScZLrLGFwNRoIXbaWrIdhd46oBepXht/zkQv0lQ0dAVqCGxlr0=
X-Received: by 2002:a17:906:150:b0:9a1:d79a:418e with SMTP id
 16-20020a170906015000b009a1d79a418emr6028363ejh.40.1692973829204; Fri, 25 Aug
 2023 07:30:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230825122435.316272-1-vignesh.raman@collabora.com>
 <20230825122435.316272-3-vignesh.raman@collabora.com>
 <87pm3b2pkz.fsf@intel.com>
In-Reply-To: <87pm3b2pkz.fsf@intel.com>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 25 Aug 2023 07:30:17 -0700
Message-ID: <CAF6AEGs4p0xXJjsNug45CFiP0n-5h7wpdy22YBryjrnWFROESg@mail.gmail.com>
Subject: Re: [PATCH 2/6] drm: ci: Force db410c to host mode
To: Jani Nikula <jani.nikula@linux.intel.com>
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
Cc: emma@anholt.net, linux-doc@vger.kernel.org,
 Vignesh Raman <vignesh.raman@collabora.com>, dri-devel@lists.freedesktop.org,
 jbrunet@baylibre.com, robdclark@google.com, corbet@lwn.net,
 khilman@baylibre.com, sergi.blanch.torne@collabora.com,
 david.heidelberg@collabora.com, linux-rockchip@lists.infradead.org,
 daniels@collabora.com, martin.blumenstingl@googlemail.com, mripard@kernel.org,
 helen.koike@collabora.com, anholt@google.com,
 linux-mediatek@lists.infradead.org, robclark@freedesktop.org,
 matthias.bgg@gmail.com, linux-amlogic@lists.infradead.org,
 gustavo.padovan@collabora.com, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com, neil.armstrong@linaro.org,
 guilherme.gallo@collabora.com, linux-kernel@vger.kernel.org,
 tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 25, 2023 at 6:56=E2=80=AFAM Jani Nikula <jani.nikula@linux.inte=
l.com> wrote:
>
> On Fri, 25 Aug 2023, Vignesh Raman <vignesh.raman@collabora.com> wrote:
> > Force db410c to host mode to fix network issue which results in failure
> > to mount root fs via NFS.
> > See https://gitlab.freedesktop.org/gfx-ci/linux/-/commit/cb72a629b8c15c=
80a54dda510743cefd1c4b65b8
> >
> > Since this fix is not sent upstream, add it to build.sh script
> > before building the kernel and dts. Better approach would be
> > to use devicetree overlays.
> >
> > Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> > ---
> >  drivers/gpu/drm/ci/build.sh | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/ci/build.sh b/drivers/gpu/drm/ci/build.sh
> > index 7b014287a041..c39834bd6bd7 100644
> > --- a/drivers/gpu/drm/ci/build.sh
> > +++ b/drivers/gpu/drm/ci/build.sh
> > @@ -70,6 +70,10 @@ if [ -z "$CI_MERGE_REQUEST_PROJECT_PATH" ]; then
> >      fi
> >  fi
> >
> > +# Force db410c to host mode to fix network issue which results in fail=
ure to mount root fs via NFS.
> > +# See https://gitlab.freedesktop.org/gfx-ci/linux/-/commit/cb72a629b8c=
15c80a54dda510743cefd1c4b65b8
> > +sed -i '/&usb {/,/status =3D "okay";/s/status =3D "okay";/&\n\tdr_mode=
 =3D "host";/' arch/arm64/boot/dts/qcom/apq8016-sbc.dts
> > +
>
> It seems like a really bad idea to me to have the CI build modify the
> source tree before building.
>
> The kernel being built will have a dirty git repo, and the localversion
> will have -dirty in it.
>
> I think it would be better to do out-of-tree builds and assume the
> source is read-only.

We have the ${target_branch}-external-fixes mechanism to merge
necessary changes before building the kernel for CI.  Which is
necessary for a couple of reasons:

1) patches like this which aren't appropriate upstream but necessary
due to the CI lab setup
2) target branch if often based on an early -rc, and it isn't unheard
of to need some fix for some board or another which isn't appropriate
to land via drm-next

We should use the -external-fixes branch mechanism for patches like this on=
e.

BR,
-R

> >  for opt in $ENABLE_KCONFIGS; do
> >    echo CONFIG_$opt=3Dy >> drivers/gpu/drm/ci/${KERNEL_ARCH}.config
> >  done
>
> Ditto for the config changes in the context here. Those are files in
> git, don't change them.
>
> Shouldn't this use something like 'scripts/config --enable' or
> 'scripts/config --disable' on the .config file to be used for building
> instead?
>
>
> BR,
> Jani.
>
>
> --
> Jani Nikula, Intel Open Source Graphics Center
