Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 228058AB8B3
	for <lists+dri-devel@lfdr.de>; Sat, 20 Apr 2024 04:32:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22E4410E094;
	Sat, 20 Apr 2024 02:32:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="QdSXNpfg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9753C10E094;
 Sat, 20 Apr 2024 02:32:44 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43K2RA82003567;
 Sat, 20 Apr 2024 02:32:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=l7y4c0wkCTVkz5tMFpBQmjxqwlEsHsyE/IjgrIFtLOE=; b=Qd
 SXNpfgjmBfWQKlcXAQNw3EUxcGar4i++uYydwNjQ3Pih22k7KlH2dxfoIrpCnTZb
 xwswr74ZtM7CWM7f6k8di5KTOUa2KSB48Zl32jz/qzM0TNycAnNOfG9m2eJTyRXu
 5V0lz6J6pXCRtXB+12L8Zk7Sg9SEubFZAMU5AQ4cOnv4KGWIxAP/PzqPkwPJFTym
 Vx+ILvZ7hC1Fok9fkU2yGOl1chUHKmE1PuF1f+qIbUZ4NOc8jqUkiE7ycZsUqS/d
 NCByYrY1Jo3YmBno249ZfRX+eDB/XWTICqDqlR1VkGn9NuAVWPuny+ZJF+gx3oQY
 4LsB3iIVzdDWsgLEOmNA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xm4qd80w6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 20 Apr 2024 02:32:38 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43K2Wb4N004922
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 20 Apr 2024 02:32:37 GMT
Received: from [10.110.104.191] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 19 Apr
 2024 19:32:36 -0700
Message-ID: <c3021397-5d2e-c331-663f-eb3803cfc0e0@quicinc.com>
Date: Fri, 19 Apr 2024 19:32:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/9] drm/msm/dpu: drop dpu_format_check_modified_format
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn
 Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Abel Vesa <abel.vesa@linaro.org>, Johan Hovold <johan+linaro@kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>
References: <20240319-dpu-mode-config-width-v1-0-d0fe6bf81bf1@linaro.org>
 <20240319-dpu-mode-config-width-v1-1-d0fe6bf81bf1@linaro.org>
 <9c2f5f63-291c-c2b5-41a1-d2004055cf7a@quicinc.com>
 <ccgx5mjsxf2asvadithitzl7shkboj6ipcg6onfawa5pskchgd@etighi5usone>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <ccgx5mjsxf2asvadithitzl7shkboj6ipcg6onfawa5pskchgd@etighi5usone>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: qxEj847B586IqRPISCriFjeTieXptOyl
X-Proofpoint-ORIG-GUID: qxEj847B586IqRPISCriFjeTieXptOyl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-19_17,2024-04-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 spamscore=0 impostorscore=0 lowpriorityscore=0 mlxscore=0 adultscore=0
 mlxlogscore=999 bulkscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404200004
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 4/19/2024 6:26 PM, Dmitry Baryshkov wrote:
> On Fri, Apr 19, 2024 at 04:43:20PM -0700, Abhinav Kumar wrote:
>>
>>
>> On 3/19/2024 6:21 AM, Dmitry Baryshkov wrote:
>>> The msm_kms_funcs::check_modified_format() callback is not used by the
>>> driver. Drop it completely.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c | 45 -----------------------------
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h | 15 ----------
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     |  1 -
>>>    drivers/gpu/drm/msm/msm_kms.h               |  5 ----
>>>    4 files changed, 66 deletions(-)
>>>
>>
>> I think in this case, I am leaning towards completing the implementation
>> rather than dropping it as usual.
>>
>> It seems its easier to just add the support to call this like the attached
>> patch?
> 
> Please don't attach patches to the email. It makes it impossible to
> respond to them.
> 

I attached it because it was too much to paste over here.

Please review msm_framebuffer_init() in the downstream sources.

The only missing piece I can see is the handling of 
DRM_MODE_FB_MODIFIERS flags.

I am unable to trace back why this support was not present.

> Anyway, what are we missing with the current codebase? Why wasn't the
> callback / function used in the first place?
> 
>>
>> WDYT?
>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
>>> index e366ab134249..ff0df478c958 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
>>> @@ -960,51 +960,6 @@ int dpu_format_populate_layout(
>>>    	return ret;
>>>    }
>>> -int dpu_format_check_modified_format(
>>> -		const struct msm_kms *kms,
>>> -		const struct msm_format *msm_fmt,
>>> -		const struct drm_mode_fb_cmd2 *cmd,
>>> -		struct drm_gem_object **bos)
>>> -{
>>> -	const struct drm_format_info *info;
>>> -	const struct dpu_format *fmt;
>>> -	struct dpu_hw_fmt_layout layout;
>>> -	uint32_t bos_total_size = 0;
>>> -	int ret, i;
>>> -
>>> -	if (!msm_fmt || !cmd || !bos) {
>>> -		DRM_ERROR("invalid arguments\n");
>>> -		return -EINVAL;
>>> -	}
>>> -
>>> -	fmt = to_dpu_format(msm_fmt);
>>> -	info = drm_format_info(fmt->base.pixel_format);
>>> -	if (!info)
>>> -		return -EINVAL;
>>> -
>>> -	ret = dpu_format_get_plane_sizes(fmt, cmd->width, cmd->height,
>>> -			&layout, cmd->pitches);
>>> -	if (ret)
>>> -		return ret;
>>> -
>>> -	for (i = 0; i < info->num_planes; i++) {
>>> -		if (!bos[i]) {
>>> -			DRM_ERROR("invalid handle for plane %d\n", i);
>>> -			return -EINVAL;
>>> -		}
>>> -		if ((i == 0) || (bos[i] != bos[0]))
>>> -			bos_total_size += bos[i]->size;
>>> -	}
>>> -
>>> -	if (bos_total_size < layout.total_size) {
>>> -		DRM_ERROR("buffers total size too small %u expected %u\n",
>>> -				bos_total_size, layout.total_size);
>>> -		return -EINVAL;
>>> -	}
>>> -
>>> -	return 0;
>>> -}
>>> -
>>>    const struct dpu_format *dpu_get_dpu_format_ext(
>>>    		const uint32_t format,
>>>    		const uint64_t modifier)
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h
>>> index 84b8b3289f18..9442445f1a86 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h
>>> @@ -54,21 +54,6 @@ const struct msm_format *dpu_get_msm_format(
>>>    		const uint32_t format,
>>>    		const uint64_t modifiers);
>>> -/**
>>> - * dpu_format_check_modified_format - validate format and buffers for
>>> - *                   dpu non-standard, i.e. modified format
>>> - * @kms:             kms driver
>>> - * @msm_fmt:         pointer to the msm_fmt base pointer of an dpu_format
>>> - * @cmd:             fb_cmd2 structure user request
>>> - * @bos:             gem buffer object list
>>> - *
>>> - * Return: error code on failure, 0 on success
>>> - */
>>> -int dpu_format_check_modified_format(
>>> -		const struct msm_kms *kms,
>>> -		const struct msm_format *msm_fmt,
>>> -		const struct drm_mode_fb_cmd2 *cmd,
>>> -		struct drm_gem_object **bos);
>>>    /**
>>>     * dpu_format_populate_layout - populate the given format layout based on
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>> index a1f5d7c4ab91..7257ac4020d8 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>> @@ -969,7 +969,6 @@ static const struct msm_kms_funcs kms_funcs = {
>>>    	.complete_commit = dpu_kms_complete_commit,
>>>    	.enable_vblank   = dpu_kms_enable_vblank,
>>>    	.disable_vblank  = dpu_kms_disable_vblank,
>>> -	.check_modified_format = dpu_format_check_modified_format,
>>>    	.get_format      = dpu_get_msm_format,
>>>    	.destroy         = dpu_kms_destroy,
>>>    	.snapshot        = dpu_kms_mdp_snapshot,
>>> diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
>>> index 0641f6111b93..b794ed918b56 100644
>>> --- a/drivers/gpu/drm/msm/msm_kms.h
>>> +++ b/drivers/gpu/drm/msm/msm_kms.h
>>> @@ -96,11 +96,6 @@ struct msm_kms_funcs {
>>>    	const struct msm_format *(*get_format)(struct msm_kms *kms,
>>>    					const uint32_t format,
>>>    					const uint64_t modifiers);
>>> -	/* do format checking on format modified through fb_cmd2 modifiers */
>>> -	int (*check_modified_format)(const struct msm_kms *kms,
>>> -			const struct msm_format *msm_fmt,
>>> -			const struct drm_mode_fb_cmd2 *cmd,
>>> -			struct drm_gem_object **bos);
>>>    	/* misc: */
>>>    	long (*round_pixclk)(struct msm_kms *kms, unsigned long rate,
>>>
> 
