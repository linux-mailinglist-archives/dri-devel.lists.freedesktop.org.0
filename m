Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 855788C9F63
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2024 17:12:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8584710E0D4;
	Mon, 20 May 2024 15:12:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nX8JwXgd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51EA610E0D4
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2024 15:12:16 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-1edc696df2bso10979165ad.0
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2024 08:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716217936; x=1716822736; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Wz2DF7y1Qr5mH4wb4c2w0AUoZg9A/thbi3cZqGi2HnM=;
 b=nX8JwXgdweDthDj0iPieLDoZJitt5KGs+1TRh/pSqIzyONpZ0Lr6CrhFE3SGULCLp8
 ORTuHIl7dAigOyWtl6zJljs+WaltWdcbm2eNEtPfkLRQTEWSpWrS8kUHC05eFd7TSXMm
 c9PceyfaLWqITyibSw+q3Fu84UvEwFEpJ9R0CEgFuEkwxMTvdmQSnrGD4RklYkRRHLam
 FJ/DGSG4DGUZpYUXDehj54yejvQtj7Jc/imIBaoWp10iUvWXgsNayOjnzw9ZZix6c0ld
 yHt0RAycaR35hc7D7wR4uXjCcUcwjvjihpJnJGznuz8zL0PyxsFZpAvcBnYionTfH7sb
 KnWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716217936; x=1716822736;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Wz2DF7y1Qr5mH4wb4c2w0AUoZg9A/thbi3cZqGi2HnM=;
 b=C46YjAQqudGf7tx+SeZQsCtdidmVapwhk+sk7emCh/hXjDLNLBPEf94Rgjf5ZDMsWy
 OzoZqTBqBLMkNXLEz88r3fTQ4Dg1rVOqQ+JgH0+FAyRcHG5/kSdEKXWed10s7CwNkA7d
 wgypPw1dA1AkEuxv1dgJZH4NqdAA1fAWG6l3SuDLS6twoMHhZOJSiMN67WNu1GUD7IRK
 gLY8vGszDp3aodj5Nupr+Qix8qYEP096cr1JSy9VygVl9kcc3JINqfLvqFv6F8aHM/Jd
 D0wvbm0tP2+dDBPmhw+ZfYWzHcG7vlZ7oSYb6RSUJrUX6GavezC4lJtrJfRvI9ltF9Cs
 GIlQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUddyo2Auy7bKe+LbW9nJB4OGJJxQTqKYA2MEZe+6gg8HFbnqgZMfM08mQqNMwV3ppX+lNFfSlHey8c4lJcVUyRdhik3duSnCCuglUDRRV7
X-Gm-Message-State: AOJu0Yzv3xQq+XyawBQuOdHgek2u0kymFFqrbZxpj0sevcIl/SugN0j7
 QtmMuC+7Xbn68UwNneAi+0CDaMrY1c1vESFCm9Tc/ZlOWmm/M8obXFS+q5Wq2fnObHHJa4qAC9K
 g+6IZNeyLhFiggNwoBGYTYmlRcdU=
X-Google-Smtp-Source: AGHT+IEVcRvxcDC68E699ppW3ZebEFtvfHkfkJZmo7cCBgvWqWCG855W+ec0A4hUDM8jqcLX3i9PK8jreumPYZwOBjA=
X-Received: by 2002:a17:90a:cf0e:b0:2ae:cffa:9b2c with SMTP id
 98e67ed59e1d1-2b6ccd8e06dmr25209675a91.44.1716217935699; Mon, 20 May 2024
 08:12:15 -0700 (PDT)
MIME-Version: 1.0
References: <20240517233548.231120-1-linux@treblig.org>
 <20240517233548.231120-4-linux@treblig.org>
In-Reply-To: <20240517233548.231120-4-linux@treblig.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 20 May 2024 11:12:04 -0400
Message-ID: <CADnq5_OwD0=y2UKJ3Ajp54_dGzs-LCwLe1wtcqE19r5qpLzrCA@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/amd/display: remove unused struct
 'dc_reg_sequence'
To: linux@treblig.org
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com, 
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org, 
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

Applied the series.  Thanks!

Alex

On Fri, May 17, 2024 at 8:12=E2=80=AFPM <linux@treblig.org> wrote:
>
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
>
> 'dc_reg_sequence' was added in
> commit 44788bbc309b ("drm/amd/display: refactor reg_update")
>
> but isn't actually used.
>
> Remove it.
>
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> ---
>  drivers/gpu/drm/amd/display/dc/dc_helper.c | 5 -----
>  1 file changed, 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dc_helper.c b/drivers/gpu/drm=
/amd/display/dc/dc_helper.c
> index 8f9a67825615..b81419c95222 100644
> --- a/drivers/gpu/drm/amd/display/dc/dc_helper.c
> +++ b/drivers/gpu/drm/amd/display/dc/dc_helper.c
> @@ -91,11 +91,6 @@ struct dc_reg_value_masks {
>         uint32_t mask;
>  };
>
> -struct dc_reg_sequence {
> -       uint32_t addr;
> -       struct dc_reg_value_masks value_masks;
> -};
> -
>  static inline void set_reg_field_value_masks(
>         struct dc_reg_value_masks *field_value_mask,
>         uint32_t value,
> --
> 2.45.1
>
