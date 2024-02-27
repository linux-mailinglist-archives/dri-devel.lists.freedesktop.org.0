Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78089868AA0
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 09:13:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84B3A10E895;
	Tue, 27 Feb 2024 08:13:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com
 [209.85.219.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F72B10E895
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 08:13:14 +0000 (UTC)
Received: by mail-yb1-f171.google.com with SMTP id
 3f1490d57ef6-dcc7cdb3a98so3987686276.2
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 00:13:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709021592; x=1709626392;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XVOe12NY6Hd6XHyETGn8V8NNE5eD7ofZbpGZVlTMsYw=;
 b=nZMCiUdPrevb//aDi2vI8ee7CoBheb8PwMbyTSzVmPJ5QugbtSe4yxwEAM99F6R+TF
 rttu1krbB+EBjpFZjVBkuxXZnn638/XqmaVD3rHkDd4S5RibmLKTWiMDO+lhJnpTWYnU
 XhILmHLzS1H2EurfjHnKfoehc+WYk8FlTAwboTRlDyKDEJnDGwdL8hf5MKn8pAYs97fE
 p+6H6Cp3j58o0ZmmKVIkSMnW4e6q8G/w6g0TbFd3Y7LDxhvRwQS5rbdk25R3WhPsyC9W
 HNaNjLiNUMibQgSYbdrj9Hl2OcUqUA/4B43oR3agbVFLb6mYHkLuC+Dl5Xw06J4QmK96
 KjWg==
X-Gm-Message-State: AOJu0Yzic2732si6N8X/02ZJuxosQKIEpeyQm5vw1ejDc9Mnh68j0Ra3
 Su0x8Em/lA/ju9hDfblam9rEle7VoYb/OhkORFipAn5Q388By8dpagQEHueCrXY=
X-Google-Smtp-Source: AGHT+IHoD3UwfozoWPFejLW0ZSaU33mJt9KaT9PplQ1XJy8rAhKr17h6MHrmym9mgUgEF9VisoB0uQ==
X-Received: by 2002:a5b:7d0:0:b0:dcc:6e60:7024 with SMTP id
 t16-20020a5b07d0000000b00dcc6e607024mr1371840ybq.45.1709021592622; 
 Tue, 27 Feb 2024 00:13:12 -0800 (PST)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com.
 [209.85.219.169]) by smtp.gmail.com with ESMTPSA id
 h8-20020a255f48000000b00dcda5ddeccasm1275748ybm.30.2024.02.27.00.13.12
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Feb 2024 00:13:12 -0800 (PST)
Received: by mail-yb1-f169.google.com with SMTP id
 3f1490d57ef6-dcc7cdb3a98so3987672276.2
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 00:13:12 -0800 (PST)
X-Received: by 2002:a25:ce11:0:b0:dcf:a52d:6134 with SMTP id
 x17-20020a25ce11000000b00dcfa52d6134mr1335614ybe.26.1709021591812; Tue, 27
 Feb 2024 00:13:11 -0800 (PST)
MIME-Version: 1.0
References: <20240227034539.193573-1-aford173@gmail.com>
 <20240227034539.193573-7-aford173@gmail.com>
In-Reply-To: <20240227034539.193573-7-aford173@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 27 Feb 2024 09:12:59 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXtO9nnGWtqP9P5Qw98gsdf3ayHJ=nW_F3AcNk_3egGkw@mail.gmail.com>
Message-ID: <CAMuHMdXtO9nnGWtqP9P5Qw98gsdf3ayHJ=nW_F3AcNk_3egGkw@mail.gmail.com>
Subject: Re: [PATCH 6/6] arm64: dts: renesas: r8a77961: Enable GPU
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
> The GPU on the R-Car M3-W+ is a Rogue GX6250 which uses firmware
> rogue_4.45.2.58_v1.fw available from Imagination.
>
> When enumerated, it appears as:
> powervr fd000000.gpu: [drm] loaded firmware powervr/rogue_4.45.2.58_v1.fw
> powervr fd000000.gpu: [drm] FW version v1.0 (build 6513336 OS)
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
