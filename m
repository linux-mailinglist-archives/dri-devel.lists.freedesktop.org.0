Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 372EAB1BFE3
	for <lists+dri-devel@lfdr.de>; Wed,  6 Aug 2025 07:27:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26F5B10E726;
	Wed,  6 Aug 2025 05:27:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="E6S3LKRX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E305E10E39D;
 Wed,  6 Aug 2025 05:26:59 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5761f1Y6027758;
 Wed, 6 Aug 2025 05:26:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 8oGRrwvw8cPWXvzaJPfOYd2IpSAIAtLyqKQTvY9ISGg=; b=E6S3LKRXZJaR7P+L
 afGJKx1eQkNksw0lYYYJmM59wl+HNUMQAUMKA2KqW+tAohPGQdwUwUNXE1UxDNke
 a2ljvLECXiViyCDhj0e33S3GV8ulrsvS56AA4AdpbNZqkSBhd3JI0X6wUMHdc7sJ
 I4COVzgscKA/0+y7OR8pQcSYv3liuz45IM4J0g0Bg0wgdnLp+G4CRyO/BH4hKGnr
 6ocJ6GhxmSsL4u3k7ACPxGXNxpBuRvA40MdVfhn693Gm/y+FUV9DN/DcuOzbTSkJ
 xcwf0uSDU01PIpoULZ9jBDJhJ+3J9kWTB+KkVVFmcXMibgTIWloFqoMNEwGWmeQr
 BXxtiw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpyb9he7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 Aug 2025 05:26:51 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5765QomM010731
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 6 Aug 2025 05:26:50 GMT
Received: from [10.64.68.119] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 5 Aug
 2025 22:26:44 -0700
Message-ID: <2c88cbd4-7ab8-4834-9300-c8b6c4c688a3@quicinc.com>
Date: Wed, 6 Aug 2025 13:26:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/6] dt-bindings: display/msm: dp-controller: document
 QCS8300 compatible
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang
 <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, Kuogee Hsieh
 <quic_khsieh@quicinc.com>, Bjorn Andersson <andersson@kernel.org>, "Konrad
 Dybcio" <konradybcio@kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
References: <20250806-mdssdt_qcs8300-v6-0-dbc17a8b86af@quicinc.com>
 <20250806-mdssdt_qcs8300-v6-2-dbc17a8b86af@quicinc.com>
 <b24ln55wgmjzksugbowgilxqbnp6d6mgq4cdqljrj4jftuefa5@gjcszc3t4bqg>
 <179982fe-ff3f-4d57-9ac9-15f0512facb3@quicinc.com>
 <b3tgv7zhiix5rzrw4xv5rtaoaikstdew5lo4htvepl4phl44dx@q3xztyk6fagy>
Content-Language: en-US
From: Yongxing Mou <quic_yongmou@quicinc.com>
In-Reply-To: <b3tgv7zhiix5rzrw4xv5rtaoaikstdew5lo4htvepl4phl44dx@q3xztyk6fagy>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfXyyRrxzlCJ/Ha
 pPAjSk+4VwMZOOOvewE97PVBuGb86lgVl0VgqDAblPZ0u+XdJ8zan3xSWiV8xWT59eLx5RG8/Vp
 1MpUpD1vfcForghTpPniD795rsOpvnXvr/YHxqlKdz7kbOpo7FZRDF1nLK7+3aexOZAIjis6rQM
 0v28+VYPR3LnyLphLWsqpbuT5VciU/HU39yxhxwLhgj6CaBOatkYkMGITtrH/IoMoGAse02u/kl
 5VXcoOgzGFXZ5f/9tACQkv6lvKwnmIO7XxMn5Q2jy+YbY9YJr0zY02Ck8wp36vpSnU363Cfgtu+
 dAWrcBZ6pENQDKesG8Dhy9lVKZpIU0YDDvJI/TS8KVI3Q+mRmNlSpI46EgBJhrHC+wgZc+P6+yc
 HUgdx0vu
X-Proofpoint-GUID: 6ZrFc1r1XmiVWkdfnk4wBP00b2g42qqz
X-Authority-Analysis: v=2.4 cv=EavIQOmC c=1 sm=1 tr=0 ts=6892e79b cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10
 a=KDXxRo0yZI-lJWp5Yt8A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: 6ZrFc1r1XmiVWkdfnk4wBP00b2g42qqz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_05,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 adultscore=0 bulkscore=0
 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009
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



On 2025/8/6 13:09, Dmitry Baryshkov wrote:
> They are different patches, reviewed by different people. C&P might be
> helpful enough.
Got it, thanks, will update in next version.
