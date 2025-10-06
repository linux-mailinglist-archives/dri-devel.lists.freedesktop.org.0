Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16844BBD5A5
	for <lists+dri-devel@lfdr.de>; Mon, 06 Oct 2025 10:30:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6149C10E3AE;
	Mon,  6 Oct 2025 08:30:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="DDhVqSS9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF1B210E3AE
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Oct 2025 08:30:28 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 595NxriH020199
 for <dri-devel@lists.freedesktop.org>; Mon, 6 Oct 2025 08:30:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 /L1grXilGVTKm+qKpyor+cgwpOJFQIDTL8Rar0TzJG4=; b=DDhVqSS9JcY0Jc8m
 jyQMB9h0yP96EP61LBGxnmgdUpsPoKyoV/Kv7Y0jVT8kQFsJVQUiQL0T3UqexWIi
 8hcWnW9yLrrxT5N6Qj1DqJ/QoMxSpLY9li+95Y4SiEf0fKT9TyfoV52glcV84Xdn
 YDwrZ5aMDoZWF+58kc5pNGsZyO0xJiUS3pysN844F30fZzwI92r4EIAo7Ke9it2G
 ewtmvhHcR5fHU3AJG6KiJbKt+UT30aHPT8+qDgYa4w+LIE9aGpgOj/+v6y37hg4p
 QJepv0vO+vzlDXpEEdiaudL/XHqGQaBuEHVgJH3yU+4xG1e0Z074q7ShDZBV7ws+
 ufq+ng==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jvv7k5e5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Oct 2025 08:30:27 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-865c7dee192so100652485a.2
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Oct 2025 01:30:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759739426; x=1760344226;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/L1grXilGVTKm+qKpyor+cgwpOJFQIDTL8Rar0TzJG4=;
 b=e51srdk7TdGAzMmII4ex+EiqkP+FWXwxKPsXfLD51ajmty1VF/eEqaMRTHv9OZSjFm
 egsUAVM3B8Lj0PVzB4zwOtFLEwWBJy067gVSVGS2UxHMwY5bmPAYDTjbI2QxiysUsdv9
 geI7cHq/tlHZ8vWfoo/qQzgstYIwUj4kJPYbAJLE/A/KVKestchU6qm6y03DrXZIRDfB
 aSAdAn9M8YdJCPCvXVv1XlEYVEcKZK//PSf8ohqhopRPbBmBtBPqcTUIf3M+zsSIxYOD
 GMzP6Vfq3WfHYkcR4Gc5AsTxTRDZ/TPetSSI6KjbHPKYwFghV4RiFhm0y6WASlDWTGRj
 04zw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXNfCfSFxsjfzscsyQuRe2JVUpnPL5DwTSoWqcKEs0RnbW0NV7JeWVbmilPdJVInobTdDAbOdSUCNU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw9mtAv/RZWnyQhnag11qp1hr3+hTaV80elFi8l2XqeADWxJ3qD
 xODqLjGti8nv797B3I4IEhOj7dQyokp8d/RDSAgFEftfGZAg8mhYS2bWnnxtx6b7nG4DCW39gCT
 ZBysTDHvAQYUXC1KgL7ozBbk2FGaJprDxDgBX5QNmYZnmo2Q9ZB68uZxMhS2frP3K03chobLdpy
 x05UQ=
X-Gm-Gg: ASbGncvK+UcN3/cQY1pkhsIi6RgMj6drtpAPPJtwQtw3//M5Ko4qZJGzz3ADFlEOtqQ
 8FxygP+KN1IiH0j5sQ7sX/Oz1R/UyNdo6BYm6iTiYX1BIi0+MJ7rvvl5j8MBsPnxLiMrgvcLSo+
 kKuUHxWZHdsjT6te9zm1IYkIrl+l0z8ZEj38OeK2B9d+1x6vbR+7Kaah/mU7kac5ytMcbS3p8Ig
 6aqZFysbgUQt7KHI+GtF9P48rcFbDpx1bl6AuRvL4e/y5IxMlTI40mZTBWuMNpYenAE9nhnT/N1
 KNDTNMj7z2hs40+1IrDey5709LlvPZnHlEYRHcolJdFAdj9/+UEdVnAYUSoqxB8Tg1iSTfl+t0R
 eOcyf72/GbvonC0ibb/ADOaj+nHs=
X-Received: by 2002:a05:620a:254e:b0:7e8:c4f:614b with SMTP id
 af79cd13be357-87a35ce66b3mr915924285a.7.1759739425806; 
 Mon, 06 Oct 2025 01:30:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHXUjSORB8/gdVaqQhY61pOzDiPB5IX7IjdJsn8jA+4eHYgbYcSssD5tm9/R6DxLCyU1tYgZw==
X-Received: by 2002:a05:620a:254e:b0:7e8:c4f:614b with SMTP id
 af79cd13be357-87a35ce66b3mr915921685a.7.1759739425283; 
 Mon, 06 Oct 2025 01:30:25 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b486970b422sm1100481366b.54.2025.10.06.01.30.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Oct 2025 01:30:24 -0700 (PDT)
Message-ID: <9320c599-c7e3-427c-a096-230037d5db43@oss.qualcomm.com>
Date: Mon, 6 Oct 2025 10:30:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] drm/msm/dsi: add DSI PHY configuration on QCS8300
To: Ayushi Makhija <quic_amakhija@quicinc.com>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: robdclark@gmail.com, dmitry.baryshkov@oss.qualcomm.com, sean@poorly.run,
 marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
 robh+dt@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org,
 conor+dt@kernel.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonathan@marek.ca, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, quic_rajeevny@quicinc.com,
 quic_vproddut@quicinc.com
References: <20251006013924.1114833-1-quic_amakhija@quicinc.com>
 <20251006013924.1114833-5-quic_amakhija@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251006013924.1114833-5-quic_amakhija@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAzNyBTYWx0ZWRfX3ztVrOIzLwzv
 SzhFdlhfiNXYKQUpcc/Xe8UFFcEXC0XGBL4gqy7VmYLL2bd+7btwBNnCoSIZzrCL1VHmj/tk2uy
 /3rwZaj2vlfrXt0j/zOKMapz6X7aPvo7vRKSelXyUpKuEiNtTmIlSMskcKePZRXeRuXtrSLAniO
 SjizvGHnBB0+5MvFDJqzoVrEiGPzKzNTpyrTLLxrqpQvaLP+7eHKCm94NTcSn8EhbFOchP/rs2I
 5W61HYDV1dwsENpmwFtJFnZQU2Fl9JXkUNFRc7wW0n1sDl/Sa/q/uaNyu6GHwa/DPEgAJiIKC9V
 hXjMdfmftmlvXhTDwnzG6c3G/8N4dZqyfOgKrZibHRvAqCYraUv8q0TtkA/cTMRdbMKmJRJLPBT
 2EzLOJNbd1PyHcBQZhwzBZBe8Mk+0w==
X-Proofpoint-ORIG-GUID: eYE6CvguvDBjTtUGeZhQFD0sFONEUXlN
X-Authority-Analysis: v=2.4 cv=WIdyn3sR c=1 sm=1 tr=0 ts=68e37e23 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=pHedSVXj9zt6Nr3hYnwA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: eYE6CvguvDBjTtUGeZhQFD0sFONEUXlN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_03,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 bulkscore=0 spamscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040037
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

On 10/6/25 3:39 AM, Ayushi Makhija wrote:
> The QCS8300 SoC uses the 5nm (v4.2) DSI PHY driver.
> 
> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> ---

[...]

> +const struct msm_dsi_phy_cfg dsi_phy_5nm_8300_cfgs = {
> +	.has_phy_lane = true,
> +	.regulator_data = dsi_phy_7nm_48000uA_regulators,
> +	.num_regulators = ARRAY_SIZE(dsi_phy_7nm_48000uA_regulators),
> +	.ops = {
> +		.enable = dsi_7nm_phy_enable,
> +		.disable = dsi_7nm_phy_disable,
> +		.pll_init = dsi_pll_7nm_init,
> +		.save_pll_state = dsi_7nm_pll_save_state,
> +		.restore_pll_state = dsi_7nm_pll_restore_state,
> +		.set_continuous_clock = dsi_7nm_set_continuous_clock,
> +		},
> +	.min_pll_rate = 600000000UL,
> +#ifdef CONFIG_64BIT
> +	.max_pll_rate = 5000000000UL,
> +#else
> +	.max_pll_rate = ULONG_MAX,
> +#endif
> +	.io_start = { 0xae94400 },
> +	.num_dsi_phy = 1,
> +	.quirks = DSI_PHY_7NM_QUIRK_V4_2,
> +};

Again, this is not necessary, since the lookup code looks like this:

for (i = 0; i < cfg->num_dsi_phy; i++) {
        if (cfg->io_start[i] == res->start)
                return i;
}

Konrad
