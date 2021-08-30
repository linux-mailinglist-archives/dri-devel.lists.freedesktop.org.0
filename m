Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6185A3FB9D2
	for <lists+dri-devel@lfdr.de>; Mon, 30 Aug 2021 18:08:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07C5789B00;
	Mon, 30 Aug 2021 16:08:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com
 [IPv6:2607:f8b0:4864:20::c30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05DF289A9B;
 Mon, 30 Aug 2021 16:08:34 +0000 (UTC)
Received: by mail-oo1-xc30.google.com with SMTP id
 s21-20020a4ae495000000b0028e499b5921so4728799oov.12; 
 Mon, 30 Aug 2021 09:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LGlCF90Prh9n2u4Ctzp39bN3k2Aae1fS0uTteqOOBpc=;
 b=mrVvliaOqJAmn24rQVts3jWqm9+elkBzrK2b9vJvkzvlwz70Yil6U0wo9wTtfPSmoC
 earDKTMDrNEG8GYBXXs+6p1dbZUnYbABpKt139wDyV+r4m5sqXbT1DNUdcJadF1SVePo
 YpCq5kQtn31N2J+nwYNzrI/J+EuoALojR2mWs1J2qIBCBH6kTV5D4iWcFKntFZutsTmh
 OSJtjxLITUP1ag4fIuH+ZwHbzGrCqvsUMVi6zQ2zuw/ob6nxJap6fT9P/xbRP3D0IZ9H
 0gOS2P534zFZSTK5045enfzLub1nXpORbBckmHcAXBf3/yptCWFVbBE+uvEubPj50z9E
 dkIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LGlCF90Prh9n2u4Ctzp39bN3k2Aae1fS0uTteqOOBpc=;
 b=LOCRR9PnAt1cUGYDQ3ZkRG9w5JO2BoZepwSaKYiNFiuvZ3C6PIJTd4pKuV17ooillx
 /F0JyiBz1xlKpx67boquyoM7M1cEV1KWpltHGp88lNPsT5lg+AOVY0PqB5awpvz65yE3
 BwZnDwEVGHL3tY2zbwx1yWGh5hlilLdDXOGjp3x5/7s7svtm4c+0zu2SXAsCtaUqCq2v
 TX4ad5duF0bdJxUWotcAXmLuLSiLZAmAAT4eJOxl/WZ8XUtA1byhyBpDDcZP1llh9q5n
 JmbQ9IEInwnXc0VpuqczKtF23lu43IlOQAOr5EEAPn2G1KXoSKh1DREYrj0Rwxqks6K1
 WsfA==
X-Gm-Message-State: AOAM530/O0SfjO8FiYnoMGIVrsWxd0qKFj5TpOCd2uXQ8SRmQ2rOJCl6
 BE0rwk/8u326L1sdR+lkz/vt3EQ/eMN34bHZwnk=
X-Google-Smtp-Source: ABdhPJxEwEYq7i5z/6MNA82j5/B7YYx63K32JCp9xiws2ESkd7l/CkxeG4uSyZ7nJAQweRTkvQl4bNyL34+7e8vS7BE=
X-Received: by 2002:a4a:d108:: with SMTP id k8mr10606732oor.90.1630339713364; 
 Mon, 30 Aug 2021 09:08:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210829164624.531391-1-colin.king@canonical.com>
In-Reply-To: <20210829164624.531391-1-colin.king@canonical.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 30 Aug 2021 12:08:22 -0400
Message-ID: <CADnq5_OGXeUJ5ArNyzHQ1mRqfKd57kHbaRY+hCJeLYRBsqxr_g@mail.gmail.com>
Subject: Re: [PATCH][next] drm/amd/display: Fix unused initialization of
 pointer sink
To: Colin King <colin.king@canonical.com>
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 xinhui pan <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, 
 amd-gfx list <amd-gfx@lists.freedesktop.org>, 
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Sun, Aug 29, 2021 at 12:46 PM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> Pointer sink is being inintialized with a value that is never read,
> it is later being re-assigned a new value. Remove the redundant
> initialization.
>
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index e1e57e7465a7..9331c19fe9cb 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -10917,7 +10917,7 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
>         struct amdgpu_dm_connector *amdgpu_dm_connector =
>                         to_amdgpu_dm_connector(connector);
>         struct dm_connector_state *dm_con_state = NULL;
> -       struct dc_sink *sink = amdgpu_dm_connector->dc_sink;
> +       struct dc_sink *sink;
>
>         struct drm_device *dev = connector->dev;
>         struct amdgpu_device *adev = drm_to_adev(dev);
> --
> 2.32.0
>
