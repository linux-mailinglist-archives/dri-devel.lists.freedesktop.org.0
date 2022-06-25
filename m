Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 572B955A53E
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jun 2022 02:11:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6473910EC63;
	Sat, 25 Jun 2022 00:11:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com
 [IPv6:2001:4860:4864:20::36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35B1A10EEDE
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Jun 2022 00:11:03 +0000 (UTC)
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-101d96fe0a5so5890961fac.2
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 17:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=b7aQeB+4q3mQSSSfbgG4tFlRUnRHmJBpzZx/MYd4IMg=;
 b=D6LLLyVtnytj4R+Ojd3qxYdO87jeyvd3zV1Ho1hxnkG188qKu0n/k1wzvwfhUHtZVf
 5PLdHIEOyuoVB40OK+KXncwj1KIKAieIDm6aX86sasdEwXBmqdPr5ULfm9urufnE+uan
 CEZ+Y7VuJB6Pa18cKadhG4WvwJ8R7ZMyMoCiY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc:content-transfer-encoding;
 bh=b7aQeB+4q3mQSSSfbgG4tFlRUnRHmJBpzZx/MYd4IMg=;
 b=NKRcXD0kltmedeWvNhQ+PNPB3O0jZV93JA00XDmihbJB4R92c8/wgwBybl4DLecQ9S
 f2TmTsUFvZj+BEi7mkrzvtkFCu82DBrxGNaYMZLCmNVasSshfgPXNmE2mMzTxD4nRvtR
 M51v8jrnFMchR76OZTuR/+QN4iCqRriO9UVEb/PlSliCGZo6eDG/uYLW+p4/m4/Puh3u
 Okisi53wSYOdCbwLzI94Ic8k0dzxLWALS/tKnKYHzKY5eG0PU1euCteuqrifo/nvUrM4
 2fmIbzh77VlVUIMpJFYM7Wqslu3HGINRjTE8alrnWOssPS5xjMeFakkcOsHK1hbZrwAr
 npGA==
X-Gm-Message-State: AJIora9vBuAax/HOht/WbV3fU8tGJdhE0QgzwIVM8JQ3k3uFFyjjn+kF
 PfudsyrsTl5qx49H+C36OqUd2/Up3McUOL8RoPZgZUPuuIA=
X-Google-Smtp-Source: AGRyM1tMZblx0++ncGdXGGbJKEsJVlS7pwjiuuf/eXr/DXcuDIblSOS/+2yXIjeVbFg3ZHoogmMrlCYSYFcuXwQcrh0=
X-Received: by 2002:a05:6870:b381:b0:fe:2004:b3b5 with SMTP id
 w1-20020a056870b38100b000fe2004b3b5mr1065500oap.63.1656115862304; Fri, 24 Jun
 2022 17:11:02 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 24 Jun 2022 17:11:01 -0700
MIME-Version: 1.0
In-Reply-To: <5cf094cf-343a-82d7-91c4-1284683f9748@quicinc.com>
References: <1656090912-18074-1-git-send-email-quic_khsieh@quicinc.com>
 <CAE-0n53kNCK0ajHfY2WQr5HEQZtZSBLnhfbTuZwaUNEOZhsKPg@mail.gmail.com>
 <fa7f8bf1-33cd-5515-0143-6596df2bd740@quicinc.com>
 <CAE-0n51g-EVsC-i9=sJV-ySa8VnE+yT7cg=b-TNMi9+3uBiOVA@mail.gmail.com>
 <326912ff-9771-0711-366d-79acd436908b@quicinc.com>
 <CAE-0n51qrdrFtSr0vRwgYkMgSZfnzQuinaUROQsp30QoDchWQA@mail.gmail.com>
 <0ff3d6a3-dc5c-7c77-f8a1-6c4f6c1a3215@quicinc.com>
 <CAE-0n515hMKqQ+Vj1Sg54PpwkbWMYJ77QN+y+KZNBWymjhpWKw@mail.gmail.com>
 <66ff4642-f268-f5b0-7e28-b196368c508a@quicinc.com>
 <5cf094cf-343a-82d7-91c4-1284683f9748@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 24 Jun 2022 17:11:01 -0700
Message-ID: <CAE-0n51PiVo042oj8JrAxNTytmAoQx0kdqs_iCDffXa1+iur1A@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] drm/msm/dp: decoupling dp->id out of dp
 controller_id at scxxxx_dp_cfg table
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 agross@kernel.org, airlied@linux.ie, bjorn.andersson@linaro.org, 
 daniel@ffwll.ch, dianders@chromium.org, dmitry.baryshkov@linaro.org, 
 dri-devel@lists.freedesktop.org, robdclark@gmail.com, sean@poorly.run, 
 vkoul@kernel.org
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
Cc: linux-arm-msm@vger.kernel.org, quic_aravindh@quicinc.com,
 freedreno@lists.freedesktop.org, quic_sbillaka@quicinc.com,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Abhinav Kumar (2022-06-24 17:03:37)
> Hi Stephen / Dmitry
>
> Let me try to explain the issue kuogee is trying to fix below:
>
> On 6/24/2022 4:56 PM, Kuogee Hsieh wrote:
> >
> > On 6/24/2022 4:45 PM, Stephen Boyd wrote:
> >> Quoting Kuogee Hsieh (2022-06-24 16:30:59)
> >>> On 6/24/2022 4:12 PM, Stephen Boyd wrote:
> >>>> Quoting Kuogee Hsieh (2022-06-24 15:53:45)
> >>>>> MSM_DP_CONTROLLER_1 need to match to the index =3D 1 of
> >>>>> sc7280_dp_cfg[] <=3D=3D This is correct
> >>>>>
> >>>>> The problem is sc7280_dp_cfg[] have two entries since eDP place at
> >>>>> index
> >>>>> of MSM_DP_CONTROLLER_1.
> >>>>>
> >>>>> but .num_desc =3D 1=C2=A0 <=3D=3D this said only have one entry at
> >>>>> sc7280_dp_cfg[]
> >>>>> table. Therefore eDP will never be found at for loop=C2=A0 at
> >>>>> _dpu_kms_initialize_displayport().
> >>>>>
> >>>> Yes, but what else does the MSM_DP_CONTROLLER_1 need to match? Becau=
se
> >>>> the intention of the previous commit was to make it so the order of
> >>>> sc7280_dp_cfg couldn't be messed up and not match the
> >>>> MSM_DP_CONTROLLER_1 value that lives in sc7280_intf[].
> >>>
> >>> at=C2=A0 _dpu_kms_initialize_displayport()
> >>>
> >>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 info.h_tile_instance[0] =3D i; <=3D=3D assign i to become dp
> >>>> controller id, "i" is index of scxxxx_dp_cfg[]
> >>> This what I mean MSM_DP_CONTROLLER_1 need to match to index =3D 1 of
> >>> scxxxx_dp_cfg[].
> >>>
> >>> it it is not match, then MSM_DP_CONTROLLER_1 with match to different
> >>> INTF.
> >> I thought we matched the INTF instance by searching through
> >> sc7280_intf[] for a matching MSM_DP_CONTROLLER_1 and then returning th=
at
> >> INTF number. See dpu_encoder_get_intf() and the caller.
> >
> > yes, but the controller_id had been over written by dp->id.
> >
> > u32 controller_id =3D disp_info->h_tile_instance[i];
> >
> >
> > See below code.
> >
> >
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for (i =3D 0; i < dis=
p_info->num_of_h_tiles && !ret; i++) {
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Left-most tile is at index 0, content i=
s
> >> controller id
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * h_tile_instance_ids[2] =3D {0, 1}; DSI0=
 =3D left, DSI1
> >> =3D right
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * h_tile_instance_ids[2] =3D {1, 0}; DSI1=
 =3D left, DSI0
> >> =3D right
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 u32 controller_id =3D disp_info->h_tile_instanc=
e[i];
> >> <=3D=3D kuogee assign dp->id to controller_id
> >>
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (disp_info->num_of_h_tiles > 1) {
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 if (i =3D=3D 0)
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 phys_params.split_role =3D
> >> ENC_ROLE_MASTER;
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 else
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 phys_params.split_role =3D=
 ENC_ROLE_SLAVE;
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else {
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 phys_params.split_role =3D ENC_ROLE_SOLO;
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> >>
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 DPU_DEBUG("h_tile_instance %d =3D %d, split_rol=
e %d\n",
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 i, controller_id,
> >> phys_params.split_role);
> >>
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 phys_params.intf_idx =3D
> >> dpu_encoder_get_intf(dpu_kms->catalog,
> >>
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 intf_type,
> >>
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 controller_id);
>
>
> So let me try to explain this as this is what i understood from the
> patch and how kuogee explained me.
>
> The ordering of the array still matters here and thats what he is trying
> to address with the second change.

The order of the array should not matter. That's the problem.

>
> So as per him, he tried to swap the order of entries like below and that
> did not work and that is incorrect behavior because he still retained
> the MSM_DP_CONTROLLER_x field for the table like below:
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c
> b/drivers/gpu/drm/msm/dp/dp_display.c
> index dcd80c8a794c..7816e82452ca 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -140,8 +140,8 @@ static const struct msm_dp_config sc7180_dp_cfg =3D {
>
>   static const struct msm_dp_config sc7280_dp_cfg =3D {
>          .descs =3D (const struct msm_dp_desc[]) {
> -               [MSM_DP_CONTROLLER_0] =3D { .io_start =3D 0x0ae90000,
> .connector_type =3D DRM_MODE_CONNECTOR_DisplayPort, .wide_bus_en =3D true=
 },
>                  [MSM_DP_CONTROLLER_1] =3D { .io_start =3D 0x0aea0000,
> .connector_type =3D DRM_MODE_CONNECTOR_eDP, .wide_bus_en =3D true },
> +               [MSM_DP_CONTROLLER_0] =3D { .io_start =3D 0x0ae90000,
> .connector_type =3D DRM_MODE_CONNECTOR_DisplayPort, .wide_bus_en =3D true=
 },
>          },
>          .num_descs =3D 2,
>   };
>
>
> The reason order is important is because  in this function below, even
> though it matches the address to find which one to use it loops through
> the array and so the value of *id will change depending on which one is
> located where.
>
> static const struct msm_dp_desc *dp_display_get_desc(struct
> platform_device *pdev,
>                               unsigned int *id)

Thanks! We should fix this function to not overwrite the id.

> {
>      const struct msm_dp_config *cfg =3D of_device_get_match_data(&pdev->=
dev);
>      struct resource *res;
>      int i;
>
>      res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
>      if (!res)
>          return NULL;
>
>      for (i =3D 0; i < cfg->num_descs; i++) {
>          if (cfg->descs[i].io_start =3D=3D res->start) {
>              *id =3D i;
>              return &cfg->descs[i];
>          }
>      }
>
> In dp_display_bind(), dp->id is used as the index of assigning the
> dp_display,
>
> priv->dp[dp->id] =3D &dp->dp_display;
>
> And now in _dpu_kms_initialize_displayport(), in the array this will
> decide the value of info.h_tile_instance[0] which will be assigned to
> just the index i.
>
> info.h_tile_instance[0] is then used as the controller id to find from
> the catalog table.
>
> So if this order is not retained it does not work.
>
> Thats the issue he is trying to address to make the order of entries
> irrelevant in the table in dp_display.c

The code seems to be brittle. This sort of explanation would have been
helpful to have in the commit text.
