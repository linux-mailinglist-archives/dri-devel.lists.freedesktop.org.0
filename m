Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0557C667DC0
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 19:18:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 411C810E324;
	Thu, 12 Jan 2023 18:18:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2639B10E324
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jan 2023 18:18:32 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30CGtLD5027633; Thu, 12 Jan 2023 18:18:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=7rdIjZZKM3L7dXtniYmdiNpzi4/6uoUlz6kdnVktw+o=;
 b=n2QgSk6POsa/iP64Q0QmqfbHEZ5+8lO0OUH3eAkc8E7Nez+qgKBWIO2zHQVsf6dtK9Qt
 /1arvhfdsOhsryBfaTWqGBYSNNjGCZOOQWoN+k7owqrjAqGTAgGzsWClIEVvETxo3G4u
 aB5QvshK07HD1P/UKH4E9dOTlD14MjcFDbzW8sDWmgqIzAp+8zupHCkpfU0F4nEAxRVc
 Li2Tiql1AJA8/PMlf11R5udQtnpJAuAOHeeHLuZlg4UKmXR5mhPHyOdmStcL1HJyQdPk
 oo2gmOx2x7mu0by9xms4f7A3zs448GljeTFKpxmmeYIkxDHK4mOW35A6gPPP9eSH8Tm4 Hg== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3n1kh5vkfa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Jan 2023 18:18:28 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30CIIQC3009027
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Jan 2023 18:18:26 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 12 Jan
 2023 10:18:25 -0800
Message-ID: <6811c853-aaa7-3bf1-c098-d6ca0e875e75@quicinc.com>
Date: Thu, 12 Jan 2023 11:18:24 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v5 4/7] accel/ivpu: Add IPC driver and JSM messages
Content-Language: en-US
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>, <oded.gabbay@gmail.com>,
 <airlied@gmail.com>, <daniel@ffwll.ch>, <tzimmermann@suse.de>
References: <20230109122344.253994-1-jacek.lawrynowicz@linux.intel.com>
 <20230109122344.253994-5-jacek.lawrynowicz@linux.intel.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20230109122344.253994-5-jacek.lawrynowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: X0X427D0Fw45xRt4CQX9cG56TphfVNzK
X-Proofpoint-ORIG-GUID: X0X427D0Fw45xRt4CQX9cG56TphfVNzK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-12_08,2023-01-12_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 priorityscore=1501 adultscore=0 mlxscore=0 suspectscore=0 phishscore=0
 mlxlogscore=513 impostorscore=0 spamscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301120132
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
Cc: andrzej.kacprowski@linux.intel.com,
 Krystian Pradzynski <krystian.pradzynski@linux.intel.com>,
 stanislaw.gruszka@linux.intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/9/2023 5:23 AM, Jacek Lawrynowicz wrote:
> The IPC driver is used to send and receive messages to/from firmware
> running on the VPU.
> 
> The only supported IPC message format is Job Submission Model (JSM)
> defined in vpu_jsm_api.h header.
> 
> Co-developed-by: Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>
> Signed-off-by: Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>
> Co-developed-by: Krystian Pradzynski <krystian.pradzynski@linux.intel.com>
> Signed-off-by: Krystian Pradzynski <krystian.pradzynski@linux.intel.com>
> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>

Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>

> +int ivpu_ipc_irq_handler(struct ivpu_device *vdev)
> +{
> +	struct ivpu_ipc_info *ipc = vdev->ipc;
> +	struct ivpu_ipc_consumer *cons;
> +	struct ivpu_ipc_hdr *ipc_hdr;
> +	struct vpu_jsm_msg *jsm_msg;
> +	unsigned long flags;
> +	bool dispatched;
> +	u32 vpu_addr;
> +
> +	/* Driver needs to purge all messages from IPC FIFO to clear IPC interrupt.
> +	 * Without purge IPC FIFO to 0 next IPC interrupts won't be generated.
> +	 */
> +	while (ivpu_hw_reg_ipc_rx_count_get(vdev)) {

Ick.  Please no in the long term?

This is an infinite loop.  In hard IRQ context.  Controlled by the 
device, which you probably shouldn't trust.

However the real fix for this is to move to threaded_irqs.  Which is 
going to be a huge refactor for you.  Rate limiting doesn't appear viable.

If I understand things correctly, the chances that the device will 
generate a large count, or update the count as fast or faster than the 
driver are low, but it should still be fixed.

How about a high priority todo to convert to threaded irqs?  At the same 
time you can update the return value for this function which seems to 
not be checked anywhere, and also the comment here which is not proper 
multi-line style.

