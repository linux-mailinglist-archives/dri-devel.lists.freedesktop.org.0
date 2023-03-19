Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B965D6C003E
	for <lists+dri-devel@lfdr.de>; Sun, 19 Mar 2023 10:16:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BD3710E501;
	Sun, 19 Mar 2023 09:16:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7BD110E166
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Mar 2023 09:16:19 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id t9so10032263qtx.8
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Mar 2023 02:16:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679217378;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aFHFIVIlWPeixgi+/SCoJZniaNikM08w6VaCM0NDX0M=;
 b=6ADoI+MrucevUZlJD+a7BjOFuiyiJpLWCZdlMr5MOZs+W97MkcwrmBJWmnQ2ZinW8T
 M0hF1CifyzEnuDuyipemgWC+t2345Yc0cskTULdJcbMFHkaB6SMduSPN7J8vZuEVQFAL
 PIZ4ifViKgIz9y9EQ73rDmpzE3UXMpnMOmqWz2nxFJvYgNsuq3Z8Tu4/kooZrudp9Phu
 slejGcNBHdYjbKlwiRwwkGTFy05GfZgawQUzpy4Q/mdr7D0FXZxnGYhUClxsY5+tpwOq
 SmcJM/vrzcg0bRK108uQi1xyu9uybBELUya1CMrz3y9ucXIFI8UXpp7QlnFx1xFbL2/Z
 PbbA==
X-Gm-Message-State: AO0yUKWXeMpKBCIP3hlusHRBS6LjQipuugT+QUPF4KJ4Tw+xzyeJFn9b
 RJJE1FluDFRtY4ynROfOb3zpi2lmPjHaUQ==
X-Google-Smtp-Source: AK7set//Ahv925ezWOY1N31rtLwmjQ0pNJL6+JoaiSpeYW8nSYyFOIr9k+IKlUIPiwI612hF7i1VFA==
X-Received: by 2002:a05:622a:1001:b0:3df:6b5:d12c with SMTP id
 d1-20020a05622a100100b003df06b5d12cmr3246069qte.32.1679217378603; 
 Sun, 19 Mar 2023 02:16:18 -0700 (PDT)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com.
 [209.85.219.170]) by smtp.gmail.com with ESMTPSA id
 4-20020a370504000000b007458ae32290sm5118407qkf.128.2023.03.19.02.16.16
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Mar 2023 02:16:17 -0700 (PDT)
Received: by mail-yb1-f170.google.com with SMTP id p203so9773991ybb.13
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Mar 2023 02:16:16 -0700 (PDT)
X-Received: by 2002:a25:3249:0:b0:a02:a3a6:78fa with SMTP id
 y70-20020a253249000000b00a02a3a678famr2138253yby.12.1679217376224; Sun, 19
 Mar 2023 02:16:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230318235428.272091-1-u.kleine-koenig@pengutronix.de>
 <20230318235428.272091-40-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230318235428.272091-40-u.kleine-koenig@pengutronix.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 19 Mar 2023 10:16:04 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXMfNGoOV-Nr08oXngH-RKjmR2J-6drn9-JB1FdnizdeQ@mail.gmail.com>
Message-ID: <CAMuHMdXMfNGoOV-Nr08oXngH-RKjmR2J-6drn9-JB1FdnizdeQ@mail.gmail.com>
Subject: Re: [PATCH 39/51] video: fbdev: sh_mobile_lcdcfb: Convert to platform
 remove callback returning void
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
Cc: linux-fbdev@vger.kernel.org, kernel@pengutronix.de,
 ye xingchen <ye.xingchen@zte.com.cn>, Helge Deller <deller@gmx.de>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Mar 19, 2023 at 12:54=E2=80=AFAM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
>
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
