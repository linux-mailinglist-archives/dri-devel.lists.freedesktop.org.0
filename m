Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F49D6FB0FD
	for <lists+dri-devel@lfdr.de>; Mon,  8 May 2023 15:13:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33FC010E287;
	Mon,  8 May 2023 13:13:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com
 [209.85.128.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52D3D10E287
 for <dri-devel@lists.freedesktop.org>; Mon,  8 May 2023 13:13:26 +0000 (UTC)
Received: by mail-yw1-f174.google.com with SMTP id
 00721157ae682-55a5a830238so39999327b3.3
 for <dri-devel@lists.freedesktop.org>; Mon, 08 May 2023 06:13:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683551604; x=1686143604;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ypP1RaD2v3JaEFIwqh2HQLG8afiKCDXmEZ3MsLg9oNE=;
 b=hUOEgQ4Q5mIWCpfFa27NDc0oSbF5HxAIjwAZzwbpMOY+apG7Zotu3dE6UyaPr9bo6w
 X39DmovbdUaWzlG+BtMsxNyqFZY0qBkGz78+kO8CcnX3u/PSqc3rRnz35FerwnGTTs8L
 +U8zZSyuF5ESu4gahPNuQ078wF7zYorqR/a7I5nh09aEMb/ucO3kGtt/7Uf1S7/IXM4w
 1/XQkuQ7tRIFg124lbjvdbeQgIVKPXGsLlbxtcN6XoS0edud/j3eKagFBWtYxisFgjIC
 GL29pKqnQyZlk0QFH8V833LsME+Q2dQKRCexH5Zo0kKkcsq1Xn5wXtptuM+SAfeGC83j
 PUyA==
X-Gm-Message-State: AC+VfDynlagXMmexQv0gyW091HcEU8XK+LZGqm0OzQ6wDiKhp3016XkA
 rTGT4B5/vuGSBRA2wi0BCZtww8LLRrJr1w==
X-Google-Smtp-Source: ACHHUZ6BEE10i9IwyEWrUEfQKhOf1Jq+MDfWDeiIg1AQf+mcxiRDM8ZLohBabt5EHlJNW/EwE1eapw==
X-Received: by 2002:a0d:cb11:0:b0:55a:aa57:5660 with SMTP id
 n17-20020a0dcb11000000b0055aaa575660mr11869137ywd.20.1683551604312; 
 Mon, 08 May 2023 06:13:24 -0700 (PDT)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com.
 [209.85.128.182]) by smtp.gmail.com with ESMTPSA id
 t204-20020a0dead5000000b0055a1069886fsm2468071ywe.129.2023.05.08.06.13.23
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 May 2023 06:13:23 -0700 (PDT)
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-55a8019379fso40201297b3.0
 for <dri-devel@lists.freedesktop.org>; Mon, 08 May 2023 06:13:23 -0700 (PDT)
X-Received: by 2002:a0d:ca51:0:b0:55d:6757:e975 with SMTP id
 m78-20020a0dca51000000b0055d6757e975mr9230569ywd.49.1683551603615; Mon, 08
 May 2023 06:13:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
 <20230507162616.1368908-40-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230507162616.1368908-40-u.kleine-koenig@pengutronix.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 8 May 2023 15:13:12 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUZnBhh9dxQG1yA=8_DE_m7b6a1KD+GZLy5SxKY9H=ZAQ@mail.gmail.com>
Message-ID: <CAMuHMdUZnBhh9dxQG1yA=8_DE_m7b6a1KD+GZLy5SxKY9H=ZAQ@mail.gmail.com>
Subject: Re: [PATCH 39/53] drm/shmobile: Convert to platform remove callback
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
Cc: kernel@pengutronix.de, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, May 7, 2023 at 6:31=E2=80=AFPM Uwe Kleine-K=C3=B6nig
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
