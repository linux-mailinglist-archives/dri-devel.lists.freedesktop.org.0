Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 968D0656DF5
	for <lists+dri-devel@lfdr.de>; Tue, 27 Dec 2022 19:29:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C81710E0BD;
	Tue, 27 Dec 2022 18:29:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B122310E0BD
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Dec 2022 18:29:25 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BRFv5jk002157; Tue, 27 Dec 2022 18:29:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=+v3e7a1zliKsDV1q/rqzmquSG93OGIaKXSrzYuaYnLk=;
 b=Zbin1VVgbusvd8ESpjlNfD9jjVJHkW9A93WifwzSC2uqknIwwtk6sZpLYRqWc17n+bcn
 Lo/84NwAfD6lsi/bq90wehePJ1O5lV5F3i1VSJoWNp33qI/t8NI0WY4MEwp9dE5rB9wz
 OZfxtuM4dpGKyF/i0O0/9NHxOAEL4TdomFbDuo7uJ110CBS6SsVwOGAcPHDVetC2nNIk
 JUf1xTSBauns1SHgZaIhxZSQcTv+BbNK9L9ec88BTZ4+jxp6ZL9NW8j7uPjNx8kim/vM
 KgKwj6qQuPRwpaC9G5XJ5J8McTsK1BTPTAlFymQvCvSVMRQIdQndemIwE7tFiDRNnomp 6g== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mnpsvnye1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Dec 2022 18:29:21 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2BRITKuR024391
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Dec 2022 18:29:20 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Tue, 27 Dec
 2022 10:29:20 -0800
Message-ID: <5db3ee62-d864-1eb7-65c3-21e86037cbe0@quicinc.com>
Date: Tue, 27 Dec 2022 11:29:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 1/2] habanalabs/uapi: move uapi file to drm
Content-Language: en-US
To: Oded Gabbay <ogabbay@kernel.org>, <airlied@gmail.com>,
 <gregkh@linuxfoundation.org>
References: <20221226213227.26953-1-ogabbay@kernel.org>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20221226213227.26953-1-ogabbay@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 5mIBXYwb4-UDmRbD_TN4nRX5CZALFMvT
X-Proofpoint-ORIG-GUID: 5mIBXYwb4-UDmRbD_TN4nRX5CZALFMvT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-27_13,2022-12-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 mlxlogscore=869 phishscore=0 priorityscore=1501 mlxscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1011 bulkscore=0 adultscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212270152
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/26/2022 2:32 PM, Oded Gabbay wrote:
> Move the habanalabs.h uapi file from include/uapi/misc to
> include/uapi/drm, and rename it to habanalabs_accel.h.
> 
> This is required before moving the actual driver to the accel
> subsystem.
> 
> Update MAINTAINERS file accordingly.
> 
> Signed-off-by: Oded Gabbay <ogabbay@kernel.org>

This would impact the hl-thunk project at 
https://github.com/HabanaAI/hl-thunk as the open userspace, right?  I 
don't appear to see corresponding changes there.  Is there a dev branch 
I'm missing?

-Jeff
