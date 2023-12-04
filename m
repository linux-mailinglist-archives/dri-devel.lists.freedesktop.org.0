Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C3D803BEB
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 18:45:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE04A10E05F;
	Mon,  4 Dec 2023 17:45:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1918810E05F;
 Mon,  4 Dec 2023 17:45:30 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3B4G0R29019293; Mon, 4 Dec 2023 17:45:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=VXEkGrebY6EpaoRxkLmNRIq8U7rbzpMW/SZKy6MWvnw=;
 b=aEoYVP5L4QFfqM7inlb02XdDHBsP+ORGDABZDtgJZSwf5A7Cn8J+C4b/4A1NzgcAyGax
 xe8RKr6j9FCSaVsGSM6sUB/h7Mx/OfhBGv/BGnb77OZE6IZi9uFm6buzawtQRGy38HTv
 w5w2uGY8pmLu4Ne7iDzszyUiuk55aEXRjQhqVu+Hu9QIj9/2isDn2gKVIY1V7zerIZf3
 UZtqnE0dijP0QFDkYpp5hRP2LhTyuggbfqSflJovy5mOa9YjwULq3ziq2DsODXkEeQgp
 he+BPCdonISPfVhlcBGDqmK/h52D8wS/DSmbKGU60MU1444mNChBdcjpTq5vvmpGMyfZ dg== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3usdf7h3wb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 Dec 2023 17:45:22 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B4HjKI2004582
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 4 Dec 2023 17:45:20 GMT
Received: from [10.110.73.134] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 4 Dec
 2023 09:45:20 -0800
Message-ID: <4a2d6fb2-e3b5-dd5d-7a66-d514e091eb41@quicinc.com>
Date: Mon, 4 Dec 2023 09:45:19 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [Freedreno] [PATCH] drm: improve the documentation of connector
 hpd ops
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>
References: <20230920201358.27597-1-quic_abhinavk@quicinc.com>
 <20231203142441.GA26644@pendragon.ideasonboard.com>
 <CAA8EJpoykwsMWX+msDAB3TZaBmwE4iA4fiDiA-iOELmWd50s-w@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJpoykwsMWX+msDAB3TZaBmwE4iA4fiDiA-iOELmWd50s-w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: EkHT7SJ4frOUXAXSx2l67_zfmBQsrdaS
X-Proofpoint-GUID: EkHT7SJ4frOUXAXSx2l67_zfmBQsrdaS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-04_17,2023-12-04_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 spamscore=0 clxscore=1011 adultscore=0 phishscore=0 malwarescore=0
 mlxscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2312040137
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
Cc: dri-devel@lists.freedesktop.org, andersson@kernel.org,
 linux-kernel@vger.kernel.org, quic_parellan@quicinc.com, Maxime
 Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 quic_jesszhan@quicinc.com, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12/3/2023 10:14 AM, Dmitry Baryshkov wrote:
> On Sun, 3 Dec 2023 at 16:24, Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
>>
>> Hi Abhinav,
>>
>> Thank you for the patch (and thank to Dmitry for pinging me on IRC, this
>> patch got burried in my inbox).
>>
>> On Wed, Sep 20, 2023 at 01:13:58PM -0700, Abhinav Kumar wrote:
>>> While making the changes in [1], it was noted that the documentation
>>> of the enable_hpd() and disable_hpd() does not make it clear that
>>> these ops should not try to do hpd state maintenance and should only
>>> attempt to enable/disable hpd related hardware for the connector.
>>
>> s/attempt to //
> 
> I can probably fix this while applying the patch.
> 

Thank you Laurent and Dmitry.

>>
>>>
>>> The state management of these calls to make sure these calls are
>>> balanced is handled by the DRM core and we should keep it that way
>>> to minimize the overhead in the drivers which implement these ops.
>>>
>>> [1]: https://patchwork.freedesktop.org/patch/558387/
>>>
>>
>> You could add a
>>
>> Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>
>>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>
>> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>
>>> ---
>>>   include/drm/drm_modeset_helper_vtables.h | 10 ++++++++++
>>>   1 file changed, 10 insertions(+)
>>>
>>> diff --git a/include/drm/drm_modeset_helper_vtables.h b/include/drm/drm_modeset_helper_vtables.h
>>> index e3c3ac615909..a33cf7488737 100644
>>> --- a/include/drm/drm_modeset_helper_vtables.h
>>> +++ b/include/drm/drm_modeset_helper_vtables.h
>>> @@ -1154,6 +1154,11 @@ struct drm_connector_helper_funcs {
>>>         * This operation is optional.
>>>         *
>>>         * This callback is used by the drm_kms_helper_poll_enable() helpers.
>>> +      *
>>> +      * This operation does not need to perform any hpd state tracking as
>>> +      * the DRM core handles that maintenance and ensures the calls to enable
>>> +      * and disable hpd are balanced.
>>> +      *
>>>         */
>>>        void (*enable_hpd)(struct drm_connector *connector);
>>>
>>> @@ -1165,6 +1170,11 @@ struct drm_connector_helper_funcs {
>>>         * This operation is optional.
>>>         *
>>>         * This callback is used by the drm_kms_helper_poll_disable() helpers.
>>> +      *
>>> +      * This operation does not need to perform any hpd state tracking as
>>> +      * the DRM core handles that maintenance and ensures the calls to enable
>>> +      * and disable hpd are balanced.
>>> +      *
>>>         */
>>>        void (*disable_hpd)(struct drm_connector *connector);
>>>   };
>>
>> --
>> Regards,
>>
>> Laurent Pinchart
> 
> 
> 
