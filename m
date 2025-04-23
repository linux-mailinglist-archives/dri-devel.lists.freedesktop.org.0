Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 027C4A98CD1
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 16:23:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EED9E10E6C9;
	Wed, 23 Apr 2025 14:23:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="CbEXpanR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22C7A10E6C9
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 14:23:21 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NAYxUS007939
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 14:23:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 4KOCGl4p/xdbjnQHlxOl1Ijrb+ri9reqHorpcrR18Q8=; b=CbEXpanRVH+jOyZq
 bUEAoLOcoE9U13Bgu/SwM3xxFtZw62bAtSA15reZxsZe2MKvCkyQXZu8Ff8I7NWk
 /APsEPm6V6goQzmlgw1+w91Ek57TzjqXp5Uq4JeeYUfu7waQIiYOtVp4n6NpOITw
 ZmhxiSB7YErEiedi5TCTQHzO3lRYHSoFTssY0MKgcxyELko1qdwc3uuHTlE65ywH
 ZVD9zZ07VLLkvduUKcJqJNIUAyWZdMTnmTkmeZni6zDPASiMvxan663zAEmSQmfp
 IIV4QdEWyXNNao2VOOCfxZ0ZOGI/uCyZEMzG4AAM00+HpQu+HIyeRhck0ddC7z6B
 0rpmCQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh5adae-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 14:23:20 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-7394792f83cso5046002b3a.3
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 07:23:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745418199; x=1746022999;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4KOCGl4p/xdbjnQHlxOl1Ijrb+ri9reqHorpcrR18Q8=;
 b=mbA5vMaZMDkZgjwLB75W6IVjZ5NgOK+l883EwYxllzOaHN6bkLLJBKcwyLnmVtLa3A
 Fc9yDrVymWieEN5qWUOggYeUhsTSo0QLehzQdB+TlaFBMiyuZfZnFeoUYWMDoICzVG07
 M65gNySILDBKnYOXvsbdRpAiYBVmWrXFCiiKCmwcsBudB4KGB/8D7Fr32+53N/zVOziq
 +4ZVQ9j1UgNO1tC/N5vZuF5OMRWGbunf2FU+B5rAB1ouA7M3W8EJXpAqJ5sCw1KYl0JP
 b8QieMv1shd6nSnZyNkT8kOWWhLvOCR3vDxxPnB3XFPhGzeGjQAXVnipdZJiiViff9pd
 fqEQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVAzsICIU6KaTU/j8uSY3OIWhooPccdjlOXSuca7KlcCCVunXb4Y9S5OTMBf4O/5KxryD/cTn9zLew=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxvu313hnLCbPnGR6MznqL/8Pk58ffymyueR5a9kbjCcYzl3S4l
 LcciKMVkTW+CS9Ei+XD37DSq5BxMNvZGltLszYeB4AdWsO6490ISx52n22niJMMP+FjyoBa3KkP
 ASLatPHuJBQoJoxS/CyMeXhbVsGybHRrYk80065cLgi5zxLKbzAru2X0+mwuV7GVVN9M=
X-Gm-Gg: ASbGncsdUjHpLEvW33STJ0StX+Y0n5+5vN+DzkVDT/XiyDmCN9pDX86ElPFagebMEmA
 fC62RkJEh9k14aFpBEFimGeL4pwSqNjIKuqWCEkAZT539OAMpCgL0gnjAy4lbnajcbhJsyfVN9S
 Q8TETE4+ftTh5ynLdvmX7adqbxSSd7p3i26du7ATQyMbT0sLFkQPd38MlDFuF158nVFYHdW9fzx
 i14jtl3YxvAQxrMw1bS2EezJM2UzmsdSRCKauwz3J+FyVrVqvyUZXb0YpW6FqtAv96VE/qt3XZa
 JlmbJQCi/rcxSbMhqPJtwRHcp+u0lafYPD9JSJkaneoqtFClVnOK8ry7uZfUOw==
X-Received: by 2002:a05:6a20:c995:b0:1f5:56fe:b437 with SMTP id
 adf61e73a8af0-203cbd375a3mr36319999637.32.1745418198782; 
 Wed, 23 Apr 2025 07:23:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHIXGfBkS8C0F1ZfL0fd94b0Bc2T/hqTL9JoAPmoc8SPK+kEHGj/0qQR7IipZwxfd0en6dfcQ==
X-Received: by 2002:a05:6a20:c995:b0:1f5:56fe:b437 with SMTP id
 adf61e73a8af0-203cbd375a3mr36319966637.32.1745418198413; 
 Wed, 23 Apr 2025 07:23:18 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73dbfaacf48sm10979398b3a.148.2025.04.23.07.23.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Apr 2025 07:23:17 -0700 (PDT)
Message-ID: <ecaeb3ec-8956-48f9-9102-27ebb774cab9@oss.qualcomm.com>
Date: Wed, 23 Apr 2025 08:23:16 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/ivpu: Implement heartbeat-based TDR mechanism
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Maciej Falkowski <maciej.falkowski@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, lizhi.hou@amd.com,
 Karol Wachowski <karol.wachowski@intel.com>
References: <20250416102555.384526-1-maciej.falkowski@linux.intel.com>
 <c6b4aaad-aa5f-4f46-948f-de150dfc60fe@quicinc.com>
 <edbd4421-e3b4-47a9-834e-200faf6fbda9@linux.intel.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <edbd4421-e3b4-47a9-834e-200faf6fbda9@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDEwMSBTYWx0ZWRfX+CXePfdPTxib
 DHRZSOEBY/rphdU6/H/0xm2EtDVWobYdgzNqcHnI2T21q2yGWFyg++3Ul5mFHaNBgPAkFiMAJHZ
 Ykpms8SuPgG5peWjTZ6CBWYeUx84kvpV1ncdtrVp08SufjIcK8LXH8WfHxNdNW6ERAi23TG6G4N
 GH9zdQ0CT5erjJK2H4HY0OgdBGzsump6K6Y3t1jUIxi/0BdUQ2CAoaYGGR8gkklNsV84DialWwK
 MWpc5g5OC0JptBdZydNpuMC+UqNwxDL9nKUogTzzVQXkmRsw73bD1ZcI2HFd5UsJxSshiZhyxKD
 DKwla4AvIi88/sY0h4CV5CS+uVholVSu/0XLBoAvG/jOr/hboaOvEazeVQp5myUr5otcmSajJQH
 p4Pght2eym7kPokvl5X6GIcgQvNT2oHcDAj2UcbVoGNbEFiBkAeroG0f1Rn+Mfz8ti9to3RJ
X-Proofpoint-GUID: qEUOaUC8xpO_4jnYO4e3T8L222_Ufb2V
X-Authority-Analysis: v=2.4 cv=B/S50PtM c=1 sm=1 tr=0 ts=6808f7d8 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8
 a=Ux5JNTxzkv6AlNtDFbUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: qEUOaUC8xpO_4jnYO4e3T8L222_Ufb2V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_08,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999
 lowpriorityscore=0 bulkscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230101
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

On 4/23/2025 1:23 AM, Jacek Lawrynowicz wrote:
> Hi,
> 
> On 4/18/2025 5:27 PM, Jeffrey Hugo wrote:
>> On 4/16/2025 4:25 AM, Maciej Falkowski wrote:
>>> From: Karol Wachowski <karol.wachowski@intel.com>
>>>
>>> Introduce a heartbeat-based Timeout Detection and Recovery (TDR) mechanism.
>>> The enhancement aims to improve the reliability of device hang detection by
>>> monitoring heartbeat updates.
>>>
>>> Each progressing inference will update heartbeat counter allowing driver to
>>> monitor its progression. Limit maximum number of reschedules when heartbeat
>>> indicates progression to 30.
>>
>> Code looks good.  However, why 30?  This would artificially limit how long a job could run, no?
> 
> Yes, we still need a time based limit. There may be workloads that are stuck in infinite loop for example.
> With this patch the max time the job can run is extended from 2 to 60 seconds.
> We are not aware of any workloads that exceed this timeout at the moment.

Infinite loop vs something that just happens to be running long by 
design is a difficult problem.  60 seconds does not seem all that long 
to me.  Perhaps consider some kind of override so that if/when a 
workload comes along that needs more than 60 seconds, the user doesn't 
need to recompile their kernel to make it work?  I suspect that would be 
outside the scope of this change.

For this change, I think it would be good to add some info from your 
response.  I think the commit text would be improved by stating this 
increases the max runtime from 2 seconds to 60, and that this covers all 
known workloads.  Also, I think a comment on PM_TDR_HEARTBEAT_LIMIT that 
tells how long the limit is (60 seconds) would be helpful to future 
readers, instead of needing to parse through multiple functions and how 
they all interact.

With the commit text update -

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>

The PM_TDR_HEARTBEAT_LIMIT comment is optional to me.
