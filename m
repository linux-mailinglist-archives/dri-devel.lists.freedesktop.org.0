Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF11766F9B
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 16:37:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0686F10E709;
	Fri, 28 Jul 2023 14:37:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8743F10E70C
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 14:37:45 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-4fb7dc16ff0so3855785e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 07:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690555064; x=1691159864;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OoBzPwja36fkGB2m2EIbRi55n5XYr4VNaYPCpY7zeKs=;
 b=mH17P6vfTfQdoT14pC3A4FfDJ2VBrkghAG4nBuM7YP9r7FzJpwrAFXB5UMTvtqhF40
 XHnTn9QeyjMKGzDXjQG0c4Tthbnl8t35Fbo4n0fUp5eVbJ8S11AC+mfrG/aPvVGubjpv
 jcunb7H8In7x+NbtE3ATP0FXQh2giufFWcsNZQpuzRCASB4ZZzp/+9+VsRFyxq7TerlQ
 B+DbL/+fE4gdv7uvDxokIcRTP7edsXWY1QHw87YUGF1qk1FfE0wcZmB6VBIGvlKbqDz5
 HQ1cwr6QXDanyk/pTVPTws4QTPAuqgF5F7qbF5rszCMz9nMXITHPXWMZeujKdSciAojn
 hIUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690555064; x=1691159864;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OoBzPwja36fkGB2m2EIbRi55n5XYr4VNaYPCpY7zeKs=;
 b=du51AyMeQQ32CVgeZkv0IjnAhMdHomWUdmhIjF/1ji762PCeluid2LhH9F+P9ZL1sk
 7j2U2zEfWXUEYtwPwfcqNrE7yqrlutPAouTWh+VXdhvBKEMn2/MNvSI4TxDWdnJB7cQ5
 HrWESqajfUx908UcNQzWIKlQY254uUKrZBKGxbYP18GU+a6Yvv94orucl9uOMLJ81DJ3
 WiP9Ro7NjA8Og/Ct6/SUo/4kS3x1itGeuTRJWo+QCs1xx9FbhMTjH2pvoLyegR4wyQ1I
 loUYxS24/NUN6KtE7loXcEv8ZXt8J5DFvWZaD1sAJGhhCAORBI6AB+vuIpi+zrbfSxvI
 MJ8A==
X-Gm-Message-State: ABy/qLZ/0j3jAJptQTIe07dTj2l9h5efuwQ4imcZnUy/LXWKv2ZfM2qc
 SiB8n91nnCjc7IHt7PZdE+gLwKYKlFWzPhcP/Ig=
X-Google-Smtp-Source: APBJJlGUbR0qC9paIuIRHruH4iJ3Oi11S/UE+z1ge7FEfFZqlKQmVxkAQlUoMKoxelzsZCTu0j9nGxem/4l8cRw0JdU=
X-Received: by 2002:a05:6512:2083:b0:4fd:f590:1ff7 with SMTP id
 t3-20020a056512208300b004fdf5901ff7mr1806954lfr.40.1690555063602; Fri, 28 Jul
 2023 07:37:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230720152737.102382-1-helen.koike@collabora.com>
 <CAF6AEGtXL5vjp3Uup6Mk19MiY8E26-tpyXVmxXYhMd3fiadykQ@mail.gmail.com>
 <CAF6AEGsxLg4og1EkCdno6P8x31KK=rJfmerJa8uMeNR-n7RVRg@mail.gmail.com>
 <CAPj87rPNyJ=mX1Um6yaN_jTV2gH5MhMxr3mnSb7=nB7NEOf2Ag@mail.gmail.com>
In-Reply-To: <CAPj87rPNyJ=mX1Um6yaN_jTV2gH5MhMxr3mnSb7=nB7NEOf2Ag@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 28 Jul 2023 07:37:31 -0700
Message-ID: <CAF6AEGtan-bQ7syKAwOKDY=044aKu26SLPQ0j1ieLqXNyQQS3g@mail.gmail.com>
Subject: Re: [PATCH v10] drm: Add initial ci/ subdirectory
To: Daniel Stone <daniel@fooishbar.org>
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
Cc: emma@anholt.net, linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 daniels@collabora.com, robdclark@google.com, corbet@lwn.net,
 khilman@baylibre.com, sergi.blanch.torne@collabora.com,
 linux-rockchip@lists.infradead.org, jbrunet@baylibre.com,
 david.heidelberg@collabora.com, martin.blumenstingl@googlemail.com,
 robclark@freedesktop.org, Helen Koike <helen.koike@collabora.com>,
 anholt@google.com, linux-mediatek@lists.infradead.org, mripard@kernel.org,
 matthias.bgg@gmail.com, linux-amlogic@lists.infradead.org,
 gustavo.padovan@collabora.com, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com, neil.armstrong@linaro.org,
 guilherme.gallo@collabora.com, linux-kernel@vger.kernel.org,
 tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 27, 2023 at 10:26=E2=80=AFPM Daniel Stone <daniel@fooishbar.org=
> wrote:
>
> On Thu, 27 Jul 2023 at 22:47, Rob Clark <robdclark@gmail.com> wrote:
> > > I did run into a bit of a chicken vs. egg problem with testing the "i=
n
> > > tree" version (compared to earlier versions which kept most of the ym=
l
> > > and scripts in a separate tree), is that it actually requires this
> > > commit to exist in the branch you want to run CI on.  My earlier
> > > workaround of pulling the drm/ci commit in via
> > > ${branchname}-external-fixes no longer works.
> >
> > After unwinding some more gitlab repo settings that were for the
> > previous out-of-tree yml setup, I have this working.
> >
> > Tested-by: Rob Clark <robdclark@gmail.com>
> > Acked-by: Rob Clark <robdclark@gmail.com>
>
> And it's also:
> Acked-by: Daniel Stone <daniels@collabora.com>
>
> It's been back and forth a few times by now and reviewed pretty
> heavily by all the people who are across the CI details. I think the
> next step is to answer all the workflow questions by actually getting
> it into trees and using it in anger. There was some discussion about
> whether this should come in from drm-misc, or the core DRM tree, or a
> completely separate pull, but I'm not sure what the conclusion was ...
> maintainers, thoughts?

I'd prefer a separate pull, so that I could merge it into msm-next as
well without having to pull in all of drm-misc

Possibly some other driver trees would like to do similar?

BR,
-R
