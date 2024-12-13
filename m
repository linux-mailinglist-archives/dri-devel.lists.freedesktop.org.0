Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80FA19F11E9
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2024 17:20:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C207810E205;
	Fri, 13 Dec 2024 16:20:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="kz1S3qoR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3327510E205
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 16:20:45 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BDBhs2H018453;
 Fri, 13 Dec 2024 16:20:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 LZghmJpxqz/q1EA9FYZC3bapEzMFnlVITLXX7Cu+Igc=; b=kz1S3qoR5I8bYMjh
 9Hw7VvDKehOE9EWo47dX61z+lHC6Plxv77Yf1Jf/7qasTaeSOnEQadPq4aSfR69G
 RvFdr8ddp9OYjvC5FZGzc4KACXyZm5+aei9s4oR9ebuiICiDxRdyKBNURMvFlZZ/
 HXFXilg/sStN2yBl67aaRLE0IJgjJTICPNvj7fE6nCdx4HUyXoahjvVz3MXUdMdK
 WsYqvuL1wLScVAmToPsAy1uDx+VP1H1+w7GVgr3+eRDyxdOSQleJmjvocSG+8G52
 4070DOOTMZ3TQEjlJ/JR4imQ0lYto5vmuwxJrTHlw01DuGliQqIdKZlBkdUHyw4e
 nlkAAQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43gmac0qhh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Dec 2024 16:20:39 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BDGKcuI028893
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Dec 2024 16:20:38 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 13 Dec
 2024 08:20:37 -0800
Message-ID: <a7add90f-3d78-9ced-655f-a1918fb04af3@quicinc.com>
Date: Fri, 13 Dec 2024 09:20:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH V2 8/8] accel/amdxdna: Add include interrupt.h to
 amdxdna_mailbox.c
Content-Language: en-US
To: Lizhi Hou <lizhi.hou@amd.com>, <ogabbay@kernel.org>,
 <dri-devel@lists.freedesktop.org>
CC: <linux-kernel@vger.kernel.org>, <min.ma@amd.com>, <max.zhen@amd.com>,
 <sonal.santan@amd.com>, <king.tam@amd.com>,
 <mario.limonciello@amd.com>, Mike Lothian <mike@fireburn.co.uk>
References: <20241206220001.164049-1-lizhi.hou@amd.com>
 <20241206220001.164049-9-lizhi.hou@amd.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20241206220001.164049-9-lizhi.hou@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: MhXvh_B2LFabFMrx31qWYxMU6y6dkAAH
X-Proofpoint-GUID: MhXvh_B2LFabFMrx31qWYxMU6y6dkAAH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 mlxscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 suspectscore=0 spamscore=0 adultscore=0 mlxlogscore=733 lowpriorityscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412130114
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

On 12/6/2024 3:00 PM, Lizhi Hou wrote:
> For amdxdna_mailbox.c, linux/interrupt.h is indirectly included by
> trace/events/amdxdna.h. So if TRACING is disabled, driver compiling will
> fail.
> 
> Fixes: b87f920b9344 ("accel/amdxdna: Support hardware mailbox")
> Reported-by: Mike Lothian <mike@fireburn.co.uk>
> Closes: https://lore.kernel.org/dri-devel/CAHbf0-E+Z2O7rW-x+-EKNQ-nLbf=_ohaNzXxE7WD2cj9kFJERQ@mail.gmail.com/
> Signed-off-by: Mike Lothian <mike@fireburn.co.uk>
> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>

Slight problem with the SOB chain which prevents me from applying this.

Mike comes first, which indicates he authored this patch.  Then you, 
which says you took Mike's patch and are moving it forward.  However, 
since you sent it and it doesn't have "From: Mike", you get listed as 
author.

Either Mike needs to be the listed author, or a Co-developed-by tag for 
Mike needs to be listed immediately before his SOB.

With either of those:

Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
