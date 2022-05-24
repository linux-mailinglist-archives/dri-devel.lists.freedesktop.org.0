Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 53842532272
	for <lists+dri-devel@lfdr.de>; Tue, 24 May 2022 07:28:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3236B10E38F;
	Tue, 24 May 2022 05:28:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from desiato.infradead.org (desiato.infradead.org
 [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25B5710E5BF;
 Tue, 24 May 2022 05:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=2VtEeL3LYI3tn6ymwoPdd7cGYYQeTtuIYXW+VQ1eTis=; b=j1S0r+DfFSKHn/PnO/l5SfRfuy
 HMGksZWm8gJQxXKNGn5eO+sSMq9t0q5nxlVtrWPEfqSA04E92MpuSkyDdRIaFpzdHOvp57r23PHsA
 ef/QCfeT+zajVkdcoSqlaS/Neyh5+dI16TQWrQaSm3HaPs0iaHnqkwRhF7LbbNMTO2uqK6mnO12Hg
 79/Kz73RvUYYrxtbzDi2ugTj0SPcDmXv/kflXK5vbAAhB5yhXWvP8oyTyrtxOjfBc+rfTre4DQpYt
 WYUyGQ4iMROH5Xc/8eMOJArDTHEVwMSojWpBgcqk6LbsnjAy61CY54LCDpsfqf58nXw7fnWpB6ib9
 oHjQUm4w==;
Received: from [2601:1c0:6280:3f0::aa0b]
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ntN5v-001Ffq-2K; Tue, 24 May 2022 05:28:38 +0000
Message-ID: <83787d45-d8cd-26b5-1ca1-412d49570000@infradead.org>
Date: Mon, 23 May 2022 22:28:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH -next] drm/msm: DRM_DP_AUX_BUS depends on OF
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20220523204337.19739-1-rdunlap@infradead.org>
 <CAA8EJpoLBLVv3Snth2Jn-aLAXTOnOas=zcns829ddr4mF7sNig@mail.gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <CAA8EJpoLBLVv3Snth2Jn-aLAXTOnOas=zcns829ddr4mF7sNig@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/23/22 15:23, Dmitry Baryshkov wrote:
> Hi,
> 
> On Mon, 23 May 2022 at 23:43, Randy Dunlap <rdunlap@infradead.org> wrote:
>>
>> Fix a Kconfig warning for DRM_MSM by making it depend on OF,
>> since 'select' does not follow any dependency chaings.
>>
>> WARNING: unmet direct dependencies detected for DRM_DP_AUX_BUS
> 
> I think it was agreed that DRM_DP_AUX_BUS should depend on OF ||
> COMPILE_TEST (and the patch has been submitted by YueHaibing). See the
> thread at https://lore.kernel.org/dri-devel/9534934e-4c4a-ba2f-3bc3-d6d241e625bb@linaro.org/T/
> 

I see.  Thanks.

> 
>>   Depends on [n]: HAS_IOMEM [=y] && DRM [=m] && OF [=n]
>>   Selected by [m]:
>>   - DRM_MSM [=m] && HAS_IOMEM [=y] && DRM [=m] && (ARCH_QCOM || SOC_IMX5 || COMPILE_TEST [=y]) && COMMON_CLK [=y] && IOMMU_SUPPORT [=y] && (QCOM_OCMEM [=n] || QCOM_OCMEM [=n]=n) && (QCOM_LLCC [=y] || QCOM_LLCC [=y]=n) && (QCOM_COMMAND_DB [=n] || QCOM_COMMAND_DB [=n]=n)
>>
>> Fixes: f5d01644921b ("drm/msm: select DRM_DP_AUX_BUS for the AUX bus support")
>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>> Cc: Rob Clark <robdclark@gmail.com>
>> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> Cc: Sean Paul <sean@poorly.run>
>> Cc: linux-arm-msm@vger.kernel.org
>> Cc: dri-devel@lists.freedesktop.org
>> Cc: freedreno@lists.freedesktop.org
>> Cc: David Airlie <airlied@linux.ie>
>> Cc: Daniel Vetter <daniel@ffwll.ch>
>> ---
>>  drivers/gpu/drm/msm/Kconfig |    1 +
>>  1 file changed, 1 insertion(+)
>>
>> --- a/drivers/gpu/drm/msm/Kconfig
>> +++ b/drivers/gpu/drm/msm/Kconfig
>> @@ -3,6 +3,7 @@
>>  config DRM_MSM
>>         tristate "MSM DRM"
>>         depends on DRM
>> +       depends on OF
>>         depends on ARCH_QCOM || SOC_IMX5 || COMPILE_TEST
>>         depends on COMMON_CLK
>>         depends on IOMMU_SUPPORT
> 
> 
> 

-- 
~Randy
