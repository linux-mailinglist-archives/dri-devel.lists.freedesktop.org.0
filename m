Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 846F6A6DFDE
	for <lists+dri-devel@lfdr.de>; Mon, 24 Mar 2025 17:36:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCAF510E495;
	Mon, 24 Mar 2025 16:36:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="Jc1MZEdL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4686010E495
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Mar 2025 16:36:45 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-30613802a59so48476581fa.0
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Mar 2025 09:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1742834201; x=1743439001;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WbVSfwSwUsyBVRZtdurPZ1fEIzsDEzw5c2RH7LloXHc=;
 b=Jc1MZEdLYTVrTIQGEXAZICFisgrtCE1ZXaPsDfDA/8cP0fzREQhDtjVyO0CgLzvGM5
 bdch3aCnoo5Y+Inr6GpdYa/N3RnSJWUOzIJBvgAfpqh49zuChcNyXS0cATDGE9sNoQQG
 kC+sWcSXgnRksqH2nHwjuZG7Zv0i7XdaBXw2A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742834201; x=1743439001;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WbVSfwSwUsyBVRZtdurPZ1fEIzsDEzw5c2RH7LloXHc=;
 b=cGijublxsxcBqblWsogoZjKfyDFvslw+lbInlnj7q2UrXem1tDq5zh0/sA5WxDUVHS
 ZyCImnDW0cQantNOWvFr0vWnOHiMa2bgQl+UQmi3+zqS1qkEssogcxZvJd+mmM9t48hE
 MsBp4dbwRzkuatka9mDUSvvj8Gxd108kXqf6/862AS1rh3B2mMwXC6RjqoNeuY5Ic7Go
 NDmcK3qD77UO5VdYci5VO1Xs77f99haCJRL0U12C+/CpQOjz5THXqD0KEIVmPjAoKQIM
 Bx/PhBvo5gHe4M8pr/1UPi4Mf11+UqYzgoS2aV19M3DVqMXE2anA7SLiiYq8vzoOUWK+
 6z/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJGxihReqNMU6On/ar4NpfL1hT2VE3Y7B6pb+JyKLu16QtxrmmvsVc4Z+mQ20fDOIEGXdrEW0IHRo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxZ5ahNdNZ1MHoAAggRO4HSFWX/ydqIjvLJ9VB4HYxgRIKM3jMw
 4RdwtJOID7e1IJb+oO0xshzatmoee6g7QOhgiDevxrT59V9Fv0VGzP3Z7tHiVkk5q8hLSectd/J
 D7A==
X-Gm-Gg: ASbGncsG8qjdhfAIyJwTZaBW/XOTc32FIWF7vu5rF540ne2uB7Pp5bd8nV7cviEfJhW
 FMciz0oP1YAPH445PgzNakMaY9RbZVgvpFSc/ieTk88RmFst9XjGnonGgBZRrpi/GDzfdVEBsHS
 Sdo7Nla+VEzAWqgMicrEfvPGOwV83oRIWUKE1P2z6TLF8M9yoOTp7kF8Tsh/dARQklaFYnMclYn
 RKNzw2ZRIK45gffPesNBPBdAQyKVQr/Ghs9xaYLcXhBeljcfEv6c08gVCKbx+Ifl7VG6SNKinse
 uS87hJ3l38xqffNwl5Pi0bt4qAMXFma54o7WXRZJgEzY6o6JwtlUHCB1jG/i3tHnhvjh7+bw/4T
 94lCLIfny
X-Google-Smtp-Source: AGHT+IEkv7u5omL3PopijB7NT+Nz7QDsDlNbvwbBK1BRLu+nUD8lunn3QTwRMmhREX72I4tN+P67Hw==
X-Received: by 2002:a2e:9c95:0:b0:30b:ee78:79d2 with SMTP id
 38308e7fff4ca-30d7e2bb92dmr43400951fa.36.1742834200781; 
 Mon, 24 Mar 2025 09:36:40 -0700 (PDT)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com.
 [209.85.167.41]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30d7d7c1aa7sm15277301fa.3.2025.03.24.09.36.40
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Mar 2025 09:36:40 -0700 (PDT)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-5499614d3d2so5318028e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Mar 2025 09:36:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUpDLLVH6JWq8vtFuhuf2XoKuUGIos9pWc86qziHK0WCqqQz5Vkh/jrmCJoLpDO+3hCGm0scwf4O7w=@lists.freedesktop.org
X-Received: by 2002:a05:6512:2394:b0:549:5866:6489 with SMTP id
 2adb3069b0e04-54ad64fc6c1mr5079567e87.47.1742834199580; Mon, 24 Mar 2025
 09:36:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250315182522.628187-1-tejasvipin76@gmail.com>
In-Reply-To: <20250315182522.628187-1-tejasvipin76@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 24 Mar 2025 09:36:28 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X0Tn+=M8oYsxtT=g7etQ1Fsusn_O3_K4MD=n2rQRdxJg@mail.gmail.com>
X-Gm-Features: AQ5f1JqXvIcRz_JthPYvuupBe3v23vMi4-VDj2o_1AcvqTjIjsr3L9gaH4gwORg
Message-ID: <CAD=FV=X0Tn+=M8oYsxtT=g7etQ1Fsusn_O3_K4MD=n2rQRdxJg@mail.gmail.com>
Subject: Re: [PATCH v4] drm/panel: novatek-nt36523: transition to mipi_dsi
 wrapped functions
To: Tejas Vipin <tejasvipin76@gmail.com>
Cc: neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
 lujianhua000@gmail.com, quic_jesszhan@quicinc.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 asrivats@redhat.com
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

On Sat, Mar 15, 2025 at 11:25=E2=80=AFAM Tejas Vipin <tejasvipin76@gmail.co=
m> wrote:
>
> Changes the novatek-nt36523 panel to use multi style functions for
> improved error handling.
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
> ---
> Changes in v4:
>     - Cleanup nt36523_prepare
>
> Link to v3: https://lore.kernel.org/all/20250309040355.381386-1-tejasvipi=
n76@gmail.com/
>
> Changes in v3:
>     - Remove mipi_dsi_dual_msleep
>     - Change mipi_dsi_dual_dcs_write_seq_multi to use the same dsi_ctx
>       by swapping the dsi accordingly.
>
> Link to v2: https://lore.kernel.org/all/20250307091519.245889-1-tejasvipi=
n76@gmail.com/
>
> Changes in v2:
>     - Uses mipi_dsi_dual_msleep
>     - Changed mipi_dsi_dual_dcs_write_seq_multi to not equate accum_err
>       of either dsi_ctx.
>
> Link to v1: https://lore.kernel.org/all/20250306134350.139792-1-tejasvipi=
n76@gmail.com/
> ---
>  drivers/gpu/drm/panel/panel-novatek-nt36523.c | 1683 ++++++++---------
>  1 file changed, 823 insertions(+), 860 deletions(-)

When applying, I did get a yell from the stricter checkpatch mode:

-:28: CHECK:MACRO_ARG_REUSE: Macro argument reuse 'dsi_ctx' - possible
side-effects?
#28: FILE: drivers/gpu/drm/panel/panel-novatek-nt36523.c:26:
+#define mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, cmd,
seq...)    \
+               do {
         \
+                       dsi_ctx.dsi =3D dsi0;
         \
+                       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, cmd,
seq);       \
+                       dsi_ctx.dsi =3D dsi1;
         \
+                       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, cmd,
seq);       \
                } while (0)

That's not new though, so I went ahead and applied the patch anyway. I
think the easiest way to solve it is to just assign "cmd" to a local
variable inside the "do {} while(0)" scope. Pushed to drm-misc-next:

[1/1] drm/panel: novatek-nt36523: transition to mipi_dsi wrapped functions
      commit: 15a226179c55ffef2e0a883b6bc15eaceff4a08d
