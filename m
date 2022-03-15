Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC394DA2B9
	for <lists+dri-devel@lfdr.de>; Tue, 15 Mar 2022 19:52:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0450210E1BD;
	Tue, 15 Mar 2022 18:52:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E162B10E141;
 Tue, 15 Mar 2022 18:52:49 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 k25-20020a056830151900b005b25d8588dbso14588174otp.4; 
 Tue, 15 Mar 2022 11:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=zNTJopoLGltecGhSY1J4R8lxzUea0zgkojqKJ4ephYk=;
 b=QKqrXEraFO3Q3uNBiyoVf+76YiOzMhP9FHgSq5y/4jPXEHcYc3eyCOAjQg6UCpL4OQ
 Qf9+d3Uo2az+gLFI1IyvbHSH5ZV1ysaDuDFj0/qNCK9moMY7s8Gs9YFgbndXfkrVyUUx
 LQyl9nSQ0peCvu1hpg91TKQWHAt/3dkBPOLcX0NgebyxbORQyqK+3W6dxjnxGHIE8Xhd
 CTz8OSJhD9stugfUoZ8mPXpKMCRH1HOkp0cRsOstlyL7j8RirvS3d+MTNd7tR8HfmlLk
 iNxLnCVWd7/fV7L0LaXkpC7HRsH6dWSpW6SspqpszrTSx4ODFCNv8fk16O4pru+WhBVH
 zVZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=zNTJopoLGltecGhSY1J4R8lxzUea0zgkojqKJ4ephYk=;
 b=CCpbyEaCMwpcU6Nz8E9CDK806fYyLVWPWTBnEn4PKu97XIPM9ZNxREMMIbeXUvQ5aT
 iQ0jmTjmTAHrtmacEUz1dHc0FOl36OoXpxTB2264KrEpCPswsxEEgsWUAS+qL+C+ywf7
 2y5qiKSBURpStyuA5WT/Cg6pruQl97QOPDpgDaZsx5+DOAWRMEFPedvLaZ571TiBy840
 F98/64zZpGrqOjPuLOFM6v9A1Gmyr3ZGZ5ZUzQ7PtqbgiXdk9uYvsHnWXjGrCZVy8xxA
 vgxnq+utSktmzYS6EWJ5qxX4BtcLFI8/ObLhX9LiZpKYoQ9dEQwRhFjWUbfHnF9zIOfI
 D2tw==
X-Gm-Message-State: AOAM532zUo7PRH1CHezxyR+hq7tJ/ZcoTXK6hZCQ5uAJeo/siQdf5vjJ
 cVfRPhD2Kj1cXIlfnoArhiX7DjbF9Rajq+mRedM=
X-Google-Smtp-Source: ABdhPJzPCJIJm2LwauK3uaMNRrspjb+0HPgBwT8LZe/bTDIdcPf8RkEU23DNd13AaKZGCPpi0IDa/fHQYab6R7PD2VI=
X-Received: by 2002:a05:6830:2709:b0:5b0:196:dcf with SMTP id
 j9-20020a056830270900b005b001960dcfmr13485823otu.357.1647370369237; Tue, 15
 Mar 2022 11:52:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220218100403.7028-1-ville.syrjala@linux.intel.com>
 <Yi+9n0eGn3rNKb4X@intel.com>
In-Reply-To: <Yi+9n0eGn3rNKb4X@intel.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 15 Mar 2022 14:52:38 -0400
Message-ID: <CADnq5_NS07TPBWSnETRhjzqtX_oUuCu86ewurFT3MJO=PcLAuQ@mail.gmail.com>
Subject: Re: [PATCH 00/22] drm: Review of mode copies
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
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
Cc: Emma Anholt <emma@anholt.net>, Neil Armstrong <narmstrong@baylibre.com>,
 Xinliang Liu <xinliang.liu@linaro.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 linux-rockchip@lists.infradead.org,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Leo Li <sunpeng.li@amd.com>, Chen Feng <puck.chen@hisilicon.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Nikola Cornij <nikola.cornij@amd.com>, Sean Paul <sean@poorly.run>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Tomi Valkeinen <tomba@kernel.org>, freedreno <freedreno@lists.freedesktop.org>,
 Sandy Huang <hjc@rock-chips.com>, Robert Foss <robert.foss@linaro.org>,
 Alex Deucher <alexander.deucher@amd.com>, Tian Tao <tiantao6@hisilicon.com>,
 Jyri Sarha <jyri.sarha@iki.fi>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 14, 2022 at 6:12 PM Ville Syrj=C3=A4l=C3=A4
<ville.syrjala@linux.intel.com> wrote:
>
> On Fri, Feb 18, 2022 at 12:03:41PM +0200, Ville Syrjala wrote:
> >   drm: Add drm_mode_init()
> >   drm/bridge: Use drm_mode_copy()
> >   drm/imx: Use drm_mode_duplicate()
> >   drm/panel: Use drm_mode_duplicate()
> >   drm/vc4: Use drm_mode_copy()
> These have been pushed to drm-misc-next.
>
> >   drm/amdgpu: Remove pointless on stack mode copies
> >   drm/amdgpu: Use drm_mode_init() for on-stack modes
> >   drm/amdgpu: Use drm_mode_copy()
> amdgpu ones are reviewed, but I'll leave them for the
> AMD folks to push to whichever tree they prefer.

I pulled patches 2, 4, 5 into my tree.  For 3, I'm happy to have it
land via drm-misc with the rest of the mode_init changes if you'd
prefer.

Alex


Alex

>
>
> The rest are still in need of review:
> >   drm/radeon: Use drm_mode_copy()
> >   drm/gma500: Use drm_mode_copy()
> >   drm/hisilicon: Use drm_mode_init() for on-stack modes
> >   drm/msm: Nuke weird on stack mode copy
> >   drm/msm: Use drm_mode_init() for on-stack modes
> >   drm/msm: Use drm_mode_copy()
> >   drm/mtk: Use drm_mode_init() for on-stack modes
> >   drm/rockchip: Use drm_mode_copy()
> >   drm/sti: Use drm_mode_copy()
> >   drm/tilcdc: Use drm_mode_copy()
> >   drm/i915: Use drm_mode_init() for on-stack modes
> >   drm/i915: Use drm_mode_copy()
> >   drm: Use drm_mode_init() for on-stack modes
> >   drm: Use drm_mode_copy()
>
> --
> Ville Syrj=C3=A4l=C3=A4
> Intel
