Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23DE67FBB26
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 14:16:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C26A10E51E;
	Tue, 28 Nov 2023 13:16:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com
 [209.85.128.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3B3510E51E;
 Tue, 28 Nov 2023 13:16:20 +0000 (UTC)
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-5cdc0b3526eso35578137b3.1; 
 Tue, 28 Nov 2023 05:16:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701177379; x=1701782179;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=S9th/BD77eUlMr387q5dkgInc/R3bzqxX0OMMyBPcVw=;
 b=gouNp6o7Gg7vcqO5QbkJ0SVHfggjK51GDVdkyasB6LncCjyNERN+J+u6IYdtnpwYSs
 dKygrnXQCnDrC5KjRjKOXKG0MlhcIn/UlDTjZbYcKpB7Qvbyt9HJVS+kYCGGdSBvvlf3
 k+v4wCyI8UAcGW+oyxbvH98mS9dqWqZFwFn/8OnRw00YfBquxlvJZloRGBZo9AF+fxOX
 ESN8HiUE0lSko2tmhTH2WfcMi5QNPzIopNcrMsmcgxjOcjEDw8Hxu2kgvGFI7uHf1qcw
 SWNAuLOhNx/rkpDX16i2AV1UiZLlZeUpR6nfVPYz8jpxtQNZ8wGd51qkBc1iXsRxcsWt
 LL8g==
X-Gm-Message-State: AOJu0YzDAP6r4Li+n4oAAOxmm1lxQfWgxpLqb66fS2OwrpFSlw+5Q+gC
 Sdfxop/H2YEwzuyO0StBt4wcyhWOZg8ZTw==
X-Google-Smtp-Source: AGHT+IF+rSxToUFGCq1pPOiP0zt9FuEobqwRM9vhHMDJvXhN8MmXLyxJFNgGj7zbv1LkEYaKvVC5Ew==
X-Received: by 2002:a0d:cf47:0:b0:5cd:ef57:ce3a with SMTP id
 r68-20020a0dcf47000000b005cdef57ce3amr11664000ywd.0.1701177379301; 
 Tue, 28 Nov 2023 05:16:19 -0800 (PST)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com.
 [209.85.128.178]) by smtp.gmail.com with ESMTPSA id
 m12-20020a81d24c000000b0058427045833sm3831531ywl.133.2023.11.28.05.16.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Nov 2023 05:16:18 -0800 (PST)
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-5d1f8bc279aso1001267b3.1; 
 Tue, 28 Nov 2023 05:16:18 -0800 (PST)
X-Received: by 2002:a25:d287:0:b0:db4:c7c:ede0 with SMTP id
 j129-20020a25d287000000b00db40c7cede0mr14829349ybg.24.1701177377982; Tue, 28
 Nov 2023 05:16:17 -0800 (PST)
MIME-Version: 1.0
References: <20231128104723.20622-1-tzimmermann@suse.de>
 <20231128104723.20622-6-tzimmermann@suse.de>
In-Reply-To: <20231128104723.20622-6-tzimmermann@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 28 Nov 2023 14:16:06 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU3R=JkCeaM3m_TO_EOBbgut7qr_PJTJbTgs=CU05bgTQ@mail.gmail.com>
Message-ID: <CAMuHMdU3R=JkCeaM3m_TO_EOBbgut7qr_PJTJbTgs=CU05bgTQ@mail.gmail.com>
Subject: Re: [PATCH 5/8] drm/solomon: Do not include <drm/drm_plane_helper.h>
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
