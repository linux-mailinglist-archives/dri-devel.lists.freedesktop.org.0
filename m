Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04DA055A4A8
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jun 2022 01:12:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07D8710E483;
	Fri, 24 Jun 2022 23:12:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com
 [IPv6:2607:f8b0:4864:20::c2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B401E10E63D
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 23:12:49 +0000 (UTC)
Received: by mail-oo1-xc2a.google.com with SMTP id
 v12-20020a4a314c000000b0041b65c7e100so756934oog.8
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 16:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=yUaUlIMPAe3wvXnfRM5gi/o9kg0TXggL9B/IQ5XoR14=;
 b=KmbtAF/HUwJQPL9R+/SHHlpK6bf5UsbrnR8kNiAgyPnzFI/NFDn2EEmjfpO3ZaRR3h
 qbt49v0otRmZ6AbsFxHqo1zKUYVlJmKKByrLpQMbjyGDUlT/qdZKAqe2x8EawZN5IpYz
 CuOXJGVE0gUAfSJWMAdJHk8IwzujuKLd2ejTo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc:content-transfer-encoding;
 bh=yUaUlIMPAe3wvXnfRM5gi/o9kg0TXggL9B/IQ5XoR14=;
 b=Y3iZZ8VdFvfRoidALmktAICc9RQGV5qjqbg+MwuwwbF+nwkfmC9/cidUQKBvwplJCg
 QGde7R9lIr7ThQ7UmauB9rmYm5R9/InxJNA+msGYaivZdxmptOQWf8ENcuEDKrvJT2Ej
 Lpk2MjaddAcgG/bFZaLAFgRHJoQapc1ViWUfVXmGh22tMkIygOAGZeOLtfE5svG5/H3a
 5dqSqA+ppF7QFzu12BvgOnBc/2D3S2D1ecLatmDKm2mAe1N/jUx80gN2GEGUXSyvpPEI
 h322svrmoYhvEkncLF0MNbunVArvSiT5cFeZVtan+w46UdqX8Ef1MmYVFy3OikhBoeTu
 WfZw==
X-Gm-Message-State: AJIora87Y2N1HUVN9UG0T4V5JT5tjpAU9ujd1PhprBTRiqF67FjDPVcj
 DzjnucxNGdlwb1wQjInmwOFQABN8qTxM9/PB0k02Kg==
X-Google-Smtp-Source: AGRyM1u+zQwL2M2+LhjYYBJM+V6JwxPLfyNbwqTgSpF9LXZ+0EnlDVkdDj+tlkI7rGfOi4l5ouEEmbRFSndfkF/HJ3g=
X-Received: by 2002:a4a:98a6:0:b0:41b:e04e:70ce with SMTP id
 a35-20020a4a98a6000000b0041be04e70cemr683244ooj.25.1656112369023; Fri, 24 Jun
 2022 16:12:49 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 24 Jun 2022 16:12:48 -0700
MIME-Version: 1.0
In-Reply-To: <326912ff-9771-0711-366d-79acd436908b@quicinc.com>
References: <1656090912-18074-1-git-send-email-quic_khsieh@quicinc.com>
 <1656090912-18074-3-git-send-email-quic_khsieh@quicinc.com>
 <CAE-0n52RW+UFJ=hqMWjwR8qvEbww7QjzPW1nhL3Atd97QXAnYw@mail.gmail.com>
 <007ea4c9-9701-f4ab-3278-5d36bf2018c4@quicinc.com>
 <CAE-0n53kNCK0ajHfY2WQr5HEQZtZSBLnhfbTuZwaUNEOZhsKPg@mail.gmail.com>
 <fa7f8bf1-33cd-5515-0143-6596df2bd740@quicinc.com>
 <CAE-0n51g-EVsC-i9=sJV-ySa8VnE+yT7cg=b-TNMi9+3uBiOVA@mail.gmail.com>
 <326912ff-9771-0711-366d-79acd436908b@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 24 Jun 2022 16:12:48 -0700
Message-ID: <CAE-0n51qrdrFtSr0vRwgYkMgSZfnzQuinaUROQsp30QoDchWQA@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] drm/msm/dp: decoupling dp->id out of dp
 controller_id at scxxxx_dp_cfg table
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org, airlied@linux.ie,
 bjorn.andersson@linaro.org, daniel@ffwll.ch, dianders@chromium.org, 
 dmitry.baryshkov@linaro.org, dri-devel@lists.freedesktop.org, 
 robdclark@gmail.com, sean@poorly.run, vkoul@kernel.org
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 quic_aravindh@quicinc.com, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2022-06-24 15:53:45)
>
> MSM_DP_CONTROLLER_1 need to match to the index =3D 1 of sc7280_dp_cfg[] <=
=3D=3D This is correct
>
> The problem is sc7280_dp_cfg[] have two entries since eDP place at index
> of MSM_DP_CONTROLLER_1.
>
> but .num_desc =3D 1=C2=A0 <=3D=3D this said only have one entry at sc7280=
_dp_cfg[]
> table. Therefore eDP will never be found at for loop=C2=A0 at
> _dpu_kms_initialize_displayport().
>

Yes, but what else does the MSM_DP_CONTROLLER_1 need to match? Because
the intention of the previous commit was to make it so the order of
sc7280_dp_cfg couldn't be messed up and not match the
MSM_DP_CONTROLLER_1 value that lives in sc7280_intf[].

>
> Sorry, my mistake. it is not in drm_bridge_add.
>
> It should be in dpu_encoder_init() of _dpu_kms_initialize_displayport().
>
> can you make below changes (patch) to _dpu_kms_initialize_displayport().
>

Yes, I've made that change to try to understand the problem. I still
don't understand, sadly. Does flipping the order of iteration through
'priv->dp' somehow mean that the crtc that is assigned to the eDP
connector is left unchanged? Whereas without registering the eDP encoder
first means we have to change the crtc for the eDP encoder and that
can't be done atomically?
