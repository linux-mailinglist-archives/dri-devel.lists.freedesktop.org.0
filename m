Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 443226BC350
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 02:30:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D99910E04B;
	Thu, 16 Mar 2023 01:30:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE8FC10E04B;
 Thu, 16 Mar 2023 01:30:25 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32FNd8g0010821; Thu, 16 Mar 2023 01:28:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=Rh2s636CvYwgQ4yfVd5k5Ebr5L5f1BEBwTP1eF1BAZM=;
 b=b5YgMVdhSPfvZR8uDhG9tY1fE4O6L2Xxo+bRkHuroDfhsY+NLk4rsUtS4esl6hOSBcL7
 ECXPUDth0aORlc1/d8bN0tfTKyqlUDVRnt+Gu8CZOz2okAmIhMxMsc9J3z2FGaJ//fPb
 8O27/0SPO8OZes0LZWe87ha4WGlcqaLjMfdxQYOSnTLknwTDlj/xPLHdo4cBZ4kSg1Oe
 ngWJxouvTHn1sOx9QxwNQDEfo+MGLT/9le2WisnMpe5L6EcgeVO54LSwc1kyGizPBwKW
 SnQmJjZqFAWFWnK3UHcC1ONynTRGYc/v20nlkwdmqfXfiwOMNi0fCXckUN56vkV52fC7 jw== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pbpxjraaw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Mar 2023 01:28:23 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32G1SMIi030772
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Mar 2023 01:28:22 GMT
Received: from [10.71.110.193] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Wed, 15 Mar
 2023 18:28:21 -0700
Message-ID: <a5d1a74f-1b7a-569d-e487-774720dfae22@quicinc.com>
Date: Wed, 15 Mar 2023 18:28:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [Freedreno] [RFC PATCH 1/2] drm/msm/dpu: add dsc helper functions
Content-Language: en-US
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>
References: <1677267647-28672-1-git-send-email-quic_khsieh@quicinc.com>
 <1677267647-28672-2-git-send-email-quic_khsieh@quicinc.com>
 <42b3c193-8897-cfe9-1cae-2f9a66f7983a@linaro.org>
 <741be2a3-0208-2f40-eedf-d439c4e6795b@quicinc.com>
 <F8A4FC18-C64E-4011-BC08-18EB3B95A357@linaro.org>
 <d5ee8233-66c8-9b88-417c-6cf9cc5c84fe@quicinc.com>
 <CAA8EJpro5Q-2ZpnDJt40UhFX7Zp9oBhrto=FDOERzCDR2BDPvQ@mail.gmail.com>
 <f0dfba42-4674-3748-bf5d-39f6e1745f67@quicinc.com>
 <f1a6ee82-9502-7ea5-fe48-f296fc7df497@linaro.org>
 <3e114c0f-a042-6801-69bf-67436cb2a448@quicinc.com>
 <113a10b6-6097-c80e-c29c-6f61b2b2896a@linaro.org>
 <c4c0ebf8-275d-500f-4019-e3d7517a884f@quicinc.com>
 <CAA8EJppxX4haZSwdvVbN7bc6kXAyNO1rg6zWZv9wPFdqGrcXuw@mail.gmail.com>
 <c650e746-64c5-ce6b-933d-057349356b78@quicinc.com>
 <58E03B71-20C4-4F81-96C1-6D8CE517F3FB@linaro.org>
 <fd876ad2-3fd0-eaab-3407-dd32d494f662@quicinc.com>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <fd876ad2-3fd0-eaab-3407-dd32d494f662@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: gavQzYJvOK_x8nvcoXVj9Y110a-YDpSp
X-Proofpoint-ORIG-GUID: gavQzYJvOK_x8nvcoXVj9Y110a-YDpSp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-15_12,2023-03-15_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 mlxscore=0 bulkscore=0 clxscore=1011
 mlxlogscore=999 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2303150002 definitions=main-2303160011
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, quic_sbillaka@quicinc.com,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, andersson@kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org, vkoul@kernel.org,
 agross@kernel.org, Rodrigo
 Vivi <rodrigo.vivi@intel.com>, marijn.suijten@somainline.org,
 swboyd@chromium.org, sean@poorly.run,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2/27/2023 1:24 PM, Abhinav Kumar wrote:
> 
> 
> On 2/27/2023 11:25 AM, Dmitry Baryshkov wrote:
>> 27 февраля 2023 г. 19:59:35 GMT+02:00, Abhinav Kumar 
>> <quic_abhinavk@quicinc.com> пишет:
>>>
>>>
>>> On 2/27/2023 4:45 AM, Dmitry Baryshkov wrote:
>>>> On Mon, 27 Feb 2023 at 01:49, Abhinav Kumar 
>>>> <quic_abhinavk@quicinc.com> wrote:
>>>>>
>>>>>
>>>>>
>>>>> On 2/26/2023 5:09 AM, Dmitry Baryshkov wrote:
>>>>>> On 26/02/2023 02:47, Abhinav Kumar wrote:
>>>>>>> Hi Dmitry
>>>>>>>
>>>>>>> On 2/25/2023 7:23 AM, Dmitry Baryshkov wrote:
>>>>>>>> On 25/02/2023 02:36, Abhinav Kumar wrote:
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> On 2/24/2023 3:53 PM, Dmitry Baryshkov wrote:
>>>>>>>>>> On Sat, 25 Feb 2023 at 00:26, Abhinav Kumar
>>>>>>>>>> <quic_abhinavk@quicinc.com> wrote:
>>>>>>>>>>> On 2/24/2023 1:36 PM, Dmitry Baryshkov wrote:
>>>>>>>>>>>> 24 февраля 2023 г. 23:23:03 GMT+02:00, Abhinav Kumar
>>>>>>>>>>>> <quic_abhinavk@quicinc.com> пишет:
>>>>>>>>>>>>> On 2/24/2023 1:13 PM, Dmitry Baryshkov wrote:
>>>>>>>>>>>>>> On 24/02/2023 21:40, Kuogee Hsieh wrote:
>>>>>>>>>>>>>>> Add DSC helper functions based on DSC configuration profiles
>>>>>>>>>>>>>>> to produce
>>>>>>>>>>>>>>> DSC related runtime parameters through both table look up 
>>>>>>>>>>>>>>> and
>>>>>>>>>>>>>>> runtime
>>>>>>>>>>>>>>> calculation to support DSC on DPU.
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> There are 6 different DSC configuration profiles are 
>>>>>>>>>>>>>>> supported
>>>>>>>>>>>>>>> currently.
>>>>>>>>>>>>>>> DSC configuration profiles are differiented by 5 keys, DSC
>>>>>>>>>>>>>>> version (V1.1),
>>>>>>>>>>>>>>> chroma (444/422/420), colorspace (RGB/YUV), bpc(8/10),
>>>>>>>>>>>>>>> bpp (6/7/7.5/8/9/10/12/15) and SCR (0/1).
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> Only DSC version V1.1 added and V1.2 will be added later.
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> These helpers should go to
>>>>>>>>>>>>>> drivers/gpu/drm/display/drm_dsc_helper.c
>>>>>>>>>>>>>> Also please check that they can be used for i915 or for 
>>>>>>>>>>>>>> amdgpu
>>>>>>>>>>>>>> (ideally for both of them).
>>>>>>>>>>>>>>
>>>>>>>>>>>>>
>>>>>>>>>>>>> No, it cannot. So each DSC encoder parameter is calculated 
>>>>>>>>>>>>> based
>>>>>>>>>>>>> on the HW core which is being used.
>>>>>>>>>>>>>
>>>>>>>>>>>>> They all get packed to the same DSC structure which is the
>>>>>>>>>>>>> struct drm_dsc_config but the way the parameters are 
>>>>>>>>>>>>> computed is
>>>>>>>>>>>>> specific to the HW.
>>>>>>>>>>>>>
>>>>>>>>>>>>> This DPU file helper still uses the drm_dsc_helper's
>>>>>>>>>>>>> drm_dsc_compute_rc_parameters() like all other vendors do but
>>>>>>>>>>>>> the parameters themselves are very HW specific and belong to
>>>>>>>>>>>>> each vendor's dir.
>>>>>>>>>>>>>
>>>>>>>>>>>>> This is not unique to MSM.
>>>>>>>>>>>>>
>>>>>>>>>>>>> Lets take a few other examples:
>>>>>>>>>>>>>
>>>>>>>>>>>>> AMD:
>>>>>>>>>>>>> https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gpu/drm/amd/display/dc/dml/dsc/rc_calc_fpu.c#L165
>>>>>>>>>>>>>
>>>>>>>>>>>>>
>>>>>>>>>>>>> i915:
>>>>>>>>>>>>> https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gpu/drm/i915/display/intel_vdsc.c#L379
>>>>>>>>>>>>>
>>>>>>>>>>>>
>>>>>>>>>>>> I checked several values here. Intel driver defines more 
>>>>>>>>>>>> bpc/bpp
>>>>>>>>>>>> combinations, but the ones which are defined in intel_vdsc 
>>>>>>>>>>>> and in
>>>>>>>>>>>> this patch seem to match. If there are major differences there,
>>>>>>>>>>>> please point me to the exact case.
>>>>>>>>>>>>
>>>>>>>>>>>> I remember that AMD driver might have different values.
>>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> Some values in the rc_params table do match. But the
>>>>>>>>>>> rc_buf_thresh[] doesnt.
>>>>>>>>>>
>>>>>>>>>> Because later they do:
>>>>>>>>>>
>>>>>>>>>> vdsc_cfg->rc_buf_thresh[i] = rc_buf_thresh[i] >> 6;
>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gpu/drm/i915/display/intel_vdsc.c#L40
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> Vs
>>>>>>>>>>>
>>>>>>>>>>> +static u16 dpu_dsc_rc_buf_thresh[DSC_NUM_BUF_RANGES - 1] = {
>>>>>>>>>>> +               0x0e, 0x1c, 0x2a, 0x38, 0x46, 0x54,
>>>>>>>>>>> +               0x62, 0x69, 0x70, 0x77, 0x79, 0x7b, 0x7d, 0x7e
>>>>>>>>>>> +};
>>>>>>>>>>
>>>>>>>>>> I'd prefer to have 896, 1792, etc. here, as those values come 
>>>>>>>>>> from the
>>>>>>>>>> standard. As it's done in the Intel driver.
>>>>>>>>>>
>>>>>>>>>
>>>>>>>>> Got it, thanks
>>>>>>>>>
>>>>>>>>>>> I dont know the AMD calculation very well to say that moving 
>>>>>>>>>>> this
>>>>>>>>>>> to the
>>>>>>>>>>> helper is going to help.
>>>>>>>>>>
>>>>>>>>>> Those calculations correspond (more or less) at the first 
>>>>>>>>>> glance to
>>>>>>>>>> what intel does for their newer generations. I think that's 
>>>>>>>>>> not our
>>>>>>>>>> problem for now.
>>>>>>>>>>
>>>>>>>>>
>>>>>>>>> Well, we have to figure out if each value matches and if each of
>>>>>>>>> them come from the spec for us and i915 and from which section. So
>>>>>>>>> it is unfortunately our problem.
>>>>>>>>
>>>>>>>> Otherwise it will have to be handled by Marijn, me or anybody else
>>>>>>>> wanting to hack up the DSC code. Or by anybody adding DSC 
>>>>>>>> support to
>>>>>>>> the next platform and having to figure out the difference between
>>>>>>>> i915, msm and their platform.
>>>>>>>>
>>>>>>>
>>>>>>> Yes, I wonder why the same doubt didn't arise when the other vendors
>>>>>>> added their support both from other maintainers and others.
>>>>>>>
>>>>>>> Which makes me think that like I wrote in my previous response, 
>>>>>>> these
>>>>>>> are "recommended" values in the spec but its not mandatory.
>>>>>>
>>>>>> I think, it is because there were no other drivers to compare. In 
>>>>>> other
>>>>>> words, for a first driver it is pretty logical to have everything
>>>>>> handled on its own. As soon as we start getting other 
>>>>>> implementations of
>>>>>> a feature, it becomes logical to think if the code can be 
>>>>>> generalized.
>>>>>> This is what we see we with the HDCP series or with the code being 
>>>>>> moved
>>>>>> to DP helpers.
>>>>>>
>>>>>
>>>>> We were not the second, MSM was/is the third to add support for DSC 
>>>>> afer
>>>>> i915 and AMD. Thats what made me think why whoever was the second 
>>>>> didnt
>>>>> end up generalizing. Was it just missed out or was it intentionally 
>>>>> left
>>>>> in the vendor driver.
>>>>
>>>> I didn't count AMD here, since it calculates some of the params rather
>>>> than using the fixed ones from the model.
>>>>
>>>>>
>>>>>>>
>>>>>>> Moving this to the drm_dsc_helper is generalizing the tables and not
>>>>>>> giving room for the vendors to customize even if they want to (which
>>>>>>> the spec does allow).
>>>>>>
>>>>>> That depends on the API you select. For example, in
>>>>>> intel_dsc_compute_params() I see customization being applied to
>>>>>> rc_buf_thresh in 6bpp case. I'd leave that to the i915 driver.
>>>>>>
>>>>>
>>>>> Thanks for going through the i915 to figure out that the 6bpp is 
>>>>> handled
>>>>> in a customized way. So what you are saying is let the helper first 
>>>>> fill
>>>>> up the recommended values of the spec, whatever is changed from 
>>>>> that let
>>>>> the vendor driver override that.
>>>>>
>>>>> Thats where the case-by-case handling comes.
>>>>>
>>>>> Why not we do this way? Like you mentioned lets move these tables 
>>>>> to the
>>>>> drm_dsc_helper and let MSM driver first use those.
>>>>>
>>>>> Then in a separate patchset if i915 and AMD would like to move to 
>>>>> that,
>>>>> let them handle it for their respective drivers instead of MSM going
>>>>> through whats customized for each calculation and doing it.
>>>>>
>>>>> I am hesitant to take up that effort.
>>>>
>>>> Writing a tool to convert model's rc_Nbpc_Mbpp_foo.cfg into C
>>>> languages structures used by Intel code took 15-20 minutes. Plugging
>>>> generated structures took another 5 minutes. I will send the patches
>>>> later today or tomorrow, as I find a time slot to clean them. Thank
>>>> you for spending more time on arguing than it took me to generate &
>>>> verify the data.
>>>>
>>>
>>> Great, we will wait for your patches. We didnt intend to spend time 
>>> on this at this point. We always wanted to take it up in a separate 
>>> series of moving the tables.
>>
>> Getting rid of msm_display_dsc_config and then making use of 
>> drm_dsc_compute_rc_parameters() was bad enough. So, let's get things 
>> done in a good way now, rather than at some random point later.
>>
> 
> Alright, we will wait for your change then :)
> 
>>
>>>
>>> You preferred not to wait. Upto you.
>>>
>>> So thanks for doing it.
>>>
>>>>>
>>>>> If the recommended values work for the vendor, they can clean it up 
>>>>> and
>>>>> move to the drm_dsc_helper themselves and preserving their
>>>>> customizations rather than one vendor doing it for all of them.
>>>>>
>>>>>> In case the driver needs to perform customization of the params, 
>>>>>> nothing
>>>>>> stops it drop applying after filling all the RC params in the
>>>>>> drm_dsc_config struct via the generic helper.
>>>>>>
>>>>>>
>>>>>>> So if this has any merit and if you or Marijn would like to take it
>>>>>>> up, go for it. We would do the same thing as either of you would 
>>>>>>> have
>>>>>>> to in terms of figuring out the difference between msm and the 
>>>>>>> i915 code.
>>>>>>>
>>>>>>> This is not a generic API we are trying to put in a helper, these 
>>>>>>> are
>>>>>>> hard-coded tables so there is a difference between looking at 
>>>>>>> these Vs
>>>>>>> looking at some common code which can move to the core.
>>>>>>>
>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> Also, i think its too risky to change other drivers to use
>>>>>>>>>>> whatever math
>>>>>>>>>>> we put in the drm_dsc_helper to compute thr RC params because
>>>>>>>>>>> their code
>>>>>>>>>>> might be computing and using this tables differently.
>>>>>>>>>>>
>>>>>>>>>>> Its too much ownership for MSM developers to move this to
>>>>>>>>>>> drm_dsc_helper
>>>>>>>>>>> and own that as it might cause breakage of basic DSC even if 
>>>>>>>>>>> some
>>>>>>>>>>> values
>>>>>>>>>>> are repeated.
>>>>>>>>>>
>>>>>>>>>> It's time to stop thinking about ownership and start thinking 
>>>>>>>>>> about
>>>>>>>>>> shared code. We already have two instances of DSC tables. I don't
>>>>>>>>>> think having a third instance, which is a subset of an existing
>>>>>>>>>> dataset, would be beneficial to anybody.
>>>>>>>>>> AMD has complicated code which supports half-bit bpp and 
>>>>>>>>>> calculates
>>>>>>>>>> some of the parameters. But sharing data with the i915 driver is
>>>>>>>>>> straightforward.
>>>>>>>>>>
>>>>>>>>>
>>>>>>>>> Sorry, but I would like to get an ack from i915 folks if this 
>>>>>>>>> is going
>>>>>>>>> to be useful to them if we move this to helper because we have to
>>>>>>>>> look at every table. Not just one.
>>>>>>>>
>>>>>>>> Added i915 maintainers to the CC list for them to be able to 
>>>>>>>> answer.
>>>>>>>>
>>>>>>>
>>>>>>> Thanks, lets wait to hear from them about where finally these tables
>>>>>>> should go but thats can be taken up as a separate effort too.
>>>>>>>
>>>>>>>>>
>>>>>>>>> Also, this is just 1.1, we will add more tables for 1.2. So we 
>>>>>>>>> will
>>>>>>>>> have to end up changing both 1.1 and 1.2 tables as they are
>>>>>>>>> different for QC.
>>>>>>>>
>>>>>>>> I haven't heard back from Kuogee about the possible causes of using
>>>>>>>> rc/qp values from 1.2 even for 1.1 panels. Maybe you can comment on
>>>>>>>> that? In other words, can we always stick to the values from 1.2
>>>>>>>> standard? What will be the drawback?
>>>>>>>>
>>>>>>>> Otherwise, we'd have to have two different sets of values, like you
>>>>>>>> do in your vendor driver.
>>>>>>>>
>>>>>>>
>>>>>>> I have responded to this in the other email.
>>>>>>>
>>>>>>> All this being said, even if the rc tables move the drm_dsc_helper
>>>>>>> either now or later on, we will still need MSM specific calculations
>>>>>>> for many of the other encoder parameters (which are again either
>>>>>>> hard-coded or calculated). Please refer to the
>>>>>>> sde_dsc_populate_dsc_config() downstream. And yes, you will not find
>>>>>>> those in the DP spec directly.
>>>>>>>
>>>>>>> So we will still need a dsc helper for MSM calculations to be common
>>>>>>> for DSI / DP irrespective of where the tables go.
>>>>>>>
>>>>>>> So, lets finalize that first.
>>>>>>
>>>>>> I went on and trimmed sde_dsc_populate_dsc_config() to remove
>>>>>> duplication with the drm_dsc_compute_rc_parameters() (which we 
>>>>>> already
>>>>>> use for the MSM DSI DSC).
>>>>>>
>>>>>> Not much is left:
>>>>>>
>>>>>> dsc->first_line_bpg_offset set via the switch
>>>>>>
>>>>>> dsc->line_buf_depth = bpc + 1;
>>>>>> dsc->mux_word_size = bpc > 10 ? DSC_MUX_WORD_SIZE_12_BPC:
>>>>>>            DSC_MUX_WORD_SIZE_8_10_BPC;
>>>>>>
>>>>>> if ((dsc->dsc_version_minor == 0x2) && (dsc->native_420))
>>>>>>        dsc->nsl_bpg_offset = (2048 *
>>>>>>                 (DIV_ROUND_UP(dsc->second_line_bpg_offset,
>>>>>>                                    (dsc->slice_height - 1))));
>>>>>>
>>>>>> dsc->initial_scale_value = 8 * dsc->rc_model_size /
>>>>>>                            (dsc->rc_model_size - 
>>>>>> dsc->initial_offset);
>>>>>>
>>>>>>
>>>>>> mux_word_size comes from the standard (must)
>>>>>> initial_scale_value calculation is recommended, but not required
>>>>>> nsl_bpg_offset follows the standard (must), also see below (*).
>>>>>>
>>>>>> first_line_bpg_offset calculation differs between three drivers. The
>>>>>> standard also provides a recommended formulas. I think we can 
>>>>>> leave it
>>>>>> as is for now.
>>>>>>
>>>>>> I think, that mux_word_size and nsl_bpg_offset calculation should be
>>>>>> moved to drm_dsc_compute_rc_parameters(), while leaving
>>>>>> initial_scale_value in place (in the driver code).
>>>>>>
>>>>>> * I think nsl_bpg_offset is slightly incorrectly calculated. Standard
>>>>>> demands that it is set to 'second_line_bpg_offset / (slice_height 
>>>>>> - 1),
>>>>>> rounded up to 16 fraction bits', while SDE driver code sets it to the
>>>>>> value rounded up to the next integer (having 16 fraction bits
>>>>>> representation).
>>>>>>
>>>>>> In my opinion correct calculation should be:
>>>>>> dsc->nsl_bpg_offset = DIV_ROUND_UP(2048 * 
>>>>>> dsc->second_line_bpg_offset,
>>>>>>                                    (dsc->slice_height - 1));
>>>>>>
>>>>>> Could you please check, which one is correct according to the 
>>>>>> standard?
>>>>>>
>>>>>>
>>>>>
>>>>> Sure, i will check about nsl_bpg_offset. But sorry if I was not more
>>>>> clear about this but sde_dsc_populate_dsc_config() is only one example
>>>>> which from your analysis can be moved to the drm_dsc_helper() but not
>>>>> the initial line calculation _dce_dsc_initial_line_calc(),
>>>>> _dce_dsc_ich_reset_override_needed() , _dce_dsc_setup_helper().
>>>>
>>>> The initial_line is already calculated in dpu_encoder.c. As for the
>>>> _dce_dsc_ich_reset_override_needed(), I don't think we support partial
>>>> updates in the upstream driver.
>>>>
>>>>>
>>>>> All of these are again common between DSI and DP.
>>>>>
>>>>> So in addition to thinking about what can be moved to the 
>>>>> drm_dsc_helper
>>>>> also think about what is specific to MSM but common to DSI and DP 
>>>>> modules.
>>>>>
>>>>> That was the bigger picture I was trying to convey.
>>>>
>>>
>>> _dce_dsc_initial_line_calc which will get expanded with v1.2 gets 
>>> added has much more than whats there in upstream today.
>>>
>>> Dumping everything in dpu_encoder is not the solution. Sorry.
>>
>> But it is still the DPU thing. So, no problems.
>>
> 
> I am not fully convinced. We will wait for your post, then see how the 
> code looks.

Hi Dmitry and Abhinav,

Just wanted to follow up on this thread. I've gone over the MSM-specific 
DSC params for DP and DSI and have found a few shared calculations and 
variables between both DSI and DP paths:

- (as mentioned earlier in the thread) almost all the calculations in 
dpu_dsc_populate_dsc_config() match dsi_populate_dsc_params() [1]. The 
only difference in the math I'm seeing is initial_scale_value.

- dsc_extra_pclk_cycle_cnt and dce_bytes_per_line, which were introduced 
in Kuogee's v1 DSC series [2], are used for DSI, DP, and the DPU timing 
engine. dsc_extra_pclk_cycle_cnt is calculated based on pclk_per_line 
(which is calculated differently between DP and DSI), but 
dce_bytes_per_line is calculated the same way between DP and DSI.

To avoid having to duplicate math in 2 different places, I think it 
would help to have these calculations in some msm_dsc_helper.c file. Any 
thoughts on this?

Thanks,

Jessica Zhang

[1] 
https://elixir.bootlin.com/linux/v6.3-rc2/source/drivers/gpu/drm/msm/dsi/dsi_host.c#L1756

[2] https://patchwork.freedesktop.org/patch/519845/?series=113240&rev=1

> 
>>>
>>>>
>>>>
>>
