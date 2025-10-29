Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66977C1D0FC
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 20:52:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16FFF10E203;
	Wed, 29 Oct 2025 19:52:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="X9Oa4rgS";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H7uebr2V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 614D810E203
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 19:52:53 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59TEhPtS816774
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 19:52:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 LQg3wvS+BrsupbCcSvJ+Az/e3U8wGW8Py1YTo1tZqrs=; b=X9Oa4rgSoEd75Aim
 9Sa6YdrpFZL/g73Gj+ktYihZwRjPKTI29YALAaZuAh6w6nzWYWK5vcfKhKzdjmuC
 dNwzggTcZES9ytobTkiVlb4MS0Zmxzeq5OPuIi5WKSvTq+4jIFAo86jQaPTCtxdo
 1pfGohINq3xD4oJ3hsS57JKND9LpKdzUIudW3W7hrbqOywFKystx7Dvx7Gmcra5k
 p9r0edmVVLzPri9wSaTcb8GcAyeQ5b4mO+jtrFZhC7V/W15TMhPmFyaC0Xn0pcTj
 NKzKHm5KOVWaw8XasCJ0vbpzH847ypybPsy2feYfugVEVxPQ2d+NYzoaDwEe3wxL
 y7MIFw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a3mxgh0ct-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 19:52:52 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-7a27ec82624so186697b3a.2
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 12:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1761767571; x=1762372371;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LQg3wvS+BrsupbCcSvJ+Az/e3U8wGW8Py1YTo1tZqrs=;
 b=H7uebr2VuaPb8A4x/NpE8xeHzZU0BsKsL7uDEIED+ifI0EOV5CJ9nlDP21oA9yO0mx
 lkL49rFfU00h3FWvFvO+LxaEet4NGLqj39eyeNoKEE/Duf8Uh4jDe9vvE1cpoyNm8tsQ
 /PuoBWoJEH+BALOogo0qdgMLExXVCUwlhDeuat+dLy1GY01q/wsEi1zs9GFE2y9SgXdZ
 PydfWPf/17TdOYkxtLNZwUYKMuxZPeiz0DqL74CaaonTEjXMCnaqvTXqMmQbe0YQZ0ba
 Rkmn9Aa/dLqgGc8w5YLW3se49i2DOlQspLPwb9+R+HgNQGJuj2dAqXk2igIDKuvb9vLu
 5n0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761767571; x=1762372371;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LQg3wvS+BrsupbCcSvJ+Az/e3U8wGW8Py1YTo1tZqrs=;
 b=T6Z6+JGZb0S/Cs/dkTcP7aBhTk72sIOJTEdT4EkTHqbal6/okgqVMITyflGp4JjkX+
 4PZ9g4QwVbS3YrGcs48GzZz2n++P/PxrkWOQ/7IjMQw5/cn4SCNVAe0v5szwFaSvIRGM
 TmSpuJdlWQ4/PKN03dbhvYcNY/7lEiZT8huShEfsdRLQPRAkduR0m3YmmKbzNfSbFsY4
 G9QHjOnt8wOU6O0YWsz3bbTcaf6Eq/yIjk8OIZrvDx/UXNvg/G+SzykZfXlIJubVeo/o
 Qdu3eV/Ja90qIzC73dnwWyiCwTIrWc0h5BdIsnlyOrUccqkYo5OdN11iT3nUgSmWkHjj
 CqGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+5Nu7lyCXy0Gs1MnaiPFNKlXj2bmBUt4HEEkwaZyQ/l9QVzK9GrATELCuJcVGhSq1ANyC32cMito=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YysidksD2kpUp/xNQZ9ffOZDEaMC5QTMkbmmRwpJmfGJnnHo2jS
 Ps0aPl/URGzTSEJKadwXm6T5BoIn9YVrJdSV28nYQffkZ+mIjMT+4J7JFRTTHaINLBEucMrBTqx
 jYquMIr91liTGCWCZS79jaDGLi+iWKezQd1iHZ+FZa6py4qSMMTjghSKiEsWmjyCi8pMK5ag=
X-Gm-Gg: ASbGnctZAkRv4ctKaYKJcVBosAvAFaoQL8HbcI00CrJnirSo6vzqHjzPwSs8nL2B14/
 5Niy/IZGoHAqlA8OUxWP7821wL4XCg5HT21qboQSemIe1CCqjmA60aledc98B5iR3iLdCbFeX3j
 Yfk7jijUINAhjIYTz6dNpa9LXAMDlNBfK/dOgtGsK6s6sVZSwEjPR0fQryJvXxK+tPrewhsDlq0
 07ZJQmHI82hpTcMEWsGf0bpCGhdgnJuh8Ejqd/4wR8kiS6odeJ7/th1LagAfw2ly1IciD6XAnN0
 0ywE4EttbSdveB9ry5msEO2BPry6coOuYmx1tdUcvLyhxWrLGx0N/52ux3nt9FOLp/bdaVJcjLb
 bvitxpPkd+sPWE6YLFR70HwjIYVIDWwGOZn2ELpPoYb4bcv1oOF4m
X-Received: by 2002:a05:6a21:33a0:b0:334:99f9:ff57 with SMTP id
 adf61e73a8af0-3465381373dmr4835001637.47.1761767571330; 
 Wed, 29 Oct 2025 12:52:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFVXIlP8iJk05MDUIbV/OZBX/DWBwTPyeefjNSN8d30FSKAxDpf4okH2MFHP/vXc1TtBWjDzg==
X-Received: by 2002:a05:6a21:33a0:b0:334:99f9:ff57 with SMTP id
 adf61e73a8af0-3465381373dmr4834968637.47.1761767570856; 
 Wed, 29 Oct 2025 12:52:50 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7a5380f2c9dsm3184068b3a.29.2025.10.29.12.52.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Oct 2025 12:52:50 -0700 (PDT)
Message-ID: <5fad073e-22fb-4de8-b990-aab43fa53417@oss.qualcomm.com>
Date: Wed, 29 Oct 2025 13:52:48 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/ivpu: Disallow setting sched mode HW starting from
 NPU6
To: Karol Wachowski <karol.wachowski@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, maciej.falkowski@linux.intel.com, lizhi.hou@amd.com
References: <20251028070722.135236-1-karol.wachowski@linux.intel.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251028070722.135236-1-karol.wachowski@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=AuHjHe9P c=1 sm=1 tr=0 ts=69027094 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=QyXUC8HyAAAA:8 a=RBZIkd3ggohg0iYyZy8A:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: qazbgbSrFJrfXiThwVDH_WfPERiRGp8o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDE1OSBTYWx0ZWRfX7BqvEWHUhV0J
 eTeKMJ7lg28AondVHIhJIQbjLaA47R0yCjbC4XYnMX/LWsSFPOmP6mfzGVXApjomz1kQOw9/+zn
 huiLFUFNWZQ+Lwg+ycxe5/6MgRDiiKisA5FpgP3CSUvKOatxBG4FIn53wKSRn2TSNmIzFy6Bp/r
 SyovIzB2bAl1ENolcfqXo4RQDQ1OeuJXz1+Oq7Qerns0g2863QR19DlXQd1u5CWZWWgfmSZcdFh
 T0VRW9HvLJVMZGf9vQ8QzMR5X7Oba6NVPRKKWjZbM2oloprO+dtahgEloDyVP0aSkkzdhGg+v0c
 71yiHXc7EqNGfzcqQst7EaMd/lkeUV0fjdVc7PENBVMy2nGt+vYiOB2venfCfVvngH0J21Tzifb
 ysBT4UYATx/DjD1W2f8QfyZY7Nx69w==
X-Proofpoint-ORIG-GUID: qazbgbSrFJrfXiThwVDH_WfPERiRGp8o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-29_08,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 suspectscore=0
 phishscore=0 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290159
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

On 10/28/2025 1:07 AM, Karol Wachowski wrote:

$SUBJECT suggests that HW mode is disallowed, but the commit text says 
OS mode is disallowed. Feels like the subject has a typo, or is 
confusing. Everything else looks ok to me.

> OS scheduling mode gets deprecated starting from NPU6 onward.
> Print warning and fallback to HW scheduling mode if OS mode is
> explicitly selected with sched_mode parameter.
> 
> Signed-off-by: Karol Wachowski <karol.wachowski@linux.intel.com>
> ---
>   drivers/accel/ivpu/ivpu_drv.c | 2 +-
>   drivers/accel/ivpu/ivpu_fw.c  | 6 ++++++
>   2 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
> index ca68730dee88..b305effcf003 100644
> --- a/drivers/accel/ivpu/ivpu_drv.c
> +++ b/drivers/accel/ivpu/ivpu_drv.c
> @@ -57,7 +57,7 @@ MODULE_PARM_DESC(pll_max_ratio, "Maximum PLL ratio used to set NPU frequency");
>   
>   int ivpu_sched_mode = IVPU_SCHED_MODE_AUTO;
>   module_param_named(sched_mode, ivpu_sched_mode, int, 0444);
> -MODULE_PARM_DESC(sched_mode, "Scheduler mode: -1 - Use default scheduler, 0 - Use OS scheduler, 1 - Use HW scheduler");
> +MODULE_PARM_DESC(sched_mode, "Scheduler mode: -1 - Use default scheduler, 0 - Use OS scheduler (supported on 27XX - 50XX), 1 - Use HW scheduler");
>   
>   bool ivpu_disable_mmu_cont_pages;
>   module_param_named(disable_mmu_cont_pages, ivpu_disable_mmu_cont_pages, bool, 0444);
> diff --git a/drivers/accel/ivpu/ivpu_fw.c b/drivers/accel/ivpu/ivpu_fw.c
> index aa032b39dbe3..48386d2cddbb 100644
> --- a/drivers/accel/ivpu/ivpu_fw.c
> +++ b/drivers/accel/ivpu/ivpu_fw.c
> @@ -144,6 +144,12 @@ bool ivpu_is_within_range(u64 addr, size_t size, struct ivpu_addr_range *range)
>   static u32
>   ivpu_fw_sched_mode_select(struct ivpu_device *vdev, const struct vpu_firmware_header *fw_hdr)
>   {
> +	if (ivpu_hw_ip_gen(vdev) >= IVPU_HW_IP_60XX &&
> +	    ivpu_sched_mode == VPU_SCHEDULING_MODE_OS) {
> +		ivpu_warn(vdev, "OS sched mode is not supported, using HW mode\n");
> +		return VPU_SCHEDULING_MODE_HW;
> +	}
> +
>   	if (ivpu_sched_mode != IVPU_SCHED_MODE_AUTO)
>   		return ivpu_sched_mode;
>   

