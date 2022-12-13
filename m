Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6939964BB1E
	for <lists+dri-devel@lfdr.de>; Tue, 13 Dec 2022 18:32:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1A2F10E343;
	Tue, 13 Dec 2022 17:32:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01C7010E343;
 Tue, 13 Dec 2022 17:31:58 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BDGBDC7014051; Tue, 13 Dec 2022 17:31:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=Hr7JOD1LzUJIykojRa3l8dfGdfmb5KMOnXl5g/mmv4Q=;
 b=JOHAB0p1NhaCtdQYFLX8sQM+8KOhwTh0m/HDyyZ9zbEChJvnamsPv5RRI1iisnbWCp/Y
 2xfLIbea0LzL+TFIidMvYTkhRuavgE498cKRBtiHkDx+m/BmTnIVXhFhExO/gkDM/yR0
 pbX2ICetcVGslUe+NZB9Dzd/KI6DrOqbNqIcFW1TNGlsTYDo/tYyS/DknAb16EIa9DVL
 ScklAIqXmwy7UgKss9mIKCR+sKAcDgRSZUfWTvZin1yoqvWHE9UzrHVoS9ONHTisz5x4
 nofdeBdUuwY5axdInquA1TZgXHNlwDnxFygCx7a6fD/l1uKIivQ58Qm/s2KmiyLuyuMw aw== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mehje218f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Dec 2022 17:31:52 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2BDHVpLN001299
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Dec 2022 17:31:51 GMT
Received: from [10.111.167.12] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Tue, 13 Dec
 2022 09:31:46 -0800
Message-ID: <0c131d43-1e91-8b92-5517-ca8fffef238c@quicinc.com>
Date: Tue, 13 Dec 2022 09:31:44 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [Freedreno] [PATCH v11 2/5] dt-bindings: msm/dp: add data-lanes
 and link-frequencies property
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>
References: <1670539015-11808-1-git-send-email-quic_khsieh@quicinc.com>
 <1670539015-11808-3-git-send-email-quic_khsieh@quicinc.com>
 <5a3865ed-8847-db04-3d60-f35438250bef@linaro.org>
 <5aa16223-dbf6-996c-1985-794302dcce91@quicinc.com>
 <be1411e8-1d07-7643-977c-a306016fd660@linaro.org>
 <b6d90c1f-5365-7197-be63-96c3d8cf0746@quicinc.com>
 <e53844b7-601b-f355-302b-cc871962a446@linaro.org>
 <8b306c8f-3089-4aaf-7fc1-038a8330c89a@quicinc.com>
 <CAA8EJpr5RYyQa7xu1_xJ0F-dn-H9aOf0KE-CDgDCwnZu3HPgXg@mail.gmail.com>
 <a9e2f269-b9df-814f-adcd-f5577f590fa7@quicinc.com>
 <bca77270-f3ac-f23f-ef96-43f9f7d574c4@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <bca77270-f3ac-f23f-ef96-43f9f7d574c4@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 9pdVfxZOmUir2iBlDv2iC4fLBZkdsr1T
X-Proofpoint-ORIG-GUID: 9pdVfxZOmUir2iBlDv2iC4fLBZkdsr1T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-13_03,2022-12-13_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 mlxscore=0 mlxlogscore=999
 bulkscore=0 clxscore=1011 malwarescore=0 priorityscore=1501 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212130154
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
Cc: sean@poorly.run, devicetree@vger.kernel.org, quic_sbillaka@quicinc.com,
 vkoul@kernel.org, freedreno@lists.freedesktop.org, andersson@kernel.org,
 konrad.dybcio@somainline.org, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, robh+dt@kernel.org,
 agross@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12/13/2022 5:13 AM, Krzysztof Kozlowski wrote:
> On 13/12/2022 00:41, Abhinav Kumar wrote:
>>>>
>>>> besides, i think i have to sent the whole series patches include this
>>>> one to address your new comments on other patch.
>>>>
>>>> is this correct?
>>>
>>> No. Please fix your system first, validate your patches and send them
>>> afterwards. You can not expect others to do your job.
>>>
>>
>> Just finished working with kuogee on this. This issue had been reported
>> by few others earlier (example
>> https://lore.kernel.org/lkml/bc9be279-a130-d5e7-4397-bbb389d14403@intel.com/T/).
> 
> This report says:
> "Sorry for the inconvenience, please ignore this false positive."
> 

That was one of them, and I dont think its false, maybe because after 
fixing the PATH issues, the user deemed them as false.

Here is another one 
https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20210812174209.1970-3-bbudiredla@marvell.com/ 
with the same report but no resolution.

So i thought for the benefit of others I would atleast summarize how we 
resolved them.

> Best regards,
> Krzysztof
> 
