Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D142B54BB0
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 13:54:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A308310EC2A;
	Fri, 12 Sep 2025 11:54:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="caipe07O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B22F910EC2B
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 11:54:40 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C9fITX018577
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 11:54:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 CL+lI9VYcTxc1ylzMUGhgewY3tUhb2X7dvXH5IYD2tM=; b=caipe07OT38c4Ooj
 i5GS6gjRDKPJxngB9qSRS3lGHGBzaJ23DY1OTTMbT9bFx42LgXJB1JMNi50SDOXX
 CYaUzwoqLP6lDS91llXVumAo+FErbCJnBbN81ZdvAYdvP0AAQY7u/PwnCXh6YYq2
 5zTjWuIP9tm9erikfJ2KkwjRRGCGYe4Kb8DDwy0M/DwY1qZNg+1NujGaHY57X94D
 PW9oukioENMcRLyAm0X4EXawsB+GZNqRKLfBojab1Wy/LTBYcI0rHX5PWXp8g8Zv
 CdhJNLcL0IsSP2ds/+7iSiRHYRtuFK7Ax80KpGgUPo3j5Pq95ANq5TAj+hHoInr1
 ZiK/tQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e8akhkq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 11:54:40 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-b4e516e0e2cso340155a12.0
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 04:54:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757678079; x=1758282879;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=CL+lI9VYcTxc1ylzMUGhgewY3tUhb2X7dvXH5IYD2tM=;
 b=slwJ15h4qgY0jIqcsa0GRq1trKJLcOVYzawpY3NA/rkIfo6hZcGhz3W9IdohAW7Pj3
 BcGjYm5wEpzpbXuw9zY2f7CSTNLcLgkYauNdWb7ICMJtxkf1H8caeftVnvsyH27U9mTO
 l7ibRFb7iD/aviMjYHiwKYF5K1cVu+OSv9LodPWEokYYeFKJjClEYxd/PI9xkFbhtUV9
 KK5/djyYiSDBEl81v/REsVzWiNhEaWfrzro2D8ieRA944wtoKU4rvACRH4Ey56/ViHcB
 t+1Qcf8J2CNLj2Rm+MmZpZBc/d67/4Tt4YTvmcsG6GiYRZRiR9BDIqfWOEgMu3qJteXd
 4yvw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXovz9c6AoWQedGvUYEE8sBumIhqMnlq3W14zyO0+Qeh/rYdb7IBO3Q4zSkjYmTWTBc7HAFzWlwDuw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwPH/Q2nGWAMWv1EMiB5yLtbxtYBTNpvtG8gS38bmwWrhkfNed1
 N3j9AKSiZGFm7wz2BK8J2QC2vzszndeIVGyB3KXJwKuPlbuVDQZRyroeJr0IHUvi/ro00Nk/hgY
 ZZuDsLlJLqEN2o18ibHNYFH/Fsbmp9xNHRnNksOrd+qGrkYGqQaKVGKHbhfjGmNvSNdyeqgE=
X-Gm-Gg: ASbGncs1aO6dlB9i+11B88EjL7sWRWS0UETgKSf6SdK/f/A4up5iEUBNFmcMYaGiPdN
 wa8c9SwgZX8CcipR+EDpOvEXWTNwPla02ASgRSoKyiIA6gZII+axMJUa++U4WvCJy7mNN4cYEVX
 t6ii8NzhvPGYu+Lxg8fGW+K5dQ0piLK7DYcPy5MwTw3/GXLraUuhwGWtiV1Umwr88fSW+yR8hcx
 PvrRgb4HCc8vYwH2cQ+nY/96t958GUFTb1NF+3+Zkn/cm/E3M/Iy+9Jzlgd7yeybTI/fuzqikas
 LrQl4KnQ2PZcpSETpI7sp+w8tYhge+WMWDwD2TjzdDx8k7UoSt3gpPO7GbU432jJMr+e0CYHfcr
 9qZdOTy377U0vkuDGrjHITkB82y3yGg==
X-Received: by 2002:a05:6a00:181e:b0:755:2c5d:482c with SMTP id
 d2e1a72fcca58-776121ec346mr1687406b3a.4.1757678079345; 
 Fri, 12 Sep 2025 04:54:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGBzCCMI7c4SuCgUNoxpx0ryUhDrHgck7Ry4SOIXMr3U9+ASTVocgB9v5TDYgVMzzCnDhSBlA==
X-Received: by 2002:a05:6a00:181e:b0:755:2c5d:482c with SMTP id
 d2e1a72fcca58-776121ec346mr1687392b3a.4.1757678078920; 
 Fri, 12 Sep 2025 04:54:38 -0700 (PDT)
Received: from [10.133.33.174] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-77607a46b7asm5251168b3a.22.2025.09.12.04.54.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Sep 2025 04:54:38 -0700 (PDT)
Message-ID: <d3743c52-4e84-4729-9f64-af856419d504@oss.qualcomm.com>
Date: Fri, 12 Sep 2025 19:54:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: display/msm: dp-controller: Add SM6150
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 li.liu@oss.qualcomm.com
References: <20250912-add-dp-controller-support-for-sm6150-v1-0-02b34b7b719d@oss.qualcomm.com>
 <20250912-add-dp-controller-support-for-sm6150-v1-1-02b34b7b719d@oss.qualcomm.com>
 <sx64y6vfov4yag46erckpbl7avwmqlsqt3siebckn76m6jqxjh@f5lueyih6n3q>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <sx64y6vfov4yag46erckpbl7avwmqlsqt3siebckn76m6jqxjh@f5lueyih6n3q>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=H7Dbw/Yi c=1 sm=1 tr=0 ts=68c40a00 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=1DKY8yufIZSdyzbmga8A:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: 6rZ79A534cK1URqXN0OIjU_s1oM2oJ1t
X-Proofpoint-ORIG-GUID: 6rZ79A534cK1URqXN0OIjU_s1oM2oJ1t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOSBTYWx0ZWRfX2J3k4B3h2EQZ
 uvUX0UGGkCczQm13gbZB+bKSXzvCjbQHkLCzZXnMxbJ8V9jWj5cvPydSGV1h6eKDk/KKdqnzhlP
 /c2DnRf8aTHnadCELu0hwSc4Mg93doge0q+2hQAL5iasZX2nWh5G9eLTascv0ED/5F5V12VCfet
 +zI+0BrepTJA9ZiXIYaaG5QTeTx+ZBLT+vo9Pt3ss4s6ob5EayNZt6ur78TyHQuhCXd4fLA5XtI
 Mv/cfg7DIYlPUnHYU8tc7NlAkD3bzpFndhC2seviaZfTVkd1PdGnbfXjMdUFd6t2LYXyUKYsEsS
 NllqN5IbjDfcPBmFkPvllI87iQdgYZq6rTb7v6LPUsFr4y0UAjuzchF0n59Alqf9aeO5HDQqpzy
 25GUmtCv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_04,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060039
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


On 9/12/2025 7:46 PM, Dmitry Baryshkov wrote:
> On Fri, Sep 12, 2025 at 07:39:16PM +0800, Xiangxu Yin wrote:
>> Add DisplayPort controller for Qualcomm SM6150 SoC.
>> SM6150 shares the same configuration as SM8350, its hardware capabilities
>> differ about HBR3. Explicitly listing it ensures clarity and avoids
>> potential issues if SM8350 support evolves in the future.
> The controller is exactly the same as the one present on SM8150. HBR3 is
> a property of the PHY.


Ok, will update commit msg.


>
>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>> ---
>>  Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>> index aeb4e4f36044a0ff1e78ad47b867e232b21df509..2bebc182ffe348fd37c215a6bf0becea11e5ac15 100644
>> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>> @@ -46,6 +46,7 @@ properties:
>>        - items:
>>            - enum:
>>                - qcom,sar2130p-dp
>> +              - qcom,sm6150-dp
>>                - qcom,sm7150-dp
>>                - qcom,sm8150-dp
>>                - qcom,sm8250-dp
>> @@ -261,6 +262,7 @@ allOf:
>>              enum:
>>                - qcom,sc8180x-dp
>>                - qcom,sdm845-dp
>> +              - qcom,sm6150-dp
>>                - qcom,sm8350-dp
>>                - qcom,sm8650-dp
>>      then:
>>
>> -- 
>> 2.34.1
>>
