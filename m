Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F044076D194
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 17:16:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB52510E175;
	Wed,  2 Aug 2023 15:16:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D748410E175
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Aug 2023 15:16:08 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 372E7f1i028328; Wed, 2 Aug 2023 15:16:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=l27L1z+fYh8L3ZhSSl3etbSXBI7anqfGlqjXvz1VcQM=;
 b=cUrJgIK4QWL8orqSU9cB9WcD9MoUcdP7a+IgT2POv4gUjWMRWLRWbXRzlOZF0Bjl9MRM
 MbbshXB43bGPH3uRIKQqoCxPWRp6twV8GkC4+6ShWffxyjjReBDxSfsTWrjc9M0mgaHO
 aallzm6bWIeHUxQs/He2Vq74229RhIvFdmOvoxQGtp95T5l34EP2aj7EjUCGiwq3qOjF
 NTTaIxpZtwkpO8tFM9CUz/yhcDjqP/OKv0nGiw26HoJq4tVz1U1hbmxy+ccVtatczamM
 0PD1oNNlUrQr7YLrAFLiGoAUJoeiP4UQMwr83DYQWlRqyzvvE453e8KJZ5w3kPpDsRq8 /w== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3s75dgasd1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Aug 2023 15:16:04 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 372FG32r000824
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 2 Aug 2023 15:16:03 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Wed, 2 Aug
 2023 08:16:02 -0700
Message-ID: <a36af0d6-f6bf-39f8-825d-c743dbd6e84e@quicinc.com>
Date: Wed, 2 Aug 2023 09:16:01 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH][V2][next] accel/qaic: remove redundant pointer pexec
Content-Language: en-US
To: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>, Colin Ian King
 <colin.i.king@gmail.com>, Carl Vanderlip <quic_carlv@quicinc.com>, "Oded
 Gabbay" <ogabbay@kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>
References: <20230726140626.264952-1-colin.i.king@gmail.com>
 <dc7fdd8a-b3c4-b931-61be-b9bc467c6a85@quicinc.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <dc7fdd8a-b3c4-b931-61be-b9bc467c6a85@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 71YLkLg0-fdy5LzX6hH5l4uUHqpY7jSM
X-Proofpoint-ORIG-GUID: 71YLkLg0-fdy5LzX6hH5l4uUHqpY7jSM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-02_11,2023-08-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 phishscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0 spamscore=0
 mlxlogscore=752 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308020135
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/1/2023 8:05 AM, Pranjal Ramajor Asha Kanojiya wrote:
> 
> 
> On 7/26/2023 7:36 PM, Colin Ian King wrote:
>> Pointer pexec is being assigned a value however it is never read. The
>> assignment is redundant and can be removed. Replace sizeof(*pexec)
>> with sizeof the type and remove the declaration of pointer pexec.
>>
>> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> 
> Reviewed-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
> 

Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>

Applied to drm-misc-next

Thanks!

-Jeff
