Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C28C13A61
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 09:57:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF0C010E09E;
	Tue, 28 Oct 2025 08:57:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E50C010E09E
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 08:57:25 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-b3d196b7eeeso1232607566b.0
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 01:57:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761641839; x=1762246639;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=I3bhh0DQ8aw3qyEM+t66V7wEI7qFPP5kxL/D0neXiao=;
 b=laj12UceDzxge/CsuMLr519/3mKc3f5gPfFH3aaNrBR1KWWEGITpM1PkHhPJuEWv8C
 NFKuuDwh+EnGrsKLH8ySENRTHm2CzuRHOebjdW3wDVyxQM8iTWm55wapSrWTTICDG2EZ
 gS6ZH9N8z+yi5YE6RMpEs7HP35K+XpmJZvO+Q4jirkT6pdK/W88EJSFpf7jhtLlXttJs
 mSBYufMiThlwDpCz/J4vsjLAdyU6FREUc/JIoPqQ5GZQn0iWr0/wThY0W2lEW7e/OyId
 VHrc/KRCJGWq/Oct6Un2IesLw053K5rtQjUPX8ZPt39/aIE4LMYcvptjEhyNSYwL7p8Z
 QKig==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3kWI97w3ScWcu6vx9sid1LKV2wqabsGPNaeJAXg5L2eRUaFvyQVgRUiAXKXDaovnaM+Qa0ZEsrLI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz44vP+Gc5DBVWJKYoPJWPOJDaxXgcPe1ymCOYyTXLuMxAU0qUc
 sQ2uBYIAnKBFFWKObr4a94Q9TpmUL/sVP3sWj/jHi4D2hJuv5SNZAMFJSSCORSH6gHU=
X-Gm-Gg: ASbGncv5ec1/3X4kjVOVja7hzc6FYvF8epxnaZtlmx5ML4e+hby14/UQJqQvnU3mtxe
 jyjxSn16xr280HWe6cXkCVIMEPWwBPF/WaoMFBUjr8WdEWxJzfsfWeQ5qyhQh8/ReCTRGlUuFvd
 GWyg25wF2Jo7mC57+z+XjsBTF2HkC5FuJbBPOJRkC6iwAPi+3EEE6+U2BbV9XwcyXD9tHNwnhlb
 h/+ZJ5yM7VRSF77WDHfI2hGjipqIEO6jfPBYHArYh+ymtt4/6ilmDFAJLrshOm16G1Fbl3l8RX5
 aNFpmfSPACumGpJUaW4CKJDJYab8gGWPYXeqoLGCzQzyCQeMJJ/ICdGU53rIZYOWLgYTNZaNZHJ
 nVuOOUxnfayWZpb8bfi5yfrneNmmeIJFBxeFgt6cZOxIohhvlNLqHF6QIZJuquixZhdY5AdqQ+G
 M4/w0nmNaO7fiZWlLRa3OM/0XZ4w32gse8WifHoKtqs6Qdo4mi
X-Google-Smtp-Source: AGHT+IHzM9PkVXE0uePgWk7WG/OxX7robNH4gJwvcg5objDZlT7j9NioVhs2tAQHbnPH/97XCjAUlg==
X-Received: by 2002:a17:907:3d91:b0:b6d:5524:5a01 with SMTP id
 a640c23a62f3a-b6dba56046bmr299347366b.31.1761641839485; 
 Tue, 28 Oct 2025 01:57:19 -0700 (PDT)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com.
 [209.85.208.49]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b6d8536968csm1032170466b.29.2025.10.28.01.57.16
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Oct 2025 01:57:16 -0700 (PDT)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-64034284521so148887a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 01:57:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVNc/NrCfzwOTauqPoqPlzVmkTdhCt/qGJXef7QGzM3EJekmj7PiDxYItQJfQ79RJmuTBzTlhCq1s0=@lists.freedesktop.org
X-Received: by 2002:a05:6402:350c:b0:639:ff4f:4bba with SMTP id
 4fb4d7f45d1cf-63ed7e0c0c0mr2377923a12.2.1761641835996; Tue, 28 Oct 2025
 01:57:15 -0700 (PDT)
MIME-Version: 1.0
References: <20251017-drm-bridge-alloc-getput-bridge-connector-fix-hdmi_cec-v2-0-667abf6d47c0@bootlin.com>
In-Reply-To: <20251017-drm-bridge-alloc-getput-bridge-connector-fix-hdmi_cec-v2-0-667abf6d47c0@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 28 Oct 2025 09:56:51 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVyeyiHWnBRw9gOF6=_m1SHa313dF20yKA83oQMS_oSFg@mail.gmail.com>
X-Gm-Features: AWmQ_bnk1oZlJu05NjQHeWpy9S3BuAl1j3bdf7YMwemWUQbyo0ARvnVUlNuRCto
Message-ID: <CAMuHMdVyeyiHWnBRw9gOF6=_m1SHa313dF20yKA83oQMS_oSFg@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] drm/display: bridge_connector: get/put the stored
 bridges: fix NULL pointer regression
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
 Naresh Kamboju <naresh.kamboju@linaro.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
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

Hi Luca,

On Fri, 17 Oct 2025 at 18:58, Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:
> A patch of mine recently merged in drm-misc-next [1] has a NULL pointer
> deref regression (reported here [2] and here [3]). Being in lack of a quick
> fix, I sent a revert proposal [4].
>
> The revert proposal has no answers currenty, and in the meanwhile I have a
> patch that implements the original idea but without the same bug. So here's
> a v2 series with:
>
>  - the same revert patch
>  - the original patch but rewritten without the same bug (and even simpler)
>
> Also the re-written patch is now split in two for clarity because it was
> doing two somewhat different things.
>
> [1] https://lore.kernel.org/all/20250926-drm-bridge-alloc-getput-bridge-connector-v2-1-138b4bb70576@bootlin.com/
> [2] https://lore.kernel.org/lkml/336fbfdd-c424-490e-b5d1-8ee84043dc80@samsung.com/
> [3] https://lore.kernel.org/lkml/CA+G9fYuKHp3QgPKjgFY3TfkDdh5Vf=Ae5pCW+eU41Bu=D7th2g@mail.gmail.com/
> [4] https://lore.kernel.org/lkml/20251016-drm-bridge-alloc-getput-bridge-connector-fix-hdmi_cec-v1-1-81d6984c5361@bootlin.com/
>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
> Changes in v2:
> - No changes to the revert patch
> - Added the (corrected) patch introducing the same feature as the original
>   buggy patch, and also split it in two fir clarity
> - Link to v1: https://lore.kernel.org/r/20251016-drm-bridge-alloc-getput-bridge-connector-fix-hdmi_cec-v1-1-81d6984c5361@bootlin.com

Thanks, this fixes the crash I experienced on Koelsch (R-Car M2-W)
(https://lore.kernel.org/CAMuHMdW=zEi4XjG2Qrvj=jCa9LPBRU7HBTwEQVbe0zoz5mV_XA@mail.gmail.com)

Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
