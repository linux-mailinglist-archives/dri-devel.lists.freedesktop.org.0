Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 864029D4788
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2024 07:30:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3183F10E189;
	Thu, 21 Nov 2024 06:30:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="UEZ+qIFP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C44910E189
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2024 06:30:08 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AL0Yj46004466;
 Thu, 21 Nov 2024 06:30:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Gr+JWUTvGIUOXN5PEXraHWM0OuhKA8B9C0NHGITewQ8=; b=UEZ+qIFPQBAMKua7
 Detma/BHuDkeidilPnALoV3g41hUJojbSbbyEa2emwa+swEpf8Z/Dj3whfi0Y09L
 uEQG3dpq8JGx8taSfEkLz3TRSB4rGOQB/IQAIAMq56kDrmRapuwIKt6ZATAsS3UR
 dKy2hdx5Ukr2BA0UMSz2LT6JlKaNTlZeqEvvzHALlUa2HxujZMPOG4Hy51KM/dVr
 VUschmSieDk5k5C+K37QBgqX4ZK6cKCOn5XrJ4VcsTiNNrPJu76UYk/hO5WoiLgr
 fn4VB7iJ53Me0i9ino9/4ZKp9u71/fc1AWZSMPZEjNcOVvQQ1s8jaDWUVnRoAlkS
 vKMftA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 431ea72k9r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Nov 2024 06:30:03 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
 by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AL6U2mL012800
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Nov 2024 06:30:02 GMT
Received: from [10.204.65.49] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 20 Nov
 2024 22:29:59 -0800
Message-ID: <3e53ba1b-95ad-43f1-aab3-fa4365e16209@quicinc.com>
Date: Thu, 21 Nov 2024 11:59:56 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/4] misc: fastrpc: Introduce fastrpc_shared.h header
To: Greg KH <gregkh@linuxfoundation.org>
CC: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>,
 <quic_bkumar@quicinc.com>, <linux-kernel@vger.kernel.org>,
 <quic_chennak@quicinc.com>, <dri-devel@lists.freedesktop.org>,
 <arnd@arndb.de>
References: <20241118084046.3201290-1-quic_ekangupt@quicinc.com>
 <20241118084046.3201290-4-quic_ekangupt@quicinc.com>
 <2024111832-sprinkled-boastful-8fba@gregkh>
Content-Language: en-US
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
In-Reply-To: <2024111832-sprinkled-boastful-8fba@gregkh>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 1IQRiqXP_6Lpa1sIcygDkV0mfxGKOu2E
X-Proofpoint-ORIG-GUID: 1IQRiqXP_6Lpa1sIcygDkV0mfxGKOu2E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 bulkscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 mlxlogscore=594
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411210048
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



On 11/18/2024 7:28 PM, Greg KH wrote:
> On Mon, Nov 18, 2024 at 02:10:45PM +0530, Ekansh Gupta wrote:
>> Move fastrpc structures and MACRO definitions to a new header file.
>> These definitions are consumed by other upcoming features like
>> debugfs, PDR support etc.
>>
>> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
>> ---
>>  drivers/misc/fastrpc/fastrpc_main.c   | 136 +---------------------
>>  drivers/misc/fastrpc/fastrpc_shared.h | 155 ++++++++++++++++++++++++++
> Again, why not just "fastrpc.h"?  No need for the huge prefix here,
> right?
yes, right

--ekansh
>
> thanks,
>
> greg k-h

