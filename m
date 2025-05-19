Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA03ABC6D3
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 20:07:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DD3410E31B;
	Mon, 19 May 2025 18:07:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="Is3AyBGr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA72410E31B
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 18:07:46 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J9SPfF022937;
 Mon, 19 May 2025 18:07:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 l639tUWh+0RZLX+q5axulTBd10Rg0ePBWLEURnGTyTo=; b=Is3AyBGrP+7yYCFq
 +81/lCLvNea66UPAYZmFUeTTleYo70JyS1ahcD9+SMCxu44TsHjnBDx80Tq+EtCp
 EtDYSNWERi72I03xXrPk/5iTwU4+YBEoJVQ2lPATHAGoGzcSpT8zxVnLs9finvcf
 W7ITDVXfVsTTlZcpyzKDvWEUgnD24RCbpIdTRwjP0uph0jfOIoWXo4IrY8LHcYrd
 KLp6a1z2GQj6Bh9KIN4URPfpB0KO2IbtAqc1698zvHBmQVDq8bC9vKlXsSeVc+Pv
 F4wrbm/ZGONqVHv9yS5GjY0XaODq9SxrAtfrsAEp5UZjLGzyHnfInawZojhTkb16
 KnYt6g==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pju7d7x0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 May 2025 18:07:41 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54JI7e9L006397
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 May 2025 18:07:40 GMT
Received: from [10.111.163.198] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 19 May
 2025 11:07:39 -0700
Message-ID: <5395856b-92d6-4860-8ad6-0a82d679b514@quicinc.com>
Date: Mon, 19 May 2025 14:07:37 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] accel/qaic: Add Reliability, Accessibility,
 Serviceability (RAS)
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>, <quic_carlv@quicinc.com>,
 <lizhi.hou@amd.com>, <jacek.lawrynowicz@linux.intel.com>,
 <quic_yabdulra@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
References: <20250516160634.1408309-1-jeff.hugo@oss.qualcomm.com>
Content-Language: en-US
From: Troy Hanson <quic_thanson@quicinc.com>
In-Reply-To: <20250516160634.1408309-1-jeff.hugo@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Authority-Analysis: v=2.4 cv=XKEwSRhE c=1 sm=1 tr=0 ts=682b736d cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=53wffJMIMOjkZiTugjoA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: zKWHiBvtjU_dbQCry3tqLM7N5N26Iqvd
X-Proofpoint-GUID: zKWHiBvtjU_dbQCry3tqLM7N5N26Iqvd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDE2OCBTYWx0ZWRfX/woEjXpYkU7h
 UDUCCUcQ4pdHX3Hd1VkZ1fO8TuloIypSyATLjf2nqTE2FJjzLboXsneWYi7Xc7ra0ZlFo3JQyM0
 LlsDND3XBD5Ke6WKP1NDeliDO8xj6YH2NbFO4Nvn5BBxQ1ut71DRImmxMRN3FhLuF2WNB6zx/by
 rpR13L/VE18zK3MI1J6GSO38gWkpG2CG1a0V3fuFxjBgHhrsavnE94sPYnLJdPWJIGp1bst571e
 //p0jehIy7x5cE+4hYyoog0RjNmA+BLBPazZxSbsnz0pNInoQycFlnmIAMKiGvol9eXbBUWITnS
 Yo5GCnEnTL9yZGZM3PPSFkH6+8+jCr7lgMNWgPVOBXeOgyLcEei8rKU9bRCwG+6q286+cBDp/aE
 mkI9iJGUwDES9ddcZCcKAFMpGa54N9v5sX30MT5761XzeD3OlMvrEtyryjY2LBXVVR/EEysq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_07,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 clxscore=1011
 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0 mlxscore=0
 mlxlogscore=999 phishscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505190168
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



On 5/16/25 12:06 PM, Jeff Hugo wrote:
> AIC100 devices generates Reliability, Availability, Serviceability events
> via MHI QAIC_STATUS channel. Support such events and print a structured
> log with details of the events, and if the event describes an uncorrected
> error, reset the device to put it back into service. As these events may
> not all be reported via other mechanisms like AER, maintain counts of
> the number of errors observed for each type.
> 
> Signed-off-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>

Reviewed-by: Troy Hanson <quic_thanson@quicinc.com>
