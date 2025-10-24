Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A15EC0849C
	for <lists+dri-devel@lfdr.de>; Sat, 25 Oct 2025 01:21:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E10A10E227;
	Fri, 24 Oct 2025 23:21:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="NwB8HaNO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 866BB10E227
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 23:21:23 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59OI9PTn028664
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 23:21:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 uDqcLOKZ2Kzw7eWCO1bcjqMp8O6sHD9pWo33HyB0QU8=; b=NwB8HaNOTTlfQ/Ub
 3HIlqL9ywZrR4E+5Ju8b1XBN6mt4t5XLLodojpERXk16wviOb+dy3jOGTCWhVggN
 TqjguWbZTHYrGsogq2HdmqjcI7jyEtici1eeAPNIBfZZRgKdESAy38rJBVg0X2HV
 +vl3gl1quc0Y5JnCrR8nV6sa1KvYHLshlwpkyKgY/hq+VSuMhGaXRVTA9mJ1Ntas
 zH5X2XIGnWVU5Rc1MjsU3LGX7jODnJfgZxzeakaUq0aef/QdN37UAllJ95VHn5KI
 DRcMnPB9hsJFh8UFo/OsG492k6BM9pEE9ejy0dYROkt2eppyNAf9TbVDWRh2Z/ID
 rfhv8g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49y67qqg2x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 23:21:22 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-27ee41e062cso29146415ad.1
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 16:21:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761348082; x=1761952882;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uDqcLOKZ2Kzw7eWCO1bcjqMp8O6sHD9pWo33HyB0QU8=;
 b=APNWhjqaKlnHwmJiQJqrdavAfYbmNH8pfCzDltzSwaHydgC3+mTWw7fd6sWFGsVB8U
 TEQfxPNqMLkalTVsYi+jYL5R+x3lvRBp3capS22kQ36nuo8KWrnSZf/xHDir62oaXOKb
 yWIozpSVznwOreoq6+qfN5fC5MkP9L74WsQJyAgVF8P9plvKjdvaPKYDZ7ALIojG9FIB
 5fE6sAX01tl0Niul/0HzG7XbASJpkYZn+1veUssFgGDvPK2q5uzU20rPlzC3RmZwNxf6
 eY1Qt1D+uLdadMW6kIqjyzH7cqz5dOjAHn1DyFSJ0TDGDkCqwiV/+6lzwab75jOfh7DG
 T8hQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxaialu7GTXkWnMpX5HMju7iw3Tx0Av11bMjs+sJNGiymxiaBerxfrfJjMyKCJpMGRC3dGKQOJEi4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxTXmXWyMCwxNUsqYeHPuWTlhp2TYgD9QIT0DR6ff5w+Drro9kW
 WTQN8ezWGyNtvHW1RwRnp8UhgKdSKYVD+STToC6lzzY4bRU1JaHKixq83fHBoZ/2HAU9kXPh5+j
 mMCUd6MUKNNmZQUVDztdgwptTdRyu0xQAp+y8CKTMTkv4tjjnhOD/NADNlJyP+GK/0/Nthsxw3J
 jhJss=
X-Gm-Gg: ASbGncuz4mkitLaX47UA7wbc2NMUQmjfNaAT4i8H9Orx4GKocVFjZS/8Xb5aLXa61zi
 8ahfFzOoRYzUjsyCEtrvSvlUxMYBWzwLe3dox+yNx2P3dE8ZsuVL3PfmtXQiHoLivdTbKTygdoI
 nildaHAu7uWDjBTmzcSZP3jnVP2L3Oh8xFxVLgXCV1Xhw1LVB1ILJaKSmYohWZix2fPATM2k/9x
 lNGPxBnQxjPHT07ShKvnHCZtv/UhdlxALkBcctW29I7iQYF9tqTjcrQKEnee4yrlc9LdniJqQ0S
 wOpIi56a0lyc/g4LtG9bT92vRC4aQyL65jPTGZC61ZS/7dHJGvC1OVZpS3nwXsma3HOkayLkZV6
 jnWNOBh1cJ1leogAXK/QfxcGtbXiU6a43jDlzb9iArwv4NIYjig+VhE044zeUYg==
X-Received: by 2002:a17:903:b90:b0:290:bd15:24a8 with SMTP id
 d9443c01a7336-290c9c89fa6mr368110435ad.11.1761348081892; 
 Fri, 24 Oct 2025 16:21:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFk8f3rGYSNCtqBevn0HZr4TBUjj09QsiyHXYq9V5eCQ15z12u8l7vHIA8AOCi0gWJS7Ps+vw==
X-Received: by 2002:a17:903:b90:b0:290:bd15:24a8 with SMTP id
 d9443c01a7336-290c9c89fa6mr368110165ad.11.1761348081421; 
 Fri, 24 Oct 2025 16:21:21 -0700 (PDT)
Received: from [192.168.0.43] (ip68-107-70-201.sd.sd.cox.net. [68.107.70.201])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29498cf3465sm3952055ad.1.2025.10.24.16.21.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Oct 2025 16:21:21 -0700 (PDT)
Message-ID: <0389cc8b-299d-4768-81aa-41fadb9f0a82@oss.qualcomm.com>
Date: Fri, 24 Oct 2025 16:21:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] accel/qaic: Add support for PM callbacks
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
 jeff.hugo@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
 zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20251024162916.801196-1-youssef.abdulrahman@oss.qualcomm.com>
From: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20251024162916.801196-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDE2OCBTYWx0ZWRfXxXPrt8Xg0IwU
 f38xkhnR2GhHkgurSgWspUH5HkC6nhQ6E+qYYk0tsN1cOyCpVvz21GA5dELWhtO+syZvvp7CYPm
 O/XH5JSM1k5h39A5rMU8Y3WvRqJxLZbSpeehL1+NwmkiPbmEGXJXOf/X/CL1k+BlsEXuVLZU54+
 vfQxP8IAoF6q2RSwsNWtVL58Jubi63yOt3rQOO+Y5e3WHfkU4rIO+sVVkSey2TwoN4WbFCHmK9I
 Q7Aiw4xuNJiNBMlmrlltZ6D92WVDHvr0w7vBPTLij4kbfDA5ZAs2cJoF6KOotdpQ4SFNn1cCjIs
 pnJwBe7RR0/NAYgVw7YDZqx97CGFKI0PKHPXMc2n7V1fQeQ50gjMiyrJa0Vbz4VUW0CpotnrIoz
 khzLCPQO2N+aTw6e4ZCNv0GEsbePQQ==
X-Authority-Analysis: v=2.4 cv=LMRrgZW9 c=1 sm=1 tr=0 ts=68fc09f3 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=5tLIbcgRqjftBxpLK6l6Jw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bwFRUYIpjFZDIrCVu9QA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: JYF5_bBI-B3YsorOpflZbibIosMq_rH6
X-Proofpoint-ORIG-GUID: JYF5_bBI-B3YsorOpflZbibIosMq_rH6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-24_05,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510220168
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

On 10/24/2025 9:29 AM, Youssef Samir wrote:
> Add initial support for suspend and hibernation PM callbacks to QAIC.
> 
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
> ---
> Changes in v2:
> - Guard the pm callbacks with CONFIG_PM_SLEEP to fix openrisc build error
> - Add __maybe_unused to helper functions used only in PM callbacks currently
> - Link to v1: https://lore.kernel.org/all/20251022204005.3888195-1-youssef.abdulrahman@oss.qualcomm.com


Reviewed-by: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>
