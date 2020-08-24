Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF6A425075C
	for <lists+dri-devel@lfdr.de>; Mon, 24 Aug 2020 20:24:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 456DB6E3FC;
	Mon, 24 Aug 2020 18:23:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45C716E3FC;
 Mon, 24 Aug 2020 18:23:55 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id y8so83751wma.0;
 Mon, 24 Aug 2020 11:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RWt4HdLDDE3cWxWp14ftYZ+Ff9vvdCYJgVm+2n4jMk0=;
 b=QiSYkoWo6+sxPSh3nCgtbEpKl3GLoyehwM+22cwGTFHcJya9CyycE6Itv87bRJPk3j
 v9I6aZYCB+IE+ZdGk3iP25ymbh7BfnT9lSbW7dBiGTpn/eHa16Y8AkyEB2wCHyjSbE+g
 UCOkmnQgllkEhED10e+YnAcstwHyO04ClrqHock8KudzOiU/WzMu5gwGEvoaoSEAUxPG
 uHAFuGyrhhH21eNpmrGqyLjUttypNN1xgAn/Teh6IFQlv6Munft6kJ8gzGj7T+Nn0Adu
 go+n7QSoZHmpaz3vBnj6Ue01+GiesPwGZ3zZzKDH6nJUIFTEUBcklmHyTrH/0xsttsjB
 IRdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RWt4HdLDDE3cWxWp14ftYZ+Ff9vvdCYJgVm+2n4jMk0=;
 b=rou9M9fxOu9o7kvh0n9S6JS7S3CV3wt/etnoAI7g8SXM4zIIR6x/EBmNkvh7ipEYFy
 7nAPRhCrznQR0ygHwzeqz8p5jnb9/gy7N2V8cv6wnuD0m7hUXENrbmz2Rn/Yl/sqAuJg
 Mj/X2yVfjhc71J265taEi28O0cG/HSnDQnpYRjB0PiNp7kQvl6nti6am5Jh7/PuAbMSb
 4mJDdoOJbvSp0VchjmzapHmCBTGgBsYYlfQG8jhb8VHCkOAeGMEZWfBMyi8tnfw0LYt2
 TpnctfiFYLgpUj4o/2Sd7Acc+kmtrLOuW81EA8ohrY13XwDDEg2U1yNldLmXbs66I+x8
 mvug==
X-Gm-Message-State: AOAM532dVzW8VBVXefpj8vzfPWGDHeEMe9c/avffWUY2lBbdyQjKgDMk
 UUbZnLP4Fypm5efZ+wzhqEK8FoGIASpO23qYNvo=
X-Google-Smtp-Source: ABdhPJzV3/zbrwXpoEPGTg1sHHiKvs4tr77eqoVjZcOGpQIpHr6awTnlu0abG4mFeyvWAKC8PhSVLwnMYAmPxPuzEv0=
X-Received: by 2002:a7b:c941:: with SMTP id i1mr487708wml.73.1598293433887;
 Mon, 24 Aug 2020 11:23:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200824163504.605538-1-sashal@kernel.org>
 <20200824163504.605538-52-sashal@kernel.org>
In-Reply-To: <20200824163504.605538-52-sashal@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 24 Aug 2020 14:23:42 -0400
Message-ID: <CADnq5_Osp+ePNgm1c5VxRzuymZzkTCF1Zps+Y0JjO8AJ66r+TQ@mail.gmail.com>
Subject: Re: [PATCH AUTOSEL 5.8 52/63] drm/amdgpu: disable gfxoff for
 navy_flounder
To: Sasha Levin <sashal@kernel.org>
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
Cc: Tao Zhou <tao.zhou1@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Jiansong Chen <Jiansong.Chen@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, "for 3.8" <stable@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 24, 2020 at 12:36 PM Sasha Levin <sashal@kernel.org> wrote:
>
> From: Jiansong Chen <Jiansong.Chen@amd.com>
>
> [ Upstream commit 9c9b17a7d19a8e21db2e378784fff1128b46c9d3 ]
>
> gfxoff is temporarily disabled for navy_flounder,
> since at present the feature has broken some basic
> amdgpu test.
>
> Signed-off-by: Jiansong Chen <Jiansong.Chen@amd.com>
> Reviewed-by: Tao Zhou <tao.zhou1@amd.com>
> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> Signed-off-by: Sasha Levin <sashal@kernel.org>

Support for this chip does not exist in 5.8 or any other older trees.
Please drop this.

Alex


> ---
>  drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
> index fac77a86c04b2..2c870ff7f8a45 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
> @@ -3427,6 +3427,9 @@ static void gfx_v10_0_check_gfxoff_flag(struct amdgpu_device *adev)
>                 if (!gfx_v10_0_navi10_gfxoff_should_enable(adev))
>                         adev->pm.pp_feature &= ~PP_GFXOFF_MASK;
>                 break;
> +       case CHIP_NAVY_FLOUNDER:
> +               adev->pm.pp_feature &= ~PP_GFXOFF_MASK;
> +               break;
>         default:
>                 break;
>         }
> --
> 2.25.1
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
