Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C04D08A9B
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 11:44:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C470910E892;
	Fri,  9 Jan 2026 10:44:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="NprL9ete";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NvXmvk8m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2716610E893
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jan 2026 10:44:54 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6095mH673019005
 for <dri-devel@lists.freedesktop.org>; Fri, 9 Jan 2026 10:44:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ZyT3fVnKArzgvZnGI1eOsr53HeXoTBiws3nrw7rZn9w=; b=NprL9ete3g0nNeEi
 NRhe8pTqB8RgdhzK4ww5oz93aDvMu6CzwUJsJobPedqP7ryaQ6gNufKquk/+X3Z8
 NqjUhMDvUKbwnkLiVLP8teHDCWPAIWqYl0uyuI06W16EExyUXrzcTHROH4iLVddG
 8ZrHqbeP8x21M2y0B7391F6ct6F5eVyz9kBR5ERnoQy2TfYLrY/jfW+8s3iocuGo
 kJoQ/O1wXAzdqH0GjhUXcR7hfBoAFNuKwnZa9xGKLM2KOL2JYP5S3aSUF/EFFKEu
 QB6SIMnFXEHtW9xoY2vNnbuzkqhebMbS5bLUkAhpqu3KtVv9PPo01Uz43ZgdOv8I
 NXqBCw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjjk3jd21-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jan 2026 10:44:53 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8b25c5dc2c3so76547985a.3
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jan 2026 02:44:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767955493; x=1768560293;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZyT3fVnKArzgvZnGI1eOsr53HeXoTBiws3nrw7rZn9w=;
 b=NvXmvk8m6Ur2Hlri5HcysCYVsG+8OgeQsoBjfrTCb1av9WEPB6KnkUYATa4at6hTeC
 Nj/lsGXkpCvJZgxQOj+BDi9vqRcj93953VR41y08m6FalrinaxOLo7QwmdffK4Sb6omQ
 hzlVHjrJLQ+F7y4vwlaeQuuCfWZkKsJ752+6PeciLtsnvLlNFsd45XvHRR/WQC0FNMFM
 ZaSif7So6bPC/iek0uOwRD00h7daBTi5j4HABWnh0LhDJcDIPijIl4VfU/eztdhYJeCu
 7Ujvz+w8Pqm3T+9Sg54gJc2495+nYCcByuZNA6HR8E/ACJ6hEtkC7RSQ3bD50AQ8Zu7s
 NTXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767955493; x=1768560293;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZyT3fVnKArzgvZnGI1eOsr53HeXoTBiws3nrw7rZn9w=;
 b=CJ0E4ueQmPTqFusgYrDKCwGpCDqR1Dd63k/YpKjzJvCVb8nmwZqea6RybUboYIJgVW
 nwCA/a9W9xLnTXfB87ZLzViPwb6hekvf92s19bcVfsIRCaOER72N5Yhg2x7pF7PUpwl1
 uhLoUYvRA7baakryI9Oyf9b4jj7jY0/8AWyIqziGErZY9qkm3OjpOWf9JwrIMm/7mOMo
 0XpXIyb/M+lRcdgH6/5KXj741HXIHuUi7SvgIdjIb7E1wVXEhDT1MoEAQEjWM2ndv1WN
 Ow2cfeGdPQ80D0Y55l8ljXgBmypPGwPdmAk6NSp6IsSOfuO+HbVrICXhwRfQm/0OGfqv
 wBeQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUmYYGOl68t0a6XveQvmDkfmfJ7x4kzS8jVnuQ03ovfDu3tcGU4lu1GfPwXO4oY/SXycBnyp8ZaFeM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YybUFBsdCCyGq4Uxc7dUVcMfk5M/Da/qaOYnqZ57czBJsdbIcjr
 ZvXC/QBczRFkp8IK0NZ7SfOhWjjVvz5sge6Cy2UuqrLlI/tcCkDiIwG5gEehOgrX0YacfPEgMpo
 2DJ84mAMgI8FRaYmXDDXqqV+1OcNkeqpaUT5lGB1uHxLZmBeDov8zZWMliRedGTdYt3wVA8M=
X-Gm-Gg: AY/fxX6itpXomT7mhMDpo7ICuXEu637+UfkMagx8q5utWaH9vwOoNaxJUT2jEqSWU0r
 OtcrcZS4kBAASJi5Y5nN11lbeVYkyoAsY2Ia+cl0osbZG9Almh9e/NC90Rzkcf0yi5cvQ3hhakI
 eHcGvXo5Ag3i+6aXxBQef73RWaMdXoh974RBSOpdxw0Qwuf5gjv+BcSLVDycwvEwR+GacZ8RRMT
 5zVe6aN4wLXoCY0gMd+xr784K67pSwc/ZRi5hEhx/oew+jiJi8+E8uCGOEyxc231z4Uj32ZSbCc
 xU+Q7csV0G8F3X3oqqmfGI+aM3J1ZkY/ASq/dNTeC1LPl85u1kAvMK0T3w9RVhv0k5AbOxh1TT5
 Ex627Xe+Syw5U4j8n6Qs04aj8+9q74TPvJoljRshSQXNX7MMMnFwD4jPzkqmW2Vaw7Cc=
X-Received: by 2002:a05:620a:2847:b0:89a:7d24:f5eb with SMTP id
 af79cd13be357-8c389405d75mr800543685a.9.1767955492559; 
 Fri, 09 Jan 2026 02:44:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFUpKCBKMBJi+XzxFemYbEOa3ADoNK7YYzJnMXnJTOfqSPRMkTsVJDQkKa7InHZ//GdxnUhHA==
X-Received: by 2002:a05:620a:2847:b0:89a:7d24:f5eb with SMTP id
 af79cd13be357-8c389405d75mr800540485a.9.1767955492001; 
 Fri, 09 Jan 2026 02:44:52 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b842a56c552sm1089465666b.68.2026.01.09.02.44.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Jan 2026 02:44:51 -0800 (PST)
Message-ID: <dc16d4f8-21a3-42f9-95e6-c508311268c2@oss.qualcomm.com>
Date: Fri, 9 Jan 2026 11:44:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/msm/dpu: fix mismatch between power and frequency
To: yuanjie yang <yuanjie.yang@oss.qualcomm.com>, robin.clark@oss.qualcomm.com,
 lumag@kernel.org, abhinav.kumar@linux.dev, jesszhan0024@gmail.com,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, krzysztof.kozlowski@linaro.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 tingwei.zhang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
 yongxing.mou@oss.qualcomm.com
References: <20260109083808.1047-1-yuanjie.yang@oss.qualcomm.com>
 <20260109083808.1047-2-yuanjie.yang@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260109083808.1047-2-yuanjie.yang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: zVjpTnuyx7qaPGqjisp1GbS0MxGSn7QM
X-Authority-Analysis: v=2.4 cv=EazFgfmC c=1 sm=1 tr=0 ts=6960dc25 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=MqSUJ6ohGVtzaGjW0LAA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: zVjpTnuyx7qaPGqjisp1GbS0MxGSn7QM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA3OCBTYWx0ZWRfX/iMiS5khUINN
 RGFCTPI8n8mjRZITnM0u/xJnqVjm5Fnksqp3kpJmhll9LeKyMeyjgyhA8QmK4jHQrNB22sP3KHE
 9UvIWLSlMYVhAqsu0b4EygseVbGI+pOEViLu6er1B9+ceSNFsNZFQf4cA6DWBxOqliz7GwHC7mv
 VaZ/AGSBHcIgjlc8DUGA3qBUG2ZsicEd+OaVhrHd1xXxcXE4yCY09K4Fbd/SkP8emDWiHp0N3AT
 AmO9URapx6IjuOyCI08lcXwtz6wXEyQNYnXy/NH3D+0OmlpqiWo3ZowygYXycp6GRgvodbkaJt7
 qqVyxSf/vimMInP6moyrgJV9ejugc9Sps1jK4A1gR4Wy3yVwcbfXrr7ibZ0I+VBMrV1w7sZADtQ
 JUlCgl0fAScskefDbEWluGIUe8WdZPI8/OzKrlOrLjl5mWVW1oIxokNsivSQLJ1mrCjxMhERfhJ
 ZrvGT7oVlpKJu6ZKWCw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_03,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 malwarescore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090078
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

On 1/9/26 9:38 AM, yuanjie yang wrote:
> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> 
> During DPU runtime suspend, calling dev_pm_opp_set_rate(dev, 0) drops
> the MMCX rail to MIN_SVS while the core clock frequency remains at its
> original (highest) rate. When runtime resume re-enables the clock, this
> may result in a mismatch between the rail voltage and the clock rate.
> 
> For example, in the DPU bind path, the sequence could be:
>   cpu0: dev_sync_state -> rpmhpd_sync_state
>   cpu1:                                     dpu_kms_hw_init
> timeline 0 ------------------------------------------------> t
> 
> After rpmhpd_sync_state, the voltage performance is no longer guaranteed
> to stay at the highest level. During dpu_kms_hw_init, calling
> dev_pm_opp_set_rate(dev, 0) drops the voltage, causing the MMCX rail to
> fall to MIN_SVS while the core clock is still at its maximum frequency.
> When the power is re-enabled, only the clock is enabled, leading to a
> situation where the MMCX rail is at MIN_SVS but the core clock is at its
> highest rate. In this state, the rail cannot sustain the clock rate,
> which may cause instability or system crash.

So what this message essentially says is that dev_pm_opp_set_rate(dev, 0)
doesn't actually set the rate of "0" (or any other rate, unless opp-level
is at play), nor does it disable the clock.

Seems like a couple of our drivers make this oversight..

I see that originally calling dev_pm_opp_set_rate(dev, 0) was forbidden,
up until Commit cd7ea582866f ("opp: Make dev_pm_opp_set_rate() handle freq
= 0 to drop performance votes")..

In fact,

$ rg 'dev_pm_opp_set_rate\(.*, 0\)'

returns exclusively Qualcomm drivers where I believe the intention is always
to disable the clock.. perhaps we should just do that instead. We don't have
to worry about setting F_MIN beforehand, because a disabled clock won't be
eating up power and when enabling it back up, calling opp_set_rate with a
non-zero frequency will bring back the rails to a suitable level

Konrad
