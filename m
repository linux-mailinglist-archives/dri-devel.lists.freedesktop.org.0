Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2ED5ECC5A
	for <lists+dri-devel@lfdr.de>; Tue, 27 Sep 2022 20:45:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6915810E0DF;
	Tue, 27 Sep 2022 18:45:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B960D10E0DB;
 Tue, 27 Sep 2022 18:45:17 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28RG7GeM023779;
 Tue, 27 Sep 2022 18:44:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=8zFROM2RlQ7RRfoAHZ/wSZkZ7Y/QNzLlk21ueeDp2Aw=;
 b=Bf6VoEx8gS89gu8wIMD20KUPTzsvfbcgnJRwTG06ZQzi/76PTJxWl9fjcoQSGuhfh6jO
 CCiG6qc3hw4WjlpFocThJTigJqasDnslvvqA7rSDBMJ52HThLy5ITGvNgVVjLFpJHfhA
 YFGOPufYFapOlLemUbmgIZc28/iBq8ko40a2PksOGPz3HshDUkLRSVqxJuXIwtYi+HeX
 urIBJETEBVj3JZewdVtj+4yED79c7qjy6gLHDYWdl0VlEa2FvdCZmMSqQ4PZNDY6LcRi
 zvsxgiz0209b6yXGQnm7EN9OoxMaqUDN1gba8di5FBQ7PRcWgcQvdCfQjeKf/8jYb/x3 zQ== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jv28a1dmh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Sep 2022 18:44:55 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 28RIisfc029098
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Sep 2022 18:44:54 GMT
Received: from [10.111.168.84] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Tue, 27 Sep
 2022 11:44:50 -0700
Message-ID: <7f611ed6-747f-5232-8d34-3187e4da9ac4@quicinc.com>
Date: Tue, 27 Sep 2022 11:44:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [Freedreno] [PATCH v2 10/10] drm/msm/dsi: drop modeset sanity
 checks
Content-Language: en-US
To: Johan Hovold <johan@kernel.org>
References: <20220913085320.8577-1-johan+linaro@kernel.org>
 <20220913085320.8577-11-johan+linaro@kernel.org>
 <dc33f8c9-761a-deec-d1e5-ea30c4120729@quicinc.com>
 <YzKjODjbQMx/hEk1@hovoldconsulting.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <YzKjODjbQMx/hEk1@hovoldconsulting.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: l2ZM5xG7GvtYyCymGZXueeAcnhDHuNzp
X-Proofpoint-GUID: l2ZM5xG7GvtYyCymGZXueeAcnhDHuNzp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-27_09,2022-09-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0
 suspectscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0 mlxlogscore=703
 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2209270117
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
Cc: Sean Paul <sean@poorly.run>, Neil
 Armstrong <neil.armstrong@linaro.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Steev Klimaszewski <steev@kali.org>, Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Robert Foss <robert.foss@linaro.org>, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org, Johan Hovold <johan+linaro@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 9/27/2022 12:16 AM, Johan Hovold wrote:
> On Mon, Sep 26, 2022 at 11:21:38AM -0700, Abhinav Kumar wrote:
>>
>>
>> On 9/13/2022 1:53 AM, Johan Hovold wrote:
>>> Drop the overly defensive modeset sanity checks of function parameters
>>> which have already been checked or used by the callers.
>>>
>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
>>
>> The change LGTM, hence
>>
>> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>
>> I think we can use below fixes tag so that we can pick up this entire
>> series for the fixes cycle.
>>
>> Fixes: 3f0689e66352 ("drm/msm/dsi: check msm_dsi and dsi pointers before
>> use")
> 
> Same here. I wouldn't add a Fixes tag unless required by some DRM
> process.
> 
> Johan

Same response as the prev one, we will apply everything except the last 
two patches of this series in the -fixes and take these two for the next 
kernel rev push.
