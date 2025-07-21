Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB4CB0C715
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 16:59:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CACDF10E08D;
	Mon, 21 Jul 2025 14:59:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA65E10E55C
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 14:59:27 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-553ba7f11cbso4467505e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 07:59:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753109963; x=1753714763;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0rmsuabFxgO5HQbcS/AHuTJwDw0eGQTKollo0RZOzC8=;
 b=YsJ9cckJIi58TiCnKWE7601uAswn0fQu+x8ph56/xlrj+IIM59U6JDppYx47I/43cq
 55/x0fWULz4aaIcuM9iL/a5s1+8ewIhtotH1oNBEedv7P8NbreXLyrHgUaXxCsODtS7q
 juFt1bG/xuVba4LvJKq5USidgentPdEwWJUHs0QrgfxAc2ygFGYYMPpLz2lqgZwzGDiN
 gZu4Yhrw83wz4smeiMo/C9It11LBdh08Z1n+jSqQO/idPZIvSe9E6QB4Xs0CF260Olb5
 dM/aMCjFnxOivl8/rohZOlT4COpVkZYtkL2NM6LndUJRKcwjCyljndcbrAvNpAoKCvIK
 dC7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJqwJv9Gu57/RGejo3qZHQCdrrMw0l7BA9XPO83OduQVJM0fnQ7kEHgvW5IGrSN91qCTUMJIf1HeU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz28HJtaK9TcsS5NVDe7UjWDT8c2VFZUQxMcRMk7pEK1BQUZOQq
 qDphBGv9YcQS/Yn06GUb138TgGk1RrI3f1oll4iBiLmc4PKOngsixU4g6J/wZbwR
X-Gm-Gg: ASbGncvVtVuh9oF9lZtnRTp73/FA0zQM3zEGdqbwB9cNgj/fe1KWfBx8WCx72JscaJo
 zrEAzlafFjHRmcOvAvBZ7m3qtemujvn6T4nuwWFIjpEc2DFJ2bagUOgTQX28NVOOzj2WRpNXgKn
 VvcWrTaSEtfyF5PxQ4Yu6rv4SL3tcMjGd/knIDjVwQDe6K8C2eyufxBz1XDJSoG4V9j0eb0/Bli
 mL0a7XpQzoVSqGdxnUQZMhaP+zR7gP3NuAlUerpcZfCPdhsaxoQ2DWABOQEHqh6A7YEKW4zXBqd
 3ALiUlY9uL3uZ4p1Q8Lj5dGVWrjjtHgsiLJJt7Wjj+CNDV3IXCmxuiLlXHVe/G8OxuLhDgYDdRi
 LDhQnX+PK6gJX3Js7/yuXvp+7GZ2STkDM5QdQf/4M6yoegFyGN67o/50=
X-Google-Smtp-Source: AGHT+IG+Ogu3s1EECv0ifj5QOZkk0WG6AXYV34YA2pch/mVdvynX79cJ/liL1HSwPSyA7gATTbCdig==
X-Received: by 2002:a05:6512:34ca:b0:55a:3205:b3bd with SMTP id
 2adb3069b0e04-55a3214fb0dmr2894562e87.24.1753109962742; 
 Mon, 21 Jul 2025 07:59:22 -0700 (PDT)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com.
 [209.85.208.182]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55a31a9b939sm1597740e87.12.2025.07.21.07.59.21
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Jul 2025 07:59:22 -0700 (PDT)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-32ce1b2188dso37395031fa.3
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 07:59:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVtRm2exwLvNPmILgdKRA2CprpVPC2Wk8BswbQsyPjWbAlL4WXFZmcil1Vo0A5KLhsXMuozbqkiu4k=@lists.freedesktop.org
X-Received: by 2002:a05:651c:b10:b0:32f:3671:4d6d with SMTP id
 38308e7fff4ca-3309a469ac4mr36664631fa.1.1753109960994; Mon, 21 Jul 2025
 07:59:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250720085047.5340-1-ryan@testtoast.com>
 <20250720085047.5340-2-ryan@testtoast.com>
In-Reply-To: <20250720085047.5340-2-ryan@testtoast.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 21 Jul 2025 22:59:08 +0800
X-Gmail-Original-Message-ID: <CAGb2v6641hLu85FJieWGH5YJsRmxCD1U-tXgStMZtCN1u0sFBQ@mail.gmail.com>
X-Gm-Features: Ac12FXy8xxyVpMZUJXrjnYkRucYHTAN65deHIYaoxabOBlfZwoY8o6UDGEBDiMM
Message-ID: <CAGb2v6641hLu85FJieWGH5YJsRmxCD1U-tXgStMZtCN1u0sFBQ@mail.gmail.com>
Subject: Re: [PATCH v2 01/12] dt-bindings: allwinner: Add TCON_TOP_LCD clock
 defines
To: Ryan Walklin <ryan@testtoast.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>, 
 Chris Morgan <macroalpha82@gmail.com>, Hironori KIKUCHI <kikuchan98@gmail.com>,
 Philippe Simons <simons.philippe@gmail.com>, linux-sunxi@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 dri-devel@lists.freedesktop.org
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
Reply-To: wens@csie.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi.


On Sun, Jul 20, 2025 at 4:51=E2=80=AFPM Ryan Walklin <ryan@testtoast.com> w=
rote:
>
> The Allwinner H700 exposes RGB and LVDS pins as well as a HDMI
> connector. This requires additional clocks for the TCON_TOP as per the
> T507 datasheet (which shares the same die).
>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> ---
>  include/dt-bindings/clock/sun8i-tcon-top.h | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/include/dt-bindings/clock/sun8i-tcon-top.h b/include/dt-bind=
ings/clock/sun8i-tcon-top.h
> index 25164d767835..2a12d047d2e1 100644
> --- a/include/dt-bindings/clock/sun8i-tcon-top.h
> +++ b/include/dt-bindings/clock/sun8i-tcon-top.h
> @@ -7,5 +7,7 @@
>  #define CLK_TCON_TOP_TV0       0
>  #define CLK_TCON_TOP_TV1       1
>  #define CLK_TCON_TOP_DSI       2
> +#define CLK_TCON_TOP_LCD0      3
> +#define CLK_TCON_TOP_LCD1      4

I'm confused as I don't see these new ones used anywhere in the series.

ChenYu
