Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99BB993D5D2
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2024 17:18:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 830DE10E9CA;
	Fri, 26 Jul 2024 15:18:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="ORs8+I68";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A357610E9C8
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2024 15:18:47 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46QC8eJo028675;
 Fri, 26 Jul 2024 15:18:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 9ZbNNcZoESzP3l+yF+AAiOyMFNo46lNtooihjX+VvCo=; b=ORs8+I68SlqaTJNo
 oQ95CRHCyK0oIDytGLV2VgPxwh6ICSGWKu4pamF6mvwJ2QVU6ufirowy1QoxbbDk
 ze2Xq4epiazaRDiiihLdbbpl1lk6481PoUYXiFpW5famL827ApsvTk0SHBbyNEmA
 7UbGGP5DnN2G05G9Rs8cEDPW3t/qQMlx/Wx7Ny7j2khDKv5t90CnSZr7ci3uNSj4
 KTBjbnhE2xtFH2LWUCyR4DcQdFaGYeip1R97RSjs8AM4b8K4W7+I+J/0mIv/Febj
 +12YmTbJ5P6r/M8ixx7M8Nq/dbR1+YQTm1TPQ6UPxUQHKuLQWdSsnHxsh23a12OI
 GaVaRQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40m1tthrrt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Jul 2024 15:18:33 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 46QFIXR9027252
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Jul 2024 15:18:33 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 26 Jul
 2024 08:18:32 -0700
Message-ID: <4ee91b93-7a68-29dd-4532-a1543ccfd7af@quicinc.com>
Date: Fri, 26 Jul 2024 09:18:31 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH] accel/qaic: Remove the description of
 DRM_IOCTL_QAIC_PART_DEV
Content-Language: en-US
To: Zenghui Yu <yuzenghui@huawei.com>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-doc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
CC: <quic_carlv@quicinc.com>, <quic_pkanojiy@quicinc.com>,
 <ogabbay@kernel.org>, <corbet@lwn.net>, <wanghaibin.wang@huawei.com>
References: <20240716073036.453-1-yuzenghui@huawei.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20240716073036.453-1-yuzenghui@huawei.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: rAkFsSapuWO4wBK1hLP5vF94HeECq4kX
X-Proofpoint-ORIG-GUID: rAkFsSapuWO4wBK1hLP5vF94HeECq4kX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-26_12,2024-07-26_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 priorityscore=1501 mlxscore=0 mlxlogscore=764 clxscore=1015 bulkscore=0
 spamscore=0 phishscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407260103
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

On 7/16/2024 1:30 AM, Zenghui Yu wrote:
> The partition device ioctl was removed during the development of the
> initial version of qaic driver. Remove its description from the
> documentation to avoid confusing readers.
> 
> Signed-off-by: Zenghui Yu <yuzenghui@huawei.com>

Pushed to drm-misc-next

-Jeff
