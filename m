Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74019A0547C
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 08:26:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA53110E264;
	Wed,  8 Jan 2025 07:26:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="nOxC5UfU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BBCE10E264;
 Wed,  8 Jan 2025 07:26:28 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5087Cmeh011719;
 Wed, 8 Jan 2025 07:26:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 zp9Ud+cOXdDfjpQHab700eHaHtgQx+Qcqnt2JM8q4W0=; b=nOxC5UfUmnsmwRef
 NPdayokiE9Y7ad4N8dss/MFEVKVNbdvs1VQYfw47eU54QHS5AAR0QH6H9Kg8lzIF
 C5vLf/azr0RC8gvSx1S/k5T7JMEM0leRys+oJH7YyeDxdLCvi8xxVN38d2BJXjKv
 IJGUYj9lZKIvBa0fjFM/Gi1LbAUoSFKGgk0MsDzW4/DTrV7+0DqzMSZvzhf6PdMy
 4UacM9MthHsgrDlJ65NR4kUTP+QLZoQHz+KQ4MP17BBuSe+OtH1xd8SIS4OQ5SHt
 jnvhXh2y2yWdj3FGhyhSBY9wfB/fzTv55s/ocNzYaASXhobFIS/OErqpyY68hXCl
 +FKlpQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 441ms7g0yr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Jan 2025 07:26:22 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5087QLlb011951
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 8 Jan 2025 07:26:21 GMT
Received: from [10.64.68.119] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 7 Jan 2025
 23:26:14 -0800
Message-ID: <8ce66828-ca8d-4a16-8498-293f13ed0cd5@quicinc.com>
Date: Wed, 8 Jan 2025 15:26:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] Display enablement changes for Qualcomm QCS8300
 platform
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, "Kuogee
 Hsieh" <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>, "Kishon
 Vijay Abraham I" <kishon@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-phy@lists.infradead.org>
References: <20241226-mdssdt_qcs8300-v2-0-acba0db533ce@quicinc.com>
 <d6qiwltykiw22o2gydqguaqzf5tf5vpbzdt34qodipc6pxakfy@4tmihfn5fta2>
Content-Language: en-US
From: Yongxing Mou <quic_yongmou@quicinc.com>
In-Reply-To: <d6qiwltykiw22o2gydqguaqzf5tf5vpbzdt34qodipc6pxakfy@4tmihfn5fta2>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: Z9V45VQesq7dSuss4-TUu5BHk5kDLgC4
X-Proofpoint-ORIG-GUID: Z9V45VQesq7dSuss4-TUu5BHk5kDLgC4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0
 spamscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 mlxlogscore=951 lowpriorityscore=0 phishscore=0
 mlxscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501080059
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



On 2024/12/27 16:39, Krzysztof Kozlowski wrote:
> On Thu, Dec 26, 2024 at 05:40:44PM +0800, Yongxing Mou wrote:
>> This series introduces support to enable the Mobile Display Subsystem (MDSS)
>> , Display Processing Unit (DPU), DisplayPort controller and eDP PHY for
>> the Qualcomm QCS8300 target. It includes the addition of the hardware catalog,
>> compatible string, and their YAML bindings.
>>
>> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
>> ---
>> This series depends on following series:
>> https://lore.kernel.org/all/20241203-qcs8300_initial_dtsi-v4-2-d7c953484024@quicinc.com/
> 
> Then why this is not part of initial DTSI?
> 
Sorry. it's not part of initial DTSI, These are the dependencies for 
enabling the display MDSS/DP. Not the real dependency for dt-binds and 
driver.
>> https://lore.kernel.org/all/20241106-qcs8300-mm-patches-v3-0-f611a8f87f15@quicinc.com/
>> https://lore.kernel.org/all/20241114-qcs8300-mm-cc-dt-patch-v1-1-7a974508c736@quicinc.com/
>> https://lore.kernel.org/all/20241024-defconfig_sa8775p_clock_controllers-v2-1-a9e1cdaed785@quicinc.com/
> 
> So it cannot be tested?
> 
> Way too many dependencies for me to review.
> 
If we are only running dt-bindings checks or compiling driver files, we 
actually don't need these dependencies. You can directly running the 
test. They are all used to enable the display MDSS and DP. So maybe i 
need to update the cover letter and remove those dependencies. Thanks 
for point it.
> Best regards,
> Krzysztof
> 

