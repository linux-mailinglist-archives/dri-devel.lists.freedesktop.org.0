Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB1A2667C3B
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 18:10:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E709F10E2FC;
	Thu, 12 Jan 2023 17:10:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 899D810E2FC
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jan 2023 17:10:05 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30CGlfEm032501; Thu, 12 Jan 2023 17:10:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=87LBx2a1agoyMGPxSlUxgtJWdUp51eswrRBzbEa3mvE=;
 b=ThHfuYAH9AUxXYWY4n1p7SetSFS6FIJRbCjfKNT2oKS1RhB8W3WEcmJUoiTeKalM+M3L
 k8TCw///EEyCcGNABXUTHhnAhWpHUu65svDGuif2/epnlbCGbsHzsArEh/7F2rO6Duy6
 +joLK/jCB0aolils9kgcHZd79T/8/NaX+2eqam+xWCMdJJ3jEzZvuMGsUYKJCmY871wn
 t4TyWGqBAvik+yQ4isJUdAT5QORTauAs04dqQwSi2u6TMpOhXFFCCTTqZ1Vnkadsi66o
 723njpcKRuStslwHZ5Mh8QTUhG9lF0LnK1Dhs5bnnq7blu8MYJlY98/GSTy9vwXKAhru 1w== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3n2evhs9p6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Jan 2023 17:10:02 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30CHA1Do001037
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Jan 2023 17:10:01 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 12 Jan
 2023 09:10:01 -0800
Message-ID: <17ea1dc9-dc47-fcd4-ee77-668128937d72@quicinc.com>
Date: Thu, 12 Jan 2023 10:10:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v5 0/7] New DRM accel driver for Intel VPU
Content-Language: en-US
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>, <oded.gabbay@gmail.com>,
 <airlied@gmail.com>, <daniel@ffwll.ch>, <tzimmermann@suse.de>
References: <20230109122344.253994-1-jacek.lawrynowicz@linux.intel.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20230109122344.253994-1-jacek.lawrynowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 754gcJrAacNwxQps2yLl9opVQkXJCrcB
X-Proofpoint-ORIG-GUID: 754gcJrAacNwxQps2yLl9opVQkXJCrcB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-12_08,2023-01-12_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0
 clxscore=1015 mlxlogscore=999 mlxscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301120125
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
Cc: andrzej.kacprowski@linux.intel.com, stanislaw.gruszka@linux.intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/9/2023 5:23 AM, Jacek Lawrynowicz wrote:
> Hi,
> 
> This patchset contains a new Linux* Kernel Driver for Intel® VPUs.
> 
> VPU stands for Versatile Processing Unit and it is an AI inference accelerator
> integrated with Intel non-server CPUs starting from 14th generation.
> VPU enables efficient execution of Deep Learning applications
> like object detection, classification etc.
> 
> The whole driver is licensed under GPL-2.0-only except for two headers imported
> from the firmware that are MIT licensed.
> 
> User mode driver was open sourced in December 2022 and it is available at:
> https://github.com/intel/linux-vpu-driver

I feel like I forgot to mention this earlier because I can't find a 
reference to it in my mails.  I would like to see something in 
Documentation for this driver/device.  Would be nice to get an overview 
of how it works (system block diagram?), how it is intended to be used, 
etc.  Include relevant references.  This would be a great place to 
document the UMD and the compiler (I am positive you have mentioned the 
compiler before, but I am currently failing to find a reference to it).

I feel that traditional DRM gets away from not needing this since their 
stuff is pretty well established.  Everyone uses Mesa/igt and so how 
things are structured/used is fairly well implied.  Accel is brand new 
and doesn't have that yet so I suspect we'll be well situated if we take 
the extra effort to spell out these things which might be just assumed 
elsewhere.  Hopefully, over time, such documentation helps in 
identifying useful areas to build up the common code of the subsystem.

I can't justify holding up this series for this though.  Please put it 
on some todo list  :)

-Jeff
