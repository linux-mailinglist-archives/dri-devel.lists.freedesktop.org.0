Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78874589A29
	for <lists+dri-devel@lfdr.de>; Thu,  4 Aug 2022 11:53:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8731F938A4;
	Thu,  4 Aug 2022 09:53:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D583893884
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Aug 2022 09:53:34 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id 17so18951172pfy.0
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Aug 2022 02:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc;
 bh=Yj4LnoCipKdQooHDqQkSzfPq9k+SbXM64sol04d/ofU=;
 b=qVUuazv80uczwDUpa1W45XFLKQkv6E85jaluDS0qPCqx5UqLWXVRj7NNS3iB1u5yMk
 BpAyrdAWbjN4xan/ozEhpBngVBm4vusnJrSXS6B5BtALu4Q7w0WkatMFosToCwAp0pxw
 peyWEmojG15dUtIHplxLrARzYTKP87+hpzEs+qJ1Skx6IUC8ArRBWfpqh5foE/L0KuT3
 5dl0vT47WvE/YFBfLMbib+8Ia4pPLthO02aty10gTq/7cMx0IUzGT+JIGnvuHvmlqhSG
 +z4BOs0ydQYyC+O9uk363r+pOvEqCbU9PsjpybnRv4n2q2RjbjTJIV3fBXw17xudaCYj
 TyKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=Yj4LnoCipKdQooHDqQkSzfPq9k+SbXM64sol04d/ofU=;
 b=daX6wYtHh/xAIBiZi9By+/IqEVcmIFmDYOKjf4uFolYUqtuU/T5c72xEfnOuxXt+QD
 5E7MpWgaEoprGt8eTr8W5PokbpZtob1X8ufPh1aW2/7FlpWAvFJKQ2DKGawZPUvT6M68
 gUO/LnNMo6j+36TcuxciNBx6XYEJ2N0j6Qb47K5feaI5lWfLiVi2aOlbpiZLcN4HXtyr
 4A2TaVdf8BnjevXXXNNR833S49a/7OobbLRPHNUrqpTUzi4ZPmuWdDIYHbHFmDMNXDVs
 3KLngQUSouX7Yy1gCDPYZplrPF/67KEVqrPeDLjxeaxjovNL+WaqxRGEdL7KtQaw5QZn
 pkMA==
X-Gm-Message-State: ACgBeo2Gvs1V2TpJaIndr+glkZHZ0XW9uTNxv2Ni5UX15afq53MmnOya
 ysW71EJtixBeKJF8yokTut79AvuSiL4q7o5Zmi8=
X-Google-Smtp-Source: AA6agR6qwy7xIi0BGj0KdaE31bzJZvJiNHMC9+UQ+P/hml7eIyhBore8DXxCh12e0tZqDO9pfcvT3sY1+E56wep5ub0=
X-Received: by 2002:a65:694f:0:b0:41c:cc1f:4440 with SMTP id
 w15-20020a65694f000000b0041ccc1f4440mr1024346pgq.318.1659606814308; Thu, 04
 Aug 2022 02:53:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220722102407.2205-1-peterwu.pub@gmail.com>
 <20220722102407.2205-13-peterwu.pub@gmail.com>
 <20220730214205.GK23307@duo.ucw.cz>
In-Reply-To: <20220730214205.GK23307@duo.ucw.cz>
From: Alice Chen <szunichen@gmail.com>
Date: Thu, 4 Aug 2022 17:53:22 +0800
Message-ID: <CA+hk2fbEvU2yJbowqKoozb2M0aQc9TFCaxAn++YrmEx+eWt_4w@mail.gmail.com>
Subject: Re: [PATCH v6 12/13] leds: flash: mt6370: Add MediaTek MT6370
 flashlight support
To: Pavel Machek <pavel@ucw.cz>
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
Cc: linux-fbdev@vger.kernel.org, heikki.krogerus@linux.intel.com,
 alice_chen@richtek.com, linux-iio@vger.kernel.org,
 dri-devel@lists.freedesktop.org, lgirdwood@gmail.com, cy_huang@richtek.com,
 krzysztof.kozlowski+dt@linaro.org, lee.jones@linaro.org,
 linux-leds@vger.kernel.org, daniel.thompson@linaro.org, deller@gmx.de,
 robh+dt@kernel.org, andy.shevchenko@gmail.com, chunfeng.yun@mediatek.com,
 linux@roeck-us.net, devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 broonie@kernel.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 ChiaEn Wu <peterwu.pub@gmail.com>, linux-arm-kernel@lists.infradead.org,
 jingoohan1@gmail.com, linux-usb@vger.kernel.org, sre@kernel.org,
 linux-kernel@vger.kernel.org, chiaen_wu@richtek.com,
 gregkh@linuxfoundation.org, jic23@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Pavel Machek <pavel@ucw.cz> =E6=96=BC 2022=E5=B9=B47=E6=9C=8831=E6=97=A5 =
=E9=80=B1=E6=97=A5 =E6=B8=85=E6=99=A85:42=E5=AF=AB=E9=81=93=EF=BC=9A

> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright (C) 2022 Richtek Technology Corp.
> > + *
> > + * Author: Alice Chen <alice_chen@richtek.com
>
> Add ">" at end of line.
>
> The series is quite big, would it be possible to submit LED changes
> in separate series?
>
Hi Pavel,

Our mfd dt-bindings depends on flash and LED dt-bindings,
but our flash and LED config depend on mfd config.
For the dependency consideration,
we think submitting them in a patch series is better.

Best Regards,
Alice
