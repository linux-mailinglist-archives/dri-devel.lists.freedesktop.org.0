Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4957B7D9BC2
	for <lists+dri-devel@lfdr.de>; Fri, 27 Oct 2023 16:42:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6580010E9CA;
	Fri, 27 Oct 2023 14:42:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E06E10E9C7
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Oct 2023 14:42:07 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 39RDhHmo015918; Fri, 27 Oct 2023 14:41:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=bJAIi2q8UFEk0QT4iOEedsKzVFkWnnEHurVq4Id6oSw=;
 b=HjgfjF6Q6h1PPrPS3xK6LQn0xE1aP9osxG2YgusBQOYto4uc4NMHJq/xdzX1ChM73AJI
 D1ldjsu58h16sAUM0fgySBAhdRPtzgPm/ThLkAcdOrTB4/uTlWucYAPUn5KEUSuVCSYT
 V6PuTD1tfQ30pXHzLTd4es61VelKJNarzBJYobWyhg4LX829vmFSIagy9+TfwCE7xtq2
 RBC3dX6vX99q+l9yFd62ZEhSuLe3ksPpSPALNi/Z15B2Ss+NOgI2YBgyzKAZQC/5lmkV
 VetquueIa78g4AZvBO1ZMp4EGsADkbp4zoPNyzOZoXhjfHmjw3w4lIg6pgviNyXaGw3G nw== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tyxbva9fy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Oct 2023 14:41:34 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39REfXJq005439
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Oct 2023 14:41:33 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Fri, 27 Oct
 2023 07:41:32 -0700
Message-ID: <8b823c9a-967e-ca15-4b8c-100937ca5c51@quicinc.com>
Date: Fri, 27 Oct 2023 08:41:31 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 03/11] accel/ivpu: Add dvfs_mode file to debugfs
Content-Language: en-US
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
References: <20231025094323.989987-1-stanislaw.gruszka@linux.intel.com>
 <20231025094323.989987-4-stanislaw.gruszka@linux.intel.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20231025094323.989987-4-stanislaw.gruszka@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 2coNcqSGG89r9CHLENzKWwMy1ioa9IxZ
X-Proofpoint-GUID: 2coNcqSGG89r9CHLENzKWwMy1ioa9IxZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-27_12,2023-10-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 clxscore=1011
 priorityscore=1501 adultscore=0 impostorscore=0 mlxlogscore=900
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2310240000 definitions=main-2310270126
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
 Tomasz Rusinowicz <tomasz.rusinowicz@intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/25/2023 3:43 AM, Stanislaw Gruszka wrote:
> From: Tomasz Rusinowicz <tomasz.rusinowicz@intel.com>
> 
> Add new debugfs file to set dvfs_mode FW boot parameter and restart
> the FW to allow experimenting with DVFS (dynamic voltage & frequency
> scaling).
> 
> Signed-off-by: Tomasz Rusinowicz <tomasz.rusinowicz@intel.com>
> Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>

Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
