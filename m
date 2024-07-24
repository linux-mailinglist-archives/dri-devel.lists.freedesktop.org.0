Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F62793B54C
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2024 18:52:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 750D510E74D;
	Wed, 24 Jul 2024 16:52:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Mx1J8R2W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8036D10E6AB;
 Wed, 24 Jul 2024 16:52:30 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id
 d2e1a72fcca58-70d265e5278so2304198b3a.3; 
 Wed, 24 Jul 2024 09:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721839950; x=1722444750; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nHOSXKCOPqcvZd3Rls/ZcliizqiZMqlPEJyXkYPHW+4=;
 b=Mx1J8R2W2vGdu4rqm14CYKMMTEOzwu18Q/B/FE7U3SCRFeGQR4N2lQ+GAkySEtt/zk
 PNrbN9uyRSEr6Wn7XXklqQ4Uth0qPlOQRstiBGf0m6e5Ufdy3DvVqEqmxujea5K032TD
 g3E6zS0U4/HqXI8LvGXsj7BYr9TTCbsSnVfZ/3zLl6rxNb2/6KLo/ojVOGK3XMqtvj8T
 OYe3fg6/rcAQeXheH5tnmV3RiDBSQBcyEbwxVNdG5VXxhql01Iij5t82ZMAn+oTAtUMN
 ufsLakD7gvVub/LPFAAwARyBm/H6lcUnJHxpWyw8T7L1GgzQKPdreBcEEQY22Jfg9/qA
 BiiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721839950; x=1722444750;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nHOSXKCOPqcvZd3Rls/ZcliizqiZMqlPEJyXkYPHW+4=;
 b=RzGUHJolaSp213rSn8lxDKCQiAhygGhWlyNaX79Jtxp5ugR6BuzgHo8NtwpqlpfAJN
 xYYYhjeEspbt+LUlmsUXhsywLGmFzsBc6eIGD8E7AjzMihYFccUVvfD/dMUfFWKQg0gD
 wL2JAlRXJJyY/q7pzJbrrdDqgCsMCtYFLFov50MHXfu0bbvIBWHBCN8crVW94B40x6Sd
 6r4OoKSgI5RSaw5vSuzeNCP7O5HtyrkzdU0PU/wbU3tujAE7m3A3+h3jXZ9SxwLc2Les
 q4lcwRqgQp3xdiDEEHREWcUWaoZwQ7M9MmzBv87gkSCswBoUdLbjlRQadvMefKH2ZmAH
 wYLA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWsGG0qhAiGl10zk+QMMPZrgxF2aTNkcWN4di9fHA9rJnesAu+9oPx3V+cfpmzGVwWqcOxAt1aDHBYH+SDSpvP1zKx9e9N3D7mTRvPMtIVaFxYOXb58N4NvAqFyi5ctHt6vU8O+3jX1V4yIq0/YpA==
X-Gm-Message-State: AOJu0Yxo04bkZWe2ienTf1volITsYW3M8ha2ET4IeCn88YqYqnWbh+oE
 pMGBnjOjMtGgpbw0dx5dpR1FcnIgRpZJsGHrWaB8k3v3tdkzZMWO+urwNNJun3+2g1vIOw/BO8X
 OEntqpkbBjgbdMrQIqtiJGbgY95s=
X-Google-Smtp-Source: AGHT+IGVCG7JOT9xlzQlknfmeT16tN//PMYw1q63fUNnGbcSCCLdEteVrx6kyG3bL5BZWl10luLLhTaTz3653TByswQ=
X-Received: by 2002:a05:6a00:b51:b0:70e:8e3a:10ee with SMTP id
 d2e1a72fcca58-70eaa8f52camr96225b3a.21.1721839949856; Wed, 24 Jul 2024
 09:52:29 -0700 (PDT)
MIME-Version: 1.0
References: <20240724132428.2468883-1-colin.i.king@gmail.com>
In-Reply-To: <20240724132428.2468883-1-colin.i.king@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 24 Jul 2024 12:52:18 -0400
Message-ID: <CADnq5_NHwwva2vN+MjnPohpjmzW0F5uLHN1bby1jUBiqetL6uA@mail.gmail.com>
Subject: Re: [PATCH][next] drm/amd/display: Fix spelling mistake "tolarance"
 -> "tolerance"
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Leo Li <sunpeng.li@amd.com>, Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Wed, Jul 24, 2024 at 9:50=E2=80=AFAM Colin Ian King <colin.i.king@gmail.=
com> wrote:
>
> There is a spelling mistake in a dml2_printf message. Fix it.
>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  .../display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c  | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2=
_core_dcn4_calcs.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_cor=
e/dml2_core_dcn4_calcs.c
> index 0b671c665373..5ba38d51382f 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_d=
cn4_calcs.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_d=
cn4_calcs.c
> @@ -8267,7 +8267,7 @@ static bool dml_core_mode_support(struct dml2_core_=
calcs_mode_support_ex *in_out
>         dml2_printf("DML::%s: mode_lib->ms.DCFCLK =3D %f\n", __func__, mo=
de_lib->ms.DCFCLK);
>         dml2_printf("DML::%s: mode_lib->ms.FabricClock =3D %f\n", __func_=
_, mode_lib->ms.FabricClock);
>         dml2_printf("DML::%s: mode_lib->ms.uclk_freq_mhz =3D %f\n", __fun=
c__, mode_lib->ms.uclk_freq_mhz);
> -       dml2_printf("DML::%s: urgent latency tolarance =3D %f\n", __func_=
_, ((mode_lib->ip.rob_buffer_size_kbytes - mode_lib->ip.pixel_chunk_size_kb=
ytes) * 1024 / (mode_lib->ms.DCFCLK * mode_lib->soc.return_bus_width_bytes)=
));
> +       dml2_printf("DML::%s: urgent latency tolerance =3D %f\n", __func_=
_, ((mode_lib->ip.rob_buffer_size_kbytes - mode_lib->ip.pixel_chunk_size_kb=
ytes) * 1024 / (mode_lib->ms.DCFCLK * mode_lib->soc.return_bus_width_bytes)=
));
>  #endif
>
>         mode_lib->ms.support.OutstandingRequestsSupport =3D true;
> --
> 2.39.2
>
