Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C73B1AB934F
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 02:48:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A70410E98B;
	Fri, 16 May 2025 00:48:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="aoarfBbP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94DF310E986
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 00:48:13 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FEFB1p018190
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 00:48:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 eJwe0WaTATjPuDQBRpYRk46bCtNvD5nI4hYmgIuJ90M=; b=aoarfBbPpBtN8svj
 4epA/14KwUKec8F93WrbzmB9VNHXsMWyZyJYJvAmjmWE3C3cFDvoIxX130g9bC3K
 5hIgnTbhZns/4STZmAD7SGzUN0uYGUIuRu3vlL/CVK7Y7p9V7Op8a7xtBH67lWVf
 GvESWPew7YPB3PloZSVZ75GUIqxUEPtJz9O/Vza6n6QM4n5kvhD52o9jPAiACobW
 t2NAcmjCMT8TQOZnIh4sc3lfdmtDtT2WcLcCrsz9pHnjVRvHstHzNhD0g6nK/BAP
 07ELv9TW6ZGz03+tVwYEiiLPxAYGrzJudZYeMPUgJwnAXUoBCiQ69EOm0yO9WRel
 YgVZvw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcnr1tp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 00:48:12 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id
 41be03b00d2f7-b0f807421c9so879497a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 15 May 2025 17:48:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747356491; x=1747961291;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eJwe0WaTATjPuDQBRpYRk46bCtNvD5nI4hYmgIuJ90M=;
 b=obnDqR9wG3SPxkuPqI7gXOKunaxmaTfSW3JwHODFHcV6hZasYZioOlDzrLZb3GYlid
 ijr6PPh1Hy1ye3Pva4rxcWxa7MzZGiu7H662/5kURpSX4sMKOgzRon8Uj2w9erV5u1Wo
 u+U676H8MmW+DsCjq1F3yBwZGiaCRbeGo8X18Z83gNNTSRryVkt5X0pUcDVc4bHqV9UK
 WnuCIyJ4CIA3GZyh8tLyupg/MadmepVrzOOsPdoHe1HUsiA8ARlkhKpAkH/6m6NveuAx
 VCy5TSUmqmyQL0GUQI6G+YWYAskLd99B/MeWH4raHh6SXXKo7s3FbEnEKWvcOffPcDFp
 IMQQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXdK/FFO86uc8uYWC1aiWrUKqv2wF8KnXr8mkAO79OrqXCCZX7XVmwIGp0EBKwTlyHlc+SMmMvwHNA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw1tT0QWmLj/3U5AJO4oO1AWBqG4XDD53fmSeoDFnlRJJn7XyZp
 69Wj9l4ILXn5P7lw9wfy863Q6mR1BjGLLuWzcVYLBGaAvlcWHSVacBggyBTPgImSJ98LeNNjr36
 WzjcfaGC8v6Ge8XJWdX1XQcVRW5EiGEXHAVl6jPCcQ92gx54fWO3XBieKQx6xbP6QaJsVuhI=
X-Gm-Gg: ASbGncvvSchz0dS5FnJg7vGaSIzBUx7roDZTV14hyD0XIQf69KpfzfJfzeQ0NV2hLcA
 7/iyS0VWSVkQ2Olx1KLQlMIPX3mwORZPNxg46mmVNynZwEw36WR0QUDecEix4Flffq9E7tbVUyQ
 27dMMw6ktno1EXXxRFts/DD3C2O+myh6CtxMMAU/15FyR2wSFwn5EF/ntrQRuvujRmxtB28NHI0
 gzMykgi58pDpXIlOd2r21suBw8sziKpI7nvrDpjjoylJH8ahaSDxVM2T7NJJjqqcfnx7Z/QNVNN
 vkbblrwWg+rvJXPul3zWe4fOfdSbOyLIBQqvn6XlnoYnzxx+g1YLG5V9nZvkiuG8zR3m9w==
X-Received: by 2002:a05:6a20:9143:b0:1ee:c7c8:ca4 with SMTP id
 adf61e73a8af0-216219f8d84mr2191394637.36.1747356491306; 
 Thu, 15 May 2025 17:48:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IElOJZvNSsuOCJC5gbWoMAaCBBEQUY+Qd1QGBRr8weuXx6OAJxIlMvUCJtTtrI6xCzlhuO7Gg==
X-Received: by 2002:a05:6a20:9143:b0:1ee:c7c8:ca4 with SMTP id
 adf61e73a8af0-216219f8d84mr2191369637.36.1747356490958; 
 Thu, 15 May 2025 17:48:10 -0700 (PDT)
Received: from [10.134.71.99] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-742a9877056sm420384b3a.143.2025.05.15.17.48.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 May 2025 17:48:10 -0700 (PDT)
Message-ID: <65cb9653-e315-4b8c-ad21-14cabb7d2ac0@oss.qualcomm.com>
Date: Thu, 15 May 2025 17:48:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] drm/msm/dpu: Filter writeback modes using writeback
 maxlinewidth
To: Dmitry Baryshkov <lumag@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250514-max-mixer-width-v1-0-c8ba0d9bb858@oss.qualcomm.com>
 <20250514-max-mixer-width-v1-4-c8ba0d9bb858@oss.qualcomm.com>
 <CALT56yPxcsLhA2eigirjvNiWR5JBFW4jsOAi7QWkgmJgbMnKXw@mail.gmail.com>
Content-Language: en-US
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
In-Reply-To: <CALT56yPxcsLhA2eigirjvNiWR5JBFW4jsOAi7QWkgmJgbMnKXw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: KZjAjE2y1eDl6UJ5tCYzV5X7_NhLdJn6
X-Authority-Analysis: v=2.4 cv=aIbwqa9m c=1 sm=1 tr=0 ts=68268b4c cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=TtJqN5EYLmW1Dglx0zoA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: KZjAjE2y1eDl6UJ5tCYzV5X7_NhLdJn6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDAwNSBTYWx0ZWRfX66EuCvLDpg2s
 ySdsFp71Vuc+f3yCAchL0aF5yJ3Nyec/MgkJA7PJ/kh8jdwWJ55yPRU84ybzo/jUCA/Aa3+8vMh
 XcY/uvHHjvB+VCpeFd2MQ1Z4QguOAp7MA0+glXyzWQ2IVWXE4yMfLnHpVSzIABWEVquYYkUtezB
 /NlaJrYS7P4sn9v3QYblZUCnO+cZbPDNIhwoNQEDwc3AALC5LY/wrB5+OL1xr47BpNkgFWp0oIC
 QJq/NcyxKxnz5lCqPV4IpTjvZDqMLlAFrBFPcdEnW17ClO5DzpZJ4LTtWXg6dhCIhlmHTtzTRBm
 R6Txljn6KovNHK94/1tWhKl+dhOVSm2DZryFhD67RA08QmkLdYoJYuGmsp+TVkOqOtPzze6KNWx
 GKvZ5VetW0+1Bp9Ex/EoBSvmoAh58s2fggHaqsR2w+Ix+Gs10RdoK6eSbiMgklN/MTKsWL4H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_11,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999 malwarescore=0 bulkscore=0 impostorscore=0
 clxscore=1015 phishscore=0 suspectscore=0 mlxscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505160005
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



On 5/14/2025 5:17 PM, Dmitry Baryshkov wrote:
> On Thu, 15 May 2025 at 02:52, Jessica Zhang
> <jessica.zhang@oss.qualcomm.com> wrote:
>>
>> Since the max mixer width is not a strict hardware limit, use the actual
> 
> Is it? What is the actual max width that the mixer can support?

Hi Dmitry,

By hardware limit, I mean restrictions based on the size of buffers 
within the hardware block itself.

PINGPONG, DSC encoder, and WB blocks all have buffers, so they do have a 
max supported width based on the size of their hardware buffers. On the 
other hand, LM doesn't so it isn't necessarily restricted by a max width.

I can clarify this in the commit message and cover letter.

Thanks,

Jessica Zhang

> 
>> hardware limit (the writeback maxlinewidth) to filter modes.
>>
>> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c | 9 +--------
>>   1 file changed, 1 insertion(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
>> index 8ff496082902..0a198896f656 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
>> @@ -14,14 +14,7 @@ static int dpu_wb_conn_get_modes(struct drm_connector *connector)
>>          struct msm_drm_private *priv = dev->dev_private;
>>          struct dpu_kms *dpu_kms = to_dpu_kms(priv->kms);
>>
>> -       /*
>> -        * We should ideally be limiting the modes only to the maxlinewidth but
>> -        * on some chipsets this will allow even 4k modes to be added which will
>> -        * fail the per SSPP bandwidth checks. So, till we have dual-SSPP support
>> -        * and source split support added lets limit the modes based on max_mixer_width
>> -        * as 4K modes can then be supported.
>> -        */
>> -       return drm_add_modes_noedid(connector, dpu_kms->catalog->caps->max_mixer_width,
>> +       return drm_add_modes_noedid(connector, dpu_kms->catalog->wb->maxlinewidth,
>>                          dev->mode_config.max_height);
>>   }
>>
>>
>> --
>> 2.49.0
>>

