Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3357AFF1AC
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 21:19:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEAFA10E0AA;
	Wed,  9 Jul 2025 19:19:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="TDW93xVB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27D6E10E0AA
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jul 2025 19:19:15 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 569Cojct016188
 for <dri-devel@lists.freedesktop.org>; Wed, 9 Jul 2025 19:19:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 pfQKjOtH68DSBNR+Uk2pyki9PruLqbnrYQSvyOAaahk=; b=TDW93xVBktf1jFKF
 W8U1+rkdZxkR/FU+QXL225L453FnU4yfiZNzIVS7q26JV5wU1K94PFXXq75zrxWN
 2ZV7PjunDv40buHAfF7EfxLHpcNQTE/K/ruqFeA4D14q0cXEaOXUnPChHuHwxWJG
 FAl8k/OO5pE61oa4Ml8xcQgDjpwEui6jvTUvh/BSVhG4vbxilHe7mg8eaUt7WGbM
 TU6ArIQzEsdcAliijMeGZ5UMkuyjU+zDVS+JJNn5ZpUAD0Eo+KR2gJsSyYulBwQj
 wjJPk9K3kGh/xB9RgjkTc+zrXrnTfEgPqVOUgMkVij3xKOOQuE4ANANY9lp5EYr6
 z1lVUQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pvefnqf3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Jul 2025 19:19:14 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7d0979e6263so266585a.2
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Jul 2025 12:19:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752088753; x=1752693553;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pfQKjOtH68DSBNR+Uk2pyki9PruLqbnrYQSvyOAaahk=;
 b=StoicBEvJeRpYw+eU1/h1gM49jymm9t+4IOUxOpx1wj4FVzdXMQ0ETd5HlTBWT3qSC
 G/JL3IGku1PpFjBNOsNyxGsiskovest8RXL7GyKcIK3uQkBSabY4yTdedIhJeqDn/zSZ
 uZyMKwduJ8c/HAiSZta+m7kYMuSgPPwziztjRemG1GLndcWor8hGRF98P+KYJPPpoi6S
 qC/49dSsP5ApeFQXCTUhN1g+zVVPYYAnUhiop7y9x4E16+VbccJx+vjxg/0+C4NTDDv0
 8z8QzXJ5QzUx7CaS6zKUeGtSFLqrgRQnR2MbN8y4l95sVNQ0YNZf2cDxrlMxyk2BVOy+
 ES8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXiVhldSRvfJLJQybp5iOnIMGJnXB2oHKk61EwrvTGmTtxOoycLGgk/KY2EkitUAy5sO3yPI2vQGFI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyPd4fkCKSHn7pkaHo09COu7DZM0Mp6lTlqNxtaLrDYExDhHI4l
 /YRiEJfaC4Ez6jcf6tEYUo76T0J4muMDb367XUN98zqu336Qu8+NO/NcYDW/iy9tN0sL9gk8GA0
 LlnorZavDoqhlEEiK3F4Nvnb7chqMl6q5sXaKqcYp7Hr8Q/KP/sekMXJi4dutkRB4glLcEaM=
X-Gm-Gg: ASbGncupjY6Y9lHuuQnjGY1z2j7DcaG24v1E+yBGO3XP28CAjJ/OXVE7PV5dHWG/3CD
 leAoCNn8MOT2tZsQKMdT+smmZWPnyrON0lvrVNv1MNZ9rUr5AxaOpRRxVLobZ2vcjDE2ldv915N
 GG5T7VMaBlHv36YcFbVfeUbjjk+wkYv5DQNLgugEe8wXPaOFQ/lrrHC5UwyQO43ygpH4YkHDM7o
 wh4L4bFwu+qjShRC/7C73fGmkQUoDHxGFTJnm+8+CMaTbBg4dMNE1g+BzKCpPFdqv8OYOj/5PDE
 BoG8gQF3VqfBuYh/Yk+X3nLpFySA5e5985T4hScjlVuDqUpD4F4M7FS6OhR19u3as/4eKxMbS6S
 HQC4=
X-Received: by 2002:a05:620a:c4c:b0:7d5:d01f:602 with SMTP id
 af79cd13be357-7db7d78e468mr216924085a.14.1752088753168; 
 Wed, 09 Jul 2025 12:19:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFcregrlw/J8rloCEh4HZgcfMxUlAlzdGycBiRw/6NNEExrP1Y0htAK4nXMstyn/N9Sgxli/g==
X-Received: by 2002:a05:620a:c4c:b0:7d5:d01f:602 with SMTP id
 af79cd13be357-7db7d78e468mr216920885a.14.1752088752693; 
 Wed, 09 Jul 2025 12:19:12 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-60fcb0c8909sm9334303a12.45.2025.07.09.12.19.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jul 2025 12:19:12 -0700 (PDT)
Message-ID: <075e59d0-569c-429f-ba14-c2e59e2f63a2@oss.qualcomm.com>
Date: Wed, 9 Jul 2025 21:19:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/4] misc: fastrpc: add support for gdsp remoteproc
To: Ling Xu <quic_lxu5@quicinc.com>, srini@kernel.org,
 amahesh@qti.qualcomm.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
 arnd@arndb.de, gregkh@linuxfoundation.org
Cc: quic_kuiw@quicinc.com, ekansh.gupta@oss.qualcomm.com,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250709054728.1272480-1-quic_lxu5@quicinc.com>
 <20250709054728.1272480-5-quic_lxu5@quicinc.com>
 <2dfb6c0a-df7b-4039-9a65-0f1036752bbe@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <2dfb6c0a-df7b-4039-9a65-0f1036752bbe@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA5MDE3MiBTYWx0ZWRfXyZNX+X+t6mRj
 BP7sC5fy0qxrva9OP5pwzTSzGGn0KGP5UJGjZ96l2Qr1ILlaY9owx9s9+ybXyv+ZWL6LKbUrp43
 OmVDhcYtLOV3JNUqE9Lc/cvJlQ8/MED9ANaKGVL5Q/QNTI9GhGqmkJfr3lXmQLv01pBy6FvpQHT
 BwHzBzGuCDGHQ6twhlRRopuIOCQwZkGbVBAXfyMlpN+s9/s+3sHOauhswE6fH0jkmnTgnZFcylj
 kUanXhBfJgqdXwicBCaNuoux9R198/707duLbZ4S8Dxc+l1u/1R6hrNu9xOuK08/3WoEBZK+4pm
 SLyhsSyXiAJZxZxPUaQUoEUfN052adnQXOt7+eqZP+VcWXodKDkkucy3fkGhbJV/bvPyYj+PYzZ
 MEwdlxFt2qnHc2ZHQdg18Gn2ARNtO84Qt+dU5Ovb7obes1IpMHVQarU7cuT89c7111GQ0foj
X-Authority-Analysis: v=2.4 cv=dciA3WXe c=1 sm=1 tr=0 ts=686ec0b2 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=TB6GD4yhWxgz3a-1klEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 3z1XHHnPBc3mdeN0KKAP69dGs9OvkcX8
X-Proofpoint-ORIG-GUID: 3z1XHHnPBc3mdeN0KKAP69dGs9OvkcX8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-09_04,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 impostorscore=0 phishscore=0
 mlxscore=0 mlxlogscore=999 bulkscore=0 lowpriorityscore=0 adultscore=0
 spamscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507090172
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

On 7/9/25 7:52 AM, Ling Xu wrote:
> 在 7/9/2025 1:47 PM, Ling Xu 写道:
>> The fastrpc driver has support for 5 types of remoteprocs. There are
>> some products which support GDSP remoteprocs. GDSP is General Purpose
>> DSP where tasks can be offloaded. This patch extends the driver to
>> support GDSP remoteprocs.
>>
> 
> sorry, please ignore this patch.
> I haven't change commit message here.
> "Extend the driver to support GDSP remoteprocs."

How about this instead:

Some platforms (like SMabcd) feature one or more GPDSPs (General
Purpose DSPs). Similar to other kinds of Hexagon DSPs, they provide a
FastRPC implementation, allowing code execution in both signed and
unsigned protection domains.

Extend the checks to allow domain names starting with "gdsp"
(possibly followed by an index).

Konrad

> 
>> Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
>> ---
>>  drivers/misc/fastrpc.c | 6 +++++-
>>  1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>> index 85b6eb16b616..d05969de406e 100644
>> --- a/drivers/misc/fastrpc.c
>> +++ b/drivers/misc/fastrpc.c
>> @@ -27,6 +27,7 @@
>>  #define MDSP_DOMAIN_ID (1)
>>  #define SDSP_DOMAIN_ID (2)
>>  #define CDSP_DOMAIN_ID (3)
>> +#define GDSP_DOMAIN_ID (4)
>>  #define FASTRPC_MAX_SESSIONS	14
>>  #define FASTRPC_MAX_VMIDS	16
>>  #define FASTRPC_ALIGN		128
>> @@ -2249,6 +2250,8 @@ static int fastrpc_get_domain_id(const char *domain)
>>  		return MDSP_DOMAIN_ID;
>>  	else if (!strncmp(domain, "sdsp", 4))
>>  		return SDSP_DOMAIN_ID;
>> +	else if (!strncmp(domain, "gdsp", 4))
>> +		return GDSP_DOMAIN_ID;
>>  
>>  	return -EINVAL;
>>  }
>> @@ -2323,13 +2326,14 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>>  	case ADSP_DOMAIN_ID:
>>  	case MDSP_DOMAIN_ID:
>>  	case SDSP_DOMAIN_ID:
>> -		/* Unsigned PD offloading is only supported on CDSP */
>> +		/* Unsigned PD offloading is only supported on CDSP and GDSP */
>>  		data->unsigned_support = false;
>>  		err = fastrpc_device_register(rdev, data, secure_dsp, domain);
>>  		if (err)
>>  			goto err_free_data;
>>  		break;
>>  	case CDSP_DOMAIN_ID:
>> +	case GDSP_DOMAIN_ID:
>>  		data->unsigned_support = true;
>>  		/* Create both device nodes so that we can allow both Signed and Unsigned PD */
>>  		err = fastrpc_device_register(rdev, data, true, domain);
> 
