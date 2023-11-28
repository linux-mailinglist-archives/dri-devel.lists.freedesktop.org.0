Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C44307FBB2D
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 14:17:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB4F610E516;
	Tue, 28 Nov 2023 13:17:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com
 [209.85.128.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8305010E516;
 Tue, 28 Nov 2023 13:17:08 +0000 (UTC)
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-5c85e8fdd2dso51477147b3.2; 
 Tue, 28 Nov 2023 05:17:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701177427; x=1701782227;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C7Lbj/iDgIl6mIwZwAI8rICbFPBFEI97XQcR55PL1mE=;
 b=M10An7KumR0rmgHUmj9nII5G62ElANaYq1/inG3maRl7VSlIIKfJHQfoDNRQufw5NH
 HS3jlGnM1aWoZra/07MpHshF+GtiROX1m2q214tTeqvvA/Unm7y4r17Davk9MH6EdS5v
 xz9qWxpDg6Nqkuruaju76IG+EmpDPYH8xUjnoF1zu5MmYyJBfxDLjqVka9rqrOdcJtfu
 yYtzuSaMIkCJUTiaFTfBMjXLa9LXBlhUGQ0PF7fTVnT+f3RDyBrEHiuoG05HnlHUyljY
 /xdjX1d/tlB26NRk/YNfMWZJhA8VsiTdUyePiBfpyFwQjFxx1Aey6XedSlgIGh/ixhPy
 QAsQ==
X-Gm-Message-State: AOJu0YzikSut1+Y7hIbKbrbYwPN95ELrNVzndqo4wzlVfMGi9VDWkQ/L
 wbnQLBS4wq1aeWuENEgmTZT+dSmh4azpwA==
X-Google-Smtp-Source: AGHT+IEmkuEyRIyL5B9VCKYlIeo6zE/5zfUPiYOJIw1EJXUWYfCc3Egt3Bofi5VLYXEvIEyMlu9gew==
X-Received: by 2002:a0d:cf43:0:b0:5ca:607e:b16e with SMTP id
 r64-20020a0dcf43000000b005ca607eb16emr14001306ywd.0.1701177427368; 
 Tue, 28 Nov 2023 05:17:07 -0800 (PST)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com.
 [209.85.219.181]) by smtp.gmail.com with ESMTPSA id
 gz17-20020a05690c471100b005cdd3869173sm3473141ywb.46.2023.11.28.05.17.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Nov 2023 05:17:06 -0800 (PST)
Received: by mail-yb1-f181.google.com with SMTP id
 3f1490d57ef6-da3b4b7c6bdso5218868276.2; 
 Tue, 28 Nov 2023 05:17:06 -0800 (PST)
X-Received: by 2002:a05:6902:49:b0:d9a:cd50:b99a with SMTP id
 m9-20020a056902004900b00d9acd50b99amr14894279ybh.12.1701177425865; Tue, 28
 Nov 2023 05:17:05 -0800 (PST)
MIME-Version: 1.0
References: <20231128104723.20622-1-tzimmermann@suse.de>
 <20231128104723.20622-5-tzimmermann@suse.de>
In-Reply-To: <20231128104723.20622-5-tzimmermann@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 28 Nov 2023 14:16:55 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUkcnx3WdPXHLq+NJCv9O+tWyhzwZR-VFcY69sciGioSQ@mail.gmail.com>
Message-ID: <CAMuHMdUkcnx3WdPXHLq+NJCv9O+tWyhzwZR-VFcY69sciGioSQ@mail.gmail.com>
Subject: Re: [PATCH 4/8] drm/shmobile: Do not include <drm/drm_plane_helper.h>
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: amd-gfx@lists.freedesktop.org, suijingfeng@loongson.cn,
 dri-devel@lists.freedesktop.org, javierm@redhat.com, mripard@kernel.org,
 linux-renesas-soc@vger.kernel.org, laurent.pinchart@ideasonboard.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 28, 2023 at 11:47=E2=80=AFAM Thomas Zimmermann <tzimmermann@sus=
e.de> wrote:
> Remove unnecessary include statements for <drm/drm_plane_helper.h>.
> The file contains helpers for non-atomic code and should not be
> required by most drivers. No functional changes.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

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
