Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C0E788BE2
	for <lists+dri-devel@lfdr.de>; Fri, 25 Aug 2023 16:41:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58E5010E6B1;
	Fri, 25 Aug 2023 14:41:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A0E010E6B1
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Aug 2023 14:41:34 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-99c4923195dso121999966b.2
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Aug 2023 07:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692974492; x=1693579292;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t/Nyi2UtJHS2L8Ejnis0sIFHEs44gVXKzFV9je3/KrQ=;
 b=m5YpFddniJdsweLpDiBMuTrwp/DFZA7ALBdWjy/ou8KTRnc7m1IFRI+d6jSHq0CEAM
 QhFVj47cdxI+vCV4+9qbuh3aoDvvBm2JOgyx8jY9qcLLmmtrJkkqfq+aSlE7T8wv+4iP
 uhe7HLkAu15rpIFabmISxrkvwM5L47q3+A/GaN/Zxe1GeBVJesIitTuCJOHfqnTe+pnm
 nP2UxSHrwwfBZ0P6xfMo5V+2hntqsaNAGeYTsIgWO5h8S9W/2ESYbh+GDXW9yUOO5yFM
 LLOejgrH7OPsyUOcMRfUViC3pludGiVGC9VygBQV532P5MSingkpNeSPgkrDQZ3GAMq9
 vPvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692974492; x=1693579292;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=t/Nyi2UtJHS2L8Ejnis0sIFHEs44gVXKzFV9je3/KrQ=;
 b=W7wlZDkA4ULd0MsWuDBkCuJoEZAYAKQL2Nebdp4dKxlkd1v6pPPdIrb0Lv5eohiDIQ
 vyOx1PPJpVrxsWl7itYzg8bMYyv5Fsdyo7QWoZTiIbYYb7b2rBygbW3cnMebln4XIlV4
 p/dSOYEA9VYDslmgBP+wtaHuDc/tRL5cdBVkN5dc5ux1Q3A1IjWW3fH8f4D/+SlX+66+
 KG06sAi2W9w9bjvn3dhRgAU2Lgiam2LgFTKZBPJnh4sR1s4bI9pzSJfuMs5M/4D4zohh
 VTEDYFTdaZm5xo1UPuveTppGPXAxKoAwIWXCa674AXW6EkUXax9fviC3+MokXtGRDATz
 yzTw==
X-Gm-Message-State: AOJu0YzRpvSTATvWLrrQ77m7fi9R5AtdcjE+H9WXHxUEFxyXr3dJ+a3V
 b1sHG1o75FDY2DXimnw6mjuMs/UrqpnX0FLY0EA=
X-Google-Smtp-Source: AGHT+IFTa6AUo8YGThRRtKjSHjpALqvs56DSmtO34KA77It9bSY9eo+tp2QfZnFxYx9KevR2d+AoL9gNtc1jHFksSmA=
X-Received: by 2002:a17:906:cc16:b0:9a1:870e:cc9d with SMTP id
 ml22-20020a170906cc1600b009a1870ecc9dmr14271003ejb.18.1692974492214; Fri, 25
 Aug 2023 07:41:32 -0700 (PDT)
MIME-Version: 1.0
References: <CAF6AEGs4p0xXJjsNug45CFiP0n-5h7wpdy22YBryjrnWFROESg@mail.gmail.com>
 <29c7-64e8bc00-3-6afffd8@162524261>
In-Reply-To: <29c7-64e8bc00-3-6afffd8@162524261>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 25 Aug 2023 07:41:19 -0700
Message-ID: <CAF6AEGsdR4XMQ73mwNEE-fntPFLbQrxmzdoWchjReoVXKexdVw@mail.gmail.com>
Subject: Re: [PATCH 2/6] drm: ci: Force db410c to host mode
To: Helen Mae Koike Fornazier <helen.koike@collabora.com>
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
 anholt@google.com, linux-mediatek@lists.infradead.org,
 robclark@freedesktop.org, matthias.bgg@gmail.com,
 linux-amlogic@lists.infradead.org, gustavo.padovan@collabora.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com,
 neil.armstrong@linaro.org, guilherme.gallo@collabora.com,
 linux-kernel@vger.kernel.org, tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 25, 2023 at 7:34=E2=80=AFAM Helen Mae Koike Fornazier
<helen.koike@collabora.com> wrote:
>
> On Friday, August 25, 2023 11:30 -03, Rob Clark <robdclark@gmail.com> wro=
te:
>
> > On Fri, Aug 25, 2023 at 6:56=E2=80=AFAM Jani Nikula <jani.nikula@linux.=
intel.com> wrote:
> > >
> > > On Fri, 25 Aug 2023, Vignesh Raman <vignesh.raman@collabora.com> wrot=
e:
> > > > Force db410c to host mode to fix network issue which results in fai=
lure
> > > > to mount root fs via NFS.
> > > > See https://gitlab.freedesktop.org/gfx-ci/linux/-/commit/cb72a629b8=
c15c80a54dda510743cefd1c4b65b8
> > > >
> > > > Since this fix is not sent upstream, add it to build.sh script
> > > > before building the kernel and dts. Better approach would be
> > > > to use devicetree overlays.
> > > >
> > > > Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> > > > ---
> > > >  drivers/gpu/drm/ci/build.sh | 4 ++++
> > > >  1 file changed, 4 insertions(+)
> > > >
> > > > diff --git a/drivers/gpu/drm/ci/build.sh b/drivers/gpu/drm/ci/build=
.sh
> > > > index 7b014287a041..c39834bd6bd7 100644
> > > > --- a/drivers/gpu/drm/ci/build.sh
> > > > +++ b/drivers/gpu/drm/ci/build.sh
> > > > @@ -70,6 +70,10 @@ if [ -z "$CI_MERGE_REQUEST_PROJECT_PATH" ]; then
> > > >      fi
> > > >  fi
> > > >
> > > > +# Force db410c to host mode to fix network issue which results in =
failure to mount root fs via NFS.
> > > > +# See https://gitlab.freedesktop.org/gfx-ci/linux/-/commit/cb72a62=
9b8c15c80a54dda510743cefd1c4b65b8
> > > > +sed -i '/&usb {/,/status =3D "okay";/s/status =3D "okay";/&\n\tdr_=
mode =3D "host";/' arch/arm64/boot/dts/qcom/apq8016-sbc.dts
> > > > +
> > >
> > > It seems like a really bad idea to me to have the CI build modify the
> > > source tree before building.
> > >
> > > The kernel being built will have a dirty git repo, and the localversi=
on
> > > will have -dirty in it.
> > >
> > > I think it would be better to do out-of-tree builds and assume the
> > > source is read-only.
> >
> > We have the ${target_branch}-external-fixes mechanism to merge
> > necessary changes before building the kernel for CI.  Which is
> > necessary for a couple of reasons:
>
> Should we create an official topic/drm-ci-external-fixes branch ?

Hmm, maybe.. I guess as we expand this to more driver trees, and want
to be able to re-run CI in the drm tree after merges to
drm-next/drm-fixes, we maybe want to have central
drm-next-external-fixes and drm-fixes-external-fixes.  I guess we can
keep those based on drm-next and drm-fixes?  And if there would be
conflicts because, say, ${driver}-next is behind drm-next, then
${driver}-next could be rebased on drm-next?

BR,
-R

> Regards,
> Helen
>
> >
> > 1) patches like this which aren't appropriate upstream but necessary
> > due to the CI lab setup
> > 2) target branch if often based on an early -rc, and it isn't unheard
> > of to need some fix for some board or another which isn't appropriate
> > to land via drm-next
> >
> > We should use the -external-fixes branch mechanism for patches like thi=
s one.
> >
> > BR,
> > -R
> >
> > > >  for opt in $ENABLE_KCONFIGS; do
> > > >    echo CONFIG_$opt=3Dy >> drivers/gpu/drm/ci/${KERNEL_ARCH}.config
> > > >  done
> > >
> > > Ditto for the config changes in the context here. Those are files in
> > > git, don't change them.
> > >
> > > Shouldn't this use something like 'scripts/config --enable' or
> > > 'scripts/config --disable' on the .config file to be used for buildin=
g
> > > instead?
> > >
> > >
> > > BR,
> > > Jani.
> > >
> > >
> > > --
> > > Jani Nikula, Intel Open Source Graphics Center
>
