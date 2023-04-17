Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A9D56E50CE
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 21:26:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0190610E156;
	Mon, 17 Apr 2023 19:26:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA96210E149;
 Mon, 17 Apr 2023 19:26:21 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id bb20so12560294oib.12;
 Mon, 17 Apr 2023 12:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681759581; x=1684351581;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JgR9yWNpXpcXRujoJTOWZN4Ac0PmAsb3IYAK2OBiNYA=;
 b=A8POwEXBtxt+z9gTMk5vE9Iw0O2L50tlrIpIBNPihPRGY7iBhlfQHgpQV6cMdIguFV
 Zc7g/Mr6qy2w/TL+uwD/XDpQIRYhH/ZwzlmUvA+j3NNU8FdP4OWsfnhrwwrL2pykM1bV
 qEkfNp/kQFga0y8gsJYNwNPF5gOJRRBDyCQLoK9+GJLxNd8YZOVCUMBLxXMyYZjP63XF
 /7n09KvbS0laZg1caprKHGE6Mm2+/UgcR4wfeTHxPXGqi0BAHGl64bQKA7VFgpIAYYa7
 sBR5CsJrsBSSTKsK7OtL04IfWLFtkNo53bRHTAotAV7mhQtYwR9SOj+KjFuJum5Pha8g
 jW3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681759581; x=1684351581;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JgR9yWNpXpcXRujoJTOWZN4Ac0PmAsb3IYAK2OBiNYA=;
 b=CzJLf1ZztKIFTHIqNhU3x9phIzOyKYB54+0Qvs+PRaujP90wr1lPWUmVuqxORuQb1j
 r+da9tHZksT7+T5HtNKrw+mSecqViqg1yTujy8GtEggaRhUgEdoAgDHicUSWpivOw2aS
 ePoLO1t3OQjJ/x4aY9k7uhyKvzKo98owVESF3Aztfn9XtqP6wM9+il71LXx+bVod6W8V
 GkKprC/lDRuLQFagvWF3KjpkEq/qCIgsbGfi2eEyv9ghozsFuvE6r2/ci55urqQ2MV6B
 4+1SViJnCnfp0SNXyi8bpPVj97yxVyM3CD4X272qqJwKoO3Suh8UFykHG1rfi3LTuCSS
 XZHA==
X-Gm-Message-State: AAQBX9cMZxto9nu0j70qC8GhGPrz5oODE9bFCMV3QeHGx+dibheJ4LoK
 S1+qu70MjPLTI5uwPJWsx9aMrfzwRNa2qITTk8M=
X-Google-Smtp-Source: AKy350Z22GK6kLG6tHEeqc6xa37gCtz2jfI4yCVpFEw8uzuKlFwUL0hIMP6R+pDki+ZmMO2BdQwHr9XWxrdFNQRgufI=
X-Received: by 2002:aca:f0c2:0:b0:38d:c10a:e7b6 with SMTP id
 o185-20020acaf0c2000000b0038dc10ae7b6mr13624oih.3.1681759579651; Mon, 17 Apr
 2023 12:26:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230417174237.52638-1-colin.i.king@gmail.com>
In-Reply-To: <20230417174237.52638-1-colin.i.king@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 17 Apr 2023 15:26:08 -0400
Message-ID: <CADnq5_MCRciy+zvVmJ0_HeAsYV-g9cMjNoyezhtZP77erFrGsw@mail.gmail.com>
Subject: Re: [PATCH][next] drm/amd/pm: Fix spelling mistake "aquire" ->
 "acquire"
To: Colin Ian King <colin.i.king@gmail.com>
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
Cc: Xinhui.Pan@amd.com, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Evan Quan <evan.quan@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Mon, Apr 17, 2023 at 1:42=E2=80=AFPM Colin Ian King <colin.i.king@gmail.=
com> wrote:
>
> There is a spelling mistake in the smu_i2c_bus_access prototype. Fix it.
>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  drivers/gpu/drm/amd/pm/powerplay/inc/hwmgr.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/inc/hwmgr.h b/drivers/gpu/d=
rm/amd/pm/powerplay/inc/hwmgr.h
> index 5ce433e2c16a..f1580a26a850 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/inc/hwmgr.h
> +++ b/drivers/gpu/drm/amd/pm/powerplay/inc/hwmgr.h
> @@ -359,7 +359,7 @@ struct pp_hwmgr_func {
>         int (*set_ppfeature_status)(struct pp_hwmgr *hwmgr, uint64_t ppfe=
ature_masks);
>         int (*set_mp1_state)(struct pp_hwmgr *hwmgr, enum pp_mp1_state mp=
1_state);
>         int (*asic_reset)(struct pp_hwmgr *hwmgr, enum SMU_ASIC_RESET_MOD=
E mode);
> -       int (*smu_i2c_bus_access)(struct pp_hwmgr *hwmgr, bool aquire);
> +       int (*smu_i2c_bus_access)(struct pp_hwmgr *hwmgr, bool acquire);
>         int (*set_df_cstate)(struct pp_hwmgr *hwmgr, enum pp_df_cstate st=
ate);
>         int (*set_xgmi_pstate)(struct pp_hwmgr *hwmgr, uint32_t pstate);
>         int (*disable_power_features_for_compute_performance)(struct pp_h=
wmgr *hwmgr,
> --
> 2.30.2
>
