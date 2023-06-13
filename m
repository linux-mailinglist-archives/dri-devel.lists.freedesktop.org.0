Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 466EF72ED55
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 22:51:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A2F510E119;
	Tue, 13 Jun 2023 20:51:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BB4610E040;
 Tue, 13 Jun 2023 20:51:18 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35DKZ9uP017928; Tue, 13 Jun 2023 20:51:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=/Av4fBGeoNH4wHA4MSFyZ2nuNzk8vnseeHEMbqvMOEU=;
 b=IFvu/mkW/D3OHiwHX4jrjsFjW9zaLbZw9mlJWK350JVnR2IHy09ufUZVFuMbvz+d5/r7
 8nsFIWs4JetMKF28B0txG2PW/fs0FD+RtvMALUevxxxDpLu5FOa6WiVq2+kRLW9HT3a2
 CVMZRsVVBsDXWAiZo6ZN43TQM2QoU2H6H7tCU5QYfLfQJBuN/q29tF6c+HJSHs6TAAbg
 fRb29zAoeD1RQI7x+soYp0KPykpn2jAQcTZDSgjhGnz1qD6RvYj5NahdUG6TSbAoI/ks
 2APdfzsiEWaiZk0+s1zmUwKmh+5qulxxHnjEor+qh35ShfXjE2Iu3ZLErDAxPwopPPli Zg== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3r6f7a28v2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Jun 2023 20:51:09 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 35DKp8Io030667
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Jun 2023 20:51:08 GMT
Received: from [10.134.70.142] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Tue, 13 Jun
 2023 13:51:07 -0700
Message-ID: <6ee95128-e97d-a1b6-8fed-c022479853de@quicinc.com>
Date: Tue, 13 Jun 2023 13:51:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/msm/dp: Drop aux devices together with DP controller
Content-Language: en-US
To: Doug Anderson <dianders@chromium.org>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>
References: <20230612220106.1884039-1-quic_bjorande@quicinc.com>
 <c31ee9e4-1878-c0ae-70e6-42af5fd838c7@linaro.org>
 <CAD=FV=Whn3GDDMQiJGYbSK8LF-OO247m69Sqcf7dMw6HFthgqw@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAD=FV=Whn3GDDMQiJGYbSK8LF-OO247m69Sqcf7dMw6HFthgqw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: VwJ2nj-aj5Ee-POqtHBF_Fl6Mdjtxe27
X-Proofpoint-ORIG-GUID: VwJ2nj-aj5Ee-POqtHBF_Fl6Mdjtxe27
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-13_22,2023-06-12_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 mlxlogscore=800 clxscore=1015 priorityscore=1501 phishscore=0 adultscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 mlxscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306130181
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
Cc: freedreno@lists.freedesktop.org,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 Bjorn Andersson <quic_bjorande@quicinc.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 linux-arm-msm@vger.kernel.org, Marijn Suijten <marijn.suijten@somainline.org>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>,
 Vinod Polimera <quic_vpolimer@quicinc.com>,
 Johan Hovold <johan+linaro@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Doug

On 6/13/2023 12:33 PM, Doug Anderson wrote:
> Hi,
> 
> On Mon, Jun 12, 2023 at 3:40 PM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
>>
>> On 13/06/2023 01:01, Bjorn Andersson wrote:
>>> Using devres to depopulate the aux bus made sure that upon a probe
>>> deferral the EDP panel device would be destroyed and recreated upon next
>>> attempt.
>>>
>>> But the struct device which the devres is tied to is the DPUs
>>> (drm_dev->dev), which may be happen after the DP controller is torn
>>> down.
>>>
>>> Indications of this can be seen in the commonly seen EDID-hexdump full
>>> of zeros in the log, or the occasional/rare KASAN fault where the
>>> panel's attempt to read the EDID information causes a use after free on
>>> DP resources.
>>>
>>> It's tempting to move the devres to the DP controller's struct device,
>>> but the resources used by the device(s) on the aux bus are explicitly
>>> torn down in the error path.
>>
>> I hoped that proper usage of of_dp_aux_populate_bus(), with the callback
>> function being non-NULL would have solved at least this part. But it
>> seems I'll never see this patch.
> 
> Agreed. This has been pending for > 1 year now with no significant
> progress. Abhinav: Is there anything that can be done about this? Not
> following up on agreed-to cleanups in a timely manner doesn't set a
> good precedent. Next time the Qualcomm display wants to land something
> and promises to land a followup people will be less likely to believe
> them...
> 

Both QC and Google know there were other factors which delayed this last 
3-4 months.

But, I do not have any concrete justification to give you for the delays 
before that apart from perhaps other higher priority chrome and upstream 
bugs which kept cropping up.

Hence, all I can offer is my apologies for the delay.

After seeing this patch on the list, we have revived this effort now and 
re-assigned this within our team to take over from where that was left 
off. It will need some time to transition but this will see the end of 
the tunnel soon.

Thanks

Abhinav
