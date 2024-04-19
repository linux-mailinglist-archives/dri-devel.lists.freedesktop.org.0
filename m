Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB668AB203
	for <lists+dri-devel@lfdr.de>; Fri, 19 Apr 2024 17:36:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4709910F051;
	Fri, 19 Apr 2024 15:36:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="X1F4V5h/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D7F410EEF1;
 Fri, 19 Apr 2024 15:36:45 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id
 41be03b00d2f7-5ce6b5e3c4eso1341415a12.2; 
 Fri, 19 Apr 2024 08:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713541005; x=1714145805; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s6e7j2WSWs9sC+Ur3lef8hum6RjzipP7Zn2prRaEpPs=;
 b=X1F4V5h/eXBCU5dFiJugI5pcESUvoojFHEmHUssjYKN9igCi18TCE2yahmoHEhBMep
 rslXE8h70YI0nELVlzYxkBWBKlupVVoTysFLQcr5IMxvbJ0EB7j9XFTCXwaKoQItebXj
 jwNo0ggZiUtyKh+pQGGhFtBZ9R3BW4+GOrZNovbJkS2+xo2jzenVNj3XrDDI+kjL867m
 aHtzmTeRSm64EZB4uwbYqh3jxVrH9akANyHPnkvZvpjhw1LLfThwZDv6YnMPUkiEkrd+
 LKQ6Gy9dH4XKbTDwUPFWEBDS6XGBbPQS31B88w7mT715q9q0H8WSpyd8monLpaArSHWK
 OJmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713541005; x=1714145805;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s6e7j2WSWs9sC+Ur3lef8hum6RjzipP7Zn2prRaEpPs=;
 b=qPuPDjNuj9E+Euh46or9KJf6TuSppcySEchAGmCI8UP6Mlnxj42LyuKK3A632MCAf/
 Fq/xCfXEGrMnmStKzjDpxeyuZu2FBAiZYbTO3Xmb4Ei4Grj7kxZaVB8N1eKFXNoHdAE5
 AHbmgBOlvOLG4lii4sWhExd7he7mo92IRmNGv1uN1xSnY8yafUgjgTtwHAawaxOqOmW8
 +w3w9TVlhCAPZErwPEsvVVFN32SMBh5M2f5hM7K6bpcp3OEkxnUhw40jCe6eAmk/U4Vl
 dSGNsR5clu/kSMRc2FFQOpHa5oD8Svev50cpuEUiX+zrFgIQ02zEqKyB5dqtqwXXcXMv
 J3WA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUtkhREqL6qsRhxFA3rPI03MDVCLELQI+Q1Ba8ZNu0lC86nUr2HQkeggjeDvoaNeZ1rgh71Tc17nmv6gEnCrzxZOek/TQoQxLRs/fQdtbnukKaBP9X58VFybpnmE1CnR7JsigHckTojukGNT0bpiA==
X-Gm-Message-State: AOJu0Yw6kiva1pOy6eyK/siwCHsuN8Gdt5Rzcps5jGnSZGQEGk4hqfVV
 u/MIqoQ1FFU+eYdIW2aLcGnmfQ84Syuh/HRR77711Ni7JMh+YIlUdSveHsDjxUeppZoimrTRG2y
 F9fjX9kvoSgG4MypW5piimL2R9yk=
X-Google-Smtp-Source: AGHT+IHDtLS42hpyEP9uSJwLpq3epQxCgl+pjLxCfyMyr2PiLzXmGhsYXFFccicMl8yIiaaMiKpyNlk+AC+MFBmqn8c=
X-Received: by 2002:a17:90b:804:b0:2ab:87c3:d12c with SMTP id
 bk4-20020a17090b080400b002ab87c3d12cmr2546212pjb.2.1713541004691; Fri, 19 Apr
 2024 08:36:44 -0700 (PDT)
MIME-Version: 1.0
References: <20240419021847.16585-1-jiapeng.chong@linux.alibaba.com>
In-Reply-To: <20240419021847.16585-1-jiapeng.chong@linux.alibaba.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 19 Apr 2024 11:36:32 -0400
Message-ID: <CADnq5_NnC2ziUe8wwXKpw1yQf9phx36Gb3hm0gRhURZNp0Mo+g@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Remove duplicate dcn32/dcn32_clk_mgr.h
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

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

And applied.  Thanks!

Alex

On Thu, Apr 18, 2024 at 10:37=E2=80=AFPM Jiapeng Chong
<jiapeng.chong@linux.alibaba.com> wrote:
>
> ./drivers/gpu/drm/amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c: dcn32/dcn=
32_clk_mgr.h is included more than once.
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=3D8789
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>  drivers/gpu/drm/amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c=
 b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c
> index 7eecb3403f74..d7bbb0891398 100644
> --- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c
> +++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c
> @@ -41,7 +41,6 @@
>  #include "dcn/dcn_3_2_0_offset.h"
>  #include "dcn/dcn_3_2_0_sh_mask.h"
>
> -#include "dcn32/dcn32_clk_mgr.h"
>  #include "dml/dcn32/dcn32_fpu.h"
>
>  #define DCN_BASE__INST0_SEG1                       0x000000C0
> --
> 2.20.1.7.g153144c
>
