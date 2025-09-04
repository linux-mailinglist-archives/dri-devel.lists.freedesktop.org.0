Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E46B44039
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 17:16:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5599710EA7B;
	Thu,  4 Sep 2025 15:15:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VffD2WVQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3850910EA99
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 15:15:58 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-248e01cd834so2331095ad.0
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Sep 2025 08:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756998958; x=1757603758; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A9Jq0Qss5RqOroarhNVXi84lrn3E/aL/e2HhwPAXgdE=;
 b=VffD2WVQBNQBbNUNNbullSSxJ/PY3m1VJOCf6lUwTOpIIqUpxYQ8gwHOZ8Jo6VnyVp
 b2iGyl52uxeeyKUZkRWPFtIvzRdLnTUVS0NKugJYa0vn+R7885EQZPueCILC4PHQNgK8
 1AlwteiSvaeBLTTSjBb8s6KFNcYMxuEq7HWRnTlx4bYoiFhr2CoVqYZlyoZWgodmfrKy
 2jUYH2+1P9SEjbBY0J83pQl1cyWeUNZT8ynednTV7fraknGttcfCgVwa9C2BNs5JMbkB
 z+tvA+tMT603+y9HILNf7vh75oEQ814Jzg/UNXFeCg4coUBCZa/9lDZWayMWUff5T39/
 xLPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756998958; x=1757603758;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=A9Jq0Qss5RqOroarhNVXi84lrn3E/aL/e2HhwPAXgdE=;
 b=fCPvAjrXUyAwt7hxxMJvEjc7yvWQABLk1LsfU5hu2Dumjme2gH5VCPyENTrx3rbqo2
 Ctr/ffxQmonFJ/hWMOazyT0Wojery66hXTRs6wHCufDjUqAvHoCS9GQse+8e7D1OxHE+
 gJb4b4iI/vl3jGX+KxqIO/gU5p8x6YETCIYWdaw1/NZvumDfyx++GID6dYuGatEt+5d5
 TNPgUYxw0MQiBTA064CNhtFf21JyzuNkX+GJ0RbI4p1pk5VotinkVVneY7em36hZmFxs
 aMENeF/m5RS84Xx+QDRKPT6X2xFQ/P2R8t0jelO6wJgCy/8+V/PATm9a6/WM69oYLidl
 2lZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVCjov1zkDGIQBoo7Yhw49U1q2FHxoQ/isVd3hg9aTnu9YvlAOUmlRS2eMYnNsIu5tdwCUBHPYYmx4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy39+mkqNInE7vZYgqi9+V3dGMOtm/ewf4DXHYE2y4N/hAQnOHZ
 QD+dKnv43RGvHDQoNmhcvUXsQ/wPRgZ3K2/r95a8GjDnbfpjzbp6x2UNleSd0g5Ol9vfKViLjY2
 6AzDX0r5NNxU5nYOAeuo1Zktn786cTffZQA==
X-Gm-Gg: ASbGnctubnCdSfmT3jNRfkdCyoL3233io2Ff/yxz8/uCg13n9D4bgEfBfHp8iAAA1HE
 dvLzIqSsndtG8yjxZFVPWqKt1w3+ZXAEDtOPhjhUFJiPis6IB0DRFcAM5DvRpeZtifD8dlnE1ZZ
 6R5S7IUzX2cLaJ6DjDbOSVK1OsJ4NREWWFYxMBn/X+lWqr8toJH/AEcP5T4H0610JAXVe9ejsyT
 EJdNptcsMEwXJrU7w==
X-Google-Smtp-Source: AGHT+IF65tvTv3v42r1JI9j62M5o5qPYw1oDc/yG7KI7ueINNwA7BlbdkkzA9BhPG147OhT975Nb20L/xrlEM5e+oLE=
X-Received: by 2002:a17:902:f54d:b0:24c:e213:ca4a with SMTP id
 d9443c01a7336-24ce213cdacmr9525015ad.2.1756998957514; Thu, 04 Sep 2025
 08:15:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250904145807.556882-1-rongqianfeng@vivo.com>
In-Reply-To: <20250904145807.556882-1-rongqianfeng@vivo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 4 Sep 2025 11:15:46 -0400
X-Gm-Features: Ac12FXxv0FUvBauKct_Lpu4EMKY0aLOZVPk2DGipspAwts4gAS5Q2uAmVAt2310
Message-ID: <CADnq5_Mxryr36q_Sj1xPQEmBsnMmxoAo_hksrqewH0=Ae7_pvw@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/pm: use int type to store negative error codes
To: Qianfeng Rong <rongqianfeng@vivo.com>
Cc: Kenneth Feng <kenneth.feng@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 "Dr. David Alan Gilbert" <linux@treblig.org>, Lijo Lazar <lijo.lazar@amd.com>, 
 Boyuan Zhang <boyuan.zhang@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
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

Applied.  Thanks!

Alex

On Thu, Sep 4, 2025 at 10:58=E2=80=AFAM Qianfeng Rong <rongqianfeng@vivo.co=
m> wrote:
>
> Use int instead of uint32_t for 'ret' variable to store negative error
> codes or zero returned by other functions.
>
> Storing the negative error codes in unsigned type, doesn't cause an issue
> at runtime but can be confusing. Additionally, assigning negative error
> codes to unsigned type may trigger a GCC warning when the -Wsign-conversi=
on
> flag is enabled.
>
> No effect on runtime.
>
> Signed-off-by: Qianfeng Rong <rongqianfeng@vivo.com>
> ---
>  drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c  | 2 +-
>  drivers/gpu/drm/amd/pm/powerplay/smumgr/smu7_smumgr.c | 2 +-
>  drivers/gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c       | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c b/drive=
rs/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c
> index 9a821563bc8e..14ccd743ca1d 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c
> +++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c
> @@ -1032,7 +1032,7 @@ static int smu10_print_clock_levels(struct pp_hwmgr=
 *hwmgr,
>                         data->clock_vol_info.vdd_dep_on_fclk;
>         uint32_t i, now, size =3D 0;
>         uint32_t min_freq, max_freq =3D 0;
> -       uint32_t ret =3D 0;
> +       int ret =3D 0;
>
>         switch (type) {
>         case PP_SCLK:
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/smumgr/smu7_smumgr.c b/driv=
ers/gpu/drm/amd/pm/powerplay/smumgr/smu7_smumgr.c
> index baf51cd82a35..0d4cbe4113a0 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/smumgr/smu7_smumgr.c
> +++ b/drivers/gpu/drm/amd/pm/powerplay/smumgr/smu7_smumgr.c
> @@ -401,7 +401,7 @@ int smu7_request_smu_load_fw(struct pp_hwmgr *hwmgr)
>  int smu7_check_fw_load_finish(struct pp_hwmgr *hwmgr, uint32_t fw_type)
>  {
>         struct smu7_smumgr *smu_data =3D (struct smu7_smumgr *)(hwmgr->sm=
u_backend);
> -       uint32_t ret;
> +       int ret;
>
>         ret =3D phm_wait_on_indirect_register(hwmgr, mmSMC_IND_INDEX_11,
>                                         smu_data->soft_regs_start + smum_=
get_offsetof(hwmgr,
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c b/drivers/gp=
u/drm/amd/pm/swsmu/smu12/renoir_ppt.c
> index e97b0cf19197..3baf20f4c373 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c
> @@ -470,7 +470,7 @@ static int renoir_od_edit_dpm_table(struct smu_contex=
t *smu,
>  static int renoir_set_fine_grain_gfx_freq_parameters(struct smu_context =
*smu)
>  {
>         uint32_t min =3D 0, max =3D 0;
> -       uint32_t ret =3D 0;
> +       int ret =3D 0;
>
>         ret =3D smu_cmn_send_smc_msg_with_param(smu,
>                                                                 SMU_MSG_G=
etMinGfxclkFrequency,
> --
> 2.34.1
>
