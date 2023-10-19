Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4175B7CFD53
	for <lists+dri-devel@lfdr.de>; Thu, 19 Oct 2023 16:51:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85C9710E501;
	Thu, 19 Oct 2023 14:51:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com
 [IPv6:2001:4860:4864:20::35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D2AB10E501;
 Thu, 19 Oct 2023 14:51:29 +0000 (UTC)
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-1dcfe9cd337so3974812fac.2; 
 Thu, 19 Oct 2023 07:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697727088; x=1698331888; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tQdIc8b8rLwyEGA7aYkkgb3aiLBGi2Off4qaN8J15KY=;
 b=YiKIYhYb4lSc2RDThyTigkrwBHBBjwOxrvUTmIu+RN+WZSQttjXu418IfTt0rWz7bb
 SVhmjLKplq8yUbjBL1HTKClx9y/dqdgKsV3KaDunZlakF/AmFBWBAu2r1e1cxbZEM3gb
 ltntvb4Mm8YYBsptip0S/wNMWbiGHnKUiyNB+hPWJzfVqONhV4WOZPG4El3TeUDlQ2xr
 dJy+yjUy664Rjl2pO7u63bNJWNl+X1vw3AlZEuvPNNWTGT9pAFdlstJdRnDsg2U6six3
 nSG7fe1Jp6vx5GnN4Bid4jeRTac3XUy4cJ8ukoUcw+FxuAWgJcpZxhAQvs/z8FEGMJ7R
 KK8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697727088; x=1698331888;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tQdIc8b8rLwyEGA7aYkkgb3aiLBGi2Off4qaN8J15KY=;
 b=DeyFuAapIeoamRJAg944hqKyW5eTIXuhKKRj18KPdmtTCT+kED6CbuxMGaXCyybAuM
 JFtMeXObV4+BGSNguXzCtwBm9Ggx4tRqsz7hbwfgJxmmQLP4iCunryD9scBd4AY5gNqi
 dlp35tTakCQTbfaWYnV0LZcWGnikZa+s2iskFzMAPNZYWQJ9aOAYHuELsQMnu70KNBtW
 LyKhXlVNfoLt8N2XJ0Zw6LyLrZcTEnt3YdbridF8AUmJpwiSoit19MAIUNiyyvsfNQYu
 FOJYLV3BRXYLIMUzhg6hqteWPsNj8OeBRuwqXww7rYHK1WqRjXe66GFvB+L/gBptnkzI
 mH+w==
X-Gm-Message-State: AOJu0YyixCgZZX7Zv0OJHnwF5BkogGqxwZyTQKU8zUaCKaChcu3PfFMR
 8u358YBjlaNKAcuIN9pM/V/IUFbItHYKXUP7FrA=
X-Google-Smtp-Source: AGHT+IHty6N7HTJwpNZ/GBo+XwmpY21HacXzaSadWjnIqIdv5tFUJe93vf7vOV7YvaUrmXuFxsys+iKlKN6c5XNdTMY=
X-Received: by 2002:a05:6870:1205:b0:1ea:8645:6352 with SMTP id
 5-20020a056870120500b001ea86456352mr2048322oan.11.1697727088053; Thu, 19 Oct
 2023 07:51:28 -0700 (PDT)
MIME-Version: 1.0
References: <20231019033826.127396-1-jiapeng.chong@linux.alibaba.com>
In-Reply-To: <20231019033826.127396-1-jiapeng.chong@linux.alibaba.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 19 Oct 2023 10:51:16 -0400
Message-ID: <CADnq5_OjCTV=-EAZ3coKVKBkpWZTBg+sH1zJBM8e9Ng3Kmh47A@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: clean up some inconsistent indenting
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
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
Cc: sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, Xinhui.Pan@amd.com,
 Abaci Robot <abaci@linux.alibaba.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Wed, Oct 18, 2023 at 11:38=E2=80=AFPM Jiapeng Chong
<jiapeng.chong@linux.alibaba.com> wrote:
>
> No functional modification involved.
>
> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:2902 dm_resum=
e() warn: inconsistent indenting.
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=3D6940
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/=
gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 801f87a12ccf..0e1f8c5d7f9b 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -2899,7 +2899,7 @@ static int dm_resume(void *handle)
>         }
>
>         /* power on hardware */
> -        dc_set_power_state(dm->dc, DC_ACPI_CM_POWER_STATE_D0);
> +       dc_set_power_state(dm->dc, DC_ACPI_CM_POWER_STATE_D0);
>
>         /* program HPD filter */
>         dc_resume(dm->dc);
> --
> 2.20.1.7.g153144c
>
