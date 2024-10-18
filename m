Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 740659A3AFB
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2024 12:11:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77B3710E8D0;
	Fri, 18 Oct 2024 10:11:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="o5E0K5oF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B769210E8CE
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2024 10:10:58 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49HNPc2a017530
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2024 10:10:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 OXPIMmd9oqpiU+5EJi5igCXiHCqmSyos23ulQ9gEwq4=; b=o5E0K5oFjiSKTcOX
 9gdp3dfxDqExP6bQ31GIjBJ8hCnA1VujrvA1bwGWq90IWTWFjz8Lpmh5RxQP7rTZ
 LA5PNTE9Tae7W5tRErXWvDh+LeBRx0pnckBWd6cXDv49yzM3Zd0q7EQQRP+Fl/XM
 ah1JBG8TSD9ko1gU+yKXyijL0avJBrH5rZURXjOSBNdOYA+G+A+cbMPsKSM76MMr
 3JnWYcvm4QC6g7dvUV1JZE2wclwo5UI6ZSJyoD9wPM+e8rJ7a08sLkgbKYoWhtvS
 Cypv1KrNbkOi3dKoQCiC2ouTONSxjLoANyEuOs3C+2oaLKlotSDHf+CWQ6kBRavj
 XLBU5Q==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42b0rx3mu0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2024 10:10:58 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-6cbd0a3f253so3752866d6.3
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2024 03:10:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729246257; x=1729851057;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OXPIMmd9oqpiU+5EJi5igCXiHCqmSyos23ulQ9gEwq4=;
 b=i/a92z6rPeAxZmkPoNnqhqKV0yToc3+qJTBQgh3QtjOvVxnmSD9/P9Pq7/4eRVe+aX
 J792UirMp0gHHIR+firp+T+J+bsTwYkrEhx27aYFKN2PMlu5lcOvSa6MClC+lWUJXX0y
 s/tAW816D/cw1wPFEG6h6w9+HrzLYIoi05EBvfpBdQeKgHbGhOLECl3JhO/jKzyye5tG
 aYT5g0wHzfbFvsrTVxxTwuEVwYGcYOShbbdQROxA8qK7mc4t8rDNNJv7phoEcB0NvE9I
 m1qRT01Kf+xuL9vBKfL7oljiGElpgbKNhUkqPdW53Rlzm/ucD2ZfnctB0TDQjG8VlfB3
 cPPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/txswmDGeGEFjrsw9CbPbpg2zsNZSE97V/cjv2vUqyEoBCZIAiUdL59WAyeCidp0bUgb8F0EsTkU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy2SVnBhug8VAlochnoNSMQHTE0TmWefEUvvSJ976NdZjRXZsdX
 //k6HUqCf7qoBasLDFweAkHZa5XVly0oLpTAEQT2hTG2QfcWKVkaiAVAfqLiGfpFwIoOMVPjNA8
 c5VOYAEHzsarIAe+o2It5leRUlgrv0KRJxILYroTHAj+Xl79Dv4M2XTZu3nv+7kmmkYE=
X-Received: by 2002:a05:6214:20e2:b0:6cb:c67a:efe8 with SMTP id
 6a1803df08f44-6cde1669439mr9594876d6.12.1729246256748; 
 Fri, 18 Oct 2024 03:10:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF8jTJw5JnqOjmxBso/awk/XKCbh2dxRKjYIFmIjcpQmKruPvbZM706UA18QnHB/2tWFCQ8IA==
X-Received: by 2002:a05:6214:20e2:b0:6cb:c67a:efe8 with SMTP id
 6a1803df08f44-6cde1669439mr9594456d6.12.1729246256249; 
 Fri, 18 Oct 2024 03:10:56 -0700 (PDT)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a68bf7173sm72992066b.167.2024.10.18.03.10.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Oct 2024 03:10:55 -0700 (PDT)
Message-ID: <bb73e6ce-537a-413e-87ea-ac8256313c46@oss.qualcomm.com>
Date: Fri, 18 Oct 2024 12:10:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/5] Add support for DisplayPort on SA8775P platform
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>
Cc: vkoul@kernel.org, kishon@kernel.org, konradybcio@kernel.org,
 andersson@kernel.org, simona@ffwll.ch, abel.vesa@linaro.org,
 robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run,
 marijn.suijten@somainline.org, airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, quic_khsieh@quicinc.com, konrad.dybcio@linaro.org,
 quic_parellan@quicinc.com, quic_bjorande@quicinc.com,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 quic_riteshk@quicinc.com, quic_vproddut@quicinc.com
References: <20241018070706.28980-1-quic_mukhopad@quicinc.com>
 <vtfz5vteaedwrqw5cpggmd3esi2rky3f2axubxukh74wdux4uy@zdac7miws5lu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <vtfz5vteaedwrqw5cpggmd3esi2rky3f2axubxukh74wdux4uy@zdac7miws5lu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 5co6T6N-wAZ3W9pqZ6pLUGdciiBNHHd0
X-Proofpoint-ORIG-GUID: 5co6T6N-wAZ3W9pqZ6pLUGdciiBNHHd0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015
 mlxscore=0 priorityscore=1501 spamscore=0 suspectscore=0 impostorscore=0
 mlxlogscore=923 malwarescore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410180065
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

On 18.10.2024 12:08 PM, Dmitry Baryshkov wrote:
> On Fri, Oct 18, 2024 at 12:37:01PM +0530, Soutrik Mukhopadhyay wrote:
>> This series adds support for the DisplayPort controller
>> and eDP PHY v5 found on the Qualcomm SA8775P platform.
>>
>> ---
>> v2: Fixed review comments from Dmitry and Bjorn
>> 	- Made aux_cfg array as const.
>> 	- Reused edp_swing_hbr_rbr and edp_swing_hbr2_hbr3 for v5.
>>
>> v3: Fixed review comments from Dmitry, Konrad and Bjorn
>> 	- Used a for loop to write the dp_phy_aux_cfg registers.
>> 	- Pre-defined the aux_cfg size to prevent any magic numbers.
>> 	- Added all the necessary DPTX controllers for this platform.
>>
>> v4: Fixed review comments from Dmitry and Krzysztof
>> 	- Removed the "reviewed by" and kept only the "acked by" for 
>> 	  patch 1.
>> 	- Updated the commit message of patch 5 to mention specifically
>> 	  about the validation of "only" MDSS0 DPTX0 and DPTX1.
>>
>> v5: Fixed review comment from Dmitry in patch 5
>> 	- Aligned the register starting address for display port as part 
>> 	  of device description with respect to other targets.
>>
>> Below patches are applied:
>>
>> [1/5] dt-bindings: phy: Add eDP PHY compatible for sa8775p
>>       commit: 7adb3d221a4d6a4f5e0793c3bd35f1168934035c
>> [2/5] phy: qcom: edp: Introduce aux_cfg array for version specific aux settings
>>       commit: 913463587d528d766a8e12c7790995e273ec84fb
>> [3/5] phy: qcom: edp: Add support for eDP PHY on SA8775P
>>       commit: 3f12bf16213c30d8e645027efd94a19c13ee0253
> 
> Please in future skip applied patches instead of including them into the
> series.  No need to resend the series just for this issue though.

(you would normally do this by rebasing your tree against -next
and having git rebase-skip the ones already present)

Konrad
