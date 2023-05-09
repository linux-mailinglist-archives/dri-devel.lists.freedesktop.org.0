Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5DF66FC4B3
	for <lists+dri-devel@lfdr.de>; Tue,  9 May 2023 13:12:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 940FB10E388;
	Tue,  9 May 2023 11:12:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com
 [IPv6:2607:f8b0:4864:20::b32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4749010E388
 for <dri-devel@lists.freedesktop.org>; Tue,  9 May 2023 11:12:21 +0000 (UTC)
Received: by mail-yb1-xb32.google.com with SMTP id
 3f1490d57ef6-b9d8b458e10so7361231276.1
 for <dri-devel@lists.freedesktop.org>; Tue, 09 May 2023 04:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683630740; x=1686222740;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=O+AtwPwXPZlp/x5nJkkCBaOlYDV83aySbZPDW4HW+Ks=;
 b=HOmFRHQ2CGgJGUmh5sxSRX/cHyAlfs0He1YcCwUGt/kvIdjXiZVz7xhA+MnwFqMURm
 XETqZd8VkjC55dbMw6IcaJGxixIgQL1p9+Cd4Y7GjdlyFLhAwaTVYHZrrRBQZNnY6GRa
 BEWFlXxrA7LQAvwKR/RwkoPq7S24CBVL/TE48aIROCvrcu0apEzL9KzyhLrvCtgTk7eU
 GOhZx8fpt9fn7m+Ca8mfsyrbQ5Mdteum0XLGOQAU4bm2M4bmiouLjHma1F1lrbkDhp3m
 9/fmviKxf3yNj3OoB6y5dTF92i3KSYLxRHnDclg+hbFWH6QqXKutinXVcIzaw7ek7WUJ
 mCqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683630740; x=1686222740;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=O+AtwPwXPZlp/x5nJkkCBaOlYDV83aySbZPDW4HW+Ks=;
 b=GFozw6851plp09HO4UrcHpymrDQuroVv1nzejrpUxMVd2tSRi4+XfFUDvswE/zpUWs
 pkO3LZHQcN3/Rad/ZUIwK6Fq1q9NuJ2+jrFKRbLjzg1aACEvfXRO+sIFUKJUiPtV8JAs
 oF2106FOg0+nui/CVaZJd9Gke5N3y9JlVHtqm5jXnBInQHuh/TfVM3hTPzfvn+9WecMo
 2TtcI3YkwLCjWTaPdZUKcNMDdvVKz67fuzG7yfPx9jAf4XB1/aTmWKc2kqmfckaXXDyP
 qZZi5qaWSh4dNxYqC9XSagwdutm/d7VMIEWGHL3arOl1ZxJAKm8P6yJFGueKrcdbAoWA
 HKxw==
X-Gm-Message-State: AC+VfDy2IpaJ80HrVtGzF3TC7Q8VijoaFTtHQ9E3s9zP0LYchU/GEKmr
 aOJVXeScHbWDurJKpUEnYvlSaz+DAK6k3974dopQ9g==
X-Google-Smtp-Source: ACHHUZ7LNWGXsH5ngDCkMQSeQBUdW9HlHh4f1cvgaN8Fn0DQyw7TEC/v0WbmUraisWvo/nYB5xTL7/87v2KHSJ9yXrU=
X-Received: by 2002:a25:ade5:0:b0:b99:93d5:26dd with SMTP id
 d37-20020a25ade5000000b00b9993d526ddmr14771104ybe.20.1683630739827; Tue, 09
 May 2023 04:12:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230405-add-dsc-support-v2-0-1072c70e9786@quicinc.com>
 <20230405-add-dsc-support-v2-3-1072c70e9786@quicinc.com>
 <i6i2xj2tuy5mcxsj674d77kfdb3ne6immkmrzw5f6u4bfx2sth@ef7fzrhdyypx>
 <1d7ccb5f-55c2-3b3a-df97-2c17beffabfc@quicinc.com>
 <0aa4130d-bb37-4743-10e5-fd518276f4a2@linaro.org>
 <chw4jhkwbtml3w3ha6beubvvil4jsr7wuzahfif2mzkcmsqhwj@wgm7axq2o6wk>
In-Reply-To: <chw4jhkwbtml3w3ha6beubvvil4jsr7wuzahfif2mzkcmsqhwj@wgm7axq2o6wk>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 9 May 2023 14:12:08 +0300
Message-ID: <CAA8EJpoW_rrvTP8kt2gHKZA+0Jez0_dKay3XGs+3_CaHQK7+Wg@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] drm/msm/dpu: Add DPU_INTF_DATA_COMPRESS feature
 flag
To: Marijn Suijten <marijn.suijten@somainline.org>
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
Cc: freedreno@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 9 May 2023 at 10:00, Marijn Suijten
<marijn.suijten@somainline.org> wrote:
>
> On 2023-05-09 02:08:52, Dmitry Baryshkov wrote:
> > On 09/05/2023 00:46, Jessica Zhang wrote:
> > >
> > >
> > > On 5/7/2023 9:00 AM, Marijn Suijten wrote:
> > >> On 2023-05-05 14:23:50, Jessica Zhang wrote:
> > >>> Add DATA_COMPRESS feature flag to DPU INTF block.
> > >>>
> > >>> In DPU 7.x and later, DSC/DCE enablement registers have been moved from
> > >>> PINGPONG to INTF.
> > >>>
> > >>> As core_rev (and related macros) was removed from the dpu_kms struct,
> > >>> the
> > >>> most straightforward way to indicate the presence of this register
> > >>> would be
> > >>> to have a feature flag.
> > >>
> > >> Irrelevant.  Even though core_rev was still in mainline until recently,
> > >> we always hardcoded the features in the catalog and only used core_rev
> > >> to select a dpu_mdss_cfg catalog entry.  There is no "if version >= X
> > >> then enable feature Y" logic, this manually-enabled feature flag is the
> > >> only, correct way to do it.
> > >
> > > Hi Marijn,
> > >
> > > Understood. FWIW, if we do find more register bit-level differences
> > > between HW versions in the future, it might make more sense to keep the
> > > HW catalog small and bring core_rev back, rather than keep adding these
> > > kinds of small differences to caps.
> >
> > Let's see how it goes. Abhinav suggested that there might be feature
> > differences inside the DPU generations (and even inside the single DPU
> > major/minor combo). So I'm not sure what core_rev will bring us.
> >
> > Let's land the platforms which are ready (or if there is anything close
> > to be submitted).
>
> You mean waiting for catalog changes on the list specifically, so the
> DSC series as well as SM6350/SM6375?  I do intend to send SM6125 now
> that the INTF TE series (required for it, as well as for SM63**) seems
> to be generally accepted, but have been quite busy with the DSC series
> on the list as we're now unblocking many Xperia's to finally have
> display!

Yes, please send it, as you find time. No time pressure.

>
> The catalog addition is "pretty much ready", let me know if you'd like
> it to be sent in prior to your cleanup.

-- 
With best wishes
Dmitry
