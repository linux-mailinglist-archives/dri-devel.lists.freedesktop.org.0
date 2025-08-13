Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C47B246BC
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 12:11:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58C2110E6D8;
	Wed, 13 Aug 2025 10:11:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="IvYpBxFL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEA7410E6D8
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 10:11:35 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57D6mJHN020480;
 Wed, 13 Aug 2025 10:11:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 SDdsL8W7SZHCUhYBCtKZ6SyWWtrmiQbBOrfuoJ+zh/I=; b=IvYpBxFLcMorq6Jh
 XfFLNNsbPWEySKC+0CzBSxk4bupQgiIteemi/QbAVZGpaeOf0Rp9dD81e6lvUwgH
 oJZOuqh+HxmnBGlzXjh2q2cMkL665YFJOvre1dWecum8BJC7ZAxjy63VMhisl//J
 u/niOZLqitpofNQbIiZbb3OBtJxZJKBU8VnyfQURa75uAPLJrgtWLPX+XGslQ33t
 TjbP4q4y0WiAJcQWSbP3qLY30rLHb9ZNEax7aI6cu8OTLGawJTarWbky1cue2k97
 UW4RY2Q5kkHD/qEv5/kh0pvHevUa7m0Mzvx9tdVWx+JwiQg4YZD11q46huwoPsD7
 7O45Sg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48eqhx9hcn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Aug 2025 10:11:30 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
 by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57DABSnT012777
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Aug 2025 10:11:28 GMT
Received: from [10.216.12.250] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 13 Aug
 2025 03:11:21 -0700
Message-ID: <aff2522e-4bd6-40ad-9c2e-33164ce0ece1@quicinc.com>
Date: Wed, 13 Aug 2025 15:41:18 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 07/11] firmware: qcom: tzmem: export shm_bridge
 create/delete
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>, Jens Wiklander
 <jens.wiklander@linaro.org>, Sumit Garg <sumit.garg@kernel.org>, "Bjorn
 Andersson" <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Apurupa Pattapu
 <quic_apurupa@quicinc.com>, Kees Cook <kees@kernel.org>, "Gustavo A. R.
 Silva" <gustavoars@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
CC: Harshal Dev <quic_hdev@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
 <op-tee@lists.trustedfirmware.org>, <linux-kernel@vger.kernel.org>,
 <linux-hardening@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linaro-mm-sig@lists.linaro.org>, <linux-doc@vger.kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
References: <20250812-qcom-tee-using-tee-ss-without-mem-obj-v7-0-ce7a1a774803@oss.qualcomm.com>
 <20250812-qcom-tee-using-tee-ss-without-mem-obj-v7-7-ce7a1a774803@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <quic_kuldsing@quicinc.com>
In-Reply-To: <20250812-qcom-tee-using-tee-ss-without-mem-obj-v7-7-ce7a1a774803@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEwMDA1NyBTYWx0ZWRfX3nuO0Ki1uVpt
 JEmwS5OUQDDLUSH+QO6zOLdfDt7IF3F3DUpv4kSI2uikvrV0lyuPIhEa266kmPvpywiDOA08tWd
 9t4b8cgt2cUJBzZ/80hwPbqSecFPeN8K33oDhs8iHWmjFwiDgVM/4Ag3eFeCpawMtXEPJcWtzYk
 mVqXPVHoiaHOE1Eedizl+hs11OiH2x+Lk8Plyoq17OFZXIZQ7O1TXHwMZVF2LMbEf4/zape0tOK
 cCYl2iUCexq5+XcFW4SfUolyZRo/w5yGWhrIR6muUVMH31SAgzEEeI/BFupgzlrTgCUYcmtYbjR
 yjk4+6P13EVAXVzQErdjwn4mrTtIWvXkK+TjRN5YoMRIdILWpHtdeF/mbRgbo67fIBaeVoOK/qN
 qEd1m/qs
X-Proofpoint-GUID: 6ardTYuiCnCBogxGxjA7hF6rwOCf87V7
X-Authority-Analysis: v=2.4 cv=aYNhnQot c=1 sm=1 tr=0 ts=689c64d2 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=sWKEhP36mHoA:10
 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=K2HPmFf91DVsvopL9hQA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=cvBusfyB2V15izCimMoJ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 6ardTYuiCnCBogxGxjA7hF6rwOCf87V7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_08,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508100057
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



On 8/13/2025 6:05 AM, Amirreza Zarrabi wrote:
> Anyone with access to contiguous physical memory should be able to
> share memory with QTEE using shm_bridge.
> 
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
> Tested-by: Harshal Dev <quic_hdev@quicinc.com>
> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>

Reviewed-by: Kuldeep Singh <quic_kuldsing@quicinc.com>

-- 
Regards
Kuldeep

