Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E04E97E79EF
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 08:58:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AEB910E946;
	Fri, 10 Nov 2023 07:58:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com
 [209.85.128.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D69010E946
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 07:58:50 +0000 (UTC)
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-5a7d9d357faso20351067b3.0
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Nov 2023 23:58:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699603129; x=1700207929;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oBIgmcUo+FfrCy6Q7WzCcYAi+ZlA4gIfvuq2kYbfJSw=;
 b=TeyylwDTepDtImWEABWCN3C2jczvJkRI2f5poB6YwvRqlcXmuOzO2rYfqPx6blH8HK
 KtyhPhaqiKZ1Ubwjvxh8VRcIwesv0m0L1+RI+zWnnXto99E3hhENviTQeGUIb9gP8Kky
 Zim0UEbeWT4gdkXHqX+DgcX+2b/r5hdqmPI/Wwx7LQKIeJsF5wqTkwBuFNcHze/7IQ5Z
 OvmjXhH0CAHjcR1I+KELauiLa0Dmcp7J0XesBsXmTzk9emp5BOc+DrmZ9XhsQgVWRuTG
 5A3dCxBycFijSIrwajXwUlvO5R/GowbPlPxUZdRmNvv9Ude3nWXth9CBleudQ7Py0661
 jDYA==
X-Gm-Message-State: AOJu0YyIYnppC1BTiPY3chT0i8qhVxJzC7QL8OYTqiDDnPXa2oR0WuRE
 fyiniIU1m7A4x4DpO0u8cHCazCnHOcU+Ng==
X-Google-Smtp-Source: AGHT+IGF/O6HIU1vJfGbRbxZTfWfNWZpqeolXyTqZAIb6nwtOXayVLZWL1OpEE3Io0rWOmy4qEas6w==
X-Received: by 2002:a81:84ce:0:b0:5ad:716b:ead3 with SMTP id
 u197-20020a8184ce000000b005ad716bead3mr7589462ywf.28.1699603129267; 
 Thu, 09 Nov 2023 23:58:49 -0800 (PST)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com.
 [209.85.128.172]) by smtp.gmail.com with ESMTPSA id
 x2-20020a81a002000000b005b3f6c1b5edsm8525595ywg.80.2023.11.09.23.58.48
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Nov 2023 23:58:48 -0800 (PST)
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-5a7d9d357faso20350957b3.0
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Nov 2023 23:58:48 -0800 (PST)
X-Received: by 2002:a25:ce02:0:b0:dae:b67e:7cd4 with SMTP id
 x2-20020a25ce02000000b00daeb67e7cd4mr7422482ybe.46.1699603128113; Thu, 09 Nov
 2023 23:58:48 -0800 (PST)
MIME-Version: 1.0
References: <20231109220151.10654-1-u.kleine-koenig@pengutronix.de>
 <20231109220151.10654-2-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20231109220151.10654-2-u.kleine-koenig@pengutronix.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 10 Nov 2023 08:58:37 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWEGxU8STZrv4q3JgT+U=+Vyr4w_e_VnN23f36kBRBJXA@mail.gmail.com>
Message-ID: <CAMuHMdWEGxU8STZrv4q3JgT+U=+Vyr4w_e_VnN23f36kBRBJXA@mail.gmail.com>
Subject: Re: [PATCH 1/2] fb: amifb: Mark driver struct with __refdata to
 prevent section mismatch warning
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

Hi Uwe,

On Thu, Nov 9, 2023 at 11:02=E2=80=AFPM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
> As described in the added code comment, a reference to .exit.text is ok
> for drivers registered via module_platform_driver_probe(). Make this
> explicit to prevent a section mismatch warning.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Thanks for your patch!
Why am I not seeing the actual section mismatch warning, not even
with W=3D1?

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
