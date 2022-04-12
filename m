Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF8074FDDA7
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 13:31:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4663C10E214;
	Tue, 12 Apr 2022 11:31:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7198F10E214
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 11:30:59 +0000 (UTC)
Received: by mail-yb1-xb2a.google.com with SMTP id x200so8821202ybe.13
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 04:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=MNFVKn/6sR+qJy1xjZwLhojWhMEBJZkIZm88XzONGOA=;
 b=SUoVFIXk4pDqXz8Tq1K1xwH2XlZWTHANCuN+6KitrpI3nIKG2d0pu7xkhSg3nBrfI1
 xVAsTmxL6vqGZiOkavmCI6X3wsKyuvOWGmaVW/5JeMpyFInytcQCF0+0d3TOJ8s8cWs+
 DmhJpIgUZaoR1eoFXp+Wx000g1S4y1ogcfs+LUkGiRk/HbbCK6L7bNdGtnaToRIBcqnv
 77YlMyPmmeMDT8v5adrU7oLY65D6kKA2h4gXNcN+2tRNM9EBaCux4UH8aRvls9E4W1Fp
 vNd63tq9B6dDowT6+YHjNQ5t+wBQHDRsbRxaQrNy4PZC4Rca7YV8JlIqyFVgjpL3/c4+
 ILUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=MNFVKn/6sR+qJy1xjZwLhojWhMEBJZkIZm88XzONGOA=;
 b=n2q7QjmImmWZsveDN6jW5LghPFZMGp4yTOZkfz1FlUjCUgWs3C6cZn0ximAHDhBNCg
 jze9Z2YYnaAa8oy+F3dzOKdsNdZdSMr4U6IOoTLsKJ0O4IKjuwocVzcsSVBAHYz9tfuf
 Cw4n6Z5EtsPuznT4nDHM9EE1jva7kTeocVo9p7k5pwBRCcrrN+xrdQ7EjyV3kyVfKn/C
 AwMmuGMmZAzEnl0DSfDriP9cxu8AhsrrHWZ/HsjIHIy83beH6ykPWQ1u8WayBSMJhGc9
 HoxFAZ5RpkIPSPoEqO4ZDs5IMkXbnh82nHt9eTQWaZNlxe7moMR0DUUVE0hOcxi/16h+
 bKQg==
X-Gm-Message-State: AOAM5330yKEJevb7mZPbsv5enCIKPszCfRGkkQP4WTtoz58ZkxpMhcvL
 ZtoumPZHnJlGbTgO3L2Tg03ZvWwIoK/bB5Qog9/64A==
X-Google-Smtp-Source: ABdhPJzaCS5ELmQS0Du4Km9AA/DbhyZFWNBRY9Z4RZEpdJfWE7QMeMYVpX+cQLO72zcuzJ6OCR7NHEZH7VJR/v4kpAU=
X-Received: by 2002:a25:b7c8:0:b0:633:5650:781e with SMTP id
 u8-20020a25b7c8000000b006335650781emr25046546ybj.466.1649763058611; Tue, 12
 Apr 2022 04:30:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220328151116.2034635-1-s.hauer@pengutronix.de>
 <FB201567-AE5A-4242-82F1-7C55D8F111EA@gmail.com>
 <20220401125205.GL4012@pengutronix.de>
 <5420D26D-34FD-4637-B602-F6271E38BB8D@gmail.com>
 <BA4C591F-D115-43D2-BF59-A75B29889E50@gmail.com>
 <20220408080748.GA2387@pengutronix.de> <20220408120021.GO4012@pengutronix.de>
 <B3E76A7A-9B62-4E6F-9472-00B6298689C5@gmail.com>
 <20220411090800.GR4012@pengutronix.de>
 <5929E7A7-776E-4BCB-92C8-A1CE05774FE3@gmail.com>
 <20220412075034.GS4012@pengutronix.de>
 <e2ef484b60fe9c5fc077240a26bd18275974dc4a.camel@pengutronix.de>
 <EF0F8E87-2618-4E5E-807D-259FEEC0FB24@gmail.com>
In-Reply-To: <EF0F8E87-2618-4E5E-807D-259FEEC0FB24@gmail.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Tue, 12 Apr 2022 12:30:46 +0100
Message-ID: <CAPj87rNatQ9KjDSnYQTh4+FOUcPTerbzH3m8AuAF_BPbM1xxGg@mail.gmail.com>
Subject: Re: [PATCH v9 00/23] drm/rockchip: RK356x VOP2 support
To: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, kernel@pengutronix.de,
 Sascha Hauer <s.hauer@pengutronix.de>, Sandy Huang <hjc@rock-chips.com>,
 dri-devel@lists.freedesktop.org,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Lucas Stach <lst@pengutronix.de>,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Peter Geis <pgwipeout@gmail.com>, Andy Yan <andy.yan@rock-chips.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 12 Apr 2022 at 11:14, Piotr Oniszczuk <piotr.oniszczuk@gmail.com> w=
rote:
> > Wiadomo=C5=9B=C4=87 napisana przez Lucas Stach <l.stach@pengutronix.de>=
 w dniu 12.04.2022, o godz. 10:10:
> > 1. The application feeds a wrong modifier list to the GBM
> > implementation, as it may have queried another plane in the assumption
> > that supported modifiers are uniform across all planes.
>
> This will be cardinal design error.
> (keeping in mind we have multiple producers (GPU/video decoder) and multi=
ple consumers (base & overlay DRM planes)
>
>
> > 2. The GBM implementation (Panfrost) actually allocates a surface
> > instead of failing the allocation, even if it does not support any
> > combination of the provided format and modifier list.
>
> Testing Sacha patch (see today's email from Sascha) i'm getting
>
> Qt: EGL Error : Could not create the egl surface: error =3D 0x3009
>
> i'm reading this as: Qt tries allocate EGL surface and EGL returns error.
> or i'm wrong?

Correct, that's EGL_BAD_MATCH. There are very few ways that can
happen; by far the most likely is that Qt has chosen an EGLConfig
which does not correctly correspond to the format. (If it was an
impossible format/modifier combination, then this would be already
caught when allocating the gbm_surface.)

Either way, it seems quite clear that the VOP2 driver is totally fine
here, and that you have a Qt (likely) or Mesa (tbh less likely) issue
to debug to get the app working.

Cheers,
Daniel
