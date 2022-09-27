Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 79AA05ECC41
	for <lists+dri-devel@lfdr.de>; Tue, 27 Sep 2022 20:43:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C4EC10E046;
	Tue, 27 Sep 2022 18:43:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0C6410E046;
 Tue, 27 Sep 2022 18:43:14 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28RIHat5007239;
 Tue, 27 Sep 2022 18:43:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=gR4Pn4q136Weq5jaeUge3M1T4dRq5PIIMbxgLr4u+D4=;
 b=e4STaSNNclop8Rq4IRgHyCUI54isGrYHyOo4bxa02WzM8fAH+3r/mFragTkA/5cxp43H
 QWRpA8kzMYYmPiRJHQQ8/nr3teJt8AuUrcXFgd9WiZ34owRCeGkpKPtaNEnVIb2RZl9e
 oX0gG+FPO9OSClYFgzv8KYEq5BCt+YX+2zCet4whRkOPJGfB0HjQ18gVLDYyyIKBmkUq
 g8npiV71BChsUgCcuTP1g8RFdHVz6j3jTO7HIgJ/G9cbys+9QNhvz6UMu1lOPe1YmRJ4
 lO6QOAnduxMImoMdsb1Nzl7703XYrUBIC7S4HTrSYq18CH7ZTWPqptPZIZ8QSZ5NOiRp 2Q== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jsrwfqcuu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Sep 2022 18:43:00 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 28RIgxYj025366
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Sep 2022 18:42:59 GMT
Received: from [10.111.168.84] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Tue, 27 Sep
 2022 11:42:55 -0700
Message-ID: <d7688497-6229-40d4-3378-5036d699dfd7@quicinc.com>
Date: Tue, 27 Sep 2022 11:42:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v2 09/10] drm/msm/dp: drop modeset sanity checks
Content-Language: en-US
To: Johan Hovold <johan@kernel.org>
References: <20220913085320.8577-1-johan+linaro@kernel.org>
 <20220913085320.8577-10-johan+linaro@kernel.org>
 <d05290d8-7603-13b3-3cc4-d8509b03fc02@quicinc.com>
 <YzKi8XfV6V0p0TJi@hovoldconsulting.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <YzKi8XfV6V0p0TJi@hovoldconsulting.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: Unl2EMpDkPDOs-OWU28xnutJtpITwt9V
X-Proofpoint-GUID: Unl2EMpDkPDOs-OWU28xnutJtpITwt9V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-27_09,2022-09-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 spamscore=0
 malwarescore=0 adultscore=0 bulkscore=0 mlxscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 mlxlogscore=807
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209270116
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
Cc: dri-devel@lists.freedesktop.org, Neil
 Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-kernel@vger.kernel.org,
 Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, Steev Klimaszewski <steev@kali.org>,
 freedreno@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 Robert Foss <robert.foss@linaro.org>, Stephen Boyd <swboyd@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Manivannan
 Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Sean Paul <sean@poorly.run>,
 Johan Hovold <johan+linaro@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 9/27/2022 12:14 AM, Johan Hovold wrote:
> On Mon, Sep 26, 2022 at 11:17:20AM -0700, Abhinav Kumar wrote:
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
>> Fixes: c943b4948b58 ("drm/msm/dp: add displayPort driver support")
> 
> Perhaps that's a requirement for drm, but I wouldn't add a Fixes tag for
> this otherwise as it's not a bug.
> 
> You also have to watch out for Sasha and his autosel scripts which will
> probably try to backport this to stable if it finds a Fixes tag.
> 
> Johan

Discussed with Rob on IRC, we will apply everything except the last two 
patches of this series in the -fixes and take these two for the next 
kernel rev push.
