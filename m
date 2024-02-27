Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF3F868A81
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 09:09:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D5F210E343;
	Tue, 27 Feb 2024 08:09:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com
 [209.85.219.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E70EB10E343
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 08:09:54 +0000 (UTC)
Received: by mail-yb1-f174.google.com with SMTP id
 3f1490d57ef6-dcc73148611so4151117276.3
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 00:09:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709021393; x=1709626193;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0oNxsCY0M4jeXi/rHTScBBRSGzK8KOWMJG/0W06N5ho=;
 b=eLXpCRgDMxcO5j+Du8VAGicSQlBttLB+s1LW3r27I+olbqE1DeoBc3vx6aaaHLSUYj
 wUgff1d8A1yyj+sl/wXUVqktUhsXWs80gcnB1HELDXACdS1ciF4Kc1U0313cHdGooXZ3
 S8ouNiflNX49MKLn+lryoWKUycHLMBgqkSaQeSvQAfKanV7tc9M+hen6t26cBhsqIHfy
 R9ctLWIytgZPbJDgaUzKq1bKhAz8IZC0fdy0CU0bnXQqwtBVNdyzk5gQBTN6fmRpFhhC
 /B7BZA5mFGa9d+WMXdBSlZnnXKAMqGYdXVGlUUm4fzfqwcSi6VbJksJbN3ufcziPUbiO
 rcFQ==
X-Gm-Message-State: AOJu0YyyZkngHAzRIB1k7ZT14nxmKdvpY66/07Dgf1A32//hIbRi/vGj
 HQ+kFyjh99a6TCgplhx+QzD77mUN+GW4VmJ3gB5pVpegMtYBJPyoW1Vs32J6x2s=
X-Google-Smtp-Source: AGHT+IFZvEDwJIpIEyS7UkHUCZI7NMeZYRgBxK1+avvwlqxSkPtQGDu2LbkCCaXLPAKOYXK3jFvdYA==
X-Received: by 2002:a25:ab68:0:b0:dcf:ad1e:f16b with SMTP id
 u95-20020a25ab68000000b00dcfad1ef16bmr573029ybi.50.1709021393197; 
 Tue, 27 Feb 2024 00:09:53 -0800 (PST)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com.
 [209.85.219.182]) by smtp.gmail.com with ESMTPSA id
 x14-20020a056902050e00b00dcc45635f27sm1283870ybs.18.2024.02.27.00.09.52
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Feb 2024 00:09:52 -0800 (PST)
Received: by mail-yb1-f182.google.com with SMTP id
 3f1490d57ef6-dc236729a2bso3666119276.0
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 00:09:52 -0800 (PST)
X-Received: by 2002:a05:6902:4ea:b0:dc2:4397:6ad3 with SMTP id
 w10-20020a05690204ea00b00dc243976ad3mr1606683ybs.44.1709021392447; Tue, 27
 Feb 2024 00:09:52 -0800 (PST)
MIME-Version: 1.0
References: <20240227034539.193573-1-aford173@gmail.com>
 <20240227034539.193573-3-aford173@gmail.com>
In-Reply-To: <20240227034539.193573-3-aford173@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 27 Feb 2024 09:09:40 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWvSvosV6E5P9cY6dum9C-McJ8q0fOZE58zp4TZYUOKBw@mail.gmail.com>
Message-ID: <CAMuHMdWvSvosV6E5P9cY6dum9C-McJ8q0fOZE58zp4TZYUOKBw@mail.gmail.com>
Subject: Re: [PATCH 2/6] arm64: dts: renesas: r8a774a1: Enable GPU
To: Adam Ford <aford173@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, 
 aford@beaconembedded.com, Frank Binns <frank.binns@imgtec.com>, 
 Matt Coster <matt.coster@imgtec.com>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Tue, Feb 27, 2024 at 4:46=E2=80=AFAM Adam Ford <aford173@gmail.com> wrot=
e:
> The GPU on the RZ/G2M is a Rogue GX6250 which uses firmware
> rogue_4.45.2.58_v1.fw available from Imagination.
>
> When enumerated, it appears as:
>   powervr fd000000.gpu: [drm] loaded firmware powervr/rogue_4.45.2.58_v1.=
fw
>   powervr fd000000.gpu: [drm] FW version v1.0 (build 6513336 OS)
>
> Signed-off-by: Adam Ford <aford173@gmail.com>

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
