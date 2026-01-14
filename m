Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B20D1E3C0
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 11:53:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34B0510E58A;
	Wed, 14 Jan 2026 10:53:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f196.google.com (mail-vk1-f196.google.com
 [209.85.221.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABE5010E58A
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 10:53:28 +0000 (UTC)
Received: by mail-vk1-f196.google.com with SMTP id
 71dfb90a1353d-5636274b338so656808e0c.1
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 02:53:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768388008; x=1768992808;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=7nBfD023nU+/m9RS1/PqlUjs/Tm6bQqk3JW3sWTwihE=;
 b=WSyv1UNyRfhg/J/zI5gHIGOo18quQACf04UZ6tjuEF/iEXd1QesG3H44ALHfOiIEPs
 EDgb1hNv4UUr/lPQA/eFVGd2yoJ4yOPjjwMCdAG7ZVF8KhUKyJ9kuoslxymaWS+dOClC
 49j8ALXRA/b8JxL5YTIa1qiaBGZ7/GdsW7brpqPf0+x/Rcq8Bj9ffBWhGtg1bO4vxv2R
 at5GgOaaTZYld6kwe6kZbPRhtcwTr24zZK3IevFb2AW60BuQKoiuU0MTLkQEkAZyXXn7
 diHj/8agoTQVFDOxsgh0Z6wiYFjzcuFoECQsjA9Iv/GZsxFO/0sHsZIQXdU12Ld3UqU8
 BLrA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+ACdjWbnEAbwKUu4Tq/F/6X1yt1mTjC1zt5gId1PfDjF2erg59HIBVc012hN5S1koPvA0j4aWheA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzA45LX9p+rvYEO6ApZuMILSJXzDex3qtiFfx4gOKJ75eahBYP2
 3sAgC58z6qY5FPL04nShblp6rJ2nsnmK9rGtZ4y/rB2H+AtrMvTsJhvyXh0MWs8ER6c=
X-Gm-Gg: AY/fxX4SLD1CDuzBbRMH8igVRoSADx3pUQcNvpXiedmYnzKgmjAuDuoaptqFPsfreH5
 V0f3SqHpe3rul0Rn4PYQEtEUvbZt65oJkaIckuaoGb+0NTNvPvZt/3Xk3Mrf2hGJePv7wOB4DHm
 /mz1YaEEsIkdGJHf6+W6hLB1DP0wsUECMCp5KV8cbK07/nuaBamEc38zdLhXgKW0LZDMf0gNkMk
 RWY7eqDbSqZK3QPbYdPlHMR17QTtVrdFnzUnOMCrc3nhQQwDdx16Y0jfILhLouJxI6WZp8zHfyW
 wTuynAwH7DfZ9T5NSkU2IrSjl9/wa4aUOqfMJHNp6lwzCTRY3gHj/1zm7AzkIsTlHfr6S786hW1
 iLvSLPVMVOgkjKZEVB4HrUEiAtEBH7Dv3vBbEeIq17yOgWlrXxKDks0KvABhfp7uYTHWCs2SDaK
 uotPpK+DYLt8/4EXNsQ06VgGCEqys7ozSSe4xyNNDu0dFsGhuVLSRSFl1ssuI=
X-Received: by 2002:a05:6122:20a6:b0:563:70b2:a5aa with SMTP id
 71dfb90a1353d-563a10012famr716727e0c.8.1768388007562; 
 Wed, 14 Jan 2026 02:53:27 -0800 (PST)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com.
 [209.85.222.49]) by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-5634d9162a4sm20662713e0c.15.2026.01.14.02.53.27
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jan 2026 02:53:27 -0800 (PST)
Received: by mail-ua1-f49.google.com with SMTP id
 a1e0cc1a2514c-93f63c8592cso532879241.1
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 02:53:27 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWUxDDrSByI80+lSAL05GgN5fnCpmsH/KeT6+ZykxLEiSkvEA8SmwupzpWKXN4IZsrqQyF0U0+M0DM=@lists.freedesktop.org
X-Received: by 2002:a05:6102:5792:b0:5ef:a416:be63 with SMTP id
 ada2fe7eead31-5f16cba55cdmr3059465137.22.1768388007165; Wed, 14 Jan 2026
 02:53:27 -0800 (PST)
MIME-Version: 1.0
References: <20260104222653.1659382-1-niklas.soderlund+renesas@ragnatech.se>
 <20260104222653.1659382-2-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20260104222653.1659382-2-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 14 Jan 2026 11:53:16 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX+djJyRsAZW9e38=oP5G1UBZ2ng0Kw6C-7r+4JMVzyug@mail.gmail.com>
X-Gm-Features: AZwV_Qjxm-3tOn4PgFSCctakzFrk_Fo1JWYSMTv7eBgch034dmEmYfCJ9BCweb4
Message-ID: <CAMuHMdX+djJyRsAZW9e38=oP5G1UBZ2ng0Kw6C-7r+4JMVzyug@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: gpu: img, powervr-rogue: Document GE8300
 GPU in Renesas R-Car D3
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 David Airlie <airlied@gmail.com>, Frank Binns <frank.binns@imgtec.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Magnus Damm <magnus.damm@gmail.com>, Matt Coster <matt.coster@imgtec.com>, 
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, 
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
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

On Sun, 4 Jan 2026 at 23:28, Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Document Imagination Technologies PowerVR Rogue GE8300 BNVC 22.67.54.30
> present in Renesas R-Car R8A77995 D3 SoCs.
>
> Compared to other R-Car Gen3 SoCs the D3 only have one power domain and
> it is always on. Extend the list of special cases for R8A77995 to
> capture this.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

For the contents:
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
