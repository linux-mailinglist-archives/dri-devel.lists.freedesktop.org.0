Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B186F67F28D
	for <lists+dri-devel@lfdr.de>; Sat, 28 Jan 2023 00:59:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B134410E088;
	Fri, 27 Jan 2023 23:59:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2D6D10E088;
 Fri, 27 Jan 2023 23:59:25 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30RNoIUQ011730; Fri, 27 Jan 2023 23:59:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=iugnl0X2DekgoR/WjQURot7Qc6whOv7xx/XB5PpW6iA=;
 b=g81pNbYdVCg4RodxyN3iQMAk9PyrJ1/T5nk1G4VVKESNJVzErKTseQ3CiHxNFvavU8T6
 HG1yKxUMhokEmTNJwyfhrsv4W8ajLNnrrC3QRZnvAoCQ2KBHvFgvF905eszUUvCJHByZ
 137MqqEuB0h8Hsh0HzgpSCusvWaAOTq1zAwU5/FaftLUr63g5DPMKY+YjS10ScPjSTaR
 dqE/R44ZJro2/fcZLguM+SGiKJsNNWmqkAJ/bofvWW5RYue/IwhwAJnI7aOujg8nlAxJ
 I/KlIYDZ402oN+19VkHLayckQThcG330siQK6fZ8bgHK+4UBKfFLunTzuQHVuwz06Moc aQ== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nc95jsmj0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Jan 2023 23:59:19 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30RNxIG9001250
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Jan 2023 23:59:18 GMT
Received: from [10.110.19.240] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Fri, 27 Jan
 2023 15:59:18 -0800
Message-ID: <e03f4fdc-75c1-dbc3-fb1a-05fc9e32d5cc@quicinc.com>
Date: Fri, 27 Jan 2023 15:59:17 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v2 05/27] drm/msm/dpu: drop EAGAIN check from
 dpu_format_populate_layout
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20221229191856.3508092-1-dmitry.baryshkov@linaro.org>
 <20221229191856.3508092-6-dmitry.baryshkov@linaro.org>
 <aaeb287f-de41-3f63-fd93-b08532964d59@quicinc.com>
 <CAA8EJprHMyPDmHhqZF-AZpqiLNkK7QuoQz-sZu6kSabZ7y76Dw@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJprHMyPDmHhqZF-AZpqiLNkK7QuoQz-sZu6kSabZ7y76Dw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: WawpkbrSZBp85MWdXHh3HQaDKspEnLRd
X-Proofpoint-ORIG-GUID: WawpkbrSZBp85MWdXHh3HQaDKspEnLRd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-27_14,2023-01-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301270220
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
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 1/26/2023 10:05 PM, Dmitry Baryshkov wrote:
> On Fri, 27 Jan 2023 at 02:52, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>>
>>
>> On 12/29/2022 11:18 AM, Dmitry Baryshkov wrote:
>>> The pipe's layout is not cached, corresponding data structure is zeroed
>>> out each time in the dpu_plane_sspp_atomic_update(), right before the
>>> call to _dpu_plane_set_scanout() -> dpu_format_populate_layout().
>>>
>>> Drop plane_addr comparison against previous layout and corresponding
>>> EAGAIN handling.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>
>> The change itself LGTM, hence
>>
>> But, shouldnt we add this EAGAIN validation or in other words fix this
>> rather than drop this?
> 
> What for? Does it really save us anything? What's the price of
> re-programming the SSPP_SRC0_ADDR registers?
> 
There are 4 Src registers being programmed per sspp.

With number of layers going up this will be 4x.

So lets say there are 5 layers and only one of their address has 
changed, we need to reprogram only 4 regs but now will reprogram 20.

Thats why i thought this is a good optimization.

But still, that is a separate change so I am fine if this goes in first 
as its just removing dead code anyway.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

>>
>> Like I wrote in the review last time, this makes sure to fail the commit
>> if the same addr is being programmed.
> 
> First, there is nothing wrong with committing the same source addr.
> For example setting the atomic property incurs an internal
> drm_atomic_commit() with no change to addresses at all.
> And then, this doesn't make atomic_commit fail. Instead it just
> shortcuts a call to SSPP->setup_sourceaddress.
> 

Ack, yes it wont fail the commit but will skip programming the new address.

>>
>>> ---
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c | 10 +---------
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   |  4 +---
>>>    2 files changed, 2 insertions(+), 12 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
>>> index d95540309d4d..ec1001e10f4f 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
>>> @@ -918,8 +918,7 @@ int dpu_format_populate_layout(
>>>                struct drm_framebuffer *fb,
>>>                struct dpu_hw_fmt_layout *layout)
>>>    {
>>> -     uint32_t plane_addr[DPU_MAX_PLANES];
>>> -     int i, ret;
>>> +     int ret;
>>>
>>>        if (!fb || !layout) {
>>>                DRM_ERROR("invalid arguments\n");
>>> @@ -940,9 +939,6 @@ int dpu_format_populate_layout(
>>>        if (ret)
>>>                return ret;
>>>
>>> -     for (i = 0; i < DPU_MAX_PLANES; ++i)
>>> -             plane_addr[i] = layout->plane_addr[i];
>>> -
>>>        /* Populate the addresses given the fb */
>>>        if (DPU_FORMAT_IS_UBWC(layout->format) ||
>>>                        DPU_FORMAT_IS_TILE(layout->format))
>>> @@ -950,10 +946,6 @@ int dpu_format_populate_layout(
>>>        else
>>>                ret = _dpu_format_populate_addrs_linear(aspace, fb, layout);
>>>
>>> -     /* check if anything changed */
>>> -     if (!ret && !memcmp(plane_addr, layout->plane_addr, sizeof(plane_addr)))
>>> -             ret = -EAGAIN;
>>> -
>>>        return ret;
>>>    }
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>>> index cdde7b9ec882..43fb8e00ada6 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>>> @@ -476,9 +476,7 @@ static void _dpu_plane_set_scanout(struct drm_plane *plane,
>>>        int ret;
>>>
>>>        ret = dpu_format_populate_layout(aspace, fb, &pipe_cfg->layout);
>>> -     if (ret == -EAGAIN)
>>> -             DPU_DEBUG_PLANE(pdpu, "not updating same src addrs\n");
>>> -     else if (ret)
>>> +     if (ret)
>>>                DPU_ERROR_PLANE(pdpu, "failed to get format layout, %d\n", ret);
>>>        else if (pdpu->pipe_hw->ops.setup_sourceaddress) {
>>>                trace_dpu_plane_set_scanout(pdpu->pipe_hw->idx,
> 
> 
> 
