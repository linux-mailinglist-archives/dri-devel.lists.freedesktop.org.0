Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA542BA2495
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 05:17:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F29B510E02B;
	Fri, 26 Sep 2025 03:17:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="IY0hQEii";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3935810E02B
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 03:17:03 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58PIQBLR015771
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 03:17:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 9f6LSM6OdZg1tUtjh3SpMPAi8kke+aQ/eiH9bqFrAoc=; b=IY0hQEiiUKjWIxlz
 GvvGIamAvxkoqk3lbTXoYxuP4aHFIE9UWsA7aAy+slvo7FTwMZd3gfWIg6hU/9VH
 wCBQjhDxjZIfKR9tKWr8OvDiGSauCiuPczfoMhEFmBnozzfPhq4j2UPHP1DECSgH
 0CtqodR7Aw/J+D9RB/cNu9rjWTofNI91RD6xrxELmyKZV1W1xobgA6xhH3P/owRc
 wRFheeh/xVhRrPERbBtch9dShWYLyr3b7eUeta6VVLFMWKWZKhQLn4nUzGPAQXyG
 aUg0r9zWQebI/yZVwWdcfHA0TwlBrpRt7u46cG0HTs2ZaP2tcs9n9mJyb1762b4M
 C/+Zyw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0t95ua-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 03:17:01 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-3309eab0740so444628a91.0
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 20:17:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758856621; x=1759461421;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=9f6LSM6OdZg1tUtjh3SpMPAi8kke+aQ/eiH9bqFrAoc=;
 b=cQHjNtXZkCI/m/9jqHUeFmc8OKuS2b70OPZB9jds3pIdf4NsjiV3POBaTyj1iZC9tY
 iPv7NWUhTdQgjBZvJ7gCTY4Nu70FJ5/lUDK9j7VBxJcJVnHshUtEhju1FJmmK7lLkf/3
 lXF8L8+Cqd47+3j6Em9nQije3/VQD4a6cKhRaXxIqNq4Cn8GIy9hRxm9P4i4YKsEA+ry
 7sk6sg9UBgoDZFEMcRlQvlSlqPgcFdfPyhQNq3cC30nriw5/O+k7XDoe5+glLk+lkscG
 D6P+PtFT6KFesSvNtb8QWMnaD+UzP7KrI4SfTx1BRaICULLPjM+TN9Hi1JOWRaByud0S
 V2NA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVFKy+h3W7TIAfnMvj6iUsz3R289XI/kZOgbper2B2Qjqir1kvkK8KfvUXIsXW8KOKUcbCKufgCakQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyhShg9bszBYGCenEuVNYFM0C311AxGne9YdBk4yamLtF+ZdaZx
 TgIt71nZakRKOXv8TCbDYya7aASqUA+uZpBn3McxbALQ4hYMXXJTtQuM3vycrDULC7snk9dfSXO
 qnSJTois/l0zRiEZBxU4mzSst/VIU3W8igddT/0YDpHQqUcEDxpuPtG9Xge2UCUitw741w4w=
X-Gm-Gg: ASbGncsYYDCvTf0qiqvNTtdOi9sVfBHsj7ZAKU6/PPtdZxzR7xvo+D1SegWUxsILVnn
 8XIZDsXj2xWA12oThEWFJ0cTSQ4xBkau5RB2AvtIbgpETXzU2fXbEq1GdA5GTcKmwP5Rcxe+Km8
 Etd8qjexQL/W6Cij1IvVv0fzyyCPTsyC6NhlgcMgmtCAdp2gvgyc9oNwPsYEpxvF8lJBJwHB8nj
 vuvAS9jQuvbKCYHYTuWug+qAVagRy9pbUjP9fTNkOvdBBWnxs94VptBMxcf6Vbe5fuHs6wukLtv
 vK/NZc2EwPQz0IWGhMKGqVdsO2FMMHa6asBNcIY4V8IlR0AmhBE6ZiHNwW6hch/Kk32iLMkoUEA
 07R3ZoHYg0o0z/v+NgNjaGDSvfRoWYLGW9ZI=
X-Received: by 2002:a17:90b:3b48:b0:32d:e980:7a70 with SMTP id
 98e67ed59e1d1-3342a17d006mr3998864a91.0.1758856620630; 
 Thu, 25 Sep 2025 20:17:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEiqzLmVD4byJpS81rkUiJ1Icsy/ExxJQYHMvD+WEtpM3r1cCrKQQ5MrCKcNruiodugOB5rJQ==
X-Received: by 2002:a17:90b:3b48:b0:32d:e980:7a70 with SMTP id
 98e67ed59e1d1-3342a17d006mr3998835a91.0.1758856620082; 
 Thu, 25 Sep 2025 20:17:00 -0700 (PDT)
Received: from [10.133.33.139] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-781023c203dsm3184336b3a.22.2025.09.25.20.16.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Sep 2025 20:16:59 -0700 (PDT)
Message-ID: <2577fb3e-96bb-4f2e-871d-27395065ef4b@oss.qualcomm.com>
Date: Fri, 26 Sep 2025 11:16:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 12/14] phy: qcom: qmp-usbc: Add QCS615 USB/DP PHY
 config and DP mode support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 li.liu@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
References: <20250925-add-displayport-support-for-qcs615-platform-v6-0-419fe5963819@oss.qualcomm.com>
 <20250925-add-displayport-support-for-qcs615-platform-v6-12-419fe5963819@oss.qualcomm.com>
 <5dtlqq7x36gb7cmiunoreoe2vftq46pusb75sbol47ceazefpf@lxrx3hhcwhju>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <5dtlqq7x36gb7cmiunoreoe2vftq46pusb75sbol47ceazefpf@lxrx3hhcwhju>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: x0y1ocIpL99MRO5LCcEo5rhOqZ1TDJ9R
X-Proofpoint-GUID: x0y1ocIpL99MRO5LCcEo5rhOqZ1TDJ9R
X-Authority-Analysis: v=2.4 cv=Jvz8bc4C c=1 sm=1 tr=0 ts=68d605ae cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=DA7DBj9iRjnvuWfEG8oA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX3fpBTxvzrggm
 2tAC+pnmvHhLsApzamD2evOqolr8h1gwryTRzWzN9+6AlZNbUW+wlR+bvEk7ICgnGg/D6nz5Q8U
 kFYtWSacdiLaTAPfaL04A3T5QLoGWC4YbBcD9SnQ2TAybbc1Cp6AGCCuDyrE5BIfp7VpmSFCKd1
 oJ5pcqyoluiNO4V/q1NodRq66nKersSJfDEOZPmUuIGMN0Ix/UEJRen0OBgDb3sXFqbmYRboWdQ
 XlaEOtiFERBkvh+AFbAr1e8HzwlgIckHk2I5IkhAwgV06GYyRYWW1pPAyDqo20l3VQ4dr9v5CAU
 TOGwjYwuUyNTrqnxPrkeccYvZKLyzGbznsI9opkNudOstIDCcFUR6cvHUC2oc/dkzj6sSMufta0
 zV+6ZnEjKihMWgnVrJBHEjMKmHKhvg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_01,2025-09-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 suspectscore=0 spamscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171
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


On 9/26/2025 5:57 AM, Dmitry Baryshkov wrote:
> On Thu, Sep 25, 2025 at 03:04:58PM +0800, Xiangxu Yin wrote:
>> Add QCS615-specific configuration for USB/DP PHY, including DP init
>> routines, voltage swing tables, and platform data. Add compatible
>> "qcs615-qmp-usb3-dp-phy".
>>
>> Note: SW_PORTSELECT handling for orientation flip is not implemented
>> due to QCS615 fixed-orientation design and non-standard lane mapping.
>>
>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>> ---
>>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 407 +++++++++++++++++++++++++++++++
>>  1 file changed, 407 insertions(+)
>> +
>> +static const struct qmp_phy_init_tbl qmp_v2_dp_serdes_tbl_rbr[] = {
>> +	QMP_PHY_INIT_CFG(QSERDES_COM_HSCLK_SEL, 0x2c),
>> +	QMP_PHY_INIT_CFG(QSERDES_COM_DEC_START_MODE0, 0x69),
>> +	QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START1_MODE0, 0x00),
>> +	QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START2_MODE0, 0x80),
>> +	QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START3_MODE0, 0x07),
>> +	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP1_MODE0, 0xbf),
>> +	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP2_MODE0, 0x21),
>> +	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP3_MODE0, 0x00),
>> +	QMP_PHY_INIT_CFG(QSERDES_V2_TX_LANE_MODE_1, 0xc6),
> Hmm, I just noticed. This register belongs to a _different_ space. As
> such you can't have it in the COM table.


Thanks for pointing this out. It likely worked before because the default
value (0xc6) was sufficient during validation.

I'll move this configuration into configure_dp_tx() and set it based on
link_rate.


>> +};
>> +
