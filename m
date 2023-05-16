Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E506670428E
	for <lists+dri-devel@lfdr.de>; Tue, 16 May 2023 02:59:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97D1E10E2CC;
	Tue, 16 May 2023 00:59:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3445D10E2CA;
 Tue, 16 May 2023 00:59:22 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34G0aPjO019216; Tue, 16 May 2023 00:59:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=eAQ/krHoFu/KSmfIW+kx+5TbE3KOhNPbqAsJffQQ+C8=;
 b=a7qqONCRQqPy6Omd70/SZtS0q406mx9YMZFo8mo6r0oZuRgxLyB9jY++kAtHqe2tHInR
 w3Pu3yzeZFOlLEGPNDp75JPazKY9khAe4gJd3ofBBkzSw2Gsif5KcPtNfW5NtoF1vsZ/
 8VCtA3goqP+PtOVkdn/dhTXzmx5R5gn29LGPA5EAreGcjjIYK86pNYlxTvgXzGdjdTL2
 i5lA6zVq444HsSRE4EXdGkcPvoOMp2raF4AEHo+dhcvqZUjJkRK1/7xKPN0vUFhCz0nY
 laqLRz8/0LmLqzQaU885XhiaemKZjC6B2i/Sq3V+7bBfUsYn+OhiX5yGGdczWicodu0w 1w== 
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qkjr01xcw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 May 2023 00:59:18 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34G0xFaI031291
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 May 2023 00:59:15 GMT
Received: from [10.71.110.193] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Mon, 15 May
 2023 17:59:14 -0700
Message-ID: <24768d2a-73b6-8751-d4ce-dda48533d917@quicinc.com>
Date: Mon, 15 May 2023 17:59:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v10 4/8] drm/msm: Add MSM-specific DSC helper methods
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>
References: <20230329-rfc-msm-dsc-helper-v10-0-4cb21168c227@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v10-4-4cb21168c227@quicinc.com>
 <kx3be4c2okye2ts4rzy4j4ltnveixf7v4rxp5v4tl2irvevg6t@c5tuelunmn4c>
 <0e8a8af5-5ab8-c1b9-e08d-909072cc9b76@quicinc.com>
 <4cbqbu47vcshskl4npyzos5r7gxipjbbzyfvdfx7fenfh4mzmx@jj6lrysp35du>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <4cbqbu47vcshskl4npyzos5r7gxipjbbzyfvdfx7fenfh4mzmx@jj6lrysp35du>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: O-LSznvo6E_mVn7iTYpr9LofWhCP0DEr
X-Proofpoint-GUID: O-LSznvo6E_mVn7iTYpr9LofWhCP0DEr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-15_21,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015
 spamscore=0 malwarescore=0 phishscore=0 suspectscore=0 mlxscore=0
 priorityscore=1501 mlxlogscore=999 adultscore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305160006
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
Cc: Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/15/2023 3:01 PM, Marijn Suijten wrote:
> On 2023-05-15 13:29:21, Jessica Zhang wrote:
> <snip>
>>> Const, as requested elsewhere.  But this function is not used anywhere
>>> in any of the series (because we replaced the usages with more sensible
>>> member accesses like slice_chunk_size).
>>
>> Acked.
>>
>> I would prefer to keep this helper so that we have a way to easily get
>> BPP information from the DRM DSC config in the future, but if you'd
>> prefer we add this helper then, I'm also ok with that.
> 
> The inverse helper is available ad DSC_BPP in drm_dsc_helper.c.  Perhaps
> we can move the two variants to the header and define them uniformly?
> This isn't MSM-specific it seems (i.e. the format supports fractional
> bpp but no RC parameters appear to be defined for such a format yet).
> 
> <snip>
>>>> + * @dsc: Pointer to drm dsc config struct
>>>> + * Returns: Integer value representing pclk per interface
>>>> + *
>>>> + * Note: This value will then be passed along to DSI and DP for some more
>>>> + * calculations. This is because DSI and DP divide the pclk_per_intf value
>>>> + * by different values depending on if widebus is enabled.
>>>
>>> Can you elaborate what this "note" is trying to tell users of this
>>> function?  That they should not use bytes_per_line raw?  That it doesn't
>>> actually represent bytes_per_line if the extra calculations mentioned
>>> here are not applied?
>>
>> The latter -- this method is used for calculating the pclk for DSI and
>> DP. While it does get the raw bytes_per_line, there are some extra
>> calculations needed before it can be set as the pclk_rate. These "extra
>> calculations" are different between DP and DSI.
>>
>> For more context, please refer to the earlier revisions of this patch
>> and the usage of the helper in dsi_host.c
> 
> Note that I'm not just asking to explain it to me, but to explain it in
> the documentation.  The function is named bytes_per_line() but then
> Returns: says it returns the pclk per interface, then the note says that
> it actually doesn't unless extra calculations are applied.
> 
> We can explain the same much more concisely by rewriting Returns and
> dropping Note:
> 
>      Returns: Integer value representing bytes per line.  DSI and DP need
>      to perform further processing/calculations to turn this into
>      pclk_per_intf, such as dividing by different values depending on
>      if widebus is enabled.
> 
> And so we have written the same, just more concisely.  Feel free to
> reword it slightly, such as dropping the word "processing".

Sure, sounds good.

> 
> <snip>
>>> Not sure that this helper is useful though: it is
>>> only used where msm_dsc_get_slice_per_intf() was already called, so it
>>> makes more sense to the reader to just multiply slice_per_intf by
>>> slice_chunk_size than to defer to an opaque helper.
>>
>> I would prefer to keep this as a helper as this math is common between
>> DP and DSI, and I believe the name of the helper accurately reflects
>> what is being calculated.
>>
>> If there's any confusion with the name of the method, I am open to
>> suggestions.
> 
> The name is good, I'm just not too keen on it hiding the multiplication
> with msm_dsc_get_slice_per_intf() which is already also computed and
> available in DSI, and I assume DP too?

Got it, I see why you want to make that change now. DP only uses 
get_slice_per_intf() to get eol_byte_num similarly to DSI, so I can just 
do that then.

Thanks,

Jessica Zhang

> 
> - Marijn
