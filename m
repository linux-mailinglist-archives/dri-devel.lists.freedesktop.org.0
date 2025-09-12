Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D405BB54C32
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 14:03:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38B6F10EC2C;
	Fri, 12 Sep 2025 12:03:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="WKF/LsS/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B16C10E1B7
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 12:03:12 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C9fDtP015055
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 12:03:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 zMKtRR1gvr98NkFlahada0nc1pCDoOH4s0Uqq/hc/XM=; b=WKF/LsS/PAUWM2XV
 I1POHixo3Ch+L34iRRQ9hJZf4lUjKxqL22xSH/dQJk3dm+diZB053n756JOTq9MX
 qAbeTu2VcYx+0bN9xLevJI19AnRWr7O6PZ5gQzGW1jgnhYdm77qR8KeJWCigcvdW
 4WNl7IJaf7CdKtyzK9dyIsk5pSErrCEIgLNUw05hdHtN1izh3lGaeHVA8YefwlPu
 hVLLG6ySFRFT4HVLLyywvm1ei9BIrlisdVK2b3GJZpvryZjCjN0WKDFPyvOGW1zu
 ykOL1P3SNSnL3prr6NDwIm4xi55i0pj73PHhsLLBt1haGjYFL9KthsYrEVzJueeU
 t51ydw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490aaputu1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 12:03:11 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-32df87e42c4so22222a91.2
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 05:03:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757678590; x=1758283390;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=zMKtRR1gvr98NkFlahada0nc1pCDoOH4s0Uqq/hc/XM=;
 b=qL/PklSk9QLXlKDla0BFUAVVS+2jHEMUWL9xPVXggnFk7NK7vC2ZSW56ZxlGQze5iI
 2iA8zgScZS6UekGpMsyJdO+sHdFg695pMkm7p7a36HYz4b4jY4A085kEdb6l2ZhX3jXP
 MtIP1ZrnFi/Q8JkfBR6A/GE3ZKTeQnSRHK+X+9TwszhpOD0ZDsvJfen6oMbm4AvDaecF
 MpMCN00dNssGHE9s/Fogk7tkuf1VtZ7+2ENQhEFco5CUALTYyZRVSmex6i/Cq+QnBm2e
 glEe7bqjd7v4swj30bzNho5J4bZHyIMF1mPM4TSSts37kUU5nyWYsfPQsOoBra4pNceb
 m+Kw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWX/YXetV2SvVAPzUbOkyno+3JGxrGfnfMLf4GIMixVY+UqSmoDpVqb03lqmEpLvQBfns8aQoFwENw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzyRCD5ogfcpMlMxFITcyiZVkQQqG1Iw47zjux3jmAmBBwYr9eN
 xjJjkRwK2e2BohCiJ+Bc43sDH7RCvgw362nJ0518FlzztiATUMUZbO2yhh5mmXHw0yMKkYvWn7A
 T2LJSNUn3mJxiNaPcGPASUydP6ZBqylCc35zun4wAOPaRWeZJL1Di5E2sRxFD3rdoAMKJNFA=
X-Gm-Gg: ASbGnct6qfjcsJXZhDVHqOrBQ3rq6boQd+/pGamm3ao+IxlqExLduHuRue26yfz9i4V
 0UXDlBKwQogZGBZalF+PVpCz+pHVm9gsuQblyUGqZ+xRknChwLTEAHigqYHIJ+yWVo83Werz7Po
 vxbDdCiRYDpiFpUoPrAX84eMC6/ckvFzc7s05P/cS21dEVUCapVdJ5s3PdZtg5GteFt4MA+mL1i
 1mmQKinIfbLvOWMpJgIdaJexV/6AG6EI4R2pC0r0am3yQluMJGqEGdoi4nRnQcYE9K8U6KXAnK3
 YTcVy4PIeIbRG0f/DDkGjXh31s5Z5B/pjrNK53PxryqRDWl79+nakvq2AWgeGw9HlpKoxikoQ1f
 ldm7V5luZAbwXNTOI243dwtRODP31pg==
X-Received: by 2002:a17:90b:1d07:b0:32b:9416:312d with SMTP id
 98e67ed59e1d1-32de4fcc070mr1755246a91.8.1757678589748; 
 Fri, 12 Sep 2025 05:03:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFLbeV2EFA9K8UJYz1maZdy+AMfW1DBGrroF29kzoSYpUtUZhd3N4o5LVMtPmgZDxe9yHDhjg==
X-Received: by 2002:a17:90b:1d07:b0:32b:9416:312d with SMTP id
 98e67ed59e1d1-32de4fcc070mr1755211a91.8.1757678589043; 
 Fri, 12 Sep 2025 05:03:09 -0700 (PDT)
Received: from [10.133.33.174] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-776075fdd83sm5311370b3a.0.2025.09.12.05.03.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Sep 2025 05:03:08 -0700 (PDT)
Message-ID: <cf6c2c2f-9878-4181-a3c8-9692423308bd@oss.qualcomm.com>
Date: Fri, 12 Sep 2025 20:03:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 11/13] phy: qcom: qmp-usbc: Add USB/DP mutex handling
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
 <20250911-add-displayport-support-for-qcs615-platform-v4-11-2702bdda14ed@oss.qualcomm.com>
 <nfugwwknnlxls75yo5rex6ggu5nzpq6enyx6e6nfnfei3icxjg@t7dnzcfcjw4o>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <nfugwwknnlxls75yo5rex6ggu5nzpq6enyx6e6nfnfei3icxjg@t7dnzcfcjw4o>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=eMETjGp1 c=1 sm=1 tr=0 ts=68c40bff cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=eXWC9YIREg2_PHQc8DoA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: XpaEu90sSInk5-xqKHMXH1SjvoTmcxp9
X-Proofpoint-ORIG-GUID: XpaEu90sSInk5-xqKHMXH1SjvoTmcxp9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAwMCBTYWx0ZWRfXxwtsqalUxEOp
 EjlMfzjnTBEPnTX9ydXu5Iis5qgdwDZjur/B9QgE54YRpruRqpNfgoWFB+1nDrCQDZoCh0c+Bbw
 CiwOikv7mP6Z0xAud5dlAn5gssGFvhdBNGY09hvaExgKIA6XI+MF7PaUqCU3fRSZ+L8ZQhHTpJX
 oxM2rKMVnD+/4Vw7Wqgvb1603b9ZLsgo02FaiP6NvNk5NTiGCwhZfy1qbNgWg2HaXeH7IV6RIsn
 emo8E3PqM07cXtEel8LyFtMNo9kgYRLO6+i1QieZh33g756US1O2+FS02NDFPswNdpAqojh2BdU
 XBU9EaIttlSbzDxqgaFnt89fe6zV/vQpLy0GLw0+1qEAH2WjCVC1DpdZb8n98wL5JhVbVRxWJmE
 y85xyB7i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_04,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0
 bulkscore=0 phishscore=0 spamscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060000
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


On 9/12/2025 6:32 PM, Dmitry Baryshkov wrote:
> On Thu, Sep 11, 2025 at 10:55:08PM +0800, Xiangxu Yin wrote:
>> Introduce mutual exclusion between USB and DP PHY modes to prevent
>> simultaneous activation.
> Describe the problem that you are trying to solve first.


Ok.


>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>> ---
>>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 21 +++++++++++++++++++++
>>  1 file changed, 21 insertions(+)
>>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
>> index 613239d15a6a3bba47a647db4e663713f127c93e..866277036089c588cf0c63204efb91bbec5430ae 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
>> @@ -1061,6 +1061,19 @@ static int qmp_usbc_usb_power_off(struct phy *phy)
>>  	return 0;
>>  }
>>  
>> +static int qmp_check_mutex_phy(struct qmp_usbc *qmp, bool is_dp)
> mutex has a very well defined use case - a sleeping lock. Please find
> some ofther name.


Then how about 'qmp_check_exclude_phy'?


>> +{
>> +	if ((is_dp && qmp->usb_init_count) ||
>> +	    (!is_dp && qmp->dp_init_count)) {
>> +		dev_err(qmp->dev,
>> +			"PHY is configured for %s, can not enable %s\n",
>> +			is_dp ? "USB" : "DP", is_dp ? "DP" : "USB");
>> +		return -EBUSY;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>>  static int qmp_usbc_usb_enable(struct phy *phy)
>>  {
>>  	struct qmp_usbc *qmp = phy_get_drvdata(phy);
