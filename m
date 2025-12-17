Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEAF8CC941C
	for <lists+dri-devel@lfdr.de>; Wed, 17 Dec 2025 19:18:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D454D10E8FD;
	Wed, 17 Dec 2025 18:18:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="XX0FTlGh";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KFLGxcv8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7319110E8FD
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Dec 2025 18:18:39 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BHCL4j83049376
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Dec 2025 18:18:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 wBmu9AzZ9xdbtIOjudSzxPBr2BE5g0gg/z6YBjxDbIE=; b=XX0FTlGhGcl0GgQl
 ByTU7cTPlDPk/BXambHGMBBrAFNZaJfIcs6xA6ew4ZJ9tR7UJQS+gqePcy3CuHsP
 vAotqv37mohmAfVk+eAvIYj7rZG2V0YacO0NNdP0m9w3yE0WWFoEoPEvo6maf4xs
 6DWw+J4IIVBayH2jAWjYTnjijGyHuVPMpR0JkPMA9P0/h03K2SoFh/RKObvRsWpV
 eE00BccsGUxbyFdW7MIQrXSXW3cfy70VmIAoj7vErrMdAHU142riKXQR00XrVdgA
 bnC0PryPEaCZPZzqHVwAwn49yCO1jVtKSjP0r7hhODK19mvYysQxYak3xA0We1cb
 FKeYhQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3jgqb2gw-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Dec 2025 18:18:38 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-b98e6ff908aso15574674a12.2
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Dec 2025 10:18:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1765995517; x=1766600317;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wBmu9AzZ9xdbtIOjudSzxPBr2BE5g0gg/z6YBjxDbIE=;
 b=KFLGxcv8gtOtj6j4CD+95qADAdC8mBrJ0DBdYYWCtp1/YQufCyA5rDeB+HiZZF8eLf
 cL+BfXg2CSDlpiXj2rMy7QIOpM7venhcEbCGi3dEQ6s5JejNn3BGnxhALMQpUY9ndMhd
 5ktqVs5nRbCQ9KRKJoPvTpQNX7CEM/iDMUaIkXIB3sPsa42Q7cFHnIKoCG5tGfvI2oDy
 IiS1PqVPVCtQDfLRlxs7vdJW1PbmBbkUnema8lK1L2yeTWHB3toIeTBJzPg6/g95+1/N
 Jz3eazyn5c25if8GVjpWg3HqIgMvDBWaGhkD1sf+TuMnGZTZe/Pd4KA6uH0zZfJ4MF9l
 d4zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765995517; x=1766600317;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wBmu9AzZ9xdbtIOjudSzxPBr2BE5g0gg/z6YBjxDbIE=;
 b=H19dVd7tXwD/meFaOKT7Ntm6dV2o7zfrnj4g2HzSpwqF+jJ4Xhg8U2Qw1m27sTOZzW
 zJl60740T+TsmwPG9JDStDzyKRo0KKKvh0UemmblkUVgZrXkE8mfqMGcICdHT61M5tX0
 u32zIEufMSVimwhvB6fPmNAvLF1r9Bmji2xgT6kCE8DMyy8aEp+r9wPdeFGmdu5+UrY2
 OqPy6xC13+gxbJ2F+n0eq/3LNQUuMAA/5eMWcSy/QymGIIdhbIDYsk1N+Pin05SvE7nu
 wQ+i1Wh3c7NIU32L2PZTVOjb7GzQi0wnKSMrvT+GicVZqJAWgUrUWTRbX51JDHotOB6G
 d/Iw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8qXA+vOv3zujEvDBDO38gY/rgVLtBCe5FeTN9ggxhtNcZ02265n6XiD8OR/208j77QQsEjktdVzA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx8uTfoRnhxV7zbpq+KoD8yxV63yI7RoWy8tcW0ipl+gECHaUuX
 sayNcoycoN6izZ5vKwluIN/xqKwLmES9hTqWlqZWfOj/nfo8iRqk+O94RFpWXkQ83YnYbvwI32X
 oZJJZSEZ+733QvSdelyPhezVzDnBipsE2ABInBEvwaisJavEpYm0toneiy6hjezani5opYnw=
X-Gm-Gg: AY/fxX5l0woaQEKFrxhl48pK2zE6LS/NE/UcaV18mlBTe+8NozDXZP3XbfXmnyjg8Fp
 PG/8pW7oTlYCJ94046rh5DFZcK4f4ymsgucPGf094XHhI4guOVb79ZNTCqPq0ptgQKG3AMLHRAf
 NB0koyeUs0UB4gSI4KICuJDf7OWjwZRx0UDN9ymOcPKoS8fh9cckhqvsAJOen+V3aF/Rr3BctLr
 1eSiBGL2VIdgU5BgYoZnJ6ratZhbsYAoeAZs/VdCb9R5p0xu94zclsC4CSMMeAg3k+TVkWqYYmq
 NJs8d9SkZepPEb79mjHJKXwyt5KXNGi6KGM5Nr2YdaFdAhaUZ7mhniUa4nCZ+uo/47SzwYAwg89
 Hly8z0mxmi/2ittf54djZeAHvq86bdIsFmD5pN3OOldsiRHnxfDXeT98j4CFCKG06YRt+4A==
X-Received: by 2002:a05:7301:182:b0:2a4:3592:cf83 with SMTP id
 5a478bee46e88-2ac303958camr10594089eec.39.1765995517147; 
 Wed, 17 Dec 2025 10:18:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH6ScF6p2dbGaIAlfPTuofAf2/eZTtk6ONOKBGl/Qm27pAQp9ttnZa9kTtvsKTJrPW0AuH8SQ==
X-Received: by 2002:a05:7301:182:b0:2a4:3592:cf83 with SMTP id
 5a478bee46e88-2ac303958camr10594041eec.39.1765995516561; 
 Wed, 17 Dec 2025 10:18:36 -0800 (PST)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-12061a93616sm517453c88.14.2025.12.17.10.18.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Dec 2025 10:18:36 -0800 (PST)
Message-ID: <5e568034-20a3-4ed5-a8e0-c010e5aa7b82@oss.qualcomm.com>
Date: Wed, 17 Dec 2025 10:18:34 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] net: qrtr: Drop the MHI auto_queue feature for IPCR
 DL channels
To: manivannan.sadhasivam@oss.qualcomm.com,
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
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
References: <20251217-qrtr-fix-v1-0-f6142a3ec9d8@oss.qualcomm.com>
 <20251217-qrtr-fix-v1-1-f6142a3ec9d8@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20251217-qrtr-fix-v1-1-f6142a3ec9d8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=VLjQXtPX c=1 sm=1 tr=0 ts=6942f3fe cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=zitRP-D0AAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=isMaZ9OHK7bkWVW8W2QA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=xwnAI6pc5liRhupp6brZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDE0NSBTYWx0ZWRfX4oUzYLfARDrx
 PIne1r9KjWlyqHxzYcCbGrNNhbjP3QvpwHrjtwGEmaitG8BSSPAHYHidNHjmX/JMVQjumOL0TOA
 H/7gDC1X62GiV5Bn6kEh1hRQbit/5nU98JaBvNNsm4P35VwMwDhoTnT2aB/iHJZMuYZmRt+vOmD
 UEo1H22R7BRWxm2cWAGx3j8sI2PAEuQJrrHlGIW8LZ6IUUcHhOvWn5gX3/8W3BWB3WdUgwKfa7/
 A1+o4LE2Qp6we8VPFGVC1BcI32btxi8RrT/5OmqumK7v492SpcyN6zR2MP7Uv4rNB+lg6tjKs8w
 UMOpWGz84wdHIS3sJeJ33pJf5wCrP3291mTnQwPMlyBekpMBFm0PPppV/usC64JgxXKHWFgnu7R
 Qp5XFHyZHq0Qg84XIf+786W1XKhYxQ==
X-Proofpoint-ORIG-GUID: TLFOOVmsX1BXAyPpF0GzpHayiUexMGVZ
X-Proofpoint-GUID: TLFOOVmsX1BXAyPpF0GzpHayiUexMGVZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_03,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 clxscore=1011 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512170145
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

On 12/17/2025 9:16 AM, Manivannan Sadhasivam via B4 Relay wrote:
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
> Cc: stable@vger.kernel.org
> Fixes: 227fee5fc99e ("bus: mhi: core: Add an API for auto queueing buffers for DL channel")
> Fixes: 68a838b84eff ("net: qrtr: start MHI channel after endpoit creation")
> Reported-by: Johan Hovold <johan@kernel.org>
> Closes: https://lore.kernel.org/linux-arm-msm/ZyTtVdkCCES0lkl4@hovoldconsulting.com
> Suggested-by: Chris Lew <quic_clew@quicinc.com>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

Acked-by: Jeff Johnson <jjohnson@kernel.org> # drivers/net/wireless/ath/...

