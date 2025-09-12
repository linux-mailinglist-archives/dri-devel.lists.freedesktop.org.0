Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32391B54C1D
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 14:01:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8211F10EC30;
	Fri, 12 Sep 2025 12:01:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="LThO0WJb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8344510EC2C
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 12:01:40 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C9fK6H017571
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 12:01:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 tR4WV22vf2t/EPkoMZ6ryeD+FVZWeK5RDIR27BMiiCM=; b=LThO0WJbd+uPPfql
 1T9rEvTNfMVif9MJ3ij5xNWCkqiPRYhUWsu++34zYOfSEnJdUDTfwdZBGx5u8VfH
 xmpwjPI4+cVMRRDpIOXYXMLZa05jPm1I1MCntLGcOMP8FcTn5SY554s4VLfwP0Np
 2rtES9jCBlUL1CAihVaHgQ+7dLHSMx3u92rkbEcbqTmzyt0mn74Uv8y4yPw9GDn5
 vLa9znZ/rkzy+eokbXzq0LrydSNBvamx3xMhXAm5cX7MZqX0LaHMnc2GCXujp43K
 1HmLkdiWKvBp8YRYurXbcUTShfrnenWbAVcBVy/FYfaGG4JAhy4qnoyKeqrLEJJz
 UHa/1g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490bwskpgj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 12:01:39 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-24cc57791caso3692855ad.0
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 05:01:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757678499; x=1758283299;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=tR4WV22vf2t/EPkoMZ6ryeD+FVZWeK5RDIR27BMiiCM=;
 b=JqTB/MuuYaraQIvi94HzsikICt3iGBiviwl38AeESLfotpW8C9HZuUPGM3AZzKcl71
 yiDQGc/OlC1iUhfU+M6Nk1b+VmPDpqLGIb5yhFWJsV91dNVVWSmhv4+UpU1xe5TUGgcL
 +wXT5ZAbehDZ3wQBUT/OkDkaGI7WX7yuZOPS2qryQV2XXqay14jsbwGZU9p3bTIMwSo+
 6TXpNB8FVVgd5k3QwT2/4M6BP1HU62PuITcBlomxRuxttBd7f6lWM1x2kPcwODtzi376
 QiU73qlt9KCaLlIZQ1aLcX+1ZyJaoXdDaokcIjUukCmiDEij6advN+4FyxV2tQ5N8u8E
 c4fg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXz5GzwwAW5B0bN0Pf13XICsYHM9swpAsIw3isxlLZz3rY0wxMcNPITSL4x9dGmOOU9oW+yW7m+2DA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwGQVgRQSzZjpNVGBK51muoKP4aGGAtJJeF3wh6DYwJtXr3bhPr
 t3t0+JDmMuYg/QewMOuU51Hqqbls/xIZIBrSrZxWu3vcQFeQ0EUXUqBDQpaHbv5xDjp6DcOeBpS
 jE8NFI4e2GYtbnpY6+fLan8nRKED1+qNf+YRmiwm4bH/NZ7ZdnI4aD/Fxtw0WDFamGzx+Pps=
X-Gm-Gg: ASbGncuwKnV76rpRvePbHof2Lzssoty/mOO07hBo2lKSphjYsgAG8MVuSFgNTWn3Oty
 WthrnKp3o7axyzOEsPZarXEdNHJyxEqSU0mpeitRW6jr1EqPPTSD10zYcN9XiVBuq/ygKOuG5HE
 10AOyAKWcBEtHeD6YZwiHm3T2azchGiL/6scu+Ix/H09Tc05EODx2WILGZNF0f09FZjAKMV5Yg1
 DJ4nd8WpXqMczGt3YGB/SP9Gv8WgL2weqtkka0GLLCt0fI5Ny6bVtWuUl9DM4iDweY3zyoyES3x
 F6rQYW6xQ1z7oonSiufG9Wj1KvEaqtOz3j3KSobPLpavSvZOAMCl8cNZc8WpOmaJpkhu2Vej5xi
 d0WUCKIV4WHVz7GXjBPdCT2FImENN3A==
X-Received: by 2002:a17:903:1ce:b0:25e:8089:5070 with SMTP id
 d9443c01a7336-25e80895390mr5790355ad.1.1757678498768; 
 Fri, 12 Sep 2025 05:01:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFRWUteHVEdJSYAR1rniB1eDfwR2hwSrNL/NbjOkI3aWK1MO0R3uv5T0gv0XZ2mKId4uJql1Q==
X-Received: by 2002:a17:903:1ce:b0:25e:8089:5070 with SMTP id
 d9443c01a7336-25e80895390mr5789845ad.1.1757678498117; 
 Fri, 12 Sep 2025 05:01:38 -0700 (PDT)
Received: from [10.133.33.174] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-25c36cc6cc5sm47586865ad.27.2025.09.12.05.01.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Sep 2025 05:01:37 -0700 (PDT)
Message-ID: <9fa9f9e4-b7fa-42fd-b367-9d52e0f1f184@oss.qualcomm.com>
Date: Fri, 12 Sep 2025 20:01:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/13] phy: qcom: qmp-usbc: Add DP PHY ops for USB/DP
 switchable Type-C PHYs
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
 <20250911-add-displayport-support-for-qcs615-platform-v4-10-2702bdda14ed@oss.qualcomm.com>
 <buob3axokndjfuwvv5j5zee4e66tf7t4ficz6fend5yadw4j6e@czus6n6zfor7>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <buob3axokndjfuwvv5j5zee4e66tf7t4ficz6fend5yadw4j6e@czus6n6zfor7>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: I3phA2hBvQ5zptP6XBDB7L5bFVRKVlwd
X-Proofpoint-GUID: I3phA2hBvQ5zptP6XBDB7L5bFVRKVlwd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxOCBTYWx0ZWRfXxO0agk2ow+J9
 ykDSHuy2SxUgBPSGki1YMhA5dwT2VgjwkPY0iiI5BmOA1nrAIutkw04P6kp+NtT27x2QEsfKitu
 drlR8XVbOePNyiYSt3yoXzs2gnS7sRhbz4Wh3vWluwdfWyYf4tB0zAdSKES45os4dta7Svku3Pb
 myqlrywBQ5vdnXsfPNu8ZuNQ/U0Vo6k3/oHolqMNJEd4dzKHJP5sxy0PtuddK2mF8n9bOJc8j7r
 aUmtztDvXpEhcGR9Y8LEis2Nrqb9qJEIXczDbuAkaMDDzAUFdZwMoNnm5McOQKXVU7rAKKcWn9J
 dHsFSbpqxdhrtbQC/xes6LFP+sPGbb+lekjr2i8fkPgqpojBAi7upNozmNW98jieJAexR5wSI7l
 D5cWugnj
X-Authority-Analysis: v=2.4 cv=G4kcE8k5 c=1 sm=1 tr=0 ts=68c40ba3 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=ctQwHQabY_GzZcauxAMA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_04,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060018
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


On 9/12/2025 6:31 PM, Dmitry Baryshkov wrote:
> On Thu, Sep 11, 2025 at 10:55:07PM +0800, Xiangxu Yin wrote:
>> Define qmp_usbc_dp_phy_ops struct to support DP mode on USB/DP
>> switchable PHYs.
>>
>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>> ---
>>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 192 ++++++++++++++++++++++++++++++-
>>  1 file changed, 191 insertions(+), 1 deletion(-)
>>
>> @@ -1669,6 +1832,23 @@ static int qmp_usbc_parse_tcsr(struct qmp_usbc *qmp)
>>  	return 0;
>>  }
>>  
>> +static struct phy *qmp_usbc_phy_xlate(struct device *dev, const struct of_phandle_args *args)
>> +{
>> +	struct qmp_usbc *qmp = dev_get_drvdata(dev);
>> +
>> +	if (args->args_count == 0)
>> +		return qmp->usb_phy;
>> +
>> +	switch (args->args[0]) {
>> +	case QMP_USB43DP_USB3_PHY:
>> +		return qmp->usb_phy;
>> +	case QMP_USB43DP_DP_PHY:
>> +		return qmp->dp_phy;
> return qmp->dp_phy ?: ERR_PTR(-ENODEV);
>
> We are not expected to return NULL here (and dp_phy can be NULL).


Ack. will update.


>> +	}
>> +
>> +	return ERR_PTR(-EINVAL);
>> +}
>> +
>>  static int qmp_usbc_probe(struct platform_device *pdev)
>>  {
>>  	struct device *dev = &pdev->dev;
>> @@ -1743,9 +1923,19 @@ static int qmp_usbc_probe(struct platform_device *pdev)
>>  
>>  	phy_set_drvdata(qmp->usb_phy, qmp);
>>  
>> +	if (qmp->dp_serdes != 0) {
>> +		qmp->dp_phy = devm_phy_create(dev, np, &qmp_usbc_dp_phy_ops);
>> +		if (IS_ERR(qmp->dp_phy)) {
>> +			ret = PTR_ERR(qmp->dp_phy);
>> +			dev_err(dev, "failed to create PHY: %d\n", ret);
>> +			goto err_node_put;
>> +		}
>> +		phy_set_drvdata(qmp->dp_phy, qmp);
>> +	}
>> +
>>  	of_node_put(np);
>>  
>> -	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
>> +	phy_provider = devm_of_phy_provider_register(dev, qmp_usbc_phy_xlate);
>>  
>>  	return PTR_ERR_OR_ZERO(phy_provider);
>>  
>>
>> -- 
>> 2.34.1
>>
