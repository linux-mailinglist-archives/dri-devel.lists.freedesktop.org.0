Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD6D4E5A2F
	for <lists+dri-devel@lfdr.de>; Wed, 23 Mar 2022 21:50:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3549010E171;
	Wed, 23 Mar 2022 20:50:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C7AC10E121;
 Wed, 23 Mar 2022 20:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1648068650; x=1679604650;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Le8vCkALSx2+L8taW7J6S8H+GoppDn/GSqrf/tx19rg=;
 b=X+G4KiNGpsm7LYgTAj9SRlCx6D+fAOmmIq6qN7rDgzT7O6I5KOt0Qpts
 WXNb/5KTwx/iXf5StngSb5LBYW9Lhudtio2MNhI1LB40g2tAblV84fm4r
 Hj5/kIG0tc8RU+ey6FgqgyFlYyquKLbv8U2saB0EnT0oLvl+qTTn4Nl/F I=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 23 Mar 2022 13:50:49 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2022 13:50:48 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 23 Mar 2022 13:50:48 -0700
Received: from [10.110.52.81] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 23 Mar
 2022 13:50:46 -0700
Message-ID: <c9899a30-df55-06b1-c99d-66ccc9fa3edf@quicinc.com>
Date: Wed, 23 Mar 2022 13:50:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 00/22] drm: Review of mode copies
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, "Alex
 Deucher" <alexdeucher@gmail.com>
References: <20220218100403.7028-1-ville.syrjala@linux.intel.com>
 <Yi+9n0eGn3rNKb4X@intel.com>
 <CADnq5_NS07TPBWSnETRhjzqtX_oUuCu86ewurFT3MJO=PcLAuQ@mail.gmail.com>
 <Yjj+RSVBWk6UO2C7@intel.com>
 <e9937a37-70c8-cc6f-15f2-1dbbb7f1bfba@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <e9937a37-70c8-cc6f-15f2-1dbbb7f1bfba@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
 Chen Feng <puck.chen@hisilicon.com>, Alain Volmat <alain.volmat@foss.st.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Jonas
 Karlman <jonas@kwiboo.se>, Leo Li <sunpeng.li@amd.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Nikola Cornij <nikola.cornij@amd.com>, Sean Paul <sean@poorly.run>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Tomi Valkeinen <tomba@kernel.org>, Jyri Sarha <jyri.sarha@iki.fi>,
 Sandy Huang <hjc@rock-chips.com>, Robert Foss <robert.foss@linaro.org>,
 Alex Deucher <alexander.deucher@amd.com>, Tian Tao <tiantao6@hisilicon.com>,
 freedreno <freedreno@lists.freedesktop.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 3/23/2022 3:39 AM, Dmitry Baryshkov wrote:
> On 22/03/2022 01:37, Ville Syrjälä wrote:
>> On Tue, Mar 15, 2022 at 02:52:38PM -0400, Alex Deucher wrote:
>>> On Mon, Mar 14, 2022 at 6:12 PM Ville Syrjälä
>>> <ville.syrjala@linux.intel.com> wrote:
>>>>
>>>> On Fri, Feb 18, 2022 at 12:03:41PM +0200, Ville Syrjala wrote:
>>>>>    drm: Add drm_mode_init()
>>>>>    drm/bridge: Use drm_mode_copy()
>>>>>    drm/imx: Use drm_mode_duplicate()
>>>>>    drm/panel: Use drm_mode_duplicate()
>>>>>    drm/vc4: Use drm_mode_copy()
>>>> These have been pushed to drm-misc-next.
>>>>
>>>>>    drm/amdgpu: Remove pointless on stack mode copies
>>>>>    drm/amdgpu: Use drm_mode_init() for on-stack modes
>>>>>    drm/amdgpu: Use drm_mode_copy()
>>>> amdgpu ones are reviewed, but I'll leave them for the
>>>> AMD folks to push to whichever tree they prefer.
>>>
>>> I pulled patches 2, 4, 5 into my tree.
>>
>> Thanks.
>>
>>> For 3, I'm happy to have it
>>> land via drm-misc with the rest of the mode_init changes if you'd
>>> prefer.
>>
>> Either way works for me. I don't yet have reviews yet for
>> the other drivers, so I'll proably hold off for a bit more
>> at least. And the i915 patch I'll be merging via drm-intel.
>>
>>>>>    drm/radeon: Use drm_mode_copy()
>>>>>    drm/gma500: Use drm_mode_copy()
>>>>>    drm/tilcdc: Use drm_mode_copy()
>>>>>    drm/i915: Use drm_mode_copy()
>>
>> Those are now all in.
>>
>> Which leaves us with these stragglers:
>>>>>    drm/hisilicon: Use drm_mode_init() for on-stack modes
> 
>>>>>    drm/msm: Nuke weird on stack mode copy
>>>>>    drm/msm: Use drm_mode_init() for on-stack modes
>>>>>    drm/msm: Use drm_mode_copy()
> 
> These three patches went beneath my radar for some reason.
> 
> I have just sent a replacement for the first patch ([1]). Other two 
> patches can be pulled in msm/msm-next (or msm/msm-fixes) during the next 
> development cycle if that works for you.
> 
> [1] https://patchwork.freedesktop.org/series/101682/

Agree with this approach.

We can replace the first patch with 
https://patchwork.freedesktop.org/series/101682/.

Thanks

Abhinav

> 
>>>>>    drm/mtk: Use drm_mode_init() for on-stack modes
>>>>>    drm/rockchip: Use drm_mode_copy()
>>>>>    drm/sti: Use drm_mode_copy()
>>>>>    drm: Use drm_mode_init() for on-stack modes
>>>>>    drm: Use drm_mode_copy()
>>
> 
> 
