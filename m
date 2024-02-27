Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5294E868A96
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 09:12:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5011110E452;
	Tue, 27 Feb 2024 08:12:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com
 [209.85.128.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8D9710E452
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 08:12:50 +0000 (UTC)
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-6087d1355fcso22886967b3.0
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 00:12:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709021567; x=1709626367;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uHn2r0gOJkRntSoutMiiF0ECORnR9mSgKiX3cgiGkQA=;
 b=hPyR57pokmFJ3K0eKdoBNPfafKluKVAJR9gQBgRMxQniwmeK2aobXgShfoSTG1TBQf
 2kzYwyhSv/t0Py13gLq6sCjev0EMNUnDuqhjtWcSQou++g0fGvbbvgY+vWddrvZy5Vci
 2j0NLDsaiqFb4fqjUzgv2NMDWklbx73sTysfd9NCg48idPnrT2KM7jKN79D1DmUgz5Ik
 4Eb+bL+u9Jjy4TsJjF1JxexDN3Lw/ooml+cngR3wFz+e/ut2zXWysqQ3uoDXu5xIyh/W
 wdVzOjdRGR9ZnugPl3HTSKJu4ZrrC/4Q+3Z7t5xzzf+qPb3WMQMqxUyffJtND416rlrg
 NW5w==
X-Gm-Message-State: AOJu0YyI2Cqu2lcJm7cCdeN2RZMHw8VoNhzHwcy2/37Lo6O2y+vwtAxI
 DGZYjY/TXpZ1Pozm5ecP8HBPHmfeFQ5zSbEs9DharovDNk8WFWj0VV34ckshZ8Y=
X-Google-Smtp-Source: AGHT+IG3Tk60DKiF8CtxLYi64q8gAA4/HB+l2Y9AVo2VguF4gWYaVAvWVKbWk2iSIZ9w0oeAqWotSg==
X-Received: by 2002:a05:690c:11:b0:608:b83e:c346 with SMTP id
 bc17-20020a05690c001100b00608b83ec346mr1884614ywb.25.1709021567679; 
 Tue, 27 Feb 2024 00:12:47 -0800 (PST)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com.
 [209.85.219.170]) by smtp.gmail.com with ESMTPSA id
 i3-20020a0df803000000b006049c16b843sm1634239ywf.145.2024.02.27.00.12.46
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Feb 2024 00:12:47 -0800 (PST)
Received: by mail-yb1-f170.google.com with SMTP id
 3f1490d57ef6-dc238cb1b17so4236657276.0
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 00:12:46 -0800 (PST)
X-Received: by 2002:a25:b121:0:b0:dcb:be59:25e1 with SMTP id
 g33-20020a25b121000000b00dcbbe5925e1mr1585696ybj.30.1709021566147; Tue, 27
 Feb 2024 00:12:46 -0800 (PST)
MIME-Version: 1.0
References: <20240227034539.193573-1-aford173@gmail.com>
 <20240227034539.193573-6-aford173@gmail.com>
In-Reply-To: <20240227034539.193573-6-aford173@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 27 Feb 2024 09:12:34 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXJEeD_2CRTk3UCR9BCUWj1K42-V+Nhz3=DO73AOUa24g@mail.gmail.com>
Message-ID: <CAMuHMdXJEeD_2CRTk3UCR9BCUWj1K42-V+Nhz3=DO73AOUa24g@mail.gmail.com>
Subject: Re: [PATCH 5/6] arm64: dts: renesas: r8a77960: Enable GPU
To: Adam Ford <aford173@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, 
 aford@beaconembedded.com, Frank Binns <frank.binns@imgtec.com>, 
 Matt Coster <matt.coster@imgtec.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
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
> The GPU on the R-Car M3-W is a Rogue GX6250 which uses firmware
> rogue_4.45.2.58_v1.fw available from Imagination.
>
> When enumerated, it appears as:
> powervr fd000000.gpu: [drm] loaded firmware powervr/rogue_4.45.2.58_v1.fw
> powervr fd000000.gpu: [drm] FW version v1.0 (build 6513336 OS)
>
> Signed-off-by: Adam Ford <aford173@gmail.com>

On Salvator-X with R-Car M3-W ES1.0:

    powervr fd000000.gpu: [drm] loaded firmware powervr/rogue_4.45.2.58_v1.=
fw
    powervr fd000000.gpu: [drm] FW version v1.0 (build 6513336 OS)
    [drm] Initialized powervr 1.0.0 20230904 for fd000000.gpu on minor 1

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

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
