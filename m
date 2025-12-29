Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AAD1CE81E0
	for <lists+dri-devel@lfdr.de>; Mon, 29 Dec 2025 21:20:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BABD10E023;
	Mon, 29 Dec 2025 20:20:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="DRwYQYc6";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cBWVb9AH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2359210E023
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Dec 2025 20:20:10 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BTA5kgP240688
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Dec 2025 20:20:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 7MozNexHgJw4PP86LYlmpf5GcfoVsuHBu4VnE8EoW0g=; b=DRwYQYc6xXrnDYfr
 4zRQWdR3gjE1qZXQA0FLzBPH7KkA61L1rU+1UwsFW2KeVAg4ylPLhHzsLwcVreoX
 RBdj6tQj9QdRrgeLzrsl9GpeAnO+WoQdhvIEUBuimZ9l/doWI6ATiXrc9yweeazI
 0WGbiS69rwFLUA6BPpDQDeXEmw4d/qGbTHIsUTwP9aVSSxNsunYUOzvw1gSlvW27
 Z+BdYghv3ZbMC269yXSZDBdNq0HrXwcTmJebFHgnbGo9qXqrwliIMQNXSlZGqjrQ
 U2VvdGIzyWc78GnzV4TFHUmOHt54ps1lb6YANvyCvR1MDQXnnDmUngnPDhMu9DR+
 OcPABA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bbc9v2jcb-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Dec 2025 20:20:08 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id
 a92af1059eb24-11ddcc9f85eso18262818c88.0
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Dec 2025 12:20:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767039608; x=1767644408;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7MozNexHgJw4PP86LYlmpf5GcfoVsuHBu4VnE8EoW0g=;
 b=cBWVb9AHAuUPeayPKefAg32mrOHaBBD4nne6zctqlYeUuVhrygl0Kzo51kvjgIgPTD
 RDDxq5mBc0dYbjLpO+tWgoyqdPMvqLVhzS5JF/X4sfgnTYK6L0G6+c+heCsixH59MNQc
 Xo+L3t+XmJ/YD3mMkjmbzRT+ggv++eiBcGweuIaAt4jlwyGydDb9jyCnMOjs+K8JO/Tl
 24x5pHponbbP5UcK9774bPZiLK5SJaQsdFCqarx3WRDdUqI3IihB39FXVcrJeX/41eZy
 TGvTJfUyW0hNnJSFSLOo96ZHluzI3j9ijQAC37d8xIcck1zWO4tho/+D5rwDWD6h0g3U
 RQKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767039608; x=1767644408;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7MozNexHgJw4PP86LYlmpf5GcfoVsuHBu4VnE8EoW0g=;
 b=lnoW7XLrtGJBaiW8EX+nN7Ld1MUEfENJMVxNscX8ZbzIKLOq8iZS8Uc38wbPeFXvED
 EA/a1LKfE0ohm6Xf1Cckb/DDe7dKVI/dlOcTB05JYqgMEz97yKdwV/iSDY+piHznjfQr
 TduX7QYm52LGBoecJlSFXdxM42EzruEPjQuTn7tL0oyZr+mH39yLdhqrZecpP9ndYFQW
 qhAKxXX5eVrddcZhl3DO9Dz/FyA4GXuWFx1BlJjklBl/WGdZP+WcqM6KcOXY6O1livz+
 AobXyJL4Z3x0ImocQz9M+Bc/d9Rkz9IjwXOzvVGAfHvBHX4FUl5HMXTVDgI6nY4IUn7J
 WmVg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1rrDA1SQg/kK1BrWpz9JM642jL9ofy12I4kU/RmGcQZumW/5rZkDohkhVK4gdcN3dBCdmQSvJsrY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw3p6xYAFc+XW8B7Roe9n/sDOuLlC6xfFdVhY//700F95hokbVy
 tLG6e8053VFXT0xYyO+TqIJtR7qKr7yxVUXC1s0GN+XIXl5A7Or1dkYk2lJWyk8VtVQjpXZfjig
 k42udlyu3J5UoAYc+U4nTJortbN5WN7l/Cmm+8h48koUv5zH98qRRCzoDdssO45J5EYdpVDk=
X-Gm-Gg: AY/fxX7VtzZgRQ7FoJcAUnqSxl8YNTqGSnzoLQQvp+PgMc8lpqMgnsrTF1R8MxDqRzb
 lVM1S43tdoSwPz9HNB1AFyuGASn3MrX08Eq0Wy1dPPCtRK3I8J+0za57+GrQqp+AMres3y/P1/1
 hhkTc1/jdYA10FQeqJXHS3Dle+FMe47+J+AZ9qLoGerWQa0nSWzYktZHTz0SaKYgLddI6Fd1MSP
 Kuz+75gqX0S9+GTD5XOGkR0alm2QDdNF67eFxYPfptUWumhJJFP4xxTHhqPrlkMWnz1MGQrbgGm
 G0KjvoILu3rwgBNP9jw1rsNw+eO7HwRX1cZ38AOK/WwPBQUC/6NLGLxyZuJB3GNGYohB9RT2bIX
 6Thp/c3Z9Ft7zMU/phlRDzWdQk9mF1dWEyVRVv4+M4v/JoO4oNrbrQg7ipMUPGdU=
X-Received: by 2002:a05:7022:e1a:b0:11e:3e9:3e8e with SMTP id
 a92af1059eb24-12171afd95bmr24941779c88.23.1767039607758; 
 Mon, 29 Dec 2025 12:20:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH/lwK2wTaR4697pd1i+xemc7zfhrLFxVX/r/0pN47IvpGex944GuH8FMyKdtpVLY3DVSOxHw==
X-Received: by 2002:a05:7022:e1a:b0:11e:3e9:3e8e with SMTP id
 a92af1059eb24-12171afd95bmr24941750c88.23.1767039607116; 
 Mon, 29 Dec 2025 12:20:07 -0800 (PST)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-1217253c23csm117915702c88.9.2025.12.29.12.20.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Dec 2025 12:20:06 -0800 (PST)
Message-ID: <60aea371-915f-431d-88dd-3be633dc2bcf@oss.qualcomm.com>
Date: Mon, 29 Dec 2025 13:20:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] net: qrtr: Drop the MHI auto_queue feature for
 IPCR DL channels
To: manivannan.sadhasivam@oss.qualcomm.com,
 Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
 Oded Gabbay <ogabbay@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>,
 Jeff Johnson <jjohnson@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Maxim Kochetkov <fido_max@inbox.ru>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, mhi@lists.linux.dev,
 linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
 ath12k@lists.infradead.org, netdev@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Johan Hovold <johan@kernel.org>, Chris Lew <quic_clew@quicinc.com>,
 stable@vger.kernel.org
References: <20251218-qrtr-fix-v2-0-c7499bfcfbe0@oss.qualcomm.com>
 <20251218-qrtr-fix-v2-1-c7499bfcfbe0@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251218-qrtr-fix-v2-1-c7499bfcfbe0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: fc6Ect_W4NexBUAAVY2c2g5aE916_JKB
X-Authority-Analysis: v=2.4 cv=R/sO2NRX c=1 sm=1 tr=0 ts=6952e278 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=zitRP-D0AAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=isMaZ9OHK7bkWVW8W2QA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22 a=xwnAI6pc5liRhupp6brZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI5MDE4NSBTYWx0ZWRfX1KWa24Fv04N4
 /n+lvFoeQyT2DOmqc0fFxA0Njjo45WYLhntck8YZr9HSHwxKmK6YoIjs5t+AivbhJwW4D8HLd4B
 8I81GleuY1wuuHv38uaBAp6nJj5zQj48jUvI1MDLCnZog0+/wmDnc8mM1RUZ0cbVBmszlBapVCh
 +FO7kN/hSavHF6JFXJKXwErEQYKEu+9DqCkp0oAgpBheOG71SPcmIjEPWamborHBV/WvD05bgzA
 My6OuwmtNkpYAJbcJoq9lIt4aqeM+g87x2p0Jz7gerAeWBmKXF6ofzWuu7Tm+ieNVCRjm43ZctZ
 7zt7H5NhrE8v0+eFgkGOzpP4FWuaDEX+Ono0jntYEqvynk4g3s2gVuiu5ljukLW9Cxt3qXTx4FY
 EDcKvuySry+czEutdhRBGYV/uhJKtDLpMsmLYjdmANbEfS/pzbRNT5xwmkfpdwOBQxDMNssrpXh
 01a1awXx2zar6QpXV3w==
X-Proofpoint-ORIG-GUID: fc6Ect_W4NexBUAAVY2c2g5aE916_JKB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_06,2025-12-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 suspectscore=0 phishscore=0
 spamscore=0 adultscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512290185
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

On 12/18/2025 9:51 AM, Manivannan Sadhasivam via B4 Relay wrote:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> 
> MHI stack offers the 'auto_queue' feature, which allows the MHI stack to
> auto queue the buffers for the RX path (DL channel). Though this feature
> simplifies the client driver design, it introduces race between the client
> drivers and the MHI stack. For instance, with auto_queue, the 'dl_callback'
> for the DL channel may get called before the client driver is fully probed.
> This means, by the time the dl_callback gets called, the client driver's
> structures might not be initialized, leading to NULL ptr dereference.
> 
> Currently, the drivers have to workaround this issue by initializing the
> internal structures before calling mhi_prepare_for_transfer_autoqueue().
> But even so, there is a chance that the client driver's internal code path
> may call the MHI queue APIs before mhi_prepare_for_transfer_autoqueue() is
> called, leading to similar NULL ptr dereference. This issue has been
> reported on the Qcom X1E80100 CRD machines affecting boot.
> 
> So to properly fix all these races, drop the MHI 'auto_queue' feature
> altogether and let the client driver (QRTR) manage the RX buffers manually.
> In the QRTR driver, queue the RX buffers based on the ring length during
> probe and recycle the buffers in 'dl_callback' once they are consumed. This
> also warrants removing the setting of 'auto_queue' flag from controller
> drivers.
> 
> Currently, this 'auto_queue' feature is only enabled for IPCR DL channel.
> So only the QRTR client driver requires the modification.
> 
> Fixes: 227fee5fc99e ("bus: mhi: core: Add an API for auto queueing buffers for DL channel")
> Fixes: 68a838b84eff ("net: qrtr: start MHI channel after endpoit creation")
> Reported-by: Johan Hovold <johan@kernel.org>
> Closes: https://lore.kernel.org/linux-arm-msm/ZyTtVdkCCES0lkl4@hovoldconsulting.com
> Suggested-by: Chris Lew <quic_clew@quicinc.com>
> Acked-by: Jeff Johnson <jjohnson@kernel.org> # drivers/net/wireless/ath/...
> Cc: stable@vger.kernel.org
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>

For the qaic bits

Acked-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
