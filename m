Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20365CDF98D
	for <lists+dri-devel@lfdr.de>; Sat, 27 Dec 2025 13:09:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9572810E276;
	Sat, 27 Dec 2025 12:09:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UqatwP6B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com
 [209.85.217.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D515F10E276
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Dec 2025 12:09:17 +0000 (UTC)
Received: by mail-vs1-f48.google.com with SMTP id
 ada2fe7eead31-5dd6fbe5091so2761304137.1
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Dec 2025 04:09:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766837356; x=1767442156; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C4pmqXk0EtFz5WDIGcxPfWEZMNq3VYE7yOPBLEdClV0=;
 b=UqatwP6B7yLV5H7005JULFcqD0sUwuqAZbJi70aK79opaeho2g7fSzN9R26FkBaH5y
 ZIUlL5JbHIG4iJyfMFifZbRQ3Te0k913k/r/WWp7xeUl80nLoQmreVghG05WJp4LTWyq
 QI9s0OnhDDUmLpY9zWB/l0XDsooaa5/Sz8ubFZGR66gUzdtxIYVZJ7WRopiP6DjnMoDO
 mgP7ps/xY//L/s0S3Oc8j/Ld6XjAzfjrd526yQmOjUNeJvYwLdG6+j2KomuILb91nfIH
 3SL89wF2mks7ZadzzoshW2jdoGOv9pcrC59Bhcn12PHjNX7G2Lk0MOwqwvlMGHV+Pxwe
 Xgig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766837356; x=1767442156;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=C4pmqXk0EtFz5WDIGcxPfWEZMNq3VYE7yOPBLEdClV0=;
 b=DN5IEnH/U2G504P/V5t+u3W/hQkLh7hPZ5rC4ZZ2B/T1d/j78Co3EppMiZZ5hRGKgB
 EHG9v+Ys7WdKRp1H+7t4uLx8NTnfa0LilkyF0NR1yKxu0uVqIMFVQaHoh+LDAG2Fu0Hr
 gEMh9WPCw3PoLX9cI1jf+w4JDXdERfBqZotkLG/m0U4DYUrWiOCkVR5WRJ8VNX39cVC4
 JYbln6jVYp7o5M23ncwyNHw+CUF6BE1/M4HidG/Uu9vYByl8qj9qYx3t7uprn9YtLkX2
 vPl8vlHXgDT4SSnWrtg9Npe/bhsdB0fRw+wbC3Q7KwDYG6va1bhN7npe81J/mEtadMC1
 nj2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWBT5INxnLryuLTKSx4eskl3pvM+XOimmtVuwLe13eqO/FQM9xJlILrOiNKfxZcE3+OPG0zR7kC4FY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwG5mS60WsZbkguHQfh0enjEodvBycggDJYtSbNpNVAa3hn/kCg
 YgFHkwW2XUh8c5IzES8D0n19WOD6EB7lSbFRmRhKJxQnmb3AQ00gPNDP3T1fRteynMZGnBUNVDB
 PufY4/Ae00ddQzMH8SWrWkIP7vpH5/pA=
X-Gm-Gg: AY/fxX7+8KJ1SmCtaTvsiszaTY0TtDZ99/nnazKHF7zyC587KRLa8qczFav2wTCZ+Wm
 Urzyd4G/LvrqaoYMPTSM/n91PnhxUnzLD74kqs25TLa4dnPSKsgDC3FhDagXGwm0KCNcm++7KmC
 vNgk8fjxDCeuocelQo6JhWQC75MCwax0wgOiGLWTktL8mi76ZM+d8YQKyR7awtF+yLkK6pXU1R3
 KpX6jWjKDDN2u9X9Mxyl3PEY0tAR5k8srSViUqy4Bfxr1YwTm+6vC6cHhUDEI/TVnVseHjgxlCD
 IhuBGUqjSsnSLI7a/e/H5TzFjdqq7A==
X-Google-Smtp-Source: AGHT+IHCI6g/ZcH8WxoAguomG9H+0RcxTowBWMH66U8Vn7rFb2ZaVRNRJil8fidWKQpB5C+AXc0O72bA9Zqnln8RFgU=
X-Received: by 2002:a05:6102:a52:b0:522:86ea:42c with SMTP id
 ada2fe7eead31-5eb1a67f46dmr7691666137.11.1766837356185; Sat, 27 Dec 2025
 04:09:16 -0800 (PST)
MIME-Version: 1.0
References: <20251224161205.1132149-1-zhengxingda@iscas.ac.cn>
 <20251224161205.1132149-3-zhengxingda@iscas.ac.cn>
 <D5A173F1-D439-49FB-A4A0-B632550BF35B@gmail.com>
 <20251227-gigantic-handsome-falcon-3c31bf@quoll>
In-Reply-To: <20251227-gigantic-handsome-falcon-3c31bf@quoll>
From: Han Gao <rabenda.cn@gmail.com>
Date: Sat, 27 Dec 2025 20:08:34 +0800
X-Gm-Features: AQt7F2qvV9yB9z9hjzYqLCqLd_KsLskJTAvwrLIAwyZAGVkNyOZ5cAZZ8zWHuds
Message-ID: <CAAT7Ki9m+MD2_EntEt=-2ZPFxbMNt6LV_kZu-aAvGZ70e_SUhw@mail.gmail.com>
Subject: Re: [PATCH v4 2/9] dt-bindings: display: add verisilicon,dc
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Icenowy Zheng <zhengxingda@iscas.ac.cn>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>,
 Fu Wei <wefu@redhat.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Heiko Stuebner <heiko@sntech.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Michal Wilczynski <m.wilczynski@samsung.com>, Yao Zi <ziyao@disroot.org>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Icenowy Zheng <uwu@icenowy.me>
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

On Sat, Dec 27, 2025 at 7:09=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Thu, Dec 25, 2025 at 05:45:00PM +0800, Han Gao (Revy) wrote:
> > > +            dpu_out_dp1: endpoint@1 {
> > > +              reg =3D <1>;
> > > +              remote-endpoint =3D <&hdmi_in>;
> > > +            };
> > > +          };
> > > +        };
> > > +      };
> > > +    };
> > > --
> > > 2.52.0
> > >
> >
> > Tested-by: Han Gao <gaohan@iscas.ac.cn>
>
> NAK, not true. Otherwise explain me how can you test the bindings.
>
>
I cherry-picked the patches I gave to Tested-by on my test branch,
compiled and ran them on Lichee Pi 4a.
All the relevant patches were also given to Tested-by.
