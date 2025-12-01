Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 636A9C988E9
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 18:41:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B701C10E43B;
	Mon,  1 Dec 2025 17:41:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZxyuzaXv";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wfg0AlWv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19D2210E437
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Dec 2025 17:41:06 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5B1A7nvp435828
 for <dri-devel@lists.freedesktop.org>; Mon, 1 Dec 2025 17:41:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 exm+out2T1Pb1oWg34oExcEhVExwIO1gE6DHWlTI8qw=; b=ZxyuzaXv6A26qiRW
 3ib+4vKjJnwB99Ulmz3+RRb3QOIt9IEjEBZ2SK904Gsv6nMU2UluCtxKVvgbRPW5
 aXIV0VxAUSTF9gt+hZmetm/hPC3OkeqsVaPFydPZLYXkVi6jmR1m7IIpi7WMdh31
 G1p/Mm5LYsJGCX7rhrWPgKhgo7vMYyzGcSbUtkJSFYm8z2SL/nbgk217ze6jfZvJ
 eC0pkwM6QvoPRK63MsxQXNL1M+QTG01ljbQaMRJVju5uvMdOjxXBsAqaxu4C3s4H
 /zjOeRaj09yH4rJo95lgrRbtjeRy5qN6DQvXd2C/tC2nj88agyNrKRoRmpFD/Fpd
 eNuP+w==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4as909s8ys-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Dec 2025 17:41:04 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-7aa148105a2so3964747b3a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Dec 2025 09:41:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764610864; x=1765215664;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=exm+out2T1Pb1oWg34oExcEhVExwIO1gE6DHWlTI8qw=;
 b=Wfg0AlWvMLzOizomoDnaJ8no6d64zrcMUnsqwoqPv8O1TZZCLQnYY7m9HWPp0pVD/x
 WyFiduYOpdtkABrmPP7vadsMoHM7+oePmVEVz4rp2X/SPj5u1kEbjAhVeI8ER+zzKTId
 59ZHjHISWyO/12mw8CH+/HkDZGGLStFEMEnPLFL2UKTRbsWO8vokyBq1TsXmbSztj0/Q
 PGZGkdfTz7LXWNrIhxu4gJmyCH2RR8wSVhCUBQEka8P4wE50yPyoogpcFyZiHaD453Nf
 VmZANriJCdMnfeqXlFush/De4GltIZmuIseV4mWbIXW83JekWVaF7mvQpM9pKd76JRlq
 Rm+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764610864; x=1765215664;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=exm+out2T1Pb1oWg34oExcEhVExwIO1gE6DHWlTI8qw=;
 b=Kmwo4RIefJWgNrv8zLVHrHtik+GsqF4A89Fzv6znvf80/gcFQ7BqEFDWTwyeM4Ath/
 pScQcsKeDNAEWMkshzjvNNZa8+P71XTr5Ji2mVhC80LHw1LAyNHMS3c0MHh8frtu2RQY
 2Oi0dwL67E0AFO0Ys7590QHCFuK39kx3Z8thsyadm7k6Jccj0AYrN43rD+WZbK3jLUsP
 Zvasjyw3nSq1Lop5KxQ0DwEct+n47zpI1pbSu/NA8av4v6JIxQx/a+MQZKo2L3UojRr1
 jGsQYimI8al9ic/S6OFBGJCBRuVKKsOIaezwrXK6n/dMCO0Pa3aoghBF9VKhMxEnNfq4
 BqLA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXSNfxeRPLIzRnO6GU196LMe0uDeAKMNbqF9mYWvZwLPMpxKyCmwERs6s0mVfNuawLadjJ9baKT6lE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyavVecIq1/I8s/BUJkpUdOMstC131GkErUNEJ9d+QlxAFsMrzD
 u9oIHOBOh0//VYGiz10QGiQ70kAGOaFEFBEZZv5mm/jAI8eordT4SwUsWSwTFr61Et5hv+Kzg+F
 wc2dawv9uH0HlpcLzKASjslTnMdP/sPDHaqytKp4HBfcgNNGYQ3uX0HUkwh8TiwErrMzkoBwvUi
 rvfnQ=
X-Gm-Gg: ASbGncumeC2qcRmZgZSsT0hiGDtS89Z79LXacqou9tZ9pMFhDZ8tGg8ExBYbExeX6B/
 X2+tXr6/rzBEYCEoI9D9Y7JorHHFptQqFx1rXDn3Ew28c5u2ubAuGToRX3AIkQe7In1GdH55o7+
 HGWW+G6PrDMILPAAeFzoc96ekv+hN4X4+bDg/oifAGu0HPS+YnKM3N9C0ZYvrWfPDtqt/se6krQ
 Y68ScTTjP7g/+PIohvTVcWE2Bei/gWvzQ1YUVcVq/459HnCa2hwqIucPJU5d31PvFayOcxWLuWt
 w7H4uzMuOYCtDx/YSGpHivq8A4rsJY/wPZhktcsoNmq+DNuNYK7CRZLn6Ss0qRpO+sOOUv5k/m4
 ZBgZbly57R5YXLi/vSoikAcnQk3enwnUVgLsA1SPOoaNflexuVS4DeI3M
X-Received: by 2002:a05:6a20:3ca6:b0:361:2d0c:fd70 with SMTP id
 adf61e73a8af0-3637db29723mr30315554637.17.1764610863733; 
 Mon, 01 Dec 2025 09:41:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFuoKHcI6kog7ZiSeUimSTc1QQRfMcR0gyLQvIhQiA98rGJvDjNieYJ0dzMpSwyxYjBOD4K6Q==
X-Received: by 2002:a05:6a20:3ca6:b0:361:2d0c:fd70 with SMTP id
 adf61e73a8af0-3637db29723mr30315517637.17.1764610863190; 
 Mon, 01 Dec 2025 09:41:03 -0800 (PST)
Received: from [10.73.112.168] (pat_11.qualcomm.com. [192.35.156.11])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7d150c618e7sm14245014b3a.3.2025.12.01.09.41.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Dec 2025 09:41:02 -0800 (PST)
Message-ID: <ce68d28f-c737-402c-9f6d-f13fec4d2e82@oss.qualcomm.com>
Date: Mon, 1 Dec 2025 09:41:01 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] net: mhi_net: Implement runtime PM support
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
 Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
 Oded Gabbay <ogabbay@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Chris Lew <quic_clew@quicinc.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
 ath12k@lists.infradead.org, netdev@vger.kernel.org,
 quic_vbadigan@quicinc.com, vivek.pernamitta@oss.qualcomm.com
References: <20251201-mhi_runtimepm-v1-0-fab94399ca75@oss.qualcomm.com>
 <20251201-mhi_runtimepm-v1-3-fab94399ca75@oss.qualcomm.com>
Content-Language: en-US
From: Mayank Rana <mayank.rana@oss.qualcomm.com>
In-Reply-To: <20251201-mhi_runtimepm-v1-3-fab94399ca75@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAxMDE0NCBTYWx0ZWRfXzs4dAKBWTYaj
 BTuewZG6/EpXKBW+Q1hOs81NnHN7nssLLq6iQPUm9ijMHdTPfN/nfTIOREv3ZbmdnkSxBOodJgE
 gN7GhswvDLs8HKhq4ky9hP/XuW1l2Ny2o7jXeXwhr1F64u9IYIYN6oIr5AoJym0zlINvOADktjk
 doegJQZIYMhmCGGjFw2X9k9EWX50G/rAyMaEwP7xH9YFCnlS23jJseiMK0phHbSFfZGlKmm4Niq
 41fCu3ef4kurn2sBUmUg1M1LiZ8ItmKpaeFWW1XLaoOpK7Q5MDymsu3lgLHU7kCPbTShXQ88GA6
 tp2yLnnREfYsfDvOM426RnGJVV/EjdRit19pr1b73yMr7YDVw8XvzasM8jV+59LzF+ypOnjWKK6
 dTk6m4wGbJjCvuysj6d0rzHbWiBUXA==
X-Authority-Analysis: v=2.4 cv=XJQ9iAhE c=1 sm=1 tr=0 ts=692dd330 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZdW6uxA9NKXbfdqeeS2OGA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=vwh-6NgWTdBnnHhUpCYA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: iLLRwG4QOjJUkRsMpLzypT_X0u4CtZfR
X-Proofpoint-GUID: iLLRwG4QOjJUkRsMpLzypT_X0u4CtZfR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 spamscore=0 clxscore=1011
 phishscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512010144
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

+ Chris

Do we need to consider updating client driver (net/qrtr/mhi.c) ?

Regards,
Mayank

On 12/1/2025 4:43 AM, Krishna Chaitanya Chundru wrote:
> Add runtime power management support to the mhi_net driver to align with
> the updated MHI framework, which expects runtime PM to be enabled by client
> drivers. This ensures the controller remains active during data transfers
> and can autosuspend when idle.
> 
> The driver now uses pm_runtime_get() and pm_runtime_put() around
> transmit, receive, and buffer refill operations. Runtime PM is initialized
> during probe with autosuspend enabled and a 100ms delay. The device is
> marked with pm_runtime_no_callbacks() to notify PM framework that there
> are no callbacks for this driver.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>   drivers/net/mhi_net.c | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/net/mhi_net.c b/drivers/net/mhi_net.c
> index ae169929a9d8e449b5a427993abf68e8d032fae2..c5c697f29e69e9bc874b6cfff4699de12a4af114 100644
> --- a/drivers/net/mhi_net.c
> +++ b/drivers/net/mhi_net.c
> @@ -9,6 +9,7 @@
>   #include <linux/mod_devicetable.h>
>   #include <linux/module.h>
>   #include <linux/netdevice.h>
> +#include <linux/pm_runtime.h>
>   #include <linux/skbuff.h>
>   #include <linux/u64_stats_sync.h>
>   
> @@ -76,6 +77,7 @@ static netdev_tx_t mhi_ndo_xmit(struct sk_buff *skb, struct net_device *ndev)
>   	struct mhi_device *mdev = mhi_netdev->mdev;
>   	int err;
>   
> +	pm_runtime_get(&mdev->dev);
>   	err = mhi_queue_skb(mdev, DMA_TO_DEVICE, skb, skb->len, MHI_EOT);
>   	if (unlikely(err)) {
>   		net_err_ratelimited("%s: Failed to queue TX buf (%d)\n",
> @@ -94,6 +96,7 @@ static netdev_tx_t mhi_ndo_xmit(struct sk_buff *skb, struct net_device *ndev)
>   	u64_stats_inc(&mhi_netdev->stats.tx_dropped);
>   	u64_stats_update_end(&mhi_netdev->stats.tx_syncp);
>   
> +	pm_runtime_put_autosuspend(&mdev->dev);
>   	return NETDEV_TX_OK;
>   }
>   
> @@ -261,6 +264,7 @@ static void mhi_net_ul_callback(struct mhi_device *mhi_dev,
>   	}
>   	u64_stats_update_end(&mhi_netdev->stats.tx_syncp);
>   
> +	pm_runtime_put_autosuspend(&mdev->dev);
>   	if (netif_queue_stopped(ndev) && !mhi_queue_is_full(mdev, DMA_TO_DEVICE))
>   		netif_wake_queue(ndev);
>   }
> @@ -277,6 +281,7 @@ static void mhi_net_rx_refill_work(struct work_struct *work)
>   
>   	size = mhi_netdev->mru ? mhi_netdev->mru : READ_ONCE(ndev->mtu);
>   
> +	pm_runtime_get_sync(&mdev->dev);
>   	while (!mhi_queue_is_full(mdev, DMA_FROM_DEVICE)) {
>   		skb = netdev_alloc_skb(ndev, size);
>   		if (unlikely(!skb))
> @@ -296,6 +301,7 @@ static void mhi_net_rx_refill_work(struct work_struct *work)
>   		cond_resched();
>   	}
>   
> +	pm_runtime_put_autosuspend(&mdev->dev);
>   	/* If we're still starved of rx buffers, reschedule later */
>   	if (mhi_get_free_desc_count(mdev, DMA_FROM_DEVICE) == mhi_netdev->rx_queue_sz)
>   		schedule_delayed_work(&mhi_netdev->rx_refill, HZ / 2);
> @@ -362,12 +368,19 @@ static int mhi_net_probe(struct mhi_device *mhi_dev,
>   
>   	SET_NETDEV_DEV(ndev, &mhi_dev->dev);
>   
> +	pm_runtime_no_callbacks(&mhi_dev->dev);
> +	devm_pm_runtime_set_active_enabled(&mhi_dev->dev);
> +	pm_runtime_set_autosuspend_delay(&mhi_dev->dev, 100);
> +	pm_runtime_use_autosuspend(&mhi_dev->dev);
> +	pm_runtime_get(&mhi_dev->dev);
>   	err = mhi_net_newlink(mhi_dev, ndev);
>   	if (err) {
>   		free_netdev(ndev);
> +		pm_runtime_put_autosuspend(&mhi_dev->dev);
>   		return err;
>   	}
>   
> +	pm_runtime_put_autosuspend(&mhi_dev->dev);
>   	return 0;
>   }
>   
> 

