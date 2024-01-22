Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5206D8376B1
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 23:57:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85DF610E61B;
	Mon, 22 Jan 2024 22:57:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E045310E61B
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jan 2024 22:57:14 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40MIbU4Y025976; Mon, 22 Jan 2024 22:57:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=EC5KLFYJCt3kaSMZL4b7d25l8B3+5ncGG6vhirauSTM=; b=ca
 0ojc6PXXHbLjLuQBvl6g565ectbXkSoAvkzZWv4OGnAwBpBnrET0PT1sUPGU8kpd
 CGad6p4BcZAWI5G81CFQDK8IZyIVOc4JW6n4CcXrti6iWPNlSofNMNks/Pc7ZfFn
 dVfTbXk0dXKFDdXUSk2RdFcrmgDc/6VTHdPywd66KbtJndhCoclXps4X1KOMUVjF
 Iku6sH4+XVuxxxxFsAwZFPc4c2a452eRAWox4yos1DiHnDDcqtaJF1b8b1Sh5mZc
 JPQOH6MQw4tEWOt5P/4IwF2Ket5q7L4u+30IGoO70BWhkhKHDFhvS2GruItjRmNm
 M6hW78zqCK33zJPGg/xw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vssjws7f0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Jan 2024 22:57:13 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40MMvC5Z026776
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Jan 2024 22:57:12 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 22 Jan
 2024 14:57:11 -0800
Message-ID: <76b6f813-3548-df82-ea26-f406d984c496@quicinc.com>
Date: Mon, 22 Jan 2024 15:57:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: QAIC reset failure
Content-Language: en-US
To: Baruch Siach <baruch@tkos.co.il>, Carl Vanderlip <quic_carlv@quicinc.com>, 
 Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
References: <87ttndw6m6.fsf@tarshish>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <87ttndw6m6.fsf@tarshish>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 7Otf0U82F3W9wne9JEPbkRn1bHVyDJh4
X-Proofpoint-ORIG-GUID: 7Otf0U82F3W9wne9JEPbkRn1bHVyDJh4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-22_12,2024-01-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 mlxlogscore=999
 mlxscore=0 suspectscore=0 clxscore=1011 phishscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401220163
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
Cc: linux-arm-msm@vger.kernel.org, Orr Mazor <orrm@neureality.ai>, Ramon
 Fried <ramon@neureality.ai>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/16/2024 9:58 AM, Baruch Siach wrote:
> Hi qaic driver maintainers,

Sorry I was holiday last week and I am just now catching up on email and 
seeing this.

> I am testing an A100 device on arm64 platform. Kernel version is current
> Linus master as of commit 052d534373b7. The driver is unable to reset
> the device properly.
> 
> [  137.706765] pci 0000:01:00.0: enabling device (0000 -> 0002)
> [  137.712528] pci 0000:02:00.0: enabling device (0000 -> 0002)
> [  137.718230] qaic 0000:03:00.0: enabling device (0000 -> 0002)
> [  137.725720] [drm] Initialized qaic 0.0.0 20190618 for 0000:03:00.0 on minor 0
> [  137.734326] mhi mhi0: Requested to power ON
> [  137.738520] mhi mhi0: Power on setup success
> [  137.855108] mhi mhi0: Wait for device to enter SBL or Mission mode

This all looks good

> [  137.861578] qaic_timesync mhi0_QAIC_TIMESYNC: 20: Failed to receive START channel command completion
> [  137.870733] qaic_timesync mhi0_QAIC_TIMESYNC: 21: Failed to reset channel, still resetting
> [  137.879063] qaic_timesync mhi0_QAIC_TIMESYNC: 20: Failed to reset channel, still resetting
> [  137.887334] qaic_timesync: probe of mhi0_QAIC_TIMESYNC failed with error -5
> [  137.894866] qaic_timesync mhi0_QAIC_TIMESYNC: 20: Failed to receive START channel command completion
> [  137.904006] qaic_timesync mhi0_QAIC_TIMESYNC: 21: Failed to reset channel, still resetting
> [  137.912263] qaic_timesync mhi0_QAIC_TIMESYNC: 20: Failed to reset channel, still resetting
> [  137.920517] qaic_timesync: probe of mhi0_QAIC_TIMESYNC failed with error -5
> [  140.807091] mhi mhi0: Device failed to enter MHI Ready
> [  143.695094] mhi mhi0: Device failed to enter MHI Ready

This looks like the device stopped responding to the host, early in 
boot.  Trying to access channels while the device is not in MHI Ready 
state is odd.

> This is with firmware from SDK version 1.12.2.0. I tried also version
> 1.10.0.193 with similar results.
> 
> Some more state information from MHI debugfs below.
> 
> /sys/kernel/debug/mhi/mhi0/regdump:
> Host PM state: SYS ERROR Process Device state: RESET EE: DISABLE
> Device EE: PRIMARY BOOTLOADER state: SYS ERROR
> MHI_REGLEN: 0x100
> MHI_VER: 0x1000000
> MHI_CFG: 0x8000000
> MHI_CTRL: 0x0
> MHI_STATUS: 0xff04
> MHI_WAKE_DB: 0x1
> BHI_EXECENV: 0x0
> BHI_STATUS: 0xa93f0935
> BHI_ERRCODE: 0x0
> BHI_ERRDBG1: 0xc0300000
> BHI_ERRDBG2: 0xb
> BHI_ERRDBG3: 0xcabb0

This suggests that the device crashed, which is unexpected.

> /sys/kernel/debug/mhi/mhi0/states:
> PM state: SYS ERROR Process Device: Inactive MHI state: RESET EE: DISABLE wake: true
> M0: 2 M2: 0 M3: 0 device wake: 0 pending packets: 0
> 
> Any idea?

We may need our firmware engineers involved.  I think there is already a 
thread with some of the POCs involved.

-Jeff
