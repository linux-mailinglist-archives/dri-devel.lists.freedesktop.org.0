Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB21357A9FE
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 00:46:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B18B711B6DD;
	Tue, 19 Jul 2022 22:45:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3C0312A3B7
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jul 2022 22:45:57 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id t3so21607298edd.0
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jul 2022 15:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=fv+GNXlN9UxF9XBdT2UlE6jI8/2x/dbHCuQ1tk+iXUs=;
 b=ZmE6QeSILOLriTuD+A60orcSHG5MM5lDq068GNLBGBf0gp2j+kgRdIcg4p5EzEAsg0
 NJc57UwpNJmUS20kWorgRWJzqgWdOVzT47jIrMIccxokQbbxJNZv0Dl0Xjh8tkuEieKa
 9fG5elw4bKwSsGETu04l7LiBnxio5sYPavxD4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=fv+GNXlN9UxF9XBdT2UlE6jI8/2x/dbHCuQ1tk+iXUs=;
 b=tjd+14GSoBHoVpbv3AIrmeOiEoxKdqwhJWCSO2+Td4406EnkqdmQLA+MJ11Rp3b+37
 5RgLSBEzjhatLk+caCMJKdt4dmKTjX2jGGUC1uKD8KakUuLcjd5uFahTttl4pK7CM+kO
 7hYQRmbagvE7kYBxo+okQA4gYpr0r0ALudFDjsw9qDDrKU3vRqgO3rBnEsGFeN/6Y7cL
 YN9UE1MZe6B5/Zcz3rhal258cYzvMZ4iEbAyVOE13vaZcJ8UcgH/ldeeS2pCn2PUXh38
 7MlWHUGu8UUHnUIDBHcAwReAoMam7mqxEDB9c1y6BICO+h48g9zW79LbvP4OY14ZdLxZ
 8MOw==
X-Gm-Message-State: AJIora+W78zec69Owz3DJaoNWEpbWmtyWzVuPub6JB4+674U/houYCp3
 sHpuue7na8dsLCIwKCqgUPPKqHB9doAn7yzn6rA=
X-Google-Smtp-Source: AGRyM1vfqAB4ilLDJ+YSHg5WQ7tjglvV0MXCl9DsjnbvdqkMrgWY8gWMSEyu7qhm1dK6XwsdxcnTqg==
X-Received: by 2002:a05:6402:2552:b0:43a:d133:b282 with SMTP id
 l18-20020a056402255200b0043ad133b282mr46392329edb.89.1658270756367; 
 Tue, 19 Jul 2022 15:45:56 -0700 (PDT)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com.
 [209.85.221.43]) by smtp.gmail.com with ESMTPSA id
 k16-20020aa7c050000000b0043af8007e7fsm11323654edo.3.2022.07.19.15.45.53
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Jul 2022 15:45:53 -0700 (PDT)
Received: by mail-wr1-f43.google.com with SMTP id n12so10840888wrc.8
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jul 2022 15:45:53 -0700 (PDT)
X-Received: by 2002:adf:fb12:0:b0:20c:79b2:a200 with SMTP id
 c18-20020adffb12000000b0020c79b2a200mr28616133wrr.617.1658270752900; Tue, 19
 Jul 2022 15:45:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220719203857.1488831-1-nfraprado@collabora.com>
 <20220719203857.1488831-4-nfraprado@collabora.com>
In-Reply-To: <20220719203857.1488831-4-nfraprado@collabora.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 19 Jul 2022 15:45:39 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X0End8u3nNNXSMVhuJo0KWmJYRNg3yeC9yQ+5bLKTmYg@mail.gmail.com>
Message-ID: <CAD=FV=X0End8u3nNNXSMVhuJo0KWmJYRNg3yeC9yQ+5bLKTmYg@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/panel-edp: Fix variable typo when saving hpd
 absent delay from DT
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>, kernel@collabora.com,
 Sam Ravnborg <sam@ravnborg.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, Jul 19, 2022 at 1:39 PM N=C3=ADcolas F. R. A. Prado
<nfraprado@collabora.com> wrote:
>
> The value read from the "hpd-absent-delay-ms" property in DT was being
> saved to the wrong variable, overriding the hpd_reliable delay. Fix the
> typo.
>
> Fixes: 5540cf8f3e8d ("drm/panel-edp: Implement generic "edp-panel"s probe=
d by EDID")
> Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> ---
>
>  drivers/gpu/drm/panel/panel-edp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/pa=
nel-edp.c
> index 152e00eb846f..b3536d8600f4 100644
> --- a/drivers/gpu/drm/panel/panel-edp.c
> +++ b/drivers/gpu/drm/panel/panel-edp.c
> @@ -738,7 +738,7 @@ static int generic_edp_panel_probe(struct device *dev=
, struct panel_edp *panel)
>         of_property_read_u32(dev->of_node, "hpd-reliable-delay-ms", &reli=
able_ms);
>         desc->delay.hpd_reliable =3D reliable_ms;
>         of_property_read_u32(dev->of_node, "hpd-absent-delay-ms", &absent=
_ms);
> -       desc->delay.hpd_reliable =3D absent_ms;
> +       desc->delay.hpd_absent =3D absent_ms;

Well that's embarrassing. In the end I never used any of these
properties for anything shipping since HPD was always hooked up on
later boards and the only board that needed "hpd_reliable" never ended
up switching to the generic "edp-panel".

Reviewed-by: Douglas Anderson <dianders@chromium.org>

I'll apply this right away to drm-misc-fixes.
