Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C09DC98B8F
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 19:34:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 794B310E447;
	Mon,  1 Dec 2025 18:33:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="hExj3D3Z";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XjabaCRf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93EE310E447
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Dec 2025 18:33:58 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5B19a1mf451837
 for <dri-devel@lists.freedesktop.org>; Mon, 1 Dec 2025 18:33:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 PK2J/iZhIGhQgzf1B18h8BafaLKYvoOEA+mZjvy3e/g=; b=hExj3D3ZP9GDbhVR
 FX7SDSijPr5OC1WpKB2HJInFWN2iAvpISTPy/06wkRQxUHRrAMJf9PeoL/q3A4To
 lRAIDPniYBni2gu0oLR4SEL2Wel7nz628HlTsgb7qGuvo5pkSdY3yzwPuBPD0j4N
 k4Qy0PDQHEfnnRjA4zXMHfeb/BUqh0vLejPaIY+BtgrALx+LGhrsTJNwMv9DktfY
 H4B/dF0OQFmBc/ym8+opkBR5KkOsVpEnaGS1xfI5Kr57UYUJKUJkDq5d7x0/PGGk
 urYnCuAlJJ671cfYjPcf3ZYhJ8uBEtEt6PkE5ptQTIim/61JdReqY321VHxhDliS
 1CkSnw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4as8hesjkd-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Dec 2025 18:33:57 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-7bad1cef9bcso7551354b3a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Dec 2025 10:33:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764614036; x=1765218836;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PK2J/iZhIGhQgzf1B18h8BafaLKYvoOEA+mZjvy3e/g=;
 b=XjabaCRfvEi7fki5r/cqyxFWJR2p/aN4hc9oA3V2ld+QZ88um/IjYmZZDDK5PkZNUD
 fxhKDR/GAnNh/Npw7FOxXfoEZ5ErhwtdKK1+6UbrQFaU1aF4018VwU4/XWal7QHyDiu+
 i8yRqHXc+Q2pme8Htz2H+bT+UUFy9EJtXJnc46vA/lAK3FPcztrmvgztGuSzwfP0yros
 zFO0sqDAU7lHqfae7Pr3FUyvVCx55PjrPjFlp6JPZBHXcHoy5Q6JqVAbd7BsyQ9MWPja
 S9/akSBz6v9WnEDwjyReUec6SnCPmSMGZ9R9fpUQCs7mL4CtwVdLUEvslQteD1mLOzpB
 RTiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764614036; x=1765218836;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PK2J/iZhIGhQgzf1B18h8BafaLKYvoOEA+mZjvy3e/g=;
 b=W6e3HnLg0XrbADHfWx4/47Xk0QVkzRHveFkLPrHO/E5x21TXdc9MXZLob3BWLQr4m6
 EbOy/rtWYrocGTBG36P/NnpUuQn/V57XK7WbOhtihE9k937q4kCanjKgFzyTGu07SY7E
 exd73BF6O8M2XOlTgX8qiNrL79VVyX9NDsGqn0b9zsZHjeBR/UPWdf8KHc/oVX0eks7T
 U6/Nk1v3MRcPVCBNSKKGjA6AvEJdMuahDDQOmjYmh6T+rDKWJIVKZetUK0cw9V0Z2gEW
 07sv8jNgVbLbMIpT+BYP/Csu+lS6rgNI5+fx3d/WAa1+y/KQWrikqvLBbIxf+DD5qJqQ
 NY+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXuUw/Sqwe59p0sIhF1elWr9VAzJ3I6s4ZuioDZMvwzhmnoGURJx+bvFwcg53Iehae5zO+BgfTlxTg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzNluShWcgXLzuherwkJLG5N7mxiJna/97IhBxcgKOXGkTO2duU
 MGe/K8cCXkqjV747kYsPqzO9jvL/MMecEUKn0jZ9aUWLOVFkM0feaFkdyxT1XZPSJt8b7Is69I+
 o3CVh2xIKViiNY2BOPteoMDjvOcPoGA6s6ogxTeCowjQ51efwxIvok37bwi2ARe7NBVr/GrI=
X-Gm-Gg: ASbGncsyyySq8wyWjEfN2WmBUu1GeI8iQrs7epWeg3ooRiyjjpTTMw7n1iKRSu3Ug7w
 FWaB5SaJHRvTv/yQDjfMOs2wcFbnhNoIu9aNdUvt1vOZiGuvX3aZJEXm0YBpmw32KAKhzSrTjgD
 UCUL8JU1WDDvjxKn7cA6w1w100PpLDdUcK7nyyTo2n3Fdg2FXwG0IpDcVIlqMoCqAGVndNpnnht
 EqTae4h8+drhRUAYYLOoyPwWswPj0/hYNxdeY+RwFRcPNiWPxfY4YC7ZDiaIF7LesZHPdmZ5z4d
 HYUkbFqjqahDIsWY6z+bGbN/56omylqlJieHwrFF8/NtHZNbzxiJ84at2hRhdlkmtGeksGsr3zS
 R/Wef6ZLFs27ikH+E84Jnnagbqoe4pK5cge36c8M0pU28Gm9E+X5RwScq
X-Received: by 2002:a05:6a20:3d05:b0:34e:8fed:8a69 with SMTP id
 adf61e73a8af0-3614eb83e47mr42943209637.16.1764614036400; 
 Mon, 01 Dec 2025 10:33:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH33gkVTClU/n0TXeXLHXqy72ak9h2kHhJlB/59JjuSa3S33wdKx9X8wypoiytm8qAbPcPtng==
X-Received: by 2002:a05:6a20:3d05:b0:34e:8fed:8a69 with SMTP id
 adf61e73a8af0-3614eb83e47mr42943158637.16.1764614035763; 
 Mon, 01 Dec 2025 10:33:55 -0800 (PST)
Received: from [10.73.112.168] (pat_11.qualcomm.com. [192.35.156.11])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-be50a04514asm12586283a12.35.2025.12.01.10.33.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Dec 2025 10:33:55 -0800 (PST)
Message-ID: <2dc234d3-3bb4-4d6e-810a-e7197174769f@oss.qualcomm.com>
Date: Mon, 1 Dec 2025 10:33:53 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] bus: mhi: Fix broken runtime PM design
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
 Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
 Oded Gabbay <ogabbay@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
 ath12k@lists.infradead.org, netdev@vger.kernel.org,
 quic_vbadigan@quicinc.com, vivek.pernamitta@oss.qualcomm.com
References: <20251201-mhi_runtimepm-v1-0-fab94399ca75@oss.qualcomm.com>
 <20251201-mhi_runtimepm-v1-4-fab94399ca75@oss.qualcomm.com>
Content-Language: en-US
From: Mayank Rana <mayank.rana@oss.qualcomm.com>
In-Reply-To: <20251201-mhi_runtimepm-v1-4-fab94399ca75@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=LewxKzfi c=1 sm=1 tr=0 ts=692ddf95 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZdW6uxA9NKXbfdqeeS2OGA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=vjJm78u74TUbUCzliFQA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: YoI3c7BkZbDzxpx8qbtoLoP9dGAdwe64
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAxMDE1MSBTYWx0ZWRfX9b7Peiqtn+7E
 qHRTwXH7TFPYd15ECq1ijMPN9mwzat7CqHdKHlKTKyc2tXIrA/vSdMBCqf/pizYnICLUzB32c3O
 6oINguaNHHjZnlINttNJgGx/W+xjUgqdi2X8qXBijhpDVl23YgyXm7fuFsx35g3DJAyA9wbCRZA
 JolVQ+EIeqO+gTU0DiwGpZVR0+391zwBgs6Ci14f6lHhwhn7MJX1g3FdH25OBrgbzfeh6aXf+TP
 1ffNqIx8WePcU1gGvA9PXmuYmNHwGIHQGARYNVY2MtgbZivl3uAWnzN8Mpbrnw99t3RKJopZSVH
 0EIiuc446DIUfNK3a1gFIDiU9j5scZ6Jdlo+ooDnD0KtKOuNE/emeGsgJeDDqgWUVqCIhdTQ7tq
 iemU98ic64avWP3rjmrO9qWVfzQW7A==
X-Proofpoint-ORIG-GUID: YoI3c7BkZbDzxpx8qbtoLoP9dGAdwe64
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 suspectscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512010151
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

Hi Krishna

On 12/1/2025 4:43 AM, Krishna Chaitanya Chundru wrote:
> The current MHI runtime PM design is flawed, as the MHI core attempts to
> manage power references internally via mhi_queue() and related paths.
> This is problematic because the controller drivers do not have the
> knowledge of the client PM status due to the broken PM topology. So when
> they runtime suspend the controller, the client drivers could no longer
> function.
> 
> To address this, in the new design, the client drivers reports their own
> runtime PM status now and the PM framework makes sure that the parent
> (controller driver) and other components up in the chain remain active.
> This leverages the standard parent-child PM relationship.
> 
> Since MHI creates a mhi_dev device without an associated driver, we
> explicitly enable runtime PM on it and mark it with
> pm_runtime_no_callbacks() to indicate the PM core that no callbacks
> exist for this device. This is only needed for MHI controller, since
> the controller driver uses the bus device just like PCI device.
> 
> Also Update the MHI core to explicitly manage runtime PM references in
> __mhi_device_get_sync() and mhi_device_put() to ensure the controller
> does not enter suspend while a client device is active.
Why does this needed here ?
Isn't it MHI client driver take care of allowing suspend ?
Do you think we should remove mhi_device_get_sync() and mhi_device_put() 
API interfaces as well ? And let controller/client driver takes care of 
calling get/sync directly ?

How are you handling cases for M0 and M3 suspend ?
Do we need to tie runtime usage with M0 (pm_runtime_get) and M3 
(pm_runtime_put) ?

Regards,
Mayank

> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>   drivers/bus/mhi/host/internal.h |  6 +++---
>   drivers/bus/mhi/host/main.c     | 28 ++++------------------------
>   drivers/bus/mhi/host/pm.c       | 18 ++++++++----------
>   3 files changed, 15 insertions(+), 37 deletions(-)
> 
> diff --git a/drivers/bus/mhi/host/internal.h b/drivers/bus/mhi/host/internal.h
> index 61e03298e898e6dd02d2a977cddc4c87b21e3a6c..d6a3168bb3ecc34eab1036c0e74f8d70cf422fed 100644
> --- a/drivers/bus/mhi/host/internal.h
> +++ b/drivers/bus/mhi/host/internal.h
> @@ -355,9 +355,9 @@ static inline bool mhi_is_active(struct mhi_controller *mhi_cntrl)
>   static inline void mhi_trigger_resume(struct mhi_controller *mhi_cntrl)
>   {
>   	pm_wakeup_event(&mhi_cntrl->mhi_dev->dev, 0);
> -	pm_runtime_get(mhi_cntrl->cntrl_dev);
> -	pm_runtime_mark_last_busy(mhi_cntrl->cntrl_dev);
> -	pm_runtime_put(mhi_cntrl->cntrl_dev);
> +	pm_runtime_get(&mhi_cntrl->mhi_dev->dev);
> +	pm_runtime_mark_last_busy(&mhi_cntrl->mhi_dev->dev);
> +	pm_runtime_put(&mhi_cntrl->mhi_dev->dev);
>   }
>   
>   /* Register access methods */
> diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
> index 7ac1162a0a81ae11245a2bbd9bf6fd6c0f86fbc1..85a9a5a62a6d3f92b0e9dc35b13fd867db89dd95 100644
> --- a/drivers/bus/mhi/host/main.c
> +++ b/drivers/bus/mhi/host/main.c
> @@ -427,6 +427,8 @@ void mhi_create_devices(struct mhi_controller *mhi_cntrl)
>   		if (ret)
>   			put_device(&mhi_dev->dev);
>   	}
> +	pm_runtime_no_callbacks(&mhi_cntrl->mhi_dev->dev);
> +	devm_pm_runtime_set_active_enabled(&mhi_cntrl->mhi_dev->dev);
>   }
>   
>   irqreturn_t mhi_irq_handler(int irq_number, void *dev)
> @@ -658,12 +660,8 @@ static int parse_xfer_event(struct mhi_controller *mhi_cntrl,
>   			/* notify client */
>   			mhi_chan->xfer_cb(mhi_chan->mhi_dev, &result);
>   
> -			if (mhi_chan->dir == DMA_TO_DEVICE) {
> +			if (mhi_chan->dir == DMA_TO_DEVICE)
>   				atomic_dec(&mhi_cntrl->pending_pkts);
> -				/* Release the reference got from mhi_queue() */
> -				pm_runtime_mark_last_busy(mhi_cntrl->cntrl_dev);
> -				pm_runtime_put(mhi_cntrl->cntrl_dev);
> -			}
>   
>   			/*
>   			 * Recycle the buffer if buffer is pre-allocated,
> @@ -1152,12 +1150,6 @@ static int mhi_queue(struct mhi_device *mhi_dev, struct mhi_buf_info *buf_info,
>   
>   	read_lock_irqsave(&mhi_cntrl->pm_lock, flags);
>   
> -	/* Packet is queued, take a usage ref to exit M3 if necessary
> -	 * for host->device buffer, balanced put is done on buffer completion
> -	 * for device->host buffer, balanced put is after ringing the DB
> -	 */
> -	pm_runtime_get(mhi_cntrl->cntrl_dev);
> -
>   	/* Assert dev_wake (to exit/prevent M1/M2)*/
>   	mhi_cntrl->wake_toggle(mhi_cntrl);
>   
> @@ -1167,11 +1159,6 @@ static int mhi_queue(struct mhi_device *mhi_dev, struct mhi_buf_info *buf_info,
>   	if (likely(MHI_DB_ACCESS_VALID(mhi_cntrl)))
>   		mhi_ring_chan_db(mhi_cntrl, mhi_chan);
>   
> -	if (dir == DMA_FROM_DEVICE) {
> -		pm_runtime_mark_last_busy(mhi_cntrl->cntrl_dev);
> -		pm_runtime_put(mhi_cntrl->cntrl_dev);
> -	}
> -
>   	read_unlock_irqrestore(&mhi_cntrl->pm_lock, flags);
>   
>   	return ret;
> @@ -1377,7 +1364,6 @@ static int mhi_update_channel_state(struct mhi_controller *mhi_cntrl,
>   	ret = mhi_device_get_sync(mhi_cntrl->mhi_dev);
>   	if (ret)
>   		return ret;
> -	pm_runtime_get(mhi_cntrl->cntrl_dev);
>   
>   	reinit_completion(&mhi_chan->completion);
>   	ret = mhi_send_cmd(mhi_cntrl, mhi_chan, cmd);
> @@ -1408,8 +1394,6 @@ static int mhi_update_channel_state(struct mhi_controller *mhi_cntrl,
>   
>   	trace_mhi_channel_command_end(mhi_cntrl, mhi_chan, to_state, TPS("Updated"));
>   exit_channel_update:
> -	pm_runtime_mark_last_busy(mhi_cntrl->cntrl_dev);
> -	pm_runtime_put(mhi_cntrl->cntrl_dev);
>   	mhi_device_put(mhi_cntrl->mhi_dev);
>   
>   	return ret;
> @@ -1592,12 +1576,8 @@ static void mhi_reset_data_chan(struct mhi_controller *mhi_cntrl,
>   	while (tre_ring->rp != tre_ring->wp) {
>   		struct mhi_buf_info *buf_info = buf_ring->rp;
>   
> -		if (mhi_chan->dir == DMA_TO_DEVICE) {
> +		if (mhi_chan->dir == DMA_TO_DEVICE)
>   			atomic_dec(&mhi_cntrl->pending_pkts);
> -			/* Release the reference got from mhi_queue() */
> -			pm_runtime_mark_last_busy(mhi_cntrl->cntrl_dev);
> -			pm_runtime_put(mhi_cntrl->cntrl_dev);
> -		}
>   
>   		if (!buf_info->pre_mapped)
>   			mhi_cntrl->unmap_single(mhi_cntrl, buf_info);
> diff --git a/drivers/bus/mhi/host/pm.c b/drivers/bus/mhi/host/pm.c
> index b4ef115189b505c3450ff0949ad2d09f3ed53386..fd690e8af693109ed8c55248db0ea153f9e69423 100644
> --- a/drivers/bus/mhi/host/pm.c
> +++ b/drivers/bus/mhi/host/pm.c
> @@ -429,6 +429,7 @@ static int mhi_pm_mission_mode_transition(struct mhi_controller *mhi_cntrl)
>   
>   	if (MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state)) {
>   		ret = -EIO;
> +		read_unlock_bh(&mhi_cntrl->pm_lock);
>   		goto error_mission_mode;
>   	}
>   
> @@ -459,11 +460,9 @@ static int mhi_pm_mission_mode_transition(struct mhi_controller *mhi_cntrl)
>   	 */
>   	mhi_create_devices(mhi_cntrl);
>   
> -	read_lock_bh(&mhi_cntrl->pm_lock);
>   
>   error_mission_mode:
> -	mhi_cntrl->wake_put(mhi_cntrl, false);
> -	read_unlock_bh(&mhi_cntrl->pm_lock);
> +	mhi_device_put(mhi_cntrl->mhi_dev);
>   
>   	return ret;
>   }
> @@ -1038,9 +1037,11 @@ int __mhi_device_get_sync(struct mhi_controller *mhi_cntrl)
>   		read_unlock_bh(&mhi_cntrl->pm_lock);
>   		return -EIO;
>   	}
> +	read_unlock_bh(&mhi_cntrl->pm_lock);
> +
> +	pm_runtime_get_sync(&mhi_cntrl->mhi_dev->dev);
> +	read_lock_bh(&mhi_cntrl->pm_lock);
>   	mhi_cntrl->wake_get(mhi_cntrl, true);
> -	if (MHI_PM_IN_SUSPEND_STATE(mhi_cntrl->pm_state))
> -		mhi_trigger_resume(mhi_cntrl);
>   	read_unlock_bh(&mhi_cntrl->pm_lock);
>   
>   	ret = wait_event_timeout(mhi_cntrl->state_event,
> @@ -1049,9 +1050,7 @@ int __mhi_device_get_sync(struct mhi_controller *mhi_cntrl)
>   				 msecs_to_jiffies(mhi_cntrl->timeout_ms));
>   
>   	if (!ret || MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state)) {
> -		read_lock_bh(&mhi_cntrl->pm_lock);
> -		mhi_cntrl->wake_put(mhi_cntrl, false);
> -		read_unlock_bh(&mhi_cntrl->pm_lock);
> +		mhi_device_put(mhi_cntrl->mhi_dev);
>   		return -EIO;
>   	}
>   
> @@ -1339,11 +1338,10 @@ void mhi_device_put(struct mhi_device *mhi_dev)
>   
>   	mhi_dev->dev_wake--;
>   	read_lock_bh(&mhi_cntrl->pm_lock);
> -	if (MHI_PM_IN_SUSPEND_STATE(mhi_cntrl->pm_state))
> -		mhi_trigger_resume(mhi_cntrl);
>   
>   	mhi_cntrl->wake_put(mhi_cntrl, false);
>   	read_unlock_bh(&mhi_cntrl->pm_lock);
> +	pm_runtime_put(&mhi_cntrl->mhi_dev->dev);
>   }
>   EXPORT_SYMBOL_GPL(mhi_device_put);
>   
> 

