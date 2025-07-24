Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97BF3B10727
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 11:59:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52FA989209;
	Thu, 24 Jul 2025 09:58:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="T+dVEMlJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4704889209
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 09:58:58 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-55a33eecc35so797789e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 02:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1753351137; x=1753955937;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3lDH5ARB26e8DbHF4MxQq93Rk0WGstJeVZQEGstfRkg=;
 b=T+dVEMlJ+3WsDixeHU8AuRnchg1KoHU8SD/4g6odznMMSrFh2mboTSYyfW2/cOg81t
 +L+JKsft1S18k1jhd/dXJfq0jw46frIASTnDyQWTxecGjwhv2zfRSxd+Q9oF2dMOwXi/
 JV75VB/INgs3bi4VtMz+noN5/DXfQZ6dNJNiE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753351137; x=1753955937;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3lDH5ARB26e8DbHF4MxQq93Rk0WGstJeVZQEGstfRkg=;
 b=d9InXFphpCEzVTF6jz315EadfAk0hE0xMk7YBBezina2B3epuFXce8iDFlqUyPeXdW
 4z1ws8eN221te3EbnDrXNgb0IHG5HpGEfj1aZc3FscHivr6xYj3GSdnuYIQx230Z9KoG
 4Ni/F+rNeN3nVFHqHMWqE1mRASsvTsn5RLfMdNwhETPOhqTZmlHWsjFZl0UQQKbo2/B4
 g2dzrgW4CYu33Qkvmt6LfVoWHSLo+LSGO7qGmHAfHkPm60dmqXv6UY7jobLwJGWodp4e
 SfXNqOEY3m+NH4UNINDP9yLUJ0Td8rPTHntQ/eU+wOSUSwCWUDjChd5fcfnDOtMvQbyf
 auMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXhpItPR/+hUYxL7T9z5mc27v9kUdkVxP6StxjY48yD0fOywPz92Ky3ZmNqMlzeybaGV/WOPDjrKBo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzria1t0jCTtvul/9OBI+730WExjOSxWO4shGJoGJUWkDbnIp/T
 pLcOUi6TKmWRqatrk1qQ8U0FJ4wx6VQHXrQDuQNQjiY+UQ5+iPBikp2siulTI30lz0ga4IO12I1
 nWcQbd+qj4a24SXz/sGi2AE6kupF6brMgJLnQwexs
X-Gm-Gg: ASbGncuRY5Taj+YMshLC4xXagP+HrOjwUoLCvxPLrgdnQuxdnKySbQV3KiSDHySQ3Za
 FPcTkKATsozOZEMhViDiXJD2Lg/c5CDX8A2ebCr+vfROqsmjKrP5R3gUcVf8/CNDNadkT+TmvBY
 lKTXB0i27uPwImqYAaYy+kUfAW64aIbzACWu8jObQo+8BJ+suOhh8RhyWYx6/eXtM6H7RH4XVXR
 nEcjNWLIoj9HRxs5ML98NUIQGOjEBBXV4A=
X-Google-Smtp-Source: AGHT+IFbWpnNaQRMkmMGCWJwKWLSFPCgKrpUVJhkWhmCg8wuzEAglTGmiTQG4cugbeqoeX5uFAZWT86WnfNSaUywLGk=
X-Received: by 2002:a05:6512:60d:20b0:554:f7ec:3b23 with SMTP id
 2adb3069b0e04-55a51359f3dmr1559012e87.15.1753351136563; Thu, 24 Jul 2025
 02:58:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
 <20250724083914.61351-37-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250724083914.61351-37-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 24 Jul 2025 17:58:45 +0800
X-Gm-Features: Ac12FXwhroXh9igzrCvp17h0_fa0JxIrUDzrCtprSHzHickYMU-wGcIvqxYBtBo
Message-ID: <CAGXv+5G3kbSzs99mogy57mh+LUdi_87zBmFH8GQFWvROhLFbDg@mail.gmail.com>
Subject: Re: [PATCH 36/38] arm64: dts: mediatek: mt8195-cherry: Add missing
 regulators to rt5682
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, robh@kernel.org, 
 herbert@gondor.apana.org.au, davem@davemloft.net, krzk+dt@kernel.org, 
 conor+dt@kernel.org, chunkuang.hu@kernel.org, p.zabel@pengutronix.de, 
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, jassisinghbrar@gmail.com, 
 mchehab@kernel.org, matthias.bgg@gmail.com, chunfeng.yun@mediatek.com, 
 vkoul@kernel.org, kishon@kernel.org, sean.wang@kernel.org, 
 linus.walleij@linaro.org, lgirdwood@gmail.com, broonie@kernel.org, 
 andersson@kernel.org, mathieu.poirier@linaro.org, daniel.lezcano@linaro.org, 
 tglx@linutronix.de, atenart@kernel.org, jitao.shi@mediatek.com, 
 ck.hu@mediatek.com, houlong.wei@mediatek.com, 
 kyrie.wu@mediatek.corp-partner.google.com, andy.teng@mediatek.com, 
 tinghan.shen@mediatek.com, jiaxin.yu@mediatek.com, shane.chien@mediatek.com, 
 olivia.wen@mediatek.com, granquet@baylibre.com, eugen.hristev@linaro.org, 
 arnd@arndb.de, sam.shih@mediatek.com, jieyy.yang@mediatek.com, 
 frank-w@public-files.de, mwalle@kernel.org, fparent@baylibre.com, 
 linux-crypto@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-phy@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-remoteproc@vger.kernel.org, linux-sound@vger.kernel.org
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

On Thu, Jul 24, 2025 at 4:41=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Add the missing DBVDD and LDO1-IN power supplies to the codec
> node as both RT5682i and RT5682s require those.
>
> This commit only fixes a dtbs_check warning but doesn't produce
> any functional changes because the VIO18 LDO is already powered
> on because it's assigned as AVDD supply anyway.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Confirmed this matches the schematic.

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
