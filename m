Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B898C7173D3
	for <lists+dri-devel@lfdr.de>; Wed, 31 May 2023 04:36:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B31610E1A7;
	Wed, 31 May 2023 02:36:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D6BE10E1A7
 for <dri-devel@lists.freedesktop.org>; Wed, 31 May 2023 02:36:13 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id
 e9e14a558f8ab-33b36a9fdf8so5530945ab.2
 for <dri-devel@lists.freedesktop.org>; Tue, 30 May 2023 19:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1685500570; x=1688092570;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6cWMYaNg0PgxjT8idVZDqkDdM9Al1R7Rn6DdYlu5nHY=;
 b=lF+0MXMq7ZGaB/G6qIMFUWZM7Hzb1Oha76QPJPX4xFpBVBV95XfJOH/3Fe7dcdz6JJ
 Pj8M+SiOopGLVR0gcr8oxAo3I44iLa/rDxI7Vm9h2C0M38BVbbgJDihbToTpVbMwKOKb
 AraGYZE/MlSM8NRbIdfnp9iae6kKrQvlXwdE4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685500570; x=1688092570;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6cWMYaNg0PgxjT8idVZDqkDdM9Al1R7Rn6DdYlu5nHY=;
 b=cAkMZNhBYz8xbOLn+ADrJ0fVwsdG2PwGQAu6prvpS0xU7bcUfaLlMisEZQxiHsYt8A
 yxEU7R91+IRZ6nF4S3fZZiSEPWhcJuJm+WWCMSPWl+Swe59ZXIvbjm/gMHCDgYX+J9Ma
 gzN9yFDPdavDSqJuVICrLxeORg6Cz41UsCNUWxa5FdbybdZLE3V9tfflmdScyDBoZAhi
 PuMtZi2RcbW0ssUjU7qYyAwIPYUk9CteKSmM2HTCNyXiaMggA6I7p85hiXseybU20uvn
 Hq5hQBy9uy1j8sdrCJ56r3oKn2Ax+DHYD6/c7sIFyhB+8SjOWjta4bdshXDOdZ2m5q1E
 5u1g==
X-Gm-Message-State: AC+VfDybMdHn/NlahB3fGSrXW0wz7x9rQB1hND+sHdCtFXtj27v+QetJ
 TzyLFVYANmavWAYegmO3iQuKtj5yB3ccZUOr9Wg=
X-Google-Smtp-Source: ACHHUZ4g6l3SZtxAwuELogd+WToSCH2NdyFF6czqHqzGb7xDvvy7FabeVx/mgkJuabjvmqRGdC1LgA==
X-Received: by 2002:a92:d1c3:0:b0:323:bce:f23f with SMTP id
 u3-20020a92d1c3000000b003230bcef23fmr953555ilg.3.1685500570377; 
 Tue, 30 May 2023 19:36:10 -0700 (PDT)
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com.
 [209.85.166.172]) by smtp.gmail.com with ESMTPSA id
 o10-20020a92d4ca000000b003350061b57csm2772077ilm.81.2023.05.30.19.36.09
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 May 2023 19:36:09 -0700 (PDT)
Received: by mail-il1-f172.google.com with SMTP id
 e9e14a558f8ab-33bf12b5fb5so29905ab.1
 for <dri-devel@lists.freedesktop.org>; Tue, 30 May 2023 19:36:09 -0700 (PDT)
X-Received: by 2002:a05:6e02:154a:b0:328:3a25:4f2e with SMTP id
 j10-20020a056e02154a00b003283a254f2emr5088ilu.9.1685500569152; Tue, 30 May
 2023 19:36:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230530074216.2195962-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230530074216.2195962-1-u.kleine-koenig@pengutronix.de>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 30 May 2023 19:35:57 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XXUZg9N3EFJVKTWU=BAM1xpteJZKypcEy+9hX+G9gcjw@mail.gmail.com>
Message-ID: <CAD=FV=XXUZg9N3EFJVKTWU=BAM1xpteJZKypcEy+9hX+G9gcjw@mail.gmail.com>
Subject: Re: [PATCH] drm/panel-edp: Convert to platform remove callback
 returning void
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org, kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, May 30, 2023 at 12:42=E2=80=AFAM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code.  However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
>
> panel_edp_remove() always returned zero, so convert it to return void
> without any loss and then just drop the return from
> panel_edp_platform_remove().
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)

Looks great, thanks.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

I see no reason for a delay in applying, so I pushed to drm-misc-next:

72a597aed1d9 drm/panel-edp: Convert to platform remove callback returning v=
oid
