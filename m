Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 053307E79F1
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 08:59:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D89D10E947;
	Fri, 10 Nov 2023 07:59:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com
 [209.85.128.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A50D10E947
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 07:59:33 +0000 (UTC)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-5a82c2eb50cso20470607b3.2
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Nov 2023 23:59:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699603172; x=1700207972;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V8V5kC4IHcPdk1CWqhFLtS9k05ixlcMjlfh6q5y52Wo=;
 b=nnL2ZaY/tlPSDK7a6mM6vnv3UoHe6nuZL3IKIP+1zrIvaPH9M7MhY2MiYXl/gl7caE
 Ha9x2wZ1fnaahlUFZxT6J5n8t9t4SMiI91tjicgOgjEbhDb/fpvXy1mhfwvqXfv7PgoA
 vy6IHoQBbL63TbumkngTBZTO04w+HQts4HxFhCc1axnZY1CdvJWti20zBFa6uwn4fijq
 OWxkJktHPSL+cuZJ/WmmWR5acvgfkovvTE41CiLwpJhaayhTLIpqyEtAx/xHzKJEwuBZ
 dPLWXJ+63MFAEC9dCnpQjcCFmkZspl+4FwxDmnRUuTicTlok9YhDRH9mfFKdUvjLxpf4
 My7A==
X-Gm-Message-State: AOJu0Yw1W7d8Ku0j3k8Y7/sJwfO/Z4hiOKNg2+H4AarMddFyyDVrWIRg
 ox41+Xp+GmDRkDoZXCWOaUbdfYqvseFgcw==
X-Google-Smtp-Source: AGHT+IES+kSW5KinyHiOhoLoFgHQ2zboD5we2bM2LYQQOJVxVmWgH5AxYFUctMCCtmrxbLlDaxWOgQ==
X-Received: by 2002:a0d:cd81:0:b0:5af:f026:a27 with SMTP id
 p123-20020a0dcd81000000b005aff0260a27mr6700948ywd.50.1699603172255; 
 Thu, 09 Nov 2023 23:59:32 -0800 (PST)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com.
 [209.85.128.169]) by smtp.gmail.com with ESMTPSA id
 m15-20020a819c0f000000b005bf57ef572dsm1036052ywa.140.2023.11.09.23.59.32
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Nov 2023 23:59:32 -0800 (PST)
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-5afa5dbc378so20695637b3.0
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Nov 2023 23:59:32 -0800 (PST)
X-Received: by 2002:a81:5b07:0:b0:5a7:fae6:1cc6 with SMTP id
 p7-20020a815b07000000b005a7fae61cc6mr6505478ywb.24.1699603171811; Thu, 09 Nov
 2023 23:59:31 -0800 (PST)
MIME-Version: 1.0
References: <20231109220151.10654-1-u.kleine-koenig@pengutronix.de>
 <20231109220151.10654-3-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20231109220151.10654-3-u.kleine-koenig@pengutronix.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 10 Nov 2023 08:59:20 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX6=wNfX+zo3-8a=wLUDzWux1f83=Z9J30kyE4jk1hwoA@mail.gmail.com>
Message-ID: <CAMuHMdX6=wNfX+zo3-8a=wLUDzWux1f83=Z9J30kyE4jk1hwoA@mail.gmail.com>
Subject: Re: [PATCH 2/2] fb: amifb: Convert to platform remove callback
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
Cc: linux-fbdev@vger.kernel.org, kernel@pengutronix.de,
 Helge Deller <deller@gmx.de>, Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Atul Raut <rauji.raut@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 9, 2023 at 11:02=E2=80=AFPM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
>
> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new(), which already returns void. Eventually after all drivers
> are converted, .remove_new() will be renamed to .remove().
>
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

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
