Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C77CECEB5B8
	for <lists+dri-devel@lfdr.de>; Wed, 31 Dec 2025 07:36:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D55C410E981;
	Wed, 31 Dec 2025 06:36:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="c7WCQeUZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FCC010E981;
 Wed, 31 Dec 2025 06:36:40 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BV6E2NB3539777; Wed, 31 Dec 2025 06:36:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 2hY+ZFT0BJN/LIwv35utdizrbGJpJ2tNZj6iXKoBiNg=; b=c7WCQeUZicOk+fsn
 qjD7TQoIVV1LGM6TABG0x+kUYmAE4AEZecRLmQODIr5bNs/dD+fCyRFV0U2vQuiZ
 ZUF9XbirhzMppz/a3qJHwSqLC75MtWSyaFv34/NDrO7taL15g1JUxd+K68Rf8t0e
 HJ3Q1g/ldvnt9xVVmDSq4NFq1rHvCrGbjgeHMZzKtg9Hdb6Ezfo/CZJN+v++hvKj
 X6q+hDm3s/7iSG2cwCPei5BD9Hb48yym0LrV6RI44r55Fa9GiD8MajgFGUCvWVUF
 LisV8Ez3bNNiAVyH6/fMeD/hMVOBn+xeasx/M/SJyQWSrJPKkSDjUm09X/0vQDUn
 KbXsJA==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc88yjxme-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 31 Dec 2025 06:36:31 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5BV6aUnl006015
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 31 Dec 2025 06:36:30 GMT
Received: from [10.216.39.1] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 30 Dec
 2025 22:36:22 -0800
Message-ID: <92f47140-445a-45e0-8e6c-0b09076444ac@quicinc.com>
Date: Wed, 31 Dec 2025 12:06:18 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/5] dt-bindings: display: msm-dsi-phy-7nm: document
 the QCS8300 DSI PHY
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <robdclark@gmail.com>,
 <dmitry.baryshkov@oss.qualcomm.com>, <sean@poorly.run>,
 <marijn.suijten@somainline.org>, <andersson@kernel.org>,
 <robh@kernel.org>, <robh+dt@kernel.org>, <krzk+dt@kernel.org>,
 <konradybcio@kernel.org>, <conor+dt@kernel.org>,
 <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>,
 <rfoss@kernel.org>, <Laurent.pinchart@ideasonboard.com>,
 <jonathan@marek.ca>, <jonas@kwiboo.se>, <jernej.skrabec@gmail.com>,
 <quic_rajeevny@quicinc.com>, <quic_vproddut@quicinc.com>
References: <20251225152134.2577701-1-quic_amakhija@quicinc.com>
 <20251225152134.2577701-2-quic_amakhija@quicinc.com>
 <20251227-doberman-of-radical-variation-d30aaf@quoll>
Content-Language: en-US
From: Ayushi Makhija <quic_amakhija@quicinc.com>
In-Reply-To: <20251227-doberman-of-radical-variation-d30aaf@quoll>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Authority-Analysis: v=2.4 cv=POcCOPqC c=1 sm=1 tr=0 ts=6954c46f cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=flbPsyHX6rUve8wJtjQA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: d4Y-9YLPrTQEz5qYa_yTSlnmDw7YXeZo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDA1NSBTYWx0ZWRfXyr8eEa6ONYnA
 XjhyPNoR2pTpR5KuAAo9PdFmjmDkHciF6UaH9oTEZtSaVa/XWazJFW/2DtZrbRxUQ8YwoD3xf53
 NmJTs55x47kLxxilmZuXX6t4iBWiKePwedoWgw1MiUGq9eJqXgNJdLoo4lQirJ2GUW0NYeMa8Gq
 s2TRqcnsBsIc4QtK0oNDAPMj2TdSBF+ufSgwAXDZcxxibKW7+/FfTPrdyXZoa90d7gilbEW/yH9
 3M/aYmjpgh4ht178O4EH/jDNFLCwX899+0pGZHDyCNEnXNIkvD7cxSD4j5BOAc5Q97S9K8oOHaQ
 0sATU1L+r9gnZyKz43nWHAXCxF+gh/Ne5xwBi5SL5z3647umwGFb1RKq2JUpwo0CXf4s3mLuOvw
 lrOrzEc+5HaVeMi3BHSYJNXMWDCAFbzyuHwgLa0gavGaBYNY5Y887U+rVEw98ppnG8AF5WHKIv2
 w8km95g7uJGZ1ymnVrw==
X-Proofpoint-GUID: d4Y-9YLPrTQEz5qYa_yTSlnmDw7YXeZo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-31_02,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 bulkscore=0 phishscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512310055
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

On 12/27/2025 4:43 PM, Krzysztof Kozlowski wrote:
> On Thu, Dec 25, 2025 at 08:51:30PM +0530, Ayushi Makhija wrote:
>> The QCS8300 MDSS DSI PHY is the same 5nm PHY IP as on SA8775P, with
>> identical register layout and programming model. Model this by using
>> a QCS8300 specific compatible with a qcom,sa8775p-dsi-phy-5nm fallback,
>> and update the schema to require this two entry form for QCS8300 while
>> keeping existing single compatible users valid.
> 
> Last sentence is redundant. I asked to explain the hardware, not to tell
> us how Devicetree works. Write concise and informative commit msgs which
> tell non-obvious things. Not what you did. I alreaded asked this - do
> not state the obvious, do not copy the subject.
> 
> The only useful part of your commit msg is first sentence - two lines,
> so 33%. Remaining four lines, so 66%, is obvious.
> 
> Best regards,
> Krzysztof
> 

Hi Krzysztof, sure will update the commit description accordingly.

Thanks,
Ayushi

