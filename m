Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F87FAB4388
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 20:36:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7B6B10E490;
	Mon, 12 May 2025 18:36:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="dkBqZqMn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D9A310E490
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 18:36:20 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54CINuph028882
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 18:36:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Ua+j4+iYABTDoLL3xkPGvYtLna9rjbpRaD3utkRBGyE=; b=dkBqZqMnXwWQhD05
 0xW3SO+47D5/01khApaIXKjaopHda1iNNSfej1Oc41A8dRBJUvpms+JmiZWU3wtu
 vNukqUtXYabMuZKXEaSS6WUuFglIZzad8ovSJoTtBqK/Vf8gxSXZVNoz6w+m6Ots
 x2pmJgOeVDIwgXdlphiix5LPrQ3rTGkJzoenA8KNMcyl2aJKQdAo0qr2vONW1vei
 p+aIpfCaw6sorLz/jyWWXHSEbInlyEauUOL83eA4FG2oPrWSgUQLQIyQsQ31KWWC
 l+tclPC4jKgfiUabz9tN5nNhi9EUftaD6+yEP2anwqzReqqANagyJxAISIkJ4/IL
 ntWr+A==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46hv5qdjrr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 18:36:19 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-22e7f041997so76164205ad.3
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 11:36:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747074978; x=1747679778;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ua+j4+iYABTDoLL3xkPGvYtLna9rjbpRaD3utkRBGyE=;
 b=S+LnXNOGFZHyAX3hckwUN3TdPWwdV9kVHx6pt+AFeHswhMWKiCY+yAtT6948FDfUg6
 WYQhofD35Y68eMjlBfYzQbTpSrOSK8HW2BoF5EAIaC4wnkbXUbjkI3BP4n6bIYkqHiyd
 PCl96V0cpH4bCP0JoAiKtj7HVPZq8s1wfcvXom6EBXkZoyJqDnDV8LyITYMI3cM33Ezt
 9qIEbFchvKgQ1Eh4TB+YZE/ZLgGL/lK5eK0a30RmHHoxxwfX16fZV+nQVGVXNQwfyuHJ
 GIQaC/QrTlbf0RLLM54j8FV2ekxGgbQv6wi7Mn8ssLtPqOpLYa1GCuRTuOcE+3gDKKQZ
 Aq5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVClvjbgQXzkcqrAbMF9AYTFsfmrLuOCsEYiuFRrbwMOpRzWqj6biVN86a4k7S8cKkq1TWXS9r8Ebc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxfIbb26BxleSJQj78LuZut3hD57nER2MC2/COdewwFj4kmQps9
 eOT0XiJrwqIJD1fYh/+6XEWw93uYAPzVHf7V2iviDGdJdl71inv+D5bP3HOAWquHLrjv2Ew+PXA
 zeUQIIo3a/wicnXTGlfBS3seVXAiDMo+wnXKn7w/795mIC7qpvL99fANA1qc/sJmz0oLx5RgREG
 I=
X-Gm-Gg: ASbGnctp9JqQJfqPWwDFrxegAKazl5Um1OMTDV56YwkGYO31tcMPjnRhLf5IzhpjNax
 xNBBKWGIJF15iEphSc6JEHLCaTtdDt2LdonF1spiqBffVRzFcFB2qwdMedwYAegj+WiurEUSKwW
 AAaRuqmpf+UCQXOaHT8b9BP8sX3SvEpwrGwuJor4YkMajRNBxArOUWhDUyxG4fsu4GZM6bHgGp6
 9xToZ1NEvBKEjvcxKYUV7gsTAtJi/GRjHO9C57z6J8DuvC0p7djh0GxvZJP8TxdKOz59bHt62jT
 d3KEmYRd6zxZYvnGpFoshW/gE9l8pZVCcEmHrwlyFhxM/8a2Qdxg069fsr9BXQ==
X-Received: by 2002:a17:902:ec87:b0:220:d078:eb33 with SMTP id
 d9443c01a7336-22fc8e990ffmr212504925ad.36.1747074977904; 
 Mon, 12 May 2025 11:36:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGb9eNA28YjCJt9lz3SJrMVGfwzv15037eo9H8POuKZy61L+gU6s4TwLgd+vSCL5plOLs8cZA==
X-Received: by 2002:a17:902:ec87:b0:220:d078:eb33 with SMTP id
 d9443c01a7336-22fc8e990ffmr212504655ad.36.1747074977543; 
 Mon, 12 May 2025 11:36:17 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22fc8271c01sm66156275ad.140.2025.05.12.11.36.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 May 2025 11:36:17 -0700 (PDT)
Message-ID: <2432a3f0-871a-425d-8f89-94577cf0e493@oss.qualcomm.com>
Date: Mon, 12 May 2025 12:36:15 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/ivpu: Use firmware names from upstream repo
To: Lizhi Hou <lizhi.hou@amd.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: stable@vger.kernel.org
References: <20250506092030.280276-1-jacek.lawrynowicz@linux.intel.com>
 <abf77771-ca6a-3b29-f5e7-fbb11c53844a@amd.com>
 <35f0d2b1-e958-44db-b4d2-978cd741c3ab@linux.intel.com>
 <08a17170-b991-f520-6aca-0690a28917a4@amd.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <08a17170-b991-f520-6aca-0690a28917a4@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=DqtW+H/+ c=1 sm=1 tr=0 ts=68223fa3 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8
 a=zd2uoN0lAAAA:8 a=EUspDBNiAAAA:8 a=LTIWpQBfA_taFBiOom8A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: t0P99sm1W9liS5lcFiJrZGvBmlNtPqQq
X-Proofpoint-GUID: t0P99sm1W9liS5lcFiJrZGvBmlNtPqQq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEyMDE5MCBTYWx0ZWRfXwttrz73dwNjH
 B8cBJOO7OPBFGK+5QG9GEQChH6PBO7SqFAfjihXdxiDVQri7hvySFRBXoUNigko/1pvUtt0iFOy
 o/u7h+Ld7r39flGawDebkGrOGFT3nUWzv41OZ1oX+1DtLNQk0R9LN3OuuaqypSdxaBoeQUGIN39
 5keJUbM7J18PbjpiEr11tWtWpdTtVtUaarxmbDV/xD+in61z8nVguES0+82ESOaycrDrrFvb4SN
 lLcYfhTKSvTAVAwjVqD2jhob0+Qj/4M2CbArYsK0wBqbYmX72qM+5E2iIYKCZ91T+vzP91YPLZG
 iDRsxmmxffXqc96QqcMz39XpukmTQeT07IKpfvJS2lW7+mabYWzzCSE2q9l6LwvMCxv17u5eJjB
 9GweveptMkBvt48XOTYxSanXAhNH20W+1FBdkXi9CVU2C8o3oGmnnpE+gfOOzdKtValt9rgt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_06,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0 phishscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 mlxlogscore=999 malwarescore=0
 suspectscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505120190
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

On 5/7/2025 9:24 AM, Lizhi Hou wrote:
> 
> On 5/6/25 23:59, Jacek Lawrynowicz wrote:
>> Hi,
>>
>> On 5/6/2025 5:41 PM, Lizhi Hou wrote:
>>> On 5/6/25 02:20, Jacek Lawrynowicz wrote:
>>>> Use FW names from linux-firmware repo instead of deprecated ones.
>>>>
>>>> Fixes: c140244f0cfb ("accel/ivpu: Add initial Panther Lake support")
>>>> Cc: <stable@vger.kernel.org> # v6.13+
>>>> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
>>>> ---
>>>>    drivers/accel/ivpu/ivpu_fw.c | 12 ++++++------
>>>>    1 file changed, 6 insertions(+), 6 deletions(-)
>>>>
>>>> diff --git a/drivers/accel/ivpu/ivpu_fw.c b/drivers/accel/ivpu/ 
>>>> ivpu_fw.c
>>>> index ccaaf6c100c02..9db741695401e 100644
>>>> --- a/drivers/accel/ivpu/ivpu_fw.c
>>>> +++ b/drivers/accel/ivpu/ivpu_fw.c
>>>> @@ -55,18 +55,18 @@ static struct {
>>>>        int gen;
>>>>        const char *name;
>>>>    } fw_names[] = {
>>>> -    { IVPU_HW_IP_37XX, "vpu_37xx.bin" },
>>>> +    { IVPU_HW_IP_37XX, "intel/vpu/vpu_37xx_v1.bin" },
>>> What if old only vpu_37xx.bin is installed but not intel/vpu/ 
>>> vpu_37xx_v1?
>>>
>>> Maybe just put *_v1 line in front without removing { ..., 
>>> "vpu_37xx.bin"} ?
>>>
>> The vpu_37xx.bin style names were never released. This was only for 
>> developer convenience but it turns out that developers don't use this 
>> anymore, so it is safe to remove. Maybe it make sense to mention this 
>> in commit message :)
> 
> Sounds great.
> 
> Reviewed-by: Lizhi Hou <lizhi.hou@amd.com>

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
