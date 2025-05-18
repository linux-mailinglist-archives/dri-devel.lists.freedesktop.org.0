Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD56ABB0EA
	for <lists+dri-devel@lfdr.de>; Sun, 18 May 2025 18:45:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C207810E0B4;
	Sun, 18 May 2025 16:45:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com
 [209.85.166.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CF6F10E0B4
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 16:45:33 +0000 (UTC)
Received: by mail-il1-f169.google.com with SMTP id
 e9e14a558f8ab-3db8356ee37so10497155ab.3
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 09:45:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747586728; x=1748191528;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=16lKLKeXiKEhT1aqzPTlfh1MfJCWJqXdbVQD33iMWeM=;
 b=mLVQSpfxkEmyawAIqy4Lh8o9VrbH9AuHTGtBpAAsBaCJ0YmUwOcl3vT6e8a4LHEtBS
 ijocmqef/D3C/ntU7e2w1TR3YXcECrOCFWF9kTMzeybXOYAZF2q2t3k2eOZEzsjhmMpf
 LGfP8G+rgSPxKmpZiNZz7ucXfVYWNh5P/Gtx3lgoh0QDQR4T2Or2cxtO7S/h4QDs4ocP
 MwFDKZ3DMNAY/YoiKTLJMgfCR+p/42pOMe1ntUxW16+Z/4yyWBnMf8aek+6BFn3tGfvq
 4/WNdqF14jceSROSPv2XGVM2armTSafaKMDreaeEiJcbDUveYZ/vm9Rs2qfTk0FFxV2e
 qbEg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVAH9z1AY/1q7YG5UAXbZgUxA0hFY8ARtvrSAMYltfI5XsB6CNBHI3O19qe9SMpSyUgvCvc5rQQRzg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyHsUkt44ojmg4hTz5Svq+o7Aj7AE4lZRYokw6zqvw5Axg2Pn/A
 OvOdH5oWXbh+SyzD1IpokFA5BJ88DrohrSy0erRsmEF7k7tTxPNLF4KGqfuHdyLs9Kc=
X-Gm-Gg: ASbGnctLulyFmdppMp1f5qN/IEhUdCEQsCfmxzpxiWO7E2ts9QsHeRhccaE6oFI35Q/
 3RkXZAdP0hV/z1P/DmZBs5261n7zQ6wqykKXOQ35dm/uIoEJKokS2Fd0B3jvCjAvCxZ6JKQ+V7L
 rpl/L8nYP7KJtYyo7HtU+Y4TBLHfPK7TyurfNLLo53z/d2SB1sGpoyx/J6T8jo2FLZNYZOhpeCF
 0COZO/k03bZqFwVkugVZwu764B7AAOVvGDKQAnDQ4o9EO6xg/cqK8M2y1I38zHlW68srz+E13Vj
 3NP+/nn1oksexUHn53YlnJtcRUgIGeJVVFgdAkW39vqHjcLed2RV/Yl28jU4ufhBOtUwKSxCz0G
 +U3P7KEwIxP+obtn2UXs=
X-Google-Smtp-Source: AGHT+IGWwc0I7E+hypT9Slqja8t41BZC3h1aCess5Hxu4HTkzPEZTizATQQRwqrxCM41/dFj9VS9ow==
X-Received: by 2002:a05:6e02:1a02:b0:3db:6fb4:b7e5 with SMTP id
 e9e14a558f8ab-3db85739455mr84754295ab.10.1747586728140; 
 Sun, 18 May 2025 09:45:28 -0700 (PDT)
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com.
 [209.85.166.182]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4fbcc3b199fsm1350643173.42.2025.05.18.09.45.26
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 May 2025 09:45:26 -0700 (PDT)
Received: by mail-il1-f182.google.com with SMTP id
 e9e14a558f8ab-3dc6b2a8647so1491365ab.2
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 09:45:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVFXISGC8yKzDpuJfHUnSjzrUxgeJoR/SN3WwT/GZ+Dys0z3dV76c8bIRZshAD+F1wTEr3PGF8Qpow=@lists.freedesktop.org
X-Received: by 2002:a05:6e02:351d:b0:3d0:47cf:869c with SMTP id
 e9e14a558f8ab-3db857b6555mr99202655ab.19.1747586726194; Sun, 18 May 2025
 09:45:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250516105101.11650-1-ryan@testtoast.com>
 <20250516105101.11650-7-ryan@testtoast.com>
In-Reply-To: <20250516105101.11650-7-ryan@testtoast.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 19 May 2025 00:45:12 +0800
X-Gmail-Original-Message-ID: <CAGb2v65S2B2tatzJP3fJKcEYaoX-UGG2MtQX1VbUoTK4xTsyxg@mail.gmail.com>
X-Gm-Features: AX0GCFslyTJW3_SklNq3JULGeTuerD-gifQjm7kfUwjIWTbHbiDIUF58cpuqmoU
Message-ID: <CAGb2v65S2B2tatzJP3fJKcEYaoX-UGG2MtQX1VbUoTK4xTsyxg@mail.gmail.com>
Subject: Re: [PATCH v11 6/8] drm: sun4i: de33: mixer: add Display Engine 3.3
 (DE33) support
To: Ryan Walklin <ryan@testtoast.com>
Cc: Maxime Ripard <mripard@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Andre Przywara <andre.przywara@arm.com>, Chris Morgan <macroalpha82@gmail.com>,
 Hironori KIKUCHI <kikuchan98@gmail.com>,
 Philippe Simons <simons.philippe@gmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 Chris Morgan <macromorgan@hotmail.com>
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

On Fri, May 16, 2025 at 6:52=E2=80=AFPM Ryan Walklin <ryan@testtoast.com> w=
rote:
>
> From: Jernej Skrabec <jernej.skrabec@gmail.com>
>
> The DE33 is a newer version of the Allwinner Display Engine IP block,
> found in the H616, H618, H700 and T507 SoCs. DE2 and DE3 are already
> supported by the mainline driver.
>
> Notable features (from the H616 datasheet and implemented):
> - 4096 x 2048 (4K) output support
>
> Other features (implemented but not in this patchset):
> - AFBC ARM Frame Buffer Compression support
> - YUV pipeline support
>
> The DE2 and DE3 engines have a blender register range within the
> mixer engine register map, whereas the DE33 separates this out into
> a separate display group, and adds a top register map.
>
> The DE33 also appears to remove the global double buffer control
> register, present in the DE2 and DE3.
>
> Extend the mixer to support the DE33.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> Acked-by: Maxime Ripard <mripard@kernel.org>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>

Code looks OK, though I have not tried to check the register offsets.
