Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52643A11F97
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 11:33:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA90E10E5BC;
	Wed, 15 Jan 2025 10:33:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com
 [209.85.217.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 376E410E5BC
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 10:33:37 +0000 (UTC)
Received: by mail-vs1-f48.google.com with SMTP id
 ada2fe7eead31-4b10dd44c8bso2060838137.3
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 02:33:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736937214; x=1737542014;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zL/VhawMqdkK0mqwrQDIuo0f3MoKOJdYdsbaS2CXGCQ=;
 b=G1TlUQ+4F8p7yg4kfN3zF9iYz6ERnYj0Pl3Dnsm50XSofm3QsSq8s4mbitXfSrQZKm
 2i/8vsFtAYRKqEWFLv1FKgeFgp8TlQspUTOm05DoszKdq/I1oIcrgZwzwRKJPCRzM0Fd
 SOTj5axjF1UE6mct7bPfAMEnrGbiFwNiJNCLjswB7z5HjhVsPArGmN3+tvFwk3Ajha9+
 eCGfc9guWQaeShhAF5k7DFl38vSZZ72qEkvVkVJknAXyTKuziqF3HU8QE5FdMoRbEqyP
 zJNoBby72qQIcHMhFrLhk172yYGxlErlAaeaUmcEhVQaB9uVhiwN0yY2TCVLvJQLjqAh
 g3Cw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXK/J4ZVgSdTdTGlRbI1FYO6GxIUC7xDawI1hH7AuRnEOKQcb78QweV9TVZvG1C5nxKyGqoJsfpdMA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyGMKkGzBU59GCNx/SwyO+KFj4NhZiBN4DaYg1IroyTxdgHVMMI
 B8v26plIVt0KakSU6k4JSu97XdkDD5qlXf4kZxtI+2/0i23oN1OhXbWynkQT
X-Gm-Gg: ASbGncskpRVW23uTwxwaLsiVmU0Q+d79crXKHm0iguOpm5D5wXDoe6aZxIWAgGzNHXQ
 hhPAB6FgPfimn14RvxpT2Szx4wfn65FQKf2LrnqM8pzi3xKfnXFzEDYq6oWxHRmTy5IBLQXVpvI
 TJQQyOiT4XvcpXNUMwuzaWj2QgSh+Q9w3ELEH/FIQ077KyGgbJ6hzYnlUkaSV7mAiT6Ew3WGZvG
 NQ4bGeNL8wOWWF0UnptLDPnBRoer8JvQtzNMzHQq5uwNdWIX4YjnM2LRRisX6DgJVkH0wcQXIRk
 P8ajRQuohpD0EEVTVaw=
X-Google-Smtp-Source: AGHT+IHtSSTUgW7SUnvpXjYfpy1eliuAymIHD3bvtyGNsxf7AZ1zCQXvwYLbYcWmWNzVhvmjrkZUFQ==
X-Received: by 2002:a05:6102:a49:b0:4af:f1fb:1c36 with SMTP id
 ada2fe7eead31-4b3d0f9484emr24938006137.8.1736937213980; 
 Wed, 15 Jan 2025 02:33:33 -0800 (PST)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com.
 [209.85.217.43]) by smtp.gmail.com with ESMTPSA id
 a1e0cc1a2514c-862315790c3sm5697359241.31.2025.01.15.02.33.32
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jan 2025 02:33:33 -0800 (PST)
Received: by mail-vs1-f43.google.com with SMTP id
 ada2fe7eead31-4b24d969db1so1738398137.0
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 02:33:32 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUd1r53JtuuETz7oAYrCXj8R/jD14wqbBz/umiFDDzlesZaXC2efqZ3EUIk6nRUtlxa4Fn8nt6lr1w=@lists.freedesktop.org
X-Received: by 2002:a05:6102:b09:b0:4b2:cca7:7d51 with SMTP id
 ada2fe7eead31-4b3d10482d8mr25112112137.19.1736937212681; Wed, 15 Jan 2025
 02:33:32 -0800 (PST)
MIME-Version: 1.0
References: <20250115-xilinx-formats-v2-0-160327ca652a@ideasonboard.com>
 <20250115-xilinx-formats-v2-4-160327ca652a@ideasonboard.com>
In-Reply-To: <20250115-xilinx-formats-v2-4-160327ca652a@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 15 Jan 2025 11:33:21 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXwsdP3_3b_OWFZ8J=kuNCga0h5Vo+wR0fdquQjZNuzEw@mail.gmail.com>
X-Gm-Features: AbW1kvb1Mw4yh70skw6jyTVk4uvwGUIHSALmg8qZGE_Zuk6TjwfomZ94w4ClmYw
Message-ID: <CAMuHMdXwsdP3_3b_OWFZ8J=kuNCga0h5Vo+wR0fdquQjZNuzEw@mail.gmail.com>
Subject: Re: [PATCH v2 04/10] drm/fourcc: Add DRM_FORMAT_Y10_LE32
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Vishal Sagar <vishal.sagar@amd.com>,
 Anatoliy Klymenko <anatoliy.klymenko@amd.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Michal Simek <michal.simek@amd.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi,

On Wed, Jan 15, 2025 at 10:04=E2=80=AFAM Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:
> Add Y10_LE32, a 10 bit greyscale format, with 3 pixels packed into
> 32-bit container.
>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Thanks for your patch!

> --- a/include/uapi/drm/drm_fourcc.h
> +++ b/include/uapi/drm/drm_fourcc.h
> @@ -408,6 +408,7 @@ extern "C" {
>  /* Greyscale formats */
>
>  #define DRM_FORMAT_Y8          fourcc_code('G', 'R', 'E', 'Y')  /* 8-bit=
 Y-only */
> +#define DRM_FORMAT_Y10_LE32    fourcc_code('Y', 'P', 'A', '4')  /* [31:0=
] x:Y2:Y1:Y0 2:10:10:10 little endian */

R10_LE32? Or R10_PA4?

Does LE32 have a meaning?  My first guess just reading the subject
was wrong ("little endian  32-bit" ;-)

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
