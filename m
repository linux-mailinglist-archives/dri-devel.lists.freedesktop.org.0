Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC0E69B053
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 17:14:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91DF310E0A5;
	Fri, 17 Feb 2023 16:14:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A79C110E0A5
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 16:14:48 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31H6rAd0009536; Fri, 17 Feb 2023 16:14:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=HhnZfmCLymwdEGX0RzKZobcjIkAv4CU0zR4Kz/xuDtM=;
 b=nqsXO8EN9IoMxNdWD+8i0ewprDxHwEs6tnaN722bbabHEAty+5DAvYj2RszWCp7RiKnb
 IOv5Ehrg1f9lW/uQ6W0mtMY3WmIJ39X9ATvHy/yStyMmtIJ35wPI80hyHLG/3flShYQq
 U28XiIEn+exyk9QSKjThhdzZBF/RfF6vWuzbmBQiHlQ/sWsbJC7bfZ1uP6xNXa/XhPao
 0YGAmYljtJyndwkYei6fhUQvNAYJlnzwG9u0TiQTGQrKrVK4qy7H+EI7D6Blt3+6/0fz
 GnqFKH/2kjLmvbWaYyiZ8AnaLFD/7fuEM6z3rQfRgiRYTH4R5zrU9iTR170/VF5BZP9O aA== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nsxe7tcnu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Feb 2023 16:14:42 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 31HGEf1t030901
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Feb 2023 16:14:41 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Fri, 17 Feb
 2023 08:14:40 -0800
Message-ID: <e47d2113-cde3-3e65-a132-391b7c314d5e@quicinc.com>
Date: Fri, 17 Feb 2023 09:14:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v2 0/8] QAIC accel driver
Content-Language: en-US
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
To: <ogabbay@kernel.org>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>
References: <1675698105-19025-1-git-send-email-quic_jhugo@quicinc.com>
 <d1074659-8b6a-0756-9cd6-23a9ddc604d8@quicinc.com>
In-Reply-To: <d1074659-8b6a-0756-9cd6-23a9ddc604d8@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: aWE76DyEaZRMJM3eKXrWn2i4de8RN2sE
X-Proofpoint-ORIG-GUID: aWE76DyEaZRMJM3eKXrWn2i4de8RN2sE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-17_10,2023-02-17_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 phishscore=0 adultscore=0 spamscore=0 suspectscore=0
 malwarescore=0 mlxlogscore=777 impostorscore=0 mlxscore=0
 priorityscore=1501 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2302170144
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

On 2/8/2023 3:01 PM, Jeffrey Hugo wrote:
> On 2/6/2023 8:41 AM, Jeffrey Hugo wrote:
>> Regarding the open userspace (see the documentation patch), the UMD and
>> compiler are a week or so away from being posted in the indicated repos.
>> Just need to polish some documentation.
> 
> An update to this, the compiler is now live on github at the link 
> specified in the documentation patch.

The UMD is now posted.

-Jeff
