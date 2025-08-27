Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85692B3821A
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 14:17:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7271910E7CB;
	Wed, 27 Aug 2025 12:17:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="lR8vuIvd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44F7310E7CB
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 12:17:52 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57R6kJUW029178
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 12:17:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 X8RSqvNCRDDgijasg0nbutFMmtBqyja8T4LtC7m2lA8=; b=lR8vuIvdVjrFz78j
 ZphFCEx85h7qmFpG4lXcHddG6+Uo/V6xt+7hh51h9rUmisheQ/iPYr0OHEDEYnsM
 Wt9dfgxex3zll6bUY1mXRrVSULlVA1pFczVpGvBsM9QtZ+j9WdlF1XvhxgvYMthp
 r2NY1ev16MXzsOTvfUjrWyfo+tnHs7TdEIINU4XQac0ygWRPBBci1JV7hjE7VGEM
 1W//Rw9/SIszUvctz6T6wpKOCoR6IpbB8wDNmFpxQEl/pQCeRogqEW2LXLimkmPS
 RLJvSgZPvb+6nYNgNhVO4HdLoUvX+u3wgGinYyuXSD+old4avxQkFK9T0vD0pIx1
 1OaPMA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5umcpmr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 12:17:51 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-24457f484d6so24704775ad.0
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 05:17:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756297070; x=1756901870;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=X8RSqvNCRDDgijasg0nbutFMmtBqyja8T4LtC7m2lA8=;
 b=Z6xzc6mVF1Kfj68IyROvxPFyxAbSfJeX+45jqgmvgHEJZZjSVQhPFrl5Ev2KsllFjQ
 gpMm1FksRISZRWp67hBDY+wDTjOhRIYaMffL/t4D6Y/LFm44MVRrdtxl/bNaFHAnme2d
 RuC1VkHl/R1V6EAdi8msF5pSgEovRFQJ0MgJhrD/V9beBtxubu4aqS5NWP+8DAFCH3xs
 1l7IJsZhxPs3Yp7mCoXVh0zIkiMQHrtFsEICky2dZNZ9qrAFzGBfTACcDOdOk1FJT1MP
 QlFvl7vjhd6HpiAe80ywIot3ANsqHspL1Dw2cvoGOHbGQptjOdHqvsyoLuZLWfjbgxww
 BObQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW32QxhoAbe4PEvWeKdLqdRD8kDweSZJWX/PegedpG5hkHNl/S0BoolxRKxnORMxrqVW+lcjuHzL3I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywu5IxRpVuw3NlIwulOLGdux16uX6qte1pbHpj6q6ubzbqOC8Rn
 B9sZ/OIWHJlyVkjrSZXkPTsHYi51+j2ateGHATOw3gnX13cBBcizNudEsuvnSHNrbSyfogE2w98
 okX6m/d/cK0Scs0XbMyAduFyCHniTozYIdWNDl05sYINWYzF5biTSaQo8i/C7MC6tRfGI7ck=
X-Gm-Gg: ASbGncutEukuMgaoMgiEj+aoq5Mcan+w5e9etDWptmhGxkHL4RWoDa10k9tdNjrclL1
 Jb51yL2BDI/BW87MfcKs8/rdKXBpormHdwDf93lCrTXkRNFpg8ZF86NDUZ8QTAHegMkH9hMJ7ZZ
 GBbR14gXdmkDFkEHsUsO4XhRzVH+KQ5S2GrU3pH9ZB78wXTXfWQWvg6VZ7OuizO+DJLgIHrOoSK
 CmCtnCFwbE/TRVvdG2zSPA4s6tjU0Ja1mrziBfo3YOoBkngcTyizVIUuIeA0syJLcT8+z1n+X67
 spjDVXYid/edv93mIDv4qDae0uqmVl9PlB+PupMDFzGJogfu5naog9D05xETz3zGer8Kx5FHESH
 mpqxqu3Urs7nFQ1z6QAnAFX2hDyOecA==
X-Received: by 2002:a17:902:fb8b:b0:248:bf0a:a127 with SMTP id
 d9443c01a7336-248bf0aa1bfmr1663445ad.1.1756297070528; 
 Wed, 27 Aug 2025 05:17:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWwdfvw8f7MeJn13rr7IAskUSFh8jN+On8IyJ79l4iyWHwbCU7vdfd6HxX6olsZxDiEsjN2A==
X-Received: by 2002:a17:902:fb8b:b0:248:bf0a:a127 with SMTP id
 d9443c01a7336-248bf0aa1bfmr1663025ad.1.1756297069957; 
 Wed, 27 Aug 2025 05:17:49 -0700 (PDT)
Received: from [10.133.33.166] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3276fcd3285sm1910956a91.14.2025.08.27.05.17.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Aug 2025 05:17:49 -0700 (PDT)
Message-ID: <9bf7f51b-dcfb-4ff8-848e-dcf144936f2e@oss.qualcomm.com>
Date: Wed, 27 Aug 2025 20:17:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/14] phy: qcom: qmp-usbc: Add DP PHY ops for USB/DP
 switchable Type-C PHYs
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, fange.zhang@oss.qualcomm.com,
 yongxing.mou@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, quic_lliu6@quicinc.com
References: <20250820-add-displayport-support-for-qcs615-platform-v3-0-a43bd25ec39c@oss.qualcomm.com>
 <20250820-add-displayport-support-for-qcs615-platform-v3-9-a43bd25ec39c@oss.qualcomm.com>
 <3pr7ninjxr4pgsz56dr6ojjmx27fzzszmtt6mx4r6qaqt25tnc@nrgx5qiqc7z4>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <3pr7ninjxr4pgsz56dr6ojjmx27fzzszmtt6mx4r6qaqt25tnc@nrgx5qiqc7z4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=VtIjA/2n c=1 sm=1 tr=0 ts=68aef76f cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=eEvFyuGTnR1_S7nXHuIA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMiBTYWx0ZWRfX7ub4qyXF1BY8
 qmDUJ29/HZRuv+dfF9/5cylKn0fL4QZVX1388QdlfMKJ3ARBRkN6IrWDi2Cmrv0vnKEeC0vxKBY
 FPOJgygM8MoKVPfFRpZfp7kyJeBCAauZyZ2xBVNZgYw8SAd3e+LGSzYHpI0/e1cM/W0UwyNTkF/
 KRBY+2dEuNEeTGGFH+hTnRqt2h6RWzN/2YknyWZA4844OxWEv3BkTbGoSntfj8fa6/ZtObINN7B
 fNuASFgWYLcBRzanFPB15eu4kP6JQEgqPK/ad5gsoFdKHNSNiZdT7D4XHbiAxhiZrI5FrI0uKqQ
 fR89VxodMuLnub/3MK/bpsZhsKi1eH3cArVwcWj96iGn1fttAECh+W5eQsrxDUSMB1bXovTprkT
 nTB0Mu14
X-Proofpoint-GUID: tzCggdtSG0C8RD1y_XKKpbKuNotQRb9H
X-Proofpoint-ORIG-GUID: tzCggdtSG0C8RD1y_XKKpbKuNotQRb9H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-27_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508230032
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


On 8/20/2025 7:45 PM, Dmitry Baryshkov wrote:
> On Wed, Aug 20, 2025 at 05:34:51PM +0800, Xiangxu Yin wrote:
>> Define qmp_usbc_dp_phy_ops struct to support DP mode on USB/DP
>> switchable PHYs.
>>
>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>> ---
>>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 163 +++++++++++++++++++++++++++++++
>>  1 file changed, 163 insertions(+)
>>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
>> index 1508a4a5f57aff85318485b79528325f28a825a4..a1495a2029cf038bb65c36e42d0a4f633e544558 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
>> @@ -22,6 +22,8 @@
>>  #include <linux/slab.h>
>>  #include <linux/usb/typec.h>
>>  #include <linux/usb/typec_mux.h>
>> +#include <dt-bindings/phy/phy-qcom-qmp.h>
>> +#include <drm/bridge/aux-bridge.h>
> This one is not necessary yet


Ok, will remove unnecessary aux-bridge related part.


>>  
>>  #include "phy-qcom-qmp-common.h"
>>  
> [...]
>
>>  static const struct phy_ops qmp_usbc_usb_phy_ops = {
>>  	.init		= qmp_usbc_usb_enable,
>>  	.exit		= qmp_usbc_usb_disable,
>> @@ -1095,6 +1248,16 @@ static const struct phy_ops qmp_usbc_usb_phy_ops = {
>>  	.owner		= THIS_MODULE,
>>  };
>>  
>> +static const struct phy_ops qmp_usbc_dp_phy_ops = {
> Please try restructuring your patches so that there are no unused
> warnings in the middle of the series. You can split the next patch into
> 'parse' and 'enable' parts, then squash this patch into the 'enable'
> one.


You mean it's better to define and register new functions in the same patch 

where they're first used, to avoid unused warnings? And for things like parse_dt and phy_ops,

it's fine to split them into separate patches if each part is used right away?


>
>> +	.init		= qmp_usbc_dp_enable,
>> +	.exit		= qmp_usbc_dp_disable,
>> +	.configure	= qmp_usbc_dp_configure,
>> +	.calibrate	= qmp_usbc_dp_calibrate,
>> +	.power_on	= qmp_usbc_dp_power_on,
>> +	.power_off	= qmp_usbc_dp_power_off,
>> +	.owner		= THIS_MODULE,
>> +};
>> +
>>  static void qmp_usbc_enable_autonomous_mode(struct qmp_usbc *qmp)
>>  {
>>  	const struct qmp_phy_cfg *cfg = qmp->cfg;
>>
>> -- 
>> 2.34.1
>>
