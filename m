Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F20BB2FD4D
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 16:50:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7C4110E9BA;
	Thu, 21 Aug 2025 14:50:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="NZiPjlaZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54BEA10E9BA
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 14:50:34 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id
 d2e1a72fcca58-76e39ec6f30so1056169b3a.2
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 07:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1755787831; x=1756392631;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yjqHieTqBHy+cNT3ZdROla3bmT3OzWvs9RzgpXfbZLc=;
 b=NZiPjlaZ1/X+dn5MiC0eUgrH6AjjPLwv9gH8gVa4PkuBR1y4/oidKZBPbXk9bfz1lW
 RzNM/m/0G1OwuCt64rWdiJTxv/m4jwgDrRwVZ5uI80N9uWnUw7VKn25DZYEeX7Ne1kWf
 +T1hLNdV7+oPI7tOwV2f+ppVPWC0P3qsAkECo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755787831; x=1756392631;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yjqHieTqBHy+cNT3ZdROla3bmT3OzWvs9RzgpXfbZLc=;
 b=YX4toK2oZFLIioCvV904Mf8FayZ2EwiqN30bdla9fLWfF39Ym7+oaV/dS6zCA81Agb
 2kcx6QuFN8RgSisZIOUP82hS7WO4dLy1rmOA56jWwZK9PmFB/uSbE7SkW11engg8Q7jm
 jpFqhu/rnWHPYAtVv23eXX8SJ+6kY5GWyFDNJAdSJ3se/90SZoPlf3HOLZmGg+qS/YwA
 dKWwNW3+OjtncrC2DVfDHdh8H50hDclTFk/Tb1/9GRvGshfKOD84+F/5Ijrtn15AzqO7
 L7PI787kVn7OrpIssk5259VB6M5o7Q51CcZfw/Evfh13+hmHbK0y5UbIIUrp204wMRXD
 ZJyA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJN4/k4xM7f6q5DZq9BYvptR38/xfoVu/JuswKYHZbC3SVm6XDTaY6JTdArXqkgGOHGOw9JjqFZVY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwS0OZ0UshnS07YnTwnKzCNE2y0WUlKc3TRobaxF6cZQzUBYmmQ
 1Xda2E/Tp2pxdhyE5Q0gqlGUtZz5wb+CwiDTTslGQyrgsMs6h8QganEHRnfSOB3PMfDcwrS6uDd
 2aaw=
X-Gm-Gg: ASbGncvNnbKWvBFng04BO+fmHhlf5c2qCkrFplcM52ukrQ3HUthAjq6hOuXjU/25LDJ
 gQ2uCj5ycGp4rTgGS9ERapv2lct0z4PJOsf8zCsWcwSmpsV0ivTDnUWKQKnIGz02qVjDdRC9RHq
 FKz2e8vr+dQnq/Z+Evct4t+ex1T+VksEza5VQCzR6PzimffMIIcTjZYVKZzuk9lcxmRwslye8yg
 t8kY48utjo1ZwK/Q9r+BCBVcP5NQhlpOVrKw64T9zNzMpPASUJMyOx1b8RBDUFnRuX0KFRJ+OkW
 qTAVIyEvlF1KKBDm+k0Qqpz916oghR5zFSsd7v7U2EBvJRqUWGgm4tgLfN/oYMiMyrkf4u85Cr4
 qBLCyTQGTZUfZ5i0A5rk8dc7oq+pq1pQs461GDTQmawA8S/4vQ8/P+YVAm59vWau53w==
X-Google-Smtp-Source: AGHT+IEtYxmQbj5MHySzsGhO5NxYz+rCE8+mGC2ECW7Qew5QWC1+0sUcip5JXaEQ2K3HlKWRtM+hjA==
X-Received: by 2002:a05:6a00:2e2a:b0:76e:9906:6e47 with SMTP id
 d2e1a72fcca58-76ea3265397mr3078252b3a.28.1755787830761; 
 Thu, 21 Aug 2025 07:50:30 -0700 (PDT)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com.
 [209.85.214.177]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76e843bb510sm7447103b3a.53.2025.08.21.07.50.28
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Aug 2025 07:50:29 -0700 (PDT)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-245fd2b63f8so10966625ad.3
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 07:50:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVGw3WEFPGSiN+lMigXWywVkybuM8AE4EUtIQDN6YA3c2s0utroIo+EMnOz3ku7+1+DSpWtXvuae3s=@lists.freedesktop.org
X-Received: by 2002:a17:902:f550:b0:244:214f:13a0 with SMTP id
 d9443c01a7336-245ff871cf5mr35274985ad.52.1755787828128; Thu, 21 Aug 2025
 07:50:28 -0700 (PDT)
MIME-Version: 1.0
References: <aKcRfq8xBrFmhqmO@stanley.mountain>
In-Reply-To: <aKcRfq8xBrFmhqmO@stanley.mountain>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 21 Aug 2025 07:50:16 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WMu9YJgkkqTEpKEzPdMUka8tYzPZVKEeh501-mSsh4uQ@mail.gmail.com>
X-Gm-Features: Ac12FXwRHXd6Q5sCwpiasX5YznwxVtKCHmDt34fauOc1r6Twa8Tf38YLNCLnydw
Message-ID: <CAD=FV=WMu9YJgkkqTEpKEzPdMUka8tYzPZVKEeh501-mSsh4uQ@mail.gmail.com>
Subject: Re: [PATCH next] drm/panel: jdi-lpm102a188a: Fix error code in
 jdi_panel_prepare()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Brigham Campbell <me@brighamcampbell.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
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

On Thu, Aug 21, 2025 at 5:31=E2=80=AFAM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> If the mipi_dsi_dual() macro fails, the error code is stored in
> dsi_ctx.accum_err.  Propagate that error back to the caller instead
> of returning success as the current code does.
>
> Fixes: a6adf47d30cc ("drm/panel: jdi-lpm102a188a: Fix bug and clean up dr=
iver")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Thanks for the fix.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

Since it's straightforward and a fix, I'm not waiting and I'm pushing
to drm-misc-next.

[1/1] drm/panel: jdi-lpm102a188a: Fix error code in jdi_panel_prepare()
      commit: 61ce50fd8196c8782b9620bb60d33649ec429f64
