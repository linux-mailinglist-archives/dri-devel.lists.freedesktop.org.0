Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2426F17662D
	for <lists+dri-devel@lfdr.de>; Mon,  2 Mar 2020 22:41:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03FBB89C5E;
	Mon,  2 Mar 2020 21:41:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2637A89C5E;
 Mon,  2 Mar 2020 21:41:55 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id y17so1732604wrn.6;
 Mon, 02 Mar 2020 13:41:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JzxBszwvSavkD3gOsLTiI8tyHclJJuprm0Y8cpISCnw=;
 b=Ngj249moLNH5r7KjvyePZ6jTllfj+hxSH8f9mgfbg2myROrys2IoPKnUjqcuKsWdiK
 uYenndj/yhOZeIFtTQCIXO1LoKq7vRyaJTH0SEjxlMs4KIM+DpJ2bwJ82NNNXqlui9Hp
 QdECK2N03SGa7Nh4lOjJQ+XV50hB6Sq+Ipo0dEmowbJCoMtj0q8/kCRbfH0uY0WgtsGI
 CQ60HGTHcLX1zGfa1KZLnPkeaXbsLGqiwKiUlwTO/wWc7PkAJk/qsj9mXIiyza8gYq5I
 tJfLTwfhQM9GpYH2XlBTD5obbzVEZF82ic4Qm8jUarq5gzC5scGZ9/D2VvVmjQ54o4jr
 GCwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JzxBszwvSavkD3gOsLTiI8tyHclJJuprm0Y8cpISCnw=;
 b=bQS1k+F5lA1FtXAmoIX3AuIpeIOqkYZJD3qcXApWuO5xYoG0/AwU/jHw0aG6aVqt9a
 kJ+H/JbL8kekD8aeGrFRhV+AHTlWUbt/pyLO3OwdoS6+2oC+wdGJZP3D/o/zFQhVV4K0
 q6ZglDrYsdbRa0JNJqvypp6dgLxaBhG+q75bDKpnKRmbYfytD5RRs/oWMwm/AiU55BpV
 QN3DEWolMGr3DnDp/CH5WIey/kMvdlCS+ilJVfEl6ULrmDjBa3PHA15AQdj1lmq1ZS+5
 F/4/In6vJKdXrG4wqfJoZbDQ801wKvZCdsJ3/oogYUEoQLd6SMbipURzvI+off7xENI3
 NwZw==
X-Gm-Message-State: ANhLgQ0MG0gneHP9faRucZywVrJCZXsWvQw/fXyyEWLeeomeYjzlraYa
 QBnPuBHxFM8lei4C/Yn6rQJFn8qwaF5Xhp38xqk=
X-Google-Smtp-Source: ADFU+vtWOKOTv6KZUW15zP3K/Vq5QZ2z9HRSraNn+oUsTLA1xU/o/Pk2fyA0V/USex6BftJRLHULreZglQZPgzU8OGk=
X-Received: by 2002:a05:6000:4b:: with SMTP id
 k11mr1456673wrx.362.1583185313792; 
 Mon, 02 Mar 2020 13:41:53 -0800 (PST)
MIME-Version: 1.0
References: <20200302125649.61443-1-pankaj.laxminarayan.bharadiya@intel.com>
 <20200302125649.61443-4-pankaj.laxminarayan.bharadiya@intel.com>
In-Reply-To: <20200302125649.61443-4-pankaj.laxminarayan.bharadiya@intel.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 2 Mar 2020 16:41:42 -0500
Message-ID: <CADnq5_MqWRCR4gmkHoVmU=2wmjoYjFVLRgRf5+V+wLo4_dZjvg@mail.gmail.com>
Subject: Re: [PATCH 3/9] drm/amdgpu: Remove drm_fb_helper_{add,
 remove}_one_connector calls
To: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
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
Cc: Leo Li <sunpeng.li@amd.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Nicholas Kazlauskas <Nicholas.Kazlauskas@amd.com>,
 David Airlie <airlied@linux.ie>, David Francis <David.Francis@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Mikita Lipski <mikita.lipski@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 2, 2020 at 8:09 AM Pankaj Bharadiya
<pankaj.laxminarayan.bharadiya@intel.com> wrote:
>
> drm_fb_helper_{add,remove}_one_connector() are dummy functions now
> and serve no purpose. Hence remove their calls.
>
> This is the preparatory step for removing the
> drm_fb_helper_{add,remove}_one_connector() functions from
> drm_fb_helper.h
>
> Signed-off-by: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  .../drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c | 13 -------------
>  1 file changed, 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> index 0ef0eeb16778..0c4faba8ed28 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> @@ -440,9 +440,6 @@ dm_dp_add_mst_connector(struct drm_dp_mst_topology_mgr *mgr,
>  static void dm_dp_destroy_mst_connector(struct drm_dp_mst_topology_mgr *mgr,
>                                         struct drm_connector *connector)
>  {
> -       struct amdgpu_dm_connector *master = container_of(mgr, struct amdgpu_dm_connector, mst_mgr);
> -       struct drm_device *dev = master->base.dev;
> -       struct amdgpu_device *adev = dev->dev_private;
>         struct amdgpu_dm_connector *aconnector = to_amdgpu_dm_connector(connector);
>
>         DRM_INFO("DM_MST: Disabling connector: %p [id: %d] [master: %p]\n",
> @@ -457,21 +454,11 @@ static void dm_dp_destroy_mst_connector(struct drm_dp_mst_topology_mgr *mgr,
>         }
>
>         drm_connector_unregister(connector);
> -       if (adev->mode_info.rfbdev)
> -               drm_fb_helper_remove_one_connector(&adev->mode_info.rfbdev->helper, connector);
>         drm_connector_put(connector);
>  }
>
>  static void dm_dp_mst_register_connector(struct drm_connector *connector)
>  {
> -       struct drm_device *dev = connector->dev;
> -       struct amdgpu_device *adev = dev->dev_private;
> -
> -       if (adev->mode_info.rfbdev)
> -               drm_fb_helper_add_one_connector(&adev->mode_info.rfbdev->helper, connector);
> -       else
> -               DRM_ERROR("adev->mode_info.rfbdev is NULL\n");
> -
>         drm_connector_register(connector);
>  }
>
> --
> 2.20.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
