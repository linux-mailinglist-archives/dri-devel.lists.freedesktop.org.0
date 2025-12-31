Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 997B5CEBD25
	for <lists+dri-devel@lfdr.de>; Wed, 31 Dec 2025 11:55:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3AEF10E8AA;
	Wed, 31 Dec 2025 10:55:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="l9LalVlH";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LHTYOeB1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D16FE10E58F
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Dec 2025 10:55:54 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BV6UIbT3539557
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Dec 2025 10:55:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 O+f7Mi5vx+QI3KHSGUaTpC6QdSIVzAVg+5x+XC0DFt4=; b=l9LalVlHnMCVESuA
 ktNoLFmYgR+yMVeRPmZ1JFaUS088FgaON98gaUXZiHac/q7y5EeYEAVhiSnb1ZAs
 bYT+nenGTAW/98+5957nIK3Pr9Yc487SIjLLFsPE3gnkNCbWbIo3ZBBxFrTCoTdK
 khuLOhMy8IAWzxCWzztVs4hz4Kcl5cvgc8fD+mE0Mfp4uZWixQ1IaVnRZ1KWAq41
 edQTCHKA1PUAvPJLc6h0JiA83UANl8JKbLs7O3Uf0ZpoojkDqxfTTdBzgaYir3SN
 77Kp5o6ebyhoMAclhFdxW9LbhvNNHHTcT7l7pkeRIVAhRR6276p8C4+OyjObaxgD
 SQHIsA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc88ykcxh-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Dec 2025 10:55:54 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-7b9090d9f2eso19881199b3a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Dec 2025 02:55:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767178554; x=1767783354;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O+f7Mi5vx+QI3KHSGUaTpC6QdSIVzAVg+5x+XC0DFt4=;
 b=LHTYOeB1AeT+19e1IlIgpK2aDGvIAsZ3TXc2M7l1jKSsUqDJq6Eu5Ks7Vz4JV7eQEu
 clqF87xGNNL1IYWWguXAPN1LDF5aCffpAwCDeg53EoXVte3F9ssKasxtN5n7dGLKznhx
 5QLq8UimX5Ap+/ydVR6KbSKh4++CHpG2vvlj2Oycetv3LgWElIvI4LCOxPmv0nBsbZH+
 iJxcOev7dGbwbGDvUK5C4QpFT/zo+NBdCRNwI6I4rS8KMK2kisUrZbVdFvzD3mYigkaD
 GaCO03/FrFJGW/5cYexF6JI+6onJ4L4mad/bFcOUK6Mo0WCs+xFNQhIAAfD7U/xxAcJp
 QLzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767178554; x=1767783354;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=O+f7Mi5vx+QI3KHSGUaTpC6QdSIVzAVg+5x+XC0DFt4=;
 b=l9hlzaJ5OXQmQbFG30dpEjR9HqyEni+ZXHwy8pw1y4aHEgpfSodGiRT6duHejI6HYV
 GAbmY6stx5W0ue48MIgopcbpU3fY9luCBwkN4h8VDsETrIoYhFz0VUJ8G7HCVXdqjEqh
 nhjx1ay5qbUUSMgGMQKMeoJj1AHAS97WL7ZO6FPnXuhY74v/2QyrzvefrolRjaKhRHiH
 mK3Qbwq0+hY+wcqsqihsPJ+8YXJtSdfhdnrNKRbami2oSmb7UOCWYhx3y4kB1WMor1P2
 qn/B0rwB7/eQJ5hr2+0srVdNwuUFeKa4GXHgGTYb/lZ46MQzSvCQ4PRTKNfb4XYxvx0s
 fdrw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVyH+4ChVFTcu6qAMeM+wKY8Llol0F59nPnEyNu7mf7gJ8I17vHn5r87rprePiDG5r+wckPU3pE8Ec=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxpHim+jZRzqRlVnWQqsOs4kke3acvtCOgQNs8YLBELkZIgVQvC
 pQbh/xCkQshO+9MtELCFBzXUWY9UIKSvZLhwcDVO4wGpGrBM27TvdkP78SAhkQV/CCDkYWtgaRI
 esBFSPlwVQeeckCntkViWfbwdYm0w+67tSyXfWMa4W0ZESMQUd8YsGT9vr7qAYrx7zC2P/Yg=
X-Gm-Gg: AY/fxX5EMumRKhCQGSmkMwr/fJWz0C66A7bnJ387JPWADyg6U/ZqZYDwc1s9j1IlRDX
 AvtoPb7ks2e0aJifYskR7NDEoNbrg1hi5MeQm33bYzJHkw9gyTUL90JMIqp2WzO8GB/886Os2yG
 xwYPqFoYzoHbakAUp3GXD7HEwBgiuv84pkwTL5BO5I+sN1xdNhE1P8PS3Tuie93fCSCkk42fXyQ
 eEEzamgZGVVVjYqLctzTktsGDVMGTmK3OkUix6WUnprO6TbGrhBV4bRNk062peUmNLW2JO+OCKw
 TgjgRORtq3x3gMgfuPLdkMPsJHkr1HJrZ6piudMe1Q7xwPtyACDaHCb/xsYUp3/FZWQbVpenxFV
 PNEa3ouZth6lHnXwcdsJvdtsvZzh+cxEOgRZXYw==
X-Received: by 2002:a05:6a00:348a:b0:7e1:730a:613b with SMTP id
 d2e1a72fcca58-7ff64ec6724mr32190510b3a.31.1767178553535; 
 Wed, 31 Dec 2025 02:55:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGioiLvW2U0joeR5pbtZjSEPSozpQwlq9uIpJCK2UPjGGzU6NNfRTPRLdM9fVlDl9M9HcekTA==
X-Received: by 2002:a05:6a00:348a:b0:7e1:730a:613b with SMTP id
 d2e1a72fcca58-7ff64ec6724mr32190489b3a.31.1767178553048; 
 Wed, 31 Dec 2025 02:55:53 -0800 (PST)
Received: from [192.168.1.102] ([120.60.65.32])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7ff7e48cea1sm35616794b3a.45.2025.12.31.02.55.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Dec 2025 02:55:52 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
 Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
 Oded Gabbay <ogabbay@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>,
 Jeff Johnson <jjohnson@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Maxim Kochetkov <fido_max@inbox.ru>,
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, mhi@lists.linux.dev,
 linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
 ath12k@lists.infradead.org, netdev@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Johan Hovold <johan@kernel.org>, Chris Lew <quic_clew@quicinc.com>,
 stable@vger.kernel.org
In-Reply-To: <20251218-qrtr-fix-v2-0-c7499bfcfbe0@oss.qualcomm.com>
References: <20251218-qrtr-fix-v2-0-c7499bfcfbe0@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/2] net: qrtr: Drop the MHI 'auto_queue' feature
Message-Id: <176717854647.8976.2100798756796791971.b4-ty@oss.qualcomm.com>
Date: Wed, 31 Dec 2025 16:25:46 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=POcCOPqC c=1 sm=1 tr=0 ts=6955013a cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=+SK5D59PVgoENw9OlSzWFQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=d1LwL24QG6zMnwvM45oA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: VYc14w8YpXhVQSczBKEHVzuWKrz860-0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDA5NiBTYWx0ZWRfXy1f0dmAd9zMG
 GbvNzgXKmo1aQGDsFw8tLYck0XyaTG9v0oivMrqO17x4YojYahsm+Yjfi1NKTqzUzmMbYEKz0qP
 2n9vlsfbThLGYbW21AeDVbAs3MJDdQGLsYVtraTOK3UQpFdpZ2Xd2XXMhS7l6T7R3FI/Z8ZUvj3
 5PV73NLN2yXF5ag6cBhY9E2PzUdG9N+qqw0zf418zkl2b5ypXg3EXJgKzqLK6QMDaj+13L/jvkj
 8QJGXgyQKS2FTED5xrvVmhdvcSKUXG/Tl6GA2Hxe38eTxKOsmzcZeuPjRfIkf6okPkPhkYHuJwU
 Roq2QKtKBlKwtPGPwS7/UhwlCYn3HHYSxeFu3kNuxPBzqkpnuGg1f2SNU1gS1g0rsfLBwKT/2Xk
 +6jy+BU4044Ako0R/gNMCMYBbAMLpHdpHrIz/evm99chO8Sm8Hr9t/10yZ43OXTIoB7JdhDLeAX
 mZvjrlvZWK5vSEc292A==
X-Proofpoint-GUID: VYc14w8YpXhVQSczBKEHVzuWKrz860-0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-31_03,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 bulkscore=0 phishscore=0 clxscore=1011 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512310096
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


On Thu, 18 Dec 2025 22:21:43 +0530, Manivannan Sadhasivam wrote:
> This series intends to fix the race between the MHI stack and the MHI client
> drivers due to the MHI 'auto_queue' feature. As it turns out often, the best
> way to fix an issue in a feature is to drop the feature itself and this series
> does exactly that.
> 
> There is no real benefit in having the 'auto_queue' feature in the MHI stack,
> other than saving a few lines of code in the client drivers. Since the QRTR is
> the only client driver which makes use of this feature, this series reworks the
> QRTR driver to manage the buffer on its own.
> 
> [...]

Applied, thanks!

[1/2] net: qrtr: Drop the MHI auto_queue feature for IPCR DL channels
      commit: 51731792a25cb312ca94cdccfa139eb46de1b2ef
[2/2] bus: mhi: host: Drop the auto_queue support
      commit: 4a9ba211d0264131dcfca0cbc10bff5ff277ff0a

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

