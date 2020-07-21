Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ABDE62286DF
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jul 2020 19:12:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C2C26E101;
	Tue, 21 Jul 2020 17:12:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ECFC6E101;
 Tue, 21 Jul 2020 17:12:31 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id 88so11657610wrh.3;
 Tue, 21 Jul 2020 10:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=li6Ai+i2GC9C2OTaxMc0Mm8uFP4T7o+Xp3gc7X+SoOc=;
 b=CBLL6J3+4BY47pbGZDKfS3eUO0MuL+xxmDwYvkPLz+F0w7xObrTNc4OCTQJ77r+PZc
 PkcbMxfQBkNxnJjFM/d/avBDGMSIm4x6knuvfkMPQepOuywO2A7Phgg0HcvmVaoGqS9r
 uY6esEnIkMOUODqmMoAURXJArcolQUBL5vokt043mskZU6k5nicicHp6Non51tsyiWbi
 bAsdGtuT0/xhIBHD/vXN+cjudpAJlhCf9jdhqmMX2mYhMBxZazqDsJuTfdSWwFFxu0Et
 Ky+4GrQATUHqiPJ1Yy+N9iAGQYGaLgE+0CvZurAkFuiDYyTUYv/1Z1cJ+iSs8CDFU6rc
 GkGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=li6Ai+i2GC9C2OTaxMc0Mm8uFP4T7o+Xp3gc7X+SoOc=;
 b=qNKWC15jamFAedVi3WPcRxU6iW85jbSgku7QFw4NOeKyg8hpPr8a2qPa6aFroTiOEQ
 TbjHFyZYnb9oRZwfrOb56+w8MCNQs1lFgHMq4F/7pHvb5jXlHd+/X2pG3r0K9k6N6GFF
 rRU7C+7YHT9JEYWVyc21dJPP6EsTQLbh5oL5BtSWwCJWWdPsgU+6o0Gc8iSZ60kQ+Zog
 qd488Fc5NvJnhNKwcCKqBbf5E+FWjnO5VMN6WZ2Cd8yAYiPGGwjNxf4qKfvP8OM31ePe
 5zV5MB4BzkiHNIJXaE5xC73sXIzpFxRxpUOqwpo76RxnUcPaGBlfgL/5SerW/wlJ7Mvo
 ROfw==
X-Gm-Message-State: AOAM531zyc9p+7VhH6S+pVEfKislVwjD33pq0yBFrngEsWcHMr936B+J
 j+uvzI3X/qTw5d1FIUfTMRlVzClw/1SqHORV6xsw8A==
X-Google-Smtp-Source: ABdhPJz0YdT8vSTroiEpfkQ8rGiMvt24vskGTjqyubws9569N+5uFZFHkZwRAwl+PoYL3HniBDCOUD8LWlWswqc6nPc=
X-Received: by 2002:a5d:618e:: with SMTP id j14mr1345774wru.374.1595351549684; 
 Tue, 21 Jul 2020 10:12:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200717070958.41489-1-qiuwenbo@phytium.com.cn>
In-Reply-To: <20200717070958.41489-1-qiuwenbo@phytium.com.cn>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 21 Jul 2020 13:12:17 -0400
Message-ID: <CADnq5_MbawfSJBQ5xurAcUfu8mxN32aUBNqv=295wgaadxKk9Q@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/powerplay: fix a crash when overclocking Vega M
To: Qiu Wenbo <qiuwenbo@phytium.com.cn>
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
Cc: David Airlie <airlied@linux.ie>, YueHaibing <yuehaibing@huawei.com>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Chen Wandun <chenwandun@huawei.com>, Eric Huang <JinHuiEric.Huang@amd.com>,
 yu kuai <yukuai3@huawei.com>, Evan Quan <evan.quan@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Fri, Jul 17, 2020 at 8:23 AM Qiu Wenbo <qiuwenbo@phytium.com.cn> wrote:
>
> Avoid kernel crash when vddci_control is SMU7_VOLTAGE_CONTROL_NONE and
> vddci_voltage_table is empty. It has been tested on Intel Hades Canyon
> (i7-8809G).
>
> Bug: https://bugzilla.kernel.org/show_bug.cgi?id=208489
> Fixes: ac7822b0026f ("drm/amd/powerplay: add smumgr support for VEGAM (v2)")
> Signed-off-by: Qiu Wenbo <qiuwenbo@phytium.com.cn>
> ---
>  drivers/gpu/drm/amd/powerplay/smumgr/vegam_smumgr.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/powerplay/smumgr/vegam_smumgr.c b/drivers/gpu/drm/amd/powerplay/smumgr/vegam_smumgr.c
> index 3da71a088b92..0ecc18b55ffb 100644
> --- a/drivers/gpu/drm/amd/powerplay/smumgr/vegam_smumgr.c
> +++ b/drivers/gpu/drm/amd/powerplay/smumgr/vegam_smumgr.c
> @@ -644,9 +644,6 @@ static int vegam_get_dependency_volt_by_clk(struct pp_hwmgr *hwmgr,
>
>         /* sclk is bigger than max sclk in the dependence table */
>         *voltage |= (dep_table->entries[i - 1].vddc * VOLTAGE_SCALE) << VDDC_SHIFT;
> -       vddci = phm_find_closest_vddci(&(data->vddci_voltage_table),
> -                       (dep_table->entries[i - 1].vddc -
> -                                       (uint16_t)VDDC_VDDCI_DELTA));
>
>         if (SMU7_VOLTAGE_CONTROL_NONE == data->vddci_control)
>                 *voltage |= (data->vbios_boot_state.vddci_bootup_value *
> @@ -654,8 +651,13 @@ static int vegam_get_dependency_volt_by_clk(struct pp_hwmgr *hwmgr,
>         else if (dep_table->entries[i - 1].vddci)
>                 *voltage |= (dep_table->entries[i - 1].vddci *
>                                 VOLTAGE_SCALE) << VDDC_SHIFT;
> -       else
> +       else {
> +               vddci = phm_find_closest_vddci(&(data->vddci_voltage_table),
> +                               (dep_table->entries[i - 1].vddc -
> +                                               (uint16_t)VDDC_VDDCI_DELTA));
> +
>                 *voltage |= (vddci * VOLTAGE_SCALE) << VDDCI_SHIFT;
> +       }
>
>         if (SMU7_VOLTAGE_CONTROL_NONE == data->mvdd_control)
>                 *mvdd = data->vbios_boot_state.mvdd_bootup_value * VOLTAGE_SCALE;
> --
> 2.27.0
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
