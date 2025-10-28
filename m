Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35DE5C13080
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 06:55:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B829310E03A;
	Tue, 28 Oct 2025 05:55:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Od5+Q6EN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6F6D10E03A
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 05:55:05 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59RMY0pV2752236
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 05:55:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 hVbVyBqtSeMwHa5ZCMjstEwuUlHs1J5AbZsAqxmUJpM=; b=Od5+Q6EN/hVcROkv
 68QhvL9ePE1pHjnXWh+zV9xtdoG9kqSXFOH2ATTmCVE2mHk5ToP/thq7TldSQHJZ
 nx7RovXoZL7Qfmap5TTVF10lORG29RNRbed7jbaq0rS1RGQNNTVIBIJYHajuUB/m
 EituOtTvHoaWS42QNop+O8QvhZJ/P4ndH4vH2J1Bb/sj6Az8YsgUYTVMy+bpTeSD
 3OWQDjccQoBpbj9f6mWDLjk1Frh3ZBJ3LTpeavIplBzLLVXduP1GREB6lAtHfjL3
 mxiJ6s3qPTeTZfZuVkiEZl79DNr3bvmpGMGa39W4Bp5OtG/lBJj2E/fd+At76jaV
 bw7PcQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a28swjt7k-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 05:55:04 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-272b7bdf41fso66501135ad.0
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 22:55:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761630904; x=1762235704;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hVbVyBqtSeMwHa5ZCMjstEwuUlHs1J5AbZsAqxmUJpM=;
 b=vs+RK6oFLXg4A3AE96ecDU51l0/ruMCXsN1jZ9SOof2SPKSSIkhg9iQzRNsQwTuerf
 +XwCzKgi8V6WZ7HnZitrnxTckuCUvhdXgBm0hNHJnv/Dn/edeW+bkyDCjHZSRlOVBvpa
 SXx3Z0ugsTSxAk2i/lnaiVMOGrEazTNFaItkD5oLESvHERmLRXzWDa//a8wEx5zYGs4P
 vHjweQdlB2iZadVAAtLzukpazr9sf9+CbdxERlBCMwCV5Q4KGsmHCxXQUhR6Dnn/yz4f
 zhqC54s79w5mINAzNpjFhpqsgpGWZivS/Mj6zwYNvWlWvSR3iFcb9c7FnBcd692ZLqdj
 2PhQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVo8bY2TbAXW8aAXTeG84avshfi1GVKRLTOBQ2bOQhiBmm6Ep5uPQP221TlDluCg6YtqifE2CU9YHM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwuKgkexPPkqx4YRA2dP9J0TmOHe7h5ndadW9aiYPAm7bm40A6W
 T+JdSPYLE/I4bcoNBrescY+y5vx5elwFdYoXAwSoMJDnOeDnHXlFkyQX0uF+KHlRjTW6iiBoKXx
 8H/IxZnKVa08VukB4pq+fq2A/twqwkNWS8ohHVygQT+cC3tfGJCxn+pfAJUAxhFyJODYH/go=
X-Gm-Gg: ASbGncsdAetqyx8Qck0Nl4YcCxwEb9Qda1+JOnv9VZf/qrymBqn5MLEgUd6kLz3CB7E
 amVMuN1/3m0xi9TR1pjaTH+vnJaMhWuigYHQZsCbwRh1BmlLfArRdbggStpCUznj6ZwwvevXXGF
 K/0MuGrXdmXKgyBRMbaOPEM2YuayGcussw+vAnaIUh3zxw4a8vqEUYTs27dVuyEvXD0OalXmYSh
 QGM6ZPU6fXnehNt0JniD8SgKc3O6AlwMRZas3hRFRjfgCiuuyn5znTCVY+Z5L/3W1gutj8sfZOI
 cgdwOUSCc26G6jjkLXa2M1F2mVFhrhhf1MSB+CpsBTwAWb8Cbn271gd080Sul0O6Z2e2HV7Cev2
 iJSRCStbK0PsqwWWT9SmEn+Y7hTn6MHWSdjcgEzFfnj5lI5NG91yXCvRHpOJ+GHjmNu1j+w0=
X-Received: by 2002:a17:902:cec7:b0:290:9576:d6ef with SMTP id
 d9443c01a7336-294cb67481cmr35489535ad.54.1761630903948; 
 Mon, 27 Oct 2025 22:55:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFlNN7tbxAtF8QwpzLzr8V1BNKo9CW6ELJvgyAYmlxy+kOCt0Ww5BoZG9W1Wv8WH/BdO4oLiA==
X-Received: by 2002:a17:902:cec7:b0:290:9576:d6ef with SMTP id
 d9443c01a7336-294cb67481cmr35489155ad.54.1761630903456; 
 Mon, 27 Oct 2025 22:55:03 -0700 (PDT)
Received: from [10.133.33.222] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29498cf3405sm104695945ad.2.2025.10.27.22.54.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Oct 2025 22:55:03 -0700 (PDT)
Message-ID: <89ae527a-c4b4-4294-93ae-e9afffb11f7a@oss.qualcomm.com>
Date: Tue, 28 Oct 2025 13:54:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 3/5] dt-bindings: display/msm: Document MDSS on QCS8300
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250911-qcs8300_mdss-v12-0-5f7d076e2b81@oss.qualcomm.com>
 <20250911-qcs8300_mdss-v12-3-5f7d076e2b81@oss.qualcomm.com>
 <20250918-spectral-seahorse-of-witchcraft-69553c@kuoka>
 <b745c515-2264-42aa-8d92-663efc7f6276@oss.qualcomm.com>
 <6c195b42-d994-4d24-9c40-48d8069304e3@kernel.org>
 <rkuihu3pmhexeahfch6j7bvwn5rn4ecccbhamluh7fas5qgaup@av2foeiwmcz3>
 <8a6861a0-f546-475b-907c-65b691d1d340@kernel.org>
 <cwuecyparlinhtdqckff7vdqpkio2kk7dwemzfao6qkhnuzhul@mfyqdphfvbdg>
 <drmrkeukgua3w4p3jixdwq6dvj4xj36vvgk2kvwvhpqfk6le5g@tschh7rpsg4a>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <drmrkeukgua3w4p3jixdwq6dvj4xj36vvgk2kvwvhpqfk6le5g@tschh7rpsg4a>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: LJW3xSIC--UKd85RVlogKtHJSzsXoQ3_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDA0OSBTYWx0ZWRfX3p/EcJEO5nBg
 t1sEQagugWq7+d24H8AV1Qk4jZ/yooYByeVm0qE59YJgqIxZnGNxfFTADRhhcLdff1df87tUqq2
 bpqhyqqnJm5waWZLWIxcRHkJYDfoAo0YY5uMA1bQh+WEAs3vuTcsehzg7Yi0HG84AXSh0Zfeu7u
 fPHTyP8hneZBZRdpYASGCyCQ3T1ZlBxzrk4T98JPbcjklAvRfg0ZQX9fkk3Gtht7M3WkkIEvKJI
 cVf7jehNuh4CjRm6hWPDHVegjdIBR4S4msl9ih6PxkGhZDKt6QaiqYyCjqoCrXiqLkxaXbV7lFQ
 h/ce4by0T7v9ERGXU8+wuPYIoJ3XVYraENl74NGY+e3V+MfWoGkxbCuduw6ehhCqNDT5hkeW/GU
 PIg1TuUJF+OxnOlqjZkUlvheG5fUpw==
X-Proofpoint-GUID: LJW3xSIC--UKd85RVlogKtHJSzsXoQ3_
X-Authority-Analysis: v=2.4 cv=fL40HJae c=1 sm=1 tr=0 ts=69005ab8 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=rkEqYQ_PoaDmHDwLzVwA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_02,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 phishscore=0 suspectscore=0 priorityscore=1501
 clxscore=1015 adultscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510280049
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



On 10/27/2025 7:52 PM, Dmitry Baryshkov wrote:
> On Wed, Oct 08, 2025 at 10:40:39PM +0300, Dmitry Baryshkov wrote:
>> On Tue, Oct 07, 2025 at 03:43:56PM +0900, Krzysztof Kozlowski wrote:
>>> On 27/09/2025 08:26, Dmitry Baryshkov wrote:
>>>> On Fri, Sep 19, 2025 at 01:34:39PM +0900, Krzysztof Kozlowski wrote:
>>>>> On 18/09/2025 13:14, Yongxing Mou wrote:
>>>>>>
>>>> process in other patchsets and in my understanding on how to describe
>>>> the particular hardware block. The changes were reflected in the
>>>> changelog. If you plan to review this patchset once you get back from
>>>> your vacation, that's fine. If you don't plan to, I can ask Yongxing to
>>>> send v20 just for that number.
>>>
>>> Solution for me could be to ignore Qualcomm patches till they reach some
>>> sort of maturity.
>>>
>>> I am not planning to review this patch, because:
>>> 1. I already reviewed it, so not really necessary, but even if I wanted:
>>> 2. It is gone from my inbox...
>>
>> So... Should it be resent to get it back to your inbox or should
>> Yongxing just restore your tag on the grounds that the changes were not
>> significant enough to drop it?
> 
> Granted the lack of response, Yongxing, please send the new iteration of
> the patchset.
> 
Sure. Thanks for the reply. Should i add back the reviewed-by tag or 
just resend the this series?


