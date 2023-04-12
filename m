Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B41126DF7E1
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 16:01:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1BAF10E4E6;
	Wed, 12 Apr 2023 14:01:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20B8410E4E6
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 14:01:12 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33CBpQua006625; Wed, 12 Apr 2023 14:00:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=Kx0xEj5ibby/4YuMZ3PzpN3/KHRATd6Xy9DE1Qil7Eg=;
 b=pWvt5t4AolRa+kNa+YAy8QoAx8BEVTRWGjhXobGpXKn/5pRELhoDoIGG+JS8sqew1giZ
 1v5UaHzPFZ7ZyE0gMHd3wRvXDPttwEtl4P6DcXN8Tv0xcXIQXOAn8YYVZ0I24dKvbZCv
 l3ewPyy3FR+5UjJz9nOilLPxFbKtc4562d2tZM7pVvuSL33240tnjMNSPE8addpDv7Mi
 bzAMWx/+o79rsOLGu+nPwyuH3JwPJfabn25FnPSyHqe/X4kmgGO0l4F2f0Ig4sZJOzul
 Jh2jAAzw8gt4FkfXeW4vArFEnfXDxC3A/66Fjdr7y3nekDD1ne7r5r9yc7wwar3/9vNW cA== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pwqnq0xjy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Apr 2023 14:00:35 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33CE0YPW022752
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Apr 2023 14:00:34 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Wed, 12 Apr
 2023 07:00:33 -0700
Message-ID: <4e81bfdc-c20a-9e54-7d1f-40bd9f91c758@quicinc.com>
Date: Wed, 12 Apr 2023 08:00:33 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH] Revert "accel/qaic: Add mhi_qaic_cntl"
Content-Language: en-US
To: <daniel@ffwll.ch>
References: <1681307864-3782-1-git-send-email-quic_jhugo@quicinc.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <1681307864-3782-1-git-send-email-quic_jhugo@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: xD7agUj8X9ud9rybRARwnD0uaoLZloVG
X-Proofpoint-GUID: xD7agUj8X9ud9rybRARwnD0uaoLZloVG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-12_05,2023-04-12_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 impostorscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 mlxscore=0
 phishscore=0 clxscore=1015 spamscore=0 adultscore=0 mlxlogscore=962
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304120123
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
Cc: sfr@canb.auug.org.au, mani@kernel.org, greg@kroah.com, ogabbay@kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 quic_pkanojiy@quicinc.com, linux-next@vger.kernel.org,
 jacek.lawrynowicz@linux.intel.com, airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/12/2023 7:57 AM, Jeffrey Hugo wrote:
> This reverts commit 566fc96198b4bb07ca6806386956669881225271.
> 
> This exposes a userspace API that is still under debate.  Revert the
> change before the uAPI gets exposed to avoid making a mistake.  QAIC is
> otherwise still functional.
> 
> Suggested-by: Daniel Vetter <daniel@ffwll.ch>
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Reviewed-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
> ---

Daniel,

Assuming you find this acceptable, would you please merge it?

Sorry, but I'm still working through an internal process for my drm-misc 
commit access.  I anticipate having that resolved prior to future changes.

-Jeff
