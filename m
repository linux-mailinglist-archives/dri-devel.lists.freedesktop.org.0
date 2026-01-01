Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEBE1CED446
	for <lists+dri-devel@lfdr.de>; Thu, 01 Jan 2026 19:53:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88D1310E03A;
	Thu,  1 Jan 2026 18:53:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="E4JOakQb";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IDbEvmKG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6C9E10E03A
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Jan 2026 18:53:11 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6012DbYZ4028540
 for <dri-devel@lists.freedesktop.org>; Thu, 1 Jan 2026 18:53:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=ik6hlVXeTmBKrAB0aF6mx5+u
 5ON4Nq+bNmY4Sp4BCBg=; b=E4JOakQbeHUd6cX0TJKs3SQDrGS3pN2GXE+/B77s
 INRK2xConOMgsCZKtMw8/fZXSNHbErDJWHW4Kbo60eBISTJCQ9lIDk28sOEZTRDy
 XVzeWLOybrD5nIZ4g2HAnzlujiKgLff4gMQgcQ6w56CooqFQXgPybL7gxO8s1m1h
 1VO/+c37m4ObAWcnTpVT/gg9QgA611Lr4ebrGOxbU3MdR+NLv5Ve2mkXK5OCjB+2
 W3d3/b8NaEx7oRJzXPxramL2NbhUk/m2bJ0vEAMTCHM3UF6gjX/SaQC5qCVPLjjR
 k2juBGo8D3SaarlLyE6ASbPvMHRwcBjhUHoCA5US8AI4pQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bd77v1w80-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Jan 2026 18:53:10 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4ed6ff3de05so322030851cf.3
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Jan 2026 10:53:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767293590; x=1767898390;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ik6hlVXeTmBKrAB0aF6mx5+u5ON4Nq+bNmY4Sp4BCBg=;
 b=IDbEvmKGF9AzNoEGNpxiIL5V9h31IoDQBpnKbZEJIObGf62dNManZGeD4tqPXh2vHL
 xUGkpWRo97Pn2J2bEGTFzpzVzkp0zAJ4TbhB9S1SRMohkBu54hPYqkWEcDVd52Vwf+Xb
 JrTpNEhyrIMz/Py+030CDiTc+sJd1VdgxPlR7PikD6t0KvJtxpyYAhCmNdIfcDZezXdZ
 ++206EDnTkRXK2pJ1VFp+01X/gqGqGcgxNfChVq4gtraGYmVbYi3snGNCSrOqiUkt9Qk
 79ewuueWMOICZgLf9aHqaFH66KMJB8XIbDkWJ2JPpwKTAS28vIGnmv5ydiM4+MeWdsIa
 +uHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767293590; x=1767898390;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ik6hlVXeTmBKrAB0aF6mx5+u5ON4Nq+bNmY4Sp4BCBg=;
 b=BcpzinJzai99b7ffzThNTEBrqJvI0rranad0B8oOBcwSgrk1EWZnAv5SQxelM1k7Pm
 UqnUTxZtbUtp73yywaPuNsqmqaC28TYhj22bYyKBdYnL0nZHahMi2nGURRUwJ3GJb2a3
 vAGdihCHMXiL0GNzmrzXDYdPgThaDdJBSjoFnpOgn/Wbt+jpJcsnzB4qEQgJ9njGfwdb
 hGgf+D5sTrJ/n3kAPRFIUcBiRNiOA3xeTVMb/xMqF6jxZ8AE/KhAFeWIwhrZ/2i8vfYP
 uOz6mpLmxELTIX6eRgRuR8xB1FeYnGKdZVIi0cGlOwnVytHTzFL2zfZaIrHrNYnbShop
 zYPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWI1shJ/W+ikQX6MhUnsyZPCelKQ//ujcsFeltiFpv6jvjmrmpts9nn99fQaJ9ssBQATKOkActhU+A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwAtG619Ik1+OdGMWR0ZeZC2BuE45fhkfrdwN1wd2hQoo6PSj3K
 YaV/krVqEwl2zdJnxEvjkYpn0+Ttkz2SkTs1UosmJe9ZbS4UHn4LEY0SnCgLgTyyPuENrifQV7b
 QzAw3dlfvlQUf7tYQKv5dImtd8e1NVzSRdtX3zFoFODP5KNqxorG+MUrVtoPSYL5RbAyBlbg=
X-Gm-Gg: AY/fxX4TmXED0b8f8NqaJRDvzwuaY1l06WSrR2LtCVy7hkarnoeqtny0FlfYOjT7b9d
 lOvtVGZROCcE22sbplHAGnmIs6jPr13XUP56V0ogoUv9xbSIgFS1mTV7LOF0jKuHwsJPuPAYamC
 S2s3I6scH520kFbI39M7V9tQZzkEsWqkmtOWdK1x4dBoFOe2SGGXzVYhuiVnh2cqKr48+k8Zbwz
 gR0EdCtjA6E91Zw3ZeIowfrtCX/X0RuNw0FNbSyaCQEqzKq8DJzjI1EwGboswbPOCXj/8eki2qj
 /YFNHSQDS14FvI+s9+9lAwIhC6ZckyuFXb9NM9RiynTRUXPua/cN8rxcoimbpRhJElKxBThNGlw
 8AUW84jsEIHrzkv16SLde
X-Received: by 2002:a05:622a:1f06:b0:4f1:e0c7:7892 with SMTP id
 d75a77b69052e-4f4abceebbcmr599601191cf.21.1767293589942; 
 Thu, 01 Jan 2026 10:53:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFqWg0OwJN7WPv/Z6zzoCKj3pxTkw7ICxhLJa4qdOrQj71LJo+OUfAsFJ3QIwlHL9BMYoFVPw==
X-Received: by 2002:a05:622a:1f06:b0:4f1:e0c7:7892 with SMTP id
 d75a77b69052e-4f4abceebbcmr599600801cf.21.1767293589362; 
 Thu, 01 Jan 2026 10:53:09 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.7.10])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b836b9b08c2sm1537526166b.58.2026.01.01.10.53.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Jan 2026 10:53:08 -0800 (PST)
Date: Thu, 1 Jan 2026 20:53:06 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: manivannan.sadhasivam@oss.qualcomm.com
Cc: Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
 Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
 Oded Gabbay <ogabbay@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>,
 Jeff Johnson <jjohnson@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Maxim Kochetkov <fido_max@inbox.ru>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 mhi@lists.linux.dev, linux-wireless@vger.kernel.org,
 ath11k@lists.infradead.org, ath12k@lists.infradead.org,
 netdev@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Johan Hovold <johan@kernel.org>, Chris Lew <quic_clew@quicinc.com>,
 stable@vger.kernel.org
Subject: Re: [PATCH v2 1/2] net: qrtr: Drop the MHI auto_queue feature for
 IPCR DL channels
Message-ID: <bah766ajefvfoiqgbgjwwlbbr4ech4yupo2wjogejxcd5tmq4p@q5powzzdfbbf>
References: <20251218-qrtr-fix-v2-0-c7499bfcfbe0@oss.qualcomm.com>
 <20251218-qrtr-fix-v2-1-c7499bfcfbe0@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251218-qrtr-fix-v2-1-c7499bfcfbe0@oss.qualcomm.com>
X-Proofpoint-GUID: 7qR4uqpU7lPawODHnZUhrTc3aX5u3ESp
X-Proofpoint-ORIG-GUID: 7qR4uqpU7lPawODHnZUhrTc3aX5u3ESp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAxMDE3MSBTYWx0ZWRfX3k3obNuFGFx0
 wKtasIM83Of8YH1iTFZ0CnIGmm7e6aXwVxyHUQDkiQVeljiuTDmotx1UxzD9mrz4X5lWJIrCDeQ
 PLXB2uBcjfzW4Kb/bzFyERBidb6AcRegJfhpc56vRBPoLsXbhnd7umRRVZx7WgZDwXeKgTTMZjM
 r3cplAE7UUlPyM694FlAP556NhZyBl1FRts+AeFjOfNbGtdvh7mB6wSDk0DgU2N/KZ9BIpCZMwY
 YIVyb82KLLrbpRxLWb3GumheBIjIy/lUZhYFrT/QcI34W1g3Wlof1f6T3ON1FepZfUH3K+uBf0P
 MOjsZ4MaoIertRITL81KtjQCqrnJzxRHm7Y5zkK2yoNBkd7DQQopHw73CmPRZe9dhcQMKPDaWl3
 6WipTctJFN6H1DSqKzNYC+5sFSY6K8VIHaEm/uHUWRFmqCKhy+PGJaloioCi4yV6NtEHNocp8Dy
 cZjvlVktxmgyzaEIlTQ==
X-Authority-Analysis: v=2.4 cv=ev7SD4pX c=1 sm=1 tr=0 ts=6956c296 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=hZ5Vz02otkLiOpJ15TJmsQ==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=zitRP-D0AAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=isMaZ9OHK7bkWVW8W2QA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=xwnAI6pc5liRhupp6brZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-01_07,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 malwarescore=0 clxscore=1015 adultscore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601010171
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

On 25-12-18 22:21:44, Manivannan Sadhasivam via B4 Relay wrote:
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

Tested on Dell XPS13 9345, so:

Tested-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
