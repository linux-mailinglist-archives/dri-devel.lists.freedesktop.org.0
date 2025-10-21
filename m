Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33595BF72FA
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 16:55:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E76E10E60E;
	Tue, 21 Oct 2025 14:55:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="CThwJifK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41ADD10E612
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 14:55:32 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59LEqS3H000303
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 14:55:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 EuqY3bfbH5YoiQUQa2jMYCjJZMSP7fnMBrdloP5W3DY=; b=CThwJifK34VHfTVf
 EBIEF7M/jUf+MPBkR9REtoDxULMwiFi3XQx3Dp+nBoxs4H9G11XyErwW4AhBPhih
 Cj0oHbeT5Y2/H6uoCXGLmPkvDs+qgr/NEznIG4/PIR01kZEVnQvZRJ5tNiLAOyL5
 2OOnf3brrb7Soe+U88KYX+l1FUhf6L++dO+F6Xmjvxct92G2Q2J0I1hyN2KHM0/4
 ngYvzS/AiHP0p77P5O5EC7vKBbiY+l0YruaYwHlx14eFURHB03dTbDROtVVWXhzv
 5MpSNxroghi5nCQDo5JtCUyJJafDwjzRwHxtgjhrqXXQU/X4Dc2mcQj0oNFIwlqH
 9iF6+g==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49w08w6r02-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 14:55:31 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-b5edecdf94eso8109592a12.2
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 07:55:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761058531; x=1761663331;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EuqY3bfbH5YoiQUQa2jMYCjJZMSP7fnMBrdloP5W3DY=;
 b=wYLnQFkukcY7VuAhp0d8SQXH0+Cyyr5KI3EL8xBmqDd+dIc8saGDv5R53gBB+mmi5F
 knan4zMj1AdfZyxCsGsTwiVPCXVsjkK5Sp3aihcTW7bR+k9tLh0t9SZRylCaeq6P55fX
 3OlIntbbSKRqaf9cetBmE3MMtDGZXlW9YeZm1UkHDR2fjRDxsboghQqBCwDeB1A2N/uB
 mpgzQPpwhOh99LEFsNmnTtnH81VEdW8C9IXIFye5Q+CFWdeOhGbfz5+NVbcwXjoxu/87
 mYwAsDQGz3VI2ehPcyuXNcNQIBmr91PsgPXWG2/i9VESxdb/4q5uIJR6IEO7/5wtD3wv
 VZcg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUilt6f34vtidAyl10mz0V2r+mYS6514Ys9xEXciYpVV+esLlcliHftx0jpjt+9rb9e4Ikmjmo3DAQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzMwAkEtK5fa3iYgAgF04b//281vrrQyLJvmA5novTYgvqFz1LW
 io54WFUzcGZvpNG7y939HzGbjYvD9LQ1xmzgTkMaFU2w9x2OPCFAkHNdXqGN6w+3xm5YBvqPer1
 O5wnMGP6Rh9YEny9arolVBp7soQzoRdpbC0UIeCl+YyomVZjsvgYiRJlelfKhqmFg61+2lts=
X-Gm-Gg: ASbGnct6nOn/V55plKSXlIVw2Al6Zg3zKt6k1cq7X6fXFIxIWiHbs+wZ5m+2jWPqPSr
 XHKAk8v7ZakfJcFRVNhBZOkzWwaCHfiAL5pNL87SiWd3iIkOTTRujUB1apGE/bj0DnRXwLzpS6u
 T/NW/rKO+A7Bs/DEW50KI2aIi3C+Ka/KtktBjG9VNVI74tVcbMCIxKF6GT2g+2zzUKaAWrSzv66
 /gfNy4d8WXO2JpU7A0ZMH/mrPJrLE8EVG4aep6HJ7buuPQ0WcbJCj50gv2bQsGge4dD6phf6iee
 hZ4dj88uGHgrrwZjlgOts3Hj8YgiYEL4HyvczXnqGgO5GVVs/0KxvcMob/PI/UwhmViH88MSOVa
 h6HNTkNOg5/bBSsAv25RFuTrUSC38LFlHdbNEfvuCW3GmtyKp4DOt
X-Received: by 2002:a05:6a20:e291:b0:307:a015:37ef with SMTP id
 adf61e73a8af0-334a84da469mr22755789637.20.1761058530690; 
 Tue, 21 Oct 2025 07:55:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFV0RTQTI+lYELDFbPD1hzS1fN9mU48VY3a2lFLELHCNGnrke/sMJ7LbalWtGCVVG6KnI8hfQ==
X-Received: by 2002:a05:6a20:e291:b0:307:a015:37ef with SMTP id
 adf61e73a8af0-334a84da469mr22755744637.20.1761058530174; 
 Tue, 21 Oct 2025 07:55:30 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7a2301211besm11480597b3a.68.2025.10.21.07.55.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Oct 2025 07:55:29 -0700 (PDT)
Message-ID: <bf77d882-7ab4-4271-a47b-ec0b86d19f91@oss.qualcomm.com>
Date: Tue, 21 Oct 2025 08:55:28 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/ivpu: Remove VPU_CPU_NOC_* register access from
 NPU6 onward
To: Maciej Falkowski <maciej.falkowski@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, karol.wachowski@linux.intel.com, lizhi.hou@amd.com
References: <20251021142005.2216776-1-maciej.falkowski@linux.intel.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251021142005.2216776-1-maciej.falkowski@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: a_9d6B7QEgihsB_HKwWk5I8n8izkZFwz
X-Proofpoint-GUID: a_9d6B7QEgihsB_HKwWk5I8n8izkZFwz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE5MDA5MCBTYWx0ZWRfX9vS/DPtbhe8H
 1ZU+ZMYBZCzigbnx0WbqQZFtJA6ALVD9lsyn4DUAGXPqT124aZs2GEIErG2aTMXki6oNmX6OJzw
 quR8Q3nV2mwyGdrejVkEQoWCifQBURd7Cv2pYA/KY1KgbC7c51Bu1zl+RFOzQbNB+l1GxxzORHL
 Z03oG+6dfCr4dmhYRe7GqyInQC9a04V/+VqipR9qlodpqbNjK9Wcg1bpKPh2PhSm2lusqixlMcc
 JMksYqpIdoq2X25d1gcnU8UMYqa7sywUzK9RYvX3KcwYVui1+oqK5n5HiE5QQ7yBapsbpDZYoo0
 6FMQ+rlWKPZ9VseiMjOaY4t2rZ69Hbu/6caVaCx904blWTNHStk2b+cc0lIzjtBnmORrjAJcZfr
 nDwqqqwPfIC3ec2PADItssFlMA+BIQ==
X-Authority-Analysis: v=2.4 cv=V5NwEOni c=1 sm=1 tr=0 ts=68f79ee3 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=QyXUC8HyAAAA:8 a=DUKoSKCn-cnQhxFrJNEA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-21_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 suspectscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510190090
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

On 10/21/2025 8:20 AM, Maciej Falkowski wrote:
> From: Karol Wachowski <karol.wachowski@linux.intel.com>
> 
> Quiescing TOP_MMIO in SOC_CPU_NOC as part of boot procedure is no longer
> needed starting from 60XX. Remove soc_cpu_drive() call from NPU6 onward.
> 
> The VPU_CPU_NOC_QREQN, VPU_CPU_NOC_QACCEPTN, and VPU_CPU_NOC_QDENY
> registers are deprecated and non-functional on 60XX. They will be
> removed in future generations.
> 
> Signed-off-by: Karol Wachowski <karol.wachowski@linux.intel.com>
> Signed-off-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>

Should you just squash this into "[PATCH] accel/ivpu: Add support for 
Nova Lake's NPU"? Feels a bit odd to introduce an issue in that patch, 
and then immediately fix it.

-Jeff
