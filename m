Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 803826A2537
	for <lists+dri-devel@lfdr.de>; Sat, 25 Feb 2023 00:54:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DDF210E4DE;
	Fri, 24 Feb 2023 23:53:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com
 [IPv6:2607:f8b0:4864:20::112e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB2E410E56E
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Feb 2023 23:53:53 +0000 (UTC)
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-53916ab0c6bso22859767b3.7
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Feb 2023 15:53:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=il0Lfk8v/wMXGKCUf0z3B1RYBxM/gWsQLCwY0xU7Rj4=;
 b=vLb5huxOZdbt+fxkhIICNLk5fYM/NFYIxomJZCdtaMZmIcBJFiMx++9oxie6uM5dxn
 VG7N5L0OEV1NCjd4xTuK/DTAuT5HKLQAWmFEFx4O/wSk6vmK04gnQqpFhXezVNl6ZFar
 s0LMQQTA4Pm6MvSt5B/Wuq0ZylSGU4w4vRABbXjc42asMDKKutfcvN7Hy9NFtBr4ZCaM
 LhgQIXZPmQtNCFXGg1jkX12YokGy/fKemQd4BjXlnLd7g4cK5A4+DROnu3+uQWwSil/7
 WdqFPow1DhtJ8eF70fGHzGHQv1dYmrJsysifbv58ozuodpMjCfNZ401q7fqGVkmFPOZW
 3FNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=il0Lfk8v/wMXGKCUf0z3B1RYBxM/gWsQLCwY0xU7Rj4=;
 b=i7qje0k5wQayz46gwXEz2ZWrea0ljSktEJVyPfGEDv1gm1mQ+WW2OTn2gRKjomQhVk
 ha/cwwWD2K0MRuAsSzgL2zAP0tQ82wAjzIx4IgW8Kfw1xOS+eaCfPhtADrJmOLjIlb+S
 YmvVa37qg0cZg0DO6rV5xWbh7vGWPklRxu7RMT4DCsuLtCeK3Zvo3995fpJk+EmCFqi0
 8kCiO5OelvTJtAcI7+b91tnJXU2MKRU4EHvhCkapid43COSOIBwY50vk/S84nEaxYbZx
 7DHrcNbsCdozOd7RTmT+7SoM7qf8beFGb4ORDUpdJUYXeKpLnz4pOrmm77Gm+/667vMI
 ogvQ==
X-Gm-Message-State: AO0yUKUUplH8EkN6u2Xo4vNGDQUFJPipA/OroxrB10bANC6KEvkjQRLf
 YY3uQDdMfyFaXhxBlwlxh3D88Fmvst3C05jAMJfLTA==
X-Google-Smtp-Source: AK7set+EYm4TvALJovISjq2Lgnd8DKcNgvkYPAlweBlG0TEQ64ieMnqAF9Zf4ZWxudAkuV/FHVn7XAIvyWRG7GnOEoI=
X-Received: by 2002:a05:6902:1203:b0:a09:314f:9f09 with SMTP id
 s3-20020a056902120300b00a09314f9f09mr1172424ybu.6.1677282832795; Fri, 24 Feb
 2023 15:53:52 -0800 (PST)
MIME-Version: 1.0
References: <1677267647-28672-1-git-send-email-quic_khsieh@quicinc.com>
 <1677267647-28672-2-git-send-email-quic_khsieh@quicinc.com>
 <42b3c193-8897-cfe9-1cae-2f9a66f7983a@linaro.org>
 <741be2a3-0208-2f40-eedf-d439c4e6795b@quicinc.com>
 <F8A4FC18-C64E-4011-BC08-18EB3B95A357@linaro.org>
 <d5ee8233-66c8-9b88-417c-6cf9cc5c84fe@quicinc.com>
In-Reply-To: <d5ee8233-66c8-9b88-417c-6cf9cc5c84fe@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 25 Feb 2023 01:53:41 +0200
Message-ID: <CAA8EJpro5Q-2ZpnDJt40UhFX7Zp9oBhrto=FDOERzCDR2BDPvQ@mail.gmail.com>
Subject: Re: [RFC PATCH 1/2] drm/msm/dpu: add dsc helper functions
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
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
Cc: vkoul@kernel.org, quic_sbillaka@quicinc.com, andersson@kernel.org,
 freedreno@lists.freedesktop.org, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, agross@kernel.org,
 linux-arm-msm@vger.kernel.org, marijn.suijten@somainline.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, sean@poorly.run,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 25 Feb 2023 at 00:26, Abhinav Kumar <quic_abhinavk@quicinc.com> wro=
te:
> On 2/24/2023 1:36 PM, Dmitry Baryshkov wrote:
> > 24 =D1=84=D0=B5=D0=B2=D1=80=D0=B0=D0=BB=D1=8F 2023 =D0=B3. 23:23:03 GMT=
+02:00, Abhinav Kumar <quic_abhinavk@quicinc.com> =D0=BF=D0=B8=D1=88=D0=B5=
=D1=82:
> >> On 2/24/2023 1:13 PM, Dmitry Baryshkov wrote:
> >>> On 24/02/2023 21:40, Kuogee Hsieh wrote:
> >>>> Add DSC helper functions based on DSC configuration profiles to prod=
uce
> >>>> DSC related runtime parameters through both table look up and runtim=
e
> >>>> calculation to support DSC on DPU.
> >>>>
> >>>> There are 6 different DSC configuration profiles are supported curre=
ntly.
> >>>> DSC configuration profiles are differiented by 5 keys, DSC version (=
V1.1),
> >>>> chroma (444/422/420), colorspace (RGB/YUV), bpc(8/10),
> >>>> bpp (6/7/7.5/8/9/10/12/15) and SCR (0/1).
> >>>>
> >>>> Only DSC version V1.1 added and V1.2 will be added later.
> >>>
> >>> These helpers should go to drivers/gpu/drm/display/drm_dsc_helper.c
> >>> Also please check that they can be used for i915 or for amdgpu (ideal=
ly for both of them).
> >>>
> >>
> >> No, it cannot. So each DSC encoder parameter is calculated based on th=
e HW core which is being used.
> >>
> >> They all get packed to the same DSC structure which is the struct drm_=
dsc_config but the way the parameters are computed is specific to the HW.
> >>
> >> This DPU file helper still uses the drm_dsc_helper's drm_dsc_compute_r=
c_parameters() like all other vendors do but the parameters themselves are =
very HW specific and belong to each vendor's dir.
> >>
> >> This is not unique to MSM.
> >>
> >> Lets take a few other examples:
> >>
> >> AMD: https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gp=
u/drm/amd/display/dc/dml/dsc/rc_calc_fpu.c#L165
> >>
> >> i915: https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/g=
pu/drm/i915/display/intel_vdsc.c#L379
> >
> > I checked several values here. Intel driver defines more bpc/bpp combin=
ations, but the ones which are defined in intel_vdsc and in this patch seem=
 to match. If there are major differences there, please point me to the exa=
ct case.
> >
> > I remember that AMD driver might have different values.
> >
>
> Some values in the rc_params table do match. But the rc_buf_thresh[] does=
nt.

Because later they do:

vdsc_cfg->rc_buf_thresh[i] =3D rc_buf_thresh[i] >> 6;

>
> https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gpu/drm/i9=
15/display/intel_vdsc.c#L40
>
> Vs
>
> +static u16 dpu_dsc_rc_buf_thresh[DSC_NUM_BUF_RANGES - 1] =3D {
> +               0x0e, 0x1c, 0x2a, 0x38, 0x46, 0x54,
> +               0x62, 0x69, 0x70, 0x77, 0x79, 0x7b, 0x7d, 0x7e
> +};

I'd prefer to have 896, 1792, etc. here, as those values come from the
standard. As it's done in the Intel driver.

> I dont know the AMD calculation very well to say that moving this to the
> helper is going to help.

Those calculations correspond (more or less) at the first glance to
what intel does for their newer generations. I think that's not our
problem for now.

>
> Also, i think its too risky to change other drivers to use whatever math
> we put in the drm_dsc_helper to compute thr RC params because their code
> might be computing and using this tables differently.
>
> Its too much ownership for MSM developers to move this to drm_dsc_helper
> and own that as it might cause breakage of basic DSC even if some values
> are repeated.

It's time to stop thinking about ownership and start thinking about
shared code. We already have two instances of DSC tables. I don't
think having a third instance, which is a subset of an existing
dataset, would be beneficial to anybody.
AMD has complicated code which supports half-bit bpp and calculates
some of the parameters. But sharing data with the i915 driver is
straightforward.

> I would prefer to keep it in the msm code but in a top level directory
> so that we dont have to make DSI dependent on DPU.

I haven't changed my opinion. Please move relevant i915's code to
helpers, verify data against standards and reuse it.

> >> All vendors compute the values differently and eventually call drm_dsc=
_compute_rc_parameters()
> >>
> >>> I didn't check the tables against the standard (or against the curren=
t source code), will do that later.

--=20
With best wishes
Dmitry
