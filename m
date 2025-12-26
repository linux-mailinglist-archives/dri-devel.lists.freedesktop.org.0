Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ECF2CDEBC9
	for <lists+dri-devel@lfdr.de>; Fri, 26 Dec 2025 14:25:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99BBF10F25D;
	Fri, 26 Dec 2025 13:25:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="KoKUru12";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E719810F25D
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Dec 2025 13:25:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A0BF94442F
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Dec 2025 13:25:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76A55C2BCAF
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Dec 2025 13:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1766755516;
 bh=N+qW2ZxSsuwmsYTva/gQOv+mTm92bNRglN2W548IvcA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=KoKUru127MmKqpxOtiKtGZVqos42eS2rV+eZZsCt+pHnhHZYX5uwop4XJ1sNx58/C
 iqnHS22FY3rlWBOKEeslx9wyieiDW53wLUVHmHzweQ9JkNimISJDRmMdOMbo49CS1R
 h+pboSIW7cIjrgUV6ILI3naWHXoC84rhRaOAHTHasvK7SWl2mkdWjYNQ2+3cNyKWWJ
 rLEtCUmBxZqCkn2g/hyqIFbNsSMDzgHa9eewCCTXdMEf5HISN1FGEvkR7TAtBXlSp8
 COKBmfbpTkx293y/H6dGRk6EN5DU2svPtFOWNhZbphoR+nf3WEjO9XZ2QUE01DTTC8
 DSvBfR28e7APA==
Received: by mail-yx1-f47.google.com with SMTP id
 956f58d0204a3-64669a2ecb5so6815021d50.1
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Dec 2025 05:25:16 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVWM7jJkoJvJ6XX2Qpu98i+4GSb+zyEok0fB8WXto8XVU9xmMVTpNq3xOQ8jgWmUCIcAHpn0feSYUs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxWzLELJX1COj/FHVUgp/VyQjkadhsko9mnc7MHniGWg2leuX7s
 K6lRjEcdWQ1vFcFO5Br+9/uVIccjd/Cx4gKauuDTjZNeoXKUUeKNcYNnDyxmASMPeOWrv2aANuX
 BoWfCxlWKd/UUNnW4khuGXlFnGAAxwnY=
X-Google-Smtp-Source: AGHT+IHMzaKONrzGJpNhXsdknH/aicOLZRUDH4SPgdgpx5CWGFJAOAxyt9BwJTfc6IFbfEyFRCcvwGHe8FMXyOD1eRI=
X-Received: by 2002:a05:690e:2519:10b0:641:f5bc:6930 with SMTP id
 956f58d0204a3-646632e007bmr15196355d50.41.1766755515738; Fri, 26 Dec 2025
 05:25:15 -0800 (PST)
MIME-Version: 1.0
References: <20251222-drm-panels-sony-v2-0-82a87465d163@somainline.org>
 <20251222-drm-panels-sony-v2-4-82a87465d163@somainline.org>
In-Reply-To: <20251222-drm-panels-sony-v2-4-82a87465d163@somainline.org>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 26 Dec 2025 14:25:04 +0100
X-Gmail-Original-Message-ID: <CAD++jLmSev3=HJF1j_kTU5j-u2NhxH6TsdE0uUjnD7Vqkt_h-w@mail.gmail.com>
X-Gm-Features: AQt7F2pPUaVNesdOAXSUmIYRXMzhy6HJ5toLN43bCtVtfp2IOUez4k0c74ZILyE
Message-ID: <CAD++jLmSev3=HJF1j_kTU5j-u2NhxH6TsdE0uUjnD7Vqkt_h-w@mail.gmail.com>
Subject: Re: [PATCH v2 04/11] dt-bindings: display: panel: Describe Samsung
 SOFEF01-M DDIC
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>, 
 Casey Connolly <casey.connolly@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Simona Vetter <simona.vetter@ffwll.ch>, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>, 
 Martin Botka <martin.botka@somainline.org>,
 Jami Kettunen <jami.kettunen@somainline.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Konrad Dybcio <konradybcio@kernel.org>, 
 Dmitry Baryshkov <lumag@kernel.org>
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

Hi Marijn,

thanks for your patch!

On Mon, Dec 22, 2025 at 12:32=E2=80=AFAM Marijn Suijten
<marijn.suijten@somainline.org> wrote:

> Document the Samsung SOFEF01-M Display-Driver-IC and 1080x2520@60Hz
> command-mode DSI panels found in many Sony phones:
> - Sony Xperia 5 (kumano bahamut): amb609tc01
> - Sony Xperia 10 II (seine pdx201): ams597ut01
> - Sony Xperia 10 III (lena pdx213): ams597ut04
> - Sony Xperia 10 IV (murray pdx225): ams597ut05
> - Sony Xperia 10 V (zambezi pdx235): ams605dk01
> - Sony Xperia 10 VI (columbia pdx246): ams605dk01
>
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
(...)
> +      - samsung,sofef01-m-amb609tc01 # 6.1"
> +      - samsung,sofef01-m-ams597ut01 # 6.0"
> +      - samsung,sofef01-m-ams597ut04 # 6.0"
> +      - samsung,sofef01-m-ams597ut05 # 6.0"
> +      - samsung,sofef01-m-ams605dk01 # 6.1"

So is the assembled product really named like that?

Samsung S0FEF01-M AMS605DK01?

I would more expect the compatible strings to be excluding the DDIC
name, like:

samsung,ams605dk01

...but it's not like the vendor is helping us here, so I'm practically
fine either way. They are clearly using the S0FEF01-M display
controller.

Yours,
Linus Walleij
