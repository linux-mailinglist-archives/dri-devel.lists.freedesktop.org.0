Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 253C88A0441
	for <lists+dri-devel@lfdr.de>; Thu, 11 Apr 2024 01:55:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC86D10E7F2;
	Wed, 10 Apr 2024 23:55:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="BygHv0fN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3CDD10E7F2;
 Wed, 10 Apr 2024 23:54:58 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 43ANZ9Y2028725; Wed, 10 Apr 2024 23:54:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=ud+WWCx4xODuZuMdTW9/ejS5nu9pBEEV39W+s+p/t5w=; b=By
 gHv0fNr77D+JE4dgpaIFDeliqQrFzp/i7xxfqpBgtj4EYUH07c7a+wjyqYwwXuLn
 gd5Fb6upG/Ky4ck07bcQ0CcUyZDcu0934dwt4U5cf+i0xfq1aIdHGZDZYQBP+K3t
 Sqchx7jtpSnG1wjP9WxQtAi8GPkC6CkTjL6CIvOz4g3KETOKCoSpmlWfG2KSo/ji
 GkxZWnYb11XUCILcpf4deS6HnYKvysQ+uhrHUqRR0SKVcO9fPRB1qlBYdU9hZ2I8
 ozCqedFEuHosYJJHZYkcF8FILtzg0ercpgelXozKoUxnulnlwAwF2bDkTaZbpGWE
 qcLt7got14Na6yotgTLg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xdqy7ubtg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Apr 2024 23:54:52 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43ANspS9011819
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Apr 2024 23:54:51 GMT
Received: from [10.71.109.81] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 10 Apr
 2024 16:54:50 -0700
Message-ID: <c0274d67-ae15-8b08-a6af-bd1d77698ab9@quicinc.com>
Date: Wed, 10 Apr 2024 16:54:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 03/12] drm/msm/dpu: use format-related definitions from
 mdp_common.xml.h
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn
 Suijten <marijn.suijten@somainline.org>,
 Stephen Boyd <swboyd@chromium.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Andersson <andersson@kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>
References: <20231202214016.1257621-1-dmitry.baryshkov@linaro.org>
 <20231202214016.1257621-4-dmitry.baryshkov@linaro.org>
 <bb448864-b974-55ac-4709-ea89bbd2694f@quicinc.com>
 <CAA8EJpqnjY35RF52yJ8gFRKHoh1ArnnviacDtfntSYZdALD3bQ@mail.gmail.com>
 <83b45b20-fb7e-564b-4e32-2b6a12c4dc6d@quicinc.com>
 <uhyqwsevbgvayqf7ky2tasvutpqgvuaa5o7y7scqete3jueuhk@zgji4hgmh4lu>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <uhyqwsevbgvayqf7ky2tasvutpqgvuaa5o7y7scqete3jueuhk@zgji4hgmh4lu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: JF8LotaiTBurtH5b4ceyzSvdZOeyC62d
X-Proofpoint-ORIG-GUID: JF8LotaiTBurtH5b4ceyzSvdZOeyC62d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-10_08,2024-04-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 mlxlogscore=999 suspectscore=0 mlxscore=0 clxscore=1015
 phishscore=0 spamscore=0 adultscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404100177
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



On 4/10/2024 2:12 PM, Dmitry Baryshkov wrote:
> On Wed, Apr 10, 2024 at 01:18:42PM -0700, Abhinav Kumar wrote:
>>
>>
>> On 4/10/2024 1:16 PM, Dmitry Baryshkov wrote:
>>> On Wed, 10 Apr 2024 at 23:00, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>>>
>>>>
>>>>
>>>> On 12/2/2023 1:40 PM, Dmitry Baryshkov wrote:
>>>>> Instead of having DPU-specific defines, switch to the definitions from
>>>>> the mdp_common.xml.h file. This is the preparation for merged of DPU and
>>>>> MDP format tables.
>>>>>
>>>>
>>>> Adding MDP_***__ usages in DPU driver is quite confusing.
>>>>
>>>> Can we align to a common naming scheme such as DISP_***?
>>>
>>> No, it's not something display-generic. It is specific to MDP
>>> platforms. In the end DPU is a continuation of the MDP lineup, isn't
>>> it?
>>>
>>
>> No some aspects of the hw are completely different as you already know
>> between MDP4/MDP5 and DPU. Bringing back MDP usages into DPU does not seem
>> right.
> 
> MDP4 is different, it's true. But there is a lot of common between MDP5
> and DPU. Frakly speaking, I don't see an issue with using the constant
> that was defined for MDP5 for DPU layer. Especially since we are also
> going to use mdp_ functions for format handling.
> 

All the HW naming etc in the doc has migrated to DPU and in fact it only 
makes sense to start using DPU for MDP5 as we plan to move mdp5 targets 
to DPU anyway. Not the other way around.

MDP4 remains different.

How about MSM_DISP then? I dont get why this is MDP platform specific. 
Because the term MDP no longer holds true for DPU.

I am even looking for future chipsets. We cannot live with MDP5 names. 
Have to think of generic names for formats.
