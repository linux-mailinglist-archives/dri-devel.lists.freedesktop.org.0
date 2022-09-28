Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8113E5EE093
	for <lists+dri-devel@lfdr.de>; Wed, 28 Sep 2022 17:34:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFE4210EA0C;
	Wed, 28 Sep 2022 15:34:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BB3310EA0B;
 Wed, 28 Sep 2022 15:34:38 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28SFXPg4030748;
 Wed, 28 Sep 2022 15:34:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=a15kecGtqMSpqRMqq/yInv5X7i1Gy3PczU6jSXURswY=;
 b=mFfySNqqyc7OuXhDg2SP9E3sEMlLL6/MUgijVTpVX92LZj3MNkIKS4FkEvMg0Z9YDQ5g
 ba1HmrwurqqNFzs1XQpo4p6eKgVdnack0mnRqFWpM1YKCDm9Li+lMpneP1udvuNpUOdC
 aRNLufTA7plsV7addVnBj/5rNXwAZ19AodhZWVMc+mlz+NHk03jPn7OTifVAWPPKRrHB
 MuJ8Jo26fgXloUMAnrNXZ1BNEP/5SRf0dY2uVtqmPE0Dq9jCssHhImeL2LV51ffvOrix
 2IsrXAxU6LoREgr/3LmcEAzUFomBdoQGUjYhSQLOlrkkk78x8/ZnM/ikUwu/stIY5QLd Xg== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jvkbagrck-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Sep 2022 15:34:01 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 28SFXxkj019334
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Sep 2022 15:33:59 GMT
Received: from [10.111.168.84] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Wed, 28 Sep
 2022 08:33:55 -0700
Message-ID: <3a5f006d-2735-5af5-48fa-4397bfb5e3ba@quicinc.com>
Date: Wed, 28 Sep 2022 08:33:52 -0700
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
 <d7688497-6229-40d4-3378-5036d699dfd7@quicinc.com>
 <YzQ9CPwxZXFJCQGG@hovoldconsulting.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <YzQ9CPwxZXFJCQGG@hovoldconsulting.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: MYu-dxxqMzruGvqcKPoPBInDINPf6d6H
X-Proofpoint-ORIG-GUID: MYu-dxxqMzruGvqcKPoPBInDINPf6d6H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-28_06,2022-09-28_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 spamscore=0 impostorscore=0 bulkscore=0 mlxscore=0 adultscore=0
 phishscore=0 mlxlogscore=817 priorityscore=1501 clxscore=1015
 suspectscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2209130000 definitions=main-2209280092
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



On 9/28/2022 5:24 AM, Johan Hovold wrote:
> On Tue, Sep 27, 2022 at 11:42:53AM -0700, Abhinav Kumar wrote:
>> On 9/27/2022 12:14 AM, Johan Hovold wrote:
>>> On Mon, Sep 26, 2022 at 11:17:20AM -0700, Abhinav Kumar wrote:
>>>> On 9/13/2022 1:53 AM, Johan Hovold wrote:
>>>>> Drop the overly defensive modeset sanity checks of function parameters
>>>>> which have already been checked or used by the callers.
>>>>>
>>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
>>>>
>>>> The change LGTM, hence
>>>>
>>>> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>>
>>>> I think we can use below fixes tag so that we can pick up this entire
>>>> series for the fixes cycle.
>>>>
>>>> Fixes: c943b4948b58 ("drm/msm/dp: add displayPort driver support")
>>>
>>> Perhaps that's a requirement for drm, but I wouldn't add a Fixes tag for
>>> this otherwise as it's not a bug.
>>>
>>> You also have to watch out for Sasha and his autosel scripts which will
>>> probably try to backport this to stable if it finds a Fixes tag.
> 
>> Discussed with Rob on IRC, we will apply everything except the last two
>> patches of this series in the -fixes and take these two for the next
>> kernel rev push.
> 
> So the fixes go in 6.0 and the two follow-on cleanups in 6.1? Or did you
> mean 6.1 and 6.2?
> 
> Johan

The fixes will go in 6.1 first.

The two follow-on cleanups in 6.2.

Thanks

Abhinav
