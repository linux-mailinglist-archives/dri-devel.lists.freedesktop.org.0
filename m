Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC11A261DA
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2025 19:00:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E78D410E53F;
	Mon,  3 Feb 2025 18:00:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="cXYwyaaz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB79710E53F
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Feb 2025 18:00:10 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-53e384e3481so4321032e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Feb 2025 10:00:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1738605606; x=1739210406;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rj69N8eshnsgwGXgbMTqaWaytIEdPdApaQMseLoPlUE=;
 b=cXYwyaazUY96xDg04uuJIMOZcDVx08dP/Zc5qvGThmXy4lPyBChUXjXJfSRLg5U5Pj
 cvFirdkP16wljTRCNizk6002dGkI9N8RbWj/l27ZGigXsg2ECzVqjqHCnnNS3cPswbYP
 ebaOO8czrjEmajKT2EndpDPhUvpPk3XqMTmrM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738605606; x=1739210406;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rj69N8eshnsgwGXgbMTqaWaytIEdPdApaQMseLoPlUE=;
 b=NkXJxLi0qcwd0MT0cEn5/G01+GbD8XFbHM6GFJHHYPqslzk6aYdtgWUgvZrvSbdQkG
 EWU92VsHfDaslwzubcCFRFOVrL/wXrkYYECvTzH1OjHxyfNUR4tYVSsyF7n6HFG9apnj
 LO2KzHG8ydsd4Tf3jwxEh1sFWaHSkqNJPtIUPtuhPmRdxJHnA4yiPPJcLJpPzAGMnChU
 cNKnmGlHtCBbIN96EwyiWekv4NW1VGlfLFboGmAs0aFKM6Cy4X6Uje7p50QZuqINx/r4
 Bv+3nfuVVFPBHOQ2viazPigrvaTl/OjVYC5gkESDngBuxZZS0Wy9D/nRl9NhTf5VKCvp
 BSMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX39BjhdCRReRJOTYdKN5GMqmpp0Tqh3EL7Cs84aPNaZ4/qPBVerirWXN+hbeZPmjwWtvLX/L68Ofk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyF1dQrmJZWNAboZGj1I1l7j5kHvO+LVpz5M37unmSiAZmL46J2
 LX65VoZV91zdH5pJiCZrt0DhTh06TqAqFzDkayY24KTP+cm6dTma620ZMXgA7+4kAb94K6PE+FJ
 HKw==
X-Gm-Gg: ASbGnctSbNFInKpnmGdwxKwS2H1RamY2hSdAXE3SIIAKcoOnmcj/oSXyCv6C3lyYCd9
 vKV5XUHHoEhrHI068dU5clTPXPeWKweV0v48yLYGDVQAwAH6y6CP/QU93OL27xw8DcIaFwnArw4
 tBozg1G1pFC/CMnq3skxU+6vnaVFY5uur5XMnYgxjHiMzcxb572eGcbBKwkm2M0Gy5injOLUkKe
 8ph3a2EL59VSJf+VWsctklpCWx4a8B68lenCMxtPAKK3WVs4wpPkledw1tbcVMi+/1JqLhvO80f
 pzo76KXZiyMDuiGgQmZGW2DtIZ8fKs0HFoFuQsIOlljdnySQ2agzvfSZfzk=
X-Google-Smtp-Source: AGHT+IGnQGOU5/iq9QY4zwJxRoALKHscZtLxCE0ubBFLAzVyZeOojLIYJCc7jgzYA4F0KIssbSWaNg==
X-Received: by 2002:ac2:5de9:0:b0:543:e4ac:1dfc with SMTP id
 2adb3069b0e04-543e4be8eb6mr5784116e87.12.1738605606330; 
 Mon, 03 Feb 2025 10:00:06 -0800 (PST)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com.
 [209.85.208.170]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-543ebdf1121sm1363451e87.23.2025.02.03.10.00.04
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Feb 2025 10:00:06 -0800 (PST)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-303548a933aso40520661fa.3
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Feb 2025 10:00:04 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCW5rUOpIlXypwC6AglliMTtfi9Gsnzu/sq0JtWLmN0ZwvPmvrtT3NmjbXFjaa4e5gcXarTLuxjZKWQ=@lists.freedesktop.org
X-Received: by 2002:a2e:a90d:0:b0:302:29a5:6e21 with SMTP id
 38308e7fff4ca-3079680c84dmr71971241fa.3.1738605603726; Mon, 03 Feb 2025
 10:00:03 -0800 (PST)
MIME-Version: 1.0
References: <20250201185439.157613-1-tejasvipin76@gmail.com>
In-Reply-To: <20250201185439.157613-1-tejasvipin76@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 3 Feb 2025 09:59:52 -0800
X-Gmail-Original-Message-ID: <CAD=FV=U+eg5P7qC9pMCQTc-eaPK2DgpC6xkqswFRc7FnQBYeJA@mail.gmail.com>
X-Gm-Features: AWEUYZkAkz6Lt1anmV2cYxMuD89go-NN0PowJVelpFObbIRazNrFa7JhV9cYyKg
Message-ID: <CAD=FV=U+eg5P7qC9pMCQTc-eaPK2DgpC6xkqswFRc7FnQBYeJA@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: sharp-ls060t1sx01: transition to mipi_dsi
 wrapped functions
To: Tejas Vipin <tejasvipin76@gmail.com>
Cc: neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
 quic_jesszhan@quicinc.com, dri-devel@lists.freedesktop.org, 
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

On Sat, Feb 1, 2025 at 10:55=E2=80=AFAM Tejas Vipin <tejasvipin76@gmail.com=
> wrote:
>
> Changes the sharp-ls060t1sx01 panel to use multi style functions for

Not worth spinning for this, but s/Changes/Change/

> improved error handling.
>
> Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
> ---
>  .../gpu/drm/panel/panel-sharp-ls060t1sx01.c   | 59 +++++--------------
>  1 file changed, 16 insertions(+), 43 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

I'll wait a few days and apply if there are no objections.

-Doug
