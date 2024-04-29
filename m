Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A9128B5EB8
	for <lists+dri-devel@lfdr.de>; Mon, 29 Apr 2024 18:16:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E5AA10EEA8;
	Mon, 29 Apr 2024 16:16:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ISv8Ehtb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 133B110E825;
 Mon, 29 Apr 2024 16:16:09 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-1e4266673bbso41567165ad.2; 
 Mon, 29 Apr 2024 09:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714407368; x=1715012168; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=up3/fdKYbKn8KYnOeLYCwwUMCKqtp/CYqkoyNeCtLiA=;
 b=ISv8EhtbXFVqFrUrSXlGg/DsDlXtWgjBuLr8MwM6bZ2JgMn8fZLSaZ7IeVWeImX8dd
 Zj97ewGan2Uqxg0qKH10Ao4zh3QDZVgHD5WKq6jJyVZ1eAMXeVg0ZVXx07kt7zuY7lwC
 3v4YrWPCBktEg22DQIGJne034j+FRIQQXSm3LAVSS4QYb4BusNZODBfVTl7OQkZwgHQ4
 aXC3TxY2mYr0wDf2/QWFclcgOlVIbU+quIsRwc1st6PG/7ThS93UhVdcQKj1zw3gKmMk
 CfUcpnXXkEwCW2nvX/flwy6GTrkzCmMDqpS4Oka4t+ZQV6VrlFETOsAuB290wkMV9dDy
 LjSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714407368; x=1715012168;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=up3/fdKYbKn8KYnOeLYCwwUMCKqtp/CYqkoyNeCtLiA=;
 b=dfkB1puPIgd0l0xl8Lk7UBmfgOk9Sttxwjdgwvwzn1ZbF02fUcFMYt4NTPN7FGQUxJ
 tGMBvsZ+Fz6cbJ8Yfy/nh6VZhO6QLAn40DgaHfn4U+9rmGFOryq7E6dF/oGn7igzyfOL
 1CGvYeHTlH8vmNheG10aRqmFPgmjC1rP2LJRmc8tBQPHezhGmcbapJU64cq/9MmNdTab
 JNgHFZv01tPVRYX/E2N7s3TDjpuvq8qWjAxFR9C6mlVgu6YvQ5nsqfuLZzXCw12KCFdd
 alo5LdqLwne6BMGSB4ZJMYOe3RnO4K7fYYphLxI11MG5zoNTgMdb8AXBjYzeQcALeLZa
 Iaew==
X-Forwarded-Encrypted: i=1;
 AJvYcCVad+0nkuyh3o4bD2zUz7Zd1CarVvp8OkYCQs0VhTRUHFYc255QXUjdD3IipWZZWxCpqzqQDpwK3c4i6bJ+zTNxClNWu5zo77rkv32MYdWuWj0jQhXyM60yPcOzu0jDSndRzLhvzRY9DaIFwnEjgQ==
X-Gm-Message-State: AOJu0YydTmnzLkacb3a8zF9kROx0kfQy9+XKrdx5PjVMiGqVY+TZuKZ5
 dm69jZHsPQ82p0Ih3l0J7KyQ69tRQLQ65dPQhWOI5ljeDfcNPM+V+P0/UwyCZZtcOdI1GvaJKzd
 JKq2RT7CUzoBMwr8dpwDwtBg0MTY=
X-Google-Smtp-Source: AGHT+IGfPQVfcz7PbTTS7VQY2ZPnXSQy2u3EbjBP8lla+K7zNwQzvnmc4QBBgeu2oV6hTU4MQBLIuwwekvrVEROpSrg=
X-Received: by 2002:a17:903:1246:b0:1e4:31e9:83ba with SMTP id
 u6-20020a170903124600b001e431e983bamr13341631plh.1.1714407368452; Mon, 29 Apr
 2024 09:16:08 -0700 (PDT)
MIME-Version: 1.0
References: <20240425013553.35843-1-jiapeng.chong@linux.alibaba.com>
In-Reply-To: <20240425013553.35843-1-jiapeng.chong@linux.alibaba.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 29 Apr 2024 12:15:56 -0400
Message-ID: <CADnq5_OcjDhKHeH32VZrie4j2S4umkxukzSygXyfC3sq-zY2gg@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Remove duplicate spl/dc_spl_types.h
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

On Wed, Apr 24, 2024 at 9:52=E2=80=AFPM Jiapeng Chong
<jiapeng.chong@linux.alibaba.com> wrote:
>
> ./drivers/gpu/drm/amd/display/dc/inc/hw/transform.h: spl/dc_spl_types.h i=
s included more than once.
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=3D8884
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>  drivers/gpu/drm/amd/display/dc/inc/hw/transform.h | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/transform.h b/drivers/=
gpu/drm/amd/display/dc/inc/hw/transform.h
> index 5aa2f1a1fb83..28da1dddf0a0 100644
> --- a/drivers/gpu/drm/amd/display/dc/inc/hw/transform.h
> +++ b/drivers/gpu/drm/amd/display/dc/inc/hw/transform.h
> @@ -31,8 +31,6 @@
>  #include "fixed31_32.h"
>  #include "spl/dc_spl_types.h"
>
> -#include "spl/dc_spl_types.h"
> -
>  #define CSC_TEMPERATURE_MATRIX_SIZE 12
>
>  struct bit_depth_reduction_params;
> --
> 2.19.1.6.gb485710b
>
