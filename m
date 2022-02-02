Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AAC04A7B87
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 00:10:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 235DD10E67B;
	Wed,  2 Feb 2022 23:10:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC89C10E663;
 Wed,  2 Feb 2022 23:10:53 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id e81so1267206oia.6;
 Wed, 02 Feb 2022 15:10:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QFPvU3m3nNCphV2xKrhWgV0aqhe4pVrtWvbA9ob9jJA=;
 b=XPwWJPECu0OQvpbmvXKFvImCF/9S/T5giVTWJ73LDI2jTIACSbfixnl/qm9fsPvIV/
 muY2r7sLlegn9A+mZfYx0wdffcufqt5U2SE8zV43u+CsCUJ9frDKlsrybXpubFhbj0Mz
 Bhxgo6+I6nRhmjD/IgmX0J19CEPHf+YG1/AqD2UJtPFlHSZM3LdIsZwOPcMvBnFBtPrz
 FVPqbsB/utqoh2hVHsqM+D7YY1ASQ53wMgfEAQSOgAfWytidX5yL2V/GK/3U98VHeZ7x
 QbD0pYR4EPfOZmei9c6Ixw3ow4IUT1NBOiFjouwIwp/iWhBDbIQeZbwA6TiRNN1xxKJs
 hPyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QFPvU3m3nNCphV2xKrhWgV0aqhe4pVrtWvbA9ob9jJA=;
 b=evBYaIie4uwvGo5cbG4wF7CizDcWrjZYlNfWTr7/R1Sk5Y8ITs1E4CIoI+ZbOZu55E
 TAXTqV2evZkQyJDNImwQOKS+GWkjyxVNn1FipJVFr0YHXwQTFSeHfC5IkFaejV5i5nIm
 GQVH+6nEWHAQHwwPg5a9NoA5g5uXmXUUuO8DXjEW0AR7Esui2s4w16Sn0QOXbF8ZUPsK
 8eR9ibYBnYs4tITuXrra67q6psZV9ghyJ5ixI/LFtifecHOZESBPtG8CwevinOaaAWa+
 OGwZqa71ZCNjOtavO3lNo/U2LnCpoO1oG00jAtG2Cpxn3mvSCjtugepVB5VANReupVud
 4dXw==
X-Gm-Message-State: AOAM531FaOVG3PbHviwR9vDLez9f7JkGaUFPKGKTKxerYTHN9EZokeLG
 Y9174ai9pv1MrqWYC7wDFGlyzwz572e6mxM70YE=
X-Google-Smtp-Source: ABdhPJxQpJPdMWGuc5v2246SX0mSPx1BcVp8or5TappW5d2BJQ7794woOwsy2AQnf4yWVgn2gfaDHD2seTU1QUHxHIY=
X-Received: by 2002:a05:6808:159e:: with SMTP id
 t30mr3720621oiw.132.1643843453063; 
 Wed, 02 Feb 2022 15:10:53 -0800 (PST)
MIME-Version: 1.0
References: <20220202213856.409403-1-magalilemes00@gmail.com>
In-Reply-To: <20220202213856.409403-1-magalilemes00@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 2 Feb 2022 18:10:41 -0500
Message-ID: <CADnq5_N2GtUciR7agvCR6d=C5r9Ek2mcRsT3qcOUFfEYk57ksA@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Use NULL pointer instead of plain integer
To: Magali Lemes <magalilemes00@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: kernel test robot <lkp@intel.com>,
 "Leo \(Sunpeng\) Li" <sunpeng.li@amd.com>, xinhui pan <Xinhui.Pan@amd.com>,
 "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@linux.ie>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 "Deucher, Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Wed, Feb 2, 2022 at 5:20 PM Magali Lemes <magalilemes00@gmail.com> wrote:
>
> Assigning 0L to a pointer variable caused the following warning:
>
> drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dsc/rc_calc_fpu.c:71:40:
> warning: Using plain integer as NULL pointer
>
> In order to remove this warning, this commit assigns a NULL pointer to
> the pointer variable that caused this issue.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Magali Lemes <magalilemes00@gmail.com>
> ---
>  drivers/gpu/drm/amd/display/dc/dml/dsc/rc_calc_fpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/dsc/rc_calc_fpu.c b/drivers/gpu/drm/amd/display/dc/dml/dsc/rc_calc_fpu.c
> index ec636d06e18c..ef75eb7d5adc 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/dsc/rc_calc_fpu.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml/dsc/rc_calc_fpu.c
> @@ -68,7 +68,7 @@ static void get_qp_set(qp_set qps, enum colour_mode cm, enum bits_per_comp bpc,
>         int sel = table_hash(mode, bpc, max_min);
>         int table_size = 0;
>         int index;
> -       const struct qp_entry *table = 0L;
> +       const struct qp_entry *table = NULL;
>
>         // alias enum
>         enum { min = DAL_MM_MIN, max = DAL_MM_MAX };
> --
> 2.25.1
>
