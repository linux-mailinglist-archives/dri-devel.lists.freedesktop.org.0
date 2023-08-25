Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2991787EBC
	for <lists+dri-devel@lfdr.de>; Fri, 25 Aug 2023 05:49:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCA0710E0C2;
	Fri, 25 Aug 2023 03:49:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com
 [IPv6:2001:4860:4864:20::2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8178310E0C2
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Aug 2023 03:49:22 +0000 (UTC)
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-1c0fcbf7ae4so359387fac.0
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Aug 2023 20:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692935361; x=1693540161;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oaRgqvEayejHdHjo+Vb4wpZc82Sn3tsmMDNX5I53Fa8=;
 b=KnE5cGW/HUiIaHohWIwrK0drYW/FqIqcuCzQaqtCRl4szjAsv+mkzmcE2jxqxhusK+
 0yuPG2g3PG1BxEl6peLt782VA8qQwBIU1fAP3drhgFY/2CVATBN1EgGFMtkx2Tr3hkW+
 1rjeas/FCpN3Ua+96hGR9/cno3HZWXDnT2pewpJI0TMaG6uT7bjIPKDIQuotqLCTK5Fc
 o5n+YcT+yGHaUyaZIBuztH36eEZQTLatXE0So7MXVRDyizlFjd2sFOmuGRB2ECPv1Exq
 3ydQPEO6X2q6OK00rpaFKSQTHE2rkjqWyTrki6Yn9E8+iK5WBrkAvqMc13L1qpCILqbZ
 iL7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692935361; x=1693540161;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oaRgqvEayejHdHjo+Vb4wpZc82Sn3tsmMDNX5I53Fa8=;
 b=f98IVCFn5ARvBmYtcU8AzdKwkUxjtABZ1ccrbGMoQ3sgYQaf7aVU/SoWS6kdmwQhP+
 Hh7MAP22mlaBON844lj0wok25FErFGbxM+/KrWGlmJHC3lEt0bdor2VkTTcBgd221QFW
 GXOvwc/JrRQNwBfL3rjc7hspXT7XE2+v90ejBZ6l3WHz82Iy4y6xrP2VSF028YDW6wHt
 cmEodaGTR8H6yKWkHfMBu14Bm7jfPw7RMr8ATZeha7G5+f2qN5+ElxZgGksp2Av7AB4Z
 2ie+dGJt+b6MQm8owECgpbc4EIX4SxWjmesLNIfd5g5lnJpgcliLh2MYRZH8PyYYStOm
 Hr6A==
X-Gm-Message-State: AOJu0YwoFftisDB+Xuwxd8202htzvX2G6UGRGGr7jnjEA4kOeVbn0khX
 6hNcnVcF9Bzq/DPn4Ces0jSDS7ebzHlBKWjnw50=
X-Google-Smtp-Source: AGHT+IFz3uxVhAMLCyy5LbMp6B/ElxF/bgUn0StLMVs+ZrEjaKhokN9PT2On3y8oytVd3ndlCEqQxcZgwGr8dEhfdVI=
X-Received: by 2002:a05:6870:d18a:b0:1b0:1e3b:5c21 with SMTP id
 a10-20020a056870d18a00b001b01e3b5c21mr2054858oac.1.1692935361628; Thu, 24 Aug
 2023 20:49:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230824181546.391796-1-biju.das.jz@bp.renesas.com>
 <20230824182609.GA6477@pendragon.ideasonboard.com>
In-Reply-To: <20230824182609.GA6477@pendragon.ideasonboard.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 25 Aug 2023 06:48:45 +0300
Message-ID: <CAHp75VeK_0MnPtku7W6_ZDUWBTOFgmFZiwnOcnGgiVzbeU6FKQ@mail.gmail.com>
Subject: Re: [PATCH v3] drm/bridge/analogix/anx78xx: Drop ID table
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Zhu Wang <wangzhu9@huawei.com>,
 Robert Foss <rfoss@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Arnd Bergmann <arnd@arndb.de>, Jonas Karlman <jonas@kwiboo.se>,
 Douglas Anderson <dianders@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org, Guenter Roeck <groeck@chromium.org>,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 24, 2023 at 9:26=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Thu, Aug 24, 2023 at 07:15:46PM +0100, Biju Das wrote:

...

> I wonder, as the device can only be instantiated from OF, should we add
>
>         depends on OF

Generally speaking this is a bad idea. It prevents a component from
being instantiated on ACPI based systems (even if there is no ACPI ID
table, due to a gateway called PRP0001).

> to Kconfig, and drop the
>
> #if IS_ENABLED(CONFIG_OF)
>
> from the driver ?

Contrary this is an idea I fully support!

--=20
With Best Regards,
Andy Shevchenko
