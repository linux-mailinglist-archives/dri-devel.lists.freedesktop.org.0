Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C0FC6609727
	for <lists+dri-devel@lfdr.de>; Mon, 24 Oct 2022 01:06:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B837E10E1FB;
	Sun, 23 Oct 2022 23:06:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com
 [IPv6:2607:f8b0:4864:20::b2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6112710E1FB
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Oct 2022 23:06:11 +0000 (UTC)
Received: by mail-yb1-xb2c.google.com with SMTP id f205so9355153yba.2
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Oct 2022 16:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=basnieuwenhuizen.nl; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hmccmewlc12IL3G8EIPRSlShqf9VN8OLmAiyROgb794=;
 b=gE/GFjPwGsZwOqKaA4pqmxoS+Hn4dn39Nk2+u+onuxZ4DbVwZza7ru5x0v0Qnx6z8Q
 cvxvJHYkJpMoXDS02B6wOSV+YhcbMa9qa4igpCUTXX3KIbF1embj2Jo3ag5Pv5/v6YZw
 isXXmIo1mpOtKW11tb9UJSMisWqm/vPUojCb1KiDlgzZY+lc/YwxWY8faOxeWDKP6YQX
 VCVsG+ebEn/SwiuuulAiGHW0GzBrSnpa0TEhMzKGfD1qPixEyrbQ9bPaTf0mBFflD9Qf
 p0PPpjqNFSftJVCL+BJZE1FIGSWoqyYWg2EMN2Poybz7Ct/QfaGKPTWta0WHDnn+T1pB
 T9jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hmccmewlc12IL3G8EIPRSlShqf9VN8OLmAiyROgb794=;
 b=ru8gj/cicWIi3iTnptGsOPV2lxFDgkgh9fL2Xzjt5j3VHmOIvaVg2Mq2IIA2pJCX41
 ga0zcWB/YtRjMziArOV62LNPe7VMzbPuKXYnSGna8PlJygGGkUr7KBuXq5bchXTheQhF
 opcngnF+7H+eddvitBEsYThGevIdcQYLzDuH2pTMhLiCo+1XbzHdwha46IQmlUcJxOrN
 yTcaRnvLeNgVkkOxj2EB32QCjWBzgLDRXfB2HGPdgDQ1xjg51s20uVbYyMBBxejD1hrh
 r5Vh5/bJ44tFoySPjc1MybbYnTeAjnLQ/uoNTA+EtN6gxWsZQadhhmh6pIlMa/TSkBjt
 I3Eg==
X-Gm-Message-State: ACrzQf0lR/b8tSK6NqrZlrrIe7TShW1Vv8KN8DS+3vQBt5i++pRw1nof
 IoFLjmzkjaOh09ufLcW+apQefNbnwmcHYQDtQt5JiA==
X-Google-Smtp-Source: AMsMyM7XSPrbKTSnEVpxOc3xsh+M+aAWFj5JLw0oAkgGzZsAI/Zm5hOlj4oAEbT9TZRbBkv6YrUdJIv01NXMsVpe4i4=
X-Received: by 2002:a05:6902:1545:b0:6ca:a18a:ea69 with SMTP id
 r5-20020a056902154500b006caa18aea69mr7150287ybu.225.1666566370923; Sun, 23
 Oct 2022 16:06:10 -0700 (PDT)
MIME-Version: 1.0
References: <ea5d60cd-8d0b-7018-425e-b91e5750a830@amd.com>
 <20221020205317.96136-1-samsagax@gmail.com>
In-Reply-To: <20221020205317.96136-1-samsagax@gmail.com>
From: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Date: Mon, 24 Oct 2022 01:05:52 +0200
Message-ID: <CAP+8YyFUoFhh1+CEKrs48JV5CiorSSfe6qg90TyUrDoBtzcPhA@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Revert logic for plane modifiers
To: =?UTF-8?Q?Joaqu=C3=ADn_Ignacio_Aramend=C3=ADa?= <samsagax@gmail.com>
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
Cc: sunpeng.li@amd.com, Xinhui.Pan@amd.com, rodrigo.siqueira@amd.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, alexander.deucher@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Please also add a

Cc: <stable@vger.kernel.org> # 6.0.x

to ensure it gets backported.

On Fri, Oct 21, 2022 at 9:24 AM Joaqu=C3=ADn Ignacio Aramend=C3=ADa
<samsagax@gmail.com> wrote:
>
> This file was split in commit 5d945cbcd4b16a29d6470a80dfb19738f9a4319f
> ("drm/amd/display: Create a file dedicated to planes") and the logic in
> dm_plane_format_mod_supported() function got changed by a switch logic.
> That change broke drm_plane modifiers setting on series 5000 APUs
> (tested on OXP mini AMD 5800U and HP Dev One 5850U PRO)
> leading to Gamescope not working as reported on GitHub[1]
>
> To reproduce the issue, enter a TTY and run:
>
> $ gamescope -- vkcube
>
> With said commit applied it will abort. This one restores the old logic,
> fixing the issue that affects Gamescope.
>
> [1](https://github.com/Plagman/gamescope/issues/624)
>
> Signed-off-by: Joaqu=C3=ADn Ignacio Aramend=C3=ADa <samsagax@gmail.com>
> ---
>  .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   | 51 +++----------------
>  1 file changed, 8 insertions(+), 43 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/dr=
ivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> index dfd3be49eac8..1d47d2d69781 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> @@ -1369,7 +1369,8 @@ static bool dm_plane_format_mod_supported(struct dr=
m_plane *plane,
>  {
>         struct amdgpu_device *adev =3D drm_to_adev(plane->dev);
>         const struct drm_format_info *info =3D drm_format_info(format);
> -       struct hw_asic_id asic_id =3D adev->dm.dc->ctx->asic_id;
> +

Can remove this newline.

With that removed, this patch is

Reviewed-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>

Thanks,
Bas

> +       int i;
>
>         enum dm_micro_swizzle microtile =3D modifier_gfx9_swizzle_mode(mo=
difier) & 3;
>
> @@ -1386,49 +1387,13 @@ static bool dm_plane_format_mod_supported(struct =
drm_plane *plane,
>                 return true;
>         }
>
> -       /* check if swizzle mode is supported by this version of DCN */
> -       switch (asic_id.chip_family) {
> -       case FAMILY_SI:
> -       case FAMILY_CI:
> -       case FAMILY_KV:
> -       case FAMILY_CZ:
> -       case FAMILY_VI:
> -               /* asics before AI does not have modifier support */
> -               return false;
> -       case FAMILY_AI:
> -       case FAMILY_RV:
> -       case FAMILY_NV:
> -       case FAMILY_VGH:
> -       case FAMILY_YELLOW_CARP:
> -       case AMDGPU_FAMILY_GC_10_3_6:
> -       case AMDGPU_FAMILY_GC_10_3_7:
> -               switch (AMD_FMT_MOD_GET(TILE, modifier)) {
> -               case AMD_FMT_MOD_TILE_GFX9_64K_R_X:
> -               case AMD_FMT_MOD_TILE_GFX9_64K_D_X:
> -               case AMD_FMT_MOD_TILE_GFX9_64K_S_X:
> -               case AMD_FMT_MOD_TILE_GFX9_64K_D:
> -                       return true;
> -               default:
> -                       return false;
> -               }
> -               break;
> -       case AMDGPU_FAMILY_GC_11_0_0:
> -       case AMDGPU_FAMILY_GC_11_0_1:
> -               switch (AMD_FMT_MOD_GET(TILE, modifier)) {
> -               case AMD_FMT_MOD_TILE_GFX11_256K_R_X:
> -               case AMD_FMT_MOD_TILE_GFX9_64K_R_X:
> -               case AMD_FMT_MOD_TILE_GFX9_64K_D_X:
> -               case AMD_FMT_MOD_TILE_GFX9_64K_S_X:
> -               case AMD_FMT_MOD_TILE_GFX9_64K_D:
> -                       return true;
> -               default:
> -                       return false;
> -               }
> -               break;
> -       default:
> -               ASSERT(0); /* Unknown asic */
> -               break;
> +       /* Check that the modifier is on the list of the plane's supporte=
d modifiers. */
> +       for (i =3D 0; i < plane->modifier_count; i++) {
> +               if (modifier =3D=3D plane->modifiers[i])
> +                       break;
>         }
> +       if (i =3D=3D plane->modifier_count)
> +               return false;
>
>         /*
>          * For D swizzle the canonical modifier depends on the bpp, so ch=
eck
> --
> 2.38.1
>
