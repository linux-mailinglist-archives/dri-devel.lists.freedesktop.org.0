Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F238DB23146
	for <lists+dri-devel@lfdr.de>; Tue, 12 Aug 2025 20:03:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C42A10E62B;
	Tue, 12 Aug 2025 18:03:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="b2orFu09";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EC4410E61F
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Aug 2025 18:02:59 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id
 d2e1a72fcca58-76b8d289f73so5480743b3a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Aug 2025 11:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1755021777; x=1755626577;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=H6swKV1GrcMf33s31ax2gRwHXvR8uLRuUveaWyWM23M=;
 b=b2orFu09Z/x15ZQjnV1KpImkyC3PLgJysROOBGDCBbgDfg9DFb/1pVMLZ/shFqZPwB
 4s6QoKx1nFJP26v0DTR0DN/QayrDP3GVY1NZqbG4w9It0Eir47I2D8A7KYMD2DmHNHNY
 IDvHNIYQCSvw2/hXflxVhdD+VnoXrOTUx45Po=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755021777; x=1755626577;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=H6swKV1GrcMf33s31ax2gRwHXvR8uLRuUveaWyWM23M=;
 b=XereHxbsOQ2GKktOh0dbPAT0ophGO2NbdEKbZX5vEc7esJTY7eA61ySGP0tqNfcQ/K
 Y+ih3J/1XW0CvInZTZIIzd+U1B/l4Z/h3SxnC0i4U4BQCpz8C+9LPn0aH9IL8+h1VIO4
 6JBtTv9RgA778Tgzgv+09O565UG7zrZDuIdUYG1RxLGjSZhVRPNbhjg7Wlsx6KCADyeq
 MYdLwmbBjox6dKSIiie4rvcFuP0ggYptpbZjKT8TGqTwS5qLNynfVti4qplthDidLlTV
 bLP712ne3+FsTQhwtVTfMlIr+j/cTMFhWlFQWA7qvjwXtD1NamGjEYtVOzdmodAg56RD
 RVaQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkwHvLQTEdUY9DaHrLOAQArZA7boR2ic5eiWHdJdCeemFuiNpZyfwDYVOC8xVBWc2Xy/N6uJk+qok=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxK+vPvClPRvhY+Qm0Td2pTE9Akyhu8f6lW+eTNnZB6cd/9wX+z
 aV8eDxzxW6K/8FxFOtGGS4qLoDzFW6P2xI5In/zR0S6NgLlNSQ6KavYlt5+leTaLy9PSb+3TG8z
 aqwo=
X-Gm-Gg: ASbGnct/132UYkC0EXGiMPpmTLC8Wwwb8bH3LJVs5bigoP07p8mMojwkruXqKwEobHT
 ChmwhKpM0AU09WYcIm5H/K1y9RKAJOGwzELu3F+bSR2YTV2boj2Tr/P1fevaBscLl+jhixp8EFe
 XOfS71o2m3vnxY6VUNxLPbOpv4kgWVhrLw32Um2BsxJsQvs2rFQu3jh9VfBpl6ArJ2P0TIsGE65
 kzp7jKsPmFv38CN7c0vUpXFQRZcXCTySQNnEWQuA5qb0bFhsd1Unkn2wz+myTxdXR1CsTbv+GUD
 xLDALQi2LQV1IA4MvSZC9lI9CdBm4jRMQTgCEhdknaOqGrg+4gHdBNr95YyixhuRq45rh3du14b
 CB9tBn2SFphDY2b4T1EhFKc9lIOhucCO/UxnzOA/OlbZEP03IZpRkPn5YkdVFO6A9+g==
X-Google-Smtp-Source: AGHT+IGF1GMQU2JVrFxkV8dDfxv+3x57j9iMPKlXLsDlMSRPdt2S41jXlDlPlPRdq1jCqLglF2BjDw==
X-Received: by 2002:a17:903:4b4c:b0:224:1eab:97b2 with SMTP id
 d9443c01a7336-2430d2b8085mr1176145ad.53.1755021776979; 
 Tue, 12 Aug 2025 11:02:56 -0700 (PDT)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com.
 [209.85.214.177]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-242bc894dc8sm123112125ad.72.2025.08.12.11.02.55
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Aug 2025 11:02:55 -0700 (PDT)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-2430926b53eso4176675ad.0
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Aug 2025 11:02:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCW79EUwTJnsh4Lf0/kzPo7ObhDKNoTRnxWhfR05VBEQb6zE9t08w69mjkKUWMzK/23EAkoGzh5LGfA=@lists.freedesktop.org
X-Received: by 2002:a17:903:228f:b0:242:accd:bbe8 with SMTP id
 d9443c01a7336-2430d224501mr1684825ad.36.1755021774560; Tue, 12 Aug 2025
 11:02:54 -0700 (PDT)
MIME-Version: 1.0
References: <20250812082135.3351172-1-fshao@chromium.org>
In-Reply-To: <20250812082135.3351172-1-fshao@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 12 Aug 2025 11:02:42 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U+Zh2V2r-THx25Qw7W-Fu_qM4v-+Evi+1tBCg92ieYKg@mail.gmail.com>
X-Gm-Features: Ac12FXzKfc-gYV3a4i5ca9iS6TBOZ22AxjGIHa2U4MsH1-9Cx6Q2aSnXXfpz5PU
Message-ID: <CAD=FV=U+Zh2V2r-THx25Qw7W-Fu_qM4v-+Evi+1tBCg92ieYKg@mail.gmail.com>
Subject: Re: [PATCH v8 0/2] drm_bridge: Add HDCP support
To: Fei Shao <fshao@chromium.org>
Cc: Hubert Mazur <hmazur@google.com>, Sean Paul <seanpaul@chromium.org>, 
 Xin Ji <xji@analogixsemi.com>, dri-devel@lists.freedesktop.org, 
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

Hi,

On Tue, Aug 12, 2025 at 1:22=E2=80=AFAM Fei Shao <fshao@chromium.org> wrote=
:
>
> Hi Doug,
>
> This is a refreshed series to add HDCP support to DRM bridge.
>
> This v8 revision is based on [v7] and rebased on top of next-20250731.
> Note that v7 includes 3 patches, while v8 has only 2. The rationale for
> this change is provided below.
>
> In this series:
> - Patch 1 registers the content protection property to the bridge
>   connector if a bridge supports HDCP.
> - Patch 2 sets the HDCP bit in the ANX7625 bridge driver.
>
> Both Patch 1 and Patch 2 were previously reviewed and acked (sort of,
> see [ref]). The Reviewed-by tags are carried over as there are no major
> changes in v8, except for the rebase.
>
> The third patch from v7, which was specific to the ite-it6505 driver,
> isn't included in this series. Discussion on that patch had stalled, and
> it was later reverted in the downstream ChromeOS tree, meaning no
> manufactured Chromebook devices in the field currently use it.
>
> As a result, I think we can only focus on the first two patches which
> have already undergone review.
>
> Please take a look. Thank you.
>
> [v7]: https://lore.kernel.org/all/20221123100529.3943662-1-hsinyi@chromiu=
m.org/
> [v6]: https://lore.kernel.org/all/20221117110804.1431024-1-hsinyi@chromiu=
m.org/
> [v5]: https://lore.kernel.org/all/20221115062835.3785083-1-hsinyi@chromiu=
m.org/
> [ref]: https://lore.kernel.org/all/CAD=3DFV=3DVoF5PyeNWX+4_3sseyRemZVsr5W=
tQVeg-8mhfgm40w3g@mail.gmail.com/
>
> Regards,
> Fei
>
> Changes in v8:
> - rebase on top of next-20250731
>
> Fei Shao (2):
>   drm_bridge: register content protect property
>   drm/bridge: anx7625: register content protect property
>
>  drivers/gpu/drm/bridge/analogix/anx7625.c      | 1 +
>  drivers/gpu/drm/display/drm_bridge_connector.c | 9 +++++++++
>  include/drm/drm_bridge.h                       | 4 ++++
>  3 files changed, 14 insertions(+)

These seem OK to me. I checked offline with Sean and he was OK with
his Reviewed-by tag being carried forward on these two patches.

...so I'm fine with landing these patches after some bake time on the
list. Unless I hear objections, I'll land them midway through next
week. Please yell if you object or simply would like more bake time.
Thanks!

-Doug
