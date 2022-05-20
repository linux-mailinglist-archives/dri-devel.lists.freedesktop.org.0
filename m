Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A11453096F
	for <lists+dri-devel@lfdr.de>; Mon, 23 May 2022 08:25:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7E6110E714;
	Mon, 23 May 2022 06:25:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D27FC10E1A3
 for <dri-devel@lists.freedesktop.org>; Fri, 20 May 2022 10:03:09 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 ob14-20020a17090b390e00b001dff2a43f8cso1290300pjb.1
 for <dri-devel@lists.freedesktop.org>; Fri, 20 May 2022 03:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=kPDr2d9+6sr9lCyWq7WNBoRvBQxorjF1e30W8kRss44=;
 b=WtkN6qR9mLXwX5J+02dBVs103/z9HbD0uTfUEmErMVHDJhdDK5IQ6d25M9w58GTzR+
 X/VUrWaJjeKoFmbpJvWmqOWQJDiMfqZBGDgSkS5qZ29cvXRcKD+bX92ZZdvBBamlW12D
 tqUxEIkfWl8XjVS0IAoyXLqmfCvAfJZ7l3gn7FkEz+mF1919qtuUax9y3BOl8yrABq5p
 U4TJaMGM0PgDJqxNhGbleQszDn6sXJJXYsWAMnCyv68IFPtAWTbw4Y6wC8UMUMxTxcXa
 goNH8SgpC6j74ztPP8oVp05xpc8ePy875D72S+2RJIFuB385Z3Lun1avyq/tke8iVz0u
 kMUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=kPDr2d9+6sr9lCyWq7WNBoRvBQxorjF1e30W8kRss44=;
 b=0S/RIIqBiUzY2Typf9MahGyNsckR2F5ePMgjTBfZzrYlYPETEKIciJ0G2dJc45FhZr
 tEY1pqVi6g0AaiT/V59ub9bcsk2ggtAh9dUWv6nZiJHKrukPOMUGus6FxEwi+TDnv75L
 w3abwSUzOP3/HFQcR2Wl9F74sWnKBRdlMjG5mvVBADS2VWFshSDCKcmOY6G35zLOXeR3
 M9pz8Ju92wjxbzLVZQBCkXKrKc2Qf4I7bCeCsvEA67xSdcByC6T2IcR7D8XCQISkdkuA
 LlNKqsy3wUml2ES2sL82N4+7KjnYjJmB67HuUhDuzW1aYmPGOeGvOAa9lMPXaRWmdDQB
 CITg==
X-Gm-Message-State: AOAM530axh2ZxLuO8S6wchlboM8oZxrjb0rzC/bVScuyTnOITS0cLEwg
 CBY5cy3QWBHHTpmSLAKUFkgbgCvRpoTMuFLuT5w=
X-Google-Smtp-Source: ABdhPJyaUo5/8pAMO+rImvZojMftnGDKz35IDQMdVoew1yS276UO3vJMNfKLmkL7kfOMCpSbrXcEZFcNL9AE5q+Qs8M=
X-Received: by 2002:a17:90b:180f:b0:1df:cc0c:bbfd with SMTP id
 lw15-20020a17090b180f00b001dfcc0cbbfdmr9913118pjb.84.1653040989493; Fri, 20
 May 2022 03:03:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220422072841.2206452-1-s.hauer@pengutronix.de>
 <23894515.EfDdHjke4D@phil>
In-Reply-To: <23894515.EfDdHjke4D@phil>
From: Maya Matuszczyk <maccraft123mc@gmail.com>
Date: Fri, 20 May 2022 12:02:33 +0200
Message-ID: <CAO_Mup+SCgeK9rBjYqnnOpJWUNXyJdXV9pjWXqi571sznS9-LA@mail.gmail.com>
Subject: Re: [PATCH v11 00/24] drm/rockchip: RK356x VOP2 support
To: Heiko Stuebner <heiko@sntech.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 23 May 2022 06:25:06 +0000
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
Cc: devicetree@vger.kernel.org,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Peter Geis <pgwipeout@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de,
 Andy Yan <andy.yan@rock-chips.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

wt., 17 maj 2022 o 20:28 Heiko Stuebner <heiko@sntech.de> napisa=C5=82(a):
>
> Am Freitag, 22. April 2022, 09:28:17 CEST schrieb Sascha Hauer:
> > It's v11 time. There's only one small change to v10. Discussion seems t=
o
> > have settled now. Is there anything left that prevents the series from
> > being merged? I'd really like to have it in during the next merge
> > window.
> >
> > This series still depends on:
> > drm/rockchip: Refactor IOMMU initialisation (https://lists.freedesktop.=
org/archives/dri-devel/2022-April/349548.html)
> > arm64: dts: rockchip: add basic dts for the radxa rock3 model a
> >
> > Sascha
>
> I've now picked up everything except the hdmi-rate stuff in some way.
> The driver changes will go into 5.19 and the DT-changes into 5.20.
>
> I'll now move the series out of my focus and would expect further
> hdmi rate voodoo to start a new series :-) .
>
> Thanks to all involved for working on this.
> Heiko

What do I need besides this patch series, mentioned before IOMMU refactor,
and DTS changes for MIPI-DSI support on RK356x?
I'm working on mainline kernel support for a a RK3566 board with
a DSI display.

Best Regards,
Maya Matuszczyk
