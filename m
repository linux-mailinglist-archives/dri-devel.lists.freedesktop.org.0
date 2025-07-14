Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A76E5B048C4
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 22:40:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2301210E35C;
	Mon, 14 Jul 2025 20:40:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="PNLMXFRa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5A1A10E35C
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 20:40:28 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56EKWDov000421
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 20:40:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 25GVmgVH9MDk+jPkcTAhkD6+0FAocGPXkUfqlwWZ3pw=; b=PNLMXFRazHMoAE1Q
 b2zqfe89TduErxSZAi8QZeNZpEPkA1msL7FbI0JgU5jvZqNN66vTqv3+XLjAChxQ
 I8nKIFfF5y/8nvK2A+YvkXeXBeKZ+caUVQNssT8B60IcbWAfGftXCSHNqWju/w7z
 nPeXOnvomxj0f/0YWsA8+rPYbeLP0DGyTQcrHxJyEPaFCTcxXJAfwhvI53rSrC+8
 U3AyJvz8I9R2xjv3iosKAS7YzqD11YEyc7YPRVa9v2AFDwre3UkHdmiNpH8/BwtA
 MBQqoyyIhipyY0BXgIyM8dyqkAi7t36Zn+0qY/f7AjFeXcPyWI0Onuu63Dxx44aQ
 zxDdiA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufu85syu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 20:40:27 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-237f8d64263so47957165ad.1
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 13:40:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752525623; x=1753130423;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=25GVmgVH9MDk+jPkcTAhkD6+0FAocGPXkUfqlwWZ3pw=;
 b=Jj1foZLw4mwutrdg5LUSc9EG8nQjdvyEroghZcQvPenZDFJH3jox91QqURdC8F1ge9
 9D28ns97mWIfxB1hos+2cOT9Qo2+YVqZYvIA9NrsncLvMO9Woo/UueCq1+4wVR33wQe3
 8aXBruXG2kin9SIViHxVh6SDgFw9254nkvTkE/Mnlku/5lS/+ISFCnSy00uVVwO09GoH
 Li9pmBK28Cd09aroAIviBlIhfia9UC7gsHxiiASA+utoyaCzjIM8Fmaqx2nTPstbt8XT
 kZf66odCWcu7YbxlgF8sa/17XdgcufAnRsWRJo9m6IGPNcSvUguihhMhupbEz/QS09fj
 Y8hQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLuwdsymR3WGjtEYfbGp/f4sdnHx4wMxuaZta3WGK2BEFo0+jX0SwUmTm0ejkxa1J3XXHtzUNSFWg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyKALGNHqrsYyeVwsykF+FC7axNKXeKQiktOa1HgVdDXMpT0ZaT
 LCkIGqw1be69S4BAIyHZ9/A1k2BUCP5A9Zh15NxChet20f2aQWqDCXWTQX6rQKcuPQLYMNiER24
 PnyIYboZH2Hdc5PitjrMebHl82iQf/ZJ3gnVonQ5kgvqn0jbl4R9rY8vAHyUwjguqcrZ9gMU=
X-Gm-Gg: ASbGncul3UIkhIE6JNWqeTRYMb8ST7/MpWWT9IJtFWM7JvjKCiTj2w34RUtJV/9V+wu
 JuBgXHrTrdLhoSh7Kdj0Zfb9KqMlj0w6e+Em9hUt4CF1G08kOQ+n8ztzo4SQ44Y2+a6ZDT0r6Sm
 p0XGFYv/ZUaDzh1Cac0gokvNxlYTTdefI5dR5HRhR8rwIrhQAgo/nMPEs1VWntR0iUh5n5dsrD4
 0Ug7p3H98thfiCfLjyXJeWtIiXxlSI9ZPI3I3hWtO4REEs2byYc/MtJgoEEMEsiHg5KDo1ogJ5h
 +cVJUnboL+vcDUcAh4lVtoS/hJbIok/K5KtZ+6b9U3gVZtggb1+dwwBhB123PFzPkabsBzlD7Jj
 ruU5dWWj9xYQeBwFgYZT75A==
X-Received: by 2002:a17:903:190d:b0:234:c8f6:1b11 with SMTP id
 d9443c01a7336-23df09637cemr220506765ad.44.1752525623066; 
 Mon, 14 Jul 2025 13:40:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGWNBRWKprVEoGbPc3QI56BgXdYcezaLFCqX5CP+sJ7MbZarEK1v7Av0mTf7ehe9MRj6ZXn0g==
X-Received: by 2002:a17:903:190d:b0:234:c8f6:1b11 with SMTP id
 d9443c01a7336-23df09637cemr220506455ad.44.1752525622634; 
 Mon, 14 Jul 2025 13:40:22 -0700 (PDT)
Received: from [10.134.71.99] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23de4322db2sm99681325ad.100.2025.07.14.13.40.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jul 2025 13:40:22 -0700 (PDT)
Message-ID: <6883f346-452a-44b1-b670-3bd514f57b08@oss.qualcomm.com>
Date: Mon, 14 Jul 2025 13:38:55 -0700
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDEzOSBTYWx0ZWRfXyV+MgVz3DTsK
 KuHgR8TNPt1B0bK5WiztQ7Vj2Sb+8lyx+DSbKCRrQ1PUhd0BDP4tZbJrn/mVV6Q0dn4BxhXUPP5
 Gia71BwjK3Rv1HpHgpiUF/K/zla3t52JXlIZJ73k8UwBa9E6HnhWqQu5dnMLtjNFL7ul17MoZL1
 mSUocUOVKck10UhiY9+GTRenX0dTyr4j0SHrTDwzn7shzTpikKb0Vsy8IFBcKB8BDxKjtFIktmf
 wqEfUU6pj03HhIQw8osMUtM/XdqAJTToNBDWSwdJ0wTDVgd7YLbAFi40OEHyor2l+2CSVWht5Li
 2fKO1H0dMGdKhjSvOlW5ajITJpTq2WCoZFi/ae4H1u4yVoVdoXaLMMr6RdgB1Zs2MNH42i78+LN
 j2IKU2oYfvCdFXjlNMt+zP+9UU34jSH8gUaivAsdS5i+hWLk/Dmpl/LDQQfowQMGlx4npyBm
X-Proofpoint-ORIG-GUID: zuAvY5gz4f0aAMlxENitTuD-QBlSSCgs
X-Proofpoint-GUID: zuAvY5gz4f0aAMlxENitTuD-QBlSSCgs
X-Authority-Analysis: v=2.4 cv=f59IBPyM c=1 sm=1 tr=0 ts=68756b3b cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=e5mUnYsNAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=a_MUTpskHjF2EEzg2GEA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=Vxmtnl_E_bksehYqCbjh:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_02,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 spamscore=0 mlxscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=795 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
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

Ack -- I'd wanted to keep all the patches small, but I can squash 
patches 4-16 into 1 patch if that makes it easier for you.

Thanks,

Jessica Zhang

> 

