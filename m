Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 795BEA15491
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2025 17:43:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27AB510E259;
	Fri, 17 Jan 2025 16:43:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="A0UQtKMd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE4DB10E259
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2025 16:43:44 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-305d840926fso18331801fa.2
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2025 08:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1737132223; x=1737737023;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qF9YUtvKWxdsAThZHPneJAkbilLaBCeiUVU9+gIe500=;
 b=A0UQtKMdv8GLNp+iWXv0U7QBWlQ0ZLDIhDpU9GvX1ggUxwVp8w7jQOvDR0a0IXgn5M
 Tbb3Hr1g//Vx9XIN6BpkAzhnTV87mOjEju99kn9cd0OAdYA10WQEuK931YKptntTvnz9
 nn4ZkitcmZxVeayxleX3vL4CQP8GrQp4b5WcY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737132223; x=1737737023;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qF9YUtvKWxdsAThZHPneJAkbilLaBCeiUVU9+gIe500=;
 b=MrneXvxZ+qDTUAR27/6iSXrRpC4J0KaNa4OhMU6GqT8rcb7GTeSDbMe80a1b9cbvEz
 RNO5qvG+tkWsOQWJeLDMX58PqXDgWQax5Na/3X68qPF17G00+nX5mVRDUZycxThZSeGW
 lFCHgrXcF9KDO/R9Faw4y872PYxJhFwyEEaRQ6Bz/kWa2ZQTwikzmyjtLC1WibFuK8nc
 SGgTtnL9y658UTns3pNLhTi9NDp3y26r9yMVfRb8tyo2EHo2QT+Jem3DidU0rLCDLoXJ
 Gm2czDZVDIhcg3ol3X+BMv2ZZIaXuY8M6EYsOv9+tbS3HNFCAynegPsk6N4lX39x9xAO
 pctw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCPHjMjE0lT+YF3deZxKXSWe/JRHNCJb7Od00OcGMmnxsGsIfVsA/R6LEtChClL3kaKXwXxodcdto=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxDCFL/Iokqd74Tq9mVbNuGHd9d/WrOfgnF70jjZEVS4fShdIJJ
 7/W1Iiob5pOJQBA4PP2RK4WaNh8MtQjVCX72+KVdYOU5zRaJQxxPXAmhRUkqcSOQVzz9ebxhHIW
 SCg==
X-Gm-Gg: ASbGncvsDXhqgIISR1mqugujnTolrvDodjmuHtrU9FSyc5upAcQrVWsNGQO11SSwX5F
 fs2EMfKT3eeAmVn9MH0LaF2rMCU/e3+aN1ilLVEPmeRzv8xCzxdgC//LR3ZC7vSs5VLl5KPLPn6
 eaKkHQTnpjnKRfQAwivx39TDCg37UxjLCwXgczaNUnh8sBpIvxrfBhcx1lDT6eu4OU3vCpyu/7r
 CVl1+40JxF1GjdEgoep5MwmmbYNUj6Sqih+V8fhp6jyM/6AmVFsTnE5iWXXaPY+s2+ULl0HEw0G
 vUuXp5eDthz4qctwg0py
X-Google-Smtp-Source: AGHT+IFM0UErdCAA3lc8ejCmE8MTXQbobrN4CfOYuQLYV8nkUrmaHuky1hOTsYseJ8VwsNEqoJ/4nw==
X-Received: by 2002:a05:651c:993:b0:307:2bc6:5eb4 with SMTP id
 38308e7fff4ca-3072ca60d64mr11899231fa.3.1737132222459; 
 Fri, 17 Jan 2025 08:43:42 -0800 (PST)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com.
 [209.85.167.45]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3072a50157esm4857371fa.90.2025.01.17.08.43.41
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Jan 2025 08:43:41 -0800 (PST)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-53e3a37ae07so2500489e87.3
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2025 08:43:41 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCV91WAQrbsh7bQlHYhvwyTfo5U704FL8UHX2qI3433RP5o4jHKAmn3lJEHwPOWzG9XEJNiwgZ/84Gs=@lists.freedesktop.org
X-Received: by 2002:a05:6512:3b09:b0:53e:3a94:c2bc with SMTP id
 2adb3069b0e04-5439c224acemr1246759e87.18.1737132221203; Fri, 17 Jan 2025
 08:43:41 -0800 (PST)
MIME-Version: 1.0
References: <20250117010039.1815430-1-andyshrk@163.com>
In-Reply-To: <20250117010039.1815430-1-andyshrk@163.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 17 Jan 2025 08:43:29 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UcdXr3xAXSKvM2-+ZSVANaCoux95tGnQD0qQUZ26NqXA@mail.gmail.com>
X-Gm-Features: AbW1kvYgeqmIYvGj0N8sJhDQt17OVwnJqUb3HiDBJDpyyU9mdndw-C60Ky7FyG4
Message-ID: <CAD=FV=UcdXr3xAXSKvM2-+ZSVANaCoux95tGnQD0qQUZ26NqXA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/panel-edp: Add BOE NV140FHM-NZ panel entry
To: Andy Yan <andyshrk@163.com>
Cc: neil.armstrong@linaro.org, tzimmermann@suse.de, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

On Thu, Jan 16, 2025 at 5:00=E2=80=AFPM Andy Yan <andyshrk@163.com> wrote:
>
> Add an eDP panel entry for BOE NV140FHM-NZ.
>
> No datasheet found for this panel, so the timing
> is based on a similar NV140FHM-N41 datasheet that
> I can find on internet[0].
>
> edid:
> 00 ff ff ff ff ff ff 00 09 e5 09 0b 00 00 00 00
> 01 20 01 04 a5 1f 11 78 03 9b 75 99 5b 5d 8f 2a
> 23 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
> 01 01 01 01 01 01 c8 37 80 cc 70 38 28 40 6c 30
> aa 00 35 ae 10 00 00 1a 00 00 00 fd 00 30 3c 43
> 43 8f 01 0a 20 20 20 20 20 20 00 00 00 fe 00 42
> 4f 45 20 48 46 0a 20 20 20 20 20 20 00 00 00 fe
> 00 4e 56 31 34 30 46 48 4d 2d 4e 34 5a 0a 00 35
>
> [0]:http://www.tfinno.com/PIC/PIC/20215121628440.pdf
> Signed-off-by: Andy Yan <andyshrk@163.com>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
>
> ---
>
> Changes in v2:
> - Fix typo in commit message NV140FHM-N4Z -> NV140FHM-NZ
> - Reorder based on the product_id
> - use delay_200_500_e50_po2e200 based on NV140FHM-N41
>
>  drivers/gpu/drm/panel/panel-edp.c | 1 +
>  1 file changed, 1 insertion(+)

Looks good. Thanks for the patch and for adding relevant info to the
changelog. :-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

Pushed to drm-misc-next:

[1/1] drm/panel-edp: Add BOE NV140FHM-NZ panel entry
      commit: c03dd019f0b56c40f42fa0e7785eaa109e0bdcd6
