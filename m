Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C789E801413
	for <lists+dri-devel@lfdr.de>; Fri,  1 Dec 2023 21:11:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D744010E942;
	Fri,  1 Dec 2023 20:11:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C6C410E942;
 Fri,  1 Dec 2023 20:11:47 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3B1ENCN4022105; Fri, 1 Dec 2023 20:11:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=A8mehcLTiQERk0pvO1S9W3rOi0ADBqUuyocjxOW0XsA=;
 b=RKmfIbLYYgVssmwXmv1yB+vjqAwQQpnCN5tDM+KU/cwgWEQKFDAqvoqao+F9DVjgQGW0
 iiiBIOY3RPRktIHXsr9uIn2jAde9141jBtlUXhvdf9+tT/EtAWqNAtB63I1mv95+R/zT
 jmtjDGskZjg8KLd7aNlh9urDe0Vitp/XBPNFp05oADaqu9XOJKtBwTLmdqy3tprZ4Wdy
 s8VadD5w/uaU95IcjG51+vbrm6S/m3h10487MDgxUjpJJ44seR7EckQsYQmOvGQQ59fV
 VilNxDfhdQh+Pwx9NPIswhPvMc6BMGW4YkzgJR4L9GNsiPFaEzEbAglcEETMm3MHM2d9 8Q== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uprhdvna0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 01 Dec 2023 20:11:44 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B1KBg6w014108
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 1 Dec 2023 20:11:42 GMT
Received: from [10.110.3.135] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 1 Dec
 2023 12:11:41 -0800
Message-ID: <1a6b5c1c-5bb6-e92c-daed-3b1c081438a1@quicinc.com>
Date: Fri, 1 Dec 2023 12:11:39 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 0/2] Stabilize use of vblank_refcount
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20231201014101.15802-1-quic_parellan@quicinc.com>
 <CAA8EJprzcWTmqkUNN2r81APkv3rE039xhmaZW5=Zp7WkkQ=pHQ@mail.gmail.com>
From: Paloma Arellano <quic_parellan@quicinc.com>
In-Reply-To: <CAA8EJprzcWTmqkUNN2r81APkv3rE039xhmaZW5=Zp7WkkQ=pHQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: PxUZ3AO1NFwGDLpGiUsxVazof199q4fw
X-Proofpoint-GUID: PxUZ3AO1NFwGDLpGiUsxVazof199q4fw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-01_18,2023-11-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0 mlxlogscore=999
 clxscore=1015 mlxscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2312010127
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
Cc: linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, seanpaul@chromium.org,
 steev@kali.org, marijn.suijten@somainline.org, quic_jesszhan@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 11/30/2023 11:41 PM, Dmitry Baryshkov wrote:
> On Fri, 1 Dec 2023 at 03:41, Paloma Arellano <quic_parellan@quicinc.com> wrote:
>> There is currently a race condition occuring when accessing
>> vblank_refcount. Therefore, vblank irq timeouts may occur.
>>
>> Avoid any vblank irq timeouts by stablizing the use of vblank_refcount.
>>
>> Changes from prior versions:
>>     v2: - Slightly changed wording of patch #2 commit message
>>     v3: - Mistakenly did not change wording of patch #2 in last version.
>>           It is done now.
> Usually sending a series once a day is enough. If you have any pending
> changes, it might be better to reply to your patch stating that you
> want to do this and that, while still allowing reviewers to respond
> (and thus you can incorporate their review in the next iteration).

Ack. Good to know.

Thank you,

Paloma

>> Paloma Arellano (2):
>>    drm/msm/dpu: Modify vblank_refcount if error in callback
>>    drm/msm/dpu: Add mutex lock in control vblank irq
>>
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c          |  6 ++++++
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h     |  6 ++++++
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 11 +++++++++--
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 11 +++++++++--
>>   4 files changed, 30 insertions(+), 4 deletions(-)
>>
>> --
>> 2.41.0
>>
>
