Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12EA468FA01
	for <lists+dri-devel@lfdr.de>; Wed,  8 Feb 2023 23:01:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 248A110E2FF;
	Wed,  8 Feb 2023 22:01:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC49D10E2FF
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Feb 2023 22:01:42 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 318LmeE8014287; Wed, 8 Feb 2023 22:01:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=YkgNf9iry4aylU4hrKdkjVjQ81dnafBgimpOfjve4JY=;
 b=Tz+t4XEpzaeag4JVfGi6wj2hC9v0IkrXr37pluvLMToNorCUNbvzwSQiOjNpukVPR1fq
 K5RZ2c7W49LtFEuojT/BtzLcMwirpqIzRPQI8Nde+fsmuTAFkmIPYdkfXQLVN1kf+TY3
 QVH890JfdTaLYinI2JLLxPRVB54G2E8Lu0S9Md/QhZUPqBBTeApbQhYz1S7uG2Abgklg
 TalvjSbYGtlGnVlJRkA4Prt9EOk2xo0hvH8Z6eGAjuGHerTiae4BPw3voJdqWEJRTnIb
 V0Ol4/yieNtJ3645ZXsgE4SLC0vAIr+QiFUm0b2hZCh9rmWlrXCHu3hJ8jzD3FVNJOZ8 8Q== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nm7g1t1pv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Feb 2023 22:01:11 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 318M1AI9008107
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 8 Feb 2023 22:01:10 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 8 Feb 2023
 14:01:09 -0800
Message-ID: <d1074659-8b6a-0756-9cd6-23a9ddc604d8@quicinc.com>
Date: Wed, 8 Feb 2023 15:01:08 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v2 0/8] QAIC accel driver
Content-Language: en-US
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
To: <ogabbay@kernel.org>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>
References: <1675698105-19025-1-git-send-email-quic_jhugo@quicinc.com>
In-Reply-To: <1675698105-19025-1-git-send-email-quic_jhugo@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: NCWFP8HWWzVHgrMqt7-M_GmFG2zzN2iV
X-Proofpoint-ORIG-GUID: NCWFP8HWWzVHgrMqt7-M_GmFG2zzN2iV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-08_09,2023-02-08_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0
 mlxlogscore=780 spamscore=0 bulkscore=0 mlxscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302080186
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
Cc: linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 quic_ajitpals@quicinc.com, quic_pkanojiy@quicinc.com,
 stanislaw.gruszka@linux.intel.com, quic_carlv@quicinc.com,
 jacek.lawrynowicz@linux.intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/6/2023 8:41 AM, Jeffrey Hugo wrote:
> Regarding the open userspace (see the documentation patch), the UMD and
> compiler are a week or so away from being posted in the indicated repos.
> Just need to polish some documentation.

An update to this, the compiler is now live on github at the link 
specified in the documentation patch.

-Jeff
