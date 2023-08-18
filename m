Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E64CD780D2E
	for <lists+dri-devel@lfdr.de>; Fri, 18 Aug 2023 15:57:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31AE310E529;
	Fri, 18 Aug 2023 13:57:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7093D10E529
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Aug 2023 13:57:05 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-1befe39630bso1819405ad.0
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Aug 2023 06:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692367025; x=1692971825;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9eD0O1eo+RjvJrk62h4NWlaW04gRCMar9efOFkm7eDQ=;
 b=lGh3nToTHC+xsSzezgysc8IS9bNIwjzuNW6oJk/XqdYCO0Z7VNBWZH3/tKbINys2nr
 wU0TY7gFXOLh7/cykRSO074GhsdKg2+Jegr2UK89lL9N8/edJFRCQU7jWO1HuCMJhhAc
 9kiOOkRCdalnnOQcbav4ZEb+3qMyeqNEKVtpzQyyasBhhYTGc5gtvwcbjblGjlez6NFS
 651pCa8dOG6ZOVaWeDHoPxFoyUe8mS4U7vCQdJJGsZXptVdEvLVLo0xqAC4v+lXndjwl
 KbrW63nZk/oCDG7Ndaoiai89roB4svHF8FrCSKOk7slYnRIWfVUAVEzD2y19fpHKIF9n
 IClA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692367025; x=1692971825;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9eD0O1eo+RjvJrk62h4NWlaW04gRCMar9efOFkm7eDQ=;
 b=OXioCgfaCC5LvAoLou5A5SCZptY6a+9S0e6xlcrOpJ0ytdwdqvUVCRPBcLEIX7LWqL
 GM2YIynLeUBqzk/h78wXRbnfvFO7dVfQmPj4jH3cN6TQtM/b1dfzt8ItNQT2R1zlkuoH
 HUTncHHbuy2ZqALbKq9RGsMsLCfGHPe+j/n8vDWpg1iFB7xOPYdF6z/xxJNc94nztG51
 kwsMwRkgjVq3jakcm44ysds5YYEMpHwg9+6P0K6ZppRYeqb6GaRw1BD6zUw1IsYG7vzB
 JqenL1LJTsChbEWKk+2R0ATtRkFx+lDhBo6HqMXXKkBtsjuKUPN/G9mwHuFex8rr1uoS
 Rp7Q==
X-Gm-Message-State: AOJu0Yz8xNqlx5M67kz17WVU4lvPBkWhYuLZwrqa4IgMeevkK+NsgCib
 /iSnjW/QwgyhwaaUTpGHumfaOrMBcXU86LH1vY4=
X-Google-Smtp-Source: AGHT+IHJSy7BpQil2h7W5EZDBkE2OdIgHgRUSkli/M2Y/hys+3q43fMrkA13VMAlIkvPqxqk2lFLTo6P8U49QaR0aPc=
X-Received: by 2002:a17:90a:4101:b0:26b:5fad:e71c with SMTP id
 u1-20020a17090a410100b0026b5fade71cmr2387978pjf.2.1692367024967; Fri, 18 Aug
 2023 06:57:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230813180512.307418-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230813180512.307418-1-biju.das.jz@bp.renesas.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 18 Aug 2023 10:56:53 -0300
Message-ID: <CAOMZO5C4dcdjhhVHw1W4zXCv8w7TDwfzVxkt4VZBge-hyzXBRw@mail.gmail.com>
Subject: Re: [PATCH 0/7] ADV7511 driver enhancements
To: Biju Das <biju.das.jz@bp.renesas.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Ahmad Fatoum <a.fatoum@pengutronix.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Jonas Karlman <jonas@kwiboo.se>,
 Adam Ford <aford173@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Javier Martinez Canillas <javierm@redhat.com>,
 linux-renesas-soc@vger.kernel.org, Andy Shevchenko <andy.shevchenko@gmail.com>,
 Bogdan Togorean <bogdan.togorean@analog.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Biju,

On Sun, Aug 13, 2023 at 3:05=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
>
> This patch series aims to improve ADV7511 driver by adding
> feature bits and data instead of comparing enum adv7511_type for
> various hardware differences between ADV7511, ADV7533 and ADV7535.
>
> This patch series tested with[1] on RZ/G2L SMARC EVK which embeds
> ADV7535.

I have successfully tested this series on a imx8mm-evk, which has an ADV753=
5:

Tested-by: Fabio Estevam <festevam@gmail.com>
