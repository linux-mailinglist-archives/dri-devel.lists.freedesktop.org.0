Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4201B6FBA42
	for <lists+dri-devel@lfdr.de>; Mon,  8 May 2023 23:50:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EA8F10E068;
	Mon,  8 May 2023 21:50:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay07.th.seeweb.it (relay07.th.seeweb.it [5.144.164.168])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5220210E068
 for <dri-devel@lists.freedesktop.org>; Mon,  8 May 2023 21:50:36 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id C5C0D3F5A5;
 Mon,  8 May 2023 23:50:33 +0200 (CEST)
Date: Mon, 8 May 2023 23:50:32 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: Re: [PATCH v2 3/4] drm/msm/dpu: Add DPU_INTF_DATA_COMPRESS feature
 flag
Message-ID: <omythya2ks2u7awnlciwhiwmyo6ybqgwe6wpwmlly4dfmvxo6h@3cucuvs77hav>
References: <20230405-add-dsc-support-v2-0-1072c70e9786@quicinc.com>
 <20230405-add-dsc-support-v2-3-1072c70e9786@quicinc.com>
 <i6i2xj2tuy5mcxsj674d77kfdb3ne6immkmrzw5f6u4bfx2sth@ef7fzrhdyypx>
 <1d7ccb5f-55c2-3b3a-df97-2c17beffabfc@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1d7ccb5f-55c2-3b3a-df97-2c17beffabfc@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-05-08 14:46:10, Jessica Zhang wrote:
> 
> 
> On 5/7/2023 9:00 AM, Marijn Suijten wrote:
> > On 2023-05-05 14:23:50, Jessica Zhang wrote:
> >> Add DATA_COMPRESS feature flag to DPU INTF block.
> >>
> >> In DPU 7.x and later, DSC/DCE enablement registers have been moved from
> >> PINGPONG to INTF.
> >>
> >> As core_rev (and related macros) was removed from the dpu_kms struct, the
> >> most straightforward way to indicate the presence of this register would be
> >> to have a feature flag.
> > 
> > Irrelevant.  Even though core_rev was still in mainline until recently,
> > we always hardcoded the features in the catalog and only used core_rev
> > to select a dpu_mdss_cfg catalog entry.  There is no "if version >= X
> > then enable feature Y" logic, this manually-enabled feature flag is the
> > only, correct way to do it.
> 
> Hi Marijn,
> 
> Understood.

Thanks if you can drop the paragraph.

> FWIW, if we do find more register bit-level differences 
> between HW versions in the future, it might make more sense to keep the 
> HW catalog small and bring core_rev back, rather than keep adding these 
> kinds of small differences to caps.

That is not up to me to decide, but I do agree that DPU is currently
"one big mess" where lots of things are hardcoded in the catalog (which
isn't a bad thing, these things won't change but it does make it harder
on us than if we could dynamically state "every DPU between these two
revisions"), and certain other things are/were read back from hardware
registers.

As well as the sub-block feature flags that pain us :)

- Marijn

> Thanks,
> 
> Jessica Zhang

<snip>
