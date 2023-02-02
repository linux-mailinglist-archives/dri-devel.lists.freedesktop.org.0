Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C9868810B
	for <lists+dri-devel@lfdr.de>; Thu,  2 Feb 2023 16:05:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6177210E539;
	Thu,  2 Feb 2023 15:05:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 209B210E539
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Feb 2023 15:05:53 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 312Eb7AR026503; Thu, 2 Feb 2023 15:05:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=e91U8MOdKq8n2yiSZXERrJPdHXGMp2ImnmCPhXkBF9s=;
 b=QgRLr+G1yZE5/BewR88AoLl3aXx1jMKqNoypL3gQLq5f4XJEcTGZsGUMiWPP0Qz++QWc
 e3Ix4gNv6njFxyFl/UeMOfDsTGIl5zPyQcLxXv/0/V3eHQcBF0Bv2YSrAvgcx/o852QG
 04j7MUOGMSyW354Hva/+FkALxgeyjqiBDcgDfQPHYYJmQ28t1/dKjMqYKAVpGwbYfb6E
 nqdZ4umqN9Hs5ioHdY0hZzdb+LLlYnIwzywuo59rMRk0RTAWAbLqWmmzqA/jUglQ+wLq
 XJuMDMF3bQPWU7u50UKzuex/uheNLsu3M6QkAjG35cvM3ca2h77uCySyla7mCJopgDoO 2Q== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nfkj5kbe2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Feb 2023 15:05:50 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 312F5nZr003174
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 2 Feb 2023 15:05:49 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 2 Feb 2023
 07:05:48 -0800
Message-ID: <26d072fb-5f2e-e8d0-7e16-da9dcccd25a3@quicinc.com>
Date: Thu, 2 Feb 2023 08:05:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 3/4] accel/ivpu: Set dma max_segment_size
Content-Language: en-US
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
References: <20230202092114.2637452-1-stanislaw.gruszka@linux.intel.com>
 <20230202092114.2637452-4-stanislaw.gruszka@linux.intel.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20230202092114.2637452-4-stanislaw.gruszka@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 7BU_qv4OSYI1E1bey-IbR5UG3y3ViRmw
X-Proofpoint-ORIG-GUID: 7BU_qv4OSYI1E1bey-IbR5UG3y3ViRmw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-02_04,2023-02-02_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 mlxlogscore=877 spamscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 clxscore=1015 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302020136
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
Cc: Oded Gabbay <ogabbay@kernel.org>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/2/2023 2:21 AM, Stanislaw Gruszka wrote:
> Avoid below spurious warning:
> 
> [  264.844029] DMA-API: intel_vpu 0000:00:0b.0: mapping sg segment longer than device claims to support [len=143360] [max=65536]
> [  264.844038] WARNING: CPU: 0 PID: 1254 at kernel/dma/debug.c:1160 debug_dma_map_sg+0x6ca/0xb70
> 
> Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>


Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
