Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06254B54C11
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 14:01:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0049210EC2B;
	Fri, 12 Sep 2025 12:01:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lt+f6//T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 516D310E1B7
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 12:00:59 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58CBBb3H017871
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 12:00:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 8MdWDU2Uyypxys9C+gGfTrGxJ8Ztl4i13k8tb6lf2HY=; b=Lt+f6//TKAvf+thd
 4RoLaVi38xbabaR0TvVfcaC0kLc9G720+QBnDakbquJ3gwVDgPtZL2dK6bLQYssW
 kBX3Yh0xE1GeFrkJeiaYwLN/bgMSJg1WzzGP++TI98hXn7/omCxCxIK3wyluLgNk
 qtOXTqvCYOd2B69u6zogxXTGldX4SiTHSRQkgCJU0m4Vg3GZGSqL4iQl9sZUF1bc
 Jwc/LmwvppGZkvZbcE1cPrs/k6aSaDTHzzNIGuOVAliYQloikBFzK2bsOtpYWRcb
 ZTNXwzwtevqsW/AqNlTH+c1rIbGW9eaGpvTp+/15L5QeuwxdKuxfO6BxfZ7t4DOr
 U1kC8g==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 494jdx044m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 12:00:58 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-b54adb3d19cso131374a12.3
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 05:00:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757678457; x=1758283257;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=8MdWDU2Uyypxys9C+gGfTrGxJ8Ztl4i13k8tb6lf2HY=;
 b=K9ONcFfTO77Asv0hpmm3cY3HwUbT+wLkHmjaRx6gfVKke6UtJQGAneqHhP5xhYjL8D
 EeUTvGF+0PXhcwZ+mA6EADr9tWZKo/E5ykYVmQRN/7Hajyly1jaRS1lNS8Fkv/NgQdX0
 /ZIEBRSsnVGGeL37YRcF1M2hQfX+1wZ2SanHnavjQKANrkCxZVzg3gz5Wugd+2ByTCQY
 EAvpQVu7cRXZ7fdK5GSJ7RsNdr2QBiGgu9R0jWC6N7TVdb8OPrGHa8aMzGIIYB85qKf2
 L6xE7ASdBXdI4TdXNou02qrgRJlxZim6RGCwcdx+SPtikgjeBuvkhXPKm8KwPrhO4EVl
 L4Ag==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPfYaWdK4ZIxkxxeO6s5THFQXY4AKSpT23n+/2iGVBSO+pvqKmsTNIPKVWYS91kk7p5fXbk0o2fL0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzYECWR8oKQYhDiL1iBY/W3xUVhXShBYFzMnO9EwR8L6ihjDZ/4
 Pi4fuZZl7Why+wGDyTxbo5wVH5+quDznZpUv0wgmr6D1zLYm1lLEkF9jLv3X8RWbc2/DVkKGmNU
 EqZ2HBmUxKSpcYdGA0um352vs40ePJ4KK9PqbDBuiskDgrU7GQREt3ZHnUB8bt1mBKzj05UDP28
 cejA0=
X-Gm-Gg: ASbGncukKTnGlArGfW0k1quPhk2vXp+mh5S9fMzdrDNBwkmXMLqI7eHnUOy/VtYGcX4
 Y+JOT6OGxK8jhtjeDYGWRrIzO6aVRu6a53m0434RBU8hT83t35nvYXXMyBVYUAJBfv+e3gykXLy
 ExcNzNyo0QD9NqIc4uEw/YxvbR2f4vXWPINoY660qydSxRCfG5oIM3zvEI8kMTiQkqNskbQi1yJ
 xfbJmpZ/YJvplmPBdevnH9p5lDCu+PTX504rhUDDvqooYJcO6350ytsL2lt6oQliIq3xJ1qXMBf
 RH3khRMPc355JOHyUye7ad5H3pUDNlnCZA7hp8EG0HGE24RDharL8+3XdAnI/iY8S5VMEn9zUff
 UBpgclfjnjErYXrZpuVbgG6qccIKPeA==
X-Received: by 2002:a05:6a00:39a9:b0:772:29be:e006 with SMTP id
 d2e1a72fcca58-77611fc4e71mr1825320b3a.0.1757678456684; 
 Fri, 12 Sep 2025 05:00:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEyWZ/RCwH5uoedcQ8POSwjS4P2D41yWOMHKovMkWcY5GLr2xHum8zhLBWbP5bd/3+H2e7PZw==
X-Received: by 2002:a05:6a00:39a9:b0:772:29be:e006 with SMTP id
 d2e1a72fcca58-77611fc4e71mr1825274b3a.0.1757678455923; 
 Fri, 12 Sep 2025 05:00:55 -0700 (PDT)
Received: from [10.133.33.174] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-77607a48c19sm5291497b3a.36.2025.09.12.05.00.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Sep 2025 05:00:55 -0700 (PDT)
Message-ID: <11fd5d7a-e084-4ee5-9f34-2ec0481a1d46@oss.qualcomm.com>
Date: Fri, 12 Sep 2025 20:00:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/13] phy: qcom: qmp-usbc: Add TCSR parsing and PHY
 mode setting
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 li.liu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
References: <20250911-add-displayport-support-for-qcs615-platform-v4-0-2702bdda14ed@oss.qualcomm.com>
 <20250911-add-displayport-support-for-qcs615-platform-v4-9-2702bdda14ed@oss.qualcomm.com>
 <x6p3hgatsauguzxryubkh54mue5adldkem2dh74ugf6jf3ige3@cb3mmigu6sjy>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <x6p3hgatsauguzxryubkh54mue5adldkem2dh74ugf6jf3ige3@cb3mmigu6sjy>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEyMDEwNiBTYWx0ZWRfXwimpICBAple3
 t4lE9Bc/l7PaqArBp+Q9orkXedxRDhnhbyh817QMHi0IOsIzOFuNiX0NltuwmfU+6e44Z6pk9a9
 8/McrImNNwgPmqJUJv7sw3qHM3jhrybTYMBZCz+YMnJ9alydPY+WRvb234DTukI7tk/s2z+6Q3e
 aPHSn6OWbKjulALrhd4bSAnwsIoDtrK5RVaIPSah2D/dlAPM9nFMhp0nRYtSXsUTLNrXL+jXotg
 eTZZsMADG0LvWZ3r01duZ+ayL/LvOhmEltuPASzmvK+qKkUzOX4kYaNCbN08/0SxPa6K5pLbfYb
 7QvExoZc5FOuac43xD7a8Z0wDlGfMB2EpLm8PDOmQHDb+bUROzIH09bz+WkAE58BqrzFqkRJDV2
 PZXwRGON
X-Proofpoint-GUID: af2VgePWhy3Y0U8M7-aRHtPjwl_lNUDF
X-Authority-Analysis: v=2.4 cv=JMM7s9Kb c=1 sm=1 tr=0 ts=68c40b7a cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=1bTgUAhQIaiSlqBNWd0A:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: af2VgePWhy3Y0U8M7-aRHtPjwl_lNUDF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_04,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509120106
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


On 9/12/2025 6:20 PM, Dmitry Baryshkov wrote:
> On Thu, Sep 11, 2025 at 10:55:06PM +0800, Xiangxu Yin wrote:
>> Parse TCSR registers to support DP mode signaling via dp_phy_mode_reg.
>> Move USB PHY-only register configuration from com_init to
>> qmp_usbc_usb_power_on.
> Two sets of changes. Two commits.


Ok, will split.


>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>> ---
>>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 47 ++++++++++++++++++++------------
>>  1 file changed, 29 insertions(+), 18 deletions(-)
>>
