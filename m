Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BFF5C41290
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 18:53:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 641E710EB4D;
	Fri,  7 Nov 2025 17:53:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="dTutqEhg";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RbLroRSr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E37A010EB49
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Nov 2025 17:53:49 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5A7DPQXH3129784
 for <dri-devel@lists.freedesktop.org>; Fri, 7 Nov 2025 17:53:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 vDu4LquDYbCXg/gjVsJ2LPTxaSnh0taMI7ccEl+/wdk=; b=dTutqEhgfL0pRnRa
 /au75FIAkEMbWWBlNvFhFq2IDL4P5NPOdiU6hAUQsLHMXiZx9qtOU+x984Bycf5f
 l0a+Tr53IkSe4LP3qZ1OionEcVPUPNeAiC8Ecqyx6fChwFa9RmdSAF/mXLqbPxo8
 DZLQZigWWvQh2Z6gNwTjVyaqbBU/hey99DaesHuFH7hZ9u5xz5fOi0XppqmoBm8P
 KJjVnR80EVsuewWmmUbmiQTHjxLns0fjSSCwLQcVn4iYLq4oVt5Pmki5OHsd7ZLI
 ux36CMwOp+FuOuTuzZPdM8tjz+q8qzSF2Qpu9G0yn00awjuuAtPdpkywpMkAlX8z
 LavGtQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a9hn08rh5-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Nov 2025 17:53:49 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-3418ada9e6cso1233705a91.1
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Nov 2025 09:53:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762538029; x=1763142829;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vDu4LquDYbCXg/gjVsJ2LPTxaSnh0taMI7ccEl+/wdk=;
 b=RbLroRSr1MSl4di6/XGIpQG1IfufMJ7+Dp/d3EU1TZMRNDHHgY1aThKJaa6WzEz/N+
 7NsvoJpXRXEmvvhexM1u3+t6TzNyYXSsE8OkZI4O5Kx0BL6LIU5k82fdOsxyN+/j2BlW
 cKNmxnraQPjDiFH55trcr/l9/5FTrZpNwc9AiOKnre27YtmerevEqOj2QTUANZfYWu70
 qWfP/aor9kpiSHNjwDXWBcC72l0QwdDbuDc5ZnflaAHc7lF3ik1aUvh4QHUXpLX2jvvf
 GDXdZJSi0e0IhihYXfaeGcRP+G5QTuoauI7WAPVNwcTv5LxmnODbxRc9MkHNHAjVIGsv
 GpZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762538029; x=1763142829;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vDu4LquDYbCXg/gjVsJ2LPTxaSnh0taMI7ccEl+/wdk=;
 b=driYHxdbNY3LFxiTvzmCD2KDX2yoH/TCKGihYVsHEfsnhsTSIhsYn6WxeZGZhgsjaM
 /ktH9Mbk0xvLKF0w2O4PxA0nywWJ9minVRxnSkDaM5ZsbVxdoYjWzPFRVcRg5ZvgGngh
 ZDrBa7Mk2aer3TmVrzKnfxCrgpggIlbRJ32ohZYYzqi7auvs88k4tu4wUFgOSwDIEtou
 vqf8djIiswOSP1lnpIE8OPj3eh/ICaLQmhuzfH9u/SLf2fSxiMNn07MZRINclhgnpxyU
 A3f6UHdd+y825PXCq1VvK+Ae3aRlqJEMgqcQMyYpACRKO2FIU6KZM0ZAnhf7A4iNKmkr
 +09g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVOewLwacJ0vXrHbSR+80lKUTTVsQ6ZnaS/yyNgNWVwsm9uMC/Dk5+2mzEg12bqrHDB1fSopkFS988=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxPNtExbGwhPzKbqGkT5JqChD7bjPwB/+kQWTIrkeJCIUIArrDR
 QnssUbvmthhjhZ6DccN1dpU3tmn99smnBx6SqVrLQ78aSQDKd7aif3A1sY9tqJiIgpt+apXHOoe
 Wa+7hsrl+8deUweC9BKNpl1yB90a59B//WSkv4s0D6o/ZboyFFyDcPeVXQ0yi8uUs6yVw74M=
X-Gm-Gg: ASbGncsIxaO25EmHTDcgJXeCITOuudJ6c1wCHz1J1V0xSTlkLhb9UfQ4CDGMdVWdL90
 ewTKDL6HcpzyLKs9d8ejcTy9NO36omWYecS7Ktx1tM1S8d/7geQL8j0HIrJjIuez3RpyouJIcBq
 KOs6S+eu+OWnPiwx0/9R+QmUGdDyzCHZ8NsRqPjR6rw/0yq4Tv5p68XGafGUzYhE/EYaNCsFNbN
 5M00IEsO329f86kfyqKWPNVFj+Rq6zCsFXSMSD2Wz07aJlx3yvJ8mz1Xh8fLmAkMagtJuSyx8r+
 af0NQjhjX5elenBdNTC7HgsSFgr1oMmh1lPG5SelNMexVgjAOpDR8VI204p2OJS0p9LjiYLxZs7
 MxytTIZgOvxbLCe2YYdmJsMuuArk1SuL7w8lIu0JPXvYKvTKFZL2Z
X-Received: by 2002:a17:90b:3885:b0:341:c964:125b with SMTP id
 98e67ed59e1d1-3436cbab0aamr7845a91.31.1762538028560; 
 Fri, 07 Nov 2025 09:53:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHIy6+m+Kcij6vt6xRBKl9qnx3FLlJzZPykP0VRDcFrX0sJmh9Kw6gWYAzSNXcrbLBEDZWv/g==
X-Received: by 2002:a17:90b:3885:b0:341:c964:125b with SMTP id
 98e67ed59e1d1-3436cbab0aamr7819a91.31.1762538028061; 
 Fri, 07 Nov 2025 09:53:48 -0800 (PST)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-341d11e2336sm3278610a91.1.2025.11.07.09.53.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Nov 2025 09:53:47 -0800 (PST)
Message-ID: <13f0921d-d018-4c5c-a01b-9d4c89d3a4ed@oss.qualcomm.com>
Date: Fri, 7 Nov 2025 10:53:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] accel/qaic: Add DMA Bridge Channel(DBC) sysfs and
 uevents
To: Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>,
 carl.vanderlip@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
 youssef.abdulrahman@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 andersson@kernel.org,
 Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
References: <20251031174059.2814445-1-zachary.mckevitt@oss.qualcomm.com>
 <20251031174059.2814445-2-zachary.mckevitt@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251031174059.2814445-2-zachary.mckevitt@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDE0OCBTYWx0ZWRfX3aTwh1vDtOyY
 9PqmGUXJeFSLHoNsFz6gRjJpNQxfbvTJ78Jjry7aNHV9B28K+ekfa1JjHgkgTjQvmc/JhH+4DRE
 QASKzjp5SzSfxczQ0uDNcEDwS7GEyo0EnvXJpchMUFL7/1V95QovD2bpY+NwTajws/Ba0pgCfDX
 vrhamdWMXQhHTFKTemjRUJuEdRHW4NJ1brKcXNt44CtGHh0zKMK6Knmp19m3UIhR1VBCbxRLc2m
 TJJEpxK2pA+L+AUyU6J5VMROZbyPlS5t2uCNn1z9t0PeGhvs2jKekWNsZ3pvHzUm54VHQI/S2dz
 8KSQPKNkoV9dAgE4NjXYhK13C5Y7q4AfRk+zqGy9OlEb3F+gfAruO0xWaoFyK/4VnI5FjWQD+pP
 H1fduqxSUqRqayljqh1UVCcD7ct3cA==
X-Proofpoint-GUID: rN4Wm5F43jmc1x_a268zMADiTzhed7kK
X-Authority-Analysis: v=2.4 cv=MsJfKmae c=1 sm=1 tr=0 ts=690e322d cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=zlVAGa64hwdQekzuOJMA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: rN4Wm5F43jmc1x_a268zMADiTzhed7kK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-07_05,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0
 spamscore=0 priorityscore=1501 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511070148
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

On 10/31/2025 11:41 AM, Zack McKevitt wrote:
> From: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
> 
> Expose sysfs files for each DBC representing the current state of that DBC.
> For example, sysfs for DBC ID 0 and accel minor number 0 looks like this,
> 
> /sys/class/accel/accel0/dbc0_state
> 
> Following are the states and their corresponding values,
> DBC_STATE_IDLE (0)
> DBC_STATE_ASSIGNED (1)
> DBC_STATE_BEFORE_SHUTDOWN (2)
> DBC_STATE_AFTER_SHUTDOWN (3)
> DBC_STATE_BEFORE_POWER_UP (4)
> DBC_STATE_AFTER_POWER_UP (5)
> 
> Signed-off-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
> Signed-off-by: Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
