Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 95BCA72A11F
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 19:20:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DD3F10E6CF;
	Fri,  9 Jun 2023 17:20:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E359210E6CF
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jun 2023 17:20:08 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 359Dtbm1014796; Fri, 9 Jun 2023 17:20:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=Ul82jzY2RSnizNofA8g6g0DXvs09Bv5nfY+uPJv55D8=;
 b=VXnD2X/ims9ciYr28Kwl6B0Cv2MvYdkLePA4lIYnpsRYMVQXB3BRSBvnlySwxjl6CuWu
 2LZagrAhv+tK3kFbM7IrqeJ7nMFtyMXq1aMH7EJ/c8lpfmnnr/Fgd4tdq1c3iKbt8F5j
 BCtdxQczzK9wiCj9oYJiaTTrwe9jT2ZSOo6/QuHALioQkv+ooxB1/eG5loVfHPFnn3Qv
 biN1kjH+A/xXtHAixSLKz8HSpgKbjLuCaUHMGOdtbPQBSEVh5q/wjJa9+A7ffJqDJQRn
 C00gTUW0x5hb8DFf77zoF234rPBA+lrtIBRmsPb9wgabGL0lhkLSPRzRkIVRcvrhu/SE WA== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3r3tyxsm4d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Jun 2023 17:20:03 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 359HK35e012590
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 9 Jun 2023 17:20:03 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Fri, 9 Jun 2023
 10:20:02 -0700
Message-ID: <0b525cc2-81d0-329f-3be2-7f577bf7cadf@quicinc.com>
Date: Fri, 9 Jun 2023 11:20:01 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 0/2] accel/qaic fixes for 6.4 part 2
Content-Language: en-US
To: <dri-devel@lists.freedesktop.org>
References: <20230602210440.8411-1-quic_jhugo@quicinc.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20230602210440.8411-1-quic_jhugo@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: evEUdpA6-0LBNH5w63NfkJYM5WNrq_NM
X-Proofpoint-ORIG-GUID: evEUdpA6-0LBNH5w63NfkJYM5WNrq_NM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-09_12,2023-06-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 mlxlogscore=704 mlxscore=0 malwarescore=0 phishscore=0
 impostorscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 spamscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306090145
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
Cc: linux-arm-msm@vger.kernel.org, ogabbay@kernel.org,
 linux-kernel@vger.kernel.org, quic_ajitpals@quicinc.com,
 stanislaw.gruszka@linux.intel.com, quic_carlv@quicinc.com,
 jacek.lawrynowicz@linux.intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/2/2023 3:04 PM, Jeffrey Hugo wrote:
> Two additional fixes for corner cases found during development when
> buggy userspace or firmware ends up subjecting the KMD to error
> scenarios.
> 
> Carl Vanderlip (1):
>    accel/qaic: Free user handle on interrupted mutex
> 
> Jeffrey Hugo (1):
>    accel/qaic: Fix NULL pointer deref in qaic_destroy_drm_device()
> 
>   drivers/accel/qaic/qaic_drv.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 

Pushed to drm-misc-fixes
