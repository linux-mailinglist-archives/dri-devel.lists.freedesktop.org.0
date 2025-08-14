Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96036B25C7A
	for <lists+dri-devel@lfdr.de>; Thu, 14 Aug 2025 09:02:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 784B310E7F4;
	Thu, 14 Aug 2025 07:02:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="VTt6dHxM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6968C10E7F4
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 07:02:13 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DMRIJ6011340
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 07:02:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=Iy5XjLJ55RnUenJqnrBHZVwS
 VIhZcPvSxAiSS+k4+Ww=; b=VTt6dHxMQ5uJCZ26BA7BTEZ8Yb5u5ySn5pbhKa9C
 w0GVXirFEI2J9FgwVdQd562ooU+7hjBn2SHIh5nyOgyaK+P21VQikgA0r+mmejbU
 W3Kg5AvMNxsZotpCQ/x63kbx7Zon3nl1+SzElpFWiUO6vmRxnmAPz8doYLwIQ5Y9
 lViJIdCsasV482a4StmPS5QcDNCiMxHkVTYYGqnyWPkInqIMSgVBRZF4PixGfmoU
 WSWT+lQw4IIBiVoX7NCaIQ38D8jBRzz6yJEOejA7KwePbZc4YivFWVc/drlj0BRp
 UsyGclWX07v5EVC84OWJeqQcRwBXoznhdkxqNpzQypv4sw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48fjxbhuqy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 07:02:12 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4b109a92dddso18382341cf.1
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 00:02:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755154931; x=1755759731;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Iy5XjLJ55RnUenJqnrBHZVwSVIhZcPvSxAiSS+k4+Ww=;
 b=rhSp9eK17d1l7AfjIvPu2V5i5CWFovCEmgXPTDgOdmlYxNjblCZxzReTvp8U1u9I7b
 AcDGgw/+xAn4gMh1+q1L5t1uvM8ndvBtgiFoLdOQdAy1/iXLk4Vhd24AfB5GuHri5Ck4
 dK2sbxO78ToxiXm6VknFY7PhxdX02EZ0cBGAnwbNR+bLw9qT9ymf/+UvY7Ye4FNRCiEV
 2ovkGIe3fTxvHcyNhtfaaC/azvvNBT2/4neyKGKdebRXufqIZuObDlJwg1SspIFXP9vZ
 FbCsV1x7OHpfDFRqN6GB/rcXdWz3gzEg8zRzYxj7y8Tjk6mGxRtXfnl0EGm3lGthIsqV
 tC7g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZ0vOwixu0nri/dI55Ph4eFbodcEIXaKhBFHs4Nf77QEfHVoYMjQ9FkM19PVrgqupaHVFDrdy+XbI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwyC8gugW40iL1FQuGpVRR113nfm9NeM+WhWqAadYPK0lkKxE60
 AgaU7/jSe1eHO/uIrx52PcgBtRhzhBLNnDTOi0htrV9+l1ZaXfdG+0Cp26aaCFDRVQuZUFNwasT
 MFWUn8drrdpw+tTc1xJYcbiwEjo2xg2KUvzPRDOeeWc9xZaVsWNGd2OJeutyt39NR4uI4t4k=
X-Gm-Gg: ASbGncsuaD0ofLz/T0t3QaXCLbQjTnFXZx2tEB8oZXVZ10/hiXwFp0kshjpQ/YGAtvg
 xSAxtbxT1WcrZ7+47hAADCBC4DaD3tEKYlk7xacQHvTC7wPG73FyRhcvBuP555YUchwtAMhIgZF
 9gqulGxk7RwEnlAD0kWWWOOiOBENJBYrOApM7c0qBQ+ADk96vU3LYM8qHYTXFC4Fr1fKL0kmhq8
 Y3p2SxQOmrq8A8LEJ85asJRlH93DD+4m8YNI/FyyA0LWRQ1/JixDxNwCzDEthF7auCLpT2kSdwk
 BS37rA1ZN71BnoDJ0cuE/Lv8ExA0rxtkeF+/M2au6ztBOkNm3je5CQgwsGWXl7fxmDF+cs3dV8s
 VPEKtz5SvFZuw9AoPA2JS0soBpnQbxWJK/vFCfkJXdc7yWoZEQEwL
X-Received: by 2002:a05:622a:738d:b0:4b0:8338:30ee with SMTP id
 d75a77b69052e-4b10a920d45mr22488971cf.11.1755154931330; 
 Thu, 14 Aug 2025 00:02:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHHNJhcD6JQ708YwPrqw+PAvDxzp0+x7FgcO77yGZpD5y7vEB02eM4qqc2J0t07nBTkfxfSOA==
X-Received: by 2002:a05:622a:738d:b0:4b0:8338:30ee with SMTP id
 d75a77b69052e-4b10a920d45mr22488551cf.11.1755154930800; 
 Thu, 14 Aug 2025 00:02:10 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b88c99078sm5481193e87.102.2025.08.14.00.02.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 00:02:09 -0700 (PDT)
Date: Thu, 14 Aug 2025 10:02:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ling Xu <quic_lxu5@quicinc.com>
Cc: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
 gregkh@linuxfoundation.org, sumit.semwal@linaro.org,
 christian.koenig@amd.com, thierry.escande@linaro.org,
 quic_vgattupa@quicinc.com, quic_kuiw@quicinc.com,
 ekansh.gupta@oss.qualcomm.com, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 stable@kernel.org
Subject: Re: [PATCH v3 3/4] misc: fastrpc: fix possible map leak in
 fastrpc_put_args
Message-ID: <7gen36c5as6fxpgeinc6if7ysex4ieswh2uhqqjtqlt37tj7or@ngpiqfyg2p56>
References: <20250807100420.1163967-1-quic_lxu5@quicinc.com>
 <20250807100420.1163967-4-quic_lxu5@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250807100420.1163967-4-quic_lxu5@quicinc.com>
X-Authority-Analysis: v=2.4 cv=G6EcE8k5 c=1 sm=1 tr=0 ts=689d89f4 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=7U_eyDcXjddG1dUirncA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA5NyBTYWx0ZWRfXw+NDOySQ/Aof
 kwWKUPd7SE2YE+C7gkM/W7/1bMf6ogxHy5rDEf68teAEiQFC58eBDVEZVqnez+4NBAZGRRAXtDy
 Q11M8nctkF+RYp/Lz2NCIDD4ToYvXVc3wDO8AXxjH4t7YGxOE1CCgqUwwhGQz6kNp2SM4Go5XCn
 xaR6LJru8qsL98mPFU5xvhl8HNt0VhkhGAsDVTZzl38yqseQo++0gbZh1GHJGL+8ZZNWqtCp3rP
 pAMdDugBrNMzbu+2sKCAS4Si/0rEWSxAZamF82O6qEMbiKggM65dBsXktXJ5L47jfMo/4Km1Ib5
 F3hHgy/GzxyL62sCBrus3mpJj1ND4+zeaAA57UrklHXior1VZVWYnHCJv3s5kmJl3URk/nKXVjB
 DwoDNExS
X-Proofpoint-ORIG-GUID: yDY_hBpxvVTgYAbJ8kvGIHrGBwBBtOEW
X-Proofpoint-GUID: yDY_hBpxvVTgYAbJ8kvGIHrGBwBBtOEW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0
 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508110097
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

On Thu, Aug 07, 2025 at 03:34:19PM +0530, Ling Xu wrote:
> copy_to_user() failure would cause an early return without cleaning up
> the fdlist, which has been updated by the DSP. This could lead to map
> leak. Fix this by redirecting to a cleanup path on failure, ensuring
> that all mapped buffers are properly released before returning.
> 
> Fixes: c68cfb718c8f ("misc: fastrpc: Add support for context Invoke method")
> Cc: stable@kernel.org
> Co-developed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
> ---
>  drivers/misc/fastrpc.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
