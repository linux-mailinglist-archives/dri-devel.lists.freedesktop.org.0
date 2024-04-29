Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 144228B5EBF
	for <lists+dri-devel@lfdr.de>; Mon, 29 Apr 2024 18:17:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E867310F001;
	Mon, 29 Apr 2024 16:17:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kbfLl55V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA35210EE70;
 Mon, 29 Apr 2024 16:17:20 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id
 d2e1a72fcca58-6eddff25e4eso3980382b3a.3; 
 Mon, 29 Apr 2024 09:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714407440; x=1715012240; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pRMKoMiU/Afm1XtdmExTEtbRCQKoZqGaLEqC0n57hg4=;
 b=kbfLl55VmkePjfBYL892UD+ou9Q64Nx/qgk7yGkb9kbFPJF3sgRcC3vsdMvqM+sLIb
 jFZSAgt/xabdLs/l8rPYRj64rAd9kj79UEk735imFpwYFYJ7u+LC6THn9cpo0EicnEQA
 uffjHhVdey59V/VeMYV5jm5urzZfFNsmsWgS9lJ85N+Sa0U6Wgw3szmzpnHXzOYqG8q5
 nm/KWJmEeAhO+ndW/Xo4+VJ350QdlkArq+YzQWK7VUs/U2K2JW5Re5hLF+asCggozt4v
 QRxfy8pVVg5k25JsMfxsbst2XxTyGI8RCO4iP4FkXbkDq7P9jrwlAVcpD9hHbTjT3/kh
 jcYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714407440; x=1715012240;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pRMKoMiU/Afm1XtdmExTEtbRCQKoZqGaLEqC0n57hg4=;
 b=Z+CrjR8DQUZg2tabBn1sY3lfDujo4ZvgNhxJK1zJA9BghFP6Pq1xP6US9B0hDC0WMZ
 NOQxhNa3fjxTzkxHLp3mebfGqdjm4KRnkYiMx1NXl6RX4cWfMwR8GqmF/IuiNpHP577u
 aJLtMEzIr3JrApm1hdVR4i0t1krFPfFhK5BJzxuYRo1xtm8ldzyP7hBvmurTj22CGPAg
 DxKvSzT/QpbaPDE2ZTswyEVArjZ4YECtA0RSXeqYNcSxMMx4XfpU1gN74jbrl49W5jMW
 WR1eOnoWK/wlv7mN0qIrWz4WPbE/gkHpoH1tuQ+VTovc9UX0kLoRvFJgRM9jPPTgHzKo
 0YfQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWq7okaqAJUFTGbAhc0FZusRB0A9lAsuUaL8O0yOQ0MwxmlwJdl4auj9L7qu4lO5JXOtRgJOlZAb2FC9UQyaQQUvz/A2EfOex3sYW+xC1Bmn2ZrgVDj7z46NwqqiqAh0V7X4Wt5I33WrFlHWOWO6A==
X-Gm-Message-State: AOJu0YzEe4OWC7xAID6ZSMXYnMpm7suCwU6HJcWUfern88lh8mogats4
 z5rOwJKiXc9Kd31LnOXNBD0M55kK1nox59zC+0iZRLw80OWLmu9EmJY0zfIIzP92ElzGiYDanHJ
 Pe8qMB6DvVLQ5DHf408rBAkHV7+M=
X-Google-Smtp-Source: AGHT+IEYtfidfKq+b3S83zX8F5vtIn0LFk53vWsPXGIKpVjO3e5gQeGzDXpOktH7FLFDFcfhzQbH+xpl7vUa7FeRXak=
X-Received: by 2002:a17:902:848c:b0:1e2:a61d:905 with SMTP id
 c12-20020a170902848c00b001e2a61d0905mr90550plo.63.1714407440013; Mon, 29 Apr
 2024 09:17:20 -0700 (PDT)
MIME-Version: 1.0
References: <20240425032330.36812-1-jiapeng.chong@linux.alibaba.com>
In-Reply-To: <20240425032330.36812-1-jiapeng.chong@linux.alibaba.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 29 Apr 2024 12:17:08 -0400
Message-ID: <CADnq5_MoCTVtMqwTcVkxEmxa=MTw0MqmNWL8kEURg2mXptC5=g@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Remove duplicate dcn401/dcn401_clk_mgr.h
 header
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Cc: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, 
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com, 
 airlied@gmail.com, daniel@ffwll.ch, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Abaci Robot <abaci@linux.alibaba.com>
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

Applied.  Thanks!

On Wed, Apr 24, 2024 at 11:42=E2=80=AFPM Jiapeng Chong
<jiapeng.chong@linux.alibaba.com> wrote:
>
> ./drivers/gpu/drm/amd/display/dc/clk_mgr/dcn401/dcn401_clk_mgr.c: dcn401/=
dcn401_clk_mgr.h is included more than once.
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=3D8885
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>  drivers/gpu/drm/amd/display/dc/clk_mgr/dcn401/dcn401_clk_mgr.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn401/dcn401_clk_mgr=
.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn401/dcn401_clk_mgr.c
> index d146c35f6d60..005092b0a0cb 100644
> --- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn401/dcn401_clk_mgr.c
> +++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn401/dcn401_clk_mgr.c
> @@ -21,7 +21,6 @@
>  #include "dcn/dcn_4_1_0_offset.h"
>  #include "dcn/dcn_4_1_0_sh_mask.h"
>
> -#include "dcn401/dcn401_clk_mgr.h"
>  #include "dml/dcn401/dcn401_fpu.h"
>
>  #define mmCLK01_CLK0_CLK_PLL_REQ                        0x16E37
> --
> 2.20.1.7.g153144c
>
