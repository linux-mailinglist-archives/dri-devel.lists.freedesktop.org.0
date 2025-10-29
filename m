Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F38D5C196CA
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 10:42:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5329210E752;
	Wed, 29 Oct 2025 09:42:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="QQuycoPs";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ei5WI6UG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E61A10E752
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 09:42:38 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59T4ux6x3676873
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 09:42:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 MmgRKySPBYPzkhHOeDW0BeEkxDUdUPpQf5CBxkBMstI=; b=QQuycoPs+C/VeFQM
 etXGcA454gTXTyTo+Z0pkOabIRfNOIDe5qcGphTys7OTdaXoZ6lCv6fhWR8TdhIp
 QKhZAvzohOpCHrveLE883tDiUVxPXIftlLBEIGuz18V9BjEzPu/SwVnZqfyr8HRL
 N2jAhAN8wCSosm1UvKGweyNQY8NIYfQ8sfFlrUAytVkQro0hWt3NfHiHvoCGGC0F
 CRylK4rV+9q5mXlHJScqWfiOThdJaDUiSZMUB6KdBWiuwcadmmQtadRwBBZX4Jmm
 R9mWcHxphDVBhc1fI3VSIMaaQUFmsDYKPbUyVMfLT9V3bs03igtoxmx3Q1ST37O9
 xkkFPA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a1j14s-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 09:42:37 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-88e965f2bbfso263580985a.2
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 02:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1761730957; x=1762335757;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MmgRKySPBYPzkhHOeDW0BeEkxDUdUPpQf5CBxkBMstI=;
 b=Ei5WI6UGxcM1H32alnZI0m6w02LT39h6DgzOL5vlg3JZ7RiPuG8xZ1sYThOvSz9/Jk
 ckV0YZDCB7N8eo8//JkstqOhCt6LVkwg/662MnQtx7/mVLChdL1sl+y1njwDt7lz/YzJ
 dpTVMbroSkUbxTwqgfKZ3O16vgcyRwyVH5TlTn7oQ9R1n46SqSaAXol/TCJsrJvD1W1U
 8F3lIhepwD6tcl6RRPT8t3Ulfid4SlD51uMggcFyE8UOtHFwmF9kmYt3OUOg/F5rW5Pc
 G1eMTh45Qpm6onFkcUhABboizxlEbV5UPvUzX5lkKQk9kS+qrQkKjFpGCnSu+S50Bia0
 vHlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761730957; x=1762335757;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MmgRKySPBYPzkhHOeDW0BeEkxDUdUPpQf5CBxkBMstI=;
 b=vDmOyI8AWasMTZgQwXTBLfv3dLHiDO4UlQNfUtCPbCj4oz8ytyuhmAXkfkzyblumfI
 wUNoWnbu8uuicMQMByz2AyLC+583uPq8nNSS0JwPa1ST53BdImgPwYU5/t0kmhw68TdJ
 2Ctgtyz9wqJY3SjmleUvVlZjjCjmzryMHFisJfV1/QOndiBi7fKd6V58ZigcjM52MCLW
 5mW6KNUAcPHaQtKx8g4k2OVTV0rcm19G76R//nzC/9dV3eXTCzj+vV6/HR+EQ0OXUm2k
 PiSpHBXjUxYpKIZUnQlCaDhwDwpOzbfFRH1qjJl+aafrajKZdjmriF0SVKpfjIVPQ54E
 o9AQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU0nfwm8XpWAV97pN7mkNEQRlGmfpkYLBd2LtJKnUTOB1RoF7E8UpmQc0LPP0DTZ0A/zMxEi+u0w94=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxndzDvLlTwzR5OEw8xKzgws4OKBDF2PnpOPp3XQBbtmK+ELaUv
 b2WEjDtEPHtRZ75oM4OhmnGHK70GuDSYn/amVfOM9wkxuq9PUAYS0oLY6+fHYUVxD9jaUqmpXVi
 eo12ktwboP3zCLhTmC7vqs7SUtVIFqr3wrFwsBOfGegoi/QeIvg0ld5d1NgazhqCemG9FqCo=
X-Gm-Gg: ASbGncsDAPqnEtvl5ApBT5piIsfDbXkFU0NZeB8LHFn2T/lodgBhhANwwwyZFa/yFpj
 1/yPo0TqedqSnybf0XmwxIgx3L/bjbkqD0iwcBufUXwGr6bN3NGNJW6H9rEhbZ9zQYlenv5NGI1
 kPzgtjXYuSGu3WU0ipwVJer9Dq85PilCHXqgPcjl1D8uSXIy9IoXxN8U+MN1aXp0KYrxBN9zNQP
 VgzMvCNCJLxpak3stgt1/GjibquVu7MeTirXIGIVwq0HYyf3ORrIj3ZQ8oc0SgebVayzOlC4c/k
 QCSgJ0x4dZ4S0lmw+oBD2+yh8gdlzqPzmcn6H5XIoiwoLnYbKZA1ZzJQocz6nf7UvCX/WhTVuTL
 H9iHTcfx0uKHT/k56X0HV95by/PkifMl7dtslKe7CiXhKbr7tRn/HkoNf
X-Received: by 2002:a05:620a:bce:b0:878:408d:c09a with SMTP id
 af79cd13be357-8a8e34d22c9mr206431885a.4.1761730956891; 
 Wed, 29 Oct 2025 02:42:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEyzw2uooaE3FP8gd0prarw9B+NMvunoxzP7rKqKh5OTI7VSeSeyuZJuSI/cuTYOFoNrAsYcA==
X-Received: by 2002:a05:620a:bce:b0:878:408d:c09a with SMTP id
 af79cd13be357-8a8e34d22c9mr206430585a.4.1761730956406; 
 Wed, 29 Oct 2025 02:42:36 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b6d8541e99fsm1389534266b.61.2025.10.29.02.42.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Oct 2025 02:42:35 -0700 (PDT)
Message-ID: <78679e08-2a38-477b-a080-be0442465fbe@oss.qualcomm.com>
Date: Wed, 29 Oct 2025 10:42:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/display/dp: Rename bit 4 of DPCD TEST_REQUEST to
 match DP2.1 spec
To: Khaled Almahallawy <khaled.almahallawy@intel.com>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Jani Nikula <jani.nikula@intel.com>, Rob Clark
 <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>
References: <20251028222817.3290035-1-khaled.almahallawy@intel.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251028222817.3290035-1-khaled.almahallawy@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Nu/cssdJ c=1 sm=1 tr=0 ts=6901e18d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=DweoPDKG-9ER2baVzYcA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: OX0Y1dApa12x5JrPIhkBzg3Ld1ffb8CX
X-Proofpoint-ORIG-GUID: OX0Y1dApa12x5JrPIhkBzg3Ld1ffb8CX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDA3MiBTYWx0ZWRfX7AluWssVlzo3
 TLuV8zaORZhpVqinGTkO+ziwSgUnrZO3TXTc0LdT2kjPjgfm1tE6L/zXbbJb4BYF7usHq5NkWvu
 mzOGExsbsOZRynHu5h1lzPOxmRkFMU1yZ984Yf46ci3jMy87vbFJVde7jnAnfzeGAhrAS7bLO0b
 odLXyZPROfa7aDegF4Hj+zq/lvJ3Am78Ee/F6JE5L4Qa/96WrfsF0aEJBOXg5CDgcrJqa6xZifm
 hI+A9jG6/J+rDckZ/W80gWQVcVjGQL3vTjJeA+5q3DSdpG/6b5wvLU/s9bp3BtoidK7kZdDPCFs
 X8l9/GCUTXW0yyFR56NWy19y1VQDAHV8imXEikjBA99Zl+kwqLMVr6CpCF6+XpV9jNdhJ93hotn
 V3zRej5dAeTVAy7fsSSY3DHRYLzC+A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-29_04,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290072
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

On 10/28/25 11:28 PM, Khaled Almahallawy wrote:
> The DP_TEST_LINK_FAUX_PATTERN field was deprecated in the DP 1.3 spec.
> Update its name to align with the DP 2.1 definition and reflect its
> actual use in the code. No functional changes.
> 
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Rob Clark <robin.clark@oss.qualcomm.com>
> Cc: Dmitry Baryshkov <lumag@kernel.org>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Sean Paul <sean@poorly.run>
> Signed-off-by: Khaled Almahallawy <khaled.almahallawy@intel.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_link.c | 2 +-
>  include/drm/display/drm_dp.h     | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_link.c b/drivers/gpu/drm/msm/dp/dp_link.c
> index 66e1bbd80db3..5d465cf4dbc2 100644
> --- a/drivers/gpu/drm/msm/dp/dp_link.c
> +++ b/drivers/gpu/drm/msm/dp/dp_link.c
> @@ -665,7 +665,7 @@ static int msm_dp_link_parse_request(struct msm_dp_link_private *link)
>  		return rlen;
>  	}
>  
> -	if (!data || (data == DP_TEST_LINK_FAUX_PATTERN)) {
> +	if (!data || (data == DP_TEST_PHY_TEST_CHANNEL_CODING_TYPE)) {
>  		drm_dbg_dp(link->drm_dev, "link 0x%x not supported\n", data);
>  		goto end;
>  	}
> diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
> index e4eebabab975..610b8cbf1125 100644
> --- a/include/drm/display/drm_dp.h
> +++ b/include/drm/display/drm_dp.h
> @@ -849,7 +849,7 @@
>  # define DP_TEST_LINK_VIDEO_PATTERN	    (1 << 1)
>  # define DP_TEST_LINK_EDID_READ		    (1 << 2)
>  # define DP_TEST_LINK_PHY_TEST_PATTERN	    (1 << 3) /* DPCD >= 1.1 */
> -# define DP_TEST_LINK_FAUX_PATTERN	    (1 << 4) /* DPCD >= 1.2 */
> +# define DP_TEST_PHY_TEST_CHANNEL_CODING_TYPE	    (1 << 4)

I think it'd be useful to keep a comment of what it was before the
deprecation and rename

Konrad
