Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D266B048CF
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 22:47:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9453A10E35D;
	Mon, 14 Jul 2025 20:47:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="QCqaR3go";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F24010E35D
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 20:47:33 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56EHFT3g014407
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 20:47:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 +6szoN01qMvtkgP/ZIMTwafHhBz2p79aT5gKKnIkfmQ=; b=QCqaR3goC9uClZUN
 Sb5eRIzhmsupAAJFCFty6dx6hBZ4YqpIZfsEaFJqM8+0ry1182YC4irqZb6HZ508
 Vnqp+HnzmKE05YHDPb8HoJWs8yvBuEZJnG4II2mL47ZPUvwHutyWFXFZ+DXKWj5Q
 akZm25lAydQUDkMPyiyHPCvqwQIRCjSgGvBSYmkQNQLI56lIi+peZcDmYCslzCBo
 /Rl3jhM5MfQT6yMfHJpFqphCUnAcNy673QE4bMVocznxFnB+WRIH17GVk8w1FwXl
 8NaE45EuYVwrQoBHubjWmlFCA61W5g9gToXYNaKlpSmEDJui55kbkk26kwed2lJn
 xnealQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufxawwhd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 20:47:32 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-74ea83a6c1bso2093479b3a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 13:47:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752526051; x=1753130851;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+6szoN01qMvtkgP/ZIMTwafHhBz2p79aT5gKKnIkfmQ=;
 b=nqi/cRNp8MxgPTBkO9DnRtVTuRDyXNjNu8CONddUfmfBq0jDFiWhnPKezWiBgRaYvD
 o+hNF7/TZYRq0aUG2b6y5PxZ7lS7WWQiDQCmM3JezftBkLyJFlwYlrUAYfor5Ubfl4Sk
 bgR/8c7BdJtXRNxM91WHiG1ykfwTt1VVg0FqlXB2rjWq6eHwmVjzA4gtjyUzFLiUS0nc
 3n+tH4KJaiV5fgQJ0aTdioJolltiWv0IETdxvBvlKQmE1+uA+X1IphYR1W2EXJNw6txf
 czT5LU83cmcmT9QAOO51VC8R4Q68/1Fs8N+kMPzllWrXXuwUCgqLNnAMwbO7q4DkFZZr
 XJ1w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfKLRFttLnWuAD+FqbOU8bPQRlB0OY8ezJvath3efS3qFROaaza0Ge5yr4BxWYiAcQm/tgsEOU8Bo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxjHCeDBmE4oUsaihPxo4nQpvKzEuTKiLcu0nBvD2rhAqN2WnZF
 1lRBUs1DKZ3ikj8+KluIvIaj/iRtKSppWzZ6GlXuDiZv6pUrOtBXHkvxMQNRcQyl/rPIsaDNObZ
 K9kJ6Uphl+LIwvPeZM42ahvp0DYeFXWMWDA8I6rMUt9BEGjkdAPO2RKW3++Fc685/Dt2EqVY=
X-Gm-Gg: ASbGnctsg4R+RDnGz4PLvxu2qtftOEZCesEbT2dS8eDECs/Hz2ektrO2oYrv7SlzTv4
 r+i/0pS+z5vkFYa90387faX2ArGATkCPW7TZYMHA7V07zE2vEeJiz1gSGmv+lPCHS5GT21+qhNo
 Z7lsFSCRi7whIgkrUvieFb9+qXWelTT7KDIKqdY7ccrxOu1yukfTGXTzxE356wIAmhPSPF31qzK
 cwOKgxOIeLxgF3T0kZpuJwKFVBgciHXp5vZHvzA18ClHbEMvhydyY91ssPxPLXXAKlBorFG5CkH
 lMOyQJEqyvQKBAW8Vo/07SFZ1KBwGD+56IHqA8XA4aFgcQ7DaodsIYJix2P58uv40U0hedgCZTj
 lYNLKltQDyU0JcXh3DilUDw==
X-Received: by 2002:a05:6a00:1821:b0:748:ef04:99d with SMTP id
 d2e1a72fcca58-755b41ab6f6mr437045b3a.14.1752526051378; 
 Mon, 14 Jul 2025 13:47:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGh+Xikax20uVvqGMWirr1Ngeo4M3PY5vi4JIlcDBOfp3FjPa5Y+BJ4IdduqjZYXlTEboQ1uQ==
X-Received: by 2002:a05:6a00:1821:b0:748:ef04:99d with SMTP id
 d2e1a72fcca58-755b41ab6f6mr436999b3a.14.1752526050905; 
 Mon, 14 Jul 2025 13:47:30 -0700 (PDT)
Received: from [10.134.71.99] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74eb9f1a841sm10684116b3a.86.2025.07.14.13.47.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jul 2025 13:47:30 -0700 (PDT)
Message-ID: <b6b51282-7ab0-4cbc-a12d-86f35bcd6ffe@oss.qualcomm.com>
Date: Mon, 14 Jul 2025 13:47:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/19] drm/msm/dp: replace ST_DISPLAY_OFF with power_on in
 msm_dp_hpd_unplug_handle()
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Dmitry Baryshkov
 <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Yongxing Mou <quic_yongmou@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20250711-hpd-refactor-v1-0-33cbac823f34@oss.qualcomm.com>
 <20250711-hpd-refactor-v1-4-33cbac823f34@oss.qualcomm.com>
 <rmlgjr3fzb7dmnwmthf5bj67wb6fkcksmn3ouchzsvhhgxiv7h@vwcieejcufr7>
Content-Language: en-US
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
In-Reply-To: <rmlgjr3fzb7dmnwmthf5bj67wb6fkcksmn3ouchzsvhhgxiv7h@vwcieejcufr7>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: u-g1jePmGmGJMKl_6pX0bC8VX-JWWCD_
X-Proofpoint-ORIG-GUID: u-g1jePmGmGJMKl_6pX0bC8VX-JWWCD_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDEzOSBTYWx0ZWRfX9Ac1+uDRtzw9
 Oz3jsXKk2lDF383TH4l5iLuW60HxhF0eOuv5vpyCf1z/9mDybI+sjL94GiO1UOtlcVl6mfxn2gQ
 kDgh8yiatV8DdWq32uL5RFxJWG2VwH0aa2h0iJyQRh7cxaxlPbEbLvJd6co336QF58O2trbc+Bc
 gcmx8165tCzr3rX/jXW9q4n7fyaD9y2V4ZGG7Ev9lFC3Lc/bDHCkvNiDLSykk+MHXTe83V9xoV3
 jkILWg+XtvElfTajeHRQr/LTvn+w6s1LUALpCNuJzFmxlOixnCqPAycxIvmdMcFhGRYVOMWbU0J
 7T0MSDEF93KhhBpSAwwYityPNkvIL3ozOZkeNUKDpn39teWn3xaBuh1y9cKEA7x/GUsxrHXrM0l
 NJ871Biy4HAiAGEERQARoejWjAk2nMxkxJ9fU+lHwgX9cdMpckvCyHKEos3fHwv5sNaFvvLT
X-Authority-Analysis: v=2.4 cv=Xc2JzJ55 c=1 sm=1 tr=0 ts=68756ce4 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=e5mUnYsNAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=a_MUTpskHjF2EEzg2GEA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=Vxmtnl_E_bksehYqCbjh:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_02,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 priorityscore=1501 adultscore=0 mlxlogscore=748
 phishscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507140139
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



On 7/14/2025 5:27 AM, Dmitry Baryshkov wrote:
> On Fri, Jul 11, 2025 at 05:58:09PM -0700, Jessica Zhang wrote:
>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>
>> msm_dp_hpd_unplug_handle() checks if the display was already disabled and
>> if so does not transition to ST_DISCONNECT_PENDING state and goes directly
>> to ST_DISCONNECTED. The same result can be achieved with the !power_on
>> check.
>>
>> Replace ST_DISPLAY_OFF with !power_on to achieve the same outcome.
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
>> ---
>> Note: Taken from https://patchwork.freedesktop.org/series/142010/
>> ---
>>   drivers/gpu/drm/msm/dp/dp_display.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> Please squash all state-related patches into a single one. It would make
> it easier to review and more logical.

Hi Dmitry,

Ack -- I'd separated them to keep the patches small, but I can squash 
patches 4-16 into 1 patch if that makes it easier for you.

Thanks,

Jessica Zhang

> 

