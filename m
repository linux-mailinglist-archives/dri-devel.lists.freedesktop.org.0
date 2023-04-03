Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 630966D4ED5
	for <lists+dri-devel@lfdr.de>; Mon,  3 Apr 2023 19:22:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 379C510E53A;
	Mon,  3 Apr 2023 17:22:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADECD10E53D
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Apr 2023 17:22:33 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3339YVW6018741; Mon, 3 Apr 2023 17:22:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=Af3s5G/aolKwreO29COUrDz81q+OalVRU3frOpJHRng=;
 b=L7gA8RdrWhxmB1Ik+/ONXAtOd3nPTlkVvhXMvsQGtvOxWax/deyBOq6DzC6qAcW2NP3H
 uByiI6kn8sQr/HZSRn3w5hT2SY02R6POF8K0iXjBCz3A24UcRFDM0fg+3E/EeD+OCmO/
 MprzRgl30mze6UNNDfr0xSUhd+uCL1nVgMXmj3hm94zP8ddGXhcvstqiy5sFqMf6ly5N
 IpRnpVomKISKBUPPBemQd74HE6XnN0gyVa/2QRGlCxkHSqzgJ5DG1LaoAKh/lYsaLhN0
 B1xMWfkxZQcknpmUgBQ3hmGCA3GJ30dIxwCfgXqek8wVgDs/8dqR40dWAveb4SZmQEXV OQ== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pquxth6hu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Apr 2023 17:22:28 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 333HMSJj026965
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 3 Apr 2023 17:22:28 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Mon, 3 Apr 2023
 10:22:27 -0700
Message-ID: <857db3fb-b006-4aa8-a7f8-2ae0b8a160c9@quicinc.com>
Date: Mon, 3 Apr 2023 11:22:26 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v5 0/8] QAIC accel driver
Content-Language: en-US
To: <ogabbay@kernel.org>, <airlied@gmail.com>, <daniel@ffwll.ch>
References: <1679932497-30277-1-git-send-email-quic_jhugo@quicinc.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <1679932497-30277-1-git-send-email-quic_jhugo@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 4wQCV7mNiCtasMy428mwho3l1wd_XAq5
X-Proofpoint-ORIG-GUID: 4wQCV7mNiCtasMy428mwho3l1wd_XAq5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-03_14,2023-04-03_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 spamscore=0 mlxlogscore=951 priorityscore=1501
 impostorscore=0 mlxscore=0 adultscore=0 suspectscore=0 bulkscore=0
 phishscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304030131
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
Cc: linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org, mani@kernel.org,
 dri-devel@lists.freedesktop.org, quic_ajitpals@quicinc.com,
 quic_pkanojiy@quicinc.com, stanislaw.gruszka@linux.intel.com,
 quic_carlv@quicinc.com, jacek.lawrynowicz@linux.intel.com,
 bagasdotme@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/27/2023 9:54 AM, Jeffrey Hugo wrote:
> This series introduces a driver under the accel subsystem (QAIC -
> Qualcomm AIC) for the Qualcomm Cloud AI 100 product (AIC100).  AIC100 is
> a PCIe adapter card that hosts a dedicated machine learning inference
> accelerator.
> 
> The previous version (v4) can be found at:
> https://lore.kernel.org/all/1679325074-5494-1-git-send-email-quic_jhugo@quicinc.com/

Looks like things have been silent on this revision and we have a number 
of review tags already.  Seems like this series is ready for merge.

I'd like to see this queued for 6.4 if possible.  Given that we are at 
6.3-rc5, it seems like this would need to be merged now(ish) to make 6.4.

Jacek, since you have commit permissions in drm-misc and are an active 
Accel maintainer, I wonder if it would be appropriate for you to merge 
this series to drm-misc.  Thoughts?

-Jeff
