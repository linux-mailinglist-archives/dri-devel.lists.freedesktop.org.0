Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D6CB3925A2
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 05:53:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 717AF89FE6;
	Thu, 27 May 2021 03:53:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 716706EE04;
 Thu, 27 May 2021 03:53:16 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id
 i23-20020a9d68d70000b02902dc19ed4c15so3201673oto.0; 
 Wed, 26 May 2021 20:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=xELwdLuZkH4z5J/GT5DZ6nlHBvDe0H+SPpVnI7wy13g=;
 b=TmggnDhozgQCmX0OhYLFCVOpDbjgeA577yM64a6ut7ns1ezHMJRSgO2pnVjdqj5PJD
 O4V95qVJhmr1vXs1A6LxqWlul6BnPt8LUolysdlJHXbYh0lOOrSeqg0P83GT/QIqZNsB
 T6DlymW8whP61Q0eRhn0gQD9BVRst8fjvJB2fTQ5nMgPcepnJj2bWKXGd5wDkK8LysU7
 XcJylSo1O+w4dYl4AJepSZutperkCMRe45jd/KAUraSplb9Kdf5droC299RyZP7Lfg5E
 LuOQ4FCmx13/Ni6iqeX/4bTIm1W0OoKC35L6kXThacH6YH1f2XPd/luWBAqf1hCiI2bF
 NMLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=xELwdLuZkH4z5J/GT5DZ6nlHBvDe0H+SPpVnI7wy13g=;
 b=mxUwCC1tnEhcda0x+fmt3Z+6VeoSdjHbwHpdQXAS0S9XtuzrPiq0YjpZX+eSu65GyY
 S14OULcKJWryBX+EmnpJ1N8qqyWWubfmYnXZi2ijoaaLdp0Q50k3dMAfnHTcRH2mTvDh
 c+sulZiOzXaWO8fkmJE7zglpgxkWuvy1QXr2/PjoRjVvHlueJE8gp3fNNhtkYMQu5GSb
 Ty32KbtTijHqef/L8rGJ21EYMkGUY0/66FR16dIrzye7G8vt1r4cD/s8asNJs0YwM+p2
 ZoRL657rVCaWjAfkSdowot2LzWAXTZFTZ1BA4QUJRm3jOsqSlDddCRf+BpFnh/X9Cfpt
 zKNA==
X-Gm-Message-State: AOAM533SaoLpLRjTNU7dtItwebPSDvYGwxudCxyMxk5ngOQ3a9RPoW4R
 kMDdQSMqzURrmhzqXYjdyBXC8qqaB+/Za4cLfCY=
X-Google-Smtp-Source: ABdhPJxAXoDdMyn+j4WUJtKIkYpUXXWDoYsi/wMRZ/HPLvpHKA9KsPceqak3zQssVp8/mTHgjvBFuBMORPohagk6UMs=
X-Received: by 2002:a9d:57cd:: with SMTP id q13mr1204608oti.23.1622087595845; 
 Wed, 26 May 2021 20:53:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210526084726.552052-1-lee.jones@linaro.org>
 <20210526084726.552052-6-lee.jones@linaro.org>
In-Reply-To: <20210526084726.552052-6-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 26 May 2021 23:53:04 -0400
Message-ID: <CADnq5_NQSwdhGQOMDAfHj9dWi-e-EYeH8AsTr+XhRwU6DZDgLA@mail.gmail.com>
Subject: Re: [PATCH 05/34] drm/amd/pm/powerplay/hwmgr/vega12_hwmgr: Provide
 'vega12_init_smc_table()' function name
To: Lee Jones <lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Wed, May 26, 2021 at 4:47 AM Lee Jones <lee.jones@linaro.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/vega12_hwmgr.c:812: war=
ning: expecting prototype for Initializes the SMC table and uploads it(). P=
rototype was for vega12_init_smc_table() instead
>
> Cc: Evan Quan <evan.quan@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega12_hwmgr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega12_hwmgr.c b/driv=
ers/gpu/drm/amd/pm/powerplay/hwmgr/vega12_hwmgr.c
> index 1a097e608808e..29e0d1d4035ad 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega12_hwmgr.c
> +++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega12_hwmgr.c
> @@ -803,7 +803,7 @@ static int vega12_save_default_power_profile(struct p=
p_hwmgr *hwmgr)
>  #endif
>
>  /**
> - * Initializes the SMC table and uploads it
> + * vega12_init_smc_table - Initializes the SMC table and uploads it
>   *
>   * @hwmgr:  the address of the powerplay hardware manager.
>   * return:  always 0
> --
> 2.31.1
>
