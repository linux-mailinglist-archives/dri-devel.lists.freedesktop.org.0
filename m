Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 800BB7AB490
	for <lists+dri-devel@lfdr.de>; Fri, 22 Sep 2023 17:17:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7C0A10E68B;
	Fri, 22 Sep 2023 15:17:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF36310E692
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Sep 2023 15:17:11 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 38MF0vaw026015; Fri, 22 Sep 2023 15:16:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=m7UJCN88ZLhzpJhzWOHKvOFzwA9pw03wBSOjWC2BtTI=;
 b=m0JliVpOM0wEktLpcfj961ULImPaDM8dOrYieRk58VfpmJFBfYD2S8trzzB1rCOk7FgS
 QbHe0cOZRWIRTuONVBW063hXJUmb5N2ZnhoE+T0+tnZpHqcB43hEHQtEM6wrWOLUX8Ih
 Cr8jsFfceBH+4KrhtI9pfJmvP3lWJuQGQxxcUVTmE2q9ojwOPMK8YVcSqgPHxyaTw8Ap
 X+GUowMyJhbr19QDLARcEzHxyO6ueJiMBHErYHgLKiDnUOgx86wEdncMemF+p8qAYZax
 1YNXFtAbMS5UFP2eunqbaP35S8pL7BumR3/OsteQmpfLCPnRC7cfnjRgUzvqXTVyRZEF Xw== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t8u0s285u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Sep 2023 15:16:57 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38MFGumJ000622
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Sep 2023 15:16:56 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Fri, 22 Sep
 2023 08:16:55 -0700
Message-ID: <d6612144-02e9-62cd-3d2a-db300892e7f0@quicinc.com>
Date: Fri, 22 Sep 2023 09:16:54 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 7/7] accel/qaic: Add QAIC_DETACH_SLICE_BO IOCTL
Content-Language: en-US
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
References: <20230901172247.11410-1-quic_jhugo@quicinc.com>
 <20230901172247.11410-8-quic_jhugo@quicinc.com>
 <20230917085646.GB441281@linux.intel.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20230917085646.GB441281@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 42t9qS83isvjws99JouccDGM5BUotdj9
X-Proofpoint-ORIG-GUID: 42t9qS83isvjws99JouccDGM5BUotdj9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-22_13,2023-09-21_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0 suspectscore=0
 adultscore=0 mlxlogscore=999 spamscore=0 priorityscore=1501 clxscore=1015
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2309220131
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
Cc: quic_pkanojiy@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_carlv@quicinc.com, ogabbay@kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/17/2023 2:56 AM, Stanislaw Gruszka wrote:
> On Fri, Sep 01, 2023 at 11:22:47AM -0600, Jeffrey Hugo wrote:
>> From: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
>>
>> Once a BO is attached with slicing configuration that BO can only be used
>> for that particular setting. With this new feature user can detach slicing
>> configuration off an already sliced BO and attach new slicing configuration
>> using QAIC_ATTACH_SLICE_BO.
>>
>> This will support BO recycling.
>>
>> detach_slice_bo() detaches slicing configuration from a BO. This new
>> helper function can also be used in release_dbc() as we are doing the
>> exact same thing.
>>
>> Signed-off-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
>> Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
>> [jhugo: add documentation for new ioctl]
>> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> <snip>
> 
>> +	/* Check if BO is committed to H/W for DMA */
>> +	spin_lock_irqsave(&dbc->xfer_lock, flags);
>> +	if (bo->queued) {
>> +		spin_unlock_irqrestore(&dbc->xfer_lock, flags);
>> +		ret = -EBUSY;
>> +		goto unlock_ch_srcu;
>> +	}
>> +	spin_unlock_irqrestore(&dbc->xfer_lock, flags);
> 
> This looks like race condition. If some other thread will take the xfer_lock
> and set bo->queued (HERE just after _unlock())  we will not return -EBUSY.
> Something seems to be missing here or xfer_lock is not needed to protect
> bo->queued.

The other thread would also need to take the bo->lock, which is held 
here and not released until after detach_slice_bo().  xfer_lock actually 
protects xfer_list, but bo->queued is a quick check to see if the bo is 
in the list, rather than iterating the list.  I can see how this is 
misleading.  I will ponder how to improve it.

-Jeff
