Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 675917FA594
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 17:04:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 697ED10E306;
	Mon, 27 Nov 2023 16:04:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com
 [IPv6:2607:f8b0:4864:20::1129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E553B10E306
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 16:04:06 +0000 (UTC)
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-5cc5988f85eso44455427b3.2
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 08:04:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701101046; x=1701705846; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C7kfcTFnc1EIcTrfufgAiSWZaBI8ZkU3ldDxmrr3WA8=;
 b=OE/f81dAXnv8yJBbN+Mvu1g/vrqxB85WN3yEJ9n7Bfc53i01JE+Fwi4kmzahf09oIt
 lcvmXlRz8vNVcn1xkay/UCW1j8S2YehcOTaZSfkaGIBMH4keqd7dmxHS1Oe4MQFzFOgp
 AA53sAdWKYzAiRKavUCgGTuHCLM3IVraPL4eBHfNRgGZ121C7W0SlNPzB1EEVXksZadS
 4H+HGaNILoh5JBMsObm8/CJxV/G/fZcn44cr03QznK/MSDKkG2lG1Kpou+5FdzISDaY+
 cTtKRogHycGxOwPerS8OAnEoX6M58fiCP4YwGFCUe1043MucmO7ypOgI+bba7bgtfoiO
 ygeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701101046; x=1701705846;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C7kfcTFnc1EIcTrfufgAiSWZaBI8ZkU3ldDxmrr3WA8=;
 b=AHYzrEDOqYF4YlIR39/pyM/rgDaw3rc5xL6Mx5job2tvXwmXduRiOJVNrJWq+97uzn
 hvqHzTvYODMU9J+Z1DEJF13cNKJKJllG7IJUJla0Xe4xaj1oMROaU1rnGnCoDZ+iuXbo
 OzMrzxeX9WZZ/lbMORiF7efG8AtlquET9mUkZfgErP7+iDxbQPCl9snxNzzhfHNBtNB6
 K33jQWZrhS4vS793FceBW3X/PK21R1du5n20BQVLny9FlFutr18dsmYibMMrbplBQ2Vp
 B+vIZlB2w03UjXDRg6frY0T+uJcOPhi3QyDLLZ1ps6b2KyrjcrgRI2qSy4ou+s7HdZmJ
 8rbQ==
X-Gm-Message-State: AOJu0YzHkIpO/bD5Sw332nndmr/HXKFHxIP6yt/3u+xl2bZE0ZSmck22
 QOzCa0v6ArL92h5vHmwbGpQtS4OHJ4VGecDRpMJt5A==
X-Google-Smtp-Source: AGHT+IH34yJLIkZJKXuCRnBcCqV+kUWFq5pvwWNuBFGfgw8Ppgvz1en2RopG7eerUDrKPKL790hzAPbQaxQoDiQvtbQ=
X-Received: by 2002:a25:ea45:0:b0:db3:9994:119b with SMTP id
 o5-20020a25ea45000000b00db39994119bmr10785589ybe.50.1701101046011; Mon, 27
 Nov 2023 08:04:06 -0800 (PST)
MIME-Version: 1.0
References: <20231127051414.3783108-1-victor.liu@nxp.com>
In-Reply-To: <20231127051414.3783108-1-victor.liu@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 27 Nov 2023 17:03:53 +0100
Message-ID: <CACRpkdZAtxh5muhbPKvmUQGtQogs3UhGxNZqnSGWoWQNUL7=9g@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] drm/bridge: panel: Check device dependency before
 managing device link
To: Liu Ying <victor.liu@nxp.com>
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
Cc: mripard@kernel.org, sfr@canb.auug.org.au, ulf.hansson@linaro.org,
 jernej.skrabec@gmail.com, rfoss@kernel.org, tzimmermann@suse.de,
 rafael@kernel.org, gregkh@linuxfoundation.org, neil.armstrong@linaro.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, jonas@kwiboo.se,
 linux-next@vger.kernel.org, Laurent.pinchart@ideasonboard.com,
 andrzej.hajda@intel.com, angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 27, 2023 at 6:10=E2=80=AFAM Liu Ying <victor.liu@nxp.com> wrote=
:

> This series aims to check panel device dependency upon DRM device before
> managing device link between them.  It fixes eariler patches in v6.7-rc1
> which tried to manage the link.  Without this series, the link fails to
> be added for dependent panel devices and hence relevant panel bridges
> fail to be attached.  A real broken panel is "novatek,nt35510" defined
> in arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dts as reported by
> Linus Walleij.
>
> Patch 1 exports device_is_dependent() to modules as needed by patch 2.
> Patch 2 checks device dependency before managing the device link.
>
> Note that patch 2 is already in drm-misc/drm-misc-fixes and
> drm-misc/for-linux-next-fixes.  Patch 1 needs to be reviewed and picked u=
p.
>
> v2:
> * Introduce patch 1 to export device_is_dependent() to modules as needed =
by
>   patch 2.
>
> Liu Ying (2):
>   driver core: Export device_is_dependent() to modules
>   drm/bridge: panel: Check device dependency before managing device link

I just applied patch 1 directly to the drm-misc-fixes so we don't have to
revert and then re-apply patches, because that is a bigger evil. (We can't
rebase these branches...)

Yours,
Linus Walleij
