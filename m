Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E155BDAB13
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 18:48:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B286C10E672;
	Tue, 14 Oct 2025 16:48:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="D00qQswn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41EC210E203
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 16:48:46 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59EF4xoP001716
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 16:48:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 0T1Jjp9QDrR/DmyB+uvS3bVOfpogbRvHlaXdf+Z3TC8=; b=D00qQswnhERKYlRK
 3XlOpkdp2tStNoU4792X3kPXExvNtCd0fHt13tc81JwoFp/UxG8+ImzR1WUbYHrc
 YgV9up0ipIVmM8hPHiCxPUQCRMG9vivZjrH/eXGlwEBODmUGfflMYXFMcFJX+TG4
 C1fqJngSgQOMav6b3YmtFRXaWV8qD8oOkRLqEgPQbNSSUNC9Ym0jvCKRCeguAa+l
 MPsgtnyBXLU6cFnFWSC9dqUE+iiZ0wOUOoJZnT1/gL1MHc9NEI2ISjRBipwD7Oyr
 GB8wdpYi/2LZ6jY/jP0SsUCCOBTqKRjQVOVeWP3i9Gtx2/F2hpQmj9GWaEFotuKS
 wx26UQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfa89a8v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 16:48:45 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-339d5dbf58aso21775234a91.3
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 09:48:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760460524; x=1761065324;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0T1Jjp9QDrR/DmyB+uvS3bVOfpogbRvHlaXdf+Z3TC8=;
 b=wte3EiZzgZxAvW0M+QIUKTxtqqbjyGjJ/inhcv5PQrHaKio55RK3/TXouis6NRArfV
 7RF+QN9ea/+1141rw9avI3ibDb+pUU126V1A1f4h0whiuqyBoZXgRMqV4bA5yxQQC+Sm
 MBGbsL9J7F9booKWwjOOF8V3jqtqCSd1pvUsn8xYbfdxTW0DplluyEsfqKH2KvcVFAT6
 SReXbV0tLa70N8v0lz8ag5ROSM/A6nVNjWReXzK2TWjE+7AfRkTk62T39gr+GpZF9EtM
 O2yEkNiKtE+pt9DUr6fnXI/QE96NxK3UMgFubbtRk0DvOA+N4IP4e4on3vFwjo8Chhks
 zdpA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXXJCHpRZVvB8Cr6dngI7Z1PyqjeJTSHSkJ7RtJFCLPSnmQBB42GXCDeFo7rWGm8IK1UhEyFIjLjU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy/HM7XhNSharjrF4QgcwJCcR6gzbHcJ8AigNs28v+4VX6M9Fo0
 ttHVOrk01pLEpZMCuiVJZmmu9/2Xvc+dcn0xle/OljMLtEcTt3EtsvijCx/pjrWItJ6w7dQKHzx
 Jb/rYhfGsf+SUGKLDp3B4ndfDJO75NoX6YE/4kDpSOSzsaTJr9FThtCCJBHoJ1imte5CCqjE=
X-Gm-Gg: ASbGncso0ImtRuT6BGPhERKBh8L56r97+hjzKMJa97bHv2MZge9mEYDwizIXYMu1Rr2
 4WbJrzdPmwHjdZF4CbTl95akFInNNt0uAzYSEWRALJMV9iWc3QUdeEAkW+BOV2txEjtD4Y407AD
 Gqe0fk1QoD7LUGcssrFSJrkAagol8GEB5pvBy6VYcSY+CPYmGPqFLYXaazEvSz4zS+HW7tUqSbS
 r10n5n4htjz+Fs0usRFmtEpo8vNhzWz5h5dhJPu7jjYNhhvZ2AENADhmfNgDn0mULql5FNbwZJF
 00iOJPTHvamSI6zl8JzUmFR55mw9f4KJESw4qnycQOKNqvtZAhHGN3fqMTE5tF350jdn7m1vOgE
 nhorplwcyu3bKqQ==
X-Received: by 2002:a17:90b:3ec5:b0:327:e018:204a with SMTP id
 98e67ed59e1d1-33b50f85081mr34686282a91.0.1760460523638; 
 Tue, 14 Oct 2025 09:48:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHfjmax7nUj1hTWUtndCVkZQbPyiK00PHdxF5uajC+DTYIemIff+447wAHVQF5O6WWnSqeWBA==
X-Received: by 2002:a17:90b:3ec5:b0:327:e018:204a with SMTP id
 98e67ed59e1d1-33b50f85081mr34686257a91.0.1760460523171; 
 Tue, 14 Oct 2025 09:48:43 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-33b626d61aasm16453355a91.17.2025.10.14.09.48.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Oct 2025 09:48:42 -0700 (PDT)
Message-ID: <d61ca50d-f9ea-40f1-a97d-090a11e49028@oss.qualcomm.com>
Date: Tue, 14 Oct 2025 10:48:41 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Add xbl_config image entry for AIC200
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
 Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
 troy.hanson@oss.qualcomm.com, zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20251007221528.561242-1-youssef.abdulrahman@oss.qualcomm.com>
 <c3339f06-aaca-490b-997c-8b6b145c93c8@oss.qualcomm.com>
 <148df7bd-6410-4814-94ef-0880b596f363@oss.qualcomm.com>
 <74703f5a-243f-44ae-bf74-ab5ddfb6f685@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <74703f5a-243f-44ae-bf74-ab5ddfb6f685@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: YDTEY6fCwcYbESLekLv_Pa9ssyfZqMl4
X-Proofpoint-ORIG-GUID: YDTEY6fCwcYbESLekLv_Pa9ssyfZqMl4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxNyBTYWx0ZWRfXyTjHUNB+IKHu
 zY6FYKvHe74JnANn/c+6WDom/hCH+1gA/qQKM6MJ1aSU0nET3BzLnX4xOIUaQoS7cFeBAZ1IT09
 ullmhqtOX1+NqxNggP0kQaNVPnL55jcMG6OAfQtzdb50WrKFzy370ml8zpaQ6AFvAq6SUhOgNfr
 tAXuxl9Et4tFxGZBFeoHTwtixCRPT92cXnKZaF5twbqS0pznJJWvmq4RtSUubACcvRlnoHVoOiB
 FXI112q9Xnd5wse5rHlcGZiJ9xV59nXeApF7v8IoEBhYb0T/sAD3HPrg0xWOmq6E5UnjLnml5Qd
 SnIROO1EtgaLLmZQpdzzPQqH/uk6AnH1JULIAVpblRgEWz+t7GRsMt1iLiefKM7u63EAZ+fHx81
 gBVF1P3AaHcyblxrFzb3bcucwCqzJA==
X-Authority-Analysis: v=2.4 cv=JLw2csKb c=1 sm=1 tr=0 ts=68ee7eed cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=DQEq_hw0WcjhS003KFEA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110017
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

On 10/14/2025 1:48 AM, Konrad Dybcio wrote:
> On 10/14/25 1:47 AM, Carl Vanderlip wrote:
>> On 10/8/2025 12:49 AM, Konrad Dybcio wrote:
>>> On 10/8/25 12:15 AM, Youssef Samir wrote:
>>>> From: Aswin Venkatesan <aswivenk@qti.qualcomm.com>
>>>>
>>>> Update the Sahara image table for the AIC200 to add an entry for xbl_config image at id 38.
>>>>
>>>> Signed-off-by: Aswin Venkatesan <aswivenk@qti.qualcomm.com>
>>>> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
>>>> ---
>>>>   drivers/accel/qaic/sahara.c | 1 +
>>>>   1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/drivers/accel/qaic/sahara.c b/drivers/accel/qaic/sahara.c
>>>> index 3ebcc1f7ff58..04e8acb94c04 100644
>>>> --- a/drivers/accel/qaic/sahara.c
>>>> +++ b/drivers/accel/qaic/sahara.c
>>>> @@ -194,6 +194,7 @@ static const char * const aic200_image_table[] = {
>>>>   	[23] = "qcom/aic200/aop.mbn",
>>>>   	[32] = "qcom/aic200/tz.mbn",
>>>>   	[33] = "qcom/aic200/hypvm.mbn",
>>>> +	[38] = "qcom/aic200/xbl_config.elf",
>>>
>>> This is the third oneliner extending this array you sent within 24h,
>>> please get the list of required files and update this list once and
>>> for good
>>>
>>> Konrad
>>
>> I wish it was that easy during bring-up.
>>
>> These patches are being upstreamed from our internal branch and thus
>> reflect the different latencies across the sub-teams to that request.
> 
> That's upstream-first-first ;)
> 
> I would assume there's a single list of files that get loaded, perhaps
> within the device programmer image.. Unless you're altering that on the
> fly as well?

There is no device programmer.  This device does not store runtime 
firmware in flash.

This device is still under development and not in the hands of anyone 
outside of Qualcomm, yet.  Much to my annoyance, the firmware developers 
are continuing to change the firmware images - adding new images, 
splitting up existing ones, etc.

I'm expecting to lock this down, with or without the firmware teams, 
once devices end up in the wild.

-Jeff
