Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D53A04782
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2025 18:05:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6041F10E261;
	Tue,  7 Jan 2025 17:05:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="cyuKnene";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A475110E261
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2025 17:05:12 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-3003c82c95cso130944261fa.3
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jan 2025 09:05:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1736269449; x=1736874249;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0C/hRryRNEI3/tlpllWhjSol5x5dFm4FwNGbPGTyDVI=;
 b=cyuKnenegSq8GqmvaKpqbmP25fsC2Vu1kW5eII+Tu+aixF37Ubjhurv/LxiTfVqRZA
 MXAlWhIIuCsDiEniZ/pYp5I4jlhRwPLQ++OeVwKaBAMFk7DYGasOqgsvaY9V62w3+1O8
 LmliJnfusz0hkqyHj7gcaeDwzCABfQeN9vhj8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736269449; x=1736874249;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0C/hRryRNEI3/tlpllWhjSol5x5dFm4FwNGbPGTyDVI=;
 b=kCe7fw3156tETQ3X/0pIZS6zJmG3RCyFuxsYs54KJ1ueWf38/FjNg3c4HxD/jGO87U
 tl+PpSSi8zybTJvDG6OhD26uvYx4/LJOPgsaj3Go4szJOjIqUiAfEgfjudizSGnePvUs
 oOInJDWGa8EyoLR1n+huma+MwMdyW4x7OVU1J7EydTmNqUY0kj6MLh/8IBlI8C7dK027
 hvXOsfzOZuBK3XCZocFYZID48J3MBofhcAzHhU4WiiCwMC7pXNj02SEvTmHh+Na+lWD1
 6am/0XfEesOdWglT9JMbxDJrWcxqZTevq+KdB30nzsDpz26iQ0eB/zE+Pd/72jFGv+Am
 AOpg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXn4jTSlGwjvtVr6O5t8EVjU+YakqZgeyQY/u+WVSe9Rr2G12JJ50mVYAueD8OWZF4NyXOTF9s4N8o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyAg4GIVkE8qPF8l2VaN1/Ra4M7BBiZZ1TNHM9viaJ3ha9an8ly
 tWf6cTULBusCNPrmKKYEiAiJdShgMi7Amvktj9jW4nieTMDmaSXHlFzTihrDSMXZA8KPc1aviyz
 A4SSR
X-Gm-Gg: ASbGncseboRWcys5bCWcLCUrrihN5AOoO6yq5pyuET8W9of1/eG3VCf8evq0rAi3ibT
 zdn2Em8Rqp3RKFz5ReR3t3Me2OB8uszTlclCIcHGYt+M8v+WKS8peZ3RhffXLFO2X39B//Y592T
 D6PbkXJbj6wtF0ENXqtI6KJa+/9vRs43nCbsMNVS302vpqUGnYvJ6mIbWbMYrFNE6fvnGPzvTXR
 WVbGA70jmYh9adLzatzv8L1ub4U/yVGvyOJMfd854fDFe2lc9l5C/49Jyw6/ilgbRovK4bWkPOW
 x6iS0eiUOVWSCNPbo8ZD
X-Google-Smtp-Source: AGHT+IHdhOFsJcW4ZIsl2Adg2H6+B4P4E6CVAuVJlc8PgQy5ed+97TJAkLE6Z1c0o2xGAE3yq7ZstQ==
X-Received: by 2002:a05:6512:628b:b0:542:6f59:f85f with SMTP id
 2adb3069b0e04-5426f59f97fmr2887174e87.2.1736269449028; 
 Tue, 07 Jan 2025 09:04:09 -0800 (PST)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com.
 [209.85.167.49]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-542238217d0sm5223379e87.212.2025.01.07.09.04.07
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jan 2025 09:04:08 -0800 (PST)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-5401ab97206so16214525e87.3
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jan 2025 09:04:07 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUB1WS2APbQUCD+vGxC2LrKiPNmoG8aorcUNJooNvDCQPUwfwtOxZC2EZGy1+2pR2LUqwd7AZ66Gjw=@lists.freedesktop.org
X-Received: by 2002:a05:6512:104c:b0:540:1fec:f321 with SMTP id
 2adb3069b0e04-5422958243bmr18866881e87.41.1736269447139; Tue, 07 Jan 2025
 09:04:07 -0800 (PST)
MIME-Version: 1.0
References: <20250107092510.174089-1-tejasvipin76@gmail.com>
In-Reply-To: <20250107092510.174089-1-tejasvipin76@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 7 Jan 2025 09:03:55 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VHs9SP1hod6QDmGa0cLYnk+Og8ChyvG+LCDLUX7ivi7w@mail.gmail.com>
X-Gm-Features: AbW1kvbYf9hzXy6Wmka4hixrT6rwLxYO-51QFjnCw-OlG_uCRMW2idra7DwALzA
Message-ID: <CAD=FV=VHs9SP1hod6QDmGa0cLYnk+Og8ChyvG+LCDLUX7ivi7w@mail.gmail.com>
Subject: Re: [PATCH v2] drm/panel: xinpeng-xpp055c272: transition to mipi_dsi
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

On Tue, Jan 7, 2025 at 1:26=E2=80=AFAM Tejas Vipin <tejasvipin76@gmail.com>=
 wrote:
>
> Changes the xinpeng-xpp055c272 panel to use multi style functions for
> improved error handling.
>
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
> ---
> Changes in v2:
>     - Changed print statement to conditionally run
>     - Removed unnecessary error message
>     - Reverted 2 mipi_dsi_msleep to msleep
>
> Link to v1: https://lore.kernel.org/all/20241223052049.419831-1-tejasvipi=
n76@gmail.com/
> ---
>  .../gpu/drm/panel/panel-xinpeng-xpp055c272.c  | 178 ++++++++----------
>  1 file changed, 80 insertions(+), 98 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
