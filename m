Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C2C5733276
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 15:47:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7815C10E622;
	Fri, 16 Jun 2023 13:47:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B82310E622
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 13:47:44 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B0730629F3
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 13:47:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56EC8C43391
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 13:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686923261;
 bh=e3Rn9wSp0yBzOPdTFOU/3C0NFGTIC9+SG2QGu/MQAiI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Fwp/B2s6/1SMHXRYeVOqtSkxp17GBTzZ9lvprmabfaWKOBVM7I2+iCqNf2YnjPyXk
 yhjB7NhUuEAQEh5JGsUHNYWINtu6W4dBn1C/+1HwahCTnusYOENpybWKC91OQ37Udn
 z7A8TMgHrOboK7mdbFR8OS56LyY72J3p06xXgsy0auR17x5xhLjIYBI7mWMof9xphg
 L4k/g1sx0tIYT0Je/d+AmjqWzrOsa9pW56HpEEpelcQN9J5XhuLDpHbqu4C/FltLin
 zqYw7HQBYk04qC2AGZPLGYBozvhK3gkZtC71+9krbCmC62eysTcvyHSjC2AjgFAW75
 uQktPBuoaOdZg==
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-1b539102474so2031125ad.1
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 06:47:41 -0700 (PDT)
X-Gm-Message-State: AC+VfDySfb1wEwtcAp/yzUN2NVqB8uWKF3tTh8LVzut6cHtYpo4vMcoC
 dmxbxXrFZp2694oH36xllYkls3wXyUFUw9K29Wx4pQ==
X-Google-Smtp-Source: ACHHUZ6S6xDb9UwuivCY3/VT2rSDFUreEKhVsbql4uCpIS5aTfqDe0VsnssVVihzjlCFyZXmoDBshHzfwGBE6X1ZLjQ=
X-Received: by 2002:a17:903:1112:b0:1af:a293:e155 with SMTP id
 n18-20020a170903111200b001afa293e155mr2017620plh.16.1686923260691; Fri, 16
 Jun 2023 06:47:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230616121341.1032187-1-juerg.haefliger@canonical.com>
In-Reply-To: <20230616121341.1032187-1-juerg.haefliger@canonical.com>
From: Robert Foss <rfoss@kernel.org>
Date: Fri, 16 Jun 2023 15:47:29 +0200
X-Gmail-Original-Message-ID: <CAN6tsi4jdDD20DY5sKL+ALC_Mk2UHRArOrQnjzKoyF30QZi8jw@mail.gmail.com>
Message-ID: <CAN6tsi4jdDD20DY5sKL+ALC_Mk2UHRArOrQnjzKoyF30QZi8jw@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: lt9611uxc: Add MODULE_FIRMWARE macro
To: Juerg Haefliger <juerg.haefliger@canonical.com>
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
Cc: neil.armstrong@linaro.org, jonas@kwiboo.se, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, jernej.skrabec@gmail.com,
 Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 16, 2023 at 2:13=E2=80=AFPM Juerg Haefliger
<juerg.haefliger@canonical.com> wrote:
>
> The module loads firmware so add a MODULE_FIRMWARE macro to provide that
> information via modinfo.
>
> Signed-off-by: Juerg Haefliger <juerg.haefliger@canonical.com>
> ---
>  drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm=
/bridge/lontium-lt9611uxc.c
> index 583daacf3705..6b2a4f8d6f78 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> @@ -1019,3 +1019,5 @@ module_i2c_driver(lt9611uxc_driver);
>
>  MODULE_AUTHOR("Dmitry Baryshkov <dmitry.baryshkov@linaro.org>");
>  MODULE_LICENSE("GPL v2");
> +
> +MODULE_FIRMWARE("lt9611uxc_fw.bin");
> --
> 2.37.2
>

Can filename string be made into a macro, as it is used in two locations?

With that fixed, please add my r-b.


Rob.
